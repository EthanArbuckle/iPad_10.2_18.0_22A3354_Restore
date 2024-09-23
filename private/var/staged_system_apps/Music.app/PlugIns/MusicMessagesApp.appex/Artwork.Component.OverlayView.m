@implementation Artwork.Component.OverlayView

- (UIColor)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_s9ComponentC11OverlayViewCMa();
  return -[Artwork.Component.OverlayView backgroundColor](&v3, "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  void *v4;
  id v5;
  _TtCCE16MusicMessagesAppV11MusicCoreUI7Artwork9ComponentP33_F6B6DCEFF56A9DC1390A9746FE4F657811OverlayView *v6;
  id v7;
  objc_super v8;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCCE16MusicMessagesAppV11MusicCoreUI7Artwork9ComponentP33_F6B6DCEFF56A9DC1390A9746FE4F657811OverlayView_enforcedBackgroundColor);
  if (v4)
    v5 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtCCE16MusicMessagesAppV11MusicCoreUI7Artwork9ComponentP33_F6B6DCEFF56A9DC1390A9746FE4F657811OverlayView_enforcedBackgroundColor);
  else
    v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_s9ComponentC11OverlayViewCMa();
  v6 = self;
  v7 = v4;
  -[Artwork.Component.OverlayView setBackgroundColor:](&v8, "setBackgroundColor:", v5);

}

- (_TtCCE16MusicMessagesAppV11MusicCoreUI7Artwork9ComponentP33_F6B6DCEFF56A9DC1390A9746FE4F657811OverlayView)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCCE16MusicMessagesAppV11MusicCoreUI7Artwork9ComponentP33_F6B6DCEFF56A9DC1390A9746FE4F657811OverlayView_enforcedBackgroundColor) = 0;
  v8.receiver = self;
  v8.super_class = (Class)_s9ComponentC11OverlayViewCMa();
  return -[Artwork.Component.OverlayView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCCE16MusicMessagesAppV11MusicCoreUI7Artwork9ComponentP33_F6B6DCEFF56A9DC1390A9746FE4F657811OverlayView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCCE16MusicMessagesAppV11MusicCoreUI7Artwork9ComponentP33_F6B6DCEFF56A9DC1390A9746FE4F657811OverlayView_enforcedBackgroundColor) = 0;
  v5.receiver = self;
  v5.super_class = (Class)_s9ComponentC11OverlayViewCMa();
  return -[Artwork.Component.OverlayView initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCE16MusicMessagesAppV11MusicCoreUI7Artwork9ComponentP33_F6B6DCEFF56A9DC1390A9746FE4F657811OverlayView_enforcedBackgroundColor));
}

@end
