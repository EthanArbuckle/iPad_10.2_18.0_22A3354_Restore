@implementation TUIElementButtonCustomContent

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementButtonCustomContentInstantiatorObject, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(TUIBoxBuilder, a2);
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIButtonCustomContentBuilding;
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "finalizeModelsWithParent:box:context:", 0, 0, v7));
  if (objc_msgSend(v8, "count") == (char *)&dword_0 + 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    objc_msgSend(v10, "setModel:", v9);

  }
  else
  {
    objc_msgSend(v7, "reportError:", 1021);
  }

}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "model"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "model"));
    objc_msgSend(v6, "addContentModel:", v8);

  }
}

@end
