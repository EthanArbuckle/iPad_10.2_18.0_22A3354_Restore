@implementation ShelfGradientBackgroundDecorationItem

- (_TtC9SeymourUI37ShelfGradientBackgroundDecorationItem)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  uint64_t v9;
  id v10;
  _TtC9SeymourUI37ShelfGradientBackgroundDecorationItem *v11;
  _TtC9SeymourUI37ShelfGradientBackgroundDecorationItem *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC9SeymourUI37ShelfGradientBackgroundDecorationItem_layout;
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  *((_QWORD *)v8 + 2) = 0;
  v8[24] = 1;
  v9 = OBJC_IVAR____TtC9SeymourUI37ShelfGradientBackgroundDecorationItem_gradientLayer;
  v10 = objc_allocWithZone(MEMORY[0x24BDE56B8]);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_init);

  v14.receiver = v11;
  v14.super_class = (Class)type metadata accessor for ShelfGradientBackgroundDecorationItem();
  v12 = -[ShelfGradientBackgroundDecorationItem initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  sub_22B1E75F0();

  return v12;
}

- (_TtC9SeymourUI37ShelfGradientBackgroundDecorationItem)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  id v8;
  _TtC9SeymourUI37ShelfGradientBackgroundDecorationItem *result;

  v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI37ShelfGradientBackgroundDecorationItem_layout;
  *(_QWORD *)v5 = 0;
  v5[8] = 1;
  *((_QWORD *)v5 + 2) = 0;
  v5[24] = 1;
  v6 = OBJC_IVAR____TtC9SeymourUI37ShelfGradientBackgroundDecorationItem_gradientLayer;
  v7 = objc_allocWithZone(MEMORY[0x24BDE56B8]);
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);

  result = (_TtC9SeymourUI37ShelfGradientBackgroundDecorationItem *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC9SeymourUI37ShelfGradientBackgroundDecorationItem *v2;

  v2 = self;
  sub_22B1E74E0();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37ShelfGradientBackgroundDecorationItem_gradientLayer));
}

@end
