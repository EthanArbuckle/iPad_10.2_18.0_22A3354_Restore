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
  unint64_t v5;
  unint64_t v6;
  _TtCV11MusicCoreUI7Artwork4View *v7;
  __n128 v8;
  __n128 v9;
  _TtCV11MusicCoreUI7Artwork4View *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  char v16[24];
  CGSize result;

  v3 = (char *)self + OBJC_IVAR____TtCV11MusicCoreUI7Artwork4View_typedConfiguration;
  swift_beginAccess((char *)self + OBJC_IVAR____TtCV11MusicCoreUI7Artwork4View_typedConfiguration, v16, 0, 0);
  v4 = &v3[*(int *)(type metadata accessor for Artwork(0) + 32)];
  if (v4[8] == 2 && v4[24] == 2)
  {
    v5 = *((_QWORD *)v4 + 2);
    v6 = *(_QWORD *)v4;
    v7 = self;
    v8.n128_u64[0] = v6;
    v9.n128_u64[0] = v5;
  }
  else
  {
    v10 = self;
    v8.n128_u64[0] = 0;
    v9.n128_u64[0] = 0;
  }
  v11 = Artwork.View.fittingImageSize(in:)(v8, v9);
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
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
  __n128 v10;
  __n128 v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  _TtCV11MusicCoreUI7Artwork4View *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  char v23[24];
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = (char *)self + OBJC_IVAR____TtCV11MusicCoreUI7Artwork4View_typedConfiguration;
  swift_beginAccess((char *)self + OBJC_IVAR____TtCV11MusicCoreUI7Artwork4View_typedConfiguration, v23, 0, 0);
  v7 = &v6[*(int *)(type metadata accessor for Artwork(0) + 32)];
  v8 = v7[8];
  if (v8 == 255)
  {
    v9 = self;
    v10.n128_f64[0] = width;
    v11.n128_f64[0] = height;
    v12 = Artwork.View.fittingImageSize(in:)(v10, v11);
    v14 = v13;

  }
  else
  {
    v15 = *((_QWORD *)v7 + 2);
    v16 = *(_QWORD *)v7;
    v17 = v7[24];
    v18 = self;
    sub_100239F20(width, height, v16, v8);
    v12 = v19;
    sub_100239F20(width, height, v15, v17);
    v14 = v20;

  }
  v21 = v12;
  v22 = v14;
  result.height = v22;
  result.width = v21;
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
  sub_100006798((uint64_t)self + OBJC_IVAR____TtCV11MusicCoreUI7Artwork4View_typedConfiguration, type metadata accessor for Artwork);
  sub_10003A5C8(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCV11MusicCoreUI7Artwork4View_imageDidChangeHandler), *(_QWORD *)&self->imageDidChangeHandler[OBJC_IVAR____TtCV11MusicCoreUI7Artwork4View_imageDidChangeHandler]);

}

@end
