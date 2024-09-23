@implementation ICQTaskLimiters

- (void)performWithIdentifier:(id)a3 task:(id)a4 completion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _TtC11iCloudQuota15ICQTaskLimiters *v20;
  uint64_t v21;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B68);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = _Block_copy(a5);
  v13 = sub_1CDF32D24();
  v15 = v14;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v11;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v12;
  v18 = sub_1CDF32DF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v10, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = self;
  v19[5] = v13;
  v19[6] = v15;
  v19[7] = sub_1CDF190A0;
  v19[8] = v16;
  v19[9] = sub_1CDF190C8;
  v19[10] = v17;
  v20 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_1CDF1009C((uint64_t)v10, (uint64_t)&unk_1EFA5AD48, (uint64_t)v19);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

}

- (void)performClosureNoParamsWithIdentifier:(id)a3 task:(id)a4 completion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _TtC11iCloudQuota15ICQTaskLimiters *v20;
  uint64_t v21;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B68);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = _Block_copy(a5);
  v13 = sub_1CDF32D24();
  v15 = v14;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v11;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v12;
  v18 = sub_1CDF32DF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v10, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = self;
  v19[5] = v13;
  v19[6] = v15;
  v19[7] = sub_1CDF18FCC;
  v19[8] = v16;
  v19[9] = sub_1CDF19018;
  v19[10] = v17;
  v20 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_1CDF18AE4((uint64_t)v10, (uint64_t)&unk_1EFA5AD40, (uint64_t)v19);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

}

- (_TtC11iCloudQuota15ICQTaskLimiters)init
{
  uint64_t v3;
  _TtC11iCloudQuota15ICQTaskLimiters *v4;
  objc_super v6;

  v3 = OBJC_IVAR____TtC11iCloudQuota15ICQTaskLimiters_taskLimiters;
  type metadata accessor for TaskLimiters();
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_1CDF1B8B4();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ICQTaskLimiters();
  return -[ICQTaskLimiters init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
