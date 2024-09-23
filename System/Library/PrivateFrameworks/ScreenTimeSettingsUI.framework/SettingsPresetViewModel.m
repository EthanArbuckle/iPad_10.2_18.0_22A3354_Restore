@implementation SettingsPresetViewModel

- (_TtC20ScreenTimeSettingsUI23SettingsPresetViewModel)initWithDsid:(id)a3 childAge:(id)a4 isInitialSetup:(BOOL)a5 restrictionsToPresetMappingViewModel:(id)a6 restrictionsDataSource:(id)a7 agePresetsAnalytics:(id)a8
{
  _BOOL4 v11;
  id v13;
  id v14;
  _TtC20ScreenTimeSettingsUI23SettingsPresetViewModel *v15;

  v11 = a5;
  v13 = a3;
  v14 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v15 = (_TtC20ScreenTimeSettingsUI23SettingsPresetViewModel *)sub_219B89248(v13, a4, v11, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v15;
}

- (void)loadWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _TtC20ScreenTimeSettingsUI23SettingsPresetViewModel *v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550AD270);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = self;
  v11 = sub_219B99E14();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2550ADCB8;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2550ADCC8;
  v13[5] = v12;
  v14 = self;
  sub_219B845D8((uint64_t)v8, (uint64_t)&unk_2550ADCD8, (uint64_t)v13);
  swift_release();
}

- (_TtC20ScreenTimeSettingsUI23SettingsPresetViewModel)init
{
  _TtC20ScreenTimeSettingsUI23SettingsPresetViewModel *result;

  result = (_TtC20ScreenTimeSettingsUI23SettingsPresetViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI23SettingsPresetViewModel__availablePresets;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550ADCF0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI23SettingsPresetViewModel__ratings;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550ADCF8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI23SettingsPresetViewModel__selectedPresetIndex;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550ADD00);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI23SettingsPresetViewModel__restrictions;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550ADD08);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI23SettingsPresetViewModel__showLoadingIndicator;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550ADD10);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
}

@end
