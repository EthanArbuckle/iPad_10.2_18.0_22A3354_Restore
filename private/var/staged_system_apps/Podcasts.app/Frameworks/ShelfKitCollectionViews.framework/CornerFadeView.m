@implementation CornerFadeView

- (void)drawRect:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews14CornerFadeView *v3;

  v3 = self;
  sub_A9098();

}

- (_TtC23ShelfKitCollectionViews14CornerFadeView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v7;
  _TtC23ShelfKitCollectionViews14CornerFadeView *v8;
  void *v9;
  _TtC23ShelfKitCollectionViews14CornerFadeView *v10;
  id v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews14CornerFadeView_alignment) = 1;
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViews14CornerFadeView_safetyCutoutSize);
  *v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews14CornerFadeView_fadeLength) = 0;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for CornerFadeView();
  v8 = -[CornerFadeView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  v9 = (void *)objc_opt_self(UIColor);
  v10 = v8;
  v11 = objc_msgSend(v9, "clearColor");
  -[CornerFadeView setBackgroundColor:](v10, "setBackgroundColor:", v11);

  return v10;
}

- (_TtC23ShelfKitCollectionViews14CornerFadeView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC23ShelfKitCollectionViews14CornerFadeView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews14CornerFadeView_alignment) = 1;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViews14CornerFadeView_safetyCutoutSize);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews14CornerFadeView_fadeLength) = 0;
  v5 = a3;

  result = (_TtC23ShelfKitCollectionViews14CornerFadeView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/CornerFadeView.swift", 44, 2, 147, 0);
  __break(1u);
  return result;
}

@end
