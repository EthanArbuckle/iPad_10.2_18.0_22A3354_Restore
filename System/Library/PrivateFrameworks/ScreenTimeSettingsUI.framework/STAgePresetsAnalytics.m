@implementation STAgePresetsAnalytics

- (_TtC20ScreenTimeSettingsUI21STAgePresetsAnalytics)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  char *v11;
  uint64_t *v12;
  _TtC20ScreenTimeSettingsUI21STAgePresetsAnalytics *v13;
  objc_super v15;

  v2 = sub_219B992E0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_219B992D4();
  v7 = sub_219B992C8();
  v9 = v8;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  v10 = (objc_class *)type metadata accessor for STAgePresetsAnalytics();
  v11 = (char *)objc_allocWithZone(v10);
  v12 = (uint64_t *)&v11[OBJC_IVAR____TtC20ScreenTimeSettingsUI21STAgePresetsAnalytics_sessionId];
  *v12 = v7;
  v12[1] = v9;
  v15.receiver = v11;
  v15.super_class = v10;
  v13 = -[STAgePresetsAnalytics init](&v15, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v13;
}

- (void)sendPresetsViewedAnalyticsEventWithIsInitialSetup:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  _TtC20ScreenTimeSettingsUI21STAgePresetsAnalytics *v6;
  void *v7;
  id v8;

  v3 = a3;
  v5 = objc_allocWithZone(MEMORY[0x24BE844B0]);
  v6 = self;
  swift_bridgeObjectRetain();
  v7 = (void *)sub_219B99CDC();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v5, sel_initWithSessionId_isInitialSetup_, v7, v3);

  objc_msgSend((id)objc_opt_self(), sel_reportEvent_, v8);
}

- (void)sendSelectedAgeRangeAnalyticsEventWithLowerBound:(int64_t)a3 upperBound:(int64_t)a4
{
  id v7;
  _TtC20ScreenTimeSettingsUI21STAgePresetsAnalytics *v8;
  void *v9;
  id v10;

  v7 = objc_allocWithZone(MEMORY[0x24BE845F0]);
  v8 = self;
  swift_bridgeObjectRetain();
  v9 = (void *)sub_219B99CDC();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v7, sel_initWithSessionId_lowerBoundAgeRange_upperBoundAgeRange_, v9, a3, a4);

  objc_msgSend((id)objc_opt_self(), sel_reportEvent_, v10);
}

- (void)sendChooseAgeButtonTappedAnalyticsEvent
{
  sub_219B9424C(self, (uint64_t)a2, (Class *)0x24BE845F8);
}

- (void)sendResetAgePresetSelectedAnalyticsEvent
{
  sub_219B9424C(self, (uint64_t)a2, (Class *)0x24BE844A0);
}

- (void)sendSkippedAnalyticsEvent
{
  sub_219B9424C(self, (uint64_t)a2, (Class *)0x24BE844A8);
}

- (void)sendEnabledRestrictionsEventWithSelectionType:(int64_t)a3 lowerBound:(id)a4 upperBound:(id)a5
{
  id v9;
  id v10;
  id v11;
  _TtC20ScreenTimeSettingsUI21STAgePresetsAnalytics *v12;
  void *v13;
  id v14;

  v9 = objc_allocWithZone(MEMORY[0x24BE84600]);
  v10 = a4;
  v11 = a5;
  v12 = self;
  swift_bridgeObjectRetain();
  v13 = (void *)sub_219B99CDC();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v9, sel_initWithSessionId_selectionType_lowerBoundAgeRange_upperBoundAgeRange_, v13, a3, v10, v11);

  objc_msgSend((id)objc_opt_self(), sel_reportEvent_, v14);
}

- (void)sendPresetsValueChangedAnalyticsEventWithRecommendedPresetId:(id)a3 fieldName:(id)a4 recomendedValue:(id)a5 selectedValue:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _TtC20ScreenTimeSettingsUI21STAgePresetsAnalytics *v15;
  _TtC20ScreenTimeSettingsUI21STAgePresetsAnalytics *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  _QWORD v21[4];
  _OWORD v22[2];
  _OWORD v23[2];

  if (a3)
  {
    v9 = sub_219B99CF4();
    v11 = v10;
  }
  else
  {
    v9 = 0;
    v11 = 0;
  }
  v12 = sub_219B99CF4();
  v14 = v13;
  if (!a5)
  {
    memset(v23, 0, sizeof(v23));
    swift_unknownObjectRetain();
    v16 = self;
    if (a6)
      goto LABEL_6;
LABEL_8:
    memset(v22, 0, sizeof(v22));
    goto LABEL_9;
  }
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v15 = self;
  sub_219B99EBC();
  swift_unknownObjectRelease();
  if (!a6)
    goto LABEL_8;
LABEL_6:
  sub_219B99EBC();
  swift_unknownObjectRelease();
LABEL_9:
  v17 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC20ScreenTimeSettingsUI21STAgePresetsAnalytics_sessionId);
  v18 = *(_QWORD *)&self->sessionId[OBJC_IVAR____TtC20ScreenTimeSettingsUI21STAgePresetsAnalytics_sessionId];
  sub_219B899BC((uint64_t)v23, (uint64_t)v21);
  sub_219B899BC((uint64_t)v22, (uint64_t)v20);
  objc_allocWithZone(MEMORY[0x24BE84608]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v19 = sub_219B94798(v17, v18, v9, v11, v12, v14, v21, v20);
  objc_msgSend((id)objc_opt_self(), sel_reportEvent_, v19);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_219B94A80((uint64_t)v22);
  sub_219B94A80((uint64_t)v23);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
