@implementation IDSServiceWrapper

- (void)dealloc
{
  void *v3;
  _TtC16ReplicatorEngine17IDSServiceWrapper *v4;
  id v5;
  int *v6;
  objc_super v7;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6 = (int *)((char *)v4 + OBJC_IVAR____TtC16ReplicatorEngine17IDSServiceWrapper_pairedDeviceNotificationToken);
  swift_beginAccess();
  notify_cancel(*v6);
  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for IDSServiceWrapper();
  -[IDSServiceWrapper dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_24526388C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16ReplicatorEngine17IDSServiceWrapper__lock_pairedDevice), *(_QWORD *)&self->idsService[OBJC_IVAR____TtC16ReplicatorEngine17IDSServiceWrapper__lock_pairedDevice]);
}

- (_TtC16ReplicatorEngine17IDSServiceWrapper)init
{
  _TtC16ReplicatorEngine17IDSServiceWrapper *result;

  result = (_TtC16ReplicatorEngine17IDSServiceWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  _TtC16ReplicatorEngine17IDSServiceWrapper *v23;
  uint64_t v24;

  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F610);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_2453875B4();
    v18 = sub_2453875E4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 0, 1, v18);
  }
  else
  {
    v19 = sub_2453875E4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v17, 1, 1, v19);
  }
  if (a6)
    a6 = (id)sub_245387A64();
  if (a7)
    sub_245387B18();
  v20 = a3;
  v21 = a4;
  v22 = a8;
  v23 = self;
  sub_2452EBB00((uint64_t)v17, (uint64_t)a6, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_245263F80((uint64_t)v17, &qword_25744F610);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _TtC16ReplicatorEngine17IDSServiceWrapper *v16;

  if (!a5)
  {
    v12 = 0;
    if (!a6)
      goto LABEL_4;
    goto LABEL_3;
  }
  v12 = sub_245387A64();
  if (a6)
LABEL_3:
    sub_245387B18();
LABEL_4:
  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = self;
  sub_2452EC310(v12, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  id v17;
  _TtC16ReplicatorEngine17IDSServiceWrapper *v18;

  v8 = a6;
  if (a5)
  {
    v12 = sub_245387B18();
    v14 = v13;
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = self;
  sub_2452ECA6C(v12, v14, v8, a7);

  swift_bridgeObjectRelease();
}

- (void)pairedDeviceStateChangedWithNotification:(id)a3
{
  id v4;
  _TtC16ReplicatorEngine17IDSServiceWrapper *v5;

  v4 = a3;
  v5 = self;
  sub_2452EB118();

}

@end
