@implementation MarketingDynamicOfferCoordinator

- (_TtC9SeymourUI32MarketingDynamicOfferCoordinator)init
{
  objc_super v4;

  *(_QWORD *)&self->eventHub[OBJC_IVAR____TtC9SeymourUI32MarketingDynamicOfferCoordinator_eventHub] = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MarketingDynamicOfferCoordinator();
  return -[MarketingDynamicOfferCoordinator init](&v4, sel_init);
}

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  __n128 v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  _TtC9SeymourUI32MarketingDynamicOfferCoordinator *v16;
  uint64_t v17;
  id v18;

  v9 = sub_22BA7DF10();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (MEMORY[0x22E2F3FFC]((char *)self + OBJC_IVAR____TtC9SeymourUI32MarketingDynamicOfferCoordinator_eventHub, v11))
  {
    swift_getObjectType();
    v18 = a5;
    v14 = a3;
    v15 = a4;
    v16 = self;
    sub_22BA7DF04();
    sub_22B9AFDA8();
    sub_22BA7EFF0();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);

  }
}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  sub_22B9AFCBC(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *, void *))sub_22B9AFBB0);
}

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
  sub_22B9AFCBC(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *, void *))sub_22B9AFBC8);
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI32MarketingDynamicOfferCoordinator_eventHub);
  swift_unknownObjectWeakDestroy();
}

@end
