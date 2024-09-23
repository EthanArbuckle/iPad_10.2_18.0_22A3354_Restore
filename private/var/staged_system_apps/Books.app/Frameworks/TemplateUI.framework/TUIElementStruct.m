@implementation TUIElementStruct

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementStructBuilder, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementStructBuilder, a2);
}

+ (id)requiredBuilderProtocol
{
  return 0;
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2CB4A0 != -1)
    dispatch_once(&qword_2CB4A0, &stru_23FE50);
  return (id)qword_2CB498;
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8;
  id v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  _TUIElementStructBuilder *v13;

  v8 = a5;
  v9 = a6;
  v10 = objc_msgSend(v8, "constantNameForAttribute:node:", 137, a3.var0);
  v11 = objc_msgSend(v8, "closureForNode:", a3.var0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "structForAttribute:node:", 32, a3.var0));
  v13 = -[_TUIElementStructBuilder initWithName:closure:basedOn:context:]([_TUIElementStructBuilder alloc], "initWithName:closure:basedOn:context:", v10, v11, v12, v9);

  return v13;
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeStruct"));
  objc_msgSend(v6, "defineStruct:withName:", v7, objc_msgSend(v8, "name"));

}

@end
