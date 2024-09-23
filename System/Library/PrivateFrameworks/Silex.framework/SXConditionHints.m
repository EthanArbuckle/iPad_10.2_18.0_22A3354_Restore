@implementation SXConditionHints

+ (id)jsonPropertyNameForObjCPropertyName:(id)a3
{
  id v4;
  __CFString *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("testing")) & 1) != 0)
  {
    v5 = CFSTR("_anf_testing");
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXConditionHints;
    objc_msgSendSuper2(&v7, sel_jsonPropertyNameForObjCPropertyName_, v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (int64_t)ternaryValueForJSONValue:(id)a3 type:(int)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4 == 2)
    return objc_msgSend(a3, "BOOLValue", v4, v5);
  else
    return -1;
}

@end
