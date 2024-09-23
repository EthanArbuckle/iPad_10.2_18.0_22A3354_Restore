@implementation SBSApplicationShortcutTemplateIcon

- (SBSApplicationShortcutTemplateIcon)initWithXPCDictionary:(id)a3
{
  void *v4;
  SBSApplicationShortcutTemplateIcon *v5;

  if (a3)
  {
    BSDeserializeStringFromXPCDictionaryWithKey();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[SBSApplicationShortcutTemplateIcon initWithTemplateImageName:](self, "initWithTemplateImageName:", v4);

    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (SBSApplicationShortcutTemplateIcon)initWithTemplateImageName:(id)a3
{
  id v4;
  SBSApplicationShortcutTemplateIcon *v5;
  uint64_t v6;
  NSString *templateImageName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSApplicationShortcutTemplateIcon;
  v5 = -[SBSApplicationShortcutIcon _initForSubclass](&v9, sel__initForSubclass);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    templateImageName = v5->_templateImageName;
    v5->_templateImageName = (NSString *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SBSApplicationShortcutTemplateIcon *v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  _QWORD v10[4];
  SBSApplicationShortcutTemplateIcon *v11;

  v4 = (SBSApplicationShortcutTemplateIcon *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSApplicationShortcutTemplateIcon templateImageName](self, "templateImageName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__SBSApplicationShortcutTemplateIcon_isEqual___block_invoke;
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
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SBSApplicationShortcutTemplateIcon templateImageName](self, "templateImageName");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    BSSerializeStringToXPCDictionaryWithKey();

  }
}

- (NSString)templateImageName
{
  return self->_templateImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateImageName, 0);
}

uint64_t __46__SBSApplicationShortcutTemplateIcon_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "templateImageName");
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
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%s is not a valid initializer. You must call -[%@ initWithTemplateImageName:]."), "-[SBSApplicationShortcutTemplateIcon _initForSubclass]", v6);

  return -[SBSApplicationShortcutTemplateIcon initWithTemplateImageName:](self, "initWithTemplateImageName:", 0);
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSApplicationShortcutTemplateIcon templateImageName](self, "templateImageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  v6 = objc_msgSend(v3, "hash");
  return v6;
}

@end
