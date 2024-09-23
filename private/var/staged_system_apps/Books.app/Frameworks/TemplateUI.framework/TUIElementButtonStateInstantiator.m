@implementation TUIElementButtonStateInstantiator

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementButtonStateInstantiatorObject, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(TUIButtonStateBuilder, a2);
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIStateBuilding;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v8 = a3;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "stringForAttribute:node:", 137, a4.var0));
  v10 = (void *)v9;
  if (v9)
  {
    v12 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    objc_msgSend(v8, "setStates:", v11);

  }
}

+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v10 = a5;
  v11 = a6;
  v12 = a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "states"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_153C6C;
  v17[3] = &unk_242158;
  v19 = v10;
  v20 = v12;
  v18 = v11;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  objc_msgSend(v15, "evaluateStates:block:", v13, v17);

}

@end
