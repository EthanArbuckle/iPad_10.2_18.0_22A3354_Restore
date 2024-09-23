@implementation ActionParameterResolutionResult

+ (id)successWithResolvedActionParameter:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_213B4BBAC((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithActionParametersToDisambiguate:(id)a3
{
  unint64_t v3;
  id v4;

  type metadata accessor for ActionParameter();
  v3 = sub_213B4D6D4();
  swift_getObjCClassMetadata();
  v4 = sub_213B4BC38(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithActionParameterToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_213B4BD84((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result;

  result = (id)sub_213B4D6E0();
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result;

  result = (id)sub_213B4D6E0();
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result;

  result = (id)sub_213B4D6E0();
  __break(1u);
  return result;
}

@end
