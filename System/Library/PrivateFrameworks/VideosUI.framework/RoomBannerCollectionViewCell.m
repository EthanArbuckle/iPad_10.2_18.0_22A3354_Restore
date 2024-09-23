@implementation RoomBannerCollectionViewCell

- (_TtC8VideosUI28RoomBannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI28RoomBannerCollectionViewCell *)sub_1D9FF5F30();
}

- (_TtC8VideosUI28RoomBannerCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9FF6000();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width;
  _TtC8VideosUI28RoomBannerCollectionViewCell *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  v6 = self;
  v7 = sub_1D9FF60BC(a4, width);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI28RoomBannerCollectionViewCell_bannerImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI28RoomBannerCollectionViewCell_descriptionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI28RoomBannerCollectionViewCell_separatorView));
}

@end
