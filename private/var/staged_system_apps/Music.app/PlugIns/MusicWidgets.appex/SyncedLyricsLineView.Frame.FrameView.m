@implementation SyncedLyricsLineView.Frame.FrameView

- (_TtCCC11MusicCoreUI20SyncedLyricsLineView5Frame9FrameView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[SyncedLyricsLineView.Frame.FrameView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCCC11MusicCoreUI20SyncedLyricsLineView5Frame9FrameView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[SyncedLyricsLineView.Frame.FrameView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
