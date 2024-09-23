@implementation WFTimeZonePickerParameterState

+ (id)serializedRepresentationFromValue:(id)a3
{
  if (!a3)
    return 0;
  +[MTLJSONAdapter JSONDictionaryFromModel:error:](WFPropertyListJSONAdapter, "JSONDictionaryFromModel:error:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  +[MTLJSONAdapter modelOfClass:fromJSONDictionary:error:](WFPropertyListJSONAdapter, "modelOfClass:fromJSONDictionary:error:", objc_opt_class(), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end
