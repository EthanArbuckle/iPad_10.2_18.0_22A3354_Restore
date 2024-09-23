@implementation LegacyStorytellingService

- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4
{
  _QWORD *v4;
  void (*v5)(_QWORD *, _QWORD);

  v4 = _Block_copy(a4);
  v5 = (void (*)(_QWORD *, _QWORD))v4[2];
  swift_retain();
  v5(v4, 0);
  _Block_release(v4);
  swift_release();
}

- (void)dumpAnalysisStatusWithContext:(id)a3 reply:(id)a4
{
  void (**v4)(void *, _QWORD, void *);
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = (void (**)(void *, _QWORD, void *))_Block_copy(a4);
  sub_1CAC6FC88();
  v5 = (void *)swift_allocError();
  *(_QWORD *)v6 = 0xD000000000000026;
  *(_QWORD *)(v6 + 8) = 0x80000001CADD5A10;
  *(_QWORD *)(v6 + 16) = 0xD00000000000004ALL;
  *(_QWORD *)(v6 + 24) = 0x80000001CADD5A40;
  *(_BYTE *)(v6 + 32) = 3;
  swift_retain();
  v7 = (void *)sub_1CADC2A38();
  v4[2](v4, 0, v7);

  _Block_release(v4);
  swift_release();
}

- (void)cancelOperationsWithIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED858B40);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a5);
  sub_1CAC1C6B0(0, (unint64_t *)&qword_1ED858BE0);
  v11 = sub_1CADC39D4();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v10;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = sub_1CAC2E634;
  *(_QWORD *)(v13 + 24) = v12;
  v14 = sub_1CADC3A88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v9, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = v11;
  v15[6] = sub_1CACF50F0;
  v15[7] = v13;
  swift_retain_n();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1CAD15364((uint64_t)v9, (uint64_t)&unk_1EF9848C0, (uint64_t)v15);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)writeQALog:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = sub_1CADC38E4();
  v5 = v4;
  swift_retain();
  sub_1CACF4F18(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
}

@end
