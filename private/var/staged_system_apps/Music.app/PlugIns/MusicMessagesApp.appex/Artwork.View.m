@implementation Artwork.View

- (_TtCV11MusicCoreUI7Artwork4View)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s11MusicCoreUI7ArtworkV4ViewC5coderAESgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  _TtCV11MusicCoreUI7Artwork4View *v2;

  v2 = self;
  Artwork.View.layoutSubviews()();

}

- (CGSize)intrinsicContentSize
{
  char *v3;
  char *v4;
  double v5;
  double v6;
  _TtCV11MusicCoreUI7Artwork4View *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  char v15[24];
  CGSize result;

  v3 = (char *)self + OBJC_IVAR____TtCV11MusicCoreUI7Artwork4View_typedConfiguration;
  swift_beginAccess((char *)self + OBJC_IVAR____TtCV11MusicCoreUI7Artwork4View_typedConfiguration, v15, 0, 0);
  v4 = &v3[*(int *)(type metadata accessor for Artwork(0) + 32)];
  if (v4[8] == 2 && v4[24] == 2)
  {
    v5 = *((double *)v4 + 2);
    v6 = *(double *)v4;
    v7 = self;
    v8 = v6;
    v9 = v5;
  }
  else
  {
    v7 = self;
    v8 = 0.0;
    v9 = 0.0;
  }
  v10 = Artwork.View.fittingImageSize(in:)((uint64_t)v7, v8, v9);
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  char *v6;
  char *v7;
  uint64_t v8;
  _TtCV11MusicCoreUI7Artwork4View *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  _TtCV11MusicCoreUI7Artwork4View *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  char v21[24];
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = (char *)self + OBJC_IVAR____TtCV11MusicCoreUI7Artwork4View_typedConfiguration;
  swift_beginAccess((char *)self + OBJC_IVAR____TtCV11MusicCoreUI7Artwork4View_typedConfiguration, v21, 0, 0);
  v7 = &v6[*(int *)(type metadata accessor for Artwork(0) + 32)];
  v8 = v7[8];
  if (v8 == 255)
  {
    v9 = self;
    v10 = Artwork.View.fittingImageSize(in:)((uint64_t)v9, width, height);
    v12 = v11;

  }
  else
  {
    v13 = *((_QWORD *)v7 + 2);
    v14 = *(_QWORD *)v7;
    v15 = v7[24];
    v16 = self;
    sub_100259200(width, height, v14, v8);
    v10 = v17;
    sub_100259200(width, height, v13, v15);
    v12 = v18;

  }
  v19 = v10;
  v20 = v12;
  result.height = v20;
  result.width = v19;
  return result;
}

- (_TtCV11MusicCoreUI7Artwork4View)initWithFrame:(CGRect)a3
{
  _TtCV11MusicCoreUI7Artwork4View *result;

  result = (_TtCV11MusicCoreUI7Artwork4View *)_swift_stdlib_reportUnimplementedInitializer("MusicCoreUI.View", 16, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100034960((uint64_t)self + OBJC_IVAR____TtCV11MusicCoreUI7Artwork4View_typedConfiguration, type metadata accessor for Artwork);
  sub_10000DCF8(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCV11MusicCoreUI7Artwork4View_imageDidChangeHandler), *(_QWORD *)&self->imageDidChangeHandler[OBJC_IVAR____TtCV11MusicCoreUI7Artwork4View_imageDidChangeHandler]);

}

@end
