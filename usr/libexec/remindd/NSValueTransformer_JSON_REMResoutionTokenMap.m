@implementation NSValueTransformer_JSON_REMResoutionTokenMap

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class(REMResolutionTokenMap, a2);
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_opt_class(REMResolutionTokenMap);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objc_toJSONString"));
    v6 = v5;
    if (v5)
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:", 4));
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  id v7;
  id v8;
  void *v9;

  v3 = a3;
  v4 = objc_opt_self(NSData);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = v3;
    if (objc_msgSend(v7, "length"))
    {
      v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v7, 4);
      if (v8)
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[REMResolutionTokenMap objc_newObjectFromJSONString:](REMResolutionTokenMap, "objc_newObjectFromJSONString:", v8));
      else
        v9 = 0;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
