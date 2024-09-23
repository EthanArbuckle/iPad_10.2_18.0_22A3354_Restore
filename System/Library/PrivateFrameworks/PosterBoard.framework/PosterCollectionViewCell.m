@implementation PosterCollectionViewCell

- (BOOL)layoutModeUsesFullscreenSizedMetrics
{
  _TtC11PosterBoard24PosterCollectionViewCell *v2;
  char v3;

  v2 = self;
  v3 = sub_1CBB293FC();

  return v3 & 1;
}

- (BOOL)_descendantsShouldHighlight
{
  return 0;
}

- (_TtC11PosterBoard24PosterCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  _TtC11PosterBoard24PosterCollectionViewCell *v8;
  void (*v9)(void);
  _TtC11PosterBoard24PosterCollectionViewCell *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard24PosterCollectionViewCell_posterCornerRadius) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC11PosterBoard24PosterCollectionViewCell_layoutMode;
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard24PosterCollectionViewCell_scaleInAlongsideLayoutMode) = (Class)0x3FF0000000000000;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for PosterCollectionViewCell();
  v8 = -[PosterCollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  v9 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v8->super.super.super.super.super.isa) + 0xC8);
  v10 = v8;
  v9();

  return v10;
}

- (_TtC11PosterBoard24PosterCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC11PosterBoard24PosterCollectionViewCell *)sub_1CBB296E0(a3);
}

@end
