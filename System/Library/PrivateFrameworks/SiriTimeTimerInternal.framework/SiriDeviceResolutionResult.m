@implementation SiriDeviceResolutionResult

+ (id)successWithResolvedSiriDevice:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static SiriDeviceResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithSiriDevicesToDisambiguate:(id)a3
{
  unint64_t v3;
  id v4;

  type metadata accessor for SiriDevice();
  v3 = sub_2473EE4B8();
  swift_getObjCClassMetadata();
  v4 = static SiriDeviceResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithSiriDeviceToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = static SiriDeviceResolutionResult.confirmationRequired(with:)((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result;

  result = (id)sub_2473EE7F4();
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result;

  result = (id)sub_2473EE7F4();
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result;

  result = (id)sub_2473EE7F4();
  __break(1u);
  return result;
}

- (SiriDeviceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v6;
  void *v7;
  SiriDeviceResolutionResult *v8;
  SiriDeviceResolutionResult *v9;
  objc_super v11;

  sub_2473EE404();
  v6 = a4;
  v7 = (void *)sub_2473EE3F8();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SiriDeviceResolutionResult();
  v8 = -[SiriDeviceResolutionResult initWithJSONDictionary:forIntent:](&v11, sel_initWithJSONDictionary_forIntent_, v7, v6);

  v9 = v8;
  if (v9)

  return v9;
}

@end
