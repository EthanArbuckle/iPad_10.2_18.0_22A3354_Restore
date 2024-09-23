@implementation IntentHandler

- (_TtC31HomeWidgetSingleAccessoryIntent13IntentHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IntentHandler();
  return -[IntentHandler init](&v3, "init");
}

- (void)provideAccessoryOptionsCollectionForSecurityAccessoryConfiguration:(SecurityAccessoryConfigurationIntent *)a3 withCompletion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  SecurityAccessoryConfigurationIntent *v15;
  _TtC31HomeWidgetSingleAccessoryIntent13IntentHandler *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_10000D3B8(&qword_10003DD40);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100038978, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_1000389A0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10003DDA8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_1000389C8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10003DDB0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_10001B660((uint64_t)v9, (uint64_t)&unk_10003DDB8, (uint64_t)v14);
  swift_release(v17);
}

- (id)defaultAccessoryForSecurityAccessoryConfiguration:(id)a3
{
  id v4;
  _TtC31HomeWidgetSingleAccessoryIntent13IntentHandler *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_10001E424();

  return v6;
}

- (void)provideClimateTypeOptionsCollectionForClimateSensorTypeConfiguration:(ClimateSensorTypeConfigurationIntent *)a3 withCompletion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  ClimateSensorTypeConfigurationIntent *v15;
  _TtC31HomeWidgetSingleAccessoryIntent13IntentHandler *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_10000D3B8(&qword_10003DD40);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_1000388D8, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100038900, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10003DD50;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100038928, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10003DD60;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_10001B660((uint64_t)v9, (uint64_t)&unk_10003DD70, (uint64_t)v14);
  swift_release(v17);
}

- (id)defaultClimateTypeForClimateSensorTypeConfiguration:(id)a3
{
  id v4;
  _TtC31HomeWidgetSingleAccessoryIntent13IntentHandler *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_10001EB04();
  v7 = v6;

  return v7;
}

@end
