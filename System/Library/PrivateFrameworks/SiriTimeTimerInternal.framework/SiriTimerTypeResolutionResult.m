@implementation SiriTimerTypeResolutionResult

+ (id)successWithResolvedSiriTimerType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static SiriTimerTypeResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithSiriTimerTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static SiriTimerTypeResolutionResult.confirmationRequired(with:)(a3);
}

- (SiriTimerTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v6;
  void *v7;
  SiriTimerTypeResolutionResult *v8;
  SiriTimerTypeResolutionResult *v9;
  objc_super v11;

  sub_2473EE404();
  v6 = a4;
  v7 = (void *)sub_2473EE3F8();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SiriTimerTypeResolutionResult();
  v8 = -[SiriTimerTypeResolutionResult initWithJSONDictionary:forIntent:](&v11, sel_initWithJSONDictionary_forIntent_, v7, v6);

  v9 = v8;
  if (v9)

  return v9;
}

@end
