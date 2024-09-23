@implementation SubscriptionLinkCell

- (_TtC23ShelfKitCollectionViews20SubscriptionLinkCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews20SubscriptionLinkCell_objectGraph) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[SubscriptionLinkCell initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews20SubscriptionLinkCell)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews20SubscriptionLinkCell_objectGraph) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[SubscriptionLinkCell initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews20SubscriptionLinkCell_objectGraph));
}

@end
