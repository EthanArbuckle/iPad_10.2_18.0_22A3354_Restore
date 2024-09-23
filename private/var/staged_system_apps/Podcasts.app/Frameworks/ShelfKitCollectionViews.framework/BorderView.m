@implementation BorderView

- (_TtC23ShelfKitCollectionViews10BorderView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _TtC23ShelfKitCollectionViews10BorderView *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews10BorderView_roundedCorners) = (Class)-1;
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[BorderView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  -[BorderView setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", 0);
  return v9;
}

- (_TtC23ShelfKitCollectionViews10BorderView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews10BorderView_roundedCorners) = (Class)-1;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[BorderView initWithCoder:](&v7, "initWithCoder:", a3);
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  _TtC23ShelfKitCollectionViews10BorderView *v6;

  v5 = a3;
  v6 = self;
  sub_2181F8(a3);

}

- (BOOL)clipsToBounds
{
  return 0;
}

- (void)setClipsToBounds:(BOOL)a3
{
  _TtC23ShelfKitCollectionViews10BorderView *v3;

  v3 = self;
  sub_218300();

}

@end
