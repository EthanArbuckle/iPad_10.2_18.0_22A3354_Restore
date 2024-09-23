@implementation CreateAlarmSuccessCodeResolutionResult

+ (id)successWithResolvedCreateAlarmSuccessCode:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static CreateAlarmSuccessCodeResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithCreateAlarmSuccessCodeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static CreateAlarmSuccessCodeResolutionResult.confirmationRequired(with:)(a3);
}

- (CreateAlarmSuccessCodeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v6;
  void *v7;
  CreateAlarmSuccessCodeResolutionResult *v8;
  CreateAlarmSuccessCodeResolutionResult *v9;
  objc_super v11;

  sub_24738A550();
  v6 = a4;
  v7 = (void *)sub_24738A544();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for CreateAlarmSuccessCodeResolutionResult();
  v8 = -[CreateAlarmSuccessCodeResolutionResult initWithJSONDictionary:forIntent:](&v11, sel_initWithJSONDictionary_forIntent_, v7, v6);

  v9 = v8;
  if (v9)

  return v9;
}

@end
