@implementation OBPrivacyFlow

- (unint64_t)contentVersion
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_splashPlist, "objectForKeyedSubscript:", CFSTR("ContentVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v3 = 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_buttonIcon, 0);
  objc_storeStrong((id *)&self->_splashPlist, 0);
  objc_storeStrong((id *)&self->_splashContentName, 0);
}

- (OBPrivacyFlow)initWithBundle:(id)a3
{
  id v5;
  OBPrivacyFlow *v6;
  OBPrivacyFlow *v7;
  id *p_bundle;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *splashContentName;
  void *v13;
  uint64_t v14;
  NSDictionary *splashPlist;
  NSDictionary *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  OBPrivacyFlow *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)OBPrivacyFlow;
  v6 = -[OBPrivacyFlow init](&v26, sel_init);
  v7 = v6;
  if (!v6)
  {
LABEL_21:
    v20 = v7;
    goto LABEL_22;
  }
  p_bundle = (id *)&v6->_bundle;
  objc_storeStrong((id *)&v6->_bundle, a3);
  objc_msgSend(*p_bundle, "underlyingBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "infoDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("GDPRSplash"));
  v11 = objc_claimAutoreleasedReturnValue();
  splashContentName = v7->_splashContentName;
  v7->_splashContentName = (NSString *)v11;

  if (v7->_splashContentName)
  {
    objc_msgSend(*p_bundle, "underlyingBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBPrivacyFlow _splashPlistFromBundle:forContentName:](OBPrivacyFlow, "_splashPlistFromBundle:forContentName:", v13, v7->_splashContentName);
    v14 = objc_claimAutoreleasedReturnValue();
    splashPlist = v7->_splashPlist;
    v7->_splashPlist = (NSDictionary *)v14;

    v16 = v7->_splashPlist;
    if (v16)
    {
      -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("ButtonTitle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v7->_splashPListContainsLegacyStringKeys = 1;
      }
      else
      {
        -[NSDictionary objectForKeyedSubscript:](v7->_splashPlist, "objectForKeyedSubscript:", CFSTR("ButtonCaption"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v7->_splashPListContainsLegacyStringKeys = 1;
        }
        else
        {
          -[NSDictionary objectForKeyedSubscript:](v7->_splashPlist, "objectForKeyedSubscript:", CFSTR("Title"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v7->_splashPListContainsLegacyStringKeys = 1;
          }
          else
          {
            -[NSDictionary objectForKeyedSubscript:](v7->_splashPlist, "objectForKeyedSubscript:", CFSTR("ShortTitle"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              v7->_splashPListContainsLegacyStringKeys = 1;
            }
            else
            {
              -[NSDictionary objectForKeyedSubscript:](v7->_splashPlist, "objectForKeyedSubscript:", CFSTR("Content"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v7->_splashPListContainsLegacyStringKeys = v24 != 0;

            }
          }

        }
      }

      goto LABEL_21;
    }
  }
  else
  {
    _OBLoggingFacility();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v19;
      _os_log_impl(&dword_199FE5000, v18, OS_LOG_TYPE_DEFAULT, "No GDPRSplash for bundle %@", buf, 0xCu);

    }
  }

  v20 = 0;
LABEL_22:

  return v20;
}

+ (id)_splashPlistFromBundle:(id)a3 forContentName:(id)a4
{
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "pathForResource:ofType:", a4, CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    _OBLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_199FE5000, v6, OS_LOG_TYPE_DEFAULT, "No splash found in bundle at path: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

+ (OBPrivacyFlow)flowWithBundle:(id)a3
{
  id v3;
  OBPrivacyFlow *v4;

  v3 = a3;
  v4 = -[OBPrivacyFlow initWithBundle:]([OBPrivacyFlow alloc], "initWithBundle:", v3);

  return v4;
}

- (id)replacementPrecondition
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_splashPlist, "objectForKeyedSubscript:", CFSTR("ReplacementInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Precondition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)replaceeIdentifierSets
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSDictionary objectForKeyedSubscript:](self->_splashPlist, "objectForKeyedSubscript:", CFSTR("ReplacementInfo"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ReplaceeSets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!v6)
          v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v11 = (void *)objc_msgSend(v6, "copy");
  return v11;
}

- (OBPrivacyFlow)initWithSplashContent:(id)a3
{
  id v5;
  OBPrivacyFlow *v6;
  OBPrivacyFlow *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OBPrivacyFlow;
  v6 = -[OBPrivacyFlow init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_splashPlist, a3);

  return v7;
}

- (NSString)identifier
{
  return -[OBBundle identifier](self->_bundle, "identifier");
}

- (id)_currentPlatform
{
  return CFSTR("iOS");
}

- (BOOL)platformSupported
{
  OBPrivacyFlow *v2;
  void *v3;
  _QWORD v5[5];

  v2 = self;
  -[NSDictionary objectForKeyedSubscript:](self->_splashPlist, "objectForKeyedSubscript:", CFSTR("SupportedPlatforms"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__OBPrivacyFlow_platformSupported__block_invoke;
  v5[3] = &unk_1E37AAAD0;
  v5[4] = v2;
  LOBYTE(v2) = objc_msgSend(v3, "indexOfObjectPassingTest:", v5) != 0x7FFFFFFFFFFFFFFFLL;

  return (char)v2;
}

uint64_t __34__OBPrivacyFlow_platformSupported__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_currentPlatform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_verifiedSplashLocalizedStringForKey:(id)a3 language:(id)a4 preferredDeviceType:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v8 = a3;
  -[OBPrivacyFlow _splashLocalizedStringForKey:language:preferredDeviceType:](self, "_splashLocalizedStringForKey:language:preferredDeviceType:", v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && (objc_msgSend(v9, "isEqualToString:", v8) & 1) == 0)
    v11 = v10;
  else
    v11 = 0;

  return v11;
}

- (id)_splashLocalizedStringForKey:(id)a3 language:(id)a4 preferredDeviceType:(unint64_t)a5
{
  id v8;
  NSString *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  v8 = a3;
  v9 = self->_splashContentName;
  -[OBPrivacyFlow _splashLocalizedStringForKey:language:table:preferredDeviceType:](self, "_splashLocalizedStringForKey:language:table:preferredDeviceType:", v8, a4, v9, a5);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (id)v10;
    if (-[OBBundle isPlaceholder](self->_bundle, "isPlaceholder"))
    {
      -[OBPrivacyFlow _stringForPlaceholderBundleWithString:](self, "_stringForPlaceholderBundleWithString:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v12;
    }
  }
  else
  {
    v11 = v8;
  }

  return v11;
}

- (id)_stringForPlaceholderBundleWithString:(id)a3
{
  OBBundle *bundle;
  id v4;
  void *v5;
  void *v6;

  bundle = self->_bundle;
  v4 = a3;
  -[OBBundle identifier](bundle, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_splashLocalizedStringForKey:(id)a3 language:(id)a4 table:(id)a5 preferredDeviceType:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  CFPropertyListRef v19;
  const void *v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[OBPrivacyFlow _modelSpecificLocalizedStringKeyForKey:preferredDeviceType:](OBPrivacyFlow, "_modelSpecificLocalizedStringKeyForKey:preferredDeviceType:", v10, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBundle underlyingBundle](self->_bundle, "underlyingBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", v13, v12, v14, v11);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[__CFString length](v15, "length")
    || -[__CFString isEqualToString:](v15, "isEqualToString:", v13))
  {
    -[OBBundle underlyingBundle](self->_bundle, "underlyingBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", v10, v12, v16, v11);
    v17 = objc_claimAutoreleasedReturnValue();

    v15 = (__CFString *)v17;
  }
  if (-[__CFString length](v15, "length") && (-[__CFString isEqualToString:](v15, "isEqualToString:", v10) & 1) == 0)
  {
    v19 = CFPreferencesCopyValue(CFSTR("OBShowFakeText"), (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    if (v19)
    {
      v20 = v19;
      if (-[__CFString length](v15, "length") && os_variant_has_internal_ui())
      {

        v15 = CFSTR("ONBOARDINGKIT PRIVACY TEXT");
      }
      CFRelease(v20);
    }
    v18 = v15;
    v15 = v18;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)_modelSpecificLocalizedStringKeyForKey:(id)a3 preferredDeviceType:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  switch(a4)
  {
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_IPHONE"), v6);
      break;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_IPAD"), v6);
      break;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_IPOD"), v6);
      break;
    case 4uLL:
      +[OBUtilities stringWithFormat:](OBUtilities, "stringWithFormat:", CFSTR("%@_MAC"), v6);
      break;
    case 5uLL:
      +[OBUtilities stringWithFormat:](OBUtilities, "stringWithFormat:", CFSTR("%@_APPLETV"), v6);
      break;
    case 6uLL:
      +[OBUtilities stringWithFormat:](OBUtilities, "stringWithFormat:", CFSTR("%@_HOMEPOD"), v6);
      break;
    case 7uLL:
      +[OBUtilities stringWithFormat:](OBUtilities, "stringWithFormat:", CFSTR("%@_APPLEWATCH"), v6);
      break;
    case 8uLL:
      +[OBUtilities stringWithFormat:](OBUtilities, "stringWithFormat:", CFSTR("%@_APPLEVISION"), v6);
      break;
    default:
      if (_CFMZEnabled())
        objc_msgSend(a1, "_modelSpecificLocalizedStringKeyForKey:preferredDeviceType:", v6, 4);
      else
        objc_msgSend(MEMORY[0x1E0DC3708], "modelSpecificLocalizedStringKeyForKey:", v6);
      break;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_bundleImageNamed:(id)a3
{
  OBBundle *bundle;
  id v4;
  void *v5;
  void *v6;

  bundle = self->_bundle;
  v4 = a3;
  -[OBBundle underlyingBundle](bundle, "underlyingBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OBImage imageNamed:inBundle:](OBImage, "imageNamed:inBundle:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isPersonallyIdentifiable
{
  void *v2;
  void *v3;
  char v4;

  -[OBPrivacyFlow _iconType](self, "_iconType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("pii"));

  return v4;
}

- (id)_iconType
{
  return -[NSDictionary objectForKeyedSubscript:](self->_splashPlist, "objectForKeyedSubscript:", CFSTR("IconType"));
}

- (id)_splashPlist
{
  return self->_splashPlist;
}

- (OBImage)buttonIcon
{
  void *v3;
  void *v4;

  if (!self->_buttonIconLoaded && -[OBPrivacyFlow isPersonallyIdentifiable](self, "isPersonallyIdentifiable"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBImage imageNamed:inBundle:](OBImage, "imageNamed:inBundle:", CFSTR("PII.pdf"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[OBPrivacyFlow setButtonIcon:](self, "setButtonIcon:", v4);
  }
  return self->_buttonIcon;
}

- (void)setButtonIcon:(id)a3
{
  OBImage *v5;
  OBImage *v6;

  v5 = (OBImage *)a3;
  if (self->_buttonIcon != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_buttonIcon, a3);
    v5 = v6;
  }
  self->_buttonIconLoaded = 1;

}

- (BOOL)showInCombinedList
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  -[NSDictionary objectForKeyedSubscript:](self->_splashPlist, "objectForKeyedSubscript:", CFSTR("HideFromCombinedList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v3, "BOOLValue") & 1) != 0)
      goto LABEL_10;
  }
  else if (v3)
  {
    _OBLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199FE5000, v4, OS_LOG_TYPE_DEFAULT, "HideFromCombinedList must be a BOOLean", buf, 2u);
    }

  }
  -[NSDictionary objectForKeyedSubscript:](self->_splashPlist, "objectForKeyedSubscript:", CFSTR("HideFromCombinedListForSKUs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v5)
    {
      _OBLoggingFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_199FE5000, v9, OS_LOG_TYPE_DEFAULT, "HideFromCombinedListForSKUs must be an array", v14, 2u);
      }

    }
LABEL_16:
    -[NSDictionary objectForKeyedSubscript:](self->_splashPlist, "objectForKeyedSubscript:", CFSTR("ShowInCombinedListForDeviceClasses"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[OBPrivacyFlow _deviceClass](self, "_deviceClass");
      v11 = objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "containsObject:", v11);
    }
    else
    {
      if (!v10)
      {
        v8 = 1;
        goto LABEL_23;
      }
      _OBLoggingFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_199FE5000, v11, OS_LOG_TYPE_DEFAULT, "ShowInCombinedListForDeviceClasses must be an array", v13, 2u);
      }
      v8 = 1;
    }

LABEL_23:
    goto LABEL_24;
  }
  -[OBPrivacyFlow _SKU](self, "_SKU");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) == 0)
    goto LABEL_16;
LABEL_10:
  v8 = 0;
LABEL_24:

  return v8;
}

- (BOOL)enablesGroupingInCombinedList
{
  void *v2;
  char v3;
  NSObject *v4;
  uint8_t v6[16];

  -[NSDictionary objectForKeyedSubscript:](self->_splashPlist, "objectForKeyedSubscript:", CFSTR("EnablesGroupingInCombinedList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    if (v2)
    {
      _OBLoggingFacility();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_199FE5000, v4, OS_LOG_TYPE_DEFAULT, "EnablesGroupingInCombinedList must be a BOOLean", v6, 2u);
      }

    }
    v3 = 0;
  }

  return v3;
}

- (id)_deviceClass
{
  return (id)MGGetStringAnswer();
}

- (id)_SKU
{
  return (id)MGGetStringAnswer();
}

- (id)_bestStringForKeyWithPrefix:(id)a3 language:(id)a4 preferredDeviceType:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  +[OBCapabilities sharedCapabilities](OBCapabilities, "sharedCapabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "deviceSupportsGenerativeModels");

  if (!v11)
  {
LABEL_6:
    -[OBPrivacyFlow _stringKeyWithCapabilitiesFromPrefix:withNetwork:withGenerative:](self, "_stringKeyWithCapabilitiesFromPrefix:withNetwork:withGenerative:", v8, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyFlow _verifiedSplashLocalizedStringForKey:language:preferredDeviceType:](self, "_verifiedSplashLocalizedStringForKey:language:preferredDeviceType:", v12, v9, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      -[OBPrivacyFlow _verifiedSplashLocalizedStringForKey:language:preferredDeviceType:](self, "_verifiedSplashLocalizedStringForKey:language:preferredDeviceType:", v8, v9, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v16 = 0;
        goto LABEL_9;
      }
    }
    goto LABEL_8;
  }
  -[OBPrivacyFlow _stringKeyWithCapabilitiesFromPrefix:withNetwork:withGenerative:](self, "_stringKeyWithCapabilitiesFromPrefix:withNetwork:withGenerative:", v8, 1, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacyFlow _verifiedSplashLocalizedStringForKey:language:preferredDeviceType:](self, "_verifiedSplashLocalizedStringForKey:language:preferredDeviceType:", v12, v9, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
LABEL_8:
    v16 = v13;
    goto LABEL_9;
  }
  -[OBPrivacyFlow _stringKeyWithCapabilitiesFromPrefix:withNetwork:withGenerative:](self, "_stringKeyWithCapabilitiesFromPrefix:withNetwork:withGenerative:", v8, 0, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacyFlow _verifiedSplashLocalizedStringForKey:language:preferredDeviceType:](self, "_verifiedSplashLocalizedStringForKey:language:preferredDeviceType:", v14, v9, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {

    goto LABEL_6;
  }
  v16 = v15;

LABEL_9:
  return v16;
}

- (id)_stringKeyWithCapabilitiesFromPrefix:(id)a3 withNetwork:(BOOL)a4 withGenerative:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = v7;
  if (v6)
  {
    +[OBCapabilities sharedCapabilities](OBCapabilities, "sharedCapabilities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isWAPI");

    if (v10)
      v11 = CFSTR("_WLAN");
    else
      v11 = CFSTR("_WIFI");
    objc_msgSend(v7, "stringByAppendingString:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v5)
  {
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("_GENERATIVE"));
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }

  return v8;
}

- (BOOL)_conformsToRequirement:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  __CFString *v6;
  BOOL v7;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("wifi")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("wlan")))
  {
    +[OBCapabilities sharedCapabilities](OBCapabilities, "sharedCapabilities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isWAPI");

    v6 = (v5 & 1) != 0 ? CFSTR("wlan") : CFSTR("wifi");
    if ((objc_msgSend(v3, "isEqualToString:", v6) & 1) != 0)
      v7 = 1;
  }

  return v7;
}

- (BOOL)_conformsToRequirements:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[OBPrivacyFlow _conformsToRequirement:](self, "_conformsToRequirement:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v8 = v7;
        v9 = 0;
        v10 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v6);
            v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v9 = v9 & 1 | -[OBPrivacyFlow _conformsToRequirement:](self, "_conformsToRequirement:", v12, (_QWORD)v14);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v8);
      }
      else
      {
        v9 = 0;
      }

      v5 = v9 & 1;
    }
    else
    {
      v5 = 1;
    }
  }

  return v5;
}

- (id)_textForConditionalItem:(id)a3 language:(id)a4 preferredDeviceType:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  uint64_t v24;
  unint64_t v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[OBPrivacyFlow _splashLocalizedStringForKey:language:preferredDeviceType:](self, "_splashLocalizedStringForKey:language:preferredDeviceType:", v8, v9, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "length") || objc_msgSend(v10, "isEqualToString:", v8))
    {
      +[OBCapabilities sharedCapabilities](OBCapabilities, "sharedCapabilities");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isWAPI");

      if ((v12 & 1) != 0)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_WLAN"), v8);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_WIFI"), v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBPrivacyFlow _splashLocalizedStringForKey:language:preferredDeviceType:](self, "_splashLocalizedStringForKey:language:preferredDeviceType:", v23, v9, a5);
      v24 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v24;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v13 = v8;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v14)
      {
        v15 = v14;
        v28 = v8;
        v26 = a5;
        v27 = v9;
        v16 = *(_QWORD *)v30;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v30 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = v18;
              objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Text"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Requirements"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = -[OBPrivacyFlow _conformsToRequirements:](self, "_conformsToRequirements:", v21);

                if (v22)
                {
                  v9 = v27;
                  -[OBPrivacyFlow _splashLocalizedStringForKey:language:preferredDeviceType:](self, "_splashLocalizedStringForKey:language:preferredDeviceType:", v20, v27, v26);
                  v10 = (void *)objc_claimAutoreleasedReturnValue();

                  v8 = v28;
                  goto LABEL_24;
                }
              }

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v15)
            continue;
          break;
        }
        v10 = 0;
        v9 = v27;
        v8 = v28;
      }
      else
      {
        v10 = 0;
      }
LABEL_24:

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSString)localizedButtonTitle
{
  return (NSString *)-[OBPrivacyFlow localizedButtonTitleForLanguage:preferredDeviceType:](self, "localizedButtonTitleForLanguage:preferredDeviceType:", 0, 0);
}

- (id)localizedButtonTitleForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4
{
  NSDictionary *splashPlist;
  id v7;
  id v8;
  void *v9;

  if (self->_splashPListContainsLegacyStringKeys)
  {
    splashPlist = self->_splashPlist;
    v7 = a3;
    -[NSDictionary objectForKeyedSubscript:](splashPlist, "objectForKeyedSubscript:", CFSTR("ButtonTitle"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyFlow _textForConditionalItem:language:preferredDeviceType:](self, "_textForConditionalItem:language:preferredDeviceType:", v8, v7, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = a3;
    -[OBPrivacyFlow _bestStringForKeyWithPrefix:language:preferredDeviceType:](self, "_bestStringForKeyWithPrefix:language:preferredDeviceType:", CFSTR("BUTTON_TITLE"), v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (NSString)localizedButtonCaption
{
  return (NSString *)-[OBPrivacyFlow localizedButtonCaptionForLanguage:preferredDeviceType:](self, "localizedButtonCaptionForLanguage:preferredDeviceType:", 0, 0);
}

- (id)localizedButtonCaptionForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4
{
  NSDictionary *splashPlist;
  id v7;
  id v8;
  void *v9;

  if (self->_splashPListContainsLegacyStringKeys)
  {
    splashPlist = self->_splashPlist;
    v7 = a3;
    -[NSDictionary objectForKeyedSubscript:](splashPlist, "objectForKeyedSubscript:", CFSTR("ButtonCaption"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyFlow _textForConditionalItem:language:preferredDeviceType:](self, "_textForConditionalItem:language:preferredDeviceType:", v8, v7, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = a3;
    -[OBPrivacyFlow _bestStringForKeyWithPrefix:language:preferredDeviceType:](self, "_bestStringForKeyWithPrefix:language:preferredDeviceType:", CFSTR("BUTTON_CAPTION"), v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (NSString)localizedTitle
{
  return (NSString *)-[OBPrivacyFlow localizedTitleForLanguage:preferredDeviceType:](self, "localizedTitleForLanguage:preferredDeviceType:", 0, 0);
}

- (id)localizedTitleForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4
{
  NSDictionary *splashPlist;
  id v7;
  id v8;
  void *v9;

  if (self->_splashPListContainsLegacyStringKeys)
  {
    splashPlist = self->_splashPlist;
    v7 = a3;
    -[NSDictionary objectForKeyedSubscript:](splashPlist, "objectForKeyedSubscript:", CFSTR("Title"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyFlow _textForConditionalItem:language:preferredDeviceType:](self, "_textForConditionalItem:language:preferredDeviceType:", v8, v7, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = a3;
    -[OBPrivacyFlow _bestStringForKeyWithPrefix:language:preferredDeviceType:](self, "_bestStringForKeyWithPrefix:language:preferredDeviceType:", CFSTR("SPLASH_TITLE"), v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (NSString)localizedShortTitle
{
  return (NSString *)-[OBPrivacyFlow localizedShortTitleForLanguage:preferredDeviceType:](self, "localizedShortTitleForLanguage:preferredDeviceType:", 0, 0);
}

- (id)localizedShortTitleForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4
{
  NSDictionary *splashPlist;
  id v7;
  id v8;
  void *v9;

  if (self->_splashPListContainsLegacyStringKeys)
  {
    splashPlist = self->_splashPlist;
    v7 = a3;
    -[NSDictionary objectForKeyedSubscript:](splashPlist, "objectForKeyedSubscript:", CFSTR("ShortTitle"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyFlow _textForConditionalItem:language:preferredDeviceType:](self, "_textForConditionalItem:language:preferredDeviceType:", v8, v7, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = a3;
    -[OBPrivacyFlow _bestStringForKeyWithPrefix:language:preferredDeviceType:](self, "_bestStringForKeyWithPrefix:language:preferredDeviceType:", CFSTR("SPLASH_SHORT_TITLE"), v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (NSString)localizedCombinedHeader
{
  return (NSString *)-[OBPrivacyFlow localizedCombinedHeaderForLanguage:preferredDeviceType:](self, "localizedCombinedHeaderForLanguage:preferredDeviceType:", 0, 0);
}

- (id)localizedCombinedHeaderForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4
{
  NSDictionary *splashPlist;
  id v7;
  id v8;
  void *v9;

  if (self->_splashPListContainsLegacyStringKeys)
  {
    splashPlist = self->_splashPlist;
    v7 = a3;
    -[NSDictionary objectForKeyedSubscript:](splashPlist, "objectForKeyedSubscript:", CFSTR("CombinedHeader"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyFlow _textForConditionalItem:language:preferredDeviceType:](self, "_textForConditionalItem:language:preferredDeviceType:", v8, v7, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = a3;
    -[OBPrivacyFlow _bestStringForKeyWithPrefix:language:preferredDeviceType:](self, "_bestStringForKeyWithPrefix:language:preferredDeviceType:", CFSTR("COMBINED_HEADER"), v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (NSAttributedString)localizedCombinedFooter
{
  return (NSAttributedString *)-[OBPrivacyFlow localizedCombinedFooterForLanguage:preferredDeviceType:](self, "localizedCombinedFooterForLanguage:preferredDeviceType:", 0, 0);
}

- (id)localizedCombinedFooterForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!self->_splashPListContainsLegacyStringKeys)
  {
    -[OBPrivacyFlow _bestStringForKeyWithPrefix:language:preferredDeviceType:](self, "_bestStringForKeyWithPrefix:language:preferredDeviceType:", CFSTR("COMBINED_FOOTER"), v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_3;
LABEL_6:
    v9 = 0;
    goto LABEL_14;
  }
  -[NSDictionary objectForKeyedSubscript:](self->_splashPlist, "objectForKeyedSubscript:", CFSTR("CombinedFooter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacyFlow _textForConditionalItem:language:preferredDeviceType:](self, "_textForConditionalItem:language:preferredDeviceType:", v7, v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_6;
LABEL_3:
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v8);
  if (self->_splashPListContainsLegacyStringKeys)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_splashPlist, "objectForKeyedSubscript:", CFSTR("CombinedFooterButton"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyFlow _textForConditionalItem:language:preferredDeviceType:](self, "_textForConditionalItem:language:preferredDeviceType:", v10, v6, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSDictionary objectForKeyedSubscript:](self->_splashPlist, "objectForKeyedSubscript:", CFSTR("CombinedFooterButtonURL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyFlow _textForConditionalItem:language:preferredDeviceType:](self, "_textForConditionalItem:language:preferredDeviceType:", v12, v6, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[OBPrivacyFlow _bestStringForKeyWithPrefix:language:preferredDeviceType:](self, "_bestStringForKeyWithPrefix:language:preferredDeviceType:", CFSTR("COMBINED_FOOTER_BUTTON"), v6, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyFlow _bestStringForKeyWithPrefix:language:preferredDeviceType:](self, "_bestStringForKeyWithPrefix:language:preferredDeviceType:", CFSTR("COMBINED_FOOTER_BUTTON_URL"), v6, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v11)
    v14 = v13 == 0;
  else
    v14 = 1;
  if (!v14)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3498]);
    v21 = *MEMORY[0x1E0DC1160];
    v22[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithString:attributes:", v11, v16);

    v18 = objc_msgSend(v8, "rangeOfString:", CFSTR("%@"));
    objc_msgSend(v9, "replaceCharactersInRange:withAttributedString:", v18, v19, v17);

  }
LABEL_14:

  return v9;
}

- (NSArray)localizedContentList
{
  return (NSArray *)-[OBPrivacyFlow localizedContentListForLanguage:preferredDeviceType:](self, "localizedContentListForLanguage:preferredDeviceType:", 0, 0);
}

- (id)localizedContentListForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_splashPListContainsLegacyStringKeys)
  {
    -[OBPrivacyFlow _legacyLocalizedContentListForLanguage:preferredDeviceType:](self, "_legacyLocalizedContentListForLanguage:preferredDeviceType:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)objc_opt_new();
    -[OBPrivacyFlow _bestStringForKeyWithPrefix:language:preferredDeviceType:](self, "_bestStringForKeyWithPrefix:language:preferredDeviceType:", CFSTR("SPLASH_SUMMARY"), v6, a4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)objc_opt_new();
      objc_msgSend(v10, "setText:", v9);
      objc_msgSend(v8, "addObject:", v10);

    }
    v24 = v9;
    v26 = v8;
    v11 = (void *)objc_opt_new();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = objc_msgSend(&unk_1E37BC7D8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(&unk_1E37BC7D8);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "stringByAppendingString:", CFSTR("_BULLET"), v24);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[OBPrivacyFlow _bestStringForKeyWithPrefix:language:preferredDeviceType:](self, "_bestStringForKeyWithPrefix:language:preferredDeviceType:", v16, v6, a4);
          v17 = objc_claimAutoreleasedReturnValue();
          if (!v17)
          {

            goto LABEL_15;
          }
          v18 = (void *)v17;
          v19 = (void *)objc_opt_new();
          objc_msgSend(v19, "setText:", v18);
          objc_msgSend(v11, "addObject:", v19);

        }
        v13 = objc_msgSend(&unk_1E37BC7D8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_15:
    v7 = v26;
    if (objc_msgSend(v11, "count", v24))
    {
      v20 = (void *)objc_opt_new();
      objc_msgSend(v20, "setBullets:", v11);
      objc_msgSend(v26, "addObject:", v20);

    }
    -[OBPrivacyFlow _bestStringForKeyWithPrefix:language:preferredDeviceType:](self, "_bestStringForKeyWithPrefix:language:preferredDeviceType:", CFSTR("FOOTER_TEXT"), v6, a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)objc_opt_new();
      objc_msgSend(v22, "setText:", v21);
      objc_msgSend(v26, "addObject:", v22);

    }
  }

  return v7;
}

- (id)_legacyLocalizedContentListForLanguage:(id)a3 preferredDeviceType:(unint64_t)a4
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  unint64_t v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  id v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  id v57;
  OBPrivacyFlow *v58;
  void *v59;
  id obj;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  void *v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v51 = (id)objc_opt_new();
  -[NSDictionary objectForKeyedSubscript:](self->_splashPlist, "objectForKeyedSubscript:", CFSTR("Content"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v6 = v5;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
    if (v7)
    {
      v8 = v7;
      v48 = v5;
      v9 = 0x1E0C99000uLL;
      v10 = *(_QWORD *)v66;
      v58 = self;
      v49 = *(_QWORD *)v66;
      v50 = v6;
      while (1)
      {
        v11 = 0;
        v53 = v8;
        do
        {
          if (*(_QWORD *)v66 != v10)
            objc_enumerationMutation(v6);
          v54 = v11;
          v12 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = v12;
            -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("Requirements"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[OBPrivacyFlow _conformsToRequirements:](self, "_conformsToRequirements:", v14);

            if (!v15)
            {
              v8 = v53;
              goto LABEL_48;
            }
            v16 = (void *)objc_opt_new();
            -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("Text"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            v52 = v13;
            if ((isKindOfClass & 1) != 0)
            {
              -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("Text"));
              v19 = objc_claimAutoreleasedReturnValue();
              -[OBPrivacyFlow _splashLocalizedStringForKey:language:preferredDeviceType:](self, "_splashLocalizedStringForKey:language:preferredDeviceType:", v19, v57, a4);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setText:", v20);

              goto LABEL_41;
            }
            v59 = v16;
            -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("Bullets"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v22 = objc_opt_isKindOfClass();

            if ((v22 & 1) != 0)
            {
              v55 = objc_opt_new();
              v61 = 0u;
              v62 = 0u;
              v63 = 0u;
              v64 = 0u;
              -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("Bullets"));
              obj = (id)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
              v24 = v16;
              if (!v23)
                goto LABEL_38;
              v25 = v23;
              v26 = *(_QWORD *)v62;
              while (1)
              {
                for (i = 0; i != v25; ++i)
                {
                  if (*(_QWORD *)v62 != v26)
                    objc_enumerationMutation(obj);
                  v28 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v29 = v9;
                    v30 = objc_opt_new();
                    v31 = v28;
                    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Text"));
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("IconName"));
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Requirements"));
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      v35 = -[OBPrivacyFlow _conformsToRequirements:](v58, "_conformsToRequirements:", v34);

                      if (v35)
                      {
                        -[OBPrivacyFlow _splashLocalizedStringForKey:language:preferredDeviceType:](v58, "_splashLocalizedStringForKey:language:preferredDeviceType:", v32, v57, a4);
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        -[NSObject setText:](v30, "setText:", v36);

                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          -[OBPrivacyFlow _bundleImageNamed:](v58, "_bundleImageNamed:", v33);
                          v37 = objc_claimAutoreleasedReturnValue();
                          -[NSObject setIcon:](v30, "setIcon:", v37);
                          goto LABEL_33;
                        }
                        if (v33)
                        {
                          _OBLoggingFacility();
                          v37 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                          {
                            v41 = (void *)objc_opt_class();
                            *(_DWORD *)buf = 138412290;
                            v70 = v41;
                            v42 = v41;
                            _os_log_impl(&dword_199FE5000, v37, OS_LOG_TYPE_DEFAULT, "OBBundle: Bullet IconName must be a string, was %@", buf, 0xCu);

                          }
LABEL_33:

                        }
                        -[NSObject addObject:](v55, "addObject:", v30, v48);
                      }
                    }
                    else
                    {
                      _OBLoggingFacility();
                      v38 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                      {
                        v39 = (void *)objc_opt_class();
                        *(_DWORD *)buf = 138412290;
                        v70 = v39;
                        v40 = v39;
                        _os_log_impl(&dword_199FE5000, v38, OS_LOG_TYPE_DEFAULT, "OBBundle: Bullet Text must be a string, was %@", buf, 0xCu);

                      }
                    }

                    v9 = v29;
                    v24 = v59;
                    goto LABEL_36;
                  }
                  _OBLoggingFacility();
                  v30 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_199FE5000, v30, OS_LOG_TYPE_DEFAULT, "OBBundle: Bullet entries must be dictionaries", buf, 2u);
                  }
LABEL_36:

                }
                v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
                if (!v25)
                {
LABEL_38:

                  v19 = v55;
                  if (-[NSObject count](v55, "count"))
                    objc_msgSend(v24, "setBullets:", v55);
                  self = v58;
                  v16 = v59;
                  v10 = v49;
                  v6 = v50;
LABEL_41:
                  v8 = v53;
LABEL_42:

                  goto LABEL_43;
                }
              }
            }
            -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("Bullets"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            v8 = v53;
            if (v45)
            {
              _OBLoggingFacility();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_199FE5000, v19, OS_LOG_TYPE_DEFAULT, "OBPrivacyBundle: Bullets must be an array", buf, 2u);
              }
              goto LABEL_42;
            }
LABEL_43:
            objc_msgSend(v16, "text", v48);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            if (v43)
            {

              v13 = v52;
              goto LABEL_46;
            }
            objc_msgSend(v16, "bullets");
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            v13 = v52;
            if (v44)
LABEL_46:
              objc_msgSend(v51, "addObject:", v16);

            goto LABEL_48;
          }
          _OBLoggingFacility();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199FE5000, v13, OS_LOG_TYPE_DEFAULT, "OBPrivacyBundle: Content entries must be dictionaries", buf, 2u);
          }
LABEL_48:

          v11 = v54 + 1;
        }
        while (v54 + 1 != v8);
        v46 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
        v8 = v46;
        if (!v46)
        {
          v5 = v48;
          break;
        }
      }
    }
  }
  else
  {
    _OBLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199FE5000, v6, OS_LOG_TYPE_DEFAULT, "OBPrivacyBundle: Content must be an array", buf, 2u);
    }
  }

  return v51;
}

- (OBBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

@end
