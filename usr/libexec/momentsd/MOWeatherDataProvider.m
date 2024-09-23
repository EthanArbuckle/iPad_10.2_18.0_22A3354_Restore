@implementation MOWeatherDataProvider

- (void)fetchCurrentWeatherFor:(id)a3 completion:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  _TtC8momentsd21MOWeatherDataProvider *v14;
  uint64_t v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = swift_allocObject(&unk_1002B6770, 24, 7);
  *(_QWORD *)(v10 + 16) = v9;
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject(&unk_1002B6798, 56, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a3;
  v12[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned MOWeatherData?, @unowned NSError?) -> ();
  v12[6] = v10;
  v13 = a3;
  v14 = self;
  swift_retain(v10);
  v15 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v8, (uint64_t)&closure #1 in MOWeatherDataProvider.fetchCurrentWeather(for:completion:)partial apply, (uint64_t)v12);

  swift_release(v10);
  swift_release(v15);
}

- (void)fetchHourlyWeatherFor:(id)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  void *v35;
  char *v36;
  void (*v37)(char *, char *, uint64_t);
  void (**v38)(objc_class *, uint64_t);
  id v39;
  _TtC8momentsd21MOWeatherDataProvider *v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  id v47;
  _TtC8momentsd21MOWeatherDataProvider *v48;

  v47 = a3;
  v48 = self;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v9);
  v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = v11;
  v12 = type metadata accessor for Date(0);
  v43 = *(_QWORD *)(v12 - 8);
  v13 = *(_QWORD *)(v43 + 64);
  v14 = __chkstk_darwin(v12);
  v15 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v43 - v17;
  v19 = __chkstk_darwin(v16);
  v21 = (char *)&v43 - v20;
  __chkstk_darwin(v19);
  v23 = (char *)&v43 - v22;
  v24 = _Block_copy(a6);
  v46 = v23;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v45 = v21;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v25 = swift_allocObject(&unk_1002B6720, 24, 7);
  *(_QWORD *)(v25 + 16) = v24;
  v26 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v11, 1, 1, v26);
  v27 = v43;
  v28 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
  v28(v18, v23, v12);
  v28(v15, v21, v12);
  v29 = *(unsigned __int8 *)(v27 + 80);
  v30 = v27;
  v31 = (v29 + 40) & ~v29;
  v32 = (v13 + v29 + v31) & ~v29;
  v33 = (v13 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
  v34 = (char *)swift_allocObject(&unk_1002B6748, v33 + 16, v29 | 7);
  *((_QWORD *)v34 + 2) = 0;
  *((_QWORD *)v34 + 3) = 0;
  v35 = v47;
  *((_QWORD *)v34 + 4) = v47;
  v36 = &v34[v31];
  v37 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
  v37(v36, v18, v12);
  v37(&v34[v32], v15, v12);
  v38 = (void (**)(objc_class *, uint64_t))&v34[v33];
  *v38 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray?, @unowned NSError?) -> ();
  v38[1] = (void (*)(objc_class *, uint64_t))v25;
  v39 = v35;
  v40 = v48;
  swift_retain(v25);
  v41 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v44, (uint64_t)&closure #1 in MOWeatherDataProvider.fetchHourlyWeather(for:startDate:endDate:completion:)partial apply, (uint64_t)v34);

  swift_release(v25);
  swift_release(v41);
  v42 = *(void (**)(char *, uint64_t))(v30 + 8);
  v42(v45, v12);
  v42(v46, v12);
}

- (_TtC8momentsd21MOWeatherDataProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MOWeatherDataProvider();
  return -[MOWeatherDataProvider init](&v3, "init");
}

@end
