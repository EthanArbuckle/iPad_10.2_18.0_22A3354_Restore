@implementation SBSHomeScreenItemApplication

- (SBSHomeScreenItemApplication)initWithBundleIdentifier:(id)a3
{
  id v4;
  SBSHomeScreenItemApplication *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSHomeScreenItemApplication;
  v5 = -[SBSHomeScreenItemApplication init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

  }
  return v5;
}

- (int64_t)kind
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSHomeScreenItemApplication;
  v4 = a3;
  -[SBSHomeScreenItem encodeWithBSXPCCoder:](&v5, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"), v5.receiver, v5.super_class);

}

- (SBSHomeScreenItemApplication)initWithBSXPCCoder:(id)a3
{
  id v4;
  SBSHomeScreenItemApplication *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSHomeScreenItemApplication;
  v5 = -[SBSHomeScreenItem initWithBSXPCCoder:](&v9, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("bundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

  }
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  objc_super v8;

  v3 = (void *)objc_opt_new();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_bundleIdentifier);
  v8.receiver = self;
  v8.super_class = (Class)SBSHomeScreenItemApplication;
  v5 = -[SBSHomeScreenItem hash](&v8, sel_hash);
  v6 = objc_msgSend(v3, "hash") ^ v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSString *bundleIdentifier;
  id v7;
  id v8;
  char v9;
  objc_super v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  bundleIdentifier = self->_bundleIdentifier;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__SBSHomeScreenItemApplication_isEqual___block_invoke;
  v12[3] = &unk_1E288D790;
  v7 = v4;
  v13 = v7;
  v8 = (id)objc_msgSend(v5, "appendObject:counterpart:", bundleIdentifier, v12);
  v11.receiver = self;
  v11.super_class = (Class)SBSHomeScreenItemApplication;
  if (-[SBSHomeScreenItem isEqual:](&v11, sel_isEqual_, v7))
    v9 = objc_msgSend(v5, "isEqual");
  else
    v9 = 0;

  return v9;
}

id __40__SBSHomeScreenItemApplication_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
