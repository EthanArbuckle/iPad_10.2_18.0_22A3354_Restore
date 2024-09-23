@implementation ICQLiftUIController

- (id)makeLiftUIViewControllerWithURL:(id)a3 dataSource:(id)a4 presenter:(id)a5 data:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  ICQLiftUIController *v16;
  void *v17;
  uint64_t v19;

  v10 = sub_21F454498();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F454480();
  if (a6)
    a6 = (id)sub_21F455F98();
  v14 = a4;
  v15 = a5;
  v16 = self;
  v17 = (void *)sub_21F3CE8B4((uint64_t)v13, v14, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return v17;
}

- (id)makeLiftUIViewControllerWithContent:(id)a3 dataSource:(id)a4 presenter:(id)a5 data:(id)a6
{
  id v10;
  id v11;
  id v12;
  ICQLiftUIController *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = self;
  v14 = a6;
  v15 = sub_21F4544A4();
  v17 = v16;

  if (v14)
  {
    v18 = sub_21F455F98();

  }
  else
  {
    v18 = 0;
  }
  v19 = (void *)sub_21F3CEF74(v15, v17, v11, v12, v18);
  swift_bridgeObjectRelease();
  sub_21F397138(v15, v17);

  return v19;
}

- (void)updateStoreDataForKey:(id)a3 value:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  ICQLiftUIController *v8;
  _BYTE v9[32];

  v5 = sub_21F45601C();
  v7 = v6;
  swift_unknownObjectRetain();
  v8 = self;
  sub_21F456550();
  swift_unknownObjectRelease();
  sub_21F3CF52C(v5, v7, (uint64_t)v9);

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
}

- (ICQLiftUIController)init
{
  uint64_t v3;
  ICQLiftUIController *v4;
  uint64_t v5;
  objc_super v7;

  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICQLiftUIController_dataSource) = 0;
  v3 = OBJC_IVAR___ICQLiftUIController_store;
  sub_21F454AB0();
  swift_allocObject();
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_21F454AA4();
  v5 = OBJC_IVAR___ICQLiftUIController_localStore;
  sub_21F454A68();
  swift_allocObject();
  *(Class *)((char *)&v4->super.isa + v5) = (Class)sub_21F454A5C();

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for LiftUIController();
  return -[ICQLiftUIController init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_release();
  swift_release();
}

@end
