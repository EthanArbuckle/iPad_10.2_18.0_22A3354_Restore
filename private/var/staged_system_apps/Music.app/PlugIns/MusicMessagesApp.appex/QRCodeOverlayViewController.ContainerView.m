@implementation QRCodeOverlayViewController.ContainerView

- (_TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView)initWithFrame:(CGRect)a3
{
  return (_TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView *)sub_100360EC4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100361F60();
}

- (void)layoutSubviews
{
  id v2;
  uint64_t v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for QRCodeOverlayViewController.ContainerView();
  v2 = v5.receiver;
  -[QRCodeOverlayViewController.ContainerView layoutSubviews](&v5, "layoutSubviews");
  sub_10000598C(0, &qword_1004CCD98, CATransaction_ptr);
  v3 = swift_allocObject(&unk_10048ED40, 24, 7);
  *(_QWORD *)(v3 + 16) = v2;
  v4 = v2;
  static CATransaction.performWithoutAnimation(_:)((void (*)(id))sub_10036209C);

  swift_release(v3);
}

- (void)updateColor
{
  _TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView *v2;

  v2 = self;
  sub_100361460();

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
