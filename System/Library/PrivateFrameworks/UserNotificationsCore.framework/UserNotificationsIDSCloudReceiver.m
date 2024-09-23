@implementation UserNotificationsIDSCloudReceiver

- (_TtC21UserNotificationsCore33UserNotificationsIDSCloudReceiver)init
{
  _TtC21UserNotificationsCore33UserNotificationsIDSCloudReceiver *result;

  result = (_TtC21UserNotificationsCore33UserNotificationsIDSCloudReceiver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_249A03038((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore33UserNotificationsIDSCloudReceiver_notificationDelegate);
  sub_249A03038((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore33UserNotificationsIDSCloudReceiver_attachmentDelegate);
  sub_249A03038((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore33UserNotificationsIDSCloudReceiver_categoriesDelegate);
  sub_249A03038((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore33UserNotificationsIDSCloudReceiver_actionsDelegate);
  sub_249A03038((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore33UserNotificationsIDSCloudReceiver_coordinationDelegate);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _TtC21UserNotificationsCore33UserNotificationsIDSCloudReceiver *v18;

  v8 = a6;
  if (!a5)
  {
    v12 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v12 = sub_249B024D0();
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v13 = sub_249B0253C();
  v8 = v14;
LABEL_6:
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = self;
  sub_249ADAD94(a3, a4, v12, v13, (uint64_t)v8, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _TtC21UserNotificationsCore33UserNotificationsIDSCloudReceiver *v25;
  uint64_t v26;

  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544BCEF0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_249B01978();
    v18 = sub_249B019B4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 0, 1, v18);
  }
  else
  {
    v19 = sub_249B019B4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v17, 1, 1, v19);
  }
  if (a6)
    a6 = (id)sub_249B024D0();
  if (a7)
  {
    v20 = sub_249B0253C();
    a7 = v21;
  }
  else
  {
    v20 = 0;
  }
  v22 = a3;
  v23 = a4;
  v24 = a8;
  v25 = self;
  sub_249ADEC34(a3, a4, (uint64_t)v17, (char *)a6, v20, (uint64_t)a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_249A0242C((uint64_t)v17, (uint64_t *)&unk_2544BCEF0);
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  void *v9;
  id v12;
  id v13;
  id v14;
  id v15;
  _TtC21UserNotificationsCore33UserNotificationsIDSCloudReceiver *v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _TtC21UserNotificationsCore33UserNotificationsIDSCloudReceiver *v27;

  v9 = a5;
  if (!a5)
  {
    v23 = a3;
    v24 = a4;
    v25 = a6;
    v26 = a7;
    v27 = self;
    v19 = 0xF000000000000000;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v20 = 0;
    v22 = 0;
    goto LABEL_6;
  }
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = self;
  v17 = v9;
  v9 = (void *)sub_249B019E4();
  v19 = v18;

  if (!a6)
    goto LABEL_5;
LABEL_3:
  v20 = sub_249B0253C();
  v22 = v21;

LABEL_6:
  sub_249ADD018(a3, a4, (uint8_t *)v9, v19, v20, v22, a7);
  swift_bridgeObjectRelease();
  sub_249A2C0A4((uint64_t)v9, v19);

}

@end
