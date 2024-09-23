@implementation TUIElementRatings

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)supportedAttributes
{
  if (qword_2CB628 != -1)
    dispatch_once(&qword_2CB628, &stru_240FD8);
  return (id)qword_2CB620;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIRatingsBox, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementRatingsBuilder, a2);
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2CB638 != -1)
    dispatch_once(&qword_2CB638, &stru_240FF8);
  return (id)qword_2CB630;
}

+ (void)preconfigureBox:(id)a3 context:(id)a4
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setAXElement:", 1);
  objc_msgSend(v4, "setAxAdjustable:", 1);

}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v7;
  id v8;
  _TUIElementRatingsBuilder *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  LODWORD(v10) = a3;
  v7 = a5;
  v8 = a6;
  v9 = objc_alloc_init(_TUIElementRatingsBuilder);
  v10 = v10;
  v11 = objc_msgSend(v8, "childCountForNode:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewStateForNode:binding:", v10, objc_msgSend(v7, "bindingNameForAttribute:node:", 36, v10)));

  -[_TUIElementRatingsBuilder setViewState:](v9, "setViewState:", v12);
  if (v11)
  {
    v13 = 1;
  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[_TUIElementRatingsBuilder viewState](v9, "viewState"));
    v13 = v8 != 0;
  }
  -[_TUIElementRatingsBuilder setEnabled:](v9, "setEnabled:", objc_msgSend(v7, "BOOLForAttribute:withDefault:node:", 74, v13, v10));
  if (!v11)

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "colorForAttribute:node:", 51, v10));
  -[_TUIElementRatingsBuilder setColor:](v9, "setColor:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "colorForAttribute:node:", 196, v10));
  -[_TUIElementRatingsBuilder setStartColor:](v9, "setStartColor:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "colorForAttribute:node:", 30, v10));
  -[_TUIElementRatingsBuilder setBackgroundColor:](v9, "setBackgroundColor:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringForAttribute:node:", 116, v10));
  -[_TUIElementRatingsBuilder setBackgroundKind:](v9, "setBackgroundKind:", +[TUIRatingsBox backgroundKindFromString:](TUIRatingsBox, "backgroundKindFromString:", v17));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringForAttribute:node:", 138, v10));
  -[_TUIElementRatingsBuilder setName:](v9, "setName:", v18);

  objc_msgSend(v7, "floatForAttribute:node:", 163, v10);
  -[_TUIElementRatingsBuilder setRating:](v9, "setRating:");

  return v9;
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  float v24;
  void *v25;
  id v26;

  v26 = a3;
  v8 = a5;
  v9 = objc_msgSend(v8, "lengthForAttribute:node:", 223, a4.var0);
  objc_msgSend(v26, "setSize:", +[TUIRatingsBox sizeFromWidth:](TUIRatingsBox, "sizeFromWidth:", v9, v10));
  v11 = objc_msgSend(v8, "lengthForAttribute:node:", 223, a4.var0);
  objc_msgSend(v26, "setWidth:", v11, v12);
  v13 = objc_msgSend(v8, "lengthForAttribute:node:", 98, a4.var0);
  objc_msgSend(v26, "setHeight:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "axLabel"));

  if (!v15)
  {
    objc_msgSend(v8, "floatForAttribute:node:", 163, a4.var0);
    v17 = v16;
    v18 = TUIBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Rating"), &stru_243BF0, CFSTR("TemplateUILocalizable")));

    v21 = TUIBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("%lu stars"), &stru_243BF0, CFSTR("TemplateUILocalizable")));
    v24 = v17 / 0.2;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v23, vcvtas_u32_f32(v24)));

    objc_msgSend(v26, "setAxLabel:", v20);
    objc_msgSend(v26, "setAxValue:", v25);

  }
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  TUIElementActionTriggerHandler *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  TUIElementActionTriggerHandler *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41[3];
  unsigned __int8 v42;
  id location[2];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "axActions"));
  objc_msgSend(v7, "setAxCustomActions:", v10);

  v11 = [TUIElementActionTriggerHandler alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeTriggers"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionObject"));
  v32 = v9;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionDelegate"));
  v15 = -[TUIElementActionTriggerHandler initWithActionsData:actionObject:actionDelegate:](v11, "initWithActionsData:actionObject:actionDelegate:", v12, v13, v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeAnimationGroups"));
  objc_msgSend(v7, "setAnimationGroups:", v16);

  objc_msgSend(v7, "setTriggerHandler:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "refId"));
  -[TUIElementActionTriggerHandler setRefId:](v15, "setRefId:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewState"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "color"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startColor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "backgroundColor"));
  v22 = objc_msgSend(v8, "backgroundKind");
  v23 = objc_msgSend(v8, "enabled");
  objc_msgSend(v8, "rating");
  v25 = v24;
  objc_initWeak(location, v7);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_C55D4;
  v34[3] = &unk_241020;
  v26 = v15;
  v35 = v26;
  v27 = v18;
  v36 = v27;
  objc_copyWeak(v41, location);
  v28 = v19;
  v37 = v28;
  v41[1] = v25;
  v42 = v23;
  v29 = v20;
  v38 = v29;
  v30 = v21;
  v39 = v30;
  v31 = v33;
  v40 = v31;
  v41[2] = v22;
  objc_msgSend(v7, "setRenderModelBlock:", v34);

  objc_destroyWeak(v41);
  objc_destroyWeak(location);

}

@end
