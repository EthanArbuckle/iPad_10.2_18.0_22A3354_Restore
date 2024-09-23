@implementation TUIElementTextDropCapInstantiator

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementTextDropCapObject, a2);
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
  uint64_t var0;
  id v9;
  id v10;
  void *v11;
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___TUIElementTextDropCapInstantiator;
  var0 = a4.var0;
  v9 = a5;
  v10 = a3;
  objc_msgSendSuper2(&v12, "configureObject:withNode:attributes:context:", v10, var0, v9, a6);
  objc_msgSend(v10, "setCharCount:", objc_msgSend(v9, "unsignedIntegerForAttribute:withDefault:node:", 48, 0x7FFFFFFFFFFFFFFFLL, var0, v12.receiver, v12.super_class));
  objc_msgSend(v10, "setLines:", objc_msgSend(v9, "unsignedIntegerForAttribute:withDefault:node:", 123, 2, var0));
  objc_msgSend(v10, "setRaised:", objc_msgSend(v9, "unsignedIntegerForAttribute:withDefault:node:", 161, 0, var0));
  objc_msgSend(v9, "floatForAttribute:node:", 147, var0);
  objc_msgSend(v10, "setPadding:");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorForAttribute:node:", 30, var0));

  objc_msgSend(v10, "setBackgroundColor:", v11);
}

+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  unsigned int var0;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v12, "ensureParagraphBoundaryWithBuilder:", v13);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_5DD80;
  v22[3] = &unk_23F160;
  var0 = a3.var0;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v27 = a1;
  v16 = v15;
  v17 = v14;
  v18 = v13;
  v21 = v12;
  objc_msgSend(v18, "appendWithBlock:", v22);
  if (v19 <= 1)
    v20 = 1;
  else
    v20 = v19;
  objc_msgSend(v21, "setCharCount:", v20);

}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v6;
  char v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  objc_msgSend(v16, "ensureParagraphBoundaryWithBuilder:", v6);
  v7 = objc_opt_respondsToSelector(v6, "configureDropCapWithCount:lines:raised:style:color:fontSpec:backgroundColor:padding:");
  v8 = objc_msgSend(v16, "charCount");
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
    v9 = 1;
  else
    v9 = (uint64_t)v8;
  if ((v7 & 1) != 0 && v9)
  {
    v10 = objc_msgSend(v16, "lines");
    v11 = objc_msgSend(v16, "raised");
    v12 = objc_msgSend(v16, "style");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "color"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fontSpec"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "backgroundColor"));
    objc_msgSend(v16, "padding");
    objc_msgSend(v6, "configureDropCapWithCount:lines:raised:style:color:fontSpec:backgroundColor:padding:", v9, v10, v11, v12, v13, v14, v15);

  }
}

@end
