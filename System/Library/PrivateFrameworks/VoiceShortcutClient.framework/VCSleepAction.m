@implementation VCSleepAction

- (VCSleepAction)initWithIdentifier:(id)a3 workflowActionIdentifier:(id)a4 sourceAppBundleIdentifier:(id)a5 bundleIdentifierForDisplay:(id)a6 title:(id)a7 subtitle:(id)a8 serializedParameters:(id)a9 shortcutAvailability:(unint64_t)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  VCSleepAction *v24;
  uint64_t v25;
  NSString *identifier;
  uint64_t v27;
  NSString *workflowActionIdentifier;
  uint64_t v29;
  NSString *sourceAppBundleIdentifier;
  uint64_t v31;
  NSString *bundleIdentifierForDisplay;
  uint64_t v33;
  NSString *title;
  uint64_t v35;
  NSString *subtitle;
  uint64_t v37;
  NSDictionary *serializedParameters;
  VCSleepAction *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v45;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCSleepAction.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v18)
    {
LABEL_3:
      if (v19)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCSleepAction.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceAppBundleIdentifier"));

      if (v21)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCSleepAction.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflowActionIdentifier"));

  if (!v19)
    goto LABEL_10;
LABEL_4:
  if (v21)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCSleepAction.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

LABEL_5:
  v45.receiver = self;
  v45.super_class = (Class)VCSleepAction;
  v24 = -[VCSleepAction init](&v45, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v17, "copy");
    identifier = v24->_identifier;
    v24->_identifier = (NSString *)v25;

    v27 = objc_msgSend(v18, "copy");
    workflowActionIdentifier = v24->_workflowActionIdentifier;
    v24->_workflowActionIdentifier = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    sourceAppBundleIdentifier = v24->_sourceAppBundleIdentifier;
    v24->_sourceAppBundleIdentifier = (NSString *)v29;

    v31 = objc_msgSend(v20, "copy");
    bundleIdentifierForDisplay = v24->_bundleIdentifierForDisplay;
    v24->_bundleIdentifierForDisplay = (NSString *)v31;

    v33 = objc_msgSend(v21, "copy");
    title = v24->_title;
    v24->_title = (NSString *)v33;

    v35 = objc_msgSend(v22, "copy");
    subtitle = v24->_subtitle;
    v24->_subtitle = (NSString *)v35;

    v37 = objc_msgSend(v23, "copy");
    serializedParameters = v24->_serializedParameters;
    v24->_serializedParameters = (NSDictionary *)v37;

    v24->_shortcutAvailability = a10;
    v24->_goodForSleep = a10 != 0;
    v39 = v24;
  }

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  VCSleepAction *v4;
  VCSleepAction *v5;
  VCSleepAction *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (VCSleepAction *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[VCSleepAction identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCSleepAction identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[VCSleepAction identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[VCSleepAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[VCSleepAction sourceAppBundleIdentifier](self, "sourceAppBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sourceAppBundleIdentifier"));

  -[VCSleepAction serializedParameters](self, "serializedParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("serializedParameters"));

  -[VCSleepAction bundleIdentifierForDisplay](self, "bundleIdentifierForDisplay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("bundleIdentifierForDisplay"));

  -[VCSleepAction title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("title"));

  -[VCSleepAction subtitle](self, "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("subtitle"));

  -[VCSleepAction workflowActionIdentifier](self, "workflowActionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("workflowActionIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VCSleepAction shortcutAvailability](self, "shortcutAvailability"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("shortcutAvailability"));

}

- (VCSleepAction)initWithCoder:(id)a3
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
  void *v12;
  void *v13;
  VCSleepAction *v14;
  void *v16;
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workflowActionIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceAppBundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifierForDisplay"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  v18[2] = objc_opt_class();
  v18[3] = objc_opt_class();
  v18[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v11, CFSTR("serializedParameters"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortcutAvailability"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[VCSleepAction initWithIdentifier:workflowActionIdentifier:sourceAppBundleIdentifier:bundleIdentifierForDisplay:title:subtitle:serializedParameters:shortcutAvailability:](self, "initWithIdentifier:workflowActionIdentifier:sourceAppBundleIdentifier:bundleIdentifierForDisplay:title:subtitle:serializedParameters:shortcutAvailability:", v16, v4, v5, v6, v7, v8, v12, objc_msgSend(v13, "unsignedIntegerValue"));
  return v14;
}

- (NSString)bundleIdentifierForDisplay
{
  return self->_bundleIdentifierForDisplay;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (BOOL)isGoodForSleep
{
  return self->_goodForSleep;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)shortcutAvailability
{
  return self->_shortcutAvailability;
}

- (NSString)workflowActionIdentifier
{
  return self->_workflowActionIdentifier;
}

- (void)setWorkflowActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)serializedParameters
{
  return self->_serializedParameters;
}

- (void)setSerializedParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)sourceAppBundleIdentifier
{
  return self->_sourceAppBundleIdentifier;
}

- (void)setSourceAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_serializedParameters, 0);
  objc_storeStrong((id *)&self->_workflowActionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierForDisplay, 0);
}

+ (id)openAppActionWithBundleIdentifier:(id)a3
{
  id v3;
  VCSleepOpenAppAction *v4;

  v3 = a3;
  v4 = -[VCSleepOpenAppAction initWithBundleIdentifier:]([VCSleepOpenAppAction alloc], "initWithBundleIdentifier:", v3);

  return v4;
}

+ (id)identifierForWorkflowActionIdentifier:(id)a3 serializedParameters:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D3E558]);
  v8 = (id)objc_msgSend(v7, "combine:", v5);
  v9 = (id)objc_msgSend(v7, "combineContentsOfPropertyListObject:", v6);
  v10 = objc_msgSend(v7, "finalize");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%2llX"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)homeAccessoryActionWithTriggerActionSetsBuilder:(id)a3
{
  id v3;
  VCSleepHomeAccessoryAction *v4;

  v3 = a3;
  v4 = -[VCSleepHomeAccessoryAction initWithTriggerActionSetsBuilder:]([VCSleepHomeAccessoryAction alloc], "initWithTriggerActionSetsBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
