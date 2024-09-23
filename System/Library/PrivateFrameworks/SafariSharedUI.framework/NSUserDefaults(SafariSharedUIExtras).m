@implementation NSUserDefaults(SafariSharedUIExtras)

+ (id)safari_keyForWebKitFeature:()SafariSharedUIExtras
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = CFSTR("WebKitInternal");
  if (objc_msgSend(v3, "status") != 1 && objc_msgSend(v3, "status") != 2)
    v4 = CFSTR("WebKitExperimental");
  objc_msgSend(v3, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)safari_shouldObserveWebKitFeature:()SafariSharedUIExtras
{
  id v3;
  _BOOL8 v4;

  v3 = a3;
  if (objc_msgSend(v3, "status"))
    v4 = objc_msgSend(v3, "status") != 7;
  else
    v4 = 0;

  return v4;
}

+ (id)safari_keyForWebKitExperimentalFeature:()SafariSharedUIExtras
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("WebKitExperimental"), "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)safari_resetWebKitExperimentalFeaturesIfNeeded:()SafariSharedUIExtras
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__NSUserDefaults_SafariSharedUIExtras__safari_resetWebKitExperimentalFeaturesIfNeeded___block_invoke;
  block[3] = &unk_1E54460E8;
  block[4] = a1;
  v10 = v4;
  v11 = &v12;
  v5 = safari_resetWebKitExperimentalFeaturesIfNeeded__onceToken;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&safari_resetWebKitExperimentalFeaturesIfNeeded__onceToken, block);
  v7 = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

@end
