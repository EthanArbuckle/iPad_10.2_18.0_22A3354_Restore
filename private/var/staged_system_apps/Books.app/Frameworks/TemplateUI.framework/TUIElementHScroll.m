@implementation TUIElementHScroll

+ (unint64_t)definesScopes
{
  return 63;
}

+ (id)supportedAttributes
{
  if (qword_2CB240 != -1)
    dispatch_once(&qword_2CB240, &stru_23DD20);
  return (id)qword_2CB238;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIHScrollBox, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(TUIBoxAndActionBuilder, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  var0 = a4.var0;
  v9 = a6;
  v10 = a5;
  v11 = a3;
  objc_msgSend(v10, "floatForAttribute:node:", 9, var0);
  objc_msgSend(v11, "setAnchorOffset:");
  objc_msgSend(v11, "setAcceptsDrop:", objc_msgSend(v10, "BOOLForAttribute:withDefault:node:", 2, 0, var0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 65, var0));

  objc_msgSend(v11, "setDecelerationRate:", TUIBoxDecelerationRateFromString(v12));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelIdentifierWithNode:", var0));

  objc_msgSend(v11, "setModelIdentifierForScrollable:", v13);
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
  TUIElementActionTriggerHandler *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v7, "finalizeModelsWithParent:box:context:", v15, v15, v8);
  if (objc_msgSend(v15, "acceptsDrop"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "finalizeTriggers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "behaviorDataForTrigger:", CFSTR("drop")));

    if (v11)
    {
      v12 = [TUIElementActionTriggerHandler alloc];
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionObject"));
      v14 = -[TUIElementActionTriggerHandler initWithActionsData:actionObject:actionDelegate:](v12, "initWithActionsData:actionObject:actionDelegate:", v10, v13, 0);
      objc_msgSend(v15, "setDropHandler:", v14);

    }
  }

}

@end
