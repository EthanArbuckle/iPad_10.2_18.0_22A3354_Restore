@implementation ShelfSolidBackgroundDecorationItem

- (_TtC9SeymourUI34ShelfSolidBackgroundDecorationItem)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC9SeymourUI34ShelfSolidBackgroundDecorationItem *v7;
  uint64_t v8;
  _TtC9SeymourUI34ShelfSolidBackgroundDecorationItem *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ShelfSolidBackgroundDecorationItem();
  v7 = -[ShelfSolidBackgroundDecorationItem initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  v8 = qword_255B827C8;
  v9 = v7;
  if (v8 != -1)
    swift_once();
  -[ShelfSolidBackgroundDecorationItem setBackgroundColor:](v9, sel_setBackgroundColor_, qword_255BE74B8);

  return v9;
}

- (_TtC9SeymourUI34ShelfSolidBackgroundDecorationItem)initWithCoder:(id)a3
{
  _TtC9SeymourUI34ShelfSolidBackgroundDecorationItem *result;

  result = (_TtC9SeymourUI34ShelfSolidBackgroundDecorationItem *)sub_22BA815D0();
  __break(1u);
  return result;
}

@end
