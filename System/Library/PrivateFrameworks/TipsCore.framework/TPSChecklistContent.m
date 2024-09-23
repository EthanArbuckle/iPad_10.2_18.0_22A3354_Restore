@implementation TPSChecklistContent

- (TPSChecklistContent)initWithDictionary:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  TPSChecklistContent *v12;
  uint64_t v13;
  NSString *subtitle;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "TPSSafeDictionaryForKey:", CFSTR("tipIcon"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)objc_msgSend(v6, "mutableCopy"),
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("assets")),
        v9))
  {
    v10 = (void *)objc_msgSend(v9, "copy");

    v11 = 0;
  }
  else
  {
    v11 = 1;
    v10 = v6;
  }
  v16.receiver = self;
  v16.super_class = (Class)TPSChecklistContent;
  v12 = -[TPSContent initWithDictionary:metadata:](&v16, sel_initWithDictionary_metadata_, v10, v7);
  if ((v11 & 1) == 0)

  if (v12)
  {
    objc_msgSend(v6, "TPSSafeStringForKey:", CFSTR("subtitle"));
    v13 = objc_claimAutoreleasedReturnValue();
    subtitle = v12->_subtitle;
    v12->_subtitle = (NSString *)v13;

  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSChecklistContent;
  v4 = a3;
  -[TPSContent encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[TPSChecklistContent subtitle](self, "subtitle", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("subtitle"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSChecklistContent;
  v4 = -[TPSContent copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[TPSChecklistContent subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubtitle:", v5);

  return v4;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (TPSChecklistContent)initWithCoder:(id)a3
{
  id v4;
  TPSChecklistContent *v5;
  uint64_t v6;
  NSString *subtitle;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSChecklistContent;
  v5 = -[TPSContent initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v9.receiver = self;
  v9.super_class = (Class)TPSChecklistContent;
  -[TPSContent debugDescription](&v9, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSChecklistContent subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TPSChecklistContent subtitle](self, "subtitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("subtitle"), v7);

  }
  return v5;
}

+ (id)na_identity
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__TPSChecklistContent_na_identity__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  __34__TPSChecklistContent_na_identity__block_invoke((uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __34__TPSChecklistContent_na_identity__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__TPSChecklistContent_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (TPSChecklistTipIconKey_block_invoke_na_once_token_0 != -1)
    dispatch_once(&TPSChecklistTipIconKey_block_invoke_na_once_token_0, block);
  return (id)TPSChecklistTipIconKey_block_invoke_na_once_object_0;
}

void __34__TPSChecklistContent_na_identity__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__TPSChecklistContent_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(_QWORD *)(a1 + 32);
  __34__TPSChecklistContent_na_identity__block_invoke_3((uint64_t)v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)TPSChecklistTipIconKey_block_invoke_na_once_object_0;
  TPSChecklistTipIconKey_block_invoke_na_once_object_0 = v1;

}

id __34__TPSChecklistContent_na_identity__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v1 = (void *)MEMORY[0x1E0D519C8];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___TPSChecklistContent;
  objc_msgSendSuper2(&v7, sel_na_identity);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "builderWithIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_12);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __34__TPSChecklistContent_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "subtitle");
}

@end
