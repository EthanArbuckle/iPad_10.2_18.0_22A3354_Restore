@implementation ServiceSubscriptionDialogObserver

- (_TtC15SeymourServices33ServiceSubscriptionDialogObserver)init
{
  objc_super v4;

  *(_QWORD *)&self->dataSource[OBJC_IVAR____TtC15SeymourServices33ServiceSubscriptionDialogObserver_dataSource] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ServiceSubscriptionDialogObserver();
  return -[ServiceSubscriptionDialogObserver init](&v4, sel_init);
}

- (void).cxx_destruct
{
  sub_1CEEA8650((uint64_t)self + OBJC_IVAR____TtC15SeymourServices33ServiceSubscriptionDialogObserver_dataSource);
}

- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  sub_1CEED3E2C(self, (int)a2, a3, a4, (uint64_t)&unk_1E8C14B70, (uint64_t)sub_1CEED3FE8, (void (*)(id, uint64_t, uint64_t))sub_1CEED3438);
}

- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4
{
  sub_1CEED3E2C(self, (int)a2, a3, a4, (uint64_t)&unk_1E8C14AD0, (uint64_t)sub_1CEED3F38, (void (*)(id, uint64_t, uint64_t))sub_1CEED386C);
}

@end
