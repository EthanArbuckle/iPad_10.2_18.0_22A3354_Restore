@implementation RepeatScheduleResolutionResult

+ (id)successWithResolvedRepeatSchedule:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static RepeatScheduleResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithRepeatScheduleToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static RepeatScheduleResolutionResult.confirmationRequired(with:)(a3);
}

- (RepeatScheduleResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v6;
  void *v7;
  RepeatScheduleResolutionResult *v8;
  RepeatScheduleResolutionResult *v9;
  objc_super v11;

  sub_24738A550();
  v6 = a4;
  v7 = (void *)sub_24738A544();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for RepeatScheduleResolutionResult();
  v8 = -[RepeatScheduleResolutionResult initWithJSONDictionary:forIntent:](&v11, sel_initWithJSONDictionary_forIntent_, v7, v6);

  v9 = v8;
  if (v9)

  return v9;
}

@end
