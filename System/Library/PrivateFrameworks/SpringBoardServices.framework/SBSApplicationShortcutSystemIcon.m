@implementation SBSApplicationShortcutSystemIcon

uint64_t __44__SBSApplicationShortcutSystemIcon_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "type"));
}

- (BOOL)isEqual:(id)a3
{
  SBSApplicationShortcutSystemIcon *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  SBSApplicationShortcutSystemIcon *v8;
  id v9;
  void *v10;
  id v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  SBSApplicationShortcutSystemIcon *v18;
  _QWORD v19[4];
  SBSApplicationShortcutSystemIcon *v20;

  v4 = (SBSApplicationShortcutSystemIcon *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SBSApplicationShortcutSystemIcon type](self, "type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __44__SBSApplicationShortcutSystemIcon_isEqual___block_invoke;
    v19[3] = &unk_1E288F230;
    v8 = v4;
    v20 = v8;
    v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v19);

    -[SBSApplicationShortcutSystemIcon systemImageName](self, "systemImageName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
    v15 = 3221225472;
    v16 = __44__SBSApplicationShortcutSystemIcon_isEqual___block_invoke_2;
    v17 = &unk_1E288EEB0;
    v18 = v8;
    v11 = (id)objc_msgSend(v5, "appendObject:counterpart:", v10, &v14);

    v12 = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);
  }

  return v12;
}

- (int64_t)type
{
  return self->_type;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t xdict;

  v4 = a3;
  if (v4)
  {
    xdict = v4;
    -[SBSApplicationShortcutSystemIcon systemImageName](self, "systemImageName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      BSSerializeStringToXPCDictionaryWithKey();
    else
      xpc_dictionary_set_int64(xdict, "systemIconType", -[SBSApplicationShortcutSystemIcon type](self, "type"));

    v4 = xdict;
  }

}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (SBSApplicationShortcutSystemIcon)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  SBSApplicationShortcutSystemIcon *v6;
  SBSApplicationShortcutSystemIcon *v7;

  v4 = a3;
  if (v4)
  {
    BSDeserializeStringFromXPCDictionaryWithKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = -[SBSApplicationShortcutSystemIcon initWithSystemImageName:](self, "initWithSystemImageName:", v5);
    else
      v6 = -[SBSApplicationShortcutSystemIcon initWithType:](self, "initWithType:", xpc_dictionary_get_int64(v4, "systemIconType"));
    self = v6;

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (SBSApplicationShortcutSystemIcon)initWithSystemImageName:(id)a3
{
  id v4;
  SBSApplicationShortcutSystemIcon *v5;
  uint64_t v6;
  NSString *systemImageName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSApplicationShortcutSystemIcon;
  v5 = -[SBSApplicationShortcutIcon _initForSubclass](&v9, sel__initForSubclass);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    systemImageName = v5->_systemImageName;
    v5->_systemImageName = (NSString *)v6;

  }
  return v5;
}

- (SBSApplicationShortcutSystemIcon)initWithType:(int64_t)a3
{
  SBSApplicationShortcutSystemIcon *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSApplicationShortcutSystemIcon;
  result = -[SBSApplicationShortcutIcon _initForSubclass](&v5, sel__initForSubclass);
  if (result)
    result->_type = a3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemImageName, 0);
}

uint64_t __44__SBSApplicationShortcutSystemIcon_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "systemImageName");
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
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%s is not a valid initializer. You must call -[%@ initWithType:]."), "-[SBSApplicationShortcutSystemIcon _initForSubclass]", v6);

  return -[SBSApplicationShortcutSystemIcon initWithSystemImageName:](self, "initWithSystemImageName:", &stru_1E2893CD0);
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[SBSApplicationShortcutSystemIcon type](self, "type");
  -[SBSApplicationShortcutSystemIcon systemImageName](self, "systemImageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") + v3;

  return v5;
}

@end
