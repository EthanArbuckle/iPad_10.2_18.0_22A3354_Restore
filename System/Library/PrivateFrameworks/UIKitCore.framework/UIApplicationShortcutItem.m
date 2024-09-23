@implementation UIApplicationShortcutItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoData, 0);
  objc_storeStrong(&self->_targetContentIdentifier, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (UIApplicationShortcutItem)initWithSBSApplicationShortcutItem:(id)a3
{
  id v4;
  UIApplicationShortcutIcon *v5;
  void *v6;
  UIApplicationShortcutIcon *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIApplicationShortcutItem *v14;

  v4 = a3;
  v5 = [UIApplicationShortcutIcon alloc];
  objc_msgSend(v4, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIApplicationShortcutIcon initWithSBSApplicationShortcutIcon:](v5, "initWithSBSApplicationShortcutIcon:", v6);

  v8 = objc_msgSend((id)objc_opt_class(), "_uiActivationModeFromSBSActivationMode:", objc_msgSend(v4, "activationMode"));
  objc_msgSend(v4, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedSubtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfoData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetContentIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[UIApplicationShortcutItem _initWithType:localizedTitle:localizedSubtitle:icon:userInfoData:activationMode:targetContentIdentifier:](self, "_initWithType:localizedTitle:localizedSubtitle:icon:userInfoData:activationMode:targetContentIdentifier:", v9, v10, v11, v7, v12, v8, v13);
  return v14;
}

- (id)_initWithType:(id)a3 localizedTitle:(id)a4 localizedSubtitle:(id)a5 icon:(id)a6 userInfoData:(id)a7 activationMode:(unint64_t)a8 targetContentIdentifier:(id)a9
{
  id v16;
  id v17;
  UIApplicationShortcutItem *v18;
  UIApplicationShortcutItem *v19;

  v16 = a7;
  v17 = a9;
  v18 = -[UIApplicationShortcutItem initWithType:localizedTitle:localizedSubtitle:icon:userInfo:](self, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", a3, a4, a5, a6, 0);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_userInfoData, a7);
    v19->_activationMode = a8;
    objc_storeStrong(&v19->_targetContentIdentifier, a9);
  }

  return v19;
}

+ (unint64_t)_uiActivationModeFromSBSActivationMode:(unint64_t)a3
{
  return a3 == 1;
}

- (BOOL)isEqual:(id)a3
{
  UIApplicationShortcutItem *v4;
  UIApplicationShortcutItem *v5;
  NSString *v6;
  void *v7;
  int v8;
  BOOL v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  void *v13;
  UIApplicationShortcutIcon *v14;
  void *v15;
  NSData *v16;
  void *v17;

  v4 = (UIApplicationShortcutItem *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[UIApplicationShortcutItem type](v5, "type");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (v6 == self->_type)
      {
        v8 = 1;
      }
      else
      {
        -[UIApplicationShortcutItem type](v5, "type");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", self->_type);

      }
      -[UIApplicationShortcutItem localizedTitle](v5, "localizedTitle");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (v10 != self->_localizedTitle)
      {
        -[UIApplicationShortcutItem localizedTitle](v5, "localizedTitle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 &= objc_msgSend(v11, "isEqualToString:", self->_localizedTitle);

      }
      -[UIApplicationShortcutItem localizedSubtitle](v5, "localizedSubtitle");
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (v12 != self->_localizedSubtitle)
      {
        -[UIApplicationShortcutItem localizedSubtitle](v5, "localizedSubtitle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v8 &= objc_msgSend(v13, "isEqualToString:", self->_localizedSubtitle);

      }
      -[UIApplicationShortcutItem icon](v5, "icon");
      v14 = (UIApplicationShortcutIcon *)objc_claimAutoreleasedReturnValue();
      if (v14 != self->_icon)
      {
        -[UIApplicationShortcutItem icon](v5, "icon");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v8 &= objc_msgSend(v15, "isEqual:", self->_icon);

      }
      -[UIApplicationShortcutItem userInfoData](v5, "userInfoData");
      v16 = (NSData *)objc_claimAutoreleasedReturnValue();
      if (v16 != self->_userInfoData)
      {
        -[UIApplicationShortcutItem userInfoData](v5, "userInfoData");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v8 &= objc_msgSend(v17, "isEqual:", self->_userInfoData);

      }
      if (-[UIApplicationShortcutItem activationMode](v5, "activationMode") == self->_activationMode)
        v9 = v8;
      else
        v9 = 0;

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (SBSApplicationShortcutItem)sbsShortcutItem
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v3 = (void *)getSBSApplicationShortcutItemClass_softClass;
  v18 = getSBSApplicationShortcutItemClass_softClass;
  if (!getSBSApplicationShortcutItemClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getSBSApplicationShortcutItemClass_block_invoke;
    v14[3] = &unk_1E16B14C0;
    v14[4] = &v15;
    __getSBSApplicationShortcutItemClass_block_invoke((uint64_t)v14);
    v3 = (void *)v16[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v15, 8);
  v5 = objc_alloc_init(v4);
  -[UIApplicationShortcutItem type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setType:", v6);

  -[UIApplicationShortcutItem localizedTitle](self, "localizedTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocalizedTitle:", v7);

  -[UIApplicationShortcutItem localizedSubtitle](self, "localizedSubtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocalizedSubtitle:", v8);

  -[UIApplicationShortcutItem icon](self, "icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sbsShortcutIcon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIcon:", v10);

  -[UIApplicationShortcutItem userInfo](self, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInfo:", v11);

  objc_msgSend(v5, "setActivationMode:", objc_msgSend((id)objc_opt_class(), "_sbsActivationModeFromUIActivationMode:", -[UIApplicationShortcutItem activationMode](self, "activationMode")));
  -[UIApplicationShortcutItem targetContentIdentifier](self, "targetContentIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTargetContentIdentifier:", v12);

  return (SBSApplicationShortcutItem *)v5;
}

- (UIApplicationShortcutItem)initWithType:(NSString *)type localizedTitle:(NSString *)localizedTitle localizedSubtitle:(NSString *)localizedSubtitle icon:(UIApplicationShortcutIcon *)icon userInfo:(NSDictionary *)userInfo
{
  NSString *v12;
  NSString *v13;
  NSString *v14;
  UIApplicationShortcutIcon *v15;
  NSDictionary *v16;
  UIApplicationShortcutItem *v17;
  uint64_t v18;
  NSString *v19;
  uint64_t v20;
  NSString *v21;
  uint64_t v22;
  NSString *v23;
  objc_super v25;

  v12 = type;
  v13 = localizedTitle;
  v14 = localizedSubtitle;
  v15 = icon;
  v16 = userInfo;
  v25.receiver = self;
  v25.super_class = (Class)UIApplicationShortcutItem;
  v17 = -[UIApplicationShortcutItem init](&v25, sel_init);
  if (v17)
  {
    v18 = -[NSString copy](v12, "copy");
    v19 = v17->_type;
    v17->_type = (NSString *)v18;

    v20 = -[NSString copy](v13, "copy");
    v21 = v17->_localizedTitle;
    v17->_localizedTitle = (NSString *)v20;

    v22 = -[NSString copy](v14, "copy");
    v23 = v17->_localizedSubtitle;
    v17->_localizedSubtitle = (NSString *)v22;

    objc_storeStrong((id *)&v17->_icon, icon);
    -[UIApplicationShortcutItem setUserInfo:](v17, "setUserInfo:", v16);
  }

  return v17;
}

- (void)setUserInfo:(id)a3
{
  id v4;
  NSData *userInfoData;
  NSData *v6;
  id v7;
  NSData *v8;
  NSData *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("userInfo is not an NSDictionary"), 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v10);
    }
    userInfoData = self->_userInfoData;
    self->_userInfoData = 0;

    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v15);
    v6 = (NSData *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    v8 = self->_userInfoData;
    self->_userInfoData = v6;

    if (!self->_userInfoData)
    {
      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99778];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to serialize userInfo: %@"), v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v13, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v14);
    }

  }
  else
  {
    v9 = self->_userInfoData;
    self->_userInfoData = 0;

  }
}

- (NSString)type
{
  return self->_type;
}

- (UIApplicationShortcutIcon)icon
{
  return self->_icon;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (unint64_t)activationMode
{
  return self->_activationMode;
}

- (NSDictionary)userInfo
{
  NSData *userInfoData;
  void *v3;

  userInfoData = self->_userInfoData;
  if (!userInfoData)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", userInfoData, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_4:
    v3 = 0;
  }
  return (NSDictionary *)v3;
}

- (id)targetContentIdentifier
{
  return self->_targetContentIdentifier;
}

+ (unint64_t)_sbsActivationModeFromUIActivationMode:(unint64_t)a3
{
  return a3 == 1;
}

- (NSData)userInfoData
{
  return self->_userInfoData;
}

- (UIApplicationShortcutItem)initWithType:(NSString *)type localizedTitle:(NSString *)localizedTitle
{
  return -[UIApplicationShortcutItem initWithType:localizedTitle:localizedSubtitle:icon:userInfo:](self, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", type, localizedTitle, 0, 0, 0);
}

- (UIApplicationShortcutItem)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[UIApplicationShortcutItem init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Don't call %@."), v5);

  return 0;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[UIApplicationShortcutItem _initWithType:localizedTitle:localizedSubtitle:icon:userInfoData:activationMode:targetContentIdentifier:]([UIMutableApplicationShortcutItem alloc], "_initWithType:localizedTitle:localizedSubtitle:icon:userInfoData:activationMode:targetContentIdentifier:", self->_type, self->_localizedTitle, self->_localizedSubtitle, self->_icon, self->_userInfoData, self->_activationMode, self->_targetContentIdentifier);
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_type, "hash");
  return -[NSString hash](self->_localizedTitle, "hash") ^ v3;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; type: %@, title: %@>"),
                       objc_opt_class(),
                       self,
                       self->_type,
                       self->_localizedTitle);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  BSSerializeStringToXPCDictionaryWithKey();
  BSSerializeStringToXPCDictionaryWithKey();
  BSSerializeStringToXPCDictionaryWithKey();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  BSSerializeDataToXPCDictionaryWithKey();
  xpc_dictionary_set_uint64(xdict, "activationMode", self->_activationMode);
  BSSerializeStringToXPCDictionaryWithKey();

}

- (UIApplicationShortcutItem)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t uint64;
  void *v15;
  id v16;
  UIApplicationShortcutItem *v17;

  v4 = a3;
  BSDeserializeStringFromXPCDictionaryWithKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeStringFromXPCDictionaryWithKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeStringFromXPCDictionaryWithKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v10 = v8;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  BSDeserializeDataFromXPCDictionaryWithKey();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64 = xpc_dictionary_get_uint64(v4, "activationMode");
  BSDeserializeStringFromXPCDictionaryWithKey();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[UIApplicationShortcutItem _initWithType:localizedTitle:localizedSubtitle:icon:userInfoData:activationMode:targetContentIdentifier:](self, "_initWithType:localizedTitle:localizedSubtitle:icon:userInfoData:activationMode:targetContentIdentifier:", v5, v6, v7, v12, v13, uint64, v15);

  v17 = (UIApplicationShortcutItem *)v16;
  return v17;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setLocalizedSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setTargetContentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setUserInfoData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

@end
