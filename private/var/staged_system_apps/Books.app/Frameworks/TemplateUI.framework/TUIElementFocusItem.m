@implementation TUIElementFocusItem

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementFocusItemBuilder, a2);
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIFocusItemBox, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;
  id v10;

  var0 = a4.var0;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "setGrouped:", objc_msgSend(v8, "BOOLForAttribute:node:", 93, var0));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "focusStyleForAttribute:node:", 88, var0));

  objc_msgSend(v9, "setFocusStyle:", v10);
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  TUIElementActionTriggerHandler *v11;
  void *v12;
  void *v13;
  void *v14;
  TUIElementActionTriggerHandler *v15;
  id v16;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(v8, "finalizeModelsWithParent:box:context:", v9, v9, v7);
  v11 = [TUIElementActionTriggerHandler alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeTriggers"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionObject"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionDelegate"));

  v15 = -[TUIElementActionTriggerHandler initWithActionsData:actionObject:actionDelegate:](v11, "initWithActionsData:actionObject:actionDelegate:", v12, v13, v14);
  objc_msgSend(v9, "setActionHandler:", v15);

  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalizeLinkEntities"));
  objc_msgSend(v9, "setLinkEntities:", v16);

}

@end
