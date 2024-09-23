@implementation SiriTargetMatchTypeResolutionResult

+ (id)successWithResolvedSiriTargetMatchType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static SiriTargetMatchTypeResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithSiriTargetMatchTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return static SiriTargetMatchTypeResolutionResult.confirmationRequired(with:)(a3);
}

- (SiriTargetMatchTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v6;
  void *v7;
  SiriTargetMatchTypeResolutionResult *v8;
  SiriTargetMatchTypeResolutionResult *v9;
  objc_super v11;

  sub_2473EE404();
  v6 = a4;
  v7 = (void *)sub_2473EE3F8();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SiriTargetMatchTypeResolutionResult();
  v8 = -[SiriTargetMatchTypeResolutionResult initWithJSONDictionary:forIntent:](&v11, sel_initWithJSONDictionary_forIntent_, v7, v6);

  v9 = v8;
  if (v9)

  return v9;
}

@end
