@implementation TUIElementTextView

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)supportedAttributes
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6E0A8;
  block[3] = &unk_23EBF8;
  block[4] = a1;
  if (qword_2CB470 != -1)
    dispatch_once(&qword_2CB470, block);
  return (id)qword_2CB468;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIStatefulElementBox, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementTextViewBuilder, a2);
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2CB480 != -1)
    dispatch_once(&qword_2CB480, &stru_23F378);
  return (id)qword_2CB478;
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8;
  id v9;
  _TUIElementTextViewBuilder *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  TUITextContentStyler *v18;
  void *v19;
  void *v20;
  void *v21;

  v8 = a6;
  v9 = a5;
  v10 = objc_alloc_init(_TUIElementTextViewBuilder);
  v11 = objc_msgSend(v9, "bindingNameForAttribute:node:", 36, a3.var0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 200, a3.var0));
  -[_TUIElementTextViewBuilder setText:](v10, "setText:", v12);

  objc_msgSend(v9, "insetsForAttribute:node:", 112, a3.var0);
  -[_TUIElementTextViewBuilder setEditingInsets:](v10, "setEditingInsets:");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fontSpecForNode:", a3.var0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "attributesForAttributedString"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 138, a3.var0));
  -[_TUIElementTextViewBuilder setName:](v10, "setName:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 175, a3.var0));
  -[_TUIElementTextViewBuilder setReturnKeyType:](v10, "setReturnKeyType:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewStateForNode:binding:", a3.var0, v11));
  -[_TUIElementTextViewBuilder setViewState:](v10, "setViewState:", v17);

  v18 = objc_alloc_init(TUITextContentStyler);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorForAttribute:node:", 30, a3.var0));
  -[TUIBackgroundColorStyler setBackgroundColor:](v18, "setBackgroundColor:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorForAttribute:node:", 51, a3.var0));
  -[TUITextContentStyler setTextColor:](v18, "setTextColor:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "font"));
  -[TUITextContentStyler setFont:](v18, "setFont:", v21);

  -[_TUIElementTextViewBuilder setStyle:](v10, "setStyle:", v18);
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
  objc_msgSend(v15, "setIsEditableControl:", 1);

}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  TUIElementActionTriggerHandler *v12;
  void *v13;
  void *v14;
  void *v15;
  TUIElementActionTriggerHandler *v16;
  void *v17;
  NSMutableArray *v18;
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
  TUIElementActionTriggerHandler *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  TUIElementActionTriggerHandler *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53[6];
  id location[2];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeStateMapWithContext:", v9));
  objc_msgSend(v7, "setStateMap:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeAnimationGroups"));
  objc_msgSend(v7, "setAnimationGroups:", v11);

  v12 = [TUIElementActionTriggerHandler alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeTriggers"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionObject"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionDelegate"));
  v16 = -[TUIElementActionTriggerHandler initWithActionsData:actionObject:actionDelegate:](v12, "initWithActionsData:actionObject:actionDelegate:", v13, v14, v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeAnimationGroups"));
  objc_msgSend(v7, "setAnimationGroups:", v17);

  v18 = TUIBoxChildrenWithProtocolAndRole(v7, &OBJC_PROTOCOL___TUIPlaceholderTextBox, 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));

  v41 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "placeholderString"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewState"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "returnKeyType"));
  objc_msgSend(v8, "editingInsets");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "style"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environment"));
  v42 = (void *)TUIKeyboardAppearanceFromEnvironmentStyle((uint64_t)objc_msgSend(v33, "style"));

  objc_initWeak(location, v7);
  objc_msgSend(v7, "setTriggerHandler:", v16);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_6E8D8;
  v45[3] = &unk_23F3A0;
  v34 = v16;
  v46 = v34;
  v35 = v22;
  v47 = v35;
  objc_copyWeak(v53, location);
  v36 = v23;
  v48 = v36;
  v53[1] = v25;
  v53[2] = v27;
  v53[3] = v29;
  v53[4] = v31;
  v37 = v32;
  v49 = v37;
  v38 = v21;
  v50 = v38;
  v39 = v44;
  v51 = v39;
  v40 = v43;
  v52 = v40;
  v53[5] = v42;
  objc_msgSend(v7, "setRenderModelBlock:", v45);

  objc_destroyWeak(v53);
  objc_destroyWeak(location);

}

@end
