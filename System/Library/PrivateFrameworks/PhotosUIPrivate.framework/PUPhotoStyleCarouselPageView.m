@implementation PUPhotoStyleCarouselPageView

- (void)layoutSubviews
{
  _TtC15PhotosUIPrivate28PUPhotoStyleCarouselPageView *v2;

  v2 = self;
  sub_1AAC785D4();

}

- (_TtC15PhotosUIPrivate28PUPhotoStyleCarouselPageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAC786D4();
}

- (_TtC15PhotosUIPrivate28PUPhotoStyleCarouselPageView)initWithFrame:(CGRect)a3
{
  sub_1AAC7879C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate28PUPhotoStyleCarouselPageView_label));
  swift_unknownObjectRelease();
  sub_1AAB8CAB0((uint64_t)self + OBJC_IVAR____TtC15PhotosUIPrivate28PUPhotoStyleCarouselPageView_renderProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate28PUPhotoStyleCarouselPageView_subscribedStyleCollection));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate28PUPhotoStyleCarouselPageView_subscribedStyleElement));
}

@end
