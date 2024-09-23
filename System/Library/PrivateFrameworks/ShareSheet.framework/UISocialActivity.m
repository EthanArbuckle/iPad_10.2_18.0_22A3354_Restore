@implementation UISocialActivity

- (UISocialActivity)initWithApplicationExtension:(id)a3
{
  id v4;
  UISocialActivity *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  UISocialActivity *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UISocialActivity;
  v5 = -[UIApplicationExtensionActivity initWithApplicationExtension:](&v13, sel_initWithApplicationExtension_, v4);
  if (v5)
  {
    v6 = _UISocialActivityGetActivityTypeForApplicationExtension_once;
    v7 = v4;
    if (v6 != -1)
      dispatch_once(&_UISocialActivityGetActivityTypeForApplicationExtension_once, &__block_literal_global_114);
    v8 = (void *)_UISocialActivityGetActivityTypeForApplicationExtension___activityTypesByApplicationExtensionIdentifiers;
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[UISocialActivity setBuiltinActivityType:](v5, "setBuiltinActivityType:", v10);
    v11 = v5;

  }
  return v5;
}

- (UISocialActivity)initWithActivityType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  UISocialActivity *v9;
  UISocialActivity *v10;
  UISocialActivity *v11;
  id v13;

  v4 = a3;
  -[objc_class extensionIdentifierForActivityType:](getSLComposeViewControllerClass(), "extensionIdentifierForActivityType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (v7)
  {
    share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[UISocialActivity initWithActivityType:].cold.1((uint64_t)v4, (uint64_t)v7, v8);

  }
  v9 = -[UISocialActivity initWithApplicationExtension:](self, "initWithApplicationExtension:", v6);
  v10 = v9;
  if (v9)
    v11 = v9;

  return v10;
}

- (void)setInitialText:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_initialText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_initialText, a3);
    -[UISocialActivity socialComposeViewController](self, "socialComposeViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInitialText:", v6);

  }
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  objc_super v10;

  -[UISocialActivity builtinActivityType](self, "builtinActivityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v9.receiver = self;
    v9.super_class = (Class)UISocialActivity;
    -[UIActivity description](&v9, sel_description);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISocialActivity activityType](self, "activityType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ {type = %@}"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UISocialActivity;
    -[UIApplicationExtensionActivity debugDescription](&v10, sel_debugDescription);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (int64_t)activityCategory
{
  return 1;
}

- (id)activityType
{
  void *v3;
  void *v4;

  -[UISocialActivity builtinActivityType](self, "builtinActivityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)_canBeExcludeWhenMatchingWithContext:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  -[UISocialActivity builtinActivityType](self, "builtinActivityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UISocialActivity;
    v6 = -[UIApplicationExtensionActivity _canBeExcludeWhenMatchingWithContext:](&v8, sel__canBeExcludeWhenMatchingWithContext_, v4);
  }

  return v6;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v15;
  int v16;
  void *v17;
  int v18;
  id v19;
  dispatch_semaphore_t v20;
  NSObject *v21;
  objc_super v22;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v4 = a3;
  -[UISocialActivity sourceApplicationBundleID](self, "sourceApplicationBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  if (_UIComposeViewControllerIsAvailable_once != -1)
    dispatch_once(&_UIComposeViewControllerIsAvailable_once, &__block_literal_global_108);
  objc_msgSend(v9, "_plugIn");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "supersededBy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    goto LABEL_7;
  objc_msgSend(v9, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)_UIComposeViewControllerIsAvailable_legacySocialActivityTypes, "containsObject:", v15))
  {
    v16 = -[objc_class isAvailableForExtension:inHostApplicationBundleID:](getSLComposeViewControllerClass(), "isAvailableForExtension:inHostApplicationBundleID:", v9, v10);
  }
  else
  {
    objc_msgSend((id)_UIComposeViewControllerIsAvailable_mediaShareExtension, "extensionIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "isEqualToString:", v17);

    if (!v18)
    {

LABEL_7:
      goto LABEL_8;
    }
    v19 = (id)_UIComposeViewControllerIsAvailable_mediaShareExtension;
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v20 = dispatch_semaphore_create(0);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = ___UIMediaShareExtensionIsAvailable_block_invoke;
    v23[3] = &unk_1E4003D70;
    v25 = &v26;
    v21 = v20;
    v24 = v21;
    objc_msgSend(v19, "getVisibilityWithCompletionBlock:", v23);
    dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
    v16 = *((_BYTE *)v27 + 24) != 0;

    _Block_object_dispose(&v26, 8);
  }

  if (!v16)
  {
    v13 = 0;
    goto LABEL_9;
  }
LABEL_8:
  v22.receiver = self;
  v22.super_class = (Class)UISocialActivity;
  v13 = -[UIApplicationExtensionActivity canPerformWithActivityItems:](&v22, sel_canPerformWithActivityItems_, v4);
LABEL_9:

  return v13;
}

- (void)prepareWithActivityExtensionItemData:(id)a3
{
  id v4;
  Class SLComposeViewControllerClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SLComposeViewControllerClass = getSLComposeViewControllerClass();
  -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class composeViewControllerForExtension:](SLComposeViewControllerClass, "composeViewControllerForExtension:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UISocialActivity initialText](self, "initialText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UISocialActivity initialText](self, "initialText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInitialText:", v9);

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__UISocialActivity_prepareWithActivityExtensionItemData___block_invoke;
  v13[3] = &unk_1E4003D28;
  v13[4] = self;
  objc_msgSend(v7, "setCompletionHandler:", v13);
  -[UIApplicationExtensionActivity _injectedExtensionItem](self, "_injectedExtensionItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIApplicationExtensionActivity _injectedExtensionItem](self, "_injectedExtensionItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISocialActivity _prepareComposeViewController:withInjectedExtensionItems:](self, "_prepareComposeViewController:withInjectedExtensionItems:", v7, v12);

  }
  else
  {
    objc_msgSend(v4, "extensionItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISocialActivity _prepareComposeViewController:withActivityExtensionItems:](self, "_prepareComposeViewController:withActivityExtensionItems:", v7, v11);
  }

  -[UISocialActivity setSocialComposeViewController:](self, "setSocialComposeViewController:", v7);
}

uint64_t __57__UISocialActivity_prepareWithActivityExtensionItemData___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", a2 != 0);
}

- (void)_willBePerformedOrPresented
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;

  -[UISocialActivity socialComposeViewController](self, "socialComposeViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_instantiateAndBeginExtensionIfNeeded");

  -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "infoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSExtension"));
  v22 = (id)objc_claimAutoreleasedReturnValue();

  -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIActivityBundleHelper activityBundleHelperForExtension:](_UIActivityBundleHelper, "activityBundleHelperForExtension:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bundleProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sdkVersion");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("1.0");
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("NSExtensionShareWantsFullScreenPresentation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "BOOLValue") & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("NSExtensionAttributes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("NSExtensionShareWantsFullScreenPresentation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "BOOLValue"))
  {

LABEL_6:
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isVersion:greaterThanOrEqualToVersion:", v12, CFSTR("13.0"));

  if ((v21 & 1) != 0)
  {
    v16 = 0;
    v17 = -2;
    goto LABEL_8;
  }
LABEL_7:
  v16 = 1;
  v17 = 5;
LABEL_8:
  -[UISocialActivity socialComposeViewController](self, "socialComposeViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setModalPresentationStyle:", v17);

  -[UISocialActivity socialComposeViewController](self, "socialComposeViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setShouldForceNonAnimatedTransition:", v16);

}

- (void)_prepareComposeViewController:(id)a3 withInjectedExtensionItems:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v11, "attachments", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v18;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v18 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend(v5, "addItemProvider:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v14);
        }

        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

}

- (void)_prepareComposeViewController:(id)a3 withActivityExtensionItems:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addExtensionItem:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  return 0;
}

- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  return 0;
}

- (BOOL)_managesOwnPresentation
{
  return 0;
}

- (CGSize)_thumbnailSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 70.0;
  v3 = 70.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_cleanup
{
  objc_super v3;

  -[UISocialActivity setSocialComposeViewController:](self, "setSocialComposeViewController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UISocialActivity;
  -[UIApplicationExtensionActivity _cleanup](&v3, sel__cleanup);
}

- (BOOL)_wantsThumbnailItemData
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[UISocialActivity activityType](self, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.UIKit.activity.PostToFacebook")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[UISocialActivity activityType](self, "activityType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.UIKit.activity.PostToTwitter")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[UISocialActivity activityType](self, "activityType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.UIKit.activity.PostToWeibo"));

    }
  }

  return v4;
}

- (BOOL)_wantsAttachmentURLItemData
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[UISocialActivity activityType](self, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.UIKit.activity.PostToFacebook")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[UISocialActivity activityType](self, "activityType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.UIKit.activity.PostToTwitter")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[UISocialActivity activityType](self, "activityType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.UIKit.activity.PostToWeibo"));

    }
  }

  return v4;
}

- (BOOL)_wantsInitialSocialText
{
  return 1;
}

+ (id)_activityExtensionItemsForActivityItemValues:(id)a3 extensionItemDataRequest:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25 = a4;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (!v6)
  {
    v8 = 0;
    goto LABEL_17;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v31 != v9)
        objc_enumerationMutation(v5);
      v11 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          continue;
      }
      if (v8)
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
        objc_msgSend(v8, "appendAttributedString:", v13);

        if ((isKindOfClass & 1) != 0)
          goto LABEL_10;
      }
      else
      {
        v8 = objc_alloc_init(MEMORY[0x1E0CB3778]);
        if ((isKindOfClass & 1) != 0)
        {
LABEL_10:
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v11);
          objc_msgSend(v8, "appendAttributedString:", v14);

          continue;
        }
      }
      objc_msgSend(v8, "appendAttributedString:", v11);
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  }
  while (v7);
LABEL_17:
  _NSExtensionItemsFromActivityItemValuesForExtensionItemDataRequest(v5, v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v8)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      while (2)
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          if ((objc_msgSend(v5, "containsObject:", v22) & 1) == 0)
          {
            objc_msgSend(v22, "setAttributedContentText:", v8);
            v16 = v17;
            goto LABEL_28;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v19)
          continue;
        break;
      }
    }

    v23 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
    objc_msgSend(v23, "setAttributedContentText:", v8);
    objc_msgSend(v17, "arrayByAddingObject:", v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v23;
LABEL_28:

  }
  return v16;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (void)setIsContentManaged:(BOOL)a3
{
  self->_isContentManaged = a3;
}

- (NSString)sourceApplicationBundleID
{
  return self->_sourceApplicationBundleID;
}

- (void)setSourceApplicationBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)builtinActivityType
{
  return self->_builtinActivityType;
}

- (void)setBuiltinActivityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (SLComposeViewController)socialComposeViewController
{
  return self->_socialComposeViewController;
}

- (void)setSocialComposeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_socialComposeViewController, a3);
}

- (NSString)initialText
{
  return self->_initialText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialText, 0);
  objc_storeStrong((id *)&self->_socialComposeViewController, 0);
  objc_storeStrong((id *)&self->_builtinActivityType, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleID, 0);
}

- (void)initWithActivityType:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_19E419000, log, OS_LOG_TYPE_ERROR, "Cannot find application extension for activity type \"%{public}@\": %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
