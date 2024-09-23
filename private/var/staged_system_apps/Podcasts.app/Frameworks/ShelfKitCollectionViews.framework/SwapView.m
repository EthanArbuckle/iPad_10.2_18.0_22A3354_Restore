@implementation SwapView

- (_TtC23ShelfKitCollectionViewsP33_73EE084195E4C536378CD521A3E22D868SwapView)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_73EE084195E4C536378CD521A3E22D868SwapView_view) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[SwapView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViewsP33_73EE084195E4C536378CD521A3E22D868SwapView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_73EE084195E4C536378CD521A3E22D868SwapView_view) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[SwapView initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_73EE084195E4C536378CD521A3E22D868SwapView_view));
}

@end
