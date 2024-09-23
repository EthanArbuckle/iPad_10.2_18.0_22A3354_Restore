@implementation TUIElementStructStruct

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementStructStructBuilder, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementStructStructBuilder, a2);
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIStructBuilding;
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2CB4B0 != -1)
    dispatch_once(&qword_2CB4B0, &stru_23FE70);
  return (id)qword_2CB4A8;
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8;
  id v9;
  unsigned __int16 v10;
  unsigned int v11;
  void *v12;
  _TUIElementStructStructBuilder *v13;

  v8 = a5;
  v9 = a6;
  v10 = (unsigned __int16)objc_msgSend(v8, "propertyNameForAttribute:node:", 137, a3.var0);
  v11 = objc_msgSend(v8, "closureForNode:", a3.var0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "structForAttribute:node:", 32, a3.var0));
  v13 = -[_TUIElementStructStructBuilder initWithName:closure:basedOn:context:]([_TUIElementStructStructBuilder alloc], "initWithName:closure:basedOn:context:", v10, v11, v12, v9);

  return v13;
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeStruct"));
  objc_msgSend(v6, "setStructValue:forKey:", v7, (unsigned __int16)objc_msgSend(v8, "name"));

}

@end
