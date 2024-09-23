@implementation TUIElementTextAInstantiator

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementTextAObject, a2);
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUITextModelBuilding;
}

+ (id)builderProtocols
{
  return 0;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v14;

  v10 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___TUIElementTextAInstantiator;
  v11 = a5;
  objc_msgSendSuper2(&v14, "configureObject:withNode:attributes:context:", v10, a4.var0, v11, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringForAttribute:node:", 103, a4.var0, v14.receiver, v14.super_class));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v12));
    objc_msgSend(v10, "setUrl:", v13);

  }
  else
  {
    objc_msgSend(v10, "setUrl:", 0);
  }

}

+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  objc_super v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  unsigned int var0;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "url"));
  if (v16
    && (v17 = (void *)v16, v18 = objc_msgSend(v13, "options"), v17, (v18 & 2) != 0))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "url"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_5D8B4;
    v21[3] = &unk_23F160;
    var0 = a3.var0;
    v22 = v12;
    v23 = v13;
    v24 = v14;
    v25 = v15;
    v26 = a1;
    objc_msgSend(v23, "appendHyperlinkWithURL:block:", v19, v21);

  }
  else
  {
    v20.receiver = a1;
    v20.super_class = (Class)&OBJC_METACLASS___TUIElementTextAInstantiator;
    objc_msgSendSuper2(&v20, "instantiateChildrenOfNode:object:containingBuilder:context:block:", a3.var0, v12, v13, v14, v15);
  }

}

@end
