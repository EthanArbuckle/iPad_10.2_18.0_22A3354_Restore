@implementation TUIElementNavigationBarItem

+ (unint64_t)definesScopes
{
  return 63;
}

+ (id)supportedAttributes
{
  if (qword_2CB550 != -1)
    dispatch_once(&qword_2CB550, &stru_240418);
  return (id)qword_2CB548;
}

+ (unint64_t)itemTypeFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CB560 != -1)
  {
    dispatch_once(&qword_2CB560, &stru_240438);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CB558, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUINavigationBarItemBox, a2);
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIBoxBuilding;
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementNavigationBarItemBuilder, a2);
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v7;
  _TUIElementNavigationBarItemBuilder *v8;
  id v9;

  v7 = a5;
  v8 = objc_alloc_init(_TUIElementNavigationBarItemBuilder);
  v9 = objc_msgSend(v7, "BOOLForAttribute:node:", 139, a3.var0);

  -[_TUIElementNavigationBarItemBuilder setMenuIsPrimary:](v8, "setMenuIsPrimary:", v9);
  return v8;
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char *v16;
  double v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 204, a4.var0));
  objc_msgSend(v20, "setTitle:", v9);

  objc_msgSend(v20, "setEnabled:", objc_msgSend(v8, "BOOLForAttribute:withDefault:node:", 74, 1, a4.var0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 116, a4.var0));
  objc_msgSend(v20, "setButtonType:", +[TUIButtonBox buttonTypeFromString:](TUIButtonBox, "buttonTypeFromString:", v10));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 44, a4.var0));
  objc_msgSend(v20, "setButtonRole:", +[TUIButtonBox buttonRoleFromString:](TUIButtonBox, "buttonRoleFromString:", v11));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 142, a4.var0));
  objc_msgSend(v20, "setObserveTrigger:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 144, a4.var0));
  objc_msgSend(v20, "setObserveTriggerValue:", +[TUIBox triggerStateFromString:](TUIBox, "triggerStateFromString:", v13));

  objc_msgSend(v20, "setIgnoreInsetsForOpacityTrigger:", objc_msgSend(v8, "BOOLForAttribute:node:", 105, a4.var0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 140, a4.var0));
  objc_msgSend(v20, "setItemType:", +[TUIElementNavigationBarItem itemTypeFromString:](TUIElementNavigationBarItem, "itemTypeFromString:", v14));

  objc_msgSend(v20, "setSearchTextMaxLength:", objc_msgSend(v8, "integerForAttribute:withDefault:node:", 182, 0x7FFFFFFFFFFFFFFFLL, a4.var0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 200, a4.var0));
  objc_msgSend(v20, "setText:", v15);

  v16 = (char *)objc_msgSend(v20, "itemType");
  v17 = NAN;
  if (v16 == (_BYTE *)&dword_4 + 3)
    objc_msgSend(v8, "floatForAttribute:withDefault:node:", 146, a4.var0, NAN);
  objc_msgSend(v20, "setNavigationBarBackgroundOpacity:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 164, a4.var0));
  objc_msgSend(v20, "setRefId:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 165, a4.var0));
  objc_msgSend(v20, "setRefInstance:", v19);

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
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v7 = a4;
  v8 = a5;
  v9 = [TUIElementActionTriggerHandler alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "finalizeTriggers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionObject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionDelegate"));
  v13 = -[TUIElementActionTriggerHandler initWithActionsData:actionObject:actionDelegate:](v9, "initWithActionsData:actionObject:actionDelegate:", v10, v11, v12);
  objc_msgSend(v22, "setActionHandler:", v13);

  v14 = objc_msgSend(v7, "finalizeModelsWithParent:box:context:", v22, v22, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attributedTitle"));
  if (objc_msgSend(v22, "itemType") == (char *)&dword_0 + 3 || objc_msgSend(v22, "itemType") == &dword_4)
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tui_attributedTitleForButtonType:", objc_msgSend(v22, "buttonType")));

    v15 = (void *)v16;
  }
  objc_msgSend(v22, "setAttributedTitle:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "image"));
  objc_msgSend(v22, "setImage:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "placeholderText"));
  objc_msgSend(v22, "setPlaceholderText:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "menuContainer"));
  objc_msgSend(v22, "setMenuContainer:", v19);

  objc_msgSend(v22, "setMenuIsPrimary:", objc_msgSend(v7, "menuIsPrimary"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hostingIdentifiers"));
  objc_msgSend(v22, "setHostingIdentifiers:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hostingProperities"));
  objc_msgSend(v22, "setHostingProperties:", v21);

}

@end
