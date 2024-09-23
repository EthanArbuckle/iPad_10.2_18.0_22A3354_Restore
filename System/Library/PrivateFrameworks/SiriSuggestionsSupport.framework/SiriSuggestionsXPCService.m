@implementation SiriSuggestionsXPCService

- (void)suggestNextWithRequestId:(id)a3 extraStateStoreProperties:(id)a4 completionHandler:(id)a5
{
  sub_1C03DC23C();
}

- (void)logIntentFor:(id)a3 intent:(id)a4 completion:(id)a5
{
  sub_1C03DC23C();
}

- (void)getSuggestionsForAppWithAppBundleId:(id)a3 placementId:(id)a4 entities:(id)a5 intentToSuggest:(id)a6 bridge:(id)a7 completionHandler:(id)a8
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(void);

  v26 = _Block_copy(a8);
  v27 = sub_1C03E4094();
  v13 = v12;
  if (a4)
  {
    v14 = sub_1C03E4094();
    a4 = v15;
  }
  else
  {
    v14 = 0;
  }
  v16 = a5;
  swift_unknownObjectRetain();
  swift_retain();
  v17 = a6;
  v18 = sub_1C03E2FF0();
  v20 = v19;

  if (v17)
  {
    v21 = sub_1C03E2FF0();
    v23 = v22;

  }
  else
  {
    v21 = 0;
    v23 = 0xF000000000000000;
  }
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = v26;
  sub_1C03D93C4(v27, v13, v14, (uint64_t)a4, v18, v20, v21, v23, (uint64_t)a7, (uint64_t)sub_1C03DE804, v24, v25, (uint64_t)v26, v27, v28, v29, v30, v31, v32,
    v33,
    v34,
    v35);
  swift_release();
  sub_1C03B57D4(v21, v23);
  sub_1C03B57E8(v18, v20);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)refreshServiceWithCompletion:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  swift_retain();
  sub_1C03DB37C((uint64_t)sub_1C03DE804, v4);
  swift_release();
  swift_release();
}

- (void)submitFor:(id)a3 stateStoreProperties:(id)a4 completion:(id)a5
{
  sub_1C03DC23C();
}

- (void)submitFor:(id)a3 propertyKey:(id)a4 propertyValue:(id)a5 completion:(id)a6
{
  void *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v7 = _Block_copy(a6);
  sub_1C03E4094();
  sub_1C03E4094();
  v8 = a5;
  swift_retain();
  v9 = sub_1C03E2FF0();
  v11 = v10;

  *(_QWORD *)(swift_allocObject() + 16) = v7;
  sub_1C03DC30C();
  swift_release();
  sub_1C03B57E8(v9, v11);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)warmupWithCompletion:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  _Block_copy(v3);
  v4 = swift_retain();
  sub_1C03DCBD4(v4, (void (**)(_QWORD, _QWORD))v3);
  _Block_release(v3);
  swift_release();
}

- (void)logWithSuggestions:(id)a3 deliveryVehicle:(id)a4 generationId:(id)a5 completion:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = sub_1C03E302C();
  v10 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a6);
  v14 = a3;
  v15 = a4;
  v16 = a5;
  swift_retain();
  v17 = sub_1C03E2FF0();
  v19 = v18;

  v20 = sub_1C03E2FF0();
  v22 = v21;

  sub_1C03E3014();
  *(_QWORD *)(swift_allocObject() + 16) = v13;
  sub_1C03DCD00();
  swift_release();
  sub_1C03B57E8(v20, v22);
  sub_1C03B57E8(v17, v19);
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v24);
}

@end
