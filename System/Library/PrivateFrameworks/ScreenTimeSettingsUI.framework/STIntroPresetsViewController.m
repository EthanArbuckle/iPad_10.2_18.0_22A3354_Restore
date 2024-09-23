@implementation STIntroPresetsViewController

- (_TtC20ScreenTimeSettingsUI28STIntroPresetsViewController)initWithIntroductionModel:(id)a3 settingsPresetViewModel:(id)a4 name:(id)a5 updateExistingSettings:(BOOL)a6 onContinue:(id)a7
{
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v10 = _Block_copy(a7);
  v11 = sub_219B99CF4();
  v13 = v12;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v10;
  swift_unknownObjectRetain();
  return (_TtC20ScreenTimeSettingsUI28STIntroPresetsViewController *)STIntroPresetsViewController.init(introductionModel:settingsPresetViewModel:name:updateExistingSettings:onContinue:)((uint64_t)a3, a4, v11, v13, a6, (uint64_t)sub_219B7E5EC, v14);
}

- (void)viewDidLoad
{
  _TtC20ScreenTimeSettingsUI28STIntroPresetsViewController *v2;

  v2 = self;
  sub_219B7D264();

}

- (void)continue
{
  _TtC20ScreenTimeSettingsUI28STIntroPresetsViewController *v2;

  v2 = self;
  sub_219B7DAFC();

}

- (void)notNow
{
  _TtC20ScreenTimeSettingsUI28STIntroPresetsViewController *v2;

  v2 = self;
  sub_219B7DC24();

}

- (_TtC20ScreenTimeSettingsUI28STIntroPresetsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC20ScreenTimeSettingsUI28STIntroPresetsViewController *result;

  result = (_TtC20ScreenTimeSettingsUI28STIntroPresetsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC20ScreenTimeSettingsUI28STIntroPresetsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC20ScreenTimeSettingsUI28STIntroPresetsViewController *result;

  v6 = a5;
  result = (_TtC20ScreenTimeSettingsUI28STIntroPresetsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ScreenTimeSettingsUI28STIntroPresetsViewController_settingsPresetViewModel));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ScreenTimeSettingsUI28STIntroPresetsViewController_presetsVC));
}

@end
