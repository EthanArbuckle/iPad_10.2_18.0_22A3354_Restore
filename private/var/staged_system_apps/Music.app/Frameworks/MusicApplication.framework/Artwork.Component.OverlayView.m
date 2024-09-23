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
  _TtCCE16MusicApplicationV11MusicCoreUI7Artwork9ComponentP33_D3E2C4694A53E203D54C2C75409DDB7B11OverlayView *v6;
  id v7;
  objc_super v8;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCCE16MusicApplicationV11MusicCoreUI7Artwork9ComponentP33_D3E2C4694A53E203D54C2C75409DDB7B11OverlayView_enforcedBackgroundColor);
  if (v4)
    v5 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtCCE16MusicApplicationV11MusicCoreUI7Artwork9ComponentP33_D3E2C4694A53E203D54C2C75409DDB7B11OverlayView_enforcedBackgroundColor);
  else
    v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_s9ComponentC11OverlayViewCMa();
  v6 = self;
  v7 = v4;
  -[Artwork.Component.OverlayView setBackgroundColor:](&v8, "setBackgroundColor:", v5);

}

- (_TtCCE16MusicApplicationV11MusicCoreUI7Artwork9ComponentP33_D3E2C4694A53E203D54C2C75409DDB7B11OverlayView)initWithFrame:(CGRect)a3
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
           + OBJC_IVAR____TtCCE16MusicApplicationV11MusicCoreUI7Artwork9ComponentP33_D3E2C4694A53E203D54C2C75409DDB7B11OverlayView_enforcedBackgroundColor) = 0;
  v8.receiver = self;
  v8.super_class = (Class)_s9ComponentC11OverlayViewCMa();
  return -[Artwork.Component.OverlayView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCCE16MusicApplicationV11MusicCoreUI7Artwork9ComponentP33_D3E2C4694A53E203D54C2C75409DDB7B11OverlayView)initWithCoder:(id)a3
{
  id v4;
  _TtCCE16MusicApplicationV11MusicCoreUI7Artwork9ComponentP33_D3E2C4694A53E203D54C2C75409DDB7B11OverlayView *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCCE16MusicApplicationV11MusicCoreUI7Artwork9ComponentP33_D3E2C4694A53E203D54C2C75409DDB7B11OverlayView_enforcedBackgroundColor) = 0;
  v7.receiver = self;
  v7.super_class = (Class)_s9ComponentC11OverlayViewCMa();
  v4 = a3;
  v5 = -[Artwork.Component.OverlayView initWithCoder:](&v7, "initWithCoder:", v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCE16MusicApplicationV11MusicCoreUI7Artwork9ComponentP33_D3E2C4694A53E203D54C2C75409DDB7B11OverlayView_enforcedBackgroundColor));
}

@end
