@implementation BAWidgetData

- (BAWidgetData)initWithWidgetFamily:(id)a3 displayMode:(id)a4 isContentExposed:(BOOL)a5 isStreakExposed:(BOOL)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  objc_super v18;

  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v12 = v11;
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, v11);
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___BAWidgetData_widgetFamily);
  *v14 = v10;
  v14[1] = v12;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___BAWidgetData_displayMode);
  *v15 = v13;
  v15[1] = v16;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___BAWidgetData_isContentExposed) = a5;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___BAWidgetData_isStreakExposed) = a6;
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for BridgedWidgetData();
  return -[BAWidgetData init](&v18, "init");
}

- (BAWidgetData)init
{
  BAWidgetData *result;

  result = (BAWidgetData *)_swift_stdlib_reportUnimplementedInitializer("BookAnalytics.BridgedWidgetData", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_B2BF0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BAWidgetData_widgetFamily, &OBJC_IVAR___BAWidgetData_displayMode);
}

@end
