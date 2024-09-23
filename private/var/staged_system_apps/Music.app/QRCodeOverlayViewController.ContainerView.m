@implementation QRCodeOverlayViewController.ContainerView

- (_TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView)initWithFrame:(CGRect)a3
{
  return (_TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView *)sub_100CB3268(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100CB4308();
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for QRCodeOverlayViewController.ContainerView();
  v2 = v4.receiver;
  -[QRCodeOverlayViewController.ContainerView layoutSubviews](&v4, "layoutSubviews");
  sub_10004A07C(0, &qword_1011E5EC8, CATransaction_ptr);
  *(_QWORD *)(swift_allocObject(&unk_10110E0E8, 24, 7) + 16) = v2;
  v3 = v2;
  static CATransaction.performWithoutAnimation(_:)((void (*)(id))sub_100CB4444);

  swift_release();
}

- (void)updateColor
{
  _TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView *v2;

  v2 = self;
  sub_100CB3804();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView_image));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView_overlayColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView_overlayLayer));
}

@end
