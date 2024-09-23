@implementation PersonTypeResolutionResult

+ (id)successWithResolvedPersonType:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_1C0746798((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithPersonTypesToDisambiguate:(id)a3
{
  unint64_t v3;
  id v4;

  type metadata accessor for PersonType();
  v3 = sub_1C0747B1C();
  swift_getObjCClassMetadata();
  v4 = sub_1C0746824(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithPersonTypeToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_1C07469AC((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result;

  result = (id)sub_1C074811C();
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result;

  result = (id)sub_1C074811C();
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result;

  result = (id)sub_1C074811C();
  __break(1u);
  return result;
}

- (PersonTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v6;
  void *v7;
  PersonTypeResolutionResult *v8;
  PersonTypeResolutionResult *v9;
  objc_super v11;

  sub_1C07477EC();
  v6 = a4;
  v7 = (void *)sub_1C07477E0();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PersonTypeResolutionResult();
  v8 = -[PersonTypeResolutionResult initWithJSONDictionary:forIntent:](&v11, sel_initWithJSONDictionary_forIntent_, v7, v6);

  v9 = v8;
  if (v9)

  return v9;
}

@end
