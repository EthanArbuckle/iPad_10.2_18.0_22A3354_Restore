@implementation TabItemCollectionViewCell

- (_TtC8VideosUI25TabItemCollectionViewCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI25TabItemCollectionViewCell *result;

  sub_1DA0106C8();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI25TabItemCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DA01085C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8VideosUI25TabItemCollectionViewCell *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1DA01091C(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtC8VideosUI25TabItemCollectionViewCell *v2;

  v2 = self;
  sub_1DA010F54();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)prepareForReuse
{
  _TtC8VideosUI25TabItemCollectionViewCell *v2;

  v2 = self;
  sub_1DA010FCC();
  OUTLINED_FUNCTION_5_8(v2);
}

- (NSString)largeContentTitle
{
  _TtC8VideosUI25TabItemCollectionViewCell *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1DA0110BC();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1DA143E50();
    OUTLINED_FUNCTION_79();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setLargeContentTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8VideosUI25TabItemCollectionViewCell *v7;

  if (a3)
  {
    v4 = sub_1DA143E80();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1DA011164(v4, v6);

}

- (UIImage)largeContentImage
{
  _TtC8VideosUI25TabItemCollectionViewCell *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1DA0111F0();
  v4 = v3;

  return (UIImage *)v4;
}

- (void)setLargeContentImage:(id)a3
{
  id v5;
  _TtC8VideosUI25TabItemCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_1DA011284(a3);
  OUTLINED_FUNCTION_5_8(v6);
}

- (BOOL)scalesLargeContentImage
{
  return 1;
}

- (void)setScalesLargeContentImage:(BOOL)a3
{
  _TtC8VideosUI25TabItemCollectionViewCell *v4;

  v4 = self;
  sub_1DA0112F8(a3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25TabItemCollectionViewCell_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25TabItemCollectionViewCell_imageView));
}

@end
