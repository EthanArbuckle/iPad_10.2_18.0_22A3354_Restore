@implementation REUIDonatedElementProperties

+ (void)createWithDonatedAction:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__REUIDonatedElementProperties_createWithDonatedAction_completion___block_invoke;
  v10[3] = &unk_24CF79DC8;
  v11 = v7;
  v12 = v5;
  v8 = v7;
  v9 = v5;
  objc_msgSend(v8, "loadForAction:completion:", v6, v10);

}

uint64_t __67__REUIDonatedElementProperties_createWithDonatedAction_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)copyWithZone:(_NSZone *)a3
{
  REUIDonatedElementProperties *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  NSString *remoteBundleIdentifier;
  uint64_t v10;
  NSString *localBundleIdentifier;
  uint64_t v12;
  NSString *appName;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  NSString *subtitle;
  uint64_t v18;
  INIntent *intent;
  uint64_t v20;
  INRelevantShortcut *relevantShortcut;

  v5 = -[REUIDonatedElementProperties init](+[REUIDonatedElementProperties allocWithZone:](REUIDonatedElementProperties, "allocWithZone:"), "init");
  -[REUIDonatedElementProperties bundleIdentifier](self, "bundleIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  bundleIdentifier = v5->_bundleIdentifier;
  v5->_bundleIdentifier = (NSString *)v6;

  -[REUIDonatedElementProperties remoteBundleIdentifier](self, "remoteBundleIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  remoteBundleIdentifier = v5->_remoteBundleIdentifier;
  v5->_remoteBundleIdentifier = (NSString *)v8;

  -[REUIDonatedElementProperties localBundleIdentifier](self, "localBundleIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  localBundleIdentifier = v5->_localBundleIdentifier;
  v5->_localBundleIdentifier = (NSString *)v10;

  v5->_donationType = -[REUIDonatedElementProperties donationType](self, "donationType");
  v5->_localDonation = -[REUIDonatedElementProperties isLocalDonation](self, "isLocalDonation");
  v5->_actionIdentifier = -[REUIDonatedElementProperties actionIdentifier](self, "actionIdentifier");
  v12 = -[NSString copyWithZone:](self->_appName, "copyWithZone:", a3);
  appName = v5->_appName;
  v5->_appName = (NSString *)v12;

  objc_storeStrong((id *)&v5->_appIcon, self->_appIcon);
  objc_storeStrong((id *)&v5->_fullsizeAppIcon, self->_fullsizeAppIcon);
  v14 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  title = v5->_title;
  v5->_title = (NSString *)v14;

  v16 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  subtitle = v5->_subtitle;
  v5->_subtitle = (NSString *)v16;

  objc_storeStrong((id *)&v5->_bodyImage, self->_bodyImage);
  objc_storeStrong((id *)&v5->_userActivity, self->_userActivity);
  v18 = -[INIntent copyWithZone:](self->_intent, "copyWithZone:", a3);
  intent = v5->_intent;
  v5->_intent = (INIntent *)v18;

  v20 = -[INRelevantShortcut copyWithZone:](self->_relevantShortcut, "copyWithZone:", a3);
  relevantShortcut = v5->_relevantShortcut;
  v5->_relevantShortcut = (INRelevantShortcut *)v20;

  v5->_displayAppName = self->_displayAppName;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REUIDonatedElementProperties)initWithCoder:(id)a3
{
  id v4;
  REUIDonatedElementProperties *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *bundleIdentifier;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSString *remoteBundleIdentifier;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *localBundleIdentifier;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *appName;
  uint64_t v23;
  UIImage *appIcon;
  uint64_t v25;
  UIImage *fullsizeAppIcon;
  uint64_t v27;
  NSString *title;
  uint64_t v29;
  NSString *subtitle;
  uint64_t v31;
  UIImage *bodyImage;
  uint64_t v33;
  NSUserActivity *userActivity;
  uint64_t v35;
  INIntent *intent;
  uint64_t v37;
  INRelevantShortcut *relevantShortcut;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)REUIDonatedElementProperties;
  v5 = -[REUIDonatedElementProperties init](&v40, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_bundleIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_remoteBundleIdentifier);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    remoteBundleIdentifier = v5->_remoteBundleIdentifier;
    v5->_remoteBundleIdentifier = (NSString *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_localBundleIdentifier);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    localBundleIdentifier = v5->_localBundleIdentifier;
    v5->_localBundleIdentifier = (NSString *)v16;

    NSStringFromSelector(sel_donationType);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_donationType = objc_msgSend(v4, "decodeIntegerForKey:", v18);

    NSStringFromSelector(sel_isLocalDonation);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_localDonation = objc_msgSend(v4, "decodeBoolForKey:", v19);

    NSStringFromSelector(sel_actionIdentifier);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_actionIdentifier = objc_msgSend(v4, "decodeInt64ForKey:", v20);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appName"));
    v21 = objc_claimAutoreleasedReturnValue();
    appName = v5->_appName;
    v5->_appName = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appIcon"));
    v23 = objc_claimAutoreleasedReturnValue();
    appIcon = v5->_appIcon;
    v5->_appIcon = (UIImage *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullsizeAppIcon"));
    v25 = objc_claimAutoreleasedReturnValue();
    fullsizeAppIcon = v5->_fullsizeAppIcon;
    v5->_fullsizeAppIcon = (UIImage *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v27 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v29 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bodyImage"));
    v31 = objc_claimAutoreleasedReturnValue();
    bodyImage = v5->_bodyImage;
    v5->_bodyImage = (UIImage *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userActivity"));
    v33 = objc_claimAutoreleasedReturnValue();
    userActivity = v5->_userActivity;
    v5->_userActivity = (NSUserActivity *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent"));
    v35 = objc_claimAutoreleasedReturnValue();
    intent = v5->_intent;
    v5->_intent = (INIntent *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relevantShortcut"));
    v37 = objc_claimAutoreleasedReturnValue();
    relevantShortcut = v5->_relevantShortcut;
    v5->_relevantShortcut = (INRelevantShortcut *)v37;

    v5->_displayAppName = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("displayAppName"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  -[REUIDonatedElementProperties bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bundleIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v4, v5);

  -[REUIDonatedElementProperties remoteBundleIdentifier](self, "remoteBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_remoteBundleIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v6, v7);

  -[REUIDonatedElementProperties localBundleIdentifier](self, "localBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localBundleIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v8, v9);

  v10 = -[REUIDonatedElementProperties donationType](self, "donationType");
  NSStringFromSelector(sel_donationType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeInteger:forKey:", v10, v11);

  v12 = -[REUIDonatedElementProperties isLocalDonation](self, "isLocalDonation");
  NSStringFromSelector(sel_isLocalDonation);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeBool:forKey:", v12, v13);

  v14 = -[REUIDonatedElementProperties actionIdentifier](self, "actionIdentifier");
  NSStringFromSelector(sel_actionIdentifier);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeInt64:forKey:", v14, v15);

  -[REUIDonatedElementProperties appName](self, "appName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v16, CFSTR("appName"));

  -[REUIDonatedElementProperties appIcon](self, "appIcon");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v17, CFSTR("appIcon"));

  -[REUIDonatedElementProperties fullsizeAppIcon](self, "fullsizeAppIcon");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v18, CFSTR("fullsizeAppIcon"));

  -[REUIDonatedElementProperties title](self, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v19, CFSTR("title"));

  -[REUIDonatedElementProperties subtitle](self, "subtitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v20, CFSTR("subtitle"));

  -[REUIDonatedElementProperties bodyImage](self, "bodyImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v21, CFSTR("bodyImage"));

  -[REUIDonatedElementProperties userActivity](self, "userActivity");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v22, CFSTR("userActivity"));

  -[REUIDonatedElementProperties intent](self, "intent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v23, CFSTR("intent"));

  -[REUIDonatedElementProperties relevantShortcut](self, "relevantShortcut");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeObject:forKey:", v24, CFSTR("relevantShortcut"));

  objc_msgSend(v25, "encodeBool:forKey:", -[REUIDonatedElementProperties displayAppName](self, "displayAppName"), CFSTR("displayAppName"));
}

- (void)loadForAction:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSString *v9;
  NSString *bundleIdentifier;
  NSString *v11;
  NSString *remoteBundleIdentifier;
  NSString *v13;
  NSString *localBundleIdentifier;
  void *v15;
  uint64_t v16;
  void (**v17)(_QWORD);
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;

  v6 = a3;
  v7 = a4;
  if (v7)
    v8 = v7;
  else
    v8 = &__block_literal_global_52;
  objc_msgSend(v6, "bundleIdentifier");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v9;

  objc_msgSend(v6, "remoteBundleIdentifier");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  remoteBundleIdentifier = self->_remoteBundleIdentifier;
  self->_remoteBundleIdentifier = v11;

  objc_msgSend(v6, "localBundleIdentifier");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  localBundleIdentifier = self->_localBundleIdentifier;
  self->_localBundleIdentifier = v13;

  self->_donationType = objc_msgSend(v6, "type");
  self->_localDonation = objc_msgSend(v6, "isLocalDonation");
  objc_msgSend(v6, "actionTypeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  self->_actionIdentifier = objc_msgSend(v15, "re_actionIdentifierHashValue");

  v16 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __57__REUIDonatedElementProperties_loadForAction_completion___block_invoke_2;
  v26[3] = &unk_24CF79E10;
  v26[4] = self;
  v17 = v8;
  v27 = v17;
  v18 = (void *)MEMORY[0x2199AF51C](v26);
  switch(objc_msgSend(v6, "type"))
  {
    case 0:
      v22[0] = v16;
      v22[1] = 3221225472;
      v22[2] = __57__REUIDonatedElementProperties_loadForAction_completion___block_invoke_4;
      v22[3] = &unk_24CF79E60;
      v22[4] = self;
      v23 = v18;
      objc_msgSend(v6, "loadUserActivity:", v22);
      v19 = v23;
      goto LABEL_8;
    case 1:
      v24[0] = v16;
      v24[1] = 3221225472;
      v24[2] = __57__REUIDonatedElementProperties_loadForAction_completion___block_invoke_3;
      v24[3] = &unk_24CF79E38;
      v24[4] = self;
      v25 = v18;
      objc_msgSend(v6, "loadIntent:", v24);
      v19 = v25;
      goto LABEL_8;
    case 2:
      v20[0] = v16;
      v20[1] = 3221225472;
      v20[2] = __57__REUIDonatedElementProperties_loadForAction_completion___block_invoke_5;
      v20[3] = &unk_24CF79E88;
      v20[4] = self;
      v21 = v18;
      objc_msgSend(v6, "loadRelevantShortcut:", v20);
      v19 = v21;
LABEL_8:

      break;
    case 3:
      v17[2](v17);
      break;
    default:
      break;
  }

}

uint64_t __57__REUIDonatedElementProperties_loadForAction_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadAppContentPropertiesWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __57__REUIDonatedElementProperties_loadForAction_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!RelevanceEngineLibraryCore_frameworkLibrary_0)
  {
    v15 = xmmword_24CF79F68;
    v16 = 0;
    RelevanceEngineLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (RelevanceEngineLibraryCore_frameworkLibrary_0)
  {
    v7 = v6;
    *(_QWORD *)&v15 = 0;
    *((_QWORD *)&v15 + 1) = &v15;
    v16 = 0x2020000000;
    v8 = getREIntentBySimplifyingParametersForIntentSymbolLoc_ptr;
    v17 = getREIntentBySimplifyingParametersForIntentSymbolLoc_ptr;
    if (!getREIntentBySimplifyingParametersForIntentSymbolLoc_ptr)
    {
      v9 = (void *)RelevanceEngineLibrary();
      v8 = dlsym(v9, "REIntentBySimplifyingParametersForIntent");
      *(_QWORD *)(*((_QWORD *)&v15 + 1) + 24) = v8;
      getREIntentBySimplifyingParametersForIntentSymbolLoc_ptr = v8;
    }
    _Block_object_dispose(&v15, 8);
    if (!v8)
    {
      softRESampleRelevanceProviderForPosition_cold_1();
      __break(1u);
    }
    ((void (*)(id))v8)(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  v11 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = a1 + 32;
  objc_msgSend(v11, "_loadContentForIntent:completion:", v10, v12);
  v14 = *(void **)(*(_QWORD *)v13 + 112);
  *(_QWORD *)(*(_QWORD *)v13 + 112) = v5;

}

void __57__REUIDonatedElementProperties_loadForAction_completion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_loadContentForUserActivity:completion:", a3, *(_QWORD *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v5;

}

void __57__REUIDonatedElementProperties_loadForAction_completion___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_loadContentForRelevantShortcut:completion:", a3, *(_QWORD *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v5;

}

- (BOOL)isMediaDonation
{
  void *v3;
  void *v4;
  char isKindOfClass;

  -[REUIDonatedElementProperties intent](self, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[REUIDonatedElementProperties intent](self, "intent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)isWorkoutDonation
{
  void *v2;
  char v3;

  -[REUIDonatedElementProperties bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.SessionTrackerApp"));

  return v3;
}

- (BOOL)isBeginWorkoutDonation
{
  char isKindOfClass;
  void *v4;
  void *v5;
  void *v6;

  if (-[REUIDonatedElementProperties isWorkoutDonation](self, "isWorkoutDonation"))
  {
    isKindOfClass = 1;
  }
  else
  {
    -[REUIDonatedElementProperties intent](self, "intent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[REUIDonatedElementProperties intent](self, "intent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        isKindOfClass = 1;
      }
      else
      {
        -[REUIDonatedElementProperties intent](self, "intent");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

      }
    }
    else
    {
      isKindOfClass = 0;
    }

  }
  return isKindOfClass & 1;
}

- (BOOL)isEndWorkoutDonation
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;

  -[REUIDonatedElementProperties intent](self, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[REUIDonatedElementProperties intent](self, "intent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      isKindOfClass = 1;
    }
    else
    {
      -[REUIDonatedElementProperties intent](self, "intent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        isKindOfClass = 1;
      }
      else
      {
        -[REUIDonatedElementProperties intent](self, "intent");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

      }
    }

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)isRunWorkflowDonation
{
  void *v3;
  void *v4;
  char isKindOfClass;

  -[REUIDonatedElementProperties intent](self, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[REUIDonatedElementProperties intent](self, "intent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)_isMusicDonation
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[REUIDonatedElementProperties isMediaDonation](self, "isMediaDonation");
  if (v3)
  {
    -[REUIDonatedElementProperties bundleIdentifier](self, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Music"));

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)_isPodcastsDonation
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[REUIDonatedElementProperties isMediaDonation](self, "isMediaDonation");
  if (v3)
  {
    -[REUIDonatedElementProperties bundleIdentifier](self, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.podcasts"));

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)requiresRemoteExecution
{
  _BOOL4 v3;

  v3 = -[REUIDonatedElementProperties isMediaDonation](self, "isMediaDonation");
  if (v3)
    LOBYTE(v3) = !-[REUIDonatedElementProperties isLocalDonation](self, "isLocalDonation");
  return v3;
}

- (BOOL)supportsLocalIntentExecution
{
  return !-[REUIDonatedElementProperties requiresRemoteExecution](self, "requiresRemoteExecution")
      && -[REUIDonatedElementProperties isLocalDonation](self, "isLocalDonation")
      || -[REUIDonatedElementProperties _hasLocalExtensionForIntentExecution](self, "_hasLocalExtensionForIntentExecution");
}

- (BOOL)_hasLocalExtensionForIntentExecution
{
  return 0;
}

- (BOOL)supportsBackgroundExecution
{
  if (!self->_intent)
    return 0;
  if (-[REUIDonatedElementProperties isMediaDonation](self, "isMediaDonation")
    && -[REUIDonatedElementProperties isLocalDonation](self, "isLocalDonation"))
  {
    return -[REUIDonatedElementProperties _hasLocalExtensionForIntentExecution](self, "_hasLocalExtensionForIntentExecution");
  }
  return -[INIntent _supportsBackgroundExecution](self->_intent, "_supportsBackgroundExecution");
}

- (id)_placeholderImageNameForBundleID:(id)a3
{
  uint64_t v3;
  id v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  v3 = _placeholderImageNameForBundleID__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_placeholderImageNameForBundleID__onceToken, &__block_literal_global_63);
  objc_msgSend((id)_placeholderImageNameForBundleID__bundleIDToImageName, "objectForKeyedSubscript:", v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = CFSTR("Med Music");
  v7 = v6;

  return v7;
}

void __65__REUIDonatedElementProperties__placeholderImageNameForBundleID___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("com.apple.Music");
  v2[1] = CFSTR("com.apple.podcasts");
  v3[0] = CFSTR("Med Music");
  v3[1] = CFSTR("Med Podcasts");
  v2[2] = CFSTR("com.apple.NanoRadio");
  v3[2] = CFSTR("Med Radio");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_placeholderImageNameForBundleID__bundleIDToImageName;
  _placeholderImageNameForBundleID__bundleIDToImageName = v0;

}

- (UIImage)bodyImage
{
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  UIImage *v9;
  UIImage *bodyImage;

  if (!self->_bodyImage && -[REUIDonatedElementProperties isMediaDonation](self, "isMediaDonation"))
  {
    -[REUIDonatedElementProperties bundleIdentifier](self, "bundleIdentifier");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[REUIDonatedElementProperties intent](self, "intent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "type");

    if (v6 == 9)
    {

      v3 = CFSTR("com.apple.NanoRadio");
    }
    -[REUIDonatedElementProperties _placeholderImageNameForBundleID:](self, "_placeholderImageNameForBundleID:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.RelevanceEngineSiriActions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    REImageNamedFromBundle(v8, v7);
    v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
    bodyImage = self->_bodyImage;
    self->_bodyImage = v9;

    self->_isUsingPlaceholderArtwork = 1;
  }
  return self->_bodyImage;
}

- (NSString)bodyImageCompositingFilter
{
  id v3;
  id v4;

  if (-[REUIDonatedElementProperties isMediaDonation](self, "isMediaDonation")
    && (v3 = -[REUIDonatedElementProperties bodyImage](self, "bodyImage"),
        self->_isUsingPlaceholderArtwork))
  {
    v4 = (id)*MEMORY[0x24BDE5BD8];
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (void)_loadContentForIntent:(id)a3 completion:(id)a4
{
  id v7;
  NSString *v8;
  NSString *title;
  NSString *v10;
  NSString *subtitle;
  void *v12;
  void *v13;
  void *v14;
  UIImage *v15;
  UIImage *bodyImage;
  void (**v17)(void);

  objc_storeStrong((id *)&self->_intent, a3);
  v7 = a3;
  v17 = (void (**)(void))a4;
  objc_msgSend(v7, "_title");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  self->_title = v8;

  objc_msgSend(v7, "_subtitle");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  subtitle = self->_subtitle;
  self->_subtitle = v10;

  v12 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(v7, "keyImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_imageData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageWithData:", v14);
  v15 = (UIImage *)objc_claimAutoreleasedReturnValue();
  bodyImage = self->_bodyImage;
  self->_bodyImage = v15;

  v17[2]();
}

- (void)_loadContentForUserActivity:(id)a3 completion:(id)a4
{
  id v7;
  NSString *v8;
  NSString *title;
  void *v10;
  void *v11;
  void *v12;
  UIImage *v13;
  UIImage *bodyImage;
  void (**v15)(void);

  objc_storeStrong((id *)&self->_userActivity, a3);
  v7 = a3;
  v15 = (void (**)(void))a4;
  objc_msgSend(v7, "title");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  self->_title = v8;

  v10 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(v7, "contentAttributeSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "thumbnailData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageWithData:", v12);
  v13 = (UIImage *)objc_claimAutoreleasedReturnValue();
  bodyImage = self->_bodyImage;
  self->_bodyImage = v13;

  v15[2]();
}

- (void)_loadContentForUserActivityOnShortcut:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  NSString *subtitle;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "activitySubtitle");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  subtitle = self->_subtitle;
  self->_subtitle = v8;

  objc_msgSend(v7, "userActivity");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[REUIDonatedElementProperties _loadContentForUserActivity:completion:](self, "_loadContentForUserActivity:completion:", v10, v6);
}

- (void)_loadContentForRelevantShortcut:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  INIntent *v10;
  INIntent *intent;
  void *v12;
  NSUserActivity *v13;
  NSUserActivity *userActivity;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *title;
  void *v19;
  NSString *v20;
  NSString *subtitle;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  UIImage *v26;
  UIImage *bodyImage;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UIImage *v33;
  UIImage *monochromeBodyImage;
  INIntent *v35;
  void *v36;
  NSObject *v37;

  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  objc_storeStrong((id *)&self->_relevantShortcut, a3);
  objc_msgSend(v7, "shortcut");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "intent");
  v10 = (INIntent *)objc_claimAutoreleasedReturnValue();
  intent = self->_intent;
  self->_intent = v10;

  objc_msgSend(v7, "shortcut");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userActivity");
  v13 = (NSUserActivity *)objc_claimAutoreleasedReturnValue();
  userActivity = self->_userActivity;
  self->_userActivity = v13;

  objc_msgSend(v7, "watchTemplate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v7, "watchTemplate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "title");
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    title = self->_title;
    self->_title = v17;

    objc_msgSend(v7, "watchTemplate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "subtitle");
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    subtitle = self->_subtitle;
    self->_subtitle = v20;

    v22 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(v7, "watchTemplate");
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v23, "image");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_imageData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageWithData:", v25);
    v26 = (UIImage *)objc_claimAutoreleasedReturnValue();
    bodyImage = self->_bodyImage;
    self->_bodyImage = v26;

    objc_msgSend(v7, "watchTemplate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v23) = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      objc_msgSend(v7, "watchTemplate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "monochromeImage");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v31 = (void *)MEMORY[0x24BDF6AC8];
        objc_msgSend(v30, "_imageData");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "imageWithData:", v32);
        v33 = (UIImage *)objc_claimAutoreleasedReturnValue();
        monochromeBodyImage = self->_monochromeBodyImage;
        self->_monochromeBodyImage = v33;

      }
    }
  }
  else
  {
    v35 = self->_intent;
    if (v35)
    {
      -[REUIDonatedElementProperties _loadContentForIntent:completion:](self, "_loadContentForIntent:completion:", v35, v8);
      goto LABEL_11;
    }
    if (self->_userActivity)
    {
      objc_msgSend(v7, "shortcut");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[REUIDonatedElementProperties _loadContentForUserActivityOnShortcut:completion:](self, "_loadContentForUserActivityOnShortcut:completion:", v36, v8);

      goto LABEL_11;
    }
    RELogForDomain();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[REUIDonatedElementProperties _loadContentForRelevantShortcut:completion:].cold.1(v37);

  }
  v8[2](v8);
LABEL_11:

}

- (id)_scaleImageForDisplay:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  double v15;
  double v16;

  v3 = a3;
  v4 = RESuggestedBodyImageSizeForStyle(0);
  v6 = v5;
  v7 = 0;
  v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (*MEMORY[0x24BDBF148] != v4 || v8 != v6)
  {
    objc_msgSend(MEMORY[0x24BDF6AA0], "preferredFormat", *MEMORY[0x24BDBF148], v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOpaque:", 0);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:format:", v10, v4, v6);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __54__REUIDonatedElementProperties__scaleImageForDisplay___block_invoke;
    v13[3] = &unk_24CF79ED0;
    v14 = v3;
    v15 = v4;
    v16 = v6;
    objc_msgSend(v11, "imageWithActions:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

void __54__REUIDonatedElementProperties__scaleImageForDisplay___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  float v5;
  double v6;
  double v7;
  float v8;
  int v9;
  CGContext *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  id v15;
  const CGPath *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float v27;
  id v28;

  v28 = a2;
  objc_msgSend(*(id *)(a1 + 32), "size");
  v4 = v3;
  RESupergreenSuggestedImageDonationWidth();
  if (v4 >= v5
    || (objc_msgSend(*(id *)(a1 + 32), "size"), v7 = v6, RESupergreenSuggestedImageDonationWidth(), v7 >= v8))
  {
    v10 = (CGContext *)objc_msgSend(v28, "CGContext");
    CGContextSetInterpolationQuality(v10, kCGInterpolationHigh);
    v11 = *(double *)(a1 + 40);
    v12 = *(double *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDB8730], "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = ClippingRadiusForDevice(v13);

    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v11, v12, v14);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = (const CGPath *)objc_msgSend(v15, "CGPath");

    CGContextAddPath(v10, v16);
    CGContextClip(v10);
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  v19 = v18;

  objc_msgSend(*(id *)(a1 + 32), "size");
  v21 = v20 / v19;
  v22 = *(double *)(a1 + 40);
  v24 = v23 / v19;
  if (v9)
  {
    v25 = v22 / v21;
    v26 = *(double *)(a1 + 48);
    if (v22 / v21 < v26 / v24)
      v25 = v26 / v24;
  }
  else
  {
    RESupergreenSuggestedImageDonationWidth();
    v25 = v22 / (v27 * 0.5);
    v22 = *(double *)(a1 + 40);
    v26 = *(double *)(a1 + 48);
  }
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", (v22 - v21 * v25) * 0.5, (v26 - v24 * v25) * 0.5);

}

- (void)_loadAppContentPropertiesWithCompletion:(id)a3
{
  id v4;
  UIImage *v5;
  UIImage *bodyImage;
  INIntent *v7;
  NSString *title;
  void *v9;
  NSString *v10;
  NSString *subtitle;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  void *v25;
  NSString *v26;
  NSString *v27;
  NSString *v28;
  BOOL v29;
  void *v30;
  uint64_t Type;
  _BOOL4 v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void (**v37)(_QWORD, _QWORD, _QWORD);
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  UIImage *v44;
  UIImage *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  UIImage *v52;
  _QWORD v53[5];
  id v54;
  BOOL v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  Class (*v61)(uint64_t);
  void *v62;
  uint64_t *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_bodyImage)
  {
    -[REUIDonatedElementProperties _scaleImageForDisplay:](self, "_scaleImageForDisplay:");
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    bodyImage = self->_bodyImage;
    self->_bodyImage = v5;

  }
  if (-[REUIDonatedElementProperties _isMusicDonation](self, "_isMusicDonation")
    || -[REUIDonatedElementProperties _isPodcastsDonation](self, "_isPodcastsDonation"))
  {
    v7 = self->_intent;
    title = self->_title;
    self->_title = 0;

    -[INIntent mediaContainer](v7, "mediaContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "title");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    subtitle = self->_subtitle;
    self->_subtitle = v10;

    -[INIntent mediaItems](v7, "mediaItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (!v13)
      goto LABEL_9;
    -[INIntent mediaItems](v7, "mediaItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "title");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v17 = self->_title;
    self->_title = v16;
  }
  else
  {
    v18 = self->_title;
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByTrimmingCharactersInSet:](v18, "stringByTrimmingCharactersInSet:", v19);
    v7 = (INIntent *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntent componentsSeparatedByCharactersInSet:](v7, "componentsSeparatedByCharactersInSet:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR(" "));
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    v23 = self->_title;
    self->_title = v22;

    v24 = self->_subtitle;
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByTrimmingCharactersInSet:](v24, "stringByTrimmingCharactersInSet:", v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsSeparatedByCharactersInSet:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR(" "));
    v26 = (NSString *)objc_claimAutoreleasedReturnValue();
    v27 = self->_subtitle;
    self->_subtitle = v26;

  }
LABEL_9:

  if (!-[NSString length](self->_title, "length"))
  {
    objc_storeStrong((id *)&self->_title, self->_subtitle);
    v28 = self->_subtitle;
    self->_subtitle = 0;

  }
  v29 = -[REUIDonatedElementProperties isMediaDonation](self, "isMediaDonation")
     || -[REUIDonatedElementProperties isRunWorkflowDonation](self, "isRunWorkflowDonation")
     || -[REUIDonatedElementProperties isWorkoutDonation](self, "isWorkoutDonation");
  -[REUIDonatedElementProperties bundleIdentifier](self, "bundleIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  Type = REApplicationGetType();

  if (Type != 1
    || !self->_bodyImage
    && (!-[NSString length](self->_title, "length") || !-[NSString length](self->_subtitle, "length")))
  {
    v29 = 1;
  }
  self->_displayAppName = v29;
  if (-[REUIDonatedElementProperties supportsLocalIntentExecution](self, "supportsLocalIntentExecution"))
  {
    v32 = 1;
  }
  else
  {
    -[REUIDonatedElementProperties userActivity](self, "userActivity");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v33 != 0;

  }
  v34 = MEMORY[0x24BDAC760];
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __72__REUIDonatedElementProperties__loadAppContentPropertiesWithCompletion___block_invoke;
  v53[3] = &unk_24CF79F20;
  v53[4] = self;
  v55 = v32;
  v35 = v4;
  v54 = v35;
  v36 = MEMORY[0x2199AF51C](v53);
  v37 = (void (**)(_QWORD, _QWORD, _QWORD))v36;
  if (v32)
  {
    -[REUIDonatedElementProperties localBundleIdentifier](self, "localBundleIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!RelevanceEngineLibraryCore_frameworkLibrary_0)
    {
      v60 = xmmword_24CF79F68;
      v61 = 0;
      RelevanceEngineLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    }
    if (RelevanceEngineLibraryCore_frameworkLibrary_0)
    {
      v56 = 0;
      v57 = &v56;
      v58 = 0x2050000000;
      v39 = (void *)getREAppNameCacheClass_softClass;
      v59 = getREAppNameCacheClass_softClass;
      if (!getREAppNameCacheClass_softClass)
      {
        *(_QWORD *)&v60 = v34;
        *((_QWORD *)&v60 + 1) = 3221225472;
        v61 = __getREAppNameCacheClass_block_invoke;
        v62 = &unk_24CF79D88;
        v63 = &v56;
        __getREAppNameCacheClass_block_invoke((uint64_t)&v60);
        v39 = (void *)v57[3];
      }
      v40 = objc_retainAutorelease(v39);
      _Block_object_dispose(&v56, 8);
      v41 = v40;
    }
    else
    {
      v41 = 0;
    }
    objc_msgSend(v41, "sharedInstance");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "localizedNameForApplicationWithIdentifier:", v38);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[REUIDonatedElementProperties isWorkoutDonation](self, "isWorkoutDonation") && (v44 = self->_bodyImage) != 0)
    {
      self->_bodyImage = 0;
      v45 = v44;

      ((void (**)(_QWORD, void *, UIImage *))v37)[2](v37, v43, v45);
    }
    else
    {
      if (!RelevanceEngineLibraryCore_frameworkLibrary_0)
      {
        v60 = xmmword_24CF79F68;
        v61 = 0;
        RelevanceEngineLibraryCore_frameworkLibrary_0 = _sl_dlopen();
      }
      if (RelevanceEngineLibraryCore_frameworkLibrary_0)
      {
        v56 = 0;
        v57 = &v56;
        v58 = 0x2050000000;
        v46 = (void *)getREAppIconCacheClass_softClass;
        v59 = getREAppIconCacheClass_softClass;
        if (!getREAppIconCacheClass_softClass)
        {
          *(_QWORD *)&v60 = v34;
          *((_QWORD *)&v60 + 1) = 3221225472;
          v61 = __getREAppIconCacheClass_block_invoke;
          v62 = &unk_24CF79D88;
          v63 = &v56;
          __getREAppIconCacheClass_block_invoke((uint64_t)&v60);
          v46 = (void *)v57[3];
        }
        v47 = objc_retainAutorelease(v46);
        _Block_object_dispose(&v56, 8);
        v48 = v47;
      }
      else
      {
        v48 = 0;
      }
      objc_msgSend(v48, "sharedInstance");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v34;
      v50[1] = 3221225472;
      v50[2] = __72__REUIDonatedElementProperties__loadAppContentPropertiesWithCompletion___block_invoke_5;
      v50[3] = &unk_24CF79F48;
      v52 = v37;
      v51 = v43;
      objc_msgSend(v49, "iconForApplicationWithIdentifier:completion:", v38, v50);

      v45 = v52;
    }

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v36 + 16))(v36, 0, 0);
  }

}

void __72__REUIDonatedElementProperties__loadAppContentPropertiesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  double v26;
  double v27;
  double v28;
  _QWORD v29[4];
  id v30;
  double v31;
  double v32;

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), a2);
  objc_msgSend(MEMORY[0x24BDF6AA0], "defaultFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOpaque:", 0);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), a3);
  v9 = RESuggestedHeaderImageSizeForStyle(0);
  v11 = v10;
  if (*(_BYTE *)(a1 + 48) && !objc_msgSend(*(id *)(a1 + 32), "isWorkoutDonation"))
  {
    v16 = objc_alloc(MEMORY[0x24BE51A90]);
    objc_msgSend(*(id *)(a1 + 32), "localBundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithBundleIdentifier:", v17);

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scale");
    v21 = v20;

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51AB0]), "initWithSize:scale:", v9, v11, v21);
    objc_msgSend(v22, "setShape:", 2);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __72__REUIDonatedElementProperties__loadAppContentPropertiesWithCompletion___block_invoke_3;
    v23[3] = &unk_24CF79EF8;
    v23[4] = *(_QWORD *)(a1 + 32);
    v26 = v21;
    v27 = v9;
    v28 = v11;
    v24 = v8;
    v25 = *(id *)(a1 + 40);
    objc_msgSend(v18, "getCGImageForImageDescriptor:completion:", v22, v23);

  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:format:", v8, v9, v11);
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __72__REUIDonatedElementProperties__loadAppContentPropertiesWithCompletion___block_invoke_2;
    v29[3] = &unk_24CF79ED0;
    v30 = v7;
    v31 = v9;
    v32 = v11;
    objc_msgSend(v12, "imageWithActions:", v29);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 72);
    *(_QWORD *)(v14 + 72) = v13;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __72__REUIDonatedElementProperties__loadAppContentPropertiesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  CGContextSetInterpolationQuality((CGContextRef)objc_msgSend(a2, "CGContext"), kCGInterpolationHigh);
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __72__REUIDonatedElementProperties__loadAppContentPropertiesWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  __int128 v11;

  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", a2, 0, *(double *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:format:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__REUIDonatedElementProperties__loadAppContentPropertiesWithCompletion___block_invoke_4;
  v9[3] = &unk_24CF79ED0;
  v10 = v3;
  v11 = *(_OWORD *)(a1 + 64);
  v8 = v3;
  objc_msgSend(v4, "imageWithActions:", v9);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __72__REUIDonatedElementProperties__loadAppContentPropertiesWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  CGContextSetInterpolationQuality((CGContextRef)objc_msgSend(a2, "CGContext"), kCGInterpolationHigh);
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __72__REUIDonatedElementProperties__loadAppContentPropertiesWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "image");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)remoteBundleIdentifier
{
  return self->_remoteBundleIdentifier;
}

- (NSString)localBundleIdentifier
{
  return self->_localBundleIdentifier;
}

- (unint64_t)donationType
{
  return self->_donationType;
}

- (BOOL)isLocalDonation
{
  return self->_localDonation;
}

- (unint64_t)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)appName
{
  return self->_appName;
}

- (UIImage)appIcon
{
  return self->_appIcon;
}

- (UIImage)fullsizeAppIcon
{
  return self->_fullsizeAppIcon;
}

- (BOOL)displayAppName
{
  return self->_displayAppName;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImage)monochromeBodyImage
{
  return self->_monochromeBodyImage;
}

- (INInteraction)interaction
{
  return self->_interaction;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (INIntent)intent
{
  return self->_intent;
}

- (INRelevantShortcut)relevantShortcut
{
  return self->_relevantShortcut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevantShortcut, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_monochromeBodyImage, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_fullsizeAppIcon, 0);
  objc_storeStrong((id *)&self->_appIcon, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_localBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bodyImage, 0);
}

- (void)_loadContentForRelevantShortcut:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_213276000, log, OS_LOG_TYPE_ERROR, "Error: Attempted to load content for REUIDonatedElementProperties with neither an intent or user activity.", v1, 2u);
}

@end
