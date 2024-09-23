@implementation _UIApplicationInfo

- (int64_t)_launchingInterfaceOrientation
{
  return self->_launchingInterfaceOrientation;
}

- (BOOL)statusBarHiddenWhenVerticallyCompact
{
  return self->_statusBarHiddenWhenVerticallyCompact;
}

- (BOOL)statusBarForcedHiddenForInterfaceOrientation:(int64_t)a3 onDisplay:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v6 = a4;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1
    && !-[_UIApplicationInfo supportsDeviceFamily:](self, "supportsDeviceFamily:", 2))
  {
    v8 = 0;
  }
  v11 = -[_UIApplicationInfo statusBarForcedHiddenForInterfaceOrientation:onDisplay:withUserInterfaceIdiom:](self, "statusBarForcedHiddenForInterfaceOrientation:onDisplay:withUserInterfaceIdiom:", a3, v6, v8);

  return v11;
}

- (BOOL)statusBarHiddenForInterfaceOrientation:(int64_t)a3 onDisplay:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v6 = a4;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1
    && !-[_UIApplicationInfo supportsDeviceFamily:](self, "supportsDeviceFamily:", 2))
  {
    v8 = 0;
  }
  v11 = -[_UIApplicationInfo statusBarHiddenForInterfaceOrientation:onDisplay:withUserInterfaceIdiom:](self, "statusBarHiddenForInterfaceOrientation:onDisplay:withUserInterfaceIdiom:", a3, v6, v8);

  return v11;
}

- (BOOL)statusBarHiddenForInterfaceOrientation:(int64_t)a3 onDisplay:(id)a4 withUserInterfaceIdiom:(int64_t)a5
{
  id v8;
  BOOL v9;

  v8 = a4;
  if (objc_msgSend(v8, "isMainDisplay"))
    v9 = -[_UIApplicationInfo statusBarHidden](self, "statusBarHidden")
      || -[_UIApplicationInfo statusBarForcedHiddenForInterfaceOrientation:onDisplay:withUserInterfaceIdiom:](self, "statusBarForcedHiddenForInterfaceOrientation:onDisplay:withUserInterfaceIdiom:", a3, v8, a5);
  else
    v9 = 0;

  return v9;
}

- (BOOL)statusBarForcedHiddenForInterfaceOrientation:(int64_t)a3 onDisplay:(id)a4 withUserInterfaceIdiom:(int64_t)a5
{
  id v8;
  double v9;
  double v10;
  BOOL v11;
  double v13;
  double v14;

  v8 = a4;
  if (objc_msgSend(v8, "isMainDisplay")
    && -[_UIApplicationInfo statusBarHiddenWhenVerticallyCompact](self, "statusBarHiddenWhenVerticallyCompact")
    && (objc_msgSend(v8, "bounds"), !a5))
  {
    if ((unint64_t)(a3 - 3) >= 2)
      v13 = v10;
    else
      v13 = v9;
    _UIScreenReferenceBoundsSizeForType(1uLL);
    v11 = v14 > v13;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)statusBarHidden
{
  return self->_statusBarHidden;
}

- (int64_t)supportedUserInterfaceStyle
{
  return self->_supportedUserInterfaceStyle;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)_loadFromProxy:(id)a3
{
  id v4;
  void *v5;
  _UIApplicationInfoParser *v6;
  _UIApplicationInfoParser *plistParser;
  NSString *v8;
  NSString *launchImageFile;
  NSString *v10;
  NSString *keyColorAssetName;
  int64_t v12;
  unint64_t v13;
  objc_super v14;
  objc_super v15;
  objc_super v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x186DC9484]();
  v16.receiver = self;
  v16.super_class = (Class)_UIApplicationInfo;
  -[_UIApplicationInfo _loadFromProxy:](&v16, sel__loadFromProxy_, v4);
  v6 = -[_UIApplicationInfoParser initWithApplicationProxy:]([_UIApplicationInfoParser alloc], "initWithApplicationProxy:", v4);
  plistParser = self->_plistParser;
  self->_plistParser = v6;

  -[_UIApplicationInfoParser launchImageFile](self->_plistParser, "launchImageFile");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  launchImageFile = self->_launchImageFile;
  self->_launchImageFile = v8;

  -[_UIApplicationInfoParser keyColorAssetName](self->_plistParser, "keyColorAssetName");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  keyColorAssetName = self->_keyColorAssetName;
  self->_keyColorAssetName = v10;

  self->_canChangeBackgroundStyle = -[_UIApplicationInfoParser canChangeBackgroundStyle](self->_plistParser, "canChangeBackgroundStyle");
  self->_backgroundStyle = -[_UIApplicationInfoParser backgroundStyle](self->_plistParser, "backgroundStyle");
  self->_statusBarHidden = -[_UIApplicationInfoParser statusBarHidden](self->_plistParser, "statusBarHidden");
  self->_requestedStatusBarStyle = -[_UIApplicationInfoParser requestedStatusBarStyle](self->_plistParser, "requestedStatusBarStyle");
  self->_statusBarHiddenWhenVerticallyCompact = -[_UIApplicationInfoParser statusBarHiddenWhenVerticallyCompact](self->_plistParser, "statusBarHiddenWhenVerticallyCompact");
  self->_ignoredOverrides = -[_UIApplicationInfoParser ignoredOverrides](self->_plistParser, "ignoredOverrides");
  self->_viewControllerBasedStatusBarAppearance = -[_UIApplicationInfoParser viewControllerBasedStatusBarAppearance](self->_plistParser, "viewControllerBasedStatusBarAppearance");
  self->_systemWindowsSecure = -[_UIApplicationInfoParser systemWindowsSecure](self->_plistParser, "systemWindowsSecure");
  self->_optOutOfRTL = -[_UIApplicationInfoParser optOutOfRTL](self->_plistParser, "optOutOfRTL");
  v12 = -[_UIApplicationInfoParser interfaceOrientation](self->_plistParser, "interfaceOrientation");
  v15.receiver = self;
  v15.super_class = (Class)_UIApplicationInfo;
  -[_UIApplicationInfo setInterfaceOrientation:](&v15, sel_setInterfaceOrientation_, v12);
  v13 = -[_UIApplicationInfoParser supportedInterfaceOrientations](self->_plistParser, "supportedInterfaceOrientations");
  v14.receiver = self;
  v14.super_class = (Class)_UIApplicationInfo;
  -[_UIApplicationInfo setSupportedInterfaceOrientations:](&v14, sel_setSupportedInterfaceOrientations_, v13);
  self->_launchingInterfaceOrientation = -[_UIApplicationInfoParser launchingInterfaceOrientationForSpringBoard](self->_plistParser, "launchingInterfaceOrientationForSpringBoard");
  self->_supportedUserInterfaceStyle = -[_UIApplicationInfoParser supportedUserInterfaceStyle](self->_plistParser, "supportedUserInterfaceStyle");
  objc_autoreleasePoolPop(v5);

}

+ (id)_localizedFolderNameForName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (qword_1ECD7A5B8 != -1)
    dispatch_once(&qword_1ECD7A5B8, &__block_literal_global_192);
  objc_msgSend((id)_MergedGlobals_3_10, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedDescription");
  }
  else
  {
    _UIKitBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", v3, v3, 0);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)folderNames
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33___UIApplicationInfo_folderNames__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  -[_UIApplicationInfo _synchronize:](self, "_synchronize:", v4);
  return self->_lazy_folderNames;
}

- (NSString)fallbackFolderName
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40___UIApplicationInfo_fallbackFolderName__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  -[_UIApplicationInfo _synchronize:](self, "_synchronize:", v4);
  return self->_lazy_fallbackFolderName;
}

+ (id)_genreNameForID:(int64_t)a3
{
  id result;

  result = 0;
  switch(a3)
  {
    case 6000:
      result = CFSTR("Business");
      break;
    case 6001:
      result = CFSTR("Weather");
      break;
    case 6002:
      result = CFSTR("Utilities");
      break;
    case 6003:
      result = CFSTR("Travel");
      break;
    case 6004:
      result = CFSTR("Sports");
      break;
    case 6005:
      result = CFSTR("Social Networking");
      break;
    case 6006:
      result = CFSTR("Reference");
      break;
    case 6007:
      result = CFSTR("Productivity");
      break;
    case 6008:
      result = CFSTR("Photo & Video");
      break;
    case 6009:
      result = CFSTR("News");
      break;
    case 6010:
      result = CFSTR("Navigation");
      break;
    case 6011:
      result = CFSTR("Music");
      break;
    case 6012:
      result = CFSTR("Lifestyle");
      break;
    case 6013:
      result = CFSTR("Healthcare & Fitness");
      break;
    case 6014:
      result = CFSTR("Games");
      break;
    case 6015:
      result = CFSTR("Finance");
      break;
    case 6016:
      result = CFSTR("Entertainment");
      break;
    case 6017:
      result = CFSTR("Education");
      break;
    case 6018:
      result = CFSTR("Books");
      break;
    case 6019:
      return result;
    case 6020:
      result = CFSTR("Medical");
      break;
    default:
      switch(a3)
      {
        case 7001:
          result = CFSTR("Action Games");
          break;
        case 7002:
          result = CFSTR("Adventure Games");
          break;
        case 7003:
          result = CFSTR("Arcade Games");
          break;
        case 7004:
          result = CFSTR("Board Games");
          break;
        case 7005:
          result = CFSTR("Card Games");
          break;
        case 7006:
          result = CFSTR("Casino Games");
          break;
        case 7007:
          result = CFSTR("Dice Games");
          break;
        case 7008:
          result = CFSTR("Educational Games");
          break;
        case 7009:
          result = CFSTR("Family Games");
          break;
        case 7010:
          result = CFSTR("Kids Games");
          break;
        case 7011:
          result = CFSTR("Music Games");
          break;
        case 7012:
          result = CFSTR("Puzzle Games");
          break;
        case 7013:
          result = CFSTR("Racing Games");
          break;
        case 7014:
          result = CFSTR("Role Playing Games");
          break;
        case 7015:
          result = CFSTR("Simulation Games");
          break;
        case 7016:
          result = CFSTR("Sports Games");
          break;
        case 7017:
          result = CFSTR("Strategy Games");
          break;
        case 7018:
          result = CFSTR("Trivia Games");
          break;
        case 7019:
          result = CFSTR("Word Games");
          break;
        default:
          return result;
      }
      break;
  }
  return result;
}

- (void)_lock_loadFolderNamesIfNecessary
{
  _UIApplicationInfo *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void (**v17)(void *, void *, void *);
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSArray *lazy_folderNames;
  uint64_t v33;
  NSString *lazy_fallbackFolderName;
  void *v35;
  void *v36;
  _UIApplicationInfo *v37;
  _UIApplicationInfo *v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD aBlock[4];
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (!self->_lazy_folderNames)
  {
    v2 = self;
    v3 = (void *)MEMORY[0x186DC9484]();
    v4 = (void *)MEMORY[0x1E0CA5860];
    -[FBSBundleInfo bundleIdentifier](v2, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationProxyForIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)-[_UIApplicationInfo type](v2, "type") > 1)
      {
        v35 = v3;
        v38 = v2;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __54___UIApplicationInfo__lock_loadFolderNamesIfNecessary__block_invoke_2;
        aBlock[3] = &unk_1E16C7950;
        v45 = &__block_literal_global_229;
        v17 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v36 = v6;
        objc_msgSend(v6, "subgenres");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bs_objectsOfClass:", objc_opt_class());
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v19;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v41 != v22)
                objc_enumerationMutation(obj);
              v24 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
              objc_msgSend(v24, "bs_safeNumberForKey:", CFSTR("genreId"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "bs_safeStringForKey:", CFSTR("genre"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v17[2](v17, v25, v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v27, "length"))
                objc_msgSend(v7, "addObject:", v27);

            }
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
          }
          while (v21);
        }

        v6 = v36;
        objc_msgSend(v36, "genreID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "genre");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v17[2](v17, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v30, "length"))
        {
          objc_msgSend(v7, "addObject:", v30);
          v12 = v30;
        }
        else
        {
          v12 = 0;
        }
        v3 = v35;

        v9 = v45;
        v2 = v38;
      }
      else
      {
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v8 = objc_opt_class();
        objc_msgSend(v6, "objectForInfoDictionaryKey:ofClass:valuesOfClass:", CFSTR("SBMatchingApplicationGenres"), v8, objc_opt_class());
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        if (v10)
        {
          v11 = v10;
          v37 = v2;
          v12 = 0;
          v13 = *(_QWORD *)v47;
          do
          {
            v14 = 0;
            v15 = v12;
            do
            {
              if (*(_QWORD *)v47 != v13)
                objc_enumerationMutation(v9);
              +[_UIApplicationInfo _localizedFolderNameForName:](_UIApplicationInfo, "_localizedFolderNameForName:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v14));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
                objc_msgSend(v7, "addObject:", v16);
              objc_msgSend(v7, "firstObject");
              v12 = (id)objc_claimAutoreleasedReturnValue();

              ++v14;
              v15 = v12;
            }
            while (v11 != v14);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
          }
          while (v11);
          v2 = v37;
        }
        else
        {
          v12 = 0;
        }
      }

      if (objc_msgSend(v7, "count"))
        v31 = objc_msgSend(v7, "copy");
      else
        v31 = MEMORY[0x1E0C9AA60];
      lazy_folderNames = v2->_lazy_folderNames;
      v2->_lazy_folderNames = (NSArray *)v31;

      v33 = objc_msgSend(v12, "copy");
      lazy_fallbackFolderName = v2->_lazy_fallbackFolderName;
      v2->_lazy_fallbackFolderName = (NSString *)v33;

    }
    objc_autoreleasePoolPop(v3);
  }
}

- (int64_t)requestedStatusBarStyle
{
  return self->_requestedStatusBarStyle;
}

- (BOOL)canChangeBackgroundStyle
{
  return self->_canChangeBackgroundStyle;
}

- (NSString)launchImageFile
{
  return self->_launchImageFile;
}

- (NSString)keyColorAssetName
{
  return self->_keyColorAssetName;
}

- (unint64_t)ignoredOverrides
{
  return self->_ignoredOverrides;
}

- (unint64_t)viewControllerBasedStatusBarAppearance
{
  return self->_viewControllerBasedStatusBarAppearance;
}

- (BOOL)systemWindowsSecure
{
  return self->_systemWindowsSecure;
}

- (BOOL)optOutOfRTL
{
  return self->_optOutOfRTL;
}

- (int64_t)whitePointAdaptivityStyle
{
  return self->_whitePointAdaptivityStyle;
}

- (BOOL)requiresHighResolution
{
  return self->_requiresHighResolution;
}

- (BOOL)fakingRequiresHighResolution
{
  return self->_fakingRequiresHighResolution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyColorAssetName, 0);
  objc_storeStrong((id *)&self->_launchImageFile, 0);
  objc_storeStrong((id *)&self->_lazy_fallbackFolderName, 0);
  objc_storeStrong((id *)&self->_lazy_folderNames, 0);
  objc_storeStrong((id *)&self->_plistParser, 0);
}

@end
