@implementation TUIElementTextSpanInstantiator

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementTextStyleObject, a2);
}

+ (id)builderProtocols
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUITextModelBuilding;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "setStyle:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fontSpecForNode:", a4.var0));
  objc_msgSend(v9, "setFontSpec:", v10);

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", 51, a4.var0));
  objc_msgSend(v9, "setColor:", v11);

}

+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v14 = a4;
  v9 = a5;
  v10 = a7;
  if ((objc_msgSend(v9, "options") & 2) != 0)
  {
    v11 = objc_msgSend(v14, "style");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "color"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fontSpec"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_5D5FC;
    v15[3] = &unk_23E5A8;
    v17 = v10;
    v16 = v9;
    objc_msgSend(v16, "appendWithStyle:color:fontSpec:block:", v11, v12, v13, v15);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v10 + 2))(v10, v9, 0);
  }

}

@end
