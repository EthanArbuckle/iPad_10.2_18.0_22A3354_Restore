@implementation WFConfiguredSystemContextualAction

- (WFConfiguredSystemContextualAction)initWithContextualAction:(id)a3 appShortcutIdentifier:(id)a4 shortcutsMetadata:(id)a5
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  WFConfiguredSystemContextualAction *v20;
  WFConfiguredSystemContextualAction *v21;
  void *v23;
  id v24;
  objc_super v25;

  v10 = a3;
  v24 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFConfiguredSystemContextualAction.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"), v24);

  }
  objc_msgSend(v10, "associatedAppBundleIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = CFSTR("com.apple.shortcuts");
  if (v12)
    v14 = (__CFString *)v12;
  v15 = v14;

  objc_msgSend(v10, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "icon");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "wfIcon");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)WFConfiguredSystemContextualAction;
  v20 = -[WFConfiguredStaccatoAction initWithIdentifier:associatedBundleIdentifier:name:previewIcon:shortcutsMetadata:](&v25, sel_initWithIdentifier_associatedBundleIdentifier_name_previewIcon_shortcutsMetadata_, v16, v15, v17, v19, v11);

  if (v20)
  {
    objc_storeStrong((id *)&v20->_contextualAction, a3);
    objc_storeStrong((id *)&v20->_appShortcutIdentifier, a4);
    v21 = v20;
  }

  return v20;
}

- (WFConfiguredSystemContextualAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WFConfiguredSystemContextualAction *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextualAction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appShortcutIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortcutsMetadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[WFConfiguredSystemContextualAction initWithContextualAction:appShortcutIdentifier:shortcutsMetadata:](self, "initWithContextualAction:appShortcutIdentifier:shortcutsMetadata:", v5, v6, v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFConfiguredSystemContextualAction;
  v4 = a3;
  -[WFConfiguredStaccatoAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[WFConfiguredSystemContextualAction contextualAction](self, "contextualAction", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("contextualAction"));

  -[WFConfiguredSystemContextualAction appShortcutIdentifier](self, "appShortcutIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("appShortcutIdentifier"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[WFConfiguredStaccatoAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredStaccatoAction name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredStaccatoAction associatedBundleIdentifier](self, "associatedBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredSystemContextualAction contextualAction](self, "contextualAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredSystemContextualAction appShortcutIdentifier](self, "appShortcutIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%p): id: %@ name: %@, bundle: %@, action: %@, app shortcut identifier: %@>"), v4, self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  WFConfiguredSystemContextualAction *v4;
  WFConfiguredSystemContextualAction *v5;
  WFConfiguredSystemContextualAction *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v19;

  v4 = (WFConfiguredSystemContextualAction *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19.receiver = self;
        v19.super_class = (Class)WFConfiguredSystemContextualAction;
        if (-[WFConfiguredStaccatoAction isEqual:](&v19, sel_isEqual_, v5))
        {
          v6 = v5;
          -[WFConfiguredSystemContextualAction contextualAction](self, "contextualAction");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFConfiguredSystemContextualAction contextualAction](v6, "contextualAction");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v7;
          v10 = v8;
          v11 = v10;
          if (v9 == v10)
          {

          }
          else
          {
            LOBYTE(v12) = 0;
            v13 = v10;
            v14 = v9;
            if (!v9 || !v10)
            {
LABEL_19:

LABEL_20:
              goto LABEL_21;
            }
            v12 = objc_msgSend(v9, "isEqual:", v10);

            if (!v12)
              goto LABEL_20;
          }
          -[WFConfiguredSystemContextualAction appShortcutIdentifier](self, "appShortcutIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFConfiguredSystemContextualAction appShortcutIdentifier](v6, "appShortcutIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v15;
          v17 = v16;
          v13 = v17;
          if (v14 == v17)
          {
            LOBYTE(v12) = 1;
          }
          else
          {
            LOBYTE(v12) = 0;
            if (v14 && v17)
              LOBYTE(v12) = objc_msgSend(v14, "isEqual:", v17);
          }

          goto LABEL_19;
        }
      }
    }
    LOBYTE(v12) = 0;
  }
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  objc_super v11;

  v3 = (void *)objc_opt_new();
  v11.receiver = self;
  v11.super_class = (Class)WFConfiguredSystemContextualAction;
  v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFConfiguredStaccatoAction hash](&v11, sel_hash));
  -[WFConfiguredSystemContextualAction contextualAction](self, "contextualAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "combine:", v5);

  -[WFConfiguredSystemContextualAction appShortcutIdentifier](self, "appShortcutIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "combine:", v7);

  v9 = objc_msgSend(v3, "finalize");
  return v9;
}

- (WFContextualAction)contextualAction
{
  return self->_contextualAction;
}

- (WFExecutableAppShortcutIdentifier)appShortcutIdentifier
{
  return self->_appShortcutIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appShortcutIdentifier, 0);
  objc_storeStrong((id *)&self->_contextualAction, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
