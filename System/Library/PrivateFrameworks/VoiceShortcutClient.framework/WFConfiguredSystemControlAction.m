@implementation WFConfiguredSystemControlAction

- (WFConfiguredSystemControlAction)initWithIntent:(id)a3 named:(id)a4 extensionBundleIdentifier:(id)a5 containerBundleIdentifier:(id)a6 kind:(id)a7 controlType:(id)a8
{
  INIntent *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSNumber *v20;
  void *v21;
  id v22;
  WFConfiguredSystemControlAction *v23;
  INIntent *intent;
  INIntent *v25;
  uint64_t v26;
  NSString *extensionBundleIdentifier;
  uint64_t v28;
  NSString *containerBundleIdentifier;
  uint64_t v30;
  NSString *kind;
  NSNumber *controlType;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;

  v15 = (INIntent *)a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = (NSNumber *)a8;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFConfiguredSystemControlAction.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v17)
    {
LABEL_3:
      if (v19)
        goto LABEL_4;
LABEL_11:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFConfiguredSystemControlAction.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind"));

      if (v20)
        goto LABEL_5;
      goto LABEL_12;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFConfiguredSystemControlAction.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionBundleIdentifier"));

  if (!v19)
    goto LABEL_11;
LABEL_4:
  if (v20)
    goto LABEL_5;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFConfiguredSystemControlAction.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("controlType"));

LABEL_5:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v17, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    v22 = v18;
  else
    v22 = v17;
  v38.receiver = self;
  v38.super_class = (Class)WFConfiguredSystemControlAction;
  v23 = -[WFConfiguredStaccatoAction initWithIdentifier:associatedBundleIdentifier:name:previewIcon:shortcutsMetadata:](&v38, sel_initWithIdentifier_associatedBundleIdentifier_name_previewIcon_shortcutsMetadata_, v21, v22, v16, 0, 0);
  intent = v23->_intent;
  v23->_intent = v15;
  v25 = v15;

  v26 = objc_msgSend(v17, "copy");
  extensionBundleIdentifier = v23->_extensionBundleIdentifier;
  v23->_extensionBundleIdentifier = (NSString *)v26;

  v28 = objc_msgSend(v18, "copy");
  containerBundleIdentifier = v23->_containerBundleIdentifier;
  v23->_containerBundleIdentifier = (NSString *)v28;

  v30 = objc_msgSend(v19, "copy");
  kind = v23->_kind;
  v23->_kind = (NSString *)v30;

  controlType = v23->_controlType;
  v23->_controlType = v20;

  return v23;
}

- (WFConfiguredSystemControlAction)initWithIntent:(id)a3 named:(id)a4 extensionBundleIdentifier:(id)a5 containerBundleIdentifier:(id)a6 kind:(id)a7
{
  return -[WFConfiguredSystemControlAction initWithIntent:named:extensionBundleIdentifier:containerBundleIdentifier:kind:controlType:](self, "initWithIntent:named:extensionBundleIdentifier:containerBundleIdentifier:kind:controlType:", a3, a4, a5, a6, a7, &unk_1E60028C8);
}

- (WFConfiguredSystemControlAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WFConfiguredSystemControlAction *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionBundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerBundleIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("controlType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (v6 && v7 && v9 && v10)
  {
    self = -[WFConfiguredSystemControlAction initWithIntent:named:extensionBundleIdentifier:containerBundleIdentifier:kind:controlType:](self, "initWithIntent:named:extensionBundleIdentifier:containerBundleIdentifier:kind:controlType:", v5, v6, v7, v8, v9, v10);
    v11 = self;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFConfiguredSystemControlAction;
  v4 = a3;
  -[WFConfiguredStaccatoAction encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[WFConfiguredSystemControlAction intent](self, "intent", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("intent"));

  -[WFConfiguredSystemControlAction extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("extensionBundleIdentifier"));

  -[WFConfiguredSystemControlAction containerBundleIdentifier](self, "containerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("containerBundleIdentifier"));

  -[WFConfiguredSystemControlAction kind](self, "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kind"));

  -[WFConfiguredSystemControlAction controlType](self, "controlType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("controlType"));

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
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[WFConfiguredStaccatoAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredStaccatoAction name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredSystemControlAction extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredSystemControlAction containerBundleIdentifier](self, "containerBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredSystemControlAction kind](self, "kind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredSystemControlAction intent](self, "intent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredSystemControlAction controlType](self, "controlType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%p): id: %@ name: %@, extensionBundleIdentifier: %@, containerBundleIdentifier: %@, kind: %@, intent: %@, controlType: %@>"), v4, self, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  WFConfiguredSystemControlAction *v4;
  WFConfiguredSystemControlAction *v5;
  WFConfiguredSystemControlAction *v6;
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
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v37;
  void *v38;
  id v39;
  id v40;
  objc_super v41;

  v4 = (WFConfiguredSystemControlAction *)a3;
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
        v41.receiver = self;
        v41.super_class = (Class)WFConfiguredSystemControlAction;
        if (-[WFConfiguredStaccatoAction isEqual:](&v41, sel_isEqual_, v5))
        {
          v6 = v5;
          -[WFConfiguredSystemControlAction intent](self, "intent");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFConfiguredSystemControlAction intent](v6, "intent");
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
              goto LABEL_43;
            v15 = objc_msgSend(v9, "isEqual:", v10);

            if (!v15)
            {
              LOBYTE(v12) = 0;
LABEL_44:

              goto LABEL_45;
            }
          }
          -[WFConfiguredSystemControlAction extensionBundleIdentifier](self, "extensionBundleIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFConfiguredSystemControlAction extensionBundleIdentifier](v6, "extensionBundleIdentifier");
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
              goto LABEL_42;
            v21 = objc_msgSend(v14, "isEqualToString:", v18);

            if (!v21)
            {
              LOBYTE(v12) = 0;
LABEL_43:

              goto LABEL_44;
            }
          }
          -[WFConfiguredSystemControlAction containerBundleIdentifier](self, "containerBundleIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFConfiguredSystemControlAction containerBundleIdentifier](v6, "containerBundleIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v22;
          v24 = v23;
          v19 = v24;
          v40 = v20;
          if (v20 == v24)
          {

          }
          else
          {
            LOBYTE(v12) = 0;
            v25 = v24;
            if (!v20 || !v24)
              goto LABEL_41;
            v12 = objc_msgSend(v20, "isEqualToString:", v24);

            if (!v12)
              goto LABEL_42;
          }
          -[WFConfiguredSystemControlAction kind](self, "kind", v19);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFConfiguredSystemControlAction kind](v6, "kind");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v26;
          v29 = v27;
          v38 = v29;
          v39 = v28;
          if (v28 == v29)
          {

          }
          else
          {
            LOBYTE(v12) = 0;
            if (!v28)
            {
              v30 = v29;
              v19 = v37;
              goto LABEL_39;
            }
            v30 = v29;
            v19 = v37;
            if (!v29)
            {
LABEL_39:

              goto LABEL_40;
            }
            v31 = objc_msgSend(v28, "isEqualToString:", v29);

            if (!v31)
            {
              LOBYTE(v12) = 0;
              v19 = v37;
LABEL_40:
              v25 = v38;
              v20 = v39;
LABEL_41:

              v20 = v40;
LABEL_42:

              goto LABEL_43;
            }
          }
          -[WFConfiguredSystemControlAction controlType](self, "controlType");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFConfiguredSystemControlAction controlType](v6, "controlType");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v32;
          v34 = v33;
          v35 = v34;
          if (v28 == v34)
          {
            LOBYTE(v12) = 1;
          }
          else
          {
            LOBYTE(v12) = 0;
            if (v28)
            {
              v19 = v37;
              if (v34)
                LOBYTE(v12) = objc_msgSend(v28, "isEqual:", v34);
              goto LABEL_37;
            }
          }
          v19 = v37;
LABEL_37:

          v30 = v35;
          goto LABEL_39;
        }
      }
    }
    LOBYTE(v12) = 0;
  }
LABEL_45:

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
  void *v11;
  id v12;
  void *v13;
  id v14;
  unint64_t v15;
  objc_super v17;

  v3 = (void *)objc_opt_new();
  v17.receiver = self;
  v17.super_class = (Class)WFConfiguredSystemControlAction;
  v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFConfiguredStaccatoAction hash](&v17, sel_hash));
  -[WFConfiguredSystemControlAction intent](self, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "combine:", v5);

  -[WFConfiguredSystemControlAction extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "combine:", v7);

  -[WFConfiguredSystemControlAction containerBundleIdentifier](self, "containerBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "combine:", v9);

  -[WFConfiguredSystemControlAction kind](self, "kind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "combine:", v11);

  -[WFConfiguredSystemControlAction controlType](self, "controlType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "combine:", v13);

  v15 = objc_msgSend(v3, "finalize");
  return v15;
}

- (INIntent)intent
{
  return self->_intent;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSNumber)controlType
{
  return self->_controlType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlType, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
