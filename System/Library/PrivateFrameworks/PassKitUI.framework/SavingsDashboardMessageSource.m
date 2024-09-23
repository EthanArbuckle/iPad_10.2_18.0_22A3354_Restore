@implementation SavingsDashboardMessageSource

- (void)dealloc
{
  _TtC9PassKitUI29SavingsDashboardMessageSource *v2;

  v2 = self;
  sub_19D86C668();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI29SavingsDashboardMessageSource__messages;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4BA8C0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI29SavingsDashboardMessageSource_transactionProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI29SavingsDashboardMessageSource_accountService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI29SavingsDashboardMessageSource_discoveryService));
  sub_19D1A9F60(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9PassKitUI29SavingsDashboardMessageSource_presentActionSheet));
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI29SavingsDashboardMessageSource__presentContactSupport;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE494370);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

  swift_release();
  sub_19D1A9F60(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9PassKitUI29SavingsDashboardMessageSource_presentDestinationWithConfiguration));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC9PassKitUI29SavingsDashboardMessageSource)init
{
  _TtC9PassKitUI29SavingsDashboardMessageSource *result;

  result = (_TtC9PassKitUI29SavingsDashboardMessageSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)discoveryService:(id)a3 dialogRequestsChangedForPlacement:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC9PassKitUI29SavingsDashboardMessageSource *v10;

  if (a4)
  {
    v6 = sub_19DE87BF4();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a3;
  v10 = self;
  sub_19D8786A0(v6, v8);

  swift_bridgeObjectRelease();
}

- (void)discoveryServiceDidReceiveUpdatedDiscoveryEngagementMessages:(id)a3
{
  id v4;
  _TtC9PassKitUI29SavingsDashboardMessageSource *v5;

  v4 = a3;
  v5 = self;
  sub_19D878934();

}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC9PassKitUI29SavingsDashboardMessageSource *v10;

  if (a3)
  {
    v6 = sub_19DE87BF4();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a4;
  v10 = self;
  sub_19D877A98(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)didUpdatePaymentFundingSources:(id)a3 accountIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  _TtC9PassKitUI29SavingsDashboardMessageSource *v8;

  if (a3)
  {
    sub_19D1A9ED4(0, &qword_1EE4AE080);
    sub_19DE87E10();
  }
  if (a4)
  {
    a4 = (id)sub_19DE87BF4();
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_19D878B4C((uint64_t)a4, v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
