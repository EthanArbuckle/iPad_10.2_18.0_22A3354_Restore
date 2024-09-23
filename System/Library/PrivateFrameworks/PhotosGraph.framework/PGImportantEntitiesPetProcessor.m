@implementation PGImportantEntitiesPetProcessor

+ (void)processUserPetsInGraph:(id)a3 progressBlock:(id)a4 withProcessInferredPetNodeClosure:(id)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  _QWORD v18[3];
  __int128 v19;
  uint64_t v20;

  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  v17[2] = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = (void *)objc_opt_self();
  _Block_copy(v7);
  v11 = a3;
  objc_msgSend(v10, sel_usersPetsInferenceRecencyThresholdFromLatestMomentDateYears);
  v13 = v12 * 31557600.0;
  objc_msgSend(v10, sel_usersPetsInferenceMinimumLifespanYears);
  *(double *)v18 = v13;
  *(double *)&v18[1] = v14 * 31557600.0;
  v18[2] = 10;
  v19 = xmmword_1CA8E83A0;
  v20 = 0;
  type metadata accessor for ImportantEntitiesPetContainer();
  v15 = swift_allocObject();
  v16 = v11;
  swift_retain();
  sub_1CA4869E4(v16, (void (*)(double))sub_1CA370F90, (uint64_t)v17, (uint64_t)sub_1CA370F90, v9);
  sub_1CA3BDEE0(v15, (uint64_t)v18, 1, v7);
  _Block_release(v7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  _Block_release(v7);

}

- (PGImportantEntitiesPetProcessor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ImportantEntitiesPetProcessor();
  return -[PGImportantEntitiesPetProcessor init](&v3, sel_init);
}

@end
