@implementation XpcQuotaClient

- (_TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient)init
{
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  id v5;
  _TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient *v6;
  objc_super v8;
  _QWORD v9[5];

  v2 = sub_21C5121EC();
  swift_allocObject();
  v3 = sub_21C5121E0();
  v9[3] = v2;
  v9[4] = MEMORY[0x24BEC74F8];
  v9[0] = v3;
  v4 = (objc_class *)type metadata accessor for XpcQuotaClient();
  v5 = objc_allocWithZone(v4);
  sub_21C5014B0((uint64_t)v9, (uint64_t)v5 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient_protoClient);
  v8.receiver = v5;
  v8.super_class = v4;
  swift_retain();
  v6 = -[XpcQuotaClient init](&v8, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

- (id)parseNotification:(id)a3
{
  uint64_t v4;
  _TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient *v5;
  id v6;

  v4 = sub_21C5126F0();
  v5 = self;
  v6 = sub_21C5116D4(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (void)newOffer:(id)a3 andCallback:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_21C50FCF0(v8, (void (*)(void))sub_21C5120A8, v7);

  swift_release();
}

- (void)isNotificationPending:(id)a3
{
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t (*v15)(void);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  ObjectType = swift_getObjectType();
  v6 = sub_21C51221C();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = qword_2540B2628;
  v12 = self;
  if (v11 != -1)
    swift_once();
  v13 = sub_21C5126A8();
  __swift_project_value_buffer(v13, (uint64_t)qword_2540B2610);
  sub_21C512684();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = sub_21C512188;
  v14[3] = v10;
  v14[4] = ObjectType;
  v15 = MEMORY[0x24BEC7548];
  sub_21C50BD5C(&qword_2540B24A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEC7548], MEMORY[0x24BEC7538]);
  swift_retain();
  sub_21C5121D4();
  v16 = *(_QWORD *)&v12->protoClient[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient_protoClient
                                   + 16];
  v17 = *(_QWORD *)&v12->protoClient[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient_protoClient
                                   + 24];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&v12->super.super.isa+ OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient_protoClient), v16);
  (*(void (**)(char *, uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t))(v17 + 8))(v8, sub_21C51209C, v14, v16, v17);
  swift_release();
  sub_21C5053CC((uint64_t)v8, (uint64_t (*)(_QWORD))v15);

  swift_release();
}

- (void)clearNotificationState:(id)a3
{
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  _TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void (*v16)(char *, uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t);
  uint64_t v17;

  ObjectType = swift_getObjectType();
  v6 = sub_21C51221C();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEC7548];
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a3);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  sub_21C50BD5C(&qword_2540B24A0, v7, MEMORY[0x24BEC7538]);
  v12 = self;
  sub_21C5121D4();
  v13 = *(_QWORD *)&v12->protoClient[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient_protoClient
                                   + 16];
  v14 = *(_QWORD *)&v12->protoClient[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient_protoClient
                                   + 24];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&v12->super.super.isa+ OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient_protoClient), v13);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = sub_21C50526C;
  v15[3] = v11;
  v15[4] = ObjectType;
  v16 = *(void (**)(char *, uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t))(v14 + 8);
  swift_retain();
  v16(v9, sub_21C512048, v15, v13, v14);
  swift_release();
  sub_21C5053CC((uint64_t)v9, v7);

  swift_release();
}

- (id)parseDelayedOffer:(id)a3
{
  uint64_t v3;
  _TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient *v4;
  uint64_t v5;

  v3 = qword_2540B2628;
  v4 = self;
  if (v3 != -1)
    swift_once();
  v5 = sub_21C5126A8();
  __swift_project_value_buffer(v5, (uint64_t)qword_2540B2610);
  sub_21C51269C();

  return 0;
}

- (id)parseDelayedOfferFromJson:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient *v7;
  id v8;

  v4 = sub_21C512720();
  v6 = v5;
  v7 = self;
  v8 = sub_21C511AAC(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)failsafeDelayedOfferJsonContext
{
  void *v2;

  sub_21C512510();
  v2 = (void *)sub_21C512714();
  swift_bridgeObjectRelease();
  return v2;
}

- (void)logFailsafeEvent:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient *v8;
  uint64_t v9;
  _BYTE v10[40];

  v4 = sub_21C512720();
  v6 = v5;
  v7 = qword_2540B2640;
  v8 = self;
  if (v7 != -1)
    swift_once();
  sub_21C5014B0(qword_2540B2638 + 16, (uint64_t)v10);
  type metadata accessor for FailsafeClientLibEvent();
  swift_allocObject();
  swift_bridgeObjectRetain();
  v9 = FailsafeClientLibEvent.init(withSink:failsafeEvent:)((uint64_t)v10, v4, v6);
  (*(void (**)(uint64_t))(*(_QWORD *)v9 + 200))(v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient_protoClient);
}

@end
