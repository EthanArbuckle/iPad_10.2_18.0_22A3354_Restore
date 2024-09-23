@implementation WFLinkActionRunDescriptor

- (WFLinkActionRunDescriptor)initWithIdentifier:(id)a3 name:(id)a4 action:(id)a5 metadata:(id)a6 isAutoShortcut:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  WFLinkActionRunDescriptor *v17;
  WFLinkActionRunDescriptor *v18;
  WFLinkActionRunDescriptor *v19;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (v13)
  {
    if (v15)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowRunDescriptors.m"), 216, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

    if (v16)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowRunDescriptors.m"), 215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  if (!v15)
    goto LABEL_8;
LABEL_3:
  if (v16)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowRunDescriptors.m"), 217, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metadata"));

LABEL_4:
  v25.receiver = self;
  v25.super_class = (Class)WFLinkActionRunDescriptor;
  v17 = -[WFLinkActionRunDescriptor init](&v25, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong((id *)&v18->_action, a5);
    objc_storeStrong((id *)&v18->_metadata, a6);
    objc_storeStrong((id *)&v18->_name, a4);
    v18->_isAutoShortcut = a7;
    v19 = v18;
  }

  return v18;
}

- (WFLinkActionRunDescriptor)initWithIdentifier:(id)a3 action:(id)a4 metadata:(id)a5 isAutoShortcut:(BOOL)a6
{
  return -[WFLinkActionRunDescriptor initWithIdentifier:name:action:metadata:isAutoShortcut:](self, "initWithIdentifier:name:action:metadata:isAutoShortcut:", a3, 0, a4, a5, a6);
}

- (WFLinkActionRunDescriptor)initWithIdentifier:(id)a3 action:(id)a4 metadata:(id)a5
{
  return -[WFLinkActionRunDescriptor initWithIdentifier:action:metadata:isAutoShortcut:](self, "initWithIdentifier:action:metadata:isAutoShortcut:", a3, a4, a5, 0);
}

- (WFLinkActionRunDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  WFLinkActionRunDescriptor *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v5 = (void *)getLNFullyQualifiedActionIdentifierClass_softClass;
  v26 = getLNFullyQualifiedActionIdentifierClass_softClass;
  if (!getLNFullyQualifiedActionIdentifierClass_softClass)
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __getLNFullyQualifiedActionIdentifierClass_block_invoke;
    v21 = &unk_1E5FC8858;
    v22 = &v23;
    __getLNFullyQualifiedActionIdentifierClass_block_invoke((uint64_t)&v18);
    v5 = (void *)v24[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v23, 8);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v8 = (void *)getLNActionClass_softClass;
  v26 = getLNActionClass_softClass;
  if (!getLNActionClass_softClass)
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __getLNActionClass_block_invoke;
    v21 = &unk_1E5FC8858;
    v22 = &v23;
    __getLNActionClass_block_invoke((uint64_t)&v18);
    v8 = (void *)v24[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v23, 8);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("action"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v11 = (void *)getLNActionMetadataClass_softClass;
  v26 = getLNActionMetadataClass_softClass;
  if (!getLNActionMetadataClass_softClass)
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __getLNActionMetadataClass_block_invoke;
    v21 = &unk_1E5FC8858;
    v22 = &v23;
    __getLNActionMetadataClass_block_invoke((uint64_t)&v18);
    v11 = (void *)v24[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v23, 8);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("metadata"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = 0;
  if (v10 && v13)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[WFLinkActionRunDescriptor initWithIdentifier:name:action:metadata:isAutoShortcut:](self, "initWithIdentifier:name:action:metadata:isAutoShortcut:", v7, v16, v10, v14, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAutoShortcut")));

    v15 = self;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WFLinkActionRunDescriptor identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[WFLinkActionRunDescriptor action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("action"));

  -[WFLinkActionRunDescriptor metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("metadata"));

  -[WFLinkActionRunDescriptor name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("name"));

  objc_msgSend(v8, "encodeBool:forKey:", -[WFLinkActionRunDescriptor isAutoShortcut](self, "isAutoShortcut"), CFSTR("isAutoShortcut"));
}

- (id)kind
{
  if (-[WFLinkActionRunDescriptor isAutoShortcut](self, "isAutoShortcut"))
    return CFSTR("AppShortcut");
  else
    return CFSTR("AppIntent");
}

- (LNFullyQualifiedActionIdentifier)identifier
{
  return self->_identifier;
}

- (LNAction)action
{
  return self->_action;
}

- (LNActionMetadata)metadata
{
  return self->_metadata;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isAutoShortcut
{
  return self->_isAutoShortcut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
