@implementation SBSBackgroundContentDefinition

- (SBSBackgroundContentDefinition)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SBSBackgroundContentDefinition *v7;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SBSBackgroundContentDefinition initWithSceneIdentifier:clientBundleIdentifier:](self, "initWithSceneIdentifier:clientBundleIdentifier:", v4, v6);
  return v7;
}

- (SBSBackgroundContentDefinition)initWithSceneIdentifier:(id)a3 clientBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  SBSBackgroundContentDefinition *v9;
  uint64_t v10;
  NSString *clientBundleIdentifier;
  uint64_t v12;
  NSString *sceneIdentifier;
  void *v15;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSBackgroundContentDefinition.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clientBundleIdentifier"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSBackgroundContentDefinition.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneIdentifier"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)SBSBackgroundContentDefinition;
  v9 = -[SBSBackgroundContentDefinition init](&v17, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    clientBundleIdentifier = v9->_clientBundleIdentifier;
    v9->_clientBundleIdentifier = (NSString *)v10;

    v12 = objc_msgSend(v7, "copy");
    sceneIdentifier = v9->_sceneIdentifier;
    v9->_sceneIdentifier = (NSString *)v12;

  }
  return v9;
}

- (NSString)description
{
  return (NSString *)-[SBSBackgroundContentDefinition descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (SBSBackgroundContentDefinition)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBSBackgroundContentDefinition *v7;

  v4 = a3;
  BSDeserializeStringFromXPCDictionaryWithKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeStringFromXPCDictionaryWithKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SBSBackgroundContentDefinition initWithSceneIdentifier:clientBundleIdentifier:](self, "initWithSceneIdentifier:clientBundleIdentifier:", v6, v5);
  return v7;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v3;

  if (a3)
  {
    v3 = a3;
    BSSerializeStringToXPCDictionaryWithKey();
    BSSerializeStringToXPCDictionaryWithKey();

  }
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSBackgroundContentDefinition succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSBackgroundContentDefinition descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBSBackgroundContentDefinition *v11;

  v4 = a3;
  -[SBSBackgroundContentDefinition succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__SBSBackgroundContentDefinition_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E288D940;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __72__SBSBackgroundContentDefinition_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("clientBundleIdentifier"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("sceneIdentifier"));
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
}

@end
