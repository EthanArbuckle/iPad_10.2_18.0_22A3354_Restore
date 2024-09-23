@implementation ChangeAlarmStatusOperationResolutionResult

+ (id)successWithResolvedChangeAlarmStatusOperation:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static ChangeAlarmStatusOperationResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithChangeAlarmStatusOperationToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static ChangeAlarmStatusOperationResolutionResult.confirmationRequired(with:)(a3);
}

- (ChangeAlarmStatusOperationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v6;
  void *v7;
  ChangeAlarmStatusOperationResolutionResult *v8;
  ChangeAlarmStatusOperationResolutionResult *v9;
  objc_super v11;

  sub_24738A550();
  v6 = a4;
  v7 = (void *)sub_24738A544();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ChangeAlarmStatusOperationResolutionResult();
  v8 = -[ChangeAlarmStatusOperationResolutionResult initWithJSONDictionary:forIntent:](&v11, sel_initWithJSONDictionary_forIntent_, v7, v6);

  v9 = v8;
  if (v9)

  return v9;
}

@end
