@implementation UIApplicationShortcutIcon

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbsShortcutIcon, 0);
}

+ (UIApplicationShortcutIcon)iconWithTemplateImageName:(NSString *)templateImageName
{
  NSString *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = templateImageName;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v5 = (void *)getSBSApplicationShortcutTemplateIconClass_softClass;
  v14 = getSBSApplicationShortcutTemplateIconClass_softClass;
  if (!getSBSApplicationShortcutTemplateIconClass_softClass)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getSBSApplicationShortcutTemplateIconClass_block_invoke;
    v10[3] = &unk_1E16B14C0;
    v10[4] = &v11;
    __getSBSApplicationShortcutTemplateIconClass_block_invoke((uint64_t)v10);
    v5 = (void *)v12[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v11, 8);
  v7 = (void *)objc_msgSend([v6 alloc], "initWithTemplateImageName:", v4);
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSBSApplicationShortcutIcon:", v7);

  return (UIApplicationShortcutIcon *)v8;
}

+ (UIApplicationShortcutIcon)iconWithSystemImageName:(NSString *)systemImageName
{
  NSString *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = systemImageName;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v5 = (void *)getSBSApplicationShortcutSystemIconClass_softClass;
  v14 = getSBSApplicationShortcutSystemIconClass_softClass;
  if (!getSBSApplicationShortcutSystemIconClass_softClass)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getSBSApplicationShortcutSystemIconClass_block_invoke;
    v10[3] = &unk_1E16B14C0;
    v10[4] = &v11;
    __getSBSApplicationShortcutSystemIconClass_block_invoke((uint64_t)v10);
    v5 = (void *)v12[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v11, 8);
  v7 = (void *)objc_msgSend([v6 alloc], "initWithSystemImageName:", v4);
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSBSApplicationShortcutIcon:", v7);

  return (UIApplicationShortcutIcon *)v8;
}

- (UIApplicationShortcutIcon)initWithSBSApplicationShortcutIcon:(id)a3
{
  id v5;
  UIApplicationShortcutIcon *v6;
  UIApplicationShortcutIcon *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIApplicationShortcutIcon;
  v6 = -[UIApplicationShortcutIcon init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sbsShortcutIcon, a3);

  return v7;
}

- (SBSApplicationShortcutIcon)sbsShortcutIcon
{
  return self->_sbsShortcutIcon;
}

- (BOOL)isEqual:(id)a3
{
  UIApplicationShortcutIcon *v4;
  UIApplicationShortcutIcon *v5;
  SBSApplicationShortcutIcon *v6;
  void *v7;
  char v8;

  v4 = (UIApplicationShortcutIcon *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[UIApplicationShortcutIcon sbsShortcutIcon](v5, "sbsShortcutIcon");
      v6 = (SBSApplicationShortcutIcon *)objc_claimAutoreleasedReturnValue();
      if (v6 == self->_sbsShortcutIcon)
      {
        v8 = 1;
      }
      else
      {
        -[UIApplicationShortcutIcon sbsShortcutIcon](v5, "sbsShortcutIcon");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqual:", self->_sbsShortcutIcon);

      }
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

+ (UIApplicationShortcutIcon)iconWithType:(UIApplicationShortcutIconType)type
{
  const __CFString *v3;

  if ((unint64_t)type > UIApplicationShortcutIconTypeUpdate)
    v3 = CFSTR("questionmark");
  else
    v3 = off_1E16B4A90[type];
  return (UIApplicationShortcutIcon *)objc_msgSend(a1, "iconWithSystemImageName:", v3);
}

+ (UIApplicationShortcutIcon)iconWithCustomImage:(id)a3
{
  return (UIApplicationShortcutIcon *)objc_msgSend(a1, "iconWithCustomImage:isTemplate:", a3, 0);
}

+ (UIApplicationShortcutIcon)iconWithCustomImage:(id)a3 isTemplate:(BOOL)a4
{
  _BOOL8 v4;
  UIImage *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a4;
  v6 = (UIImage *)a3;
  if (-[UIImage isSymbolImage](v6, "isSymbolImage"))
  {
    _UIImageName(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (_UIIsSystemSymbolImage(v6))
    {
      objc_msgSend(a1, "iconWithSystemImageName:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v9 = (void *)v8;
      goto LABEL_10;
    }
    if (v7)
    {
      objc_msgSend(a1, "iconWithTemplateImageName:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  UIImagePNGRepresentation(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v10 = (void *)getSBSApplicationShortcutCustomImageIconClass_softClass;
  v18 = getSBSApplicationShortcutCustomImageIconClass_softClass;
  if (!getSBSApplicationShortcutCustomImageIconClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getSBSApplicationShortcutCustomImageIconClass_block_invoke;
    v14[3] = &unk_1E16B14C0;
    v14[4] = &v15;
    __getSBSApplicationShortcutCustomImageIconClass_block_invoke((uint64_t)v14);
    v10 = (void *)v16[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v15, 8);
  v12 = (void *)objc_msgSend([v11 alloc], "initWithImageData:dataType:isTemplate:", v7, 0, v4);
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSBSApplicationShortcutIcon:", v12);

LABEL_10:
  return (UIApplicationShortcutIcon *)v9;
}

- (unint64_t)hash
{
  return -[SBSApplicationShortcutIcon hash](self->_sbsShortcutIcon, "hash");
}

- (void)encodeWithXPCDictionary:(id)a3
{
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

- (UIApplicationShortcutIcon)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  UIApplicationShortcutIcon *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v6 = (void *)getSBSApplicationShortcutIconClass_softClass;
  v15 = getSBSApplicationShortcutIconClass_softClass;
  if (!getSBSApplicationShortcutIconClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getSBSApplicationShortcutIconClass_block_invoke;
    v11[3] = &unk_1E16B14C0;
    v11[4] = &v12;
    __getSBSApplicationShortcutIconClass_block_invoke((uint64_t)v11);
    v6 = (void *)v13[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v12, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v5;
  else
    v8 = 0;
  v9 = -[UIApplicationShortcutIcon initWithSBSApplicationShortcutIcon:](self, "initWithSBSApplicationShortcutIcon:", v8);

  return v9;
}

@end
