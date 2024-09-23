@implementation TUIElementSegmentedControl

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)supportedAttributes
{
  if (qword_2CB8E8 != -1)
    dispatch_once(&qword_2CB8E8, &stru_242790);
  return (id)qword_2CB8E0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUISegmentedControlBox, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementSegmentControlBuilder, a2);
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2CB8F8 != -1)
    dispatch_once(&qword_2CB8F8, &stru_2427B0);
  return (id)qword_2CB8F0;
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t v7;
  id v8;
  id v9;
  _TUIElementSegmentControlBuilder *v10;
  void *v11;
  void *v12;
  void *v13;

  LODWORD(v7) = a3;
  v8 = a5;
  v9 = a6;
  v10 = objc_alloc_init(_TUIElementSegmentControlBuilder);
  v7 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewStateForNode:binding:", v7, objc_msgSend(v8, "bindingNameForAttribute:node:", 36, v7)));
  -[_TUIElementSegmentControlBuilder setViewState:](v10, "setViewState:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 138, v7));
  -[_TUIElementSegmentControlBuilder setName:](v10, "setName:", v12);

  -[_TUIElementSegmentControlBuilder setSelectIndex:](v10, "setSelectIndex:", objc_msgSend(v8, "integerForAttribute:withDefault:node:", 184, 0, v7));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", 51, v7));
  -[_TUIElementSegmentControlBuilder setTintColor:](v10, "setTintColor:", v13);

  return v10;
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v13 = a3;
  v8 = a5;
  objc_msgSend(v8, "insetsForAttribute:node:", 206, a4.var0);
  objc_msgSend(v13, "setTouchInsets:", UIEdgeInsetsZero.top - v9, UIEdgeInsetsZero.left - v10, UIEdgeInsetsZero.bottom - v11, UIEdgeInsetsZero.right - v12);
  objc_msgSend(v13, "setEnabled:", objc_msgSend(v8, "BOOLForAttribute:withDefault:node:", 74, 1, a4.var0));
  objc_msgSend(v8, "floatForAttribute:withDefault:node:", 156, a4.var0, 1.0);
  objc_msgSend(v13, "setPressedScale:");

}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  TUIElementActionTriggerHandler *v9;
  void *v10;
  void *v11;
  void *v12;
  TUIElementActionTriggerHandler *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  TUIElementActionTriggerHandler *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  TUIElementActionTriggerHandler *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32[2];
  id location;

  v7 = a3;
  v8 = a4;
  v25 = a5;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeSegments"));
  v9 = [TUIElementActionTriggerHandler alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeTriggers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "actionObject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "actionDelegate"));
  v13 = -[TUIElementActionTriggerHandler initWithActionsData:actionObject:actionDelegate:](v9, "initWithActionsData:actionObject:actionDelegate:", v10, v11, v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeAnimationGroups"));
  objc_msgSend(v7, "setAnimationGroups:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewState"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  v17 = objc_msgSend(v8, "selectIndex");
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tintColor"));
  objc_initWeak(&location, v7);
  objc_msgSend(v7, "setTriggerHandler:", v13);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_14CD70;
  v26[3] = &unk_2427D8;
  v18 = v13;
  v27 = v18;
  v19 = v15;
  v28 = v19;
  objc_copyWeak(v32, &location);
  v20 = v16;
  v29 = v20;
  v32[1] = v17;
  v21 = v24;
  v30 = v21;
  v22 = v23;
  v31 = v22;
  objc_msgSend(v7, "setRenderModelBlock:", v26, v13);

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);

}

@end
