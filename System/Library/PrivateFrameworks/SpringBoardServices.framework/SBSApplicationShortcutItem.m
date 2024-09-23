@implementation SBSApplicationShortcutItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setType:", self->_type);
  objc_msgSend(v4, "setLocalizedTitle:", self->_localizedTitle);
  objc_msgSend(v4, "setLocalizedSubtitle:", self->_localizedSubtitle);
  objc_msgSend(v4, "setIcon:", self->_icon);
  objc_msgSend(v4, "setUserInfoData:", self->_userInfoData);
  objc_msgSend(v4, "setActivationMode:", self->_activationMode);
  objc_msgSend(v4, "setBundleIdentifierToLaunch:", self->_bundleIdentifierToLaunch);
  objc_msgSend(v4, "setTargetContentIdentifier:", self->_targetContentIdentifier);
  return v4;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setTargetContentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setLocalizedSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setActivationMode:(unint64_t)a3
{
  self->_activationMode = a3;
}

- (void)setUserInfoData:(id)a3
{
  objc_storeStrong((id *)&self->_userInfoData, a3);
}

- (void)setBundleIdentifierToLaunch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isEqual:(id)a3
{
  SBSApplicationShortcutItem *v4;
  SBSApplicationShortcutItem *v5;
  NSString *v6;
  void *v7;
  int v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  SBSApplicationShortcutIcon *v13;
  void *v14;
  NSData *v15;
  void *v16;
  NSString *v17;
  void *v18;
  NSString *v19;
  void *v20;

  v4 = (SBSApplicationShortcutItem *)a3;
  if (v4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SBSApplicationShortcutItem type](v5, "type");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (v6 == self->_type)
      {
        v8 = 1;
      }
      else
      {
        -[SBSApplicationShortcutItem type](v5, "type");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", self->_type);

      }
      -[SBSApplicationShortcutItem localizedTitle](v5, "localizedTitle");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (v9 != self->_localizedTitle)
      {
        -[SBSApplicationShortcutItem localizedTitle](v5, "localizedTitle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v8 &= objc_msgSend(v10, "isEqualToString:", self->_localizedTitle);

      }
      -[SBSApplicationShortcutItem localizedSubtitle](v5, "localizedSubtitle");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (v11 != self->_localizedSubtitle)
      {
        -[SBSApplicationShortcutItem localizedSubtitle](v5, "localizedSubtitle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v8 &= objc_msgSend(v12, "isEqualToString:", self->_localizedSubtitle);

      }
      -[SBSApplicationShortcutItem icon](v5, "icon");
      v13 = (SBSApplicationShortcutIcon *)objc_claimAutoreleasedReturnValue();
      if (v13 != self->_icon)
      {
        -[SBSApplicationShortcutItem icon](v5, "icon");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v8 &= objc_msgSend(v14, "isEqual:", self->_icon);

      }
      -[SBSApplicationShortcutItem userInfoData](v5, "userInfoData");
      v15 = (NSData *)objc_claimAutoreleasedReturnValue();
      if (v15 != self->_userInfoData)
      {
        -[SBSApplicationShortcutItem userInfoData](v5, "userInfoData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v8 &= objc_msgSend(v16, "isEqual:", self->_userInfoData);

      }
      if (-[SBSApplicationShortcutItem activationMode](v5, "activationMode") != self->_activationMode)
        v8 = 0;
      -[SBSApplicationShortcutItem bundleIdentifierToLaunch](v5, "bundleIdentifierToLaunch");
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (v17 != self->_bundleIdentifierToLaunch)
      {
        -[SBSApplicationShortcutItem bundleIdentifierToLaunch](v5, "bundleIdentifierToLaunch");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v8 &= objc_msgSend(v18, "isEqualToString:", self->_bundleIdentifierToLaunch);

      }
      -[SBSApplicationShortcutItem targetContentIdentifier](v5, "targetContentIdentifier");
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (v19 != self->_targetContentIdentifier)
      {
        -[SBSApplicationShortcutItem targetContentIdentifier](v5, "targetContentIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v8 &= objc_msgSend(v20, "isEqualToString:", self->_targetContentIdentifier);

      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }

  return v8;
}

- (SBSApplicationShortcutIcon)icon
{
  return self->_icon;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)bundleIdentifierToLaunch
{
  return self->_bundleIdentifierToLaunch;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSData)userInfoData
{
  return self->_userInfoData;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (NSString)targetContentIdentifier
{
  return self->_targetContentIdentifier;
}

- (unint64_t)activationMode
{
  return self->_activationMode;
}

- (SBSApplicationShortcutItem)initWithXPCDictionary:(id)a3
{
  id v4;
  SBSApplicationShortcutItem *v5;
  void *v6;
  uint64_t v7;
  NSString *type;
  void *v9;
  uint64_t v10;
  NSString *localizedTitle;
  void *v12;
  uint64_t v13;
  NSString *localizedSubtitle;
  uint64_t v15;
  SBSApplicationShortcutIcon *icon;
  uint64_t v17;
  NSString *targetContentIdentifier;
  uint64_t v19;
  void *v20;
  void *v21;
  const void *bytes_ptr;
  uint64_t v23;
  NSData *userInfoData;
  void *v25;
  uint64_t v26;
  NSString *bundleIdentifierToLaunch;
  SBSApplicationShortcutItem *v28;
  objc_super v30;

  v4 = a3;
  if (v4)
  {
    v30.receiver = self;
    v30.super_class = (Class)SBSApplicationShortcutItem;
    v5 = -[SBSApplicationShortcutItem init](&v30, sel_init);
    if (v5)
    {
      objc_msgSend(CFSTR("type"), "UTF8String");
      BSDeserializeStringFromXPCDictionaryWithKey();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      type = v5->_type;
      v5->_type = (NSString *)v7;

      objc_msgSend(CFSTR("title"), "UTF8String");
      BSDeserializeStringFromXPCDictionaryWithKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      localizedTitle = v5->_localizedTitle;
      v5->_localizedTitle = (NSString *)v10;

      objc_msgSend(CFSTR("subtitle"), "UTF8String");
      BSDeserializeStringFromXPCDictionaryWithKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      localizedSubtitle = v5->_localizedSubtitle;
      v5->_localizedSubtitle = (NSString *)v13;

      objc_msgSend(CFSTR("icon"), "UTF8String");
      BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
      v15 = objc_claimAutoreleasedReturnValue();
      icon = v5->_icon;
      v5->_icon = (SBSApplicationShortcutIcon *)v15;

      v5->_activationMode = xpc_dictionary_get_int64(v4, (const char *)objc_msgSend(CFSTR("activationMode"), "UTF8String"));
      objc_msgSend(CFSTR("targetContentIdentifier"), "UTF8String");
      BSDeserializeStringFromXPCDictionaryWithKey();
      v17 = objc_claimAutoreleasedReturnValue();
      targetContentIdentifier = v5->_targetContentIdentifier;
      v5->_targetContentIdentifier = (NSString *)v17;

      xpc_dictionary_get_value(v4, (const char *)objc_msgSend(CFSTR("userInfoData"), "UTF8String"));
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (v19 && MEMORY[0x193FF8A34](v19) == MEMORY[0x1E0C812E8])
      {
        v21 = (void *)MEMORY[0x1E0C99D50];
        bytes_ptr = xpc_data_get_bytes_ptr(v20);
        objc_msgSend(v21, "dataWithBytes:length:", bytes_ptr, xpc_data_get_length(v20));
        v23 = objc_claimAutoreleasedReturnValue();
        userInfoData = v5->_userInfoData;
        v5->_userInfoData = (NSData *)v23;

      }
      objc_msgSend(CFSTR("bundleIdentifierToLaunch"), "UTF8String");
      BSDeserializeStringFromXPCDictionaryWithKey();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "copy");
      bundleIdentifierToLaunch = v5->_bundleIdentifierToLaunch;
      v5->_bundleIdentifierToLaunch = (NSString *)v26;

    }
    self = v5;
    v28 = self;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  if (xdict)
  {
    objc_msgSend(CFSTR("type"), "UTF8String");
    BSSerializeStringToXPCDictionaryWithKey();
    objc_msgSend(CFSTR("title"), "UTF8String");
    BSSerializeStringToXPCDictionaryWithKey();
    objc_msgSend(CFSTR("subtitle"), "UTF8String");
    BSSerializeStringToXPCDictionaryWithKey();
    objc_msgSend(CFSTR("icon"), "UTF8String");
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    objc_msgSend(CFSTR("targetContentIdentifier"), "UTF8String");
    BSSerializeStringToXPCDictionaryWithKey();
    if (-[NSData length](self->_userInfoData, "length"))
      xpc_dictionary_set_data(xdict, (const char *)objc_msgSend(CFSTR("userInfoData"), "UTF8String"), -[NSData bytes](self->_userInfoData, "bytes"), -[NSData length](self->_userInfoData, "length"));
    xpc_dictionary_set_int64(xdict, (const char *)objc_msgSend(CFSTR("activationMode"), "UTF8String"), self->_activationMode);
    objc_msgSend(CFSTR("bundleIdentifierToLaunch"), "UTF8String");
    BSSerializeStringToXPCDictionaryWithKey();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoData, 0);
  objc_storeStrong((id *)&self->_targetContentIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierToLaunch, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_type, 0);
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

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_type, "hash");
  return -[NSString hash](self->_localizedTitle, "hash") ^ v3;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_type, CFSTR("type"));
  objc_msgSend(v3, "appendString:withName:", self->_localizedTitle, CFSTR("localizedTitle"));
  objc_msgSend(v3, "appendString:withName:", self->_localizedSubtitle, CFSTR("localizedSubtitle"));
  objc_msgSend(v3, "appendString:withName:", self->_targetContentIdentifier, CFSTR("targetContentIdentifier"));
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_icon, CFSTR("icon"));
  objc_msgSend(v3, "appendString:withName:", self->_bundleIdentifierToLaunch, CFSTR("bundleIdentifierToLaunch"));
  v5 = (id)objc_msgSend(v3, "appendInt:withName:", LODWORD(self->_activationMode), CFSTR("activationMode"));
  -[SBSApplicationShortcutItem userInfoData](self, "userInfoData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__SBSApplicationShortcutItem_description__block_invoke;
  v11[3] = &unk_1E288D7C8;
  v12 = v6;
  v7 = v6;
  __41__SBSApplicationShortcutItem_description__block_invoke((uint64_t)v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendDictionarySection:withName:skipIfEmpty:", v8, CFSTR("userInfoData"), 1);

  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

id __41__SBSApplicationShortcutItem_description__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v1, 0, 0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v2;
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

+ (id)_staticApplicationShortcutItemsFromInfoPlistEntry:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SBSApplicationShortcutItem *v17;
  SBSApplicationShortcutSystemIcon *v18;
  SBSApplicationShortcutSystemIcon *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v26 = v3;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (!v5)
    {
      v29 = 0;
      goto LABEL_33;
    }
    v6 = v5;
    v7 = *(_QWORD *)v34;
    v27 = v4;
    v29 = 0;
    v30 = *(_QWORD *)v34;
    while (1)
    {
      v8 = 0;
      v28 = v6;
      do
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "bs_safeStringForKey:", CFSTR("UIApplicationShortcutItemType"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "bs_safeStringForKey:", CFSTR("UIApplicationShortcutItemTitle"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "bs_safeStringForKey:", CFSTR("UIApplicationShortcutItemSubtitle"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "bs_safeStringForKey:", CFSTR("UIApplicationShortcutItemIconType"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "bs_safeStringForKey:", CFSTR("UIApplicationShortcutItemIconFile"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "bs_safeDictionaryForKey:", CFSTR("UIApplicationShortcutItemUserInfo"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "bs_safeStringForKey:", CFSTR("UIApplicationShortcutItemActivationMode"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "bs_safeStringForKey:", CFSTR("UIApplicationShortcutItemTargetContentIdentifier"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "bs_safeStringForKey:", CFSTR("UIApplicationShortcutItemIconSymbolName"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10 && v11)
          {
            v17 = objc_alloc_init(SBSApplicationShortcutItem);
            -[SBSApplicationShortcutItem setType:](v17, "setType:", v10);
            -[SBSApplicationShortcutItem setLocalizedTitle:](v17, "setLocalizedTitle:", v11);
            -[SBSApplicationShortcutItem setLocalizedSubtitle:](v17, "setLocalizedSubtitle:", v32);
            if (v16)
            {
              v18 = -[SBSApplicationShortcutSystemIcon initWithSystemImageName:]([SBSApplicationShortcutSystemIcon alloc], "initWithSystemImageName:", v16);
              goto LABEL_14;
            }
            if (v12)
            {
              v18 = -[SBSApplicationShortcutTemplateIcon initWithTemplateImageName:]([SBSApplicationShortcutTemplateIcon alloc], "initWithTemplateImageName:", v12);
              goto LABEL_14;
            }
            if (v31)
            {
              v21 = SBSApplicationShortcutSystemIconTypeForString(v31);
              if (v21 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v18 = -[SBSApplicationShortcutSystemIcon initWithType:]([SBSApplicationShortcutSystemIcon alloc], "initWithType:", v21);
LABEL_14:
                v19 = v18;
                -[SBSApplicationShortcutItem setIcon:](v17, "setIcon:", v18);

              }
            }
            -[SBSApplicationShortcutItem setUserInfo:](v17, "setUserInfo:", v13);
            v20 = SBSApplicationShortcutItemActivationModeForString(v14);
            if (v20 != 0x7FFFFFFFFFFFFFFFLL)
              -[SBSApplicationShortcutItem setActivationMode:](v17, "setActivationMode:", v20);
            v4 = v27;
            if (v15)
              -[SBSApplicationShortcutItem setTargetContentIdentifier:](v17, "setTargetContentIdentifier:", v15);
            if (v29)
            {
              objc_msgSend(v29, "addObject:", v17);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v17);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
            }

            v6 = v28;
          }

          v7 = v30;
        }
        ++v8;
      }
      while (v6 != v8);
      v22 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      v6 = v22;
      if (!v22)
      {
LABEL_33:

        v3 = v26;
        v23 = v29;
        goto LABEL_34;
      }
    }
  }
  v23 = 0;
LABEL_34:
  v24 = (void *)objc_msgSend(v23, "copy");

  return v24;
}

- (void)_localizeWithHandler:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = (void (**)(id, id))a3;
    -[SBSApplicationShortcutItem localizedTitle](self, "localizedTitle");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[SBSApplicationShortcutItem localizedSubtitle](self, "localizedSubtitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && (objc_msgSend(v6, "isEqualToString:", v8) & 1) == 0)
      -[SBSApplicationShortcutItem setLocalizedTitle:](self, "setLocalizedTitle:", v6);
    if (v7)
    {
      if ((objc_msgSend(v7, "isEqualToString:", v5) & 1) == 0)
        -[SBSApplicationShortcutItem setLocalizedSubtitle:](self, "setLocalizedSubtitle:", v7);
    }

  }
}

@end
