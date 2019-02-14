
/**
 * Enables blur on elementary's window compositor
 */
public class BlurHelper : Object {
    IGala? gala;
    uint32 window_id;

    public BlurHelper (Gtk.Window window) {
        try {
            gala = Bus.get_proxy_sync (BusType.SESSION, "org.pantheon.gala", "/org/pantheon/gala");
        } catch (Error e) {
            critical (e.message);
        }

        Idle.add (() => {
            window_id = (uint32) ((Gdk.X11.Window) window.get_window ()).get_xid ();
            return false;
        });
    }

    public void enable () {
        Timeout.add (1000, () => {
            try {
                gala.enable_blur_behind (window_id, 0, 0, 0, 0, 255);
            } catch (Error e) {
                critical (e.message);
            }
            return false;
        });
    }

    public void disable () {
        try {
            gala.disable_blur_behind (window_id);
        } catch (Error e) {
            critical (e.message);
        }
    }
}



