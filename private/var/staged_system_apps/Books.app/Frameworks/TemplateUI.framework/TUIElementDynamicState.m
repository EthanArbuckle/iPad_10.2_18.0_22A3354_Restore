@implementation TUIElementDynamicState

+ (id)supportedAttributes
{
  if (qword_2CB2C0 != -1)
    dispatch_once(&qword_2CB2C0, &stru_23E6D0);
  return (id)qword_2CB2B8;
}

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementDynamicStateObject, a2);
}

+ (id)builderProtocols
{
  __objc2_prot *v3;

  v3 = &OBJC_PROTOCOL___TUIBoxBuilding;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIBoxBuilding;
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2CB2D0 != -1)
    dispatch_once(&qword_2CB2D0, &stru_23E6F0);
  return (id)qword_2CB2C8;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  var0 = a4.var0;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "setBinding:", objc_msgSend(v8, "bindingNameForAttribute:node:", 36, var0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 116, var0));
  objc_msgSend(v9, "setKind:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForAttribute:node:", 113, var0));
  objc_msgSend(v9, "setInstance:", v11);

  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForAttribute:node:", 150, var0));
  objc_msgSend(v9, "setParameters:", v12);

}

+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a5;
  v10 = a6;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kind"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "instance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "parameters"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dynamicStateForKind:instance:parameters:", v12, v13, v14));

  LODWORD(v12) = objc_msgSend(v11, "binding");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "instantiateBinding:withDynamicProvider:childrenOfNode:", v12, v15, a3.var0));

  if (v16)
    objc_msgSend(v17, "addModel:", v16);

}

@end
