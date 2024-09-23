@implementation DeleteAlarmAlarmsResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static DeleteAlarmAlarmsResolutionResult.unsupported(forReason:)(a3);
}

- (DeleteAlarmAlarmsResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v6;
  void *v7;
  DeleteAlarmAlarmsResolutionResult *v8;
  DeleteAlarmAlarmsResolutionResult *v9;
  objc_super v11;

  sub_24738A550();
  v6 = a4;
  v7 = (void *)sub_24738A544();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DeleteAlarmAlarmsResolutionResult();
  v8 = -[SiriAlarmResolutionResult initWithJSONDictionary:forIntent:](&v11, sel_initWithJSONDictionary_forIntent_, v7, v6);

  v9 = v8;
  if (v9)

  return v9;
}

@end
