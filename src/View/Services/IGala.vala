[DBus (name = "org.pantheon.gala")]
public interface IGala : Object {
    public abstract void disable_blur_behind (uint32 xid) throws Error;
    public abstract void enable_blur_behind (uint32 xid, int x, int y, int width, int height, uint8 opacity) throws Error;
}
