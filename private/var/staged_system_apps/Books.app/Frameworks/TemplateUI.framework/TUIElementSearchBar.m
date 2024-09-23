@implementation TUIElementSearchBar

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)supportedAttributes
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4904C;
  block[3] = &unk_23EBF8;
  block[4] = a1;
  if (qword_2CB340 != -1)
    dispatch_once(&qword_2CB340, block);
  return (id)qword_2CB338;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIStatefulElementBox, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementSearchBarBuilder, a2);
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2CB350 != -1)
    dispatch_once(&qword_2CB350, &stru_23EC18);
  return (id)qword_2CB348;
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8;
  id v9;
  _TUIElementSearchBarBuilder *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  TUITextContentStyler *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v8 = a6;
  v9 = a5;
  v10 = objc_alloc_init(_TUIElementSearchBarBuilder);
  v11 = objc_msgSend(v9, "bindingNameForAttribute:node:", 36, a3.var0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 200, a3.var0));
  -[_TUIElementSearchBarBuilder setText:](v10, "setText:", v12);

  objc_msgSend(v9, "insetsForAttribute:node:", 112, a3.var0);
  -[_TUIElementSearchBarBuilder setEditingInsets:](v10, "setEditingInsets:");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fontSpecForNode:", a3.var0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "attributesForAttributedString"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 138, a3.var0));
  -[_TUIElementSearchBarBuilder setName:](v10, "setName:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 175, a3.var0));
  -[_TUIElementSearchBarBuilder setReturnKeyType:](v10, "setReturnKeyType:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewStateForNode:binding:", a3.var0, v11));
  -[_TUIElementSearchBarBuilder setViewState:](v10, "setViewState:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 47, a3.var0));
  -[_TUIElementSearchBarBuilder setCancelText:](v10, "setCancelText:", v18);

  -[_TUIElementSearchBarBuilder setShowCancel:](v10, "setShowCancel:", objc_msgSend(v9, "BOOLForAttribute:node:", 190, a3.var0));
  v19 = objc_alloc_init(TUITextContentStyler);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorForAttribute:node:", 30, a3.var0));
  -[TUIBackgroundColorStyler setBackgroundColor:](v19, "setBackgroundColor:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorForAttribute:node:", 51, a3.var0));
  -[TUITextContentStyler setTextColor:](v19, "setTextColor:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "font"));
  -[TUITextContentStyler setFont:](v19, "setFont:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorForAttribute:node:", 203, a3.var0));
  -[TUITextContentStyler setTintColor:](v19, "setTintColor:", v23);

  -[_TUIElementSearchBarBuilder setStyle:](v10, "setStyle:", v19);
  return v10;
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  var0 = a4.var0;
  v8 = a5;
  v15 = a3;
  objc_msgSend(v8, "insetsForAttribute:node:", 206, var0);
  objc_msgSend(v15, "setTouchInsets:", UIEdgeInsetsZero.top - v9, UIEdgeInsetsZero.left - v10, UIEdgeInsetsZero.bottom - v11, UIEdgeInsetsZero.right - v12);
  objc_msgSend(v15, "setEnabled:", objc_msgSend(v8, "BOOLForAttribute:withDefault:node:", 74, 1, var0));
  objc_msgSend(v8, "floatForAttribute:withDefault:node:", 156, var0, 1.0);
  v14 = v13;

  objc_msgSend(v15, "setPressedScale:", v14);
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  TUIElementActionTriggerHandler *v11;
  void *v12;
  void *v13;
  void *v14;
  TUIElementActionTriggerHandler *v15;
  void *v16;
  NSMutableArray *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  TUIElementActionTriggerHandler *v41;
  void *v42;
  void *v43;
  unsigned __int8 v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  TUIElementActionTriggerHandler *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57[6];
  unsigned __int8 v58;
  id location[2];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeStateMapWithContext:", v9));
  objc_msgSend(v7, "setStateMap:", v10);

  v11 = [TUIElementActionTriggerHandler alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeTriggers"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionObject"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionDelegate"));
  v15 = -[TUIElementActionTriggerHandler initWithActionsData:actionObject:actionDelegate:](v11, "initWithActionsData:actionObject:actionDelegate:", v12, v13, v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeAnimationGroups"));
  objc_msgSend(v7, "setAnimationGroups:", v16);

  v17 = TUIBoxChildrenWithProtocolAndRole(v7, &OBJC_PROTOCOL___TUIPlaceholderTextBox, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));

  v42 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "placeholderString"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewState"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "returnKeyType"));
  objc_msgSend(v8, "editingInsets");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "style"));
  v43 = v9;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environment"));
  v45 = (void *)TUIKeyboardAppearanceFromEnvironmentStyle((uint64_t)objc_msgSend(v32, "style"));

  v44 = objc_msgSend(v8, "showCancel");
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cancelText"));
  objc_initWeak(location, v7);
  objc_msgSend(v7, "setTriggerHandler:", v15);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_49924;
  v48[3] = &unk_23EC40;
  v41 = v15;
  v49 = v41;
  v34 = v21;
  v50 = v34;
  objc_copyWeak(v57, location);
  v35 = v22;
  v51 = v35;
  v57[1] = v24;
  v57[2] = v26;
  v57[3] = v28;
  v57[4] = v30;
  v36 = v20;
  v52 = v36;
  v37 = v31;
  v53 = v37;
  v38 = v47;
  v54 = v38;
  v39 = v46;
  v55 = v39;
  v57[5] = v45;
  v40 = v33;
  v56 = v40;
  v58 = v44;
  objc_msgSend(v7, "setRenderModelBlock:", v48);

  objc_destroyWeak(v57);
  objc_destroyWeak(location);

}

@end
