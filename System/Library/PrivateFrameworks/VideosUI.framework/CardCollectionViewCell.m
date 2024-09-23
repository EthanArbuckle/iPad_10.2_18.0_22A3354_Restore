@implementation CardCollectionViewCell

- (_TtC8VideosUI22CardCollectionViewCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI22CardCollectionViewCell *result;

  sub_1D97DCA78();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  _TtC8VideosUI22CardCollectionViewCell *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v4 = self;
  v5 = sub_1D97DCE24();
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)vui_cellWillBeDisplayed
{
  _TtC8VideosUI22CardCollectionViewCell *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D97DDA7C();
  OUTLINED_FUNCTION_5_8(v3);
}

- (_TtC8VideosUI22CardCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9EDACDC();
}

- (void)dealloc
{
  _TtC8VideosUI22CardCollectionViewCell *v2;

  v2 = self;
  sub_1D9EDAD90();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22CardCollectionViewCell_cardView));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)vui_prepareForReuse
{
  _TtC8VideosUI22CardCollectionViewCell *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9EDAE1C();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_cellDidEndDisplaying
{
  _TtC8VideosUI22CardCollectionViewCell *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9EDAEA4();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_cellDidSelect
{
  _TtC8VideosUI22CardCollectionViewCell *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9EDAFCC();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)dragStateDidChange:(int64_t)a3
{
  _TtC8VideosUI22CardCollectionViewCell *v4;

  v4 = self;
  sub_1D9EDB080(a3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)imageViewHandler:(id)a3
{
  id v4;
  _TtC8VideosUI22CardCollectionViewCell *v5;
  id v6;

  v4 = a3;
  v5 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9EDC3D4();

}

- (id)zoomSourceView
{
  void *v2;
  _TtC8VideosUI22CardCollectionViewCell *v3;

  v3 = self;
  sub_1D9EDC930();
  OUTLINED_FUNCTION_214();
  return v2;
}

@end
