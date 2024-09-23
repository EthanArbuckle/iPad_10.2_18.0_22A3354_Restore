@implementation SportsFavoritesLockupCell

- (_TtC8VideosUI25SportsFavoritesLockupCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI25SportsFavoritesLockupCell *)sub_1DA040D14();
}

- (_TtC8VideosUI25SportsFavoritesLockupCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DA040E1C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC8VideosUI25SportsFavoritesLockupCell *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_1DA040EF0(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  _TtC8VideosUI25SportsFavoritesLockupCell *v2;

  v2 = self;
  sub_1DA041100();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)prepareForReuse
{
  _TtC8VideosUI25SportsFavoritesLockupCell *v2;

  v2 = self;
  sub_1DA041868();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC8VideosUI25SportsFavoritesLockupCell *v4;

  v4 = self;
  sub_1DA041918(a3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _TtC8VideosUI25SportsFavoritesLockupCell *v5;

  v5 = self;
  sub_1DA041AD8(a3);
  OUTLINED_FUNCTION_5_8(v5);
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25SportsFavoritesLockupCell_titleLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25SportsFavoritesLockupCell_logoImageView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25SportsFavoritesLockupCell_accessoryImageView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25SportsFavoritesLockupCell_topSeparatorView);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25SportsFavoritesLockupCell_bottomSeparatorView));
}

@end
