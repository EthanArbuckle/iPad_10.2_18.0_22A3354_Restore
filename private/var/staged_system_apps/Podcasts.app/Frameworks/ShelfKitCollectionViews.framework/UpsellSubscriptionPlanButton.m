@implementation UpsellSubscriptionPlanButton

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[UpsellSubscriptionPlanButton isSelected](&v3, "isSelected");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  _TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton *v6;
  unsigned int v7;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v10.receiver = self;
  v10.super_class = ObjectType;
  v6 = self;
  v7 = -[UpsellSubscriptionPlanButton isSelected](&v10, "isSelected");
  v9.receiver = v6;
  v9.super_class = ObjectType;
  -[UpsellSubscriptionPlanButton setSelected:](&v9, "setSelected:", v3);
  v8.receiver = v6;
  v8.super_class = ObjectType;
  if (v7 != -[UpsellSubscriptionPlanButton isSelected](&v8, "isSelected"))
    sub_2AE2B0();

}

- (_TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton)initWithCoder:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton____lazy_storage___vStack) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton____lazy_storage___calloutLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton____lazy_storage___subtitleLabel) = 0;
  v4 = a3;

  result = (_TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/UpsellSubscriptionPlansView.swift", 57, 2, 202, 0);
  __break(1u);
  return result;
}

- (_TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton)initWithFrame:(CGRect)a3
{
  sub_26FF44((uint64_t)self, (uint64_t)a2, (uint64_t)"ShelfKitCollectionViews.UpsellSubscriptionPlanButton", 52);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton____lazy_storage___vStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton____lazy_storage___calloutLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_A89005DB8D4382AA5AEAA7A07C0C750128UpsellSubscriptionPlanButton_subscriptionPlan));
}

@end
