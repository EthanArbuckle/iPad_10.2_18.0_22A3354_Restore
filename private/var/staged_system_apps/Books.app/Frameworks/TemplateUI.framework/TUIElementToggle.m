@implementation TUIElementToggle

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)supportedAttributes
{
  if (qword_2CB808 != -1)
    dispatch_once(&qword_2CB808, &stru_242378);
  return (id)qword_2CB800;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIToggleBox, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementToggleBuilder, a2);
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2CB818 != -1)
    dispatch_once(&qword_2CB818, &stru_242398);
  return (id)qword_2CB810;
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t v7;
  id v8;
  id v9;
  _TUIElementToggleBuilder *v10;
  void *v11;
  void *v12;

  LODWORD(v7) = a3;
  v8 = a6;
  v9 = a5;
  v10 = objc_alloc_init(_TUIElementToggleBuilder);
  v7 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewStateForNode:binding:", v7, objc_msgSend(v9, "bindingNameForAttribute:node:", 36, v7)));

  -[_TUIElementToggleBuilder setViewState:](v10, "setViewState:", v11);
  -[_TUIElementToggleBuilder setEnabled:](v10, "setEnabled:", objc_msgSend(v9, "BOOLForAttribute:withDefault:node:", 74, 1, v7));
  -[_TUIElementToggleBuilder setIsOn:](v10, "setIsOn:", objc_msgSend(v9, "BOOLForAttribute:withDefault:node:", 145, 0, v7));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 138, v7));

  -[_TUIElementToggleBuilder setName:](v10, "setName:", v12);
  return v10;
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;

  var0 = a4.var0;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "stringForAttribute:node:", 204, var0));
  objc_msgSend(v8, "setTitle:", v9);

}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  TUIElementActionTriggerHandler *v10;
  void *v11;
  void *v12;
  void *v13;
  TUIElementActionTriggerHandler *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  TUIElementActionTriggerHandler *v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  TUIElementActionTriggerHandler *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  id location;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = [TUIElementActionTriggerHandler alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeTriggers"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionObject"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionDelegate"));
  v14 = -[TUIElementActionTriggerHandler initWithActionsData:actionObject:actionDelegate:](v10, "initWithActionsData:actionObject:actionDelegate:", v11, v12, v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeAnimationGroups"));
  objc_msgSend(v7, "setAnimationGroups:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewState"));
  v17 = objc_msgSend(v8, "enabled");
  v18 = objc_msgSend(v8, "isOn");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
  objc_msgSend(v7, "width");
  if ((v21 & 0x7000000000000) >= 0x2000000000001 && (HIWORD(v21) & 7) - 7 <= 0xFFFFFFFFFFFFFFFDLL)
    objc_msgSend(v9, "reportError:", 1032);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "refId"));
  -[TUIElementActionTriggerHandler setRefId:](v14, "setRefId:", v22);

  objc_initWeak(&location, v7);
  objc_msgSend(v7, "setTriggerHandler:", v14);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_136748;
  v27[3] = &unk_2423C0;
  v23 = v14;
  v28 = v23;
  v24 = v16;
  v29 = v24;
  v33 = v17;
  objc_copyWeak(&v32, &location);
  v25 = v19;
  v30 = v25;
  v26 = v20;
  v31 = v26;
  v34 = v18;
  objc_msgSend(v7, "setRenderModelBlock:", v27);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

}

@end
