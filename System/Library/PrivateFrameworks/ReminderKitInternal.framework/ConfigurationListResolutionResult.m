@implementation ConfigurationListResolutionResult

+ (id)successWithResolvedConfigurationList:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_1A468F324((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithConfigurationListsToDisambiguate:(id)a3
{
  unint64_t v3;
  id v4;

  type metadata accessor for ConfigurationList();
  v3 = sub_1A4690BA0();
  swift_getObjCClassMetadata();
  v4 = sub_1A468F3B0(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithConfigurationListToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_1A468F538((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result;

  result = (id)sub_1A4691638();
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result;

  result = (id)sub_1A4691638();
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result;

  result = (id)sub_1A4691638();
  __break(1u);
  return result;
}

- (ConfigurationListResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v6;
  void *v7;
  ConfigurationListResolutionResult *v8;
  ConfigurationListResolutionResult *v9;
  objc_super v11;

  sub_1A4690708();
  v6 = a4;
  v7 = (void *)sub_1A46906F0();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ConfigurationListResolutionResult();
  v8 = -[ConfigurationListResolutionResult initWithJSONDictionary:forIntent:](&v11, sel_initWithJSONDictionary_forIntent_, v7, v6);

  v9 = v8;
  if (v9)

  return v9;
}

@end
