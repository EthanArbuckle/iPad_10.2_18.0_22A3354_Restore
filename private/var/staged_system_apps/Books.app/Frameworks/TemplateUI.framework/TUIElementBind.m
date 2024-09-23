@implementation TUIElementBind

+ (id)supportedAttributes
{
  if (qword_2CBAF0 != -1)
    dispatch_once(&qword_2CBAF0, &stru_2434B8);
  return (id)qword_2CBAE8;
}

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementBindObject, a2);
}

+ (id)builderProtocols
{
  return 0;
}

+ (id)requiredBuilderProtocols
{
  return 0;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  var0 = a4.var0;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "setSelect:", objc_msgSend(v8, "enumeratorWithAttribute:node:", 183, var0));
  v10 = objc_msgSend(v8, "unsignedIntegerForAttribute:withDefault:node:", 85, 0x7FFFFFFFFFFFFFFFLL, var0);
  v11 = objc_msgSend(v8, "unsignedIntegerForAttribute:withDefault:node:", 83, 0x7FFFFFFFFFFFFFFFLL, var0);
  v12 = objc_msgSend(v8, "unsignedIntegerForAttribute:withDefault:node:", 82, 0x7FFFFFFFFFFFFFFFLL, var0);
  v13 = objc_msgSend(v8, "unsignedIntegerForAttribute:withDefault:node:", 84, 0x7FFFFFFFFFFFFFFFLL, var0);
  LODWORD(var0) = objc_msgSend(v8, "unconditionalValueForAttribute:node:", 70, var0);

  v14 = (id)objc_claimAutoreleasedReturnValue(+[TUIDynamicInstantiateOptions optionsWithFetchWindow:fetchInitial:fetchDelta:fetchPadding:uniqueID:](TUIDynamicInstantiateOptions, "optionsWithFetchWindow:fetchInitial:fetchDelta:fetchPadding:uniqueID:", v10, v11, v12, v13, var0));
  objc_msgSend(v9, "setOptions:", v14);

}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2CBB00 != -1)
    dispatch_once(&qword_2CBB00, &stru_2434D8);
  return (id)qword_2CBAF8;
}

+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a5;
  v10 = a6;
  v11 = a4;
  LODWORD(a4) = objc_msgSend(v11, "select");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "options"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "instantiateEnumerator:withChildrenOfNode:options:", a4, a3.var0, v12));
  if (v13)
    objc_msgSend(v14, "addModel:", v13);

}

@end
