@implementation STUsageDetailsSelection

+ (_TtC20ScreenTimeSettingsUI23STUsageDetailsSelection)shared
{
  if (qword_2550ACFF0 != -1)
    swift_once();
  return (_TtC20ScreenTimeSettingsUI23STUsageDetailsSelection *)(id)qword_2550AD8E0;
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR____TtC20ScreenTimeSettingsUI23STUsageDetailsSelection_userDefaults));
}

- (NSString)deviceIdentifierForLocalUser
{
  void *v2;
  _TtC20ScreenTimeSettingsUI23STUsageDetailsSelection *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20ScreenTimeSettingsUI23STUsageDetailsSelection_userDefaults);
  v3 = self;
  v4 = (void *)sub_219B99CDC();
  v5 = objc_msgSend(v2, sel_stringForKey_, v4);

  if (v5)
  {
    sub_219B99CF4();

    v6 = (void *)sub_219B99CDC();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setDeviceIdentifierForLocalUser:(id)a3
{
  void *v4;
  _TtC20ScreenTimeSettingsUI23STUsageDetailsSelection *v5;
  uint64_t v6;
  _TtC20ScreenTimeSettingsUI23STUsageDetailsSelection *v7;
  id v8;

  if (a3)
  {
    sub_219B99CF4();
    v4 = *(Class *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC20ScreenTimeSettingsUI23STUsageDetailsSelection_userDefaults);
    v5 = self;
    v6 = sub_219B99CDC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = *(Class *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC20ScreenTimeSettingsUI23STUsageDetailsSelection_userDefaults);
    v7 = self;
    v6 = 0;
  }
  v8 = (id)sub_219B99CDC();
  objc_msgSend(v4, sel_setObject_forKey_, v6, v8);

  swift_unknownObjectRelease();
}

- (NSNumber)usageReportTypeForLocalUser
{
  _TtC20ScreenTimeSettingsUI23STUsageDetailsSelection *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_219B7650C();

  return (NSNumber *)v3;
}

- (void)setUsageReportTypeForLocalUser:(id)a3
{
  void *v4;
  id v5;
  _TtC20ScreenTimeSettingsUI23STUsageDetailsSelection *v6;
  id v7;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20ScreenTimeSettingsUI23STUsageDetailsSelection_userDefaults);
  v5 = a3;
  v6 = self;
  v7 = (id)sub_219B99CDC();
  objc_msgSend(v4, sel_setObject_forKey_, v5, v7);

}

- (id)deviceIdentifierForChildUserDSID:(id)a3
{
  id v4;
  _TtC20ScreenTimeSettingsUI23STUsageDetailsSelection *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = self;
  sub_219B768FC(v4);
  v7 = v6;

  if (v7)
  {
    v8 = (void *)sub_219B99CDC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)setDeviceIdentifierTo:(id)a3 forChildUserDSID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC20ScreenTimeSettingsUI23STUsageDetailsSelection *v10;

  if (a3)
  {
    v6 = sub_219B99CF4();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a4;
  v10 = self;
  sub_219B76B88(v6, v8, v9);

  swift_bridgeObjectRelease();
}

- (id)observeDeviceIdentifierChangesForChildUserDSID:(id)a3 onChange:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC20ScreenTimeSettingsUI23STUsageDetailsSelection *v9;
  id v10;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  v10 = sub_219B76ED0(v8, (uint64_t)sub_219B78ADC, v7);

  swift_release();
  return v10;
}

- (id)usageReportTypeForChildUserDSID:(id)a3
{
  id v4;
  _TtC20ScreenTimeSettingsUI23STUsageDetailsSelection *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_219B77854(v4);

  return v6;
}

- (void)setUsageReportTypeTo:(id)a3 forChildUserDSID:(id)a4
{
  id v7;
  id v8;
  _TtC20ScreenTimeSettingsUI23STUsageDetailsSelection *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_219B77A84(a3, v8);

}

- (_TtC20ScreenTimeSettingsUI23STUsageDetailsSelection)init
{
  _TtC20ScreenTimeSettingsUI23STUsageDetailsSelection *result;

  result = (_TtC20ScreenTimeSettingsUI23STUsageDetailsSelection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI23STUsageDetailsSelection_logger;
  v4 = sub_219B99610();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20ScreenTimeSettingsUI23STUsageDetailsSelection_userDefaults));
  swift_unknownObjectRelease();
  sub_219B78AE4(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC20ScreenTimeSettingsUI23STUsageDetailsSelection____lazy_storage___localUserDSID));
}

@end
