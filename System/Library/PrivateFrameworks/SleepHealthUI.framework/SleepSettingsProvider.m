@implementation SleepSettingsProvider

- (void)dealloc
{
  void *v2;
  _TtC13SleepHealthUI21SleepSettingsProvider *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SleepHealthUI21SleepSettingsProvider_sleepStore);
  v3 = self;
  objc_msgSend(v2, sel_removeObserver_, v3);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for SleepSettingsProvider();
  -[SleepSettingsProvider dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_release();
  swift_release();
}

- (_TtC13SleepHealthUI21SleepSettingsProvider)init
{
  _TtC13SleepHealthUI21SleepSettingsProvider *result;

  result = (_TtC13SleepHealthUI21SleepSettingsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4
{
  id v6;
  id v7;
  _TtC13SleepHealthUI21SleepSettingsProvider *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1A9BE1C90(v7);

}

- (void)sleepStore:(id)a3 sleepFocusConfigurationDidUpdate:(id)a4
{
  id v6;
  id v7;
  _TtC13SleepHealthUI21SleepSettingsProvider *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1A9BE20D4(v7);

}

@end
