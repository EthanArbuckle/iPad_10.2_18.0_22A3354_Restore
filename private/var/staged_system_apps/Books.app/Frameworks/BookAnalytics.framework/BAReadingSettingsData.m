@implementation BAReadingSettingsData

- (BAReadingSettingsData)initWithScrollViewStatus:(int64_t)a3 autoNightThemeStatus:(int64_t)a4 backgroundColor:(int64_t)a5 font:(id)a6 fontSize:(id)a7 brightnessLevel:(id)a8
{
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  id v17;
  id v18;
  objc_super v20;

  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6, a2);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAReadingSettingsData_scrollViewStatus) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAReadingSettingsData_autoNightThemeStatus) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAReadingSettingsData_backgroundColor) = (Class)a5;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___BAReadingSettingsData_font);
  *v15 = v14;
  v15[1] = v16;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAReadingSettingsData_fontSize) = (Class)a7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAReadingSettingsData_brightnessLevel) = (Class)a8;
  v20.receiver = self;
  v20.super_class = (Class)type metadata accessor for BridgedReadingSettingsData();
  v17 = a7;
  v18 = a8;
  return -[BAReadingSettingsData init](&v20, "init");
}

- (BAReadingSettingsData)init
{
  BAReadingSettingsData *result;

  result = (BAReadingSettingsData *)_swift_stdlib_reportUnimplementedInitializer("BookAnalytics.BridgedReadingSettingsData", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->scrollViewStatus[OBJC_IVAR___BAReadingSettingsData_font]);

}

@end
