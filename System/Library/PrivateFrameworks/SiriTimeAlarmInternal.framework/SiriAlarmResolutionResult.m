@implementation SiriAlarmResolutionResult

+ (id)successWithResolvedSiriAlarm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static SiriAlarmResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithSiriAlarmsToDisambiguate:(id)a3
{
  unint64_t v3;
  id v4;

  type metadata accessor for SiriAlarm();
  v3 = sub_24738A640();
  swift_getObjCClassMetadata();
  v4 = static SiriAlarmResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithSiriAlarmToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static SiriAlarmResolutionResult.confirmationRequired(with:)((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result;

  result = (id)sub_24738A8B0();
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result;

  result = (id)sub_24738A8B0();
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result;

  result = (id)sub_24738A8B0();
  __break(1u);
  return result;
}

- (SiriAlarmResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v6;
  void *v7;
  SiriAlarmResolutionResult *v8;
  SiriAlarmResolutionResult *v9;
  objc_super v11;

  sub_24738A550();
  v6 = a4;
  v7 = (void *)sub_24738A544();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SiriAlarmResolutionResult();
  v8 = -[SiriAlarmResolutionResult initWithJSONDictionary:forIntent:](&v11, sel_initWithJSONDictionary_forIntent_, v7, v6);

  v9 = v8;
  if (v9)

  return v9;
}

@end
