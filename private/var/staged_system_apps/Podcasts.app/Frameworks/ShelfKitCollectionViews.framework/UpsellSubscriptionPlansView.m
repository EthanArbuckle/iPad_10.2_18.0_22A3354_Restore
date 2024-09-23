@implementation UpsellSubscriptionPlansView

- (_TtC23ShelfKitCollectionViews27UpsellSubscriptionPlansView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC23ShelfKitCollectionViews27UpsellSubscriptionPlansView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews27UpsellSubscriptionPlansView_subscriptionPlanButtons) = (Class)&_swiftEmptyArrayStorage;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViews27UpsellSubscriptionPlansView_didSelect);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC23ShelfKitCollectionViews27UpsellSubscriptionPlansView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/UpsellSubscriptionPlansView.swift", 57, 2, 48, 0);
  __break(1u);
  return result;
}

- (void)planButtonTappedWithButton:(id)a3
{
  char *v4;
  _TtC23ShelfKitCollectionViews27UpsellSubscriptionPlansView *v5;

  v4 = (char *)a3;
  v5 = self;
  sub_2AD748(v4);

}

- (_TtC23ShelfKitCollectionViews27UpsellSubscriptionPlansView)initWithFrame:(CGRect)a3
{
  sub_26FF44((uint64_t)self, (uint64_t)a2, (uint64_t)"ShelfKitCollectionViews.UpsellSubscriptionPlansView", 51);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews27UpsellSubscriptionPlansView_subscriptionPlans));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews27UpsellSubscriptionPlansView_subscriptionPlanButtons));
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews27UpsellSubscriptionPlansView_didSelect), *(_QWORD *)&self->subscriptionPlans[OBJC_IVAR____TtC23ShelfKitCollectionViews27UpsellSubscriptionPlansView_didSelect]);
}

@end
