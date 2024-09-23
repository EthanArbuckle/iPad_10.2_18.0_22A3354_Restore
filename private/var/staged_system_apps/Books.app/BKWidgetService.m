@implementation BKWidgetService

+ (BOOL)hasWidgetConfigurations
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  void *v5;
  id v6;
  _BYTE v8[24];

  if (qword_1009CE220 != -1)
    swift_once(&qword_1009CE220, sub_10001360C);
  swift_beginAccess(&qword_1009DE790, v8, 0, 0);
  v2 = qword_1009DE790;
  v3 = *(_QWORD *)algn_1009DE798;
  v4 = byte_1009DE7A0;
  v5 = (void *)qword_1009DE7A8;
  swift_bridgeObjectRetain(*(_QWORD *)algn_1009DE798);
  v6 = v5;
  LOBYTE(v2) = sub_100050860(v2, v3, v4, v6);

  swift_bridgeObjectRelease(v3);
  return v2 & 1;
}

- (BKWidgetService)init
{
  BKWidgetService *result;

  result = (BKWidgetService *)_swift_stdlib_reportUnimplementedInitializer("Books.WidgetService", 19, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKWidgetService__setupState));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKWidgetService_cancellables));
  sub_10002AD00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKWidgetService_onWidgetConfigurationChangeCallback), *(_QWORD *)&self->_setupState[OBJC_IVAR___BKWidgetService_onWidgetConfigurationChangeCallback]);
}

@end
