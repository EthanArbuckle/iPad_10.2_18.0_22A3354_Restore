@implementation CanonicalFooterViewCell

- (_TtC8VideosUI23CanonicalFooterViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI23CanonicalFooterViewCell *)sub_1D9F84134();
}

- (_TtC8VideosUI23CanonicalFooterViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9F84464();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  _BOOL8 v4;
  double width;
  _TtC8VideosUI23CanonicalFooterViewCell *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v4 = a4;
  width = a3.width;
  v6 = self;
  sub_1D9F8455C(v4, width);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)vui_prepareForReuse
{
  _TtC8VideosUI23CanonicalFooterViewCell *v2;

  v2 = self;
  sub_1D9F84F08();

}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalFooterViewCell_airingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalFooterViewCell_separatorView));
}

@end
