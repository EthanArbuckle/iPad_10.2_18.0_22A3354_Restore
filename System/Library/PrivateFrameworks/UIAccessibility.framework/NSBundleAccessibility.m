@implementation NSBundleAccessibility

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5
{
  id v9;
  id v10;
  __CFString *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  NSBundleAccessibility *v16;
  objc_method *InstanceMethod;
  IMP Implementation;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  const __CFString *v29;
  NSBundleAccessibility *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  objc_super v35;
  objc_super v36;

  v9 = a3;
  v10 = a4;
  v11 = (__CFString *)a5;
  v36.receiver = self;
  v36.super_class = (Class)NSBundleAccessibility;
  -[NSBundleAccessibility localizedStringForKey:value:table:](&v36, sel_localizedStringForKey_value_table_, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((localizedStringForKey_value_table__RecursiveCall & 1) == 0)
  {
    v13 = _AXSAutomationLocalizedStringLookupInfoEnabled();
    _AXSAutomationPreferredLocalization();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (!v13 && !v14)
    {
LABEL_24:

      goto LABEL_25;
    }
    v34 = (void *)v14;
    if (v14)
    {
      v16 = self;
      InstanceMethod = class_getInstanceMethod((Class)+[NSBundleAccessibility superclass](NSBundleAccessibility, "superclass"), a2);
      Implementation = method_getImplementation(InstanceMethod);
      ((void (*)(NSBundleAccessibility *, SEL, id, id, __CFString *))Implementation)(v16, a2, v9, v10, v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0CF40C0], "axAttributedStringWithString:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "setAttribute:forKey:", v12, CFSTR("UIAccessibilityTokenLocalizedStringTranslation"));
      }
      else
      {
        v31 = v34;
        v32 = v12;
        v29 = CFSTR("%@: Failed to lookup alternate localization '%@' of localized string '%@'.");
        v30 = v16;
        LOBYTE(v28) = 1;
        _AXLogWithFacility();

        v20 = 0;
      }

      v15 = v34;
      if (v13)
        goto LABEL_11;
    }
    else
    {
      v20 = 0;
      if (v13)
      {
LABEL_11:
        v21 = 1;
        localizedStringForKey_value_table__RecursiveCall = 1;
        if (!v11)
        {
          v35.receiver = self;
          v35.super_class = (Class)NSBundleAccessibility;
          v11 = CFSTR("Localizable");
          -[NSBundleAccessibility localizedStringForKey:value:table:](&v35, sel_localizedStringForKey_value_table_, v9, 0, CFSTR("Localizable"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v22 != 0;

        }
        v33 = v21;
        AXNSLocalizedStringForLocale();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        localizedStringForKey_value_table__RecursiveCall = 0;
        if (!v20)
        {
          objc_msgSend(MEMORY[0x1E0CF40C0], "axAttributedStringWithString:", v12);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NSBundleAccessibility bundleIdentifier](self, "bundleIdentifier", v28, v29, v30, v31, v32);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSBundleAccessibility bundlePath](self, "bundlePath");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setAttribute:forKey:", v24, CFSTR("UIAccessibilityTokenLocalizedStringBundleID"));
        objc_msgSend(v20, "setAttribute:forKey:", v25, CFSTR("UIAccessibilityTokenLocalizationBundlePath"));
        objc_msgSend(v20, "setAttribute:forKey:", v9, CFSTR("UIAccessibilityTokenLocalizedStringKey"));
        if (v33)
          objc_msgSend(v20, "setAttribute:forKey:", v11, CFSTR("UIAccessibilityTokenLocalizedStringTableName"));
        if (v23)
          objc_msgSend(v20, "setAttribute:forKey:", v23, CFSTR("UIAccessibilityTokenLocalizedStringEnglishVersion"));

        v15 = v34;
      }
    }
    if (v20)
    {
      v26 = (void *)objc_msgSend(v20, "copy");
      v15 = v34;
      objc_msgSend(v12, "performSelector:withObject:", sel__setAccessibilityAttributedLocalizedString_, v26);

    }
    else
    {
      _AXLogWithFacility();
    }

    goto LABEL_24;
  }
LABEL_25:

  return v12;
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSBundle");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)loadAndReturnError:(id *)a3
{
  BOOL v4;
  void *v5;
  char v6;
  _QWORD block[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSBundleAccessibility;
  v4 = -[NSBundleAccessibility loadAndReturnError:](&v9, sel_loadAndReturnError_, a3);
  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "useNewAXBundleLoader");

  if ((v6 & 1) == 0)
  {
    if (loadAndReturnError__registerOnce != -1)
      dispatch_once(&loadAndReturnError__registerOnce, &__block_literal_global_12);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__NSBundleAccessibility_loadAndReturnError___block_invoke_2;
    block[3] = &unk_1E3DFE9F8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)loadAndReturnError__DifferentQueue, block);
  }
  return v4;
}

void __44__NSBundleAccessibility_loadAndReturnError___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("ax-load-bundle-queue", 0);
  v1 = (void *)loadAndReturnError__DifferentQueue;
  loadAndReturnError__DifferentQueue = (uint64_t)v0;

}

uint64_t __44__NSBundleAccessibility_loadAndReturnError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadAXBundleForBundleOffMainThread");
}

@end
