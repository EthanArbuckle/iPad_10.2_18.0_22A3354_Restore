@implementation MarketingPurchaseCoordinator

- (_TtC9SeymourUI28MarketingPurchaseCoordinator)init
{
  objc_super v4;

  swift_unknownObjectWeakInit();
  *(_QWORD *)&self->bag[OBJC_IVAR____TtC9SeymourUI28MarketingPurchaseCoordinator_eventHub] = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MarketingPurchaseCoordinator();
  return -[MarketingPurchaseCoordinator init](&v4, sel_init);
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28MarketingPurchaseCoordinator_bag);
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28MarketingPurchaseCoordinator_eventHub);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC9SeymourUI28MarketingPurchaseCoordinator *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_22BA10DF0(v11, (uint64_t)sub_22BA110E8, v9, (uint64_t)&unk_24F5D6C88, (uint64_t)sub_22BA110D8, (uint64_t)&block_descriptor_37_0);

  swift_release();
}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC9SeymourUI28MarketingPurchaseCoordinator *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_22BA10DF0(v11, (uint64_t)sub_22BA11020, v9, (uint64_t)&unk_24F5D6BE8, (uint64_t)sub_22BA11074, (uint64_t)&block_descriptor_24_5);

  swift_release();
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC9SeymourUI28MarketingPurchaseCoordinator *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_22BA10DF0(v11, (uint64_t)sub_22BA110E8, v9, (uint64_t)&unk_24F5D6B20, (uint64_t)sub_22BA1103C, (uint64_t)&block_descriptor_174);

  swift_release();
}

@end
