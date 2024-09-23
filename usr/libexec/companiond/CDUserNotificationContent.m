@implementation CDUserNotificationContent

+ (CDUserNotificationContent)appSignInContent
{
  CDUserNotificationContent *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:](v2, "setBundleIdentifier:", CFSTR("com.apple.CompanionNotifications"));
  -[CDUserNotificationContent setCategoryIdentifier:](v2, "setCategoryIdentifier:", CFSTR("CDUserNotificationCategoryGeneric"));
  -[CDUserNotificationContent setFlags:](v2, "setFlags:", 17);
  -[CDUserNotificationContent setIconSystemName:](v2, "setIconSystemName:", CFSTR("person.crop.circle"));
  -[CDUserNotificationContent setTitleKey:](v2, "setTitleKey:", CFSTR("APP_SIGN_IN_TITLE"));
  v3 = (void *)GestaltCopyAnswer(CFSTR("DeviceName"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("APP_SIGN_IN_BODY"), v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uppercaseString"));

  -[CDUserNotificationContent setBodyKey:](v2, "setBodyKey:", v5);
  return v2;
}

+ (CDUserNotificationContent)legacyAppSignInContent
{
  CDUserNotificationContent *v2;

  v2 = objc_alloc_init(CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:](v2, "setBundleIdentifier:", CFSTR("com.apple.CompanionNotifications"));
  -[CDUserNotificationContent setCategoryIdentifier:](v2, "setCategoryIdentifier:", CFSTR("CDUserNotificationCategoryGeneric"));
  -[CDUserNotificationContent setFlags:](v2, "setFlags:", 17);
  -[CDUserNotificationContent setIconSystemName:](v2, "setIconSystemName:", CFSTR("person.crop.circle"));
  -[CDUserNotificationContent setTitleKey:](v2, "setTitleKey:", CFSTR("LEGACY_APP_SIGN_IN_TITLE"));
  -[CDUserNotificationContent setBodyKey:](v2, "setBodyKey:", CFSTR("LEGACY_APP_SIGN_IN_BODY"));
  return v2;
}

+ (CDUserNotificationContent)storePurchaseContent
{
  CDUserNotificationContent *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:](v2, "setBundleIdentifier:", CFSTR("com.apple.CompanionNotifications"));
  -[CDUserNotificationContent setCategoryIdentifier:](v2, "setCategoryIdentifier:", CFSTR("CDUserNotificationCategoryGeneric"));
  -[CDUserNotificationContent setFlags:](v2, "setFlags:", 17);
  if (GestaltGetBoolean(CFSTR("8olRm6C1xqr7AJGpLRnpSw"), 0, 0))
    v3 = CFSTR("faceid");
  else
    v3 = CFSTR("touchid");
  -[CDUserNotificationContent setIconSystemName:](v2, "setIconSystemName:", v3);
  -[CDUserNotificationContent setTitleKey:](v2, "setTitleKey:", CFSTR("STORE_PURCHASE_TITLE"));
  v4 = (void *)GestaltCopyAnswer(CFSTR("DeviceName"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("STORE_PURCHASE_BODY"), v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uppercaseString"));

  -[CDUserNotificationContent setBodyKey:](v2, "setBodyKey:", v6);
  return v2;
}

+ (CDUserNotificationContent)registerPasskeyContent
{
  CDUserNotificationContent *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:](v2, "setBundleIdentifier:", CFSTR("com.apple.CompanionNotifications"));
  -[CDUserNotificationContent setCategoryIdentifier:](v2, "setCategoryIdentifier:", CFSTR("CDUserNotificationCategoryGeneric"));
  -[CDUserNotificationContent setFlags:](v2, "setFlags:", 17);
  -[CDUserNotificationContent setIconSystemName:](v2, "setIconSystemName:", CFSTR("person.badge.key.fill"));
  -[CDUserNotificationContent setTitleKey:](v2, "setTitleKey:", CFSTR("REGISTER_PASSKEY_TITLE"));
  v3 = (void *)GestaltCopyAnswer(CFSTR("DeviceName"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("REGISTER_PASSKEY_BODY"), v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uppercaseString"));

  -[CDUserNotificationContent setBodyKey:](v2, "setBodyKey:", v5);
  return v2;
}

+ (id)notificationContentForSystemService:(int64_t)a3
{
  void *v3;

  switch(a3)
  {
    case 4:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_recognizeMyVoiceContent"));
      break;
    case 3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_photosContent"));
      break;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sharedWithYouContent"));
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

+ (id)restrictedAccessContentForRestrictionType:(int64_t)a3
{
  CDUserNotificationContent *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v4 = objc_alloc_init(CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:](v4, "setBundleIdentifier:", CFSTR("com.apple.CompanionNotifications"));
  -[CDUserNotificationContent setCategoryIdentifier:](v4, "setCategoryIdentifier:", CFSTR("CDUserNotificationCategoryGeneric"));
  -[CDUserNotificationContent setFlags:](v4, "setFlags:", 17);
  -[CDUserNotificationContent setIconSystemName:](v4, "setIconSystemName:", CFSTR("figure.child.and.lock.fill"));
  -[CDUserNotificationContent setTitleKey:](v4, "setTitleKey:", CFSTR("RESTRICTED_ACCESS_TITLE"));
  switch(a3)
  {
    case 1:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("RESTRICTED_ACCESS_BODY_CONTENT");
      goto LABEL_8;
    case 2:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("RESTRICTED_ACCESS_BODY_SETTINGS");
      goto LABEL_8;
    case 3:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("RESTRICTED_ACCESS_BODY_PURCHASE");
      goto LABEL_8;
    case 4:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("RESTRICTED_ACCESS_BODY_CONFERENCE_ROOM_DISPLAY");
      goto LABEL_8;
    case 5:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("RESTRICTED_ACCESS_BODY_MODIFY_RESTRICTIONS");
      goto LABEL_8;
    case 6:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("RESTRICTED_ACCESS_BODY_TURN_OFF_RESTRICTIONS");
LABEL_8:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_100031A80, 0));
      -[CDUserNotificationContent setBodyKey:](v4, "setBodyKey:", v8);

      break;
    default:
      return v4;
  }
  return v4;
}

+ (CDUserNotificationContent)storeAuthenticationContent
{
  CDUserNotificationContent *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:](v2, "setBundleIdentifier:", CFSTR("com.apple.CompanionNotifications"));
  -[CDUserNotificationContent setCategoryIdentifier:](v2, "setCategoryIdentifier:", CFSTR("CDUserNotificationCategoryGeneric"));
  -[CDUserNotificationContent setFlags:](v2, "setFlags:", 17);
  -[CDUserNotificationContent setIconSystemName:](v2, "setIconSystemName:", CFSTR("person.circle"));
  -[CDUserNotificationContent setTitleKey:](v2, "setTitleKey:", CFSTR("STORE_AUTHENTICATION_TITLE"));
  v3 = (void *)GestaltCopyAnswer(CFSTR("DeviceName"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("STORE_AUTHENTICATION_BODY"), v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uppercaseString"));

  -[CDUserNotificationContent setBodyKey:](v2, "setBodyKey:", v5);
  return v2;
}

+ (CDUserNotificationContent)tvProviderContent
{
  CDUserNotificationContent *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:](v2, "setBundleIdentifier:", CFSTR("com.apple.CompanionNotifications"));
  -[CDUserNotificationContent setCategoryIdentifier:](v2, "setCategoryIdentifier:", CFSTR("CDUserNotificationCategoryGeneric"));
  -[CDUserNotificationContent setFlags:](v2, "setFlags:", 17);
  -[CDUserNotificationContent setIconSystemName:](v2, "setIconSystemName:", CFSTR("tv"));
  -[CDUserNotificationContent setTitleKey:](v2, "setTitleKey:", CFSTR("TV_PROVIDER_TITLE"));
  v3 = (void *)GestaltCopyAnswer(CFSTR("DeviceName"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("TV_PROVIDER_BODY"), v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uppercaseString"));

  -[CDUserNotificationContent setBodyKey:](v2, "setBodyKey:", v5);
  return v2;
}

+ (CDUserNotificationContent)learnMoreContent
{
  CDUserNotificationContent *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:](v2, "setBundleIdentifier:", CFSTR("com.apple.CompanionNotifications"));
  -[CDUserNotificationContent setCategoryIdentifier:](v2, "setCategoryIdentifier:", CFSTR("CDUserNotificationCategoryGeneric"));
  -[CDUserNotificationContent setFlags:](v2, "setFlags:", 17);
  -[CDUserNotificationContent setIconSystemName:](v2, "setIconSystemName:", CFSTR("safari"));
  -[CDUserNotificationContent setTitleKey:](v2, "setTitleKey:", CFSTR("LEARN_MORE_TITLE"));
  v3 = (void *)GestaltCopyAnswer(CFSTR("DeviceName"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("LEARN_MORE_BODY"), v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uppercaseString"));

  -[CDUserNotificationContent setBodyKey:](v2, "setBodyKey:", v5);
  return v2;
}

+ (id)dedicatedCameraContentForDeviceType:(int64_t)a3
{
  CDUserNotificationContent *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:](v3, "setBundleIdentifier:", CFSTR("com.apple.CompanionNotifications"));
  -[CDUserNotificationContent setCategoryIdentifier:](v3, "setCategoryIdentifier:", CFSTR("CDUserNotificationCategoryGeneric"));
  -[CDUserNotificationContent setFlags:](v3, "setFlags:", 17);
  -[CDUserNotificationContent setIconSystemName:](v3, "setIconSystemName:", CFSTR("rectangle.inset.filled.and.camera"));
  -[CDUserNotificationContent setTitleKey:](v3, "setTitleKey:", CFSTR("DEDICATED_CAMERA_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("DEDICATED_CAMERA_BODY"), CFSTR("AppleTV")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uppercaseString"));

  -[CDUserNotificationContent setBodyKey:](v3, "setBodyKey:", v5);
  return v3;
}

- (NSArray)titleArguments
{
  id v2;
  void *v3;
  NSArray *v4;

  v2 = -[NSMutableArray copy](self->_mutableTitleArguments, "copy");
  v3 = v2;
  if (!v2)
    v2 = &__NSArray0__struct;
  v4 = (NSArray *)v2;

  return v4;
}

- (void)addTitleArgument:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *mutableTitleArguments;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = v4;
  mutableTitleArguments = self->_mutableTitleArguments;
  v10 = v4;
  if (!mutableTitleArguments)
  {
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v8 = self->_mutableTitleArguments;
    self->_mutableTitleArguments = v7;

    v5 = v10;
    mutableTitleArguments = self->_mutableTitleArguments;
    if (v10)
      goto LABEL_3;
LABEL_5:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    -[NSMutableArray addObject:](mutableTitleArguments, "addObject:", v9);

    goto LABEL_6;
  }
  if (!v4)
    goto LABEL_5;
LABEL_3:
  -[NSMutableArray addObject:](mutableTitleArguments, "addObject:", v5);
LABEL_6:

}

- (NSArray)bodyArguments
{
  id v2;
  void *v3;
  NSArray *v4;

  v2 = -[NSMutableArray copy](self->_mutableBodyArguments, "copy");
  v3 = v2;
  if (!v2)
    v2 = &__NSArray0__struct;
  v4 = (NSArray *)v2;

  return v4;
}

- (void)addBodyArgument:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *mutableBodyArguments;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = v4;
  mutableBodyArguments = self->_mutableBodyArguments;
  v10 = v4;
  if (!mutableBodyArguments)
  {
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v8 = self->_mutableBodyArguments;
    self->_mutableBodyArguments = v7;

    v5 = v10;
    mutableBodyArguments = self->_mutableBodyArguments;
    if (v10)
      goto LABEL_3;
LABEL_5:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    -[NSMutableArray addObject:](mutableBodyArguments, "addObject:", v9);

    goto LABEL_6;
  }
  if (!v4)
    goto LABEL_5;
LABEL_3:
  -[NSMutableArray addObject:](mutableBodyArguments, "addObject:", v5);
LABEL_6:

}

+ (id)_sharedWithYouContent
{
  CDUserNotificationContent *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:](v2, "setBundleIdentifier:", CFSTR("com.apple.CompanionNotifications"));
  -[CDUserNotificationContent setCategoryIdentifier:](v2, "setCategoryIdentifier:", CFSTR("CDUserNotificationCategoryGeneric"));
  -[CDUserNotificationContent setFlags:](v2, "setFlags:", 17);
  -[CDUserNotificationContent setIconSystemName:](v2, "setIconSystemName:", CFSTR("shared.with.you"));
  -[CDUserNotificationContent setTitleKey:](v2, "setTitleKey:", CFSTR("SHARED_WITH_YOU_TITLE"));
  v3 = (void *)GestaltCopyAnswer(CFSTR("DeviceName"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("SHARED_WITH_YOU_BODY"), v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uppercaseString"));

  -[CDUserNotificationContent setBodyKey:](v2, "setBodyKey:", v5);
  return v2;
}

+ (id)_photosContent
{
  CDUserNotificationContent *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:](v2, "setBundleIdentifier:", CFSTR("com.apple.CompanionNotifications"));
  -[CDUserNotificationContent setCategoryIdentifier:](v2, "setCategoryIdentifier:", CFSTR("CDUserNotificationCategoryGeneric"));
  -[CDUserNotificationContent setFlags:](v2, "setFlags:", 17);
  -[CDUserNotificationContent setIconSystemName:](v2, "setIconSystemName:", CFSTR("photos"));
  -[CDUserNotificationContent setTitleKey:](v2, "setTitleKey:", CFSTR("PHOTOS_TITLE"));
  v3 = (void *)GestaltCopyAnswer(CFSTR("DeviceName"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("PHOTOS_BODY"), v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uppercaseString"));

  -[CDUserNotificationContent setBodyKey:](v2, "setBodyKey:", v5);
  return v2;
}

+ (id)_recognizeMyVoiceContent
{
  CDUserNotificationContent *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(CDUserNotificationContent);
  -[CDUserNotificationContent setBundleIdentifier:](v2, "setBundleIdentifier:", CFSTR("com.apple.CompanionNotifications"));
  -[CDUserNotificationContent setCategoryIdentifier:](v2, "setCategoryIdentifier:", CFSTR("CDUserNotificationCategoryGeneric"));
  -[CDUserNotificationContent setFlags:](v2, "setFlags:", 17);
  -[CDUserNotificationContent setIconName:](v2, "setIconName:", CFSTR("siri-icon"));
  -[CDUserNotificationContent setTitleKey:](v2, "setTitleKey:", CFSTR("RECOGNIZE_MY_VOICE_TITLE"));
  v3 = (void *)GestaltCopyAnswer(CFSTR("DeviceName"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("RECOGNIZE_MY_VOICE_BODY"), v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uppercaseString"));

  -[CDUserNotificationContent setBodyKey:](v2, "setBodyKey:", v5);
  return v2;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (NSString)iconSystemName
{
  return self->_iconSystemName;
}

- (void)setIconSystemName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (void)setTitleKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)bodyKey
{
  return self->_bodyKey;
}

- (void)setBodyKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyKey, 0);
  objc_storeStrong((id *)&self->_titleKey, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_iconSystemName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_mutableBodyArguments, 0);
  objc_storeStrong((id *)&self->_mutableTitleArguments, 0);
}

@end
