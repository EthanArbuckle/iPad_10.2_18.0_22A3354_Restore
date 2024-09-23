@implementation PTRestoreDefaultSettingsRowAction

+ (id)action
{
  return (id)objc_msgSend(a1, "actionWithSettingsKeyPath:", 0);
}

+ (id)actionWithSettingsKeyPath:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = objc_msgSend(v3, "copy");

  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (id)defaultHandler
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__PTRestoreDefaultSettingsRowAction_defaultHandler__block_invoke;
  v3[3] = &unk_1E70585B8;
  v3[4] = self;
  return (id)MEMORY[0x1BCCC265C](v3, a2);
}

BOOL __51__PTRestoreDefaultSettingsRowAction_defaultHandler__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "childSettingsForKeyPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "restoreDefaultValues");

  return v3 != 0;
}

- (BOOL)isEqual:(id)a3
{
  PTRestoreDefaultSettingsRowAction *v4;
  char v5;
  objc_super v7;

  v4 = (PTRestoreDefaultSettingsRowAction *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PTRestoreDefaultSettingsRowAction;
    if (-[PTRowAction isEqual:](&v7, sel_isEqual_, v4))
      v5 = BSEqualStrings();
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = 3221225472;
  v8[2] = __41__PTRestoreDefaultSettingsRowAction_hash__block_invoke;
  v8[3] = &unk_1E7058178;
  v8[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v4 = (id)objc_msgSend(v3, "appendHashingBlocks:", v8, 0);
  v5 = (id)objc_msgSend(v3, "appendString:", self->_settingsKeyPath);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

id __41__PTRestoreDefaultSettingsRowAction_hash__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PTRestoreDefaultSettingsRowAction;
  return objc_msgSendSuper2(&v2, sel_hash);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PTRestoreDefaultSettingsRowAction;
  v4 = a3;
  -[PTRowAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_settingsKeyPath, CFSTR("settingsKeyPath"), v5.receiver, v5.super_class);

}

- (PTRestoreDefaultSettingsRowAction)initWithCoder:(id)a3
{
  id v4;
  PTRestoreDefaultSettingsRowAction *v5;
  uint64_t v6;
  NSString *settingsKeyPath;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTRestoreDefaultSettingsRowAction;
  v5 = -[PTRowAction initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("settingsKeyPath"));
    v6 = objc_claimAutoreleasedReturnValue();
    settingsKeyPath = v5->_settingsKeyPath;
    v5->_settingsKeyPath = (NSString *)v6;

  }
  return v5;
}

- (NSString)settingsKeyPath
{
  return self->_settingsKeyPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsKeyPath, 0);
}

@end
