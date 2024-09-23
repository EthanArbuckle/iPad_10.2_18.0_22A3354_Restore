@implementation TUIElementAXActionsAction

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementAXActionsActionObjectBuilder, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementAXActionsActionObjectBuilder, a2);
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIAXActionBuilding;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  var0 = a4.var0;
  v8 = a5;
  v14 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 209, var0));
  objc_msgSend(v14, "setTrigger:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 35, var0));
  objc_msgSend(v14, "setBehavior:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 164, var0));
  objc_msgSend(v14, "setRefId:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 26, var0));
  objc_msgSend(v14, "setLabel:", v12);

  v13 = objc_msgSend(v8, "BOOLForAttribute:node:", 19, var0);
  objc_msgSend(v14, "setIsDefault:", v13);

}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  TUIAXCustomAction *v10;
  TUIElementBehaviorArgumentsMap *v11;
  void *v12;
  TUIAXCustomAction *v13;
  void *v14;
  TUIElementBehaviorArgumentsMap *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  TUIAXCustomAction *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "refId"));

  if (v9)
  {
    v10 = [TUIAXCustomAction alloc];
    v11 = (TUIElementBehaviorArgumentsMap *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "refId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trigger"));
    v13 = -[TUIAXCustomAction initWithRefId:trigger:](v10, "initWithRefId:trigger:", v11, v12);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "behavior"));

    if (!v14)
    {
LABEL_10:
      objc_msgSend(v8, "reportError:", 1030);
      goto LABEL_11;
    }
    v15 = [TUIElementBehaviorArgumentsMap alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "behavior"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "arguments"));
    v18 = (void *)v17;
    if (v17)
      v19 = (void *)v17;
    else
      v19 = &__NSDictionary0__struct;
    v11 = -[TUIElementBehaviorArgumentsMap initWithBehavior:arguments:](v15, "initWithBehavior:arguments:", v16, v19);

    v20 = [TUIAXCustomAction alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trigger"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionObject"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionDelegate"));
    v13 = -[TUIAXCustomAction initWithTrigger:actionData:actionObject:actionDelegate:controlIdentifier:](v20, "initWithTrigger:actionData:actionObject:actionDelegate:controlIdentifier:", v12, v11, v21, v22, 0);

  }
  if (!v13)
    goto LABEL_10;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "label"));
  -[TUIAXCustomAction setLabel:](v13, "setLabel:", v23);

  -[TUIAXCustomAction setIsDefault:](v13, "setIsDefault:", objc_msgSend(v24, "isDefault"));
  objc_msgSend(v7, "addAXAction:", v13);

LABEL_11:
}

@end
