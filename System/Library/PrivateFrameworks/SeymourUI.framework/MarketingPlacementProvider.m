@implementation MarketingPlacementProvider

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI26MarketingPlacementProvider__fakeUnifiedMessagingPlacements;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BA1020);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC9SeymourUI26MarketingPlacementProvider)init
{
  _TtC9SeymourUI26MarketingPlacementProvider *result;

  result = (_TtC9SeymourUI26MarketingPlacementProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  id v18;
  _TtC9SeymourUI26MarketingPlacementProvider *v19;
  id v20;
  id v21;
  uint64_t v22;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B84200);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_22BA8067C();
  v14 = v13;
  v15 = sub_22BA809D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v11, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = self;
  v16[5] = a3;
  v16[6] = a4;
  v16[7] = v12;
  v16[8] = v14;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = v17;
  v21 = v18;
  swift_bridgeObjectRetain();
  sub_22B1A7564((uint64_t)v11, (uint64_t)&unk_255BBA298, (uint64_t)v16);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)engagement:(AMSEngagement *)a3 handleDialogRequest:(AMSDialogRequest *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  AMSEngagement *v17;
  AMSDialogRequest *v18;
  _TtC9SeymourUI26MarketingPlacementProvider *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B84200);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_22BA809D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_255BBA270;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_255BBA278;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_22B290CA8((uint64_t)v11, (uint64_t)&unk_255BBA280, (uint64_t)v16);
  swift_release();
}

- (void)engagement:(AMSEngagement *)a3 handleEngagementRequest:(AMSEngagementRequest *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  AMSEngagement *v17;
  AMSEngagementRequest *v18;
  _TtC9SeymourUI26MarketingPlacementProvider *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B84200);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_22BA809D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_255BBA248;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_255BBA250;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_22B290CA8((uint64_t)v11, (uint64_t)&unk_255BBA258, (uint64_t)v16);
  swift_release();
}

- (void)engagement:(AMSEngagement *)a3 didUpdateEngagementRequest:(AMSEngagementRequest *)a4 placement:(NSString *)a5 serviceType:(NSString *)a6 completion:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  AMSEngagement *v21;
  AMSEngagementRequest *v22;
  NSString *v23;
  NSString *v24;
  _TtC9SeymourUI26MarketingPlacementProvider *v25;
  uint64_t v26;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B84200);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  v18 = sub_22BA809D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_255BBA208;
  v19[5] = v17;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_255BBA218;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = self;
  sub_22B290CA8((uint64_t)v15, (uint64_t)&unk_255BBA228, (uint64_t)v20);
  swift_release();
}

@end
