@implementation CategorizationManager

+ (CategorizationManager)sharedInstance
{
  if (qword_10003A9F0 != -1)
    swift_once(&qword_10003A9F0, sub_10001FC78);
  return (CategorizationManager *)(id)qword_10003B348;
}

- (CategorizationManager)init
{
  return (CategorizationManager *)sub_10001FF28();
}

- (void)start
{
  CategorizationManager *v2;

  v2 = self;
  sub_1000201A0();

}

- (void)predictCommerceEmailWith:(id)a3 completion:(id)a4
{
  sub_10000DAB8(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_10002473C);
}

- (void)isModelReadyWithCompletion:(id)a3
{
  sub_100022C58(self, (int)a2, a3, (void (*)(void))sub_100023944);
}

- (void)invokeModelDownloadWithCompletion:(id)a3
{
  sub_100022C58(self, (int)a2, a3, (void (*)(void))sub_100023A3C);
}

- (void)getIABCategoryIDWith:(id)a3 completion:(id)a4
{
  sub_100009390(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_1000241D4);
}

- (void)isPersonalDomainWith:(id)a3 completion:(id)a4
{
  sub_100009390(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_1000242DC);
}

- (void)getBlackPearlVersionWithCompletion:(id)a3
{
  sub_100022C58(self, (int)a2, a3, (void (*)(void))sub_1000243E4);
}

- (void)registerCategoryRulesCallbackListenerWithEndpoint:(id)a3 completion:(id)a4
{
  sub_10000DAB8(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_100023C9C);
}

- (void)notifyCategoryRuleListenersWithRules:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  CategorizationManager *v7;

  v5 = sub_100024830(0, &qword_10003AFE0, RCWebRule_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  sub_10002332C();

  swift_bridgeObjectRelease(v6);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CategorizationManager_clientConnections));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CategorizationManager_pendingRules));

  swift_release(*(_QWORD *)&self->transactionId[OBJC_IVAR___CategorizationManager_nextNlpTimeout]);
}

@end
