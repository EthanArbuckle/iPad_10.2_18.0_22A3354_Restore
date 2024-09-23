@implementation DynamicContextMenuButton

- (_TtC23ShelfKitCollectionViews24DynamicContextMenuButton)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews24DynamicContextMenuButton *)sub_241C34(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews24DynamicContextMenuButton_button), "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC23ShelfKitCollectionViews24DynamicContextMenuButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_24257C();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  _TtC23ShelfKitCollectionViews24DynamicContextMenuButton *v8;
  void *v9;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self;
  v9 = (void *)sub_24264C(x, y);

  return v9;
}

- (UIColor)tintColor
{
  return (UIColor *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews24DynamicContextMenuButton_button), "tintColor");
}

- (void)setTintColor:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews24DynamicContextMenuButton_button), "setTintColor:", a3);
}

- (UIButton)accessibilityButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC23ShelfKitCollectionViews24DynamicContextMenuButton_button));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews24DynamicContextMenuButton_button));
  sub_10DBC8((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews24DynamicContextMenuButton_configProvider);
  sub_1E14F0((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews24DynamicContextMenuButton_glyph);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews24DynamicContextMenuButton_objectGraph));
}

@end
