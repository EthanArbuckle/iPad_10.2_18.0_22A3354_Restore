@implementation PUPhotoStyleVariationScrubberCell

- (_TtC15PhotosUIPrivate33PUPhotoStyleVariationScrubberCell)initWithFrame:(CGRect)a3
{
  return (_TtC15PhotosUIPrivate33PUPhotoStyleVariationScrubberCell *)sub_1AAC253B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  _TtC15PhotosUIPrivate33PUPhotoStyleVariationScrubberCell *v2;

  v2 = self;
  sub_1AAC25500();

}

- (void)wheelScrubberView:(id)a3 updateCell:(id)a4 forItemAtIndex:(int64_t)a5
{
  id v8;
  id v9;
  _TtC15PhotosUIPrivate33PUPhotoStyleVariationScrubberCell *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_1AAC255A8((uint64_t)v10, a4, a5);

}

- (void)wheelScrubberViewDidChangeSelectedIndex:(id)a3
{
  id v5;
  _TtC15PhotosUIPrivate33PUPhotoStyleVariationScrubberCell *v6;

  v5 = a3;
  v6 = self;
  sub_1AAC257A8(a3);

}

- (void)layoutSubviews
{
  _TtC15PhotosUIPrivate33PUPhotoStyleVariationScrubberCell *v2;

  v2 = self;
  sub_1AAC25894();

}

- (_TtC15PhotosUIPrivate33PUPhotoStyleVariationScrubberCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAC25C60();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate33PUPhotoStyleVariationScrubberCell_scrubberView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate33PUPhotoStyleVariationScrubberCell_image));
  swift_bridgeObjectRelease();
  sub_1AAB8CAB0((uint64_t)self + OBJC_IVAR____TtC15PhotosUIPrivate33PUPhotoStyleVariationScrubberCell_delegate);
}

@end
