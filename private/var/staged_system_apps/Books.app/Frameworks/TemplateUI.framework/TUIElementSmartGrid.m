@implementation TUIElementSmartGrid

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUISmartGridBox, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementSmartGridBuilder, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  id v26;
  id v27;

  var0 = a4.var0;
  v9 = a6;
  v10 = a5;
  v27 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelIdentifierByAppendingString:node:", CFSTR("scrollable"), var0));
  objc_msgSend(v27, "setModelIdentifierForScrollable:", v11);

  objc_msgSend(v27, "setAcceptsDrop:", objc_msgSend(v10, "BOOLForAttribute:withDefault:node:", 2, 0, var0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 65, var0));
  objc_msgSend(v27, "setDecelerationRate:", TUIBoxDecelerationRateFromString(v12));

  objc_msgSend(v10, "insetsForAttribute:node:", 112, var0);
  objc_msgSend(v27, "setInsets:");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForAttribute:node:", 52, var0));
  objc_msgSend(v27, "setColumns:", v13);

  objc_msgSend(v27, "setMaxColumns:", objc_msgSend(v10, "unsignedIntegerForAttribute:withDefault:node:", 128, 0x7FFFFFFFFFFFFFFFLL, var0));
  v14 = objc_msgSend(v10, "lengthForAttribute:node:", 56, var0);
  objc_msgSend(v27, "setColumnWidth:", v14, v15);
  v16 = objc_msgSend(v10, "lengthForAttribute:node:", 54, var0);
  objc_msgSend(v27, "setColumnSpacing:", v16, v17);
  objc_msgSend(v27, "setColumnMultiple:", objc_msgSend(v10, "unsignedIntegerForAttribute:withDefault:node:", 53, 1, var0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 120, var0));
  objc_msgSend(v27, "setLayoutMode:", +[TUISmartGridBox layoutModeFromString:](TUISmartGridBox, "layoutModeFromString:", v18));

  if (objc_msgSend(v27, "layoutMode"))
    v19 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v19 = 1;
  objc_msgSend(v27, "setRows:", objc_msgSend(v10, "unsignedIntegerForAttribute:withDefault:node:", 177, v19, var0));
  v20 = objc_msgSend(v10, "lengthForAttribute:node:", 178, var0);
  objc_msgSend(v27, "setRowSpacing:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environment"));

  v23 = objc_msgSend(v22, "deviceClass") == (char *)&dword_4 + 2;
  objc_msgSend(v27, "setPaginated:", objc_msgSend(v10, "BOOLForAttribute:withDefault:node:", 148, v23, var0));
  objc_msgSend(v27, "setMaxPages:", objc_msgSend(v10, "unsignedIntegerForAttribute:withDefault:node:", 130, 0x7FFFFFFFFFFFFFFFLL, var0));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 220, var0));
  objc_msgSend(v27, "setVerticalPlacement:", +[TUISmartGridBox verticalPlacementFromString:](TUISmartGridBox, "verticalPlacementFromString:", v24));

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "snapForAttribute:node:", 224, var0));
  objc_msgSend(v27, "setWidthSnap:", v25);

  objc_msgSend(v10, "insetsForAttribute:node:", 91, var0);
  objc_msgSend(v27, "setGradientInsets:");
  objc_msgSend(v10, "insetsForAttribute:withDefault:node:", 92, var0, 1.0, 1.0, 1.0, 1.0);
  objc_msgSend(v27, "setGradientFraction:");
  objc_msgSend(v27, "setBalanceSections:", objc_msgSend(v10, "BOOLForAttribute:node:", 31, var0));
  v26 = objc_msgSend(v10, "BOOLForAttribute:node:", 211, var0);

  objc_msgSend(v27, "setTruncate:", v26);
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  TUIElementActionTriggerHandler *v11;
  void *v12;
  void *v13;
  TUIElementActionTriggerHandler *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v17, "acceptsDrop"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "finalizeTriggers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "behaviorDataForTrigger:", CFSTR("drop")));

    if (v10)
    {
      v11 = [TUIElementActionTriggerHandler alloc];
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionObject"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionDelegate"));
      v14 = -[TUIElementActionTriggerHandler initWithActionsData:actionObject:actionDelegate:](v11, "initWithActionsData:actionObject:actionDelegate:", v9, v12, v13);
      objc_msgSend(v17, "setDropHandler:", v14);

    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "finalizeContentsWithContext:", v8));
  objc_msgSend(v17, "updateWithContents:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "configuration"));
  objc_msgSend(v17, "setConfiguration:", v16);

}

@end
