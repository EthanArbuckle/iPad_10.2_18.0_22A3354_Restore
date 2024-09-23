@implementation PUPhotoStyleGridCell

- (_TtC15PhotosUIPrivate20PUPhotoStyleGridCell)initWithFrame:(CGRect)a3
{
  return (_TtC15PhotosUIPrivate20PUPhotoStyleGridCell *)sub_1AAC20848(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC15PhotosUIPrivate20PUPhotoStyleGridCell *v2;

  v2 = self;
  sub_1AAC20CF4();

}

- (_TtC15PhotosUIPrivate20PUPhotoStyleGridCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAC20F2C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate20PUPhotoStyleGridCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate20PUPhotoStyleGridCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate20PUPhotoStyleGridCell_labelBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate20PUPhotoStyleGridCell_subscribedStyleElement));
}

@end
