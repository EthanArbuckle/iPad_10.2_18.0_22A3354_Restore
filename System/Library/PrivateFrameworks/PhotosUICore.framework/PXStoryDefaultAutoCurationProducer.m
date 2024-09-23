@implementation PXStoryDefaultAutoCurationProducer

- (PXStoryDefaultAutoCurationProducer)initWithCurationContext:(id)a3
{
  _OWORD v4[2];

  if (a3)
  {
    swift_unknownObjectRetain();
    sub_1A7AE46D0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  return (PXStoryDefaultAutoCurationProducer *)StoryDefaultAutoCurationProducer.init(curationContext:)((uint64_t)v4);
}

- (id)requestCurationLengthsWithOptions:(unint64_t)a3 allAssets:(id)a4 curatedAssets:(id)a5 resultHandler:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  PXStoryDefaultAutoCurationProducer *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  id v22;
  __int128 v24;

  sub_1A689FC34();
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a6);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v13;
  v15 = (void *)objc_opt_self();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v16 = self;
  v17 = objc_msgSend(v15, sel_discreteProgressWithTotalUnitCount_, 0);
  v18 = OBJC_IVAR___PXStoryDefaultAutoCurationProducer_curationContext;
  v19 = sub_1A7AE3BD8();
  v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56);
  v24 = *(_OWORD *)((char *)&v16->super.isa + v18);
  v20(v12, 1, 1, v19);
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = 0;
  *(_QWORD *)(v21 + 24) = 0;
  *(_QWORD *)(v21 + 32) = v17;
  *(_QWORD *)(v21 + 40) = a4;
  *(_QWORD *)(v21 + 48) = a5;
  *(_OWORD *)(v21 + 56) = v24;
  *(_QWORD *)(v21 + 72) = sub_1A708AAC0;
  *(_QWORD *)(v21 + 80) = v14;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v22 = v17;
  swift_unknownObjectRetain();
  sub_1A7ADBF34();
  sub_1A686089C((uint64_t)v12, (uint64_t)&unk_1EE907B18, v21);
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v22;
}

- (id)requestCuratedAssetsWithOptions:(unint64_t)a3 targetOverallDurationInfo:(id *)a4 resultHandler:(id)a5
{
  int64_t var0;
  int64_t v9;
  int64_t var3;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  PXStoryDefaultAutoCurationProducer *v23;
  id v24;
  uint64_t v25;
  _QWORD *v26;
  PXStoryDefaultAutoCurationProducer *v27;
  id v28;
  int64_t v30;
  int64_t v31;

  var0 = a4->var0;
  v9 = a4->var1.var0.var0;
  var3 = a4->var1.var0.var3;
  v11 = a4->var1.var1.var0;
  v12 = a4->var1.var2.var0;
  v13 = a4->var1.var2.var3;
  v30 = a4->var1.var1.var3;
  v31 = v13;
  sub_1A689FC34();
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(_QWORD *)&a4->var1.var0.var1;
  v18 = *(_QWORD *)&a4->var1.var1.var1;
  v19 = *(_QWORD *)&a4->var1.var2.var1;
  v20 = _Block_copy(a5);
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v20;
  v22 = (void *)objc_opt_self();
  v23 = self;
  v24 = objc_msgSend(v22, sel_discreteProgressWithTotalUnitCount_, 0);
  v25 = sub_1A7AE3BD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v16, 1, 1, v25);
  v26 = (_QWORD *)swift_allocObject();
  v26[2] = 0;
  v26[3] = 0;
  v26[4] = v23;
  v26[5] = var0;
  v26[6] = v9;
  v26[7] = v17;
  v26[8] = var3;
  v26[9] = v11;
  v26[10] = v18;
  v26[11] = v30;
  v26[12] = v12;
  v26[13] = v19;
  v26[14] = v31;
  v26[15] = v24;
  v26[16] = sub_1A6A7D9DC;
  v26[17] = v21;
  v27 = v23;
  v28 = v24;
  sub_1A7ADBF34();
  sub_1A686089C((uint64_t)v16, (uint64_t)&unk_1EE907B10, (uint64_t)v26);
  swift_release();
  swift_release();

  return v28;
}

- (PXStoryDefaultAutoCurationProducer)init
{
  PXStoryDefaultAutoCurationProducer *result;

  result = (PXStoryDefaultAutoCurationProducer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
