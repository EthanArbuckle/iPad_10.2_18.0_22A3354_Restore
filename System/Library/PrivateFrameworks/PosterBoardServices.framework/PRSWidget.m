@implementation PRSWidget

- (PRSWidget)initWithUniqueIdentifier:(id)a3 kind:(id)a4 extensionBundleIdentifier:(id)a5 containerBundleIdentifier:(id)a6 family:(unint64_t)a7 intent:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PRSWidget *v20;
  uint64_t v21;
  NSString *uniqueIdentifier;
  uint64_t v23;
  NSString *kind;
  uint64_t v25;
  NSString *extensionBundleIdentifier;
  uint64_t v27;
  NSString *containerBundleIdentifier;
  void *v30;
  void *v31;
  objc_super v32;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSWidget.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueIdentifier"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSWidget.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind"));

LABEL_3:
  v32.receiver = self;
  v32.super_class = (Class)PRSWidget;
  v20 = -[PRSWidget init](&v32, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v15, "copy");
    uniqueIdentifier = v20->_uniqueIdentifier;
    v20->_uniqueIdentifier = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    kind = v20->_kind;
    v20->_kind = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    extensionBundleIdentifier = v20->_extensionBundleIdentifier;
    v20->_extensionBundleIdentifier = (NSString *)v25;

    v27 = objc_msgSend(v18, "copy");
    containerBundleIdentifier = v20->_containerBundleIdentifier;
    v20->_containerBundleIdentifier = (NSString *)v27;

    v20->_family = a7;
    objc_storeStrong((id *)&v20->_intent, a8);
  }

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:family:intent:", self->_uniqueIdentifier, self->_kind, self->_extensionBundleIdentifier, self->_containerBundleIdentifier, self->_family, self->_intent);
}

- (NSString)description
{
  return (NSString *)-[PRSWidget descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSString *uniqueIdentifier;
  uint64_t v7;
  id v8;
  id v9;
  NSString *kind;
  id v11;
  id v12;
  NSString *containerBundleIdentifier;
  id v14;
  id v15;
  NSString *extensionBundleIdentifier;
  id v17;
  id v18;
  unint64_t family;
  id v20;
  id v21;
  INIntent *intent;
  id v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  id (*v28)(uint64_t);
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uniqueIdentifier = self->_uniqueIdentifier;
  v7 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __21__PRSWidget_isEqual___block_invoke;
  v39[3] = &unk_1E4D42E28;
  v8 = v4;
  v40 = v8;
  v9 = (id)objc_msgSend(v5, "appendString:counterpart:", uniqueIdentifier, v39);
  kind = self->_kind;
  v37[0] = v7;
  v37[1] = 3221225472;
  v37[2] = __21__PRSWidget_isEqual___block_invoke_2;
  v37[3] = &unk_1E4D42E28;
  v11 = v8;
  v38 = v11;
  v12 = (id)objc_msgSend(v5, "appendString:counterpart:", kind, v37);
  containerBundleIdentifier = self->_containerBundleIdentifier;
  v35[0] = v7;
  v35[1] = 3221225472;
  v35[2] = __21__PRSWidget_isEqual___block_invoke_3;
  v35[3] = &unk_1E4D42E28;
  v14 = v11;
  v36 = v14;
  v15 = (id)objc_msgSend(v5, "appendString:counterpart:", containerBundleIdentifier, v35);
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  v33[0] = v7;
  v33[1] = 3221225472;
  v33[2] = __21__PRSWidget_isEqual___block_invoke_4;
  v33[3] = &unk_1E4D42E28;
  v17 = v14;
  v34 = v17;
  v18 = (id)objc_msgSend(v5, "appendString:counterpart:", extensionBundleIdentifier, v33);
  family = self->_family;
  v31[0] = v7;
  v31[1] = 3221225472;
  v31[2] = __21__PRSWidget_isEqual___block_invoke_5;
  v31[3] = &unk_1E4D43398;
  v20 = v17;
  v32 = v20;
  v21 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", family, v31);
  intent = self->_intent;
  v26 = v7;
  v27 = 3221225472;
  v28 = __21__PRSWidget_isEqual___block_invoke_6;
  v29 = &unk_1E4D433C0;
  v30 = v20;
  v23 = v20;
  v24 = (id)objc_msgSend(v5, "appendObject:counterpart:", intent, &v26);
  LOBYTE(intent) = objc_msgSend(v5, "isEqual", v26, v27, v28, v29);

  return (char)intent;
}

id __21__PRSWidget_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

id __21__PRSWidget_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

id __21__PRSWidget_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

id __21__PRSWidget_isEqual___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

uint64_t __21__PRSWidget_isEqual___block_invoke_5(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
}

id __21__PRSWidget_isEqual___block_invoke_6(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 48);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendString:", self->_uniqueIdentifier);
  v5 = (id)objc_msgSend(v3, "appendString:", self->_kind);
  v6 = (id)objc_msgSend(v3, "appendString:", self->_containerBundleIdentifier);
  v7 = (id)objc_msgSend(v3, "appendString:", self->_extensionBundleIdentifier);
  v8 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_family);
  v9 = (id)objc_msgSend(v3, "appendObject:", self->_intent);
  v10 = objc_msgSend(v3, "hash");

  return v10;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PRSWidget succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[PRSWidget descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  -[PRSWidget succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_kind, CFSTR("kind"));
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", self->_extensionBundleIdentifier, CFSTR("extensionBundleIdentifier"));
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", self->_containerBundleIdentifier, CFSTR("containerBundleIdentifier"));
  v9 = (id)objc_msgSend(v4, "appendInteger:withName:", self->_family, CFSTR("family"));
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", self->_intent, CFSTR("intent"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *uniqueIdentifier;
  id v5;

  uniqueIdentifier = self->_uniqueIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uniqueIdentifier, CFSTR("uniqueIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extensionBundleIdentifier, CFSTR("extensionBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_containerBundleIdentifier, CFSTR("containerBundleIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_family, CFSTR("family"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intent, CFSTR("intent"));

}

- (PRSWidget)initWithCoder:(id)a3
{
  id v4;
  PRSWidget *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *uniqueIdentifier;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *kind;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *extensionBundleIdentifier;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *containerBundleIdentifier;
  void *v22;
  uint64_t v23;
  INIntent *intent;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PRSWidget;
  v5 = -[PRSWidget init](&v26, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("uniqueIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, CFSTR("kind"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    kind = v5->_kind;
    v5->_kind = (NSString *)v12;

    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("extensionBundleIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    extensionBundleIdentifier = v5->_extensionBundleIdentifier;
    v5->_extensionBundleIdentifier = (NSString *)v16;

    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, CFSTR("containerBundleIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    containerBundleIdentifier = v5->_containerBundleIdentifier;
    v5->_containerBundleIdentifier = (NSString *)v20;

    v5->_family = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("family"));
    objc_opt_self();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, CFSTR("intent"));
    v23 = objc_claimAutoreleasedReturnValue();
    intent = v5->_intent;
    v5->_intent = (INIntent *)v23;

  }
  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRSWidget)initWithBSXPCCoder:(id)a3
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
  uint64_t v13;
  void *v14;
  void *v15;
  PRSWidget *v16;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("uniqueIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("kind"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("extensionBundleIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, CFSTR("containerBundleIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("family"));
  objc_opt_self();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("intent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[PRSWidget initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:family:intent:](self, "initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:family:intent:", v6, v8, v10, v12, v13, v15);
  return v16;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[PRSWidget uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uniqueIdentifier"));

  -[PRSWidget kind](self, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kind"));

  -[PRSWidget extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("extensionBundleIdentifier"));

  -[PRSWidget containerBundleIdentifier](self, "containerBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("containerBundleIdentifier"));

  objc_msgSend(v4, "encodeUInt64:forKey:", -[PRSWidget family](self, "family"), CFSTR("family"));
  -[PRSWidget intent](self, "intent");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("intent"));

}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (void)setExtensionBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (void)setContainerBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)family
{
  return self->_family;
}

- (void)setFamily:(unint64_t)a3
{
  self->_family = a3;
}

- (INIntent)intent
{
  return self->_intent;
}

- (void)setIntent:(id)a3
{
  objc_storeStrong((id *)&self->_intent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
