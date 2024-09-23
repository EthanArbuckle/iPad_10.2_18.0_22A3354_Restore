@implementation SXWebContentComponent

+ (id)typeString
{
  return CFSTR("webcontent");
}

- (unint64_t)traits
{
  return 32;
}

+ (id)jsonPropertyNameForObjCPropertyName:(id)a3
{
  id v4;
  __CFString *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("dataSourceReferences")) & 1) != 0)
  {
    v5 = CFSTR("dataSources");
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXWebContentComponent;
    objc_msgSendSuper2(&v7, sel_jsonPropertyNameForObjCPropertyName_, v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("dataSourceReferences")) & 1) != 0)
  {
    v5 = &__block_literal_global_21;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXWebContentComponent;
    objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __60__SXWebContentComponent_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

@end
