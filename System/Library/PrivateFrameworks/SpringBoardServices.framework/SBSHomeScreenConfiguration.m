@implementation SBSHomeScreenConfiguration

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_layout, CFSTR("layout"));

}

- (SBSHomeScreenConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  SBSHomeScreenConfiguration *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  SBSHomeScreenConfigurationLayout *layout;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSHomeScreenConfiguration;
  v5 = -[SBSHomeScreenConfiguration init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("layout"));
    v8 = objc_claimAutoreleasedReturnValue();
    layout = v5->_layout;
    v5->_layout = (SBSHomeScreenConfigurationLayout *)v8;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_name, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[SBSHomeScreenConfigurationLayout copy](self->_layout, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_name);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_layout);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSString *name;
  uint64_t v7;
  id v8;
  id v9;
  SBSHomeScreenConfigurationLayout *layout;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __38__SBSHomeScreenConfiguration_isEqual___block_invoke;
  v19[3] = &unk_1E288EEB0;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendString:counterpart:", name, v19);
  layout = self->_layout;
  v14 = v7;
  v15 = 3221225472;
  v16 = __38__SBSHomeScreenConfiguration_isEqual___block_invoke_2;
  v17 = &unk_1E288D790;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", layout, &v14);
  LOBYTE(layout) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return (char)layout;
}

id __38__SBSHomeScreenConfiguration_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

id __38__SBSHomeScreenConfiguration_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_name, CFSTR("name"));
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_layout, CFSTR("layout"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SBSHomeScreenConfigurationLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
