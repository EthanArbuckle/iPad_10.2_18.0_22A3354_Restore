@implementation PRPosterAmbientConfiguration

- (PRPosterAmbientConfiguration)initWithSupportedDataLayout:(int64_t)a3
{
  return -[PRPosterAmbientConfiguration initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:](self, "initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:", a3, 0, 1, 2);
}

- (PRPosterAmbientConfiguration)initWithSupportedDataLayout:(int64_t)a3 creationBehavior:(int64_t)a4 editingBehavior:(int64_t)a5 deletionBehavior:(int64_t)a6
{
  return -[PRPosterAmbientConfiguration initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:](self, "initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:", a3, a4, a5, a6, 0);
}

- (PRPosterAmbientConfiguration)initWithSupportedDataLayout:(int64_t)a3 creationBehavior:(int64_t)a4 editingBehavior:(int64_t)a5 deletionBehavior:(int64_t)a6 galleryDisplayBehavior:(int64_t)a7
{
  uint64_t v8;

  LOBYTE(v8) = 0;
  return -[PRPosterAmbientConfiguration initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:](self, "initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:", a3, a4, a5, a6, a7, 0, v8, 0x7FFFFFFFLL);
}

- (PRPosterAmbientConfiguration)initWithSupportedDataLayout:(int64_t)a3 creationBehavior:(int64_t)a4 editingBehavior:(int64_t)a5 deletionBehavior:(int64_t)a6 isHidden:(BOOL)a7 needsAuthentication:(BOOL)a8
{
  return -[PRPosterAmbientConfiguration initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:isHidden:needsAuthentication:displayOrder:](self, "initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:isHidden:needsAuthentication:displayOrder:", a3, a4, a5, a6, 0, 0, 0x7FFFFFFFLL);
}

- (PRPosterAmbientConfiguration)initWithSupportedDataLayout:(int64_t)a3 creationBehavior:(int64_t)a4 editingBehavior:(int64_t)a5 deletionBehavior:(int64_t)a6 isHidden:(BOOL)a7 needsAuthentication:(BOOL)a8 displayOrder:(int64_t)a9
{
  uint64_t v10;

  LOBYTE(v10) = a8;
  return -[PRPosterAmbientConfiguration initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:](self, "initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:", a3, a4, a5, a6, 0, a7, v10, a9);
}

- (PRPosterAmbientConfiguration)initWithSupportedDataLayout:(int64_t)a3 creationBehavior:(int64_t)a4 editingBehavior:(int64_t)a5 deletionBehavior:(int64_t)a6 galleryDisplayBehavior:(int64_t)a7 isHidden:(BOOL)a8 needsAuthentication:(BOOL)a9 displayOrder:(int64_t)a10
{
  PRPosterAmbientConfiguration *result;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  if ((unint64_t)a5 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), a4, CFSTR("PRAmbientEditingBehaviorIsValid(editingBehavior)"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterAmbientConfiguration initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:].cold.5();
LABEL_23:
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B65E454);
  }
  if ((unint64_t)a4 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PRAmbientCreationBehaviorIsValid(creationBehavior)"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterAmbientConfiguration initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:].cold.4();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B65E4B8);
  }
  if ((unint64_t)a6 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PRAmbientDeletionBehaviorIsValid(deletionBehavior)"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterAmbientConfiguration initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:].cold.3();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B65E51CLL);
  }
  if ((unint64_t)a7 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PRAmbientGalleryDisplayBehaviorIsValid(galleryDisplayBehavior)"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterAmbientConfiguration initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:].cold.2();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B65E580);
  }
  if ((unint64_t)a3 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PRPosterAmbientSupportedDataLayoutIsValid(supportedDataLayout)"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterAmbientConfiguration initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:].cold.1();
    goto LABEL_23;
  }
  v21.receiver = self;
  v21.super_class = (Class)PRPosterAmbientConfiguration;
  result = -[PRPosterAmbientConfiguration init](&v21, sel_init);
  if (result)
  {
    result->_supportedDataLayout = a3;
    result->_creationBehavior = a4;
    result->_deletionBehavior = a6;
    result->_editingBehavior = a5;
    result->_galleryDisplayBehavior = a7;
    result->_needsAuthentication = a9;
    result->_hidden = a8;
    result->_displayOrder = a10;
  }
  return result;
}

- (PRPosterAmbientConfiguration)init
{
  return -[PRPosterAmbientConfiguration initWithSupportedDataLayout:](self, "initWithSupportedDataLayout:", 0);
}

- (PRPosterAmbientConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PRPosterAmbientConfiguration *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("supportedDataLayout"));
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("creationBehavior"));
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deletionBehavior"));
  v8 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("editingBehavior"));
  v9 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("galleryDisplayBehavior"));
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hidden"));
  LOBYTE(v19) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsAuthentication"));
  v11 = -[PRPosterAmbientConfiguration initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:](self, "initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:", v5, v6, v8, v7, v9, v10, v19, objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("displayOrder")));
  objc_opt_self();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("displayNameSystemSymbolName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRPosterAmbientConfiguration setDisplayNameSystemSymbolName:](v11, "setDisplayNameSystemSymbolName:", v13);
  objc_opt_self();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("editingSystemSymbolName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRPosterAmbientConfiguration setEditingSystemSymbolName:](v11, "setEditingSystemSymbolName:", v15);
  +[PRPosterAmbientConfiguration allowedEditingContentStyleClasses](PRPosterAmbientConfiguration, "allowedEditingContentStyleClasses");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("editingContentStyle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRPosterAmbientConfiguration setEditingContentStyle:](v11, "setEditingContentStyle:", v17);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration supportedDataLayout](self, "supportedDataLayout"), CFSTR("supportedDataLayout"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration creationBehavior](self, "creationBehavior"), CFSTR("creationBehavior"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration deletionBehavior](self, "deletionBehavior"), CFSTR("deletionBehavior"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration editingBehavior](self, "editingBehavior"), CFSTR("editingBehavior"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration galleryDisplayBehavior](self, "galleryDisplayBehavior"), CFSTR("galleryDisplayBehavior"));
  objc_msgSend(v7, "encodeBool:forKey:", -[PRPosterAmbientConfiguration hidden](self, "hidden"), CFSTR("hidden"));
  objc_msgSend(v7, "encodeBool:forKey:", -[PRPosterAmbientConfiguration needsAuthentication](self, "needsAuthentication"), CFSTR("needsAuthentication"));
  -[PRPosterAmbientConfiguration displayNameSystemSymbolName](self, "displayNameSystemSymbolName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("displayNameSystemSymbolName"));

  -[PRPosterAmbientConfiguration editingSystemSymbolName](self, "editingSystemSymbolName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("editingSystemSymbolName"));

  -[PRPosterAmbientConfiguration editingContentStyle](self, "editingContentStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("editingContentStyle"));

  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration displayOrder](self, "displayOrder"), CFSTR("displayOrder"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PRMutablePosterAmbientConfiguration *v4;

  v4 = -[PRPosterAmbientConfiguration initWithSupportedDataLayout:]([PRMutablePosterAmbientConfiguration alloc], "initWithSupportedDataLayout:", self->_supportedDataLayout);
  -[PRPosterAmbientConfiguration setCreationBehavior:](v4, "setCreationBehavior:", self->_creationBehavior);
  -[PRPosterAmbientConfiguration setDeletionBehavior:](v4, "setDeletionBehavior:", self->_deletionBehavior);
  -[PRPosterAmbientConfiguration setEditingBehavior:](v4, "setEditingBehavior:", self->_editingBehavior);
  -[PRPosterAmbientConfiguration setGalleryDisplayBehavior:](v4, "setGalleryDisplayBehavior:", self->_galleryDisplayBehavior);
  -[PRPosterAmbientConfiguration setHidden:](v4, "setHidden:", self->_hidden);
  -[PRPosterAmbientConfiguration setNeedsAuthentication:](v4, "setNeedsAuthentication:", self->_needsAuthentication);
  -[PRPosterAmbientConfiguration setDisplayNameSystemSymbolName:](v4, "setDisplayNameSystemSymbolName:", self->_displayNameSystemSymbolName);
  -[PRPosterAmbientConfiguration setEditingSystemSymbolName:](v4, "setEditingSystemSymbolName:", self->_editingSystemSymbolName);
  -[PRPosterAmbientConfiguration setEditingContentStyle:](v4, "setEditingContentStyle:", self->_editingContentStyle);
  -[PRPosterAmbientConfiguration setDisplayOrder:](v4, "setDisplayOrder:", self->_displayOrder);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterAmbientConfiguration *v4;
  BOOL v5;

  v4 = (PRPosterAmbientConfiguration *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PRPosterAmbientConfiguration isEqualToAmbientConfiguration:](self, "isEqualToAmbientConfiguration:", v4);
  }

  return v5;
}

- (BOOL)isEqualToAmbientConfiguration:(id)a3
{
  PRPosterAmbientConfiguration *v4;
  PRPosterAmbientConfiguration *v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v4 = (PRPosterAmbientConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v20 = 1;
  }
  else
  {
    if (!v4)
      goto LABEL_14;
    v6 = -[PRPosterAmbientConfiguration supportedDataLayout](self, "supportedDataLayout");
    if (v6 != -[PRPosterAmbientConfiguration supportedDataLayout](v5, "supportedDataLayout"))
      goto LABEL_14;
    v7 = -[PRPosterAmbientConfiguration creationBehavior](self, "creationBehavior");
    if (v7 == -[PRPosterAmbientConfiguration creationBehavior](v5, "creationBehavior")
      && (v8 = -[PRPosterAmbientConfiguration deletionBehavior](self, "deletionBehavior"),
          v8 == -[PRPosterAmbientConfiguration deletionBehavior](v5, "deletionBehavior"))
      && (v9 = -[PRPosterAmbientConfiguration editingBehavior](self, "editingBehavior"),
          v9 == -[PRPosterAmbientConfiguration editingBehavior](v5, "editingBehavior"))
      && (v10 = -[PRPosterAmbientConfiguration galleryDisplayBehavior](self, "galleryDisplayBehavior"),
          v10 == -[PRPosterAmbientConfiguration galleryDisplayBehavior](v5, "galleryDisplayBehavior"))
      && (v11 = -[PRPosterAmbientConfiguration hidden](self, "hidden"),
          v11 == -[PRPosterAmbientConfiguration hidden](v5, "hidden"))
      && (v12 = -[PRPosterAmbientConfiguration needsAuthentication](self, "needsAuthentication"),
          v12 == -[PRPosterAmbientConfiguration needsAuthentication](v5, "needsAuthentication"))
      && (v13 = -[PRPosterAmbientConfiguration displayOrder](self, "displayOrder"),
          v13 == -[PRPosterAmbientConfiguration displayOrder](v5, "displayOrder")))
    {
      -[PRPosterAmbientConfiguration displayNameSystemSymbolName](self, "displayNameSystemSymbolName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterAmbientConfiguration displayNameSystemSymbolName](v5, "displayNameSystemSymbolName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualObjects())
      {
        -[PRPosterAmbientConfiguration editingSystemSymbolName](self, "editingSystemSymbolName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRPosterAmbientConfiguration editingSystemSymbolName](v5, "editingSystemSymbolName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualObjects())
        {
          -[PRPosterAmbientConfiguration editingContentStyle](self, "editingContentStyle");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[PRPosterAmbientConfiguration editingContentStyle](v5, "editingContentStyle");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = BSEqualObjects();

        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
LABEL_14:
      v20 = 0;
    }
  }

  return v20;
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
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  unint64_t v18;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInt64:", -[PRPosterAmbientConfiguration supportedDataLayout](self, "supportedDataLayout"));
  v5 = (id)objc_msgSend(v3, "appendInt64:", -[PRPosterAmbientConfiguration creationBehavior](self, "creationBehavior"));
  v6 = (id)objc_msgSend(v3, "appendInt64:", -[PRPosterAmbientConfiguration deletionBehavior](self, "deletionBehavior"));
  v7 = (id)objc_msgSend(v3, "appendInt64:", -[PRPosterAmbientConfiguration editingBehavior](self, "editingBehavior"));
  v8 = (id)objc_msgSend(v3, "appendInt64:", -[PRPosterAmbientConfiguration galleryDisplayBehavior](self, "galleryDisplayBehavior"));
  v9 = (id)objc_msgSend(v3, "appendBool:", -[PRPosterAmbientConfiguration hidden](self, "hidden"));
  v10 = (id)objc_msgSend(v3, "appendBool:", -[PRPosterAmbientConfiguration needsAuthentication](self, "needsAuthentication"));
  -[PRPosterAmbientConfiguration displayNameSystemSymbolName](self, "displayNameSystemSymbolName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendString:", v11);

  -[PRPosterAmbientConfiguration editingSystemSymbolName](self, "editingSystemSymbolName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "appendString:", v13);

  -[PRPosterAmbientConfiguration editingContentStyle](self, "editingContentStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v3, "appendObject:", v15);

  v17 = (id)objc_msgSend(v3, "appendInt64:", -[PRPosterAmbientConfiguration displayOrder](self, "displayOrder"));
  v18 = objc_msgSend(v3, "hash");

  return v18;
}

- (NSString)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  int64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  unint64_t v9;
  const __CFString *v10;
  int64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  int64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PRPosterAmbientConfiguration supportedDataLayout](self, "supportedDataLayout");
  if (v4 > 3)
    v5 = CFSTR("(unknown data layout)");
  else
    v5 = off_1E2184218[v4];
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("supportedDataLayout"));
  v6 = -[PRPosterAmbientConfiguration creationBehavior](self, "creationBehavior");
  v7 = CFSTR("(unknown creation behavior)");
  if (v6 == 1)
    v7 = CFSTR("Manual");
  if (v6)
    v8 = v7;
  else
    v8 = CFSTR("Auto");
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("creationBehavior"));
  v9 = -[PRPosterAmbientConfiguration deletionBehavior](self, "deletionBehavior");
  if (v9 > 2)
    v10 = CFSTR("(unknown deletion behavior)");
  else
    v10 = off_1E2184238[v9];
  objc_msgSend(v3, "appendString:withName:", v10, CFSTR("deletionBehavior"));
  v11 = -[PRPosterAmbientConfiguration editingBehavior](self, "editingBehavior");
  v12 = CFSTR("(unknown editing behavior)");
  if (v11 == 1)
    v12 = CFSTR("NotEditable");
  if (v11)
    v13 = v12;
  else
    v13 = CFSTR("Editable");
  objc_msgSend(v3, "appendString:withName:", v13, CFSTR("editingBehavior"));
  v14 = -[PRPosterAmbientConfiguration galleryDisplayBehavior](self, "galleryDisplayBehavior");
  v15 = CFSTR("(unknown gallery display behavior)");
  if (v14 == 1)
    v15 = CFSTR("Hidden");
  if (v14)
    v16 = v15;
  else
    v16 = CFSTR("Visible");
  objc_msgSend(v3, "appendString:withName:", v16, CFSTR("galleryDisplayBehavior"));
  v17 = (id)objc_msgSend(v3, "appendBool:withName:", -[PRPosterAmbientConfiguration hidden](self, "hidden"), CFSTR("hidden"));
  v18 = (id)objc_msgSend(v3, "appendBool:withName:", -[PRPosterAmbientConfiguration needsAuthentication](self, "needsAuthentication"), CFSTR("needsAuthentication"));
  -[PRPosterAmbientConfiguration displayNameSystemSymbolName](self, "displayNameSystemSymbolName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v19, CFSTR("displayNameSystemSymbolName"), 1);

  -[PRPosterAmbientConfiguration editingSystemSymbolName](self, "editingSystemSymbolName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v20, CFSTR("editingSystemSymbolName"), 1);

  -[PRPosterAmbientConfiguration editingContentStyle](self, "editingContentStyle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v21, CFSTR("editingContentStyle"), 1);

  v23 = (id)objc_msgSend(v3, "appendInt64:withName:", -[PRPosterAmbientConfiguration displayOrder](self, "displayOrder"), CFSTR("displayOrder"));
  objc_msgSend(v3, "build");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v24;
}

+ (id)allowedEditingContentStyleClasses
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setEditingContentStyle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PRPosterContentStyle **p_editingContentStyle;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  +[PRPosterAmbientConfiguration allowedEditingContentStyleClasses](PRPosterAmbientConfiguration, "allowedEditingContentStyleClasses", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v8)
        objc_enumerationMutation(v5);
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    v5 = v4;
    v4 = 0;
  }

  p_editingContentStyle = &self->_editingContentStyle;
  if ((BSEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_editingContentStyle, v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRPosterAmbientConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PRPosterAmbientConfiguration *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("supportedDataLayout"));
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("creationBehavior"));
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deletionBehavior"));
  v8 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("editingBehavior"));
  v9 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("galleryDisplayBehavior"));
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hidden"));
  LOBYTE(v22) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsAuthentication"));
  v11 = -[PRPosterAmbientConfiguration initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:](self, "initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:", v5, v6, v8, v7, v9, v10, v22, objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("displayOrder")));
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("displayNameSystemSymbolName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterAmbientConfiguration setDisplayNameSystemSymbolName:](v11, "setDisplayNameSystemSymbolName:", v12);
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("editingSystemSymbolName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterAmbientConfiguration setEditingSystemSymbolName:](v11, "setEditingSystemSymbolName:", v13);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  +[PRPosterAmbientConfiguration allowedEditingContentStyleClasses](PRPosterAmbientConfiguration, "allowedEditingContentStyleClasses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), CFSTR("editingContentStyle"));
        v19 = objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = (void *)v19;
          -[PRPosterAmbientConfiguration setEditingContentStyle:](v11, "setEditingContentStyle:", v19);

          goto LABEL_11;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_11:

  return v11;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration supportedDataLayout](self, "supportedDataLayout"), CFSTR("supportedDataLayout"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration creationBehavior](self, "creationBehavior"), CFSTR("creationBehavior"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration deletionBehavior](self, "deletionBehavior"), CFSTR("deletionBehavior"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration editingBehavior](self, "editingBehavior"), CFSTR("editingBehavior"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration galleryDisplayBehavior](self, "galleryDisplayBehavior"), CFSTR("galleryDisplayBehavior"));
  objc_msgSend(v7, "encodeBool:forKey:", -[PRPosterAmbientConfiguration hidden](self, "hidden"), CFSTR("hidden"));
  objc_msgSend(v7, "encodeBool:forKey:", -[PRPosterAmbientConfiguration needsAuthentication](self, "needsAuthentication"), CFSTR("needsAuthentication"));
  -[PRPosterAmbientConfiguration displayNameSystemSymbolName](self, "displayNameSystemSymbolName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("displayNameSystemSymbolName"));

  -[PRPosterAmbientConfiguration editingSystemSymbolName](self, "editingSystemSymbolName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("editingSystemSymbolName"));

  -[PRPosterAmbientConfiguration editingContentStyle](self, "editingContentStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("editingContentStyle"));

  objc_msgSend(v7, "encodeInt64:forKey:", -[PRPosterAmbientConfiguration displayOrder](self, "displayOrder"), CFSTR("displayOrder"));
}

- (id)encodeJSON
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v22;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PRPosterAmbientConfiguration supportedDataLayout](self, "supportedDataLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v4, CFSTR("supportedDataLayout"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PRPosterAmbientConfiguration creationBehavior](self, "creationBehavior"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v5, CFSTR("creationBehavior"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PRPosterAmbientConfiguration deletionBehavior](self, "deletionBehavior"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v6, CFSTR("deletionBehavior"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PRPosterAmbientConfiguration editingBehavior](self, "editingBehavior"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v7, CFSTR("editingBehavior"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PRPosterAmbientConfiguration galleryDisplayBehavior](self, "galleryDisplayBehavior"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v8, CFSTR("galleryDisplayBehavior"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PRPosterAmbientConfiguration hidden](self, "hidden"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v9, CFSTR("hidden"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PRPosterAmbientConfiguration needsAuthentication](self, "needsAuthentication"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v10, CFSTR("needsAuthentication"));

  -[PRPosterAmbientConfiguration displayNameSystemSymbolName](self, "displayNameSystemSymbolName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v11, CFSTR("displayNameSystemSymbolName"));

  -[PRPosterAmbientConfiguration editingSystemSymbolName](self, "editingSystemSymbolName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v12, CFSTR("editingSystemSymbolName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PRPosterAmbientConfiguration displayOrder](self, "displayOrder"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v13, CFSTR("displayOrder"));

  -[PRPosterAmbientConfiguration editingContentStyle](self, "editingContentStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "base64EncodedStringWithOptions:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bs_setSafeObject:forKey:", v16, CFSTR("editingContentStyle"));

  }
  -[PRPosterAmbientConfiguration attributeType](self, "attributeType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v17, CFSTR("attributeType"));

  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 0, &v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v22;
  if (v19)
  {
    PRLogCommon();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[PRPosterMetadata encodeJSON].cold.1((uint64_t)self, (uint64_t)v19, v20);

  }
  return v18;
}

+ (id)decodeObjectWithJSON:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v41;
  char v42;
  unsigned int v43;
  id v44;

  v44 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v44);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v44;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !v4)
    {
      objc_msgSend(v3, "objectForKey:", CFSTR("supportedDataLayout"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (!v5)
        v5 = &unk_1E21DCBF0;
      v7 = objc_msgSend(v5, "integerValue");

      objc_msgSend(v3, "objectForKey:", CFSTR("creationBehavior"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (!v8)
        v8 = &unk_1E21DCBF0;
      v10 = objc_msgSend(v8, "integerValue");

      objc_msgSend(v3, "objectForKey:", CFSTR("deletionBehavior"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (!v11)
        v11 = &unk_1E21DCC08;
      v13 = objc_msgSend(v11, "integerValue");

      objc_msgSend(v3, "objectForKey:", CFSTR("editingBehavior"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v14)
        v14 = &unk_1E21DCC20;
      v16 = objc_msgSend(v14, "integerValue");

      objc_msgSend(v3, "objectForKey:", CFSTR("galleryDisplayBehavior"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (!v17)
        v17 = &unk_1E21DCBF0;
      v19 = objc_msgSend(v17, "integerValue");

      objc_msgSend(v3, "objectForKey:", CFSTR("hidden"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(v3, "objectForKey:", CFSTR("hidden"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v21, "BOOLValue");

      }
      else
      {
        v43 = 0;
      }

      objc_msgSend(v3, "objectForKey:", CFSTR("needsAuthentication"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_msgSend(v3, "objectForKey:", CFSTR("needsAuthentication"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v25, "BOOLValue");

      }
      else
      {
        v42 = 0;
      }

      objc_msgSend(v3, "objectForKey:", CFSTR("displayOrder"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        objc_msgSend(v3, "objectForKey:", CFSTR("displayOrder"));
        v27 = v16;
        v28 = v13;
        v29 = v10;
        v30 = v7;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "integerValue");

        v7 = v30;
        v10 = v29;
        v13 = v28;
        v16 = v27;
      }
      else
      {
        v32 = 0x7FFFFFFFLL;
      }

      LOBYTE(v41) = v42;
      v23 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:", v7, v10, v16, v13, v19, v43, v41, v32);
      objc_msgSend(v3, "objectForKey:", CFSTR("displayNameSystemSymbolName"));
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setDisplayNameSystemSymbolName:", v22);
      objc_msgSend(v3, "objectForKey:", CFSTR("editingSystemSymbolName"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setEditingSystemSymbolName:", v33);
      objc_msgSend(v3, "objectForKey:", CFSTR("editingContentStyle"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v34, 0);

        if (!v36)
        {
LABEL_30:

          goto LABEL_31;
        }
        v37 = (void *)MEMORY[0x1E0CB3710];
        +[PRPosterAmbientConfiguration allowedEditingContentStyleClasses](PRPosterAmbientConfiguration, "allowedEditingContentStyleClasses");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "unarchivedObjectOfClasses:fromData:error:", v38, v36, 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "setEditingContentStyle:", v39);
        v35 = (void *)v36;
      }

      goto LABEL_30;
    }
  }
  PRLogCommon();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    +[PRPosterMetadata decodeObjectWithJSON:].cold.1((uint64_t)v4, v22);
  v23 = 0;
LABEL_31:

  return v23;
}

- (NSString)attributeType
{
  return (NSString *)CFSTR("PRPosterRoleAttributeTypeAmbientConfiguration");
}

- (int64_t)supportedDataLayout
{
  return self->_supportedDataLayout;
}

- (void)setSupportedDataLayout:(int64_t)a3
{
  self->_supportedDataLayout = a3;
}

- (int64_t)creationBehavior
{
  return self->_creationBehavior;
}

- (void)setCreationBehavior:(int64_t)a3
{
  self->_creationBehavior = a3;
}

- (int64_t)deletionBehavior
{
  return self->_deletionBehavior;
}

- (void)setDeletionBehavior:(int64_t)a3
{
  self->_deletionBehavior = a3;
}

- (int64_t)editingBehavior
{
  return self->_editingBehavior;
}

- (void)setEditingBehavior:(int64_t)a3
{
  self->_editingBehavior = a3;
}

- (int64_t)galleryDisplayBehavior
{
  return self->_galleryDisplayBehavior;
}

- (void)setGalleryDisplayBehavior:(int64_t)a3
{
  self->_galleryDisplayBehavior = a3;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)needsAuthentication
{
  return self->_needsAuthentication;
}

- (void)setNeedsAuthentication:(BOOL)a3
{
  self->_needsAuthentication = a3;
}

- (NSString)displayNameSystemSymbolName
{
  return self->_displayNameSystemSymbolName;
}

- (void)setDisplayNameSystemSymbolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)editingSystemSymbolName
{
  return self->_editingSystemSymbolName;
}

- (void)setEditingSystemSymbolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (PRPosterContentStyle)editingContentStyle
{
  return self->_editingContentStyle;
}

- (int64_t)displayOrder
{
  return self->_displayOrder;
}

- (void)setDisplayOrder:(int64_t)a3
{
  self->_displayOrder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingContentStyle, 0);
  objc_storeStrong((id *)&self->_editingSystemSymbolName, 0);
  objc_storeStrong((id *)&self->_displayNameSystemSymbolName, 0);
}

- (void)initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:galleryDisplayBehavior:isHidden:needsAuthentication:displayOrder:.cold.5()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
