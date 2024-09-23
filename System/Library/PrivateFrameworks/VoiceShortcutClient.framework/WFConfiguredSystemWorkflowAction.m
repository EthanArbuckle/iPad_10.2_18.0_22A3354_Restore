@implementation WFConfiguredSystemWorkflowAction

- (WFConfiguredSystemWorkflowAction)initWithWorkflow:(id)a3 shortcutsMetadata:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  WFWorkflowIcon *v11;
  void *v12;
  WFConfiguredSystemWorkflowAction *v13;
  void *v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFConfiguredSystemWorkflowAction.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflowDescriptor"));

  }
  objc_msgSend(v7, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WFWorkflowIcon initWithBackgroundColorValue:glyphCharacter:customImageData:]([WFWorkflowIcon alloc], "initWithBackgroundColorValue:glyphCharacter:customImageData:", objc_msgSend(v7, "color"), objc_msgSend(v7, "glyphCharacter"), 0);
  objc_msgSend(v7, "associatedAppBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WFConfiguredSystemWorkflowAction initWithName:workflowIdentifier:workflowIcon:associatedBundleIdentifier:shortcutsMetadata:](self, "initWithName:workflowIdentifier:workflowIcon:associatedBundleIdentifier:shortcutsMetadata:", v9, v10, v11, v12, v8);

  return v13;
}

- (WFConfiguredSystemWorkflowAction)initWithName:(id)a3 workflowIdentifier:(id)a4 workflowIcon:(id)a5 associatedBundleIdentifier:(id)a6 shortcutsMetadata:(id)a7
{
  id v13;
  id v14;
  id v15;
  __CFString *v16;
  id v17;
  __CFString *v18;
  void *v19;
  WFConfiguredSystemWorkflowAction *v20;
  uint64_t v21;
  NSString *workflowIdentifier;
  WFConfiguredSystemWorkflowAction *v23;
  void *v25;
  void *v26;
  objc_super v27;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (__CFString *)a6;
  v17 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFConfiguredSystemWorkflowAction.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v14)
    {
LABEL_3:
      if (v16)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFConfiguredSystemWorkflowAction.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflowIdentifier"));

  if (!v16)
  {
LABEL_4:
    v16 = CFSTR("com.apple.shortcuts");
    v18 = CFSTR("com.apple.shortcuts");
  }
LABEL_5:
  objc_msgSend(v15, "icon");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)WFConfiguredSystemWorkflowAction;
  v20 = -[WFConfiguredStaccatoAction initWithIdentifier:associatedBundleIdentifier:name:previewIcon:shortcutsMetadata:](&v27, sel_initWithIdentifier_associatedBundleIdentifier_name_previewIcon_shortcutsMetadata_, v14, v16, v13, v19, v17);

  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    workflowIdentifier = v20->_workflowIdentifier;
    v20->_workflowIdentifier = (NSString *)v21;

    objc_storeStrong((id *)&v20->_workflowIcon, a5);
    v23 = v20;
  }

  return v20;
}

- (WFConfiguredSystemWorkflowAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WFConfiguredSystemWorkflowAction *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workflowIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedBundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortcutsMetadata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workflowIcon"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (v5 && v6)
  {
    self = -[WFConfiguredSystemWorkflowAction initWithName:workflowIdentifier:workflowIcon:associatedBundleIdentifier:shortcutsMetadata:](self, "initWithName:workflowIdentifier:workflowIcon:associatedBundleIdentifier:shortcutsMetadata:", v5, v6, v9, v7, v8);
    v10 = self;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFConfiguredSystemWorkflowAction;
  v4 = a3;
  -[WFConfiguredStaccatoAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[WFConfiguredSystemWorkflowAction workflowIcon](self, "workflowIcon", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("workflowIcon"));

  -[WFConfiguredSystemWorkflowAction workflowIdentifier](self, "workflowIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("workflowIdentifier"));

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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[WFConfiguredStaccatoAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredStaccatoAction name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredStaccatoAction associatedBundleIdentifier](self, "associatedBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfiguredSystemWorkflowAction workflowIdentifier](self, "workflowIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%p): id: %@ name: %@, bundle: %@, workflow: %@>"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  WFConfiguredSystemWorkflowAction *v4;
  WFConfiguredSystemWorkflowAction *v5;
  WFConfiguredSystemWorkflowAction *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  objc_super v14;

  v4 = (WFConfiguredSystemWorkflowAction *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         && (v14.receiver = self,
             v14.super_class = (Class)WFConfiguredSystemWorkflowAction,
             -[WFConfiguredStaccatoAction isEqual:](&v14, sel_isEqual_, v5)))
  {
    v6 = v5;
    -[WFConfiguredSystemWorkflowAction workflowIdentifier](self, "workflowIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFConfiguredSystemWorkflowAction workflowIdentifier](v6, "workflowIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
      v12 = 1;
    }
    else
    {
      v12 = 0;
      if (v9 && v10)
        v12 = objc_msgSend(v9, "isEqualToString:", v10);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  objc_super v9;

  v3 = (void *)objc_opt_new();
  v9.receiver = self;
  v9.super_class = (Class)WFConfiguredSystemWorkflowAction;
  v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFConfiguredStaccatoAction hash](&v9, sel_hash));
  -[WFConfiguredSystemWorkflowAction workflowIdentifier](self, "workflowIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "combine:", v5);

  v7 = objc_msgSend(v3, "finalize");
  return v7;
}

- (id)previewIcon
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFAppIcon *v10;
  void *v11;
  WFAppIcon *v12;
  objc_super v13;

  -[WFConfiguredStaccatoAction associatedBundleIdentifier](self, "associatedBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts"));

  if ((v4 & 1) != 0)
  {
    -[WFConfiguredSystemWorkflowAction workflowIcon](self, "workflowIcon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[WFConfiguredSystemWorkflowAction workflowIcon](self, "workflowIcon");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "icon");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      return v8;
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)WFConfiguredSystemWorkflowAction;
      -[WFConfiguredStaccatoAction previewIcon](&v13, sel_previewIcon);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v10 = [WFAppIcon alloc];
    -[WFConfiguredStaccatoAction associatedBundleIdentifier](self, "associatedBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WFAppIcon initWithBundleIdentifier:](v10, "initWithBundleIdentifier:", v11);

    return v12;
  }
}

- (NSString)workflowIdentifier
{
  return self->_workflowIdentifier;
}

- (void)setWorkflowIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (WFWorkflowIcon)workflowIcon
{
  return self->_workflowIcon;
}

- (void)setWorkflowIcon:(id)a3
{
  objc_storeStrong((id *)&self->_workflowIcon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowIcon, 0);
  objc_storeStrong((id *)&self->_workflowIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
