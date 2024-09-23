@implementation WFRunShortcutContextualAction

- (id)spotlightItem
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFRunShortcutContextualAction;
  -[WFContextualAction spotlightItem](&v9, sel_spotlightItem);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfString:", CFSTR(":"));
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "substringFromIndex:", v5 + v6);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setUniqueIdentifier:", v7);
    v4 = (void *)v7;
  }

  return v2;
}

- (id)uniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFContextualAction identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRunShortcutContextualAction workflow](self, "workflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(":%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)showsUserInterfaceWhenRunning
{
  return 1;
}

- (WFRunShortcutContextualAction)initWithDescriptor:(id)a3 serializedRepresentation:(id)a4 namedQueryInfo:(id)a5
{
  id v9;
  id v10;
  WFContextualActionParameter *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  WFContextualActionIcon *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  WFWorkflowIconDrawer *v23;
  void *v24;
  WFWorkflowIconDrawer *v25;
  void *v26;
  void *v27;
  void *v28;
  WFContextualActionIcon *v29;
  WFContextualActionIcon *v30;
  void *v31;
  WFRunShortcutContextualAction *v32;
  void *v34;
  WFContextualActionIcon *v35;
  void *v36;
  WFRunShortcutContextualAction *v37;
  id v38;
  void *v39;
  objc_super v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v38 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRunShortcutContextualAction.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptor"));

  }
  v37 = self;
  v11 = [WFContextualActionParameter alloc];
  objc_msgSend(v9, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:](v11, "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFWorkflowContentItem"), v12, CFSTR("WFWorkflow"), v10);

  objc_msgSend(v9, "associatedAppBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = [WFContextualActionIcon alloc];
    objc_msgSend(v9, "associatedAppBundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[WFContextualActionIcon initWithApplicationBundleIdentifier:](v15, "initWithApplicationBundleIdentifier:", v16);

  }
  else
  {
    v35 = 0;
  }
  v39 = v10;
  v36 = (void *)v13;
  v41[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Run %@"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Run Shortcut"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v9;
  v22 = (void *)MEMORY[0x1B5DFC064]();
  v23 = [WFWorkflowIconDrawer alloc];
  v24 = (void *)objc_opt_new();
  v25 = -[WFWorkflowIconDrawer initWithDrawerContext:](v23, "initWithDrawerContext:", v24);

  -[WFWorkflowIconDrawer setGlyphCharacter:](v25, "setGlyphCharacter:", objc_msgSend(v21, "glyphCharacter"));
  -[WFWorkflowIconDrawer setDrawGradient:](v25, "setDrawGradient:", 1);
  -[WFWorkflowIconDrawer setDrawShadowBehindGlyph:](v25, "setDrawShadowBehindGlyph:", 0);
  -[WFWorkflowIconDrawer setGlyphSize:](v25, "setGlyphSize:", 60.0, 60.0);
  +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", objc_msgSend(v21, "color"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowIconDrawer setBackgroundColor:](v25, "setBackgroundColor:", v26);

  -[WFWorkflowIconDrawer imageWithSize:](v25, "imageWithSize:", 120.0, 120.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    objc_msgSend(v27, "PNGRepresentation");
    v29 = (WFContextualActionIcon *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = [WFContextualActionIcon alloc];
      objc_msgSend(v28, "PNGRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "scale");
      v29 = -[WFContextualActionIcon initWithImageData:scale:displayStyle:](v30, "initWithImageData:scale:displayStyle:", v31, 1);

    }
  }
  else
  {
    v29 = 0;
  }

  objc_autoreleasePoolPop(v22);
  v40.receiver = v37;
  v40.super_class = (Class)WFRunShortcutContextualAction;
  v32 = -[WFTopHitItemContextualAction initWithItem:identifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:primaryColor:icon:accessoryIcon:namedQueryInfo:](&v40, sel_initWithItem_identifier_wfActionIdentifier_associatedAppBundleIdentifier_parameters_displayFormatString_title_subtitleFormatString_primaryColor_icon_accessoryIcon_namedQueryInfo_, v21, CFSTR("is.workflow.actions.runworkflow"), CFSTR("is.workflow.actions.runworkflow"), CFSTR("com.apple.shortcuts"), v17, v18, v19, v20, 9, v29, v35, v38);

  return v32;
}

@end
