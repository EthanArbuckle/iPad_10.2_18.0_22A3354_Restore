@implementation WFConfiguredSystemIntentAction

- (WFConfiguredSystemIntentAction)initWithIntent:(id)a3 named:(id)a4 previewIcon:(id)a5 appShortcutIdentifier:(id)a6 contextualParameters:(id)a7 shortcutsMetadata:(id)a8
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  WFConfiguredSystemIntentAction *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  WFConfiguredSystemIntentAction *v27;
  uint64_t v28;
  NSArray *contextualParameters;
  WFConfiguredSystemIntentAction *v30;
  void *v32;
  void *v33;
  id obj;
  id v35;
  objc_super v36;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  obj = a6;
  v35 = a6;
  v19 = a7;
  v20 = a8;
  if (v17)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFConfiguredSystemIntentAction.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFConfiguredSystemIntentAction.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("intent"));

LABEL_3:
  v21 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v16, "launchId");
  v22 = self;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appIntentIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@.%@"), v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "launchId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36.receiver = v22;
  v36.super_class = (Class)WFConfiguredSystemIntentAction;
  v27 = -[WFConfiguredStaccatoAction initWithIdentifier:associatedBundleIdentifier:name:previewIcon:shortcutsMetadata:](&v36, sel_initWithIdentifier_associatedBundleIdentifier_name_previewIcon_shortcutsMetadata_, v25, v26, v17, v18, v20);

  if (v27)
  {
    objc_storeStrong((id *)&v27->_intent, a3);
    objc_storeStrong((id *)&v27->_appShortcutIdentifier, obj);
    v28 = objc_msgSend(v19, "copy");
    contextualParameters = v27->_contextualParameters;
    v27->_contextualParameters = (NSArray *)v28;

    v30 = v27;
  }

  return v27;
}

- (WFConfiguredSystemIntentAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  WFConfiguredSystemIntentAction *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appShortcutIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("contextualParameters"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previewIcon"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortcutsMetadata"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  if (v6 && v5)
  {
    self = -[WFConfiguredSystemIntentAction initWithIntent:named:previewIcon:appShortcutIdentifier:contextualParameters:shortcutsMetadata:](self, "initWithIntent:named:previewIcon:appShortcutIdentifier:contextualParameters:shortcutsMetadata:", v6, v5, v12, v7, v11, v13);
    v14 = self;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFConfiguredSystemIntentAction;
  v4 = a3;
  -[WFConfiguredStaccatoAction encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[WFConfiguredSystemIntentAction intent](self, "intent", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("intent"));

  -[WFConfiguredSystemIntentAction appShortcutIdentifier](self, "appShortcutIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("appShortcutIdentifier"));

  -[WFConfiguredSystemIntentAction contextualParameters](self, "contextualParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("contextualParameters"));

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
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[WFConfiguredStaccatoAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredStaccatoAction name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredStaccatoAction associatedBundleIdentifier](self, "associatedBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredSystemIntentAction appShortcutIdentifier](self, "appShortcutIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredSystemIntentAction contextualParameters](self, "contextualParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredSystemIntentAction intent](self, "intent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%p): id: %@ name: %@, bundle: %@, asi: %@, contextual parameters: %@ intent: %@>"), v4, self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  WFConfiguredSystemIntentAction *v4;
  WFConfiguredSystemIntentAction *v5;
  WFConfiguredSystemIntentAction *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  objc_super v25;

  v4 = (WFConfiguredSystemIntentAction *)a3;
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
        v25.receiver = self;
        v25.super_class = (Class)WFConfiguredSystemIntentAction;
        if (-[WFConfiguredStaccatoAction isEqual:](&v25, sel_isEqual_, v5))
        {
          v6 = v5;
          -[WFConfiguredSystemIntentAction intent](self, "intent");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFConfiguredSystemIntentAction intent](v6, "intent");
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
              goto LABEL_26;
            v15 = objc_msgSend(v9, "isEqual:", v10);

            if (!v15)
            {
              LOBYTE(v12) = 0;
LABEL_27:

              goto LABEL_28;
            }
          }
          -[WFConfiguredSystemIntentAction appShortcutIdentifier](self, "appShortcutIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFConfiguredSystemIntentAction appShortcutIdentifier](v6, "appShortcutIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v16;
          v18 = v17;
          v13 = v18;
          if (v14 == v18)
          {

          }
          else
          {
            LOBYTE(v12) = 0;
            v19 = v18;
            v20 = v14;
            if (!v14 || !v18)
            {
LABEL_25:

LABEL_26:
              goto LABEL_27;
            }
            v12 = objc_msgSend(v14, "isEqual:", v18);

            if (!v12)
              goto LABEL_26;
          }
          -[WFConfiguredSystemIntentAction contextualParameters](self, "contextualParameters");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFConfiguredSystemIntentAction contextualParameters](v6, "contextualParameters");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v21;
          v23 = v22;
          v19 = v23;
          if (v20 == v23)
          {
            LOBYTE(v12) = 1;
          }
          else
          {
            LOBYTE(v12) = 0;
            if (v20 && v23)
              LOBYTE(v12) = objc_msgSend(v20, "isEqualToArray:", v23);
          }

          goto LABEL_25;
        }
      }
    }
    LOBYTE(v12) = 0;
  }
LABEL_28:

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
  void *v9;
  id v10;
  unint64_t v11;
  objc_super v13;

  v3 = (void *)objc_opt_new();
  v13.receiver = self;
  v13.super_class = (Class)WFConfiguredSystemIntentAction;
  v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFConfiguredStaccatoAction hash](&v13, sel_hash));
  -[WFConfiguredSystemIntentAction intent](self, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "combine:", v5);

  -[WFConfiguredSystemIntentAction appShortcutIdentifier](self, "appShortcutIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "combine:", v7);

  -[WFConfiguredSystemIntentAction contextualParameters](self, "contextualParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "combine:", v9);

  v11 = objc_msgSend(v3, "finalize");
  return v11;
}

- (INAppIntent)intent
{
  return self->_intent;
}

- (void)setIntent:(id)a3
{
  objc_storeStrong((id *)&self->_intent, a3);
}

- (WFExecutableAppShortcutIdentifier)appShortcutIdentifier
{
  return self->_appShortcutIdentifier;
}

- (void)setAppShortcutIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appShortcutIdentifier, a3);
}

- (NSArray)contextualParameters
{
  return self->_contextualParameters;
}

- (void)setContextualParameters:(id)a3
{
  objc_storeStrong((id *)&self->_contextualParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualParameters, 0);
  objc_storeStrong((id *)&self->_appShortcutIdentifier, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
