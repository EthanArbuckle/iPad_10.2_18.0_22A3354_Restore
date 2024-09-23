@implementation TUIElementControl

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIControlBox, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementControlBuilder, a2);
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2CB4E0 != -1)
    dispatch_once(&qword_2CB4E0, &stru_23FF48);
  return (id)qword_2CB4D8;
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t v7;
  id v8;
  id v9;
  _TUIElementControlBuilder *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  LODWORD(v7) = a3;
  v8 = a6;
  v9 = a5;
  v10 = objc_alloc_init(_TUIElementControlBuilder);
  v7 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 138, v7));
  -[_TUIElementControlBuilder setName:](v10, "setName:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorForAttribute:node:", 30, v7));
  -[_TUIElementControlBuilder setBackgroundColor:](v10, "setBackgroundColor:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewStateForNode:binding:", v7, objc_msgSend(v9, "bindingNameForAttribute:node:", 36, v7)));
  -[_TUIElementControlBuilder setViewState:](v10, "setViewState:", v13);

  v14 = objc_msgSend(v9, "BOOLForAttribute:node:", 139, v7);
  -[_TUIElementControlBuilder setMenuIsPrimary:](v10, "setMenuIsPrimary:", v14);
  return v10;
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;

  var0 = a4.var0;
  v8 = a5;
  v16 = a3;
  objc_msgSend(v16, "setEnabled:", objc_msgSend(v8, "BOOLForAttribute:withDefault:node:", 74, 1, var0));
  objc_msgSend(v8, "floatForAttribute:withDefault:node:", 156, var0, 1.0);
  objc_msgSend(v16, "setPressedScale:");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pointerForNode:", var0));
  objc_msgSend(v16, "setPointer:", v9);

  objc_msgSend(v16, "setGrouped:", objc_msgSend(v8, "BOOLForAttribute:node:", 93, var0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "focusStyleForAttribute:node:", 88, var0));
  objc_msgSend(v16, "setFocusStyle:", v10);

  objc_msgSend(v8, "insetsForAttribute:node:", 206, var0);
  objc_msgSend(v16, "setTouchInsets:", UIEdgeInsetsZero.top - v11, UIEdgeInsetsZero.left - v12, UIEdgeInsetsZero.bottom - v13, UIEdgeInsetsZero.right - v14);
  objc_msgSend(v16, "setEnableBackgroundForHighlightPreview:", objc_msgSend(v8, "BOOLForAttribute:node:", 72, var0));
  v15 = objc_msgSend(v8, "BOOLForAttribute:node:", 73, var0);

  objc_msgSend(v16, "setEnableShadowForHighlightPreview:", v15);
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TUIElementActionTriggerHandler *v16;
  void *v17;
  id v18;
  TUIElementActionTriggerHandler *v19;
  void *v20;
  TUIBackgroundColorStyler *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  TUIAXAttributes *v26;
  id v27;
  TUIElementActionTriggerHandler *v28;
  id v29;
  TUIBackgroundColorStyler *v30;
  id v31;
  TUIAXAttributes *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  TUIElementActionTriggerHandler *v37;
  id v38;
  TUIBackgroundColorStyler *v39;
  id v40;
  TUIAXAttributes *v41;
  id v42;
  id v43;
  id from;
  id location;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeStateMapWithContext:", v9));
  objc_msgSend(v7, "setStateMap:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeAnimationGroups"));
  objc_msgSend(v7, "setAnimationGroups:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "menuContainer"));
  objc_msgSend(v7, "setMenuContainer:", v12);

  objc_msgSend(v7, "setMenuIsPrimary:", objc_msgSend(v8, "menuIsPrimary"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeLinkEntities"));
  objc_msgSend(v7, "setLinkEntities:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionObject"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionDelegate"));
  objc_initWeak(&location, v15);

  v16 = [TUIElementActionTriggerHandler alloc];
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeTriggers"));
  v18 = objc_loadWeakRetained(&location);
  v19 = -[TUIElementActionTriggerHandler initWithActionsData:actionObject:actionDelegate:](v16, "initWithActionsData:actionObject:actionDelegate:", v17, v14, v18);

  objc_msgSend(v7, "setTriggerHandler:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "refId"));
  -[TUIElementActionTriggerHandler setRefId:](v19, "setRefId:", v20);

  v21 = objc_alloc_init(TUIBackgroundColorStyler);
  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "backgroundColor"));
  -[TUIBackgroundColorStyler setBackgroundColor:](v21, "setBackgroundColor:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewState"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environment"));
  v33 = v9;
  v34 = (void *)v22;
  if (objc_msgSend(v25, "accessibilityElementsNeeded")
    && objc_msgSend(v7, "axHasNonDefaultAttributess", v9, v22))
  {
    v26 = -[TUIAXAttributes initWithAXAttributes:]([TUIAXAttributes alloc], "initWithAXAttributes:", v7);
  }
  else
  {
    v26 = 0;
  }

  objc_initWeak(&from, v7);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_7B3FC;
  v35[3] = &unk_23E430;
  objc_copyWeak(&v42, &from);
  v27 = v14;
  v36 = v27;
  objc_copyWeak(&v43, &location);
  v28 = v19;
  v37 = v28;
  v29 = v24;
  v38 = v29;
  v30 = v21;
  v39 = v30;
  v31 = v34;
  v40 = v31;
  v32 = v26;
  v41 = v32;
  objc_msgSend(v7, "setRenderModelBlock:", v35);

  objc_destroyWeak(&v43);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

@end
