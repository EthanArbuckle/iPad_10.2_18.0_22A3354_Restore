@implementation TUIElementGroup

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(TUIBoxBuilder, a2);
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIBoxBuilding;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIGroupModel, a2);
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = *(_QWORD *)&a4.var0;
  v14 = a3;
  v8 = a5;
  v9 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 96, v7));
  objc_msgSend(v14, "setHalign:", +[TUIBox halignFromString:](TUIBox, "halignFromString:", v10));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 216, v7));
  objc_msgSend(v14, "setValign:", +[TUIBox valignFromString:](TUIBox, "valignFromString:", v11));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForAttribute:node:", 104, v7));
  if (v12)
  {
    objc_msgSend(v14, "setIdentifier:", v12);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v7));
    objc_msgSend(v14, "setIdentifier:", v13);

  }
  objc_msgSend(v14, "setSpan:", objc_msgSend(v8, "unsignedIntegerForAttribute:withDefault:node:", 194, 1, v9));

}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  objc_msgSend(a4, "finalizeModelsWithParent:context:", a3, a5);
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  objc_msgSend(a4, "addModel:", a3);
}

@end
