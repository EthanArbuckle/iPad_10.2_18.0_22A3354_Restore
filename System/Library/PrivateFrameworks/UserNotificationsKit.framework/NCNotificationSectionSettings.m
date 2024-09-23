@implementation NCNotificationSectionSettings

- (NSDictionary)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_muteAssertion, 0);
  objc_storeStrong((id *)&self->_settingsIcon, 0);
  objc_storeStrong((id *)&self->_subSectionSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_subSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
}

- (NCNotificationMuteAssertion)muteAssertion
{
  return self->_muteAssertion;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  unint64_t v9;

  v3 = -[NSString hash](self->_sectionIdentifier, "hash");
  v4 = -[NSString hash](self->_subSectionIdentifier, "hash") + v3;
  v5 = -[NSString hash](self->_displayName, "hash");
  v6 = v4 + v5 + -[NSDictionary hash](self->_settings, "hash");
  v7 = -[NSSet hash](self->_subSectionSettings, "hash") + self->_userConfigurable;
  v8 = v6 + v7 + -[UIImage hash](self->_settingsIcon, "hash");
  v9 = self->_showsCustomSettingsLink
     + (unint64_t)self->_isDeliveredQuietly
     + self->_hasProvisialAuthorization
     + self->_isAppClip;
  return v8 + v9 + -[NCNotificationMuteAssertion hash](self->_muteAssertion, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  char v30;
  void *v32;
  void *v33;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_16;
  -[NCNotificationSectionSettings sectionIdentifier](self, "sectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = NCIsEqual(v7, v8);

  if (!v9)
    goto LABEL_16;
  -[NCNotificationSectionSettings subSectionIdentifier](self, "subSectionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subSectionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = NCIsEqual(v10, v11);

  if (!v12)
    goto LABEL_16;
  -[NCNotificationSectionSettings displayName](self, "displayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = NCIsEqual(v13, v14);

  if (!v15)
    goto LABEL_16;
  -[NCNotificationSectionSettings settings](self, "settings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = NCIsEqualToDictionary(v16, v17);

  if (!v18)
    goto LABEL_16;
  -[NCNotificationSectionSettings subSectionSettings](self, "subSectionSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subSectionSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = NCIsEqualToSet(v19, v20);

  if (!v21)
    goto LABEL_16;
  v22 = -[NCNotificationSectionSettings isUserConfigurable](self, "isUserConfigurable");
  if (v22 != objc_msgSend(v6, "isUserConfigurable"))
    goto LABEL_16;
  -[NCNotificationSectionSettings settingsIcon](self, "settingsIcon");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settingsIcon");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = NCIsEqual(v23, v24);

  if (!v25)
    goto LABEL_16;
  v26 = -[NCNotificationSectionSettings showsCustomSettingsLink](self, "showsCustomSettingsLink");
  if (v26 == objc_msgSend(v6, "showsCustomSettingsLink")
    && (v27 = -[NCNotificationSectionSettings isDeliveredQuietly](self, "isDeliveredQuietly"),
        v27 == objc_msgSend(v6, "isDeliveredQuietly"))
    && (v28 = -[NCNotificationSectionSettings hasProvisionalAuthorization](self, "hasProvisionalAuthorization"),
        v28 == objc_msgSend(v6, "hasProvisionalAuthorization"))
    && (v29 = -[NCNotificationSectionSettings isAppClip](self, "isAppClip"),
        v29 == objc_msgSend(v6, "isAppClip")))
  {
    -[NCNotificationSectionSettings muteAssertion](self, "muteAssertion");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "muteAssertion");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = NCIsEqual(v32, v33);

  }
  else
  {
LABEL_16:
    v30 = 0;
  }

  return v30;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSString)subSectionIdentifier
{
  return self->_subSectionIdentifier;
}

- (NCNotificationSectionSettings)initWithNotificationSectionSettings:(id)a3
{
  id v4;
  NCNotificationSectionSettings *v5;
  void *v6;
  uint64_t v7;
  NSString *sectionIdentifier;
  void *v9;
  uint64_t v10;
  NSString *subSectionIdentifier;
  void *v12;
  uint64_t v13;
  NSString *displayName;
  void *v15;
  uint64_t v16;
  NSDictionary *settings;
  void *v18;
  uint64_t v19;
  NSSet *subSectionSettings;
  uint64_t v21;
  UIImage *settingsIcon;
  void *v23;
  uint64_t v24;
  NCNotificationMuteAssertion *muteAssertion;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NCNotificationSectionSettings;
  v5 = -[NCNotificationSectionSettings init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "sectionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    sectionIdentifier = v5->_sectionIdentifier;
    v5->_sectionIdentifier = (NSString *)v7;

    objc_msgSend(v4, "subSectionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    subSectionIdentifier = v5->_subSectionIdentifier;
    v5->_subSectionIdentifier = (NSString *)v10;

    objc_msgSend(v4, "displayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v13;

    objc_msgSend(v4, "settings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    settings = v5->_settings;
    v5->_settings = (NSDictionary *)v16;

    objc_msgSend(v4, "subSectionSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    subSectionSettings = v5->_subSectionSettings;
    v5->_subSectionSettings = (NSSet *)v19;

    v5->_userConfigurable = objc_msgSend(v4, "isUserConfigurable");
    objc_msgSend(v4, "settingsIcon");
    v21 = objc_claimAutoreleasedReturnValue();
    settingsIcon = v5->_settingsIcon;
    v5->_settingsIcon = (UIImage *)v21;

    v5->_showsCustomSettingsLink = objc_msgSend(v4, "showsCustomSettingsLink");
    v5->_isDeliveredQuietly = objc_msgSend(v4, "isDeliveredQuietly");
    v5->_hasProvisialAuthorization = objc_msgSend(v4, "hasProvisionalAuthorization");
    v5->_isAppClip = objc_msgSend(v4, "isAppClip");
    objc_msgSend(v4, "muteAssertion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copyWithZone:", 0);
    muteAssertion = v5->_muteAssertion;
    v5->_muteAssertion = (NCNotificationMuteAssertion *)v24;

  }
  return v5;
}

- (NSString)debugDescription
{
  return (NSString *)-[NCNotificationSectionSettings descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NCNotificationSectionSettings initWithNotificationSectionSettings:]([NCMutableNotificationSectionSettings alloc], "initWithNotificationSectionSettings:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[NCNotificationSectionSettings descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  NCNotificationSectionSettings *v12;

  v4 = (void *)MEMORY[0x24BE0BE08];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__NCNotificationSectionSettings_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_24D270158;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

void __71__NCNotificationSectionSettings_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("sectionId"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "subSectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", v6, CFSTR("subSectionId"), 1);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "appendObject:withName:", v9, CFSTR("displayName"));

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendDictionarySection:withName:skipIfEmpty:", v12, CFSTR("settings"), 0);

  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "subSectionSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendArraySection:withName:skipIfEmpty:", v15, CFSTR("subSectionSettings"), 1);

  v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isUserConfigurable"), CFSTR("userConfigurable"));
  v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "showsCustomSettingsLink"), CFSTR("customSettingsLink"));
  v18 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isDeliveredQuietly"), CFSTR("deliveredQuietly"));
  v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "hasProvisionalAuthorization"), CFSTR("provisionalAuthorization"));
  v20 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isAppClip"), CFSTR("appClip"));
  v21 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "muteAssertion");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v21, "appendObject:withName:", v23, CFSTR("muteAssertion"));

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[NCNotificationSectionSettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationSectionSettings sectionIdentifier](self, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("sectionId"));

  -[NCNotificationSectionSettings subSectionIdentifier](self, "subSectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v6, CFSTR("subSectionId"), 1);

  return v3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSSet)subSectionSettings
{
  return self->_subSectionSettings;
}

- (BOOL)isUserConfigurable
{
  return self->_userConfigurable;
}

- (UIImage)settingsIcon
{
  return self->_settingsIcon;
}

- (BOOL)showsCustomSettingsLink
{
  return self->_showsCustomSettingsLink;
}

- (BOOL)isDeliveredQuietly
{
  return self->_isDeliveredQuietly;
}

- (BOOL)hasProvisionalAuthorization
{
  return self->_hasProvisialAuthorization;
}

- (BOOL)isAppClip
{
  return self->_isAppClip;
}

@end
