@implementation SBSApplicationShortcutSystemPrivateIcon

- (BOOL)isEqual:(id)a3
{
  SBSApplicationShortcutSystemPrivateIcon *v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  _QWORD v10[4];
  SBSApplicationShortcutSystemPrivateIcon *v11;

  v4 = (SBSApplicationShortcutSystemPrivateIcon *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSApplicationShortcutSystemPrivateIcon systemImageName](self, "systemImageName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__SBSApplicationShortcutSystemPrivateIcon_isEqual___block_invoke;
    v10[3] = &unk_1E288EEB0;
    v11 = v4;
    v7 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v10);

    v8 = objc_msgSend(v5, "isEqual");
  }

  return v8;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    -[SBSApplicationShortcutSystemPrivateIcon systemImageName](self, "systemImageName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      BSSerializeStringToXPCDictionaryWithKey();

    v4 = v6;
  }

}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemImageName, 0);
}

- (SBSApplicationShortcutSystemPrivateIcon)initWithXPCDictionary:(id)a3
{
  void *v4;
  SBSApplicationShortcutSystemPrivateIcon *v5;

  if (a3)
  {
    BSDeserializeStringFromXPCDictionaryWithKey();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      self = -[SBSApplicationShortcutSystemPrivateIcon initWithSystemImageName:](self, "initWithSystemImageName:", v4);
      v5 = self;
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (SBSApplicationShortcutSystemPrivateIcon)initWithSystemImageName:(id)a3
{
  id v4;
  SBSApplicationShortcutSystemPrivateIcon *v5;
  uint64_t v6;
  NSString *systemImageName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSApplicationShortcutSystemPrivateIcon;
  v5 = -[SBSApplicationShortcutIcon _initForSubclass](&v9, sel__initForSubclass);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    systemImageName = v5->_systemImageName;
    v5->_systemImageName = (NSString *)v6;

  }
  return v5;
}

- (id)_initForSubclass
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%s is not a valid initializer. You must call -[%@ initWithSystemImageName:]."), "-[SBSApplicationShortcutSystemPrivateIcon _initForSubclass]", v6);

  return -[SBSApplicationShortcutSystemPrivateIcon initWithSystemImageName:](self, "initWithSystemImageName:", &stru_1E2893CD0);
}

uint64_t __51__SBSApplicationShortcutSystemPrivateIcon_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "systemImageName");
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SBSApplicationShortcutSystemPrivateIcon systemImageName](self, "systemImageName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

@end
