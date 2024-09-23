@implementation UpdateAlarmOperationResolutionResult

+ (id)successWithResolvedUpdateAlarmOperation:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static UpdateAlarmOperationResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithUpdateAlarmOperationToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static UpdateAlarmOperationResolutionResult.confirmationRequired(with:)(a3);
}

- (UpdateAlarmOperationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v6;
  void *v7;
  UpdateAlarmOperationResolutionResult *v8;
  UpdateAlarmOperationResolutionResult *v9;
  objc_super v11;

  sub_24738A550();
  v6 = a4;
  v7 = (void *)sub_24738A544();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for UpdateAlarmOperationResolutionResult();
  v8 = -[UpdateAlarmOperationResolutionResult initWithJSONDictionary:forIntent:](&v11, sel_initWithJSONDictionary_forIntent_, v7, v6);

  v9 = v8;
  if (v9)

  return v9;
}

@end
