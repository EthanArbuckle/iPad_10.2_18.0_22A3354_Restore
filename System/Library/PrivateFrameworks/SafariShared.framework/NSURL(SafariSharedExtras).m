@implementation NSURL(SafariSharedExtras)

+ (id)safari_URLWithUserTypedString:()SafariSharedExtras
{
  WTF::URLWithUserTypedString(this, 0, (NSURL *)this);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)safari_isHTTPSURL
{
  return objc_msgSend(a1, "safari_hasScheme:", CFSTR("https"));
}

+ (id)safari_URLWithDataAsString:()SafariSharedExtras
{
  objc_msgSend(a1, "safari_URLWithDataAsString:relativeToURL:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)safari_URLWithDataAsString:()SafariSharedExtras relativeToURL:
{
  id v5;
  NSData *v6;
  void *v7;
  WTF *v8;
  NSURL *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(v5, "safari_stringByTrimmingWhitespace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataUsingEncoding:", 5);
    v8 = (WTF *)objc_claimAutoreleasedReturnValue();
    WTF::URLWithData(v8, v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)safari_URLForReadingListItemWithUUIDString:()SafariSharedExtras
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("reading-list://"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (uint64_t)safari_aboutBlankURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("about:blank"));
}

- (CFStringRef)safari_path
{
  return (id)CFURLCopyPath(a1);
}

- (__CFString)safari_fileType
{
  char v2;
  id v3;
  void *v4;
  __CFString *v5;
  id v7;

  if (!objc_msgSend(a1, "isFileURL"))
    return &stru_1E4B40D18;
  v7 = 0;
  v2 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v7, *MEMORY[0x1E0C998E0], 0);
  v3 = v7;
  v4 = v3;
  if ((v2 & 1) != 0)
  {
    objc_msgSend(v3, "identifier");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1E4B40D18;
  }

  return v5;
}

- (id)safari_identityPreferenceDomain
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", a1, 0);
  v2 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v1, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setScheme:", v3);

  objc_msgSend(v1, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHost:", v4);

  objc_msgSend(v1, "port");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPort:", v5);

  objc_msgSend(v2, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)safari_hasLocalScheme
{
  if ((objc_msgSend(a1, "isFileURL") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "safari_hasScheme:", CFSTR("applewebdata"));
}

- (uint64_t)safari_hasFeedScheme
{
  if ((objc_msgSend(a1, "safari_hasScheme:", CFSTR("feed")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "safari_hasScheme:", CFSTR("feeds"));
}

- (uint64_t)safari_isHTTPURL
{
  return objc_msgSend(a1, "safari_hasScheme:", CFSTR("http"));
}

- (uint64_t)safari_isDataURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "safari_hasCaseInsensitivePrefix:", CFSTR("data:"));

  return v2;
}

- (uint64_t)safari_hasCustomScheme
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
    v3 = objc_msgSend(a1, "safari_isHTTPFamilyURL") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (uint64_t)safari_isBlobURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "safari_hasCaseInsensitivePrefix:", CFSTR("blob:"));

  return v2;
}

- (uint64_t)safari_isMailtoURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "safari_hasCaseInsensitivePrefix:", CFSTR("mailto:"));

  return v2;
}

- (uint64_t)safari_isSafariResourceURL
{
  return objc_msgSend(a1, "safari_hasScheme:", CFSTR("safari-resource"));
}

- (uint64_t)safari_isAboutBlankURL
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "safari_aboutBlankURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isEqual:", v2);

  return v3;
}

- (uint64_t)safari_isSafariWebExtensionURL
{
  return objc_msgSend(a1, "safari_hasScheme:", CFSTR("safari-web-extension"));
}

- (id)safari_composedIdentifierAndProfileIdentifierInSafariWebExtensionURL
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (objc_msgSend(a1, "safari_isSafariWebExtensionURL"))
  {
    objc_msgSend(a1, "host");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByRemovingPercentEncoding");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v3, "safari_indexOfFirstAppearanceOfCharacter:", 41);
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = 0;
    }
    else
    {
      v6 = v4 + 1;
      objc_msgSend(v3, "substringToIndex:", v4 + 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "substringFromIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89C18]), "initWithFirst:second:", v7, v8);

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (uint64_t)safari_isMarketplaceKitURL
{
  if ((objc_msgSend(a1, "safari_hasScheme:", CFSTR("app-distribution")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "safari_hasScheme:", CFSTR("marketplace-kit"));
}

- (uint64_t)safari_isSafariSpecificURL
{
  return objc_msgSend(a1, "safari_hasScheme:", CFSTR("x-safari-https"));
}

- (id)safari_URLByNormalizingSafariSpecificURL
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setScheme:", CFSTR("https"));
    objc_msgSend(v3, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("favorites://"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (uint64_t)safari_isLocalOrPrivateNetworkURL
{
  void *v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  _BOOL4 v7;
  int32x4_t v9;
  unsigned int v10;

  objc_msgSend(a1, "host");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("localhost")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(objc_retainAutorelease(v1), "cStringUsingEncoding:", 1);
    if (v2)
    {
      if (inet_pton(2, (const char *)v2, &v10) == 1)
      {
        v3 = bswap32(v10);
        v2 = 1;
        if ((v3 & 0xFF000000) != 0xA000000 && (v3 & 0xFF000000) != 0x7F000000)
        {
          v4 = v3 >> 20;
          v5 = v3 & 0xFFFF0000;
          v7 = v5 == -1062731776 || v5 == -1442971648;
          v2 = v4 == 2753 || v7;
        }
      }
      else if (inet_pton(30, (const char *)v2, &v9) == 1)
      {
        v2 = 1;
        if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_s32(v9, (int32x4_t)xmmword_1A3F5BC90)))) & 1) != 0)
          v2 = (v9.i8[0] & 0xFE) == 0xFC || (v9.i16[0] & 0xC0FF) == 33022;
      }
      else
      {
        v2 = 0;
      }
    }
  }

  return v2;
}

- (uint64_t)safari_isEligibleToBeOpenedByServiceWorkers
{
  uint64_t result;

  result = objc_msgSend(a1, "safari_isHTTPFamilyURL");
  if ((_DWORD)result)
    return objc_msgSend(a1, "safari_isLocalOrPrivateNetworkURL") ^ 1;
  return result;
}

- (uint64_t)safari_isEligibleToShowNotSecureWarning
{
  uint64_t result;

  result = objc_msgSend(a1, "safari_isHTTPURL");
  if ((_DWORD)result)
    return objc_msgSend(a1, "safari_isLocalOrPrivateNetworkURL") ^ 1;
  return result;
}

- (uint64_t)safari_isOTPAuthURL
{
  if ((objc_msgSend(a1, "safari_hasScheme:", CFSTR("otpauth")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "safari_hasScheme:", CFSTR("apple-otpauth"));
}

- (uint64_t)safari_isOTPAuthMigrationURL
{
  if ((objc_msgSend(a1, "safari_hasScheme:", CFSTR("otpauth-migration")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "safari_hasScheme:", CFSTR("apple-otpauth-migration"));
}

- (id)safari_URLByReplacingHostWithString:()SafariSharedExtras
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHost:", v4);
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)safari_hasUserOrPassword
{
  void *v1;
  void *v2;
  _BOOL8 v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "user");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v1, "password");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "length") != 0;

  }
  return v3;
}

- (id)safari_URLByDeletingUserAndPassword
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {

  }
  else
  {
    objc_msgSend(v2, "password");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (!v5)
    {
      v6 = objc_msgSend(a1, "copy");
      goto LABEL_5;
    }
  }
  objc_msgSend(v2, "setUser:", 0);
  objc_msgSend(v2, "setPassword:", 0);
  objc_msgSend(v2, "URL");
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v7 = (void *)v6;

  return v7;
}

- (id)safari_URLByRemovingAllParameters
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setQuery:", 0);
  objc_msgSend(v1, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)safari_canonicalURLForStartPage
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "safari_originalDataAsString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_bestURLForUserTypedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_canonicalURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)safari_simplifiedURLStringForDeduping
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "safari_canonicalURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_originalDataAsString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 367, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)safari_hasCharactersBeyondPath
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "rangeOfFragment") != 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend(v2, "rangeOfQuery") != 0x7FFFFFFFFFFFFFFFLL;
  else
    v3 = 0;

  return v3;
}

- (id)safari_displayNameWithTitle:()SafariSharedExtras
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
    goto LABEL_3;
  }
  if (!objc_msgSend(a1, "isFileURL"))
  {
    if (objc_msgSend(a1, "safari_isURLTooLongToDisplay"))
      objc_msgSend(a1, "host");
    else
      objc_msgSend(a1, "safari_userVisibleString");
    v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
    v6 = v5;
    if (v5)
      goto LABEL_9;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayNameAtPath:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_9;
LABEL_4:
  v7 = WBS_LOG_CHANNEL_PREFIXOther();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[NSURL(SafariSharedExtras) safari_displayNameWithTitle:].cold.1((uint64_t)a1, v7);
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v6;
}

- (id)safari_originalDataAsString
{
  id v2;
  NSURL *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  WTF::originalURLData(a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithData:encoding:", v4, 5);

  return v5;
}

- (__CFString)safari_userVisibleHost
{
  WTF *v1;
  NSString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  objc_msgSend(a1, "host");
  v1 = (WTF *)objc_claimAutoreleasedReturnValue();
  WTF::decodeHostName(v1, v2);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_1E4B40D18;
  v5 = v3;

  return v5;
}

- (id)safari_userVisibleHostOrExtensionDisplayName
{
  SafariShared::ExtensionURLTranslator *v2;
  SafariShared::ExtensionURLTranslator *v3;

  v2 = (SafariShared::ExtensionURLTranslator *)-[NSURL safari_isSafariWebExtensionURL](a1, "safari_isSafariWebExtensionURL");
  if ((_DWORD)v2)
  {
    SafariShared::ExtensionURLTranslator::shared(v2);
    SafariShared::ExtensionURLTranslator::displayNameForExtensionURL(v3, a1);
  }
  else
  {
    -[NSURL safari_userVisibleHostWithoutWWWSubdomain](a1, "safari_userVisibleHostWithoutWWWSubdomain");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)safari_userVisibleHostWithoutWWWSubdomain
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "safari_userVisibleHost");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_stringByRemovingWwwDotPrefix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)safari_userVisibleHostWithoutWWWSubdomainIfSecure
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if ((objc_msgSend(a1, "safari_isEligibleToShowNotSecureWarning") & 1) != 0)
  {
    objc_msgSend(a1, "safari_userVisibleHost");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@://%@"), v5, v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "safari_userVisibleHostWithoutWWWSubdomain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (__CFString)safari_userVisibleScheme
{
  void *v1;
  uint64_t v2;
  __CFString *v3;

  objc_msgSend(a1, "safari_userVisibleString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "rangeOfString:", CFSTR(":"));
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = &stru_1E4B40D18;
  }
  else
  {
    objc_msgSend(v1, "substringToIndex:", v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (uint64_t)safari_isTopLevelURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "length"))
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("/"));
  else
    v2 = 1;

  return v2;
}

- (uint64_t)safari_shouldBeAssociatedWithFaviconFromRedirectedURL:()SafariSharedExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length")
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("/")) & 1) != 0
    || (objc_msgSend(v6, "path"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "isEqual:", v8),
        v8,
        (v9 & 1) != 0))
  {
    objc_msgSend(v6, "scheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setScheme:", v10);

    objc_msgSend(v6, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPath:", v11);

    objc_msgSend(v6, "fragment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFragment:", v12);

    objc_msgSend(v5, "host");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safari_stringByRemovingWwwDotPrefix");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHost:", v14);

    objc_msgSend(v6, "host");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "safari_stringByRemovingWwwDotPrefix");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHost:", v16);

    v17 = objc_msgSend(v5, "isEqual:", v6);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)safari_userVisibleStringConsideringLongURLs
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "safari_isURLTooLongToDisplay"))
  {
    objc_msgSend(a1, "absoluteString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "substringToIndex:", 4096);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "safari_userVisibleString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)safari_isURLTooLongToDisplay
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (unint64_t)objc_msgSend(v1, "length") > 0x1000;

  return v2;
}

- (id)safari_wellKnownResponseCodeReliabilityURL
{
  void *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "safari_isHTTPFamilyURL"))
  {
    objc_msgSend(a1, "safari_URLByRemovingUserPasswordPathQueryAndFragment");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR(".well-known/resource-that-should-not-exist-whose-status-code-should-not-be-200"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safari_URLByReplacingSchemeWithString:", CFSTR("https"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (__CFString)safari_relativePathToURL:()SafariSharedExtras
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;

  objc_msgSend(a3, "URLByStandardizingPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "URLByStandardizingPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (v5 && v7)
  {
    v9 = objc_msgSend(v5, "count");
    v10 = objc_msgSend(v7, "count");
    if (v9 >= v10)
    {
      objc_msgSend(v5, "subarrayWithRange:", 0, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqualToArray:", v7) & 1) != 0)
      {
        if (v9 == v10)
        {
          v8 = &stru_1E4B40D18;
        }
        else
        {
          objc_msgSend(v5, "subarrayWithRange:", v10, v9 - v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v12);
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)safari_stringForListDisplayWithAdditionalSimplificationOptions:()SafariSharedExtras
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a1, "safari_userVisibleStringConsideringLongURLs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "length") >= 0x101)
  {
    objc_msgSend(v4, "substringWithRange:", 0, 256);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  objc_msgSend(v4, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", a3 | 0x14F, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)safari_stringForListDisplay
{
  return objc_msgSend(a1, "safari_stringForListDisplayWithAdditionalSimplificationOptions:", 0);
}

- (id)safari_mailtoURLStatusMessage
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "safari_isMailtoURL"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v2, "queryItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("subject"));

        if (v10)
        {
          objc_msgSend(v8, "value");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_13:

  if (objc_msgSend(v11, "length") && objc_msgSend(v3, "length"))
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v14, v3, v11);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v11, "length"))
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v14, v11);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "length"))
    {
      v18 = 0;
      goto LABEL_21;
    }
    v17 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v14, v3);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v15;

LABEL_21:
  return v18;
}

- (id)safari_defaultStatusMessageString
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  if (objc_msgSend(a1, "safari_isJavaScriptURL"))
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "safari_userVisibleString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringFromIndex:", 11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(a1, "safari_isTelURL"))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "absoluteString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("tel:"), "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByRemovingPercentEncoding");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v3, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  objc_msgSend(a1, "safari_mailtoURLStatusMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v10;
  if (v10)
  {
    v3 = v10;
    v6 = v3;
  }
  else
  {
    v6 = 0;
  }
LABEL_6:

  return v6;
}

- (uint64_t)safari_isJavaScriptURL
{
  return objc_msgSend(a1, "safari_hasScheme:", CFSTR("javascript"));
}

- (uint64_t)safari_isTelURL
{
  return objc_msgSend(a1, "safari_hasScheme:", CFSTR("tel"));
}

- (uint64_t)safari_isSharedTabGroupURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("https://www.icloud.com/safari-tab-groups"));

  return v2;
}

- (uint64_t)safari_isEqualToURL:()SafariSharedExtras
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  if (objc_msgSend(a1, "safari_isHTTPFamilyURL") && (objc_msgSend(v4, "safari_isHTTPFamilyURL") & 1) != 0)
  {
    v5 = a1;
    objc_msgSend(v5, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (!v7)
    {
      objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("/"));
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v8;
    }
    objc_msgSend(v4, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (!v10)
    {
      objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("/"));
      v11 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v11;
    }
    v12 = objc_msgSend(v5, "isEqual:", v4);

  }
  else
  {
    v12 = objc_msgSend(a1, "isEqual:", v4);
  }

  return v12;
}

- (uint64_t)safari_isEqualOrHasSameHighLevelDomainAsURL:()SafariSharedExtras
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;

  v4 = a3;
  v5 = a1;
  objc_msgSend(v5, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  objc_msgSend(v5, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safari_highLevelDomainFromHost");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safari_highLevelDomainFromHost");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqualToString:", v12);

  if (((v8 | v13) & 1) != 0)
    v14 = 1;
  else
    v14 = objc_msgSend(v5, "safari_isEqualToURL:", v4);

  return v14;
}

- (uint64_t)safari_isReadingListURL
{
  return objc_msgSend(a1, "safari_hasScheme:", CFSTR("reading-list"));
}

+ (uint64_t)safari_readingListURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("reading-list://"));
}

- (id)safari_readingListItemUUIDString
{
  void *v2;
  id v3;

  if (objc_msgSend(a1, "safari_isReadingListURL"))
  {
    objc_msgSend(a1, "host");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v2);

    if (v3)
      v3 = v2;

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)safari_URLByRemovingQuery
{
  void *v1;
  void *v2;

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", a1, 0);
  objc_msgSend(v1, "setQuery:", 0);
  objc_msgSend(v1, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)safari_displayNameWithTitle:()SafariSharedExtras .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 141558275;
  v3 = 1752392040;
  v4 = 2117;
  v5 = a1;
  _os_log_error_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_ERROR, "(probably a bug in NS/CFURL): unable to create title from %{sensitive, mask.hash}@", (uint8_t *)&v2, 0x16u);
}

@end
