@implementation CheckMarkView

- (CGSize)intrinsicContentSize
{
  _TtC9SiriSetup13CheckMarkView *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = self;
  v3 = sub_227750F7C();
  objc_msgSend(v3, sel_bounds);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC9SiriSetup13CheckMarkView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SiriSetup13CheckMarkView_colorLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SiriSetup13CheckMarkView_checkMaskLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SiriSetup13CheckMarkView_xMaskLayer) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CheckMarkView();
  return -[CheckMarkView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SiriSetup13CheckMarkView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SiriSetup13CheckMarkView_colorLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SiriSetup13CheckMarkView_checkMaskLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SiriSetup13CheckMarkView_xMaskLayer) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CheckMarkView();
  return -[CheckMarkView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{

}

@end
