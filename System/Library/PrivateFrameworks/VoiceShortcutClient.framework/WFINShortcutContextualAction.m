@implementation WFINShortcutContextualAction

- (WFINShortcutContextualAction)initWithINShortcut:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  INShortcut *shortcut;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  WFINShortcutContextualAction *v26;
  WFINShortcutContextualAction *v27;
  WFINShortcutContextualAction *v28;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v30[0] = CFSTR("com.apple.shortcuts.contextual-actions.inshortcut");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

  -[INShortcut intent](self->_shortcut, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  shortcut = self->_shortcut;
  if (v9)
  {
    -[INShortcut intent](shortcut, "intent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_intents_bundleIdForDisplay");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v8, "addObject:", v12);
    -[INShortcut intent](self->_shortcut, "intent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_className");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v14);

  }
  else
  {
    -[INShortcut userActivity](shortcut, "userActivity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v8, "addObject:", v12);
  }

  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("."));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[INShortcut intent](self->_shortcut, "intent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    -[INShortcut userActivity](self->_shortcut, "userActivity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "title");
    v21 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[INShortcut intent](self->_shortcut, "intent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_intents_bundleIdForDisplay");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    -[INShortcut userActivity](self->_shortcut, "userActivity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_determineMatchingApplicationBundleIdentifierWithOptions:", MEMORY[0x1E0C9AA70]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v26 = -[WFContextualAction initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:](self, "initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:", v17, 0, v24, MEMORY[0x1E0C9AA60], v21, v21, 0, 0);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_shortcut, a3);
    v28 = v27;
  }

  return v27;
}

- (id)icon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFINShortcutContextualAction shortcut](self, "shortcut");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[WFContextualActionIcon iconWithImageData:scale:displayStyle:](WFContextualActionIcon, "iconWithImageData:scale:displayStyle:", v5, 0, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)uniqueIdentifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[WFContextualAction identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:", v5);

  -[INShortcut intent](self->_shortcut, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[INShortcut intent](self->_shortcut, "intent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v9, "_indexingHash"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);

  }
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("."));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  objc_super v10;

  v3 = (void *)objc_opt_new();
  v10.receiver = self;
  v10.super_class = (Class)WFINShortcutContextualAction;
  v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v10, sel_hash));
  -[WFINShortcutContextualAction shortcut](self, "shortcut");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFINShortcutContextualAction shortcut](self, "shortcut");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v3, "combine:", v6);

  }
  v8 = objc_msgSend(v3, "finalize");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFINShortcutContextualAction;
  if (-[WFContextualAction isEqual:](&v13, sel_isEqual_, v4))
  {
    v5 = v4;
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v5, "shortcut");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFINShortcutContextualAction shortcut](self, "shortcut");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {
        v11 = 1;
      }
      else
      {
        v11 = 0;
        if (v8 && v9)
          v11 = objc_msgSend(v8, "isEqual:", v9);
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (WFINShortcutContextualAction)initWithCoder:(id)a3
{
  id v4;
  WFINShortcutContextualAction *v5;
  void *v6;
  WFINShortcutContextualAction *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFINShortcutContextualAction;
  v5 = -[WFContextualAction initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortcut"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_storeStrong((id *)&v5->_shortcut, v6);
      v7 = v5;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFINShortcutContextualAction;
  v4 = a3;
  -[WFContextualAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_shortcut, CFSTR("shortcut"), v5.receiver, v5.super_class);

}

- (id)workflowRunKind
{
  __CFString *v2;

  v2 = CFSTR("INShortcut");
  return CFSTR("INShortcut");
}

- (INShortcut)shortcut
{
  return self->_shortcut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcut, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)runDescriptorForSurface:(unint64_t)a3
{
  WFINShortcutContextualAction *v3;
  WFINShortcutContextualAction *v4;
  WFINShortcutContextualAction *v5;
  void *v6;
  void *v7;

  v3 = self;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  -[WFINShortcutContextualAction shortcut](v5, "shortcut");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WFWorkflowRunDescriptorForINShortcut(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)runRequestForSurface:(unint64_t)a3
{
  unint64_t v3;
  WFWorkflowRunRequest *v4;
  void *v5;

  if (a3 - 1 > 3)
    v3 = 0;
  else
    v3 = qword_1AF7809D8[a3 - 1];
  v4 = -[WFWorkflowRunRequest initWithInput:presentationMode:]([WFWorkflowRunRequest alloc], "initWithInput:presentationMode:", 0, 1);
  WFRunSourceForSpotlightExecutionContext(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunRequest setRunSource:](v4, "setRunSource:", v5);

  -[WFWorkflowRunRequest setDonateInteraction:](v4, "setDonateInteraction:", 0);
  return v4;
}

@end
