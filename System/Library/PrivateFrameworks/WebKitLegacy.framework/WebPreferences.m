@implementation WebPreferences

- (WebPreferences)init
{
  uint64_t v3;
  uint64_t i;
  uint64_t v5;

  v3 = -[WebPreferences init]::instanceCount++;
  for (i = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WebPreferences%d"), v3);
        objc_msgSend((id)objc_opt_class(), "_getInstanceForIdentifier:", i);
        i = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WebPreferences%d"), v5))
  {
    v5 = -[WebPreferences init]::instanceCount++;
  }
  return -[WebPreferences initWithIdentifier:](self, "initWithIdentifier:", i);
}

- (WebPreferences)initWithIdentifier:(NSString *)anIdentifier
{
  return -[WebPreferences initWithIdentifier:sendChangeNotification:](self, "initWithIdentifier:sendChangeNotification:", anIdentifier, 1);
}

- (WebPreferences)initWithIdentifier:(id)a3 sendChangeNotification:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  WebPreferences *v9;
  uint64_t v10;
  dispatch_queue_t v11;
  id v12;
  _QWORD *v13;
  const void *v14;
  uint64_t v15;
  _QWORD *v16;
  const void *v17;
  id v18;
  objc_super v19;

  v4 = a4;
  v7 = objc_msgSend((id)objc_opt_class(), "_getInstanceForIdentifier:", a3);
  if (v7)
  {
    v18 = (id)v7;

    return (WebPreferences *)v18;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)WebPreferences;
    v9 = -[WebPreferences init](&v19, sel_init);
    if (v9)
    {
      v10 = operator new();
      v11 = dispatch_queue_create("com.apple.WebPreferences.ReadWriteQueue", MEMORY[0x1E0C80D50]);
      *(_QWORD *)(v10 + 8) = 0;
      *(_QWORD *)(v10 + 16) = 0;
      *(_QWORD *)v10 = v11;
      *(_DWORD *)(v10 + 23) = 0;
      *(_QWORD *)(v10 + 28) = 0;
      *(_BYTE *)(v10 + 36) = 0;
      v9->_private = (void *)v10;
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v13 = v9->_private;
      v14 = (const void *)v13[1];
      v13[1] = v12;
      if (v14)
        CFRelease(v14);
      v15 = objc_msgSend(a3, "copy");
      v16 = v9->_private;
      v17 = (const void *)v16[2];
      v16[2] = v15;
      if (v17)
        CFRelease(v17);
      *((_BYTE *)v9->_private + 26) = 1;
      objc_msgSend((id)objc_opt_class(), "_setInstance:forIdentifier:", v9, *((_QWORD *)v9->_private + 2));
      -[WebPreferences _updatePrivateBrowsingStateTo:](v9, "_updatePrivateBrowsingStateTo:", -[WebPreferences privateBrowsingEnabled](v9, "privateBrowsingEnabled"));
      if (v4)
      {
        -[WebPreferences _postPreferencesChangedNotification](v9, "_postPreferencesChangedNotification");
        -[WebPreferences _postCacheModelChangedNotification](v9, "_postCacheModelChangedNotification");
      }
    }
    return v9;
  }
}

- (WebPreferences)initWithCoder:(id)a3
{
  WebPreferences *v4;
  uint64_t v5;
  dispatch_queue_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  const void *v12;
  uint64_t v13;
  _QWORD *v14;
  const void *v15;
  uint64_t v16;
  void *v17;
  int v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)WebPreferences;
  v4 = -[WebPreferences init](&v20, sel_init);
  if (!v4)
    return v4;
  v5 = operator new();
  v6 = dispatch_queue_create("com.apple.WebPreferences.ReadWriteQueue", MEMORY[0x1E0C80D50]);
  *(_QWORD *)(v5 + 8) = 0;
  *(_QWORD *)(v5 + 16) = 0;
  *(_QWORD *)v5 = v6;
  *(_DWORD *)(v5 + 23) = 0;
  *(_QWORD *)(v5 + 28) = 0;
  *(_BYTE *)(v5 + 36) = 0;
  v4->_private = (void *)v5;
  *(_BYTE *)(v5 + 26) = 1;
  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v7 = (void *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("Identifier"));
    v8 = objc_msgSend(a3, "decodeObjectForKey:", CFSTR("Values"));
  }
  else
  {
    v19 = 0;
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v19, 4);
    if (v19 != 1)
    {
      v7 = 0;
      v9 = 0;
      goto LABEL_8;
    }
    v7 = (void *)objc_msgSend(a3, "decodeObject");
    v8 = objc_msgSend(a3, "decodeObject");
  }
  v9 = (void *)v8;
LABEL_8:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v7, "copy");
    v11 = v4->_private;
    v12 = (const void *)v11[2];
    v11[2] = v10;
    if (v12)
      CFRelease(v12);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(v9, "mutableCopy");
    v14 = v4->_private;
    v15 = (const void *)v14[1];
    v14[1] = v13;
    if (v15)
      CFRelease(v15);
  }
  v16 = objc_msgSend((id)objc_opt_class(), "_getInstanceForIdentifier:", *((_QWORD *)v4->_private + 2));
  if (v16)
  {
    v17 = (void *)v16;

    return (WebPreferences *)v17;
  }
  objc_msgSend((id)objc_opt_class(), "_setInstance:forIdentifier:", v4, *((_QWORD *)v4->_private + 2));
  -[WebPreferences _updatePrivateBrowsingStateTo:](v4, "_updatePrivateBrowsingStateTo:", -[WebPreferences privateBrowsingEnabled](v4, "privateBrowsingEnabled"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[6];
  int v8;
  _QWORD block[6];

  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)self->_private + 2), CFSTR("Identifier"));
    v5 = *(NSObject **)self->_private;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__WebPreferences_encodeWithCoder___block_invoke;
    block[3] = &unk_1E9D6BB30;
    block[4] = a3;
    block[5] = self;
    dispatch_sync(v5, block);
  }
  else
  {
    v8 = 1;
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", &v8);
    objc_msgSend(a3, "encodeObject:", *((_QWORD *)self->_private + 2));
    v6 = *(NSObject **)self->_private;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __34__WebPreferences_encodeWithCoder___block_invoke_2;
    v7[3] = &unk_1E9D6BB30;
    v7[4] = a3;
    v7[5] = self;
    dispatch_sync(v6, v7);
  }
}

uint64_t __34__WebPreferences_encodeWithCoder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 8), CFSTR("Values"));
}

uint64_t __34__WebPreferences_encodeWithCoder___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "encodeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 8));
}

+ (WebPreferences)standardPreferences
{
  WebPreferences *result;

  if (qword_1ECEC9938 == -1)
  {
    if (_MergedGlobals_22 == 1)
      return (WebPreferences *)qword_1ECEC9940;
  }
  else
  {
    dispatch_once(&qword_1ECEC9938, &__block_literal_global_4);
    if (_MergedGlobals_22 == 1)
      return (WebPreferences *)qword_1ECEC9940;
  }
  result = 0;
  qword_1ECEC9940 = 0;
  _MergedGlobals_22 = 1;
  return result;
}

uint64_t __37__WebPreferences_standardPreferences__block_invoke()
{
  WebPreferences *v0;
  const void *v1;
  void *v2;

  v0 = -[WebPreferences initWithIdentifier:sendChangeNotification:]([WebPreferences alloc], "initWithIdentifier:sendChangeNotification:", 0, 0);
  if ((_MergedGlobals_22 & 1) != 0)
  {
    v1 = (const void *)qword_1ECEC9940;
    qword_1ECEC9940 = (uint64_t)v0;
    if (v1)
    {
      CFRelease(v1);
      if (_MergedGlobals_22 == 1)
      {
        v0 = (WebPreferences *)qword_1ECEC9940;
      }
      else
      {
        v0 = 0;
        qword_1ECEC9940 = 0;
        _MergedGlobals_22 = 1;
      }
    }
  }
  else
  {
    _MergedGlobals_22 = 1;
    qword_1ECEC9940 = (uint64_t)v0;
  }
  -[WebPreferences _postPreferencesChangedNotification](v0, "_postPreferencesChangedNotification");
  if (_MergedGlobals_22 == 1)
  {
    v2 = (void *)qword_1ECEC9940;
  }
  else
  {
    v2 = 0;
    qword_1ECEC9940 = 0;
    _MergedGlobals_22 = 1;
  }
  return objc_msgSend(v2, "setAutosaves:", 1);
}

+ (void)initialize
{
  WebCore::IOSApplication *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  const __CFString *v9;
  WTF::StringImpl *v10;
  const __CFString *v11;
  WTF::StringImpl *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  _BOOL8 v20;
  PAL *v21;
  PAL *v22;
  void *v23;
  uint64_t v24;
  WTF::StringImpl *v25;
  WTF::StringImpl *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  const char *v43;
  const char **v44;
  const char *v45;
  size_t v46;
  size_t v47;
  int v48;
  int v49;
  const char **v50;
  const char *v51;
  size_t v52;
  size_t v53;
  const char *v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  StringImpl *v91;
  uint64_t v92;
  WTF::StringImpl *v93;
  WTF::StringImpl *v94;
  int v95;
  WTF::StringImpl *v96;
  int v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  int v101;
  void *context;
  PAL *v103;
  WebCore::IOSApplication *v104;
  PAL *v105;
  uint64_t v106;
  const __CFString *v107;
  uint64_t v108;
  const __CFString *v109;
  const __CFString *v110;
  uint64_t v111;
  void *v112;
  WTF::StringImpl *v113;

  v2 = (WebCore::IOSApplication *)MEMORY[0x1E0C80A78](a1, a2);
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  {
    v5 = WebKit::defaultJavaScriptCanOpenWindowsAutomatically(void)::shouldAllowWindowOpenWithoutUserGesture != 0;
  }
  else
  {
    if (WebCore::IOSApplication::isTheSecretSocietyHiddenMystery(v2))
      v5 = WTF::linkedOnOrAfterSDKWithBehavior() ^ 1;
    else
      v5 = 0;
    WebKit::defaultJavaScriptCanOpenWindowsAutomatically(void)::shouldAllowWindowOpenWithoutUserGesture = v5;
  }
  v6 = objc_msgSend(v4, "numberWithBool:", v5);
  v7 = (int *)MEMORY[0x1E0CBEF70];
  *MEMORY[0x1E0CBEF70] += 2;
  v8 = WTF::StringImpl::operator NSString *();
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  if (v113)
    v9 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v9 = &stru_1E9D6EC48;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v10 = v113;
  if (v113)
    v11 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v11 = &stru_1E9D6EC48;
  v109 = v11;
  v110 = v9;
  v111 = v8;
  v112 = v3;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v12 = v113;
  v108 = v6;
  if (v113)
    v107 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v107 = &stru_1E9D6EC48;
  v13 = (void *)MEMORY[0x1E0CB37E8];
  {
    v14 = WebKit::defaultPassiveTouchListenersAsDefaultOnDocument(void)::result != 0;
  }
  else
  {
    v14 = WTF::linkedOnOrAfterSDKWithBehavior();
    WebKit::defaultPassiveTouchListenersAsDefaultOnDocument(void)::result = v14;
  }
  v106 = objc_msgSend(v13, "numberWithBool:", v14);
  *v7 += 2;
  v105 = (PAL *)WTF::StringImpl::operator NSString *();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", PAL::deviceClassIsSmallScreen(v105));
  v15 = (void *)MEMORY[0x1E0CB37E8];
  {
    v16 = WebKit::defaultAllowContentSecurityPolicySourceStarToMatchAnyProtocol(void)::shouldAllowContentSecurityPolicySourceStarToMatchAnyProtocol != 0;
  }
  else
  {
    v98 = overriddenWebKitLinkTimeVersion;
    if (!overriddenWebKitLinkTimeVersion)
      v98 = NSVersionOfLinkTimeLibrary("UIKit");
    v16 = HIWORD(v98) < 0xDE3u;
    WebKit::defaultAllowContentSecurityPolicySourceStarToMatchAnyProtocol(void)::shouldAllowContentSecurityPolicySourceStarToMatchAnyProtocol = HIWORD(v98) < 0xDE3u;
  }
  objc_msgSend(v15, "numberWithBool:", v16);
  v17 = (void *)MEMORY[0x1E0CB37E8];
  {
    v18 = WebKit::defaultAllowDisplayOfInsecureContent(void)::shouldAllowDisplayOfInsecureContent != 0;
  }
  else
  {
    v99 = overriddenWebKitLinkTimeVersion;
    if (!overriddenWebKitLinkTimeVersion)
      v99 = NSVersionOfLinkTimeLibrary("UIKit");
    v18 = v99 >> 17 < 0x6BF;
    WebKit::defaultAllowDisplayOfInsecureContent(void)::shouldAllowDisplayOfInsecureContent = v99 >> 17 < 0x6BF;
  }
  objc_msgSend(v17, "numberWithBool:", v18);
  v19 = (void *)MEMORY[0x1E0CB37E8];
  {
    v20 = WebKit::defaultAllowRunningOfInsecureContent(void)::shouldAllowRunningOfInsecureContent != 0;
  }
  else
  {
    v100 = overriddenWebKitLinkTimeVersion;
    if (!overriddenWebKitLinkTimeVersion)
      v100 = NSVersionOfLinkTimeLibrary("UIKit");
    v20 = v100 >> 17 < 0x6BF;
    WebKit::defaultAllowRunningOfInsecureContent(void)::shouldAllowRunningOfInsecureContent = v100 >> 17 < 0x6BF;
  }
  v21 = (PAL *)objc_msgSend(v19, "numberWithBool:", v20);
  v22 = (PAL *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", PAL::deviceClassIsSmallScreen(v21) ^ 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", PAL::deviceClassIsSmallScreen(v22));
  v23 = (void *)MEMORY[0x1E0CB37E8];
  {
    v24 = WebKit::defaultAllowsPictureInPictureMediaPlayback(void)::shouldAllowPictureInPictureMediaPlayback != 0;
  }
  else
  {
    v24 = WTF::linkedOnOrAfterSDKWithBehavior();
    WebKit::defaultAllowsPictureInPictureMediaPlayback(void)::shouldAllowPictureInPictureMediaPlayback = v24;
  }
  objc_msgSend(v23, "numberWithBool:", v24);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v25 = v113;
  if (v113)
    WTF::StringImpl::operator NSString *();
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v26 = v113;
  if (v113)
  {
    WTF::StringImpl::operator NSString *();
    v27 = (void *)MEMORY[0x1E0CB37E8];
    {
LABEL_26:
      v28 = WebKit::defaultShouldRestrictBaseURLSchemes(void)::shouldRestrictBaseURLSchemes != 0;
      goto LABEL_27;
    }
  }
  else
  {
    v27 = (void *)MEMORY[0x1E0CB37E8];
      goto LABEL_26;
  }
  v28 = WTF::linkedOnOrAfterSDKWithBehavior();
  WebKit::defaultShouldRestrictBaseURLSchemes(void)::shouldRestrictBaseURLSchemes = v28;
LABEL_27:
  objc_msgSend(v27, "numberWithBool:", v28);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  if (v113)
  {
    WTF::StringImpl::operator NSString *();
    v29 = (void *)MEMORY[0x1E0CB37E8];
    {
LABEL_29:
      v30 = WebKit::defaultShouldConvertInvalidURLsToBlank(void)::shouldConvertInvalidURLsToBlank != 0;
      goto LABEL_30;
    }
  }
  else
  {
    v29 = (void *)MEMORY[0x1E0CB37E8];
      goto LABEL_29;
  }
  v30 = WTF::linkedOnOrAfterSDKWithBehavior();
  WebKit::defaultShouldConvertInvalidURLsToBlank(void)::shouldConvertInvalidURLsToBlank = v30;
LABEL_30:
  objc_msgSend(v29, "numberWithBool:", v30);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  if (v113)
    WTF::StringImpl::operator NSString *();
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  if (v113)
    WTF::StringImpl::operator NSString *();
  v31 = (void *)MEMORY[0x1E0CB37E8];
  {
    v32 = WebKit::defaultRequiresUserGestureToLoadVideo(void)::shouldRequireUserGestureToLoadVideo != 0;
  }
  else
  {
    v32 = WTF::linkedOnOrAfterSDKWithBehavior();
    WebKit::defaultRequiresUserGestureToLoadVideo(void)::shouldRequireUserGestureToLoadVideo = v32;
  }
  v104 = (WebCore::IOSApplication *)objc_msgSend(v31, "numberWithBool:", v32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", WebCore::IOSApplication::isMobileMail(v104));
  v33 = (void *)MEMORY[0x1E0CB37E8];
  {
    v34 = WebKit::defaultWebSQLEnabled(void)::webSQLEnabled != 0;
  }
  else
  {
    v101 = WTF::linkedOnOrAfterSDKWithBehavior();
    v34 = v101 ^ 1u;
    WebKit::defaultWebSQLEnabled(void)::webSQLEnabled = v101 ^ 1;
  }
  objc_msgSend(v33, "numberWithBool:", v34);
  v35 = (void *)MEMORY[0x1E0CB37E8];
  {
    v36 = WebKit::defaultPopoverAttributeEnabled(void)::newSDK != 0;
  }
  else
  {
    v36 = WTF::linkedOnOrAfterSDKWithBehavior();
    WebKit::defaultPopoverAttributeEnabled(void)::newSDK = v36;
  }
  objc_msgSend(v35, "numberWithBool:", v36);
  v37 = (void *)MEMORY[0x1E0CB37E8];
  {
    v38 = WebKit::defaultShowModalDialogEnabled(void)::newSDK;
  }
  else
  {
    v38 = WTF::linkedOnOrAfterSDKWithBehavior();
    WebKit::defaultShowModalDialogEnabled(void)::newSDK = v38;
  }
  v103 = (PAL *)objc_msgSend(v37, "numberWithBool:", v38 == 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", PAL::deviceClassIsSmallScreen(v103) ^ 1);
  v39 = (void *)MEMORY[0x1E0CB37E8];
  {
    v40 = WebKit::defaultSearchInputIncrementalAttributeAndSearchEventEnabled(void)::newSDK;
  }
  else
  {
    v40 = WTF::linkedOnOrAfterSDKWithBehavior();
    WebKit::defaultSearchInputIncrementalAttributeAndSearchEventEnabled(void)::newSDK = v40;
  }
  objc_msgSend(v39, "numberWithBool:", v40 == 0);
  v41 = (void *)MEMORY[0x1E0CB37E8];
  v42 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
  context = (void *)MEMORY[0x1D82A8E64]();
  v43 = (const char *)objc_msgSend(v42, "UTF8String");
  if (v43)
  {
    v44 = (const char **)cacheModelForMainBundle(NSString *)::documentViewerIDs;
    do
    {
      v45 = *v44;
      if (*v44)
      {
        v46 = strlen(*v44);
        if (v46 == strlen(v43))
        {
          if (!v46)
            goto LABEL_74;
          if (*(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *(unsigned __int8 *)v45) == *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *(unsigned __int8 *)v43))
          {
            v47 = 0;
            do
            {
              if (v46 - 1 == v47)
              {
                v46 = 0;
                v10 = v113;
                v26 = v113;
                goto LABEL_212;
              }
              v48 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + v45[v47 + 1]);
              v49 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + v43[++v47]);
            }
            while (v48 == v49);
            if (v47 < v46)
              goto LABEL_51;
LABEL_60:
            v46 = 0;
LABEL_74:
            v10 = v113;
            v12 = v113;
LABEL_76:
            v25 = v113;
            v26 = v113;
            goto LABEL_212;
          }
        }
      }
      else if (!*v43)
      {
        goto LABEL_60;
      }
LABEL_51:
      ++v44;
    }
    while (v44 != (const char **)cacheModelForMainBundle(NSString *)::documentBrowserIDs);
    v50 = (const char **)cacheModelForMainBundle(NSString *)::documentBrowserIDs;
    v46 = 1;
    do
    {
      v51 = *v50;
      if (*v50)
      {
        v52 = strlen(*v50);
        if (v52 == strlen(v43))
        {
          if (!v52)
            goto LABEL_73;
          if (*(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *(unsigned __int8 *)v51) == *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *(unsigned __int8 *)v43))
          {
            v53 = 0;
            v54 = v51 + 1;
            v12 = v113;
            do
            {
              if (v52 - 1 == v53)
              {
                v7 = (int *)MEMORY[0x1E0CBEF70];
                v10 = v113;
                goto LABEL_76;
              }
              v55 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + v54[v53]);
              v56 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + v43[++v53]);
            }
            while (v55 == v56);
            if (v53 < v52)
              goto LABEL_64;
LABEL_73:
            v7 = (int *)MEMORY[0x1E0CBEF70];
            goto LABEL_74;
          }
        }
      }
      else if (!*v43)
      {
        goto LABEL_73;
      }
LABEL_64:
      ++v50;
    }
    v7 = (int *)MEMORY[0x1E0CBEF70];
    v10 = v113;
    v12 = v113;
    v25 = v113;
    v26 = v113;
    switch(strlen(v43))
    {
      case 0x12uLL:
        v57 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 99);
        if (v57 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *(unsigned __int8 *)v43))
          goto LABEL_209;
        v58 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 111);
        if (v58 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 1)))
          goto LABEL_209;
        v59 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 109);
        if (v59 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 2)))
          goto LABEL_209;
        v60 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 46);
        if (v60 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 3)))
          goto LABEL_209;
        v61 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 97);
        if (v61 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 4)))
          goto LABEL_209;
        v62 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 112);
        if (v62 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 5))
          || v62 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 6))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 52) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                    + *((unsigned __int8 *)v43 + 7))
          || v59 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 8))
          || v61 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 9))
          || v57 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 10))
          || v60 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 11))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 119) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                     + *((unsigned __int8 *)v43 + 12))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 75) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                    + *((unsigned __int8 *)v43 + 13))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 105) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                     + *((unsigned __int8 *)v43 + 14))
          || v58 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 15))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 115) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                     + *((unsigned __int8 *)v43 + 16))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 107) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                     + *((unsigned __int8 *)v43 + 17)))
        {
          goto LABEL_209;
        }
        break;
      case 0x13uLL:
        if (*(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 110) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                     + *(unsigned __int8 *)v43))
          goto LABEL_209;
        v63 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 101);
        if (v63 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 1)))
          goto LABEL_209;
        v64 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 116);
        if (v64 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 2)))
          goto LABEL_209;
        v65 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 46);
        if (v65 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 3)))
          goto LABEL_209;
        v66 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 104);
        if (v66 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 4)))
          goto LABEL_209;
        if (*(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 109) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                     + *((unsigned __int8 *)v43 + 5)))
          goto LABEL_209;
        if (*(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 100) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                     + *((unsigned __int8 *)v43 + 6)))
          goto LABEL_209;
        if (v64 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 7)))
          goto LABEL_209;
        if (*(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 45) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                    + *((unsigned __int8 *)v43 + 8)))
          goto LABEL_209;
        if (*(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 119) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                     + *((unsigned __int8 *)v43 + 9)))
          goto LABEL_209;
        if (v63 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 10)))
          goto LABEL_209;
        if (*(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 98) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                    + *((unsigned __int8 *)v43 + 11)))
          goto LABEL_209;
        if (v65 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 12)))
          goto LABEL_209;
        if (*(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 83) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                    + *((unsigned __int8 *)v43 + 13)))
          goto LABEL_209;
        if (v66 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 14)))
          goto LABEL_209;
        v67 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 105);
        if (v67 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 15))
          || v67 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 16))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 114) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                     + *((unsigned __int8 *)v43 + 17))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 97) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                    + *((unsigned __int8 *)v43 + 18)))
        {
          goto LABEL_209;
        }
        break;
      case 0x16uLL:
        if (*(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 99) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                    + *(unsigned __int8 *)v43))
          goto LABEL_209;
        v68 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 111);
        if (v68 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 1)))
          goto LABEL_209;
        v69 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 109);
        if (v69 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 2)))
          goto LABEL_209;
        v70 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 46);
        if (v70 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 3)))
          goto LABEL_209;
        if (v68 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 4)))
          goto LABEL_209;
        if (v69 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 5)))
          goto LABEL_209;
        v71 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 110);
        if (v71 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 6)))
          goto LABEL_209;
        v72 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 105);
        if (v72 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 7))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 103) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                     + *((unsigned __int8 *)v43 + 8))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 114) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                     + *((unsigned __int8 *)v43 + 9))
          || v68 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 10))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 117) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                     + *((unsigned __int8 *)v43 + 11))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 112) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                     + *((unsigned __int8 *)v43 + 12))
          || v70 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 13))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 79) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                    + *((unsigned __int8 *)v43 + 14))
          || v69 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 15))
          || v71 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 16))
          || v72 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 17))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 87) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                    + *((unsigned __int8 *)v43 + 18))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 101) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                     + *((unsigned __int8 *)v43 + 19))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 98) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                    + *((unsigned __int8 *)v43 + 20))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 53) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                    + *((unsigned __int8 *)v43 + 21)))
        {
          goto LABEL_209;
        }
        break;
      case 0x17uLL:
        v73 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 99);
        if (v73 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *(unsigned __int8 *)v43))
          goto LABEL_209;
        v74 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 111);
        if (v74 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 1)))
          goto LABEL_209;
        v75 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 109);
        if (v75 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 2)))
          goto LABEL_209;
        v76 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 46);
        if (v76 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 3)))
          goto LABEL_209;
        v77 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 97);
        if (v77 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 4))
          || (v78 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 112),
              v78 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 5)))
          || v78 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 6))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 52) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                    + *((unsigned __int8 *)v43 + 7))
          || v75 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 8))
          || v77 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 9))
          || v73 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 10))
          || v76 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 11))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 75) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                    + *((unsigned __int8 *)v43 + 12))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 105) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                     + *((unsigned __int8 *)v43 + 13))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 100) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                     + *((unsigned __int8 *)v43 + 14))
          || (v79 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 115),
              v79 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 15)))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 66) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                    + *((unsigned __int8 *)v43 + 16))
          || (v80 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 114),
              v80 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 17)))
          || v74 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 18))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 119) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                     + *((unsigned __int8 *)v43 + 19))
          || v79 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 20))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 101) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                     + *((unsigned __int8 *)v43 + 21))
          || v80 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 22)))
        {
          if (*(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 102) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                       + *((unsigned __int8 *)v43 + 4)))
            goto LABEL_209;
          v81 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 114);
          if (v81 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 5)))
            goto LABEL_209;
          v82 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 101);
          if (v82 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 6))
            || v82 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 7))
            || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 118) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                       + *((unsigned __int8 *)v43 + 8))
            || v82 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 9))
            || v81 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 10))
            || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 115) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                       + *((unsigned __int8 *)v43 + 11))
            || v82 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 12))
            || v76 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 13))
            || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 98) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                      + *((unsigned __int8 *)v43 + 14))
            || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 117) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                       + *((unsigned __int8 *)v43 + 15))
            || v75 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 16))
            || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 112) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                       + *((unsigned __int8 *)v43 + 17))
            || v82 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 18))
            || v81 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 19))
            || v73 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 20))
            || v77 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 21))
            || v81 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 22)))
          {
            goto LABEL_209;
          }
        }
        break;
      case 0x1AuLL:
        if (*(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 99) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                    + *(unsigned __int8 *)v43))
          goto LABEL_209;
        v83 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 111);
        if (v83 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 1)))
          goto LABEL_209;
        if (*(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 109) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                     + *((unsigned __int8 *)v43 + 2)))
          goto LABEL_209;
        v84 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 46);
        if (v84 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 3)))
          goto LABEL_209;
        v85 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 115);
        if (v85 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 4)))
          goto LABEL_209;
        v86 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 117);
        if (v86 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 5)))
          goto LABEL_209;
        v87 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 110);
        if (v87 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 6)))
          goto LABEL_209;
        v88 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 114);
        if (v88 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 7)))
          goto LABEL_209;
        v89 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 105);
        if (v89 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 8)))
          goto LABEL_209;
        if (v85 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 9)))
          goto LABEL_209;
        v90 = *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 101);
        if (v90 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 10))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 98) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                    + *((unsigned __int8 *)v43 + 11))
          || v88 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 12))
          || v83 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 13))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 119) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                     + *((unsigned __int8 *)v43 + 14))
          || v85 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 15))
          || v90 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 16))
          || v88 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 17))
          || v84 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 18))
          || *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + 83) != *(unsigned __int8 *)(MEMORY[0x1E0CBF868]
                                                                                    + *((unsigned __int8 *)v43 + 19))
          || v86 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 20))
          || v87 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 21))
          || v88 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 22))
          || v89 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 23))
          || v85 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 24))
          || v90 != *(unsigned __int8 *)(MEMORY[0x1E0CBF868] + *((unsigned __int8 *)v43 + 25)))
        {
          goto LABEL_209;
        }
        break;
      default:
        goto LABEL_209;
    }
    v46 = 2;
  }
  else
  {
LABEL_209:
    if (!overriddenWebKitLinkTimeVersion)
      NSVersionOfLinkTimeLibrary("UIKit");
    v46 = 0;
  }
LABEL_212:
  objc_autoreleasePoolPop(context);
  objc_msgSend(v41, "numberWithUnsignedInteger:", v46);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", 0x7FFFFFFFFFFFFFFFLL);
  v92 = objc_msgSend(v112, "dictionaryWithObjectsAndKeys:", v108, CFSTR("WebKitJavaScriptCanOpenWindowsAutomatically"), MEMORY[0x1E0C9AAA0], CFSTR("WebKitVideoPlaybackRequiresUserGesture"), MEMORY[0x1E0C9AAB0], CFSTR("WebKitMediaPlaybackRequiresUserGesture"), v111, CFSTR("WebKitFTPDirectoryTemplatePath"), MEMORY[0x1E0C9AAA0], CFSTR("WebKitAudioPlaybackRequiresUserGesture"), v110, CFSTR("WebKitFantasyFont"), MEMORY[0x1E0C9AAA0], CFSTR("WebKitRequiresPageVisibilityToPlayAudio"), MEMORY[0x1E0C9AAA0], CFSTR("WebKitPunchOutWhiteBackgroundsInDarkMode"), &unk_1E9D95A28,
          CFSTR("WebKitPitchCorrectionAlgorithm"),
          MEMORY[0x1E0C9AAA0],
          CFSTR("WebKitPictureInPictureAPIEnabled"),
          v109,
          CFSTR("WebKitFixedFont"),
          v107,
          CFSTR("WebKitPictographFont"),
          MEMORY[0x1E0C9AAA0],
          CFSTR("WebKitForceFTPDirectoryListings"),
          MEMORY[0x1E0C9AAB0],
          CFSTR("WebKitForceWebGLUsesLowPower"),
          MEMORY[0x1E0C9AAB0],
          CFSTR("WebKitEnablePasswordEchoPreferenceKey"),
          &unk_1E9D95A40,
          CFSTR("WebKitPasswordEchoDurationPreferenceKey"),
          v106,
          CFSTR("WebKitPassiveTouchListenersAsDefaultOnDocument"),
          MEMORY[0x1E0C9AAA0],
          CFSTR("WebKitPDFPluginHUDEnabled"),
          MEMORY[0x1E0C9AAA0],
          CFSTR("WebKitNeedsKeyboardEventDisambiguationQuirks"),
          MEMORY[0x1E0C9AAA0],
          CFSTR("WebKitNeedsFrameNameFallbackToIdQuirk"),
          MEMORY[0x1E0C9AAA0],
          CFSTR("WebKitNeedsAdobeFrameReloadingQuirk"),
          MEMORY[0x1E0C9AAA0],
          CFSTR("WebKitMockScrollbarsEnabled"),
          MEMORY[0x1E0C9AAA0],
          CFSTR("WebKitMockScrollbarsControllerEnabled"),
          MEMORY[0x1E0C9AAB0],
          CFSTR("WebKitHiddenPageCSSAnimationSuspensionEnabled"),
          &unk_1E9D95A58,
          CFSTR("WebKitMinimumZoomFontSizePreferenceKey"),
          &unk_1E9D95A70,
          CFSTR("WebKitMinimumLogicalFontSize"),
          &unk_1E9D95A88,
          CFSTR("WebKitMinimumFontSize"),
          MEMORY[0x1E0C9AAA0],
          CFSTR("WebKitMediaUserGestureInheritsFromDocument"),
          MEMORY[0x1E0C9AAA0],
          CFSTR("WebKitMediaStreamEnabled"),
          MEMORY[0x1E0C9AAA0],
          CFSTR("WebKitMediaPreloadingEnabled"),
          &unk_1E9D95AA0);
  if (!v113)
  {
LABEL_215:
    v93 = v113;
    if (!v113)
      goto LABEL_220;
    goto LABEL_218;
  }
  if (*(_DWORD *)v113 != 2)
  {
    *(_DWORD *)v113 -= 2;
    goto LABEL_215;
  }
  WTF::StringImpl::destroy(v113, v91);
  v93 = v113;
LABEL_218:
  if (*(_DWORD *)v93 == 2)
  {
    WTF::StringImpl::destroy(v93, v91);
    v94 = v113;
    goto LABEL_223;
  }
  *(_DWORD *)v93 -= 2;
LABEL_220:
  v94 = v113;
  if (!v113)
  {
LABEL_225:
    if (!v26)
      goto LABEL_230;
    goto LABEL_228;
  }
LABEL_223:
  if (*(_DWORD *)v94 != 2)
  {
    *(_DWORD *)v94 -= 2;
    goto LABEL_225;
  }
  WTF::StringImpl::destroy(v94, v91);
  if (!v26)
    goto LABEL_230;
LABEL_228:
  if (*(_DWORD *)v26 == 2)
  {
    WTF::StringImpl::destroy(v26, v91);
    if (!v25)
      goto LABEL_235;
    goto LABEL_233;
  }
  *(_DWORD *)v26 -= 2;
LABEL_230:
  if (!v25)
  {
LABEL_235:
    v95 = *v7 - 2;
    if (*v7 != 2)
      goto LABEL_236;
    goto LABEL_239;
  }
LABEL_233:
  if (*(_DWORD *)v25 != 2)
  {
    *(_DWORD *)v25 -= 2;
    goto LABEL_235;
  }
  WTF::StringImpl::destroy(v25, v91);
  v95 = *v7 - 2;
  if (*v7 != 2)
  {
LABEL_236:
    *v7 = v95;
    if (!v12)
      goto LABEL_242;
    goto LABEL_240;
  }
LABEL_239:
  WTF::StringImpl::destroy(MEMORY[0x1E0CBEF70], v91);
  if (!v12)
    goto LABEL_242;
LABEL_240:
  if (*(_DWORD *)v12 == 2)
  {
    WTF::StringImpl::destroy(v12, v91);
    v96 = v113;
    if (!v10)
      goto LABEL_247;
    goto LABEL_245;
  }
  *(_DWORD *)v12 -= 2;
LABEL_242:
  v96 = v113;
  if (!v10)
  {
LABEL_247:
    if (!v96)
      goto LABEL_252;
    goto LABEL_250;
  }
LABEL_245:
  if (*(_DWORD *)v10 != 2)
  {
    *(_DWORD *)v10 -= 2;
    goto LABEL_247;
  }
  WTF::StringImpl::destroy(v10, v91);
  if (!v96)
    goto LABEL_252;
LABEL_250:
  if (*(_DWORD *)v96 == 2)
  {
    WTF::StringImpl::destroy(v96, v91);
    v97 = *v7 - 2;
    if (*v7 != 2)
      goto LABEL_253;
LABEL_255:
    WTF::StringImpl::destroy(MEMORY[0x1E0CBEF70], v91);
    goto LABEL_256;
  }
  *(_DWORD *)v96 -= 2;
LABEL_252:
  v97 = *v7 - 2;
  if (*v7 == 2)
    goto LABEL_255;
LABEL_253:
  *v7 = v97;
LABEL_256:
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "registerDefaults:", v92);
}

- (void)dealloc
{
  const void **v3;
  const void *v4;
  const void *v5;
  const void *v6;
  objc_super v7;

  -[WebPreferences _updatePrivateBrowsingStateTo:](self, "_updatePrivateBrowsingStateTo:", 0);
  v3 = (const void **)self->_private;
  if (v3)
  {
    v4 = v3[2];
    v3[2] = 0;
    if (v4)
      CFRelease(v4);
    v5 = v3[1];
    v3[1] = 0;
    if (v5)
      CFRelease(v5);
    v6 = *v3;
    *v3 = 0;
    if (v6)
      CFRelease(v6);
    MEMORY[0x1D82A8D20](v3, 0x10C0C4046973748);
  }
  v7.receiver = self;
  v7.super_class = (Class)WebPreferences;
  -[WebPreferences dealloc](&v7, sel_dealloc);
}

- (NSString)identifier
{
  return (NSString *)*((_QWORD *)self->_private + 2);
}

- (id)_valueForKey:(id)a3
{
  NSObject **v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD block[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v5 = (NSObject **)self->_private;
  v6 = v5[2];
  if (v6)
  {
    v7 = (id)-[NSObject stringByAppendingString:](v6, "stringByAppendingString:", a3);
    v5 = (NSObject **)self->_private;
  }
  else
  {
    v7 = a3;
  }
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v8 = *v5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__WebPreferences__valueForKey___block_invoke;
  block[3] = &unk_1E9D6E6A0;
  block[5] = v7;
  block[6] = &v12;
  block[4] = self;
  dispatch_sync(v8, block);
  v9 = (void *)v13[5];
  if (!v9)
  {
    v9 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", v7);
    v13[5] = (uint64_t)v9;
    if (!v9 && v7 != a3)
    {
      v9 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", a3);
      v13[5] = (uint64_t)v9;
    }
  }
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __31__WebPreferences__valueForKey___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 8), "objectForKey:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

- (id)_stringValueForKey:(id)a3
{
  id v3;

  v3 = -[WebPreferences _valueForKey:](self, "_valueForKey:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return 0;
}

- (void)_setStringValue:(id)a3 forKey:(id)a4
{
  id v4;
  NSObject **v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[7];

  v4 = a4;
  if ((objc_msgSend(-[WebPreferences _stringValueForKey:](self, "_stringValueForKey:", a4), "isEqualToString:", a3) & 1) == 0)
  {
    v7 = (NSObject **)self->_private;
    v8 = v7[2];
    if (v8)
    {
      v4 = (id)-[NSObject stringByAppendingString:](v8, "stringByAppendingString:", v4);
      v7 = (NSObject **)self->_private;
    }
    v9 = *v7;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__WebPreferences__setStringValue_forKey___block_invoke;
    block[3] = &unk_1E9D6E6C8;
    block[4] = self;
    block[5] = a3;
    block[6] = v4;
    dispatch_barrier_sync(v9, block);
    if (*((_BYTE *)self->_private + 25))
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "setObject:forKey:", a3, v4);
    -[WebPreferences _postPreferencesChangedNotification](self, "_postPreferencesChangedNotification");
  }
}

uint64_t __41__WebPreferences__setStringValue_forKey___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 8), "setObject:forKey:", a1[5], a1[6]);
}

- (id)_stringArrayValueForKey:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[WebPreferences _valueForKey:](self, "_valueForKey:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          return 0;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
  return v3;
}

- (void)_setStringArrayValueForKey:(id)a3 forKey:(id)a4
{
  id v4;
  NSObject **v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[7];

  v4 = a4;
  v7 = (NSObject **)self->_private;
  v8 = v7[2];
  if (v8)
  {
    v4 = (id)-[NSObject stringByAppendingString:](v8, "stringByAppendingString:", a4);
    v7 = (NSObject **)self->_private;
  }
  v9 = *v7;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__WebPreferences__setStringArrayValueForKey_forKey___block_invoke;
  block[3] = &unk_1E9D6E6C8;
  block[4] = self;
  block[5] = a3;
  block[6] = v4;
  dispatch_barrier_sync(v9, block);
  if (*((_BYTE *)self->_private + 25))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "setObject:forKey:", a3, v4);
  -[WebPreferences _postPreferencesChangedNotification](self, "_postPreferencesChangedNotification");
}

uint64_t __52__WebPreferences__setStringArrayValueForKey_forKey___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 8), "setObject:forKey:", a1[5], a1[6]);
}

- (int)_integerValueForKey:(id)a3
{
  id v3;

  v3 = -[WebPreferences _valueForKey:](self, "_valueForKey:", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v3, "intValue");
  else
    return 0;
}

- (void)_setIntegerValue:(int)a3 forKey:(id)a4
{
  id v4;
  NSObject **v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[6];
  int v11;

  v4 = a4;
  if (-[WebPreferences _integerValueForKey:](self, "_integerValueForKey:", a4) != a3)
  {
    v7 = (NSObject **)self->_private;
    v8 = v7[2];
    if (v8)
    {
      v4 = (id)-[NSObject stringByAppendingString:](v8, "stringByAppendingString:", v4);
      v7 = (NSObject **)self->_private;
    }
    v9 = *v7;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__WebPreferences__setIntegerValue_forKey___block_invoke;
    block[3] = &unk_1E9D6E6F0;
    v11 = a3;
    block[4] = self;
    block[5] = v4;
    dispatch_barrier_sync(v9, block);
    if (*((_BYTE *)self->_private + 25))
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "setInteger:forKey:", a3, v4);
    -[WebPreferences _postPreferencesChangedNotification](self, "_postPreferencesChangedNotification");
  }
}

uint64_t __42__WebPreferences__setIntegerValue_forKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48)), *(_QWORD *)(a1 + 40));
}

- (unsigned)_unsignedIntValueForKey:(id)a3
{
  id v3;

  v3 = -[WebPreferences _valueForKey:](self, "_valueForKey:", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v3, "unsignedIntValue");
  else
    return 0;
}

- (void)_setUnsignedIntValue:(unsigned int)a3 forKey:(id)a4
{
  id v4;
  uint64_t v5;
  NSObject **v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD block[6];
  int v12;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  if (-[WebPreferences _unsignedIntValueForKey:](self, "_unsignedIntValueForKey:", a4) != a3)
  {
    v7 = (NSObject **)self->_private;
    v8 = v7[2];
    if (v8)
    {
      v4 = (id)-[NSObject stringByAppendingString:](v8, "stringByAppendingString:", v4);
      v7 = (NSObject **)self->_private;
    }
    v9 = *v7;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__WebPreferences__setUnsignedIntValue_forKey___block_invoke;
    block[3] = &unk_1E9D6E6F0;
    v12 = v5;
    block[4] = self;
    block[5] = v4;
    dispatch_barrier_sync(v9, block);
    if (*((_BYTE *)self->_private + 25))
    {
      v10 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      objc_msgSend(v10, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5), v4);
    }
    -[WebPreferences _postPreferencesChangedNotification](self, "_postPreferencesChangedNotification");
  }
}

uint64_t __46__WebPreferences__setUnsignedIntValue_forKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)), *(_QWORD *)(a1 + 40));
}

- (float)_floatValueForKey:(id)a3
{
  id v3;
  float result;

  v3 = -[WebPreferences _valueForKey:](self, "_valueForKey:", a3);
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0.0;
  objc_msgSend(v3, "floatValue");
  return result;
}

- (void)_setFloatValue:(float)a3 forKey:(id)a4
{
  float v7;
  NSObject **v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  double v12;
  _QWORD block[6];
  float v14;

  -[WebPreferences _floatValueForKey:](self, "_floatValueForKey:");
  if (v7 != a3)
  {
    v8 = (NSObject **)self->_private;
    v9 = v8[2];
    if (v9)
    {
      a4 = (id)-[NSObject stringByAppendingString:](v9, "stringByAppendingString:", a4);
      v8 = (NSObject **)self->_private;
    }
    v10 = *v8;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__WebPreferences__setFloatValue_forKey___block_invoke;
    block[3] = &unk_1E9D6E6F0;
    v14 = a3;
    block[4] = self;
    block[5] = a4;
    dispatch_barrier_sync(v10, block);
    if (*((_BYTE *)self->_private + 25))
    {
      v11 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      *(float *)&v12 = a3;
      objc_msgSend(v11, "setFloat:forKey:", a4, v12);
    }
    -[WebPreferences _postPreferencesChangedNotification](self, "_postPreferencesChangedNotification");
  }
}

uint64_t __40__WebPreferences__setFloatValue_forKey___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2), *(_QWORD *)(a1 + 40));
}

- (BOOL)_BOOLValueForKey:(id)a3
{
  return -[WebPreferences _integerValueForKey:](self, "_integerValueForKey:", a3) != 0;
}

- (void)_setBoolValue:(BOOL)a3 forKey:(id)a4
{
  id v4;
  _BOOL8 v5;
  NSObject **v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[6];
  BOOL v11;

  v4 = a4;
  v5 = a3;
  if (-[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", a4) != a3)
  {
    v7 = (NSObject **)self->_private;
    v8 = v7[2];
    if (v8)
    {
      v4 = (id)-[NSObject stringByAppendingString:](v8, "stringByAppendingString:", v4);
      v7 = (NSObject **)self->_private;
    }
    v9 = *v7;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__WebPreferences__setBoolValue_forKey___block_invoke;
    block[3] = &unk_1E9D6E718;
    v11 = v5;
    block[4] = self;
    block[5] = v4;
    dispatch_barrier_sync(v9, block);
    if (*((_BYTE *)self->_private + 25))
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "setBool:forKey:", v5, v4);
    -[WebPreferences _postPreferencesChangedNotification](self, "_postPreferencesChangedNotification");
  }
}

uint64_t __39__WebPreferences__setBoolValue_forKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48)), *(_QWORD *)(a1 + 40));
}

- (int64_t)_longLongValueForKey:(id)a3
{
  id v3;

  v3 = -[WebPreferences _valueForKey:](self, "_valueForKey:", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v3, "longLongValue");
  else
    return 0;
}

- (void)_setLongLongValue:(int64_t)a3 forKey:(id)a4
{
  id v4;
  NSObject **v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD block[7];

  v4 = a4;
  if (-[WebPreferences _longLongValueForKey:](self, "_longLongValueForKey:", a4) != a3)
  {
    v7 = (NSObject **)self->_private;
    v8 = v7[2];
    if (v8)
    {
      v4 = (id)-[NSObject stringByAppendingString:](v8, "stringByAppendingString:", v4);
      v7 = (NSObject **)self->_private;
    }
    v9 = *v7;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__WebPreferences__setLongLongValue_forKey___block_invoke;
    block[3] = &unk_1E9D6E740;
    block[5] = v4;
    block[6] = a3;
    block[4] = self;
    dispatch_barrier_sync(v9, block);
    if (*((_BYTE *)self->_private + 25))
    {
      v10 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      objc_msgSend(v10, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3), v4);
    }
    -[WebPreferences _postPreferencesChangedNotification](self, "_postPreferencesChangedNotification");
  }
}

uint64_t __43__WebPreferences__setLongLongValue_forKey___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 8), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]), a1[5]);
}

- (unint64_t)_unsignedLongLongValueForKey:(id)a3
{
  id v3;

  v3 = -[WebPreferences _valueForKey:](self, "_valueForKey:", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v3, "unsignedLongLongValue");
  else
    return 0;
}

- (void)_setUnsignedLongLongValue:(unint64_t)a3 forKey:(id)a4
{
  id v4;
  NSObject **v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD block[7];

  v4 = a4;
  if (-[WebPreferences _unsignedLongLongValueForKey:](self, "_unsignedLongLongValueForKey:", a4) != a3)
  {
    v7 = (NSObject **)self->_private;
    v8 = v7[2];
    if (v8)
    {
      v4 = (id)-[NSObject stringByAppendingString:](v8, "stringByAppendingString:", v4);
      v7 = (NSObject **)self->_private;
    }
    v9 = *v7;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__WebPreferences__setUnsignedLongLongValue_forKey___block_invoke;
    block[3] = &unk_1E9D6E740;
    block[5] = v4;
    block[6] = a3;
    block[4] = self;
    dispatch_barrier_sync(v9, block);
    if (*((_BYTE *)self->_private + 25))
    {
      v10 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      objc_msgSend(v10, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3), v4);
    }
    -[WebPreferences _postPreferencesChangedNotification](self, "_postPreferencesChangedNotification");
  }
}

uint64_t __51__WebPreferences__setUnsignedLongLongValue_forKey___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 8), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[6]), a1[5]);
}

- (NSString)standardFontFamily
{
  return (NSString *)-[WebPreferences _stringValueForKey:](self, "_stringValueForKey:", CFSTR("WebKitStandardFont"));
}

- (void)setStandardFontFamily:(NSString *)standardFontFamily
{
  -[WebPreferences _setStringValue:forKey:](self, "_setStringValue:forKey:", standardFontFamily, CFSTR("WebKitStandardFont"));
}

- (NSString)fixedFontFamily
{
  return (NSString *)-[WebPreferences _stringValueForKey:](self, "_stringValueForKey:", CFSTR("WebKitFixedFont"));
}

- (void)setFixedFontFamily:(NSString *)fixedFontFamily
{
  -[WebPreferences _setStringValue:forKey:](self, "_setStringValue:forKey:", fixedFontFamily, CFSTR("WebKitFixedFont"));
}

- (NSString)serifFontFamily
{
  return (NSString *)-[WebPreferences _stringValueForKey:](self, "_stringValueForKey:", CFSTR("WebKitSerifFont"));
}

- (void)setSerifFontFamily:(NSString *)serifFontFamily
{
  -[WebPreferences _setStringValue:forKey:](self, "_setStringValue:forKey:", serifFontFamily, CFSTR("WebKitSerifFont"));
}

- (NSString)sansSerifFontFamily
{
  return (NSString *)-[WebPreferences _stringValueForKey:](self, "_stringValueForKey:", CFSTR("WebKitSansSerifFont"));
}

- (void)setSansSerifFontFamily:(NSString *)sansSerifFontFamily
{
  -[WebPreferences _setStringValue:forKey:](self, "_setStringValue:forKey:", sansSerifFontFamily, CFSTR("WebKitSansSerifFont"));
}

- (NSString)cursiveFontFamily
{
  return (NSString *)-[WebPreferences _stringValueForKey:](self, "_stringValueForKey:", CFSTR("WebKitCursiveFont"));
}

- (void)setCursiveFontFamily:(NSString *)cursiveFontFamily
{
  -[WebPreferences _setStringValue:forKey:](self, "_setStringValue:forKey:", cursiveFontFamily, CFSTR("WebKitCursiveFont"));
}

- (NSString)fantasyFontFamily
{
  return (NSString *)-[WebPreferences _stringValueForKey:](self, "_stringValueForKey:", CFSTR("WebKitFantasyFont"));
}

- (void)setFantasyFontFamily:(NSString *)fantasyFontFamily
{
  -[WebPreferences _setStringValue:forKey:](self, "_setStringValue:forKey:", fantasyFontFamily, CFSTR("WebKitFantasyFont"));
}

- (int)defaultFontSize
{
  return -[WebPreferences _integerValueForKey:](self, "_integerValueForKey:", CFSTR("WebKitDefaultFontSize"));
}

- (void)setDefaultFontSize:(int)defaultFontSize
{
  -[WebPreferences _setIntegerValue:forKey:](self, "_setIntegerValue:forKey:", *(_QWORD *)&defaultFontSize, CFSTR("WebKitDefaultFontSize"));
}

- (int)defaultFixedFontSize
{
  return -[WebPreferences _integerValueForKey:](self, "_integerValueForKey:", CFSTR("WebKitDefaultFixedFontSize"));
}

- (void)setDefaultFixedFontSize:(int)defaultFixedFontSize
{
  -[WebPreferences _setIntegerValue:forKey:](self, "_setIntegerValue:forKey:", *(_QWORD *)&defaultFixedFontSize, CFSTR("WebKitDefaultFixedFontSize"));
}

- (int)minimumFontSize
{
  return -[WebPreferences _integerValueForKey:](self, "_integerValueForKey:", CFSTR("WebKitMinimumFontSize"));
}

- (void)setMinimumFontSize:(int)minimumFontSize
{
  -[WebPreferences _setIntegerValue:forKey:](self, "_setIntegerValue:forKey:", *(_QWORD *)&minimumFontSize, CFSTR("WebKitMinimumFontSize"));
}

- (int)minimumLogicalFontSize
{
  return -[WebPreferences _integerValueForKey:](self, "_integerValueForKey:", CFSTR("WebKitMinimumLogicalFontSize"));
}

- (void)setMinimumLogicalFontSize:(int)minimumLogicalFontSize
{
  -[WebPreferences _setIntegerValue:forKey:](self, "_setIntegerValue:forKey:", *(_QWORD *)&minimumLogicalFontSize, CFSTR("WebKitMinimumLogicalFontSize"));
}

- (NSString)defaultTextEncodingName
{
  return (NSString *)-[WebPreferences _stringValueForKey:](self, "_stringValueForKey:", CFSTR("WebKitDefaultTextEncodingName"));
}

- (void)setDefaultTextEncodingName:(NSString *)defaultTextEncodingName
{
  -[WebPreferences _setStringValue:forKey:](self, "_setStringValue:forKey:", defaultTextEncodingName, CFSTR("WebKitDefaultTextEncodingName"));
}

- (BOOL)userStyleSheetEnabled
{
  return 0;
}

- (NSURL)userStyleSheetLocation
{
  return 0;
}

- (BOOL)shouldPrintBackgrounds
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitShouldPrintBackgroundsPreferenceKey"));
}

- (void)setShouldPrintBackgrounds:(BOOL)shouldPrintBackgrounds
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", shouldPrintBackgrounds, CFSTR("WebKitShouldPrintBackgroundsPreferenceKey"));
}

- (BOOL)isJavaScriptEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitJavaScriptEnabled"));
}

- (void)setJavaScriptEnabled:(BOOL)javaScriptEnabled
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", javaScriptEnabled, CFSTR("WebKitJavaScriptEnabled"));
}

- (BOOL)javaScriptCanOpenWindowsAutomatically
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitJavaScriptCanOpenWindowsAutomatically"));
}

- (void)setJavaScriptCanOpenWindowsAutomatically:(BOOL)javaScriptCanOpenWindowsAutomatically
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", javaScriptCanOpenWindowsAutomatically, CFSTR("WebKitJavaScriptCanOpenWindowsAutomatically"));
}

- (BOOL)arePlugInsEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitLegacyPluginQuirkForMailSignaturesEnabled"));
}

- (void)setPlugInsEnabled:(BOOL)plugInsEnabled
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", plugInsEnabled, CFSTR("WebKitLegacyPluginQuirkForMailSignaturesEnabled"));
}

- (BOOL)allowsAnimatedImages
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitAllowAnimatedImagesPreferenceKey"));
}

- (void)setAllowsAnimatedImages:(BOOL)allowsAnimatedImages
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", allowsAnimatedImages, CFSTR("WebKitAllowAnimatedImagesPreferenceKey"));
}

- (BOOL)allowsAnimatedImageLooping
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitAllowAnimatedImageLoopingPreferenceKey"));
}

- (void)setAllowsAnimatedImageLooping:(BOOL)allowsAnimatedImageLooping
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", allowsAnimatedImageLooping, CFSTR("WebKitAllowAnimatedImageLoopingPreferenceKey"));
}

- (void)setLoadsImagesAutomatically:(BOOL)loadsImagesAutomatically
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", loadsImagesAutomatically, CFSTR("WebKitDisplayImagesKey"));
}

- (BOOL)loadsImagesAutomatically
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitDisplayImagesKey"));
}

- (void)setAdditionalSupportedImageTypes:(id)a3
{
  -[WebPreferences _setStringArrayValueForKey:forKey:](self, "_setStringArrayValueForKey:forKey:", a3, CFSTR("WebKitAdditionalSupportedImageTypesKey"));
}

- (NSArray)additionalSupportedImageTypes
{
  return (NSArray *)-[WebPreferences _stringArrayValueForKey:](self, "_stringArrayValueForKey:", CFSTR("WebKitAdditionalSupportedImageTypesKey"));
}

- (void)setAutosaves:(BOOL)autosaves
{
  *((_BYTE *)self->_private + 25) = autosaves;
}

- (BOOL)autosaves
{
  return *((_BYTE *)self->_private + 25);
}

- (void)setPrivateBrowsingEnabled:(BOOL)privateBrowsingEnabled
{
  _BOOL8 v3;

  v3 = privateBrowsingEnabled;
  -[WebPreferences _updatePrivateBrowsingStateTo:](self, "_updatePrivateBrowsingStateTo:");
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", v3, CFSTR("WebKitPrivateBrowsingEnabled"));
}

- (BOOL)privateBrowsingEnabled
{
  return *((_BYTE *)self->_private + 24);
}

- (void)_updatePrivateBrowsingStateTo:(BOOL)a3
{
  unsigned __int8 *v3;
  unsigned int v5;
  unint64_t v7;

  v3 = (unsigned __int8 *)self->_private;
  if (v3)
  {
    v5 = v3[24];
    if (a3 != v5)
    {
      if (a3 <= v5)
      {
        if (!--webPreferencesInstanceCountWithPrivateBrowsingEnabled)
        {
          v7 = 0x8000000000000001;
          {
            globalSessionMap(void)::map = 0;
          }
          WTF::HashMap<PAL::SessionID,std::unique_ptr<WebCore::NetworkStorageSession>,WTF::DefaultHash<PAL::SessionID>,WTF::HashTraits<PAL::SessionID>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkStorageSession>>,WTF::HashTableTraits>::remove(&globalSessionMap(void)::map, &v7);
        }
      }
      else
      {
        WebFrameNetworkingContext::ensurePrivateBrowsingSession((WebFrameNetworkingContext *)self);
        ++webPreferencesInstanceCountWithPrivateBrowsingEnabled;
      }
      *((_BYTE *)self->_private + 24) = a3;
    }
  }
}

- (void)setUsesPageCache:(BOOL)usesPageCache
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", usesPageCache, CFSTR("WebKitUsesPageCachePreferenceKey"));
}

- (BOOL)usesPageCache
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitUsesPageCachePreferenceKey"));
}

- (void)_postCacheModelChangedNotification
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v3, "postNotificationName:object:userInfo:", WebPreferencesCacheModelChangedInternalNotification, self, 0);
}

- (void)setCacheModel:(WebCacheModel)cacheModel
{
  -[WebPreferences _setIntegerValue:forKey:](self, "_setIntegerValue:forKey:", cacheModel, CFSTR("WebKitCacheModelPreferenceKey"));
  -[WebPreferences setAutomaticallyDetectsCacheModel:](self, "setAutomaticallyDetectsCacheModel:", 0);
  -[WebPreferences _postCacheModelChangedNotification](self, "_postCacheModelChangedNotification");
}

- (WebCacheModel)cacheModel
{
  return (uint64_t)-[WebPreferences _integerValueForKey:](self, "_integerValueForKey:", CFSTR("WebKitCacheModelPreferenceKey"));
}

- (void)setSuppressesIncrementalRendering:(BOOL)suppressesIncrementalRendering
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", suppressesIncrementalRendering, CFSTR("WebKitSuppressesIncrementalRendering"));
}

- (BOOL)suppressesIncrementalRendering
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitSuppressesIncrementalRendering"));
}

- (BOOL)allowsAirPlayForMediaPlayback
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitMediaPlaybackAllowsAirPlay"));
}

- (void)setAllowsAirPlayForMediaPlayback:(BOOL)allowsAirPlayForMediaPlayback
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", allowsAirPlayForMediaPlayback, CFSTR("WebKitMediaPlaybackAllowsAirPlay"));
}

- (BOOL)isJavaEnabled
{
  return 0;
}

- (BOOL)isDNSPrefetchingEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitDNSPrefetchingEnabled"));
}

- (void)setDNSPrefetchingEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitDNSPrefetchingEnabled"));
}

- (BOOL)developerExtrasEnabled
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  if ((objc_msgSend(v3, "BOOLForKey:", CFSTR("DisableWebKitDeveloperExtras")) & 1) != 0)
    return 0;
  if ((objc_msgSend(v3, "BOOLForKey:", CFSTR("WebKitDeveloperExtras")) & 1) != 0
    || (objc_msgSend(v3, "BOOLForKey:", CFSTR("IncludeDebugMenu")) & 1) != 0)
  {
    return 1;
  }
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitDeveloperExtrasEnabledPreferenceKey"));
}

- (int)javaScriptRuntimeFlags
{
  return -[WebPreferences _unsignedIntValueForKey:](self, "_unsignedIntValueForKey:", CFSTR("WebKitJavaScriptRuntimeFlagsPreferenceKey"));
}

- (void)setJavaScriptRuntimeFlags:(int)a3
{
  -[WebPreferences _setUnsignedIntValue:forKey:](self, "_setUnsignedIntValue:forKey:", *(_QWORD *)&a3, CFSTR("WebKitJavaScriptRuntimeFlagsPreferenceKey"));
}

- (void)setDeveloperExtrasEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitDeveloperExtrasEnabledPreferenceKey"));
}

- (BOOL)authorAndUserStylesEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitAuthorAndUserStylesEnabledPreferenceKey"));
}

- (void)setAuthorAndUserStylesEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitAuthorAndUserStylesEnabledPreferenceKey"));
}

- (BOOL)applicationChromeModeEnabled
{
  return 0;
}

- (BOOL)domTimersThrottlingEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitDOMTimersThrottlingEnabledPreferenceKey"));
}

- (void)setDOMTimersThrottlingEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitDOMTimersThrottlingEnabledPreferenceKey"));
}

- (BOOL)webArchiveDebugModeEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitWebArchiveDebugModeEnabledPreferenceKey"));
}

- (void)setWebArchiveDebugModeEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitWebArchiveDebugModeEnabledPreferenceKey"));
}

- (BOOL)localFileContentSniffingEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitLocalFileContentSniffingEnabledPreferenceKey"));
}

- (void)setLocalFileContentSniffingEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitLocalFileContentSniffingEnabledPreferenceKey"));
}

- (BOOL)zoomsTextOnly
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitZoomsTextOnly"));
}

- (void)setZoomsTextOnly:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitZoomsTextOnly"));
}

- (BOOL)javaScriptCanAccessClipboard
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitJavaScriptCanAccessClipboard"));
}

- (void)setJavaScriptCanAccessClipboard:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitJavaScriptCanAccessClipboard"));
}

- (BOOL)shrinksStandaloneImagesToFit
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitShrinksStandaloneImagesToFit"));
}

- (void)setShrinksStandaloneImagesToFit:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitShrinksStandaloneImagesToFit"));
}

- (BOOL)automaticallyDetectsCacheModel
{
  return *((_BYTE *)self->_private + 26);
}

- (void)setAutomaticallyDetectsCacheModel:(BOOL)a3
{
  *((_BYTE *)self->_private + 26) = a3;
}

- (BOOL)usesEncodingDetector
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitUsesEncodingDetector"));
}

- (void)setUsesEncodingDetector:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitUsesEncodingDetector"));
}

- (BOOL)isWebSecurityEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitWebSecurityEnabled"));
}

- (void)setWebSecurityEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitWebSecurityEnabled"));
}

- (BOOL)allowUniversalAccessFromFileURLs
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitAllowUniversalAccessFromFileURLs"));
}

- (void)setAllowUniversalAccessFromFileURLs:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitAllowUniversalAccessFromFileURLs"));
}

- (BOOL)allowFileAccessFromFileURLs
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitAllowFileAccessFromFileURLs"));
}

- (void)setAllowFileAccessFromFileURLs:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitAllowFileAccessFromFileURLs"));
}

- (BOOL)allowTopNavigationToDataURLs
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitAllowTopNavigationToDataURLs"));
}

- (void)setAllowTopNavigationToDataURLs:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitAllowTopNavigationToDataURLs"));
}

- (BOOL)needsStorageAccessFromFileURLsQuirk
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitNeedsStorageAccessFromFileURLsQuirk"));
}

- (void)setNeedsStorageAccessFromFileURLsQuirk:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitNeedsStorageAccessFromFileURLsQuirk"));
}

- (double)_backForwardCacheExpirationInterval
{
  float v2;

  -[WebPreferences _floatValueForKey:](self, "_floatValueForKey:", CFSTR("WebKitBackForwardCacheExpirationIntervalKey"));
  return v2;
}

- (BOOL)_standalone
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitStandalonePreferenceKey"));
}

- (void)_setStandalone:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitStandalonePreferenceKey"));
}

- (void)_setTelephoneNumberParsingEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitTelephoneParsingEnabledPreferenceKey"));
}

- (BOOL)_telephoneNumberParsingEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitTelephoneParsingEnabledPreferenceKey"));
}

- (BOOL)contentChangeObserverEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitContentChangeObserverEnabled"));
}

- (void)setContentChangeObserverEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitContentChangeObserverEnabled"));
}

- (void)_setMinimumZoomFontSize:(float)a3
{
  -[WebPreferences _setFloatValue:forKey:](self, "_setFloatValue:forKey:", CFSTR("WebKitMinimumZoomFontSizePreferenceKey"));
}

- (float)_minimumZoomFontSize
{
  float result;

  -[WebPreferences _floatValueForKey:](self, "_floatValueForKey:", CFSTR("WebKitMinimumZoomFontSizePreferenceKey"));
  return result;
}

- (void)_setTextAutosizingEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitTextAutosizingEnabled"));
}

- (BOOL)_textAutosizingEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitTextAutosizingEnabled"));
}

- (void)_setMaxParseDuration:(float)a3
{
  -[WebPreferences _setFloatValue:forKey:](self, "_setFloatValue:forKey:", CFSTR("WebKitMaxParseDurationPreferenceKey"));
}

- (float)_maxParseDuration
{
  float result;

  -[WebPreferences _floatValueForKey:](self, "_floatValueForKey:", CFSTR("WebKitMaxParseDurationPreferenceKey"));
  return result;
}

- (void)_setAllowMultiElementImplicitFormSubmission:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitAllowMultiElementImplicitFormSubmissionPreferenceKey"));
}

- (BOOL)_allowMultiElementImplicitFormSubmission
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitAllowMultiElementImplicitFormSubmissionPreferenceKey"));
}

- (void)_setAlwaysRequestGeolocationPermission:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitAlwaysRequestGeolocationPermission"));
}

- (BOOL)_alwaysRequestGeolocationPermission
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitAlwaysRequestGeolocationPermission"));
}

- (void)_setInterpolationQuality:(int)a3
{
  -[WebPreferences _setIntegerValue:forKey:](self, "_setIntegerValue:forKey:", *(_QWORD *)&a3, CFSTR("WebKitInterpolationQualityPreferenceKey"));
}

- (int)_interpolationQuality
{
  return -[WebPreferences _integerValueForKey:](self, "_integerValueForKey:", CFSTR("WebKitInterpolationQualityPreferenceKey"));
}

- (BOOL)_allowPasswordEcho
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitEnablePasswordEchoPreferenceKey"));
}

- (float)_passwordEchoDuration
{
  float result;

  -[WebPreferences _floatValueForKey:](self, "_floatValueForKey:", CFSTR("WebKitPasswordEchoDurationPreferenceKey"));
  return result;
}

- (int)editableLinkBehavior
{
  int result;

  result = -[WebPreferences _integerValueForKey:](self, "_integerValueForKey:", CFSTR("WebKitEditableLinkBehavior"));
  if (result > 4)
    return 0;
  return result;
}

- (void)setEditableLinkBehavior:(int)a3
{
  -[WebPreferences _setIntegerValue:forKey:](self, "_setIntegerValue:forKey:", *(_QWORD *)&a3, CFSTR("WebKitEditableLinkBehavior"));
}

- (int)textDirectionSubmenuInclusionBehavior
{
  int result;

  result = -[WebPreferences _integerValueForKey:](self, "_integerValueForKey:", CFSTR("WebKitTextDirectionSubmenuInclusionBehaviorPreferenceKey"));
  if (result > 2)
    return 0;
  return result;
}

- (void)setTextDirectionSubmenuInclusionBehavior:(int)a3
{
  -[WebPreferences _setIntegerValue:forKey:](self, "_setIntegerValue:forKey:", *(_QWORD *)&a3, CFSTR("WebKitTextDirectionSubmenuInclusionBehaviorPreferenceKey"));
}

- (BOOL)_useSiteSpecificSpoofing
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitUseSiteSpecificSpoofing"));
}

- (void)_setUseSiteSpecificSpoofing:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitUseSiteSpecificSpoofing"));
}

- (BOOL)databasesEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitDatabasesEnabledPreferenceKey"));
}

- (void)setDatabasesEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitDatabasesEnabledPreferenceKey"));
}

- (BOOL)storageTrackerEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitStorageTrackerEnabledPreferenceKey"));
}

- (void)setStorageTrackerEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitStorageTrackerEnabledPreferenceKey"));
}

- (BOOL)localStorageEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitLocalStorageEnabledPreferenceKey"));
}

- (void)setLocalStorageEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitLocalStorageEnabledPreferenceKey"));
}

+ (id)_getInstanceForIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id result;

  if (a3)
  {
    if (byte_1ECEC9931 == 1)
    {
      v3 = qword_1ECEC9948;
      v4 = objc_msgSend(a1, "_concatenateKeyWithIBCreatorID:");
      v5 = (void *)v3;
    }
    else
    {
      qword_1ECEC9948 = 0;
      byte_1ECEC9931 = 1;
      v4 = objc_msgSend(a1, "_concatenateKeyWithIBCreatorID:");
      v5 = 0;
    }
    return (id)objc_msgSend(v5, "objectForKey:", v4);
  }
  else if (_MergedGlobals_22 == 1)
  {
    return (id)qword_1ECEC9940;
  }
  else
  {
    result = 0;
    qword_1ECEC9940 = 0;
    _MergedGlobals_22 = 1;
  }
  return result;
}

+ (void)_setInstance:(id)a3 forIdentifier:(id)a4
{
  id v7;
  const void *v8;

  if (a4)
  {
    if ((byte_1ECEC9931 & 1) != 0)
    {
      v7 = (id)qword_1ECEC9948;
      if (qword_1ECEC9948)
      {
LABEL_6:
        objc_msgSend(v7, "setObject:forKey:", a3, objc_msgSend(a1, "_concatenateKeyWithIBCreatorID:", a4));
        return;
      }
    }
    else
    {
      qword_1ECEC9948 = 0;
      byte_1ECEC9931 = 1;
    }
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = (const void *)qword_1ECEC9948;
    qword_1ECEC9948 = (uint64_t)v7;
    if (v8)
    {
      CFRelease(v8);
      v7 = (id)qword_1ECEC9948;
    }
    goto LABEL_6;
  }
}

+ (void)_checkLastReferenceForIdentifier:(id)a3
{
  void *v4;

  if (byte_1ECEC9931 == 1)
  {
    if (objc_msgSend((id)objc_msgSend((id)qword_1ECEC9948, "objectForKey:", a3), "retainCount") != 1)
      return;
  }
  else
  {
    qword_1ECEC9948 = 0;
    byte_1ECEC9931 = 1;
    if (objc_msgSend((id)objc_msgSend(0, "objectForKey:", a3), "retainCount") != 1)
      return;
  }
  if (byte_1ECEC9931 == 1)
  {
    v4 = (void *)qword_1ECEC9948;
  }
  else
  {
    v4 = 0;
    qword_1ECEC9948 = 0;
    byte_1ECEC9931 = 1;
  }
  objc_msgSend(v4, "removeObjectForKey:", a3);
}

+ (void)_removeReferenceForIdentifier:(id)a3
{
  if (a3)
    objc_msgSend(a1, "performSelector:withObject:afterDelay:", sel__checkLastReferenceForIdentifier_, objc_msgSend(a1, "_concatenateKeyWithIBCreatorID:"), 0.1);
}

- (void)_startBatchingUpdates
{
  _DWORD *v2;
  int v3;
  int v4;

  v2 = self->_private;
  v3 = v2[8];
  if (v3)
  {
    v4 = v3 + 1;
  }
  else
  {
    *((_BYTE *)v2 + 36) = 0;
    v2 = self->_private;
    v4 = v2[8] + 1;
  }
  v2[8] = v4;
}

- (void)_stopBatchingUpdates
{
  _DWORD *v3;
  int v4;
  int v5;
  int v6;
  char v7;

  v3 = self->_private;
  v4 = v3[8];
  if (v4)
  {
    v5 = v4 - 1;
    v3[8] = v5;
    if (v5)
      return;
  }
  else
  {
    NSLog(CFSTR("ERROR: Unbalanced _startBatchingUpdates/_stopBatchingUpdates."), a2);
    v3 = self->_private;
    v6 = v3[8] - 1;
    v3[8] = v6;
    if (v6)
      return;
  }
  v7 = *((_BYTE *)v3 + 36);
  if ((v7 & 2) != 0)
  {
    if ((v7 & 1) != 0)
      -[WebPreferences _postPreferencesChangedNotification](self, "_postPreferencesChangedNotification");
    else
      -[WebPreferences _postPreferencesChangedAPINotification](self, "_postPreferencesChangedAPINotification");
  }
}

- (void)_batchUpdatePreferencesInBlock:(id)a3
{
  -[WebPreferences _startBatchingUpdates](self, "_startBatchingUpdates");
  (*((void (**)(id, WebPreferences *))a3 + 2))(a3, self);
  -[WebPreferences _stopBatchingUpdates](self, "_stopBatchingUpdates");
}

- (void)_resetForTesting
{
  id v3;
  _QWORD *v4;
  const void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = self->_private;
  v5 = (const void *)v4[1];
  v4[1] = v3;
  if (v5)
    CFRelease(v5);
  -[WebPreferences _postPreferencesChangedNotification](self, "_postPreferencesChangedNotification");
}

- (void)_postPreferencesChangedNotification
{
  _BYTE *v2;
  void *v4;
  void *v5;

  v2 = self->_private;
  if (*((_DWORD *)v2 + 8))
  {
    v2[36] |= 3u;
  }
  else
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v4, "postNotificationName:object:userInfo:", WebPreferencesChangedInternalNotification[0], self, 0);
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v5, "postNotificationName:object:userInfo:", WebPreferencesChangedNotification, self, 0);
  }
}

- (void)_postPreferencesChangedAPINotification
{
  _BYTE *v4;
  void *v5;

  if (pthread_main_np())
  {
    v4 = self->_private;
    if (*((_DWORD *)v4 + 8))
    {
      v4[36] |= 2u;
    }
    else
    {
      v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v5, "postNotificationName:object:userInfo:", WebPreferencesChangedNotification, self, 0);
    }
  }
  else
  {
    -[WebPreferences performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

+ (void)_setInitialDefaultTextEncodingToSystemEncoding
{
  PAL *v2;
  const __CFString *v3;
  StringImpl *v4;
  WTF::StringImpl *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (PAL *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = CFSTR("WebKitDefaultTextEncodingName");
  PAL::defaultTextEncodingNameForSystemLanguage(v2);
  if (v5)
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E9D6EC48;
  v7[0] = v3;
  -[PAL registerDefaults:](v2, "registerDefaults:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
}

+ (void)_setIBCreatorID:(id)a3
{
  uint64_t v3;
  const void *v4;

  v3 = objc_msgSend(a3, "copy");
  if ((byte_1ECEC9932 & 1) != 0)
  {
    v4 = (const void *)qword_1ECEC9950;
    qword_1ECEC9950 = v3;
    if (v4)
      CFRelease(v4);
  }
  else
  {
    byte_1ECEC9932 = 1;
    qword_1ECEC9950 = v3;
  }
}

- (BOOL)isDOMPasteAllowed
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitDOMPasteAllowedPreferenceKey"));
}

- (void)setDOMPasteAllowed:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitDOMPasteAllowedPreferenceKey"));
}

- (NSString)_localStorageDatabasePath
{
  return (NSString *)objc_msgSend(-[WebPreferences _stringValueForKey:](self, "_stringValueForKey:", CFSTR("WebKitLocalStorageDatabasePathPreferenceKey")), "stringByStandardizingPath");
}

- (void)_setLocalStorageDatabasePath:(id)a3
{
  -[WebPreferences _setStringValue:forKey:](self, "_setStringValue:forKey:", objc_msgSend(a3, "stringByStandardizingPath"), CFSTR("WebKitLocalStorageDatabasePathPreferenceKey"));
}

- (NSString)_ftpDirectoryTemplatePath
{
  return (NSString *)objc_msgSend(-[WebPreferences _stringValueForKey:](self, "_stringValueForKey:", CFSTR("WebKitFTPDirectoryTemplatePath")), "stringByStandardizingPath");
}

- (void)_setFTPDirectoryTemplatePath:(id)a3
{
  -[WebPreferences _setStringValue:forKey:](self, "_setStringValue:forKey:", objc_msgSend(a3, "stringByStandardizingPath"), CFSTR("WebKitFTPDirectoryTemplatePath"));
}

- (BOOL)_forceFTPDirectoryListings
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitForceFTPDirectoryListings"));
}

- (void)_setForceFTPDirectoryListings:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitForceFTPDirectoryListings"));
}

- (BOOL)acceleratedDrawingEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitAcceleratedDrawingEnabled"));
}

- (void)setAcceleratedDrawingEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitAcceleratedDrawingEnabled"));
}

- (BOOL)resourceLoadStatisticsEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitResourceLoadStatisticsEnabled"));
}

- (void)setResourceLoadStatisticsEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitResourceLoadStatisticsEnabled"));
}

- (BOOL)largeImageAsyncDecodingEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitLargeImageAsyncDecodingEnabled"));
}

- (void)setLargeImageAsyncDecodingEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitLargeImageAsyncDecodingEnabled"));
}

- (BOOL)animatedImageAsyncDecodingEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitAnimatedImageAsyncDecodingEnabled"));
}

- (void)setAnimatedImageAsyncDecodingEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitAnimatedImageAsyncDecodingEnabled"));
}

- (BOOL)canvasUsesAcceleratedDrawing
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitCanvasUsesAcceleratedDrawing"));
}

- (void)setCanvasUsesAcceleratedDrawing:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitCanvasUsesAcceleratedDrawing"));
}

- (BOOL)acceleratedCompositingEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitAcceleratedCompositingEnabled"));
}

- (void)setAcceleratedCompositingEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitAcceleratedCompositingEnabled"));
}

- (BOOL)showDebugBorders
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitShowDebugBorders"));
}

- (void)setShowDebugBorders:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitShowDebugBorders"));
}

- (BOOL)legacyLineLayoutVisualCoverageEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitLegacyLineLayoutVisualCoverageEnabled"));
}

- (void)setLegacyLineLayoutVisualCoverageEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitLegacyLineLayoutVisualCoverageEnabled"));
}

- (BOOL)showRepaintCounter
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitShowRepaintCounter"));
}

- (void)setShowRepaintCounter:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitShowRepaintCounter"));
}

- (BOOL)webAudioEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitWebAudioEnabled"));
}

- (void)setWebAudioEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitWebAudioEnabled"));
}

- (BOOL)webGLEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitWebGLEnabled"));
}

- (void)setWebGLEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitWebGLEnabled"));
}

- (BOOL)forceLowPowerGPUForWebGL
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitForceWebGLUsesLowPower"));
}

- (void)setForceWebGLUsesLowPower:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitForceWebGLUsesLowPower"));
}

- (BOOL)asyncFrameScrollingEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitAsyncFrameScrollingEnabled"));
}

- (void)setAsyncFrameScrollingEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitAsyncFrameScrollingEnabled"));
}

- (BOOL)isSpatialNavigationEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitSpatialNavigationEnabled"));
}

- (void)setSpatialNavigationEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitSpatialNavigationEnabled"));
}

- (BOOL)hyperlinkAuditingEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitHyperlinkAuditingEnabled"));
}

- (void)setHyperlinkAuditingEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitHyperlinkAuditingEnabled"));
}

- (BOOL)usePreHTML5ParserQuirks
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitUsePreHTML5ParserQuirks"));
}

- (void)setUsePreHTML5ParserQuirks:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitUsePreHTML5ParserQuirks"));
}

- (void)didRemoveFromWebView
{
  _DWORD *v2;
  int v3;
  void *v5;

  v2 = self->_private;
  v3 = v2[7] - 1;
  v2[7] = v3;
  if (!v3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v5, "postNotificationName:object:userInfo:", WebPreferencesRemovedNotification[0], self, 0);
  }
}

- (void)willAddToWebView
{
  ++*((_DWORD *)self->_private + 7);
}

- (void)setFullScreenEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitFullScreenEnabled"));
}

- (BOOL)fullScreenEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitFullScreenEnabled"));
}

- (void)setAsynchronousSpellCheckingEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitAsynchronousSpellCheckingEnabled"));
}

- (BOOL)asynchronousSpellCheckingEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitAsynchronousSpellCheckingEnabled"));
}

+ (void)setWebKitLinkTimeVersion:(int)a3
{
  overriddenWebKitLinkTimeVersion = a3;
}

- (void)setAVFoundationEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitAVFoundationEnabled"));
}

- (BOOL)isAVFoundationEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitAVFoundationEnabled"));
}

- (BOOL)isAVFoundationNSURLSessionEnabled
{
  return 1;
}

- (BOOL)isInheritURIQueryComponentEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitEnableInheritURIQueryComponent"));
}

- (void)setEnableInheritURIQueryComponent:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitEnableInheritURIQueryComponent"));
}

- (BOOL)mediaPlaybackAllowsAirPlay
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitMediaPlaybackAllowsAirPlay"));
}

- (void)setMediaPlaybackAllowsAirPlay:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitMediaPlaybackAllowsAirPlay"));
}

- (unsigned)audioSessionCategoryOverride
{
  return -[WebPreferences _unsignedIntValueForKey:](self, "_unsignedIntValueForKey:", CFSTR("WebKitAudioSessionCategoryOverride"));
}

- (void)setAudioSessionCategoryOverride:(unsigned int)a3
{
  if (a3 >= 7)
  {
    if ((int)a3 > 1886547810)
    {
      switch(a3)
      {
        case 0x70726F63u:
          *(_QWORD *)&a3 = 6;
          goto LABEL_7;
        case 0x72656361u:
          *(_QWORD *)&a3 = 4;
          goto LABEL_7;
        case 0x736F6C6Fu:
          *(_QWORD *)&a3 = 2;
          goto LABEL_7;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x616D6269u:
          *(_QWORD *)&a3 = 1;
          goto LABEL_7;
        case 0x6D656469u:
          *(_QWORD *)&a3 = 3;
          goto LABEL_7;
        case 0x706C6172u:
          *(_QWORD *)&a3 = 5;
          goto LABEL_7;
      }
    }
    *(_QWORD *)&a3 = 0;
  }
LABEL_7:
  -[WebPreferences _setUnsignedIntValue:forKey:](self, "_setUnsignedIntValue:forKey:", *(_QWORD *)&a3, CFSTR("WebKitAudioSessionCategoryOverride"));
}

- (BOOL)networkDataUsageTrackingEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitNetworkDataUsageTrackingEnabledPreferenceKey"));
}

- (void)setNetworkDataUsageTrackingEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitNetworkDataUsageTrackingEnabledPreferenceKey"));
}

- (NSString)networkInterfaceName
{
  return (NSString *)-[WebPreferences _stringValueForKey:](self, "_stringValueForKey:", CFSTR("WebKitNetworkInterfaceNamePreferenceKey"));
}

- (void)setNetworkInterfaceName:(id)a3
{
  -[WebPreferences _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("WebKitNetworkInterfaceNamePreferenceKey"));
}

- (BOOL)mediaPlaybackRequiresUserGesture
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitMediaPlaybackRequiresUserGesture"));
}

- (void)setMediaPlaybackRequiresUserGesture:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitMediaPlaybackRequiresUserGesture"));
}

- (BOOL)videoPlaybackRequiresUserGesture
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitVideoPlaybackRequiresUserGesture"));
}

- (void)setVideoPlaybackRequiresUserGesture:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitVideoPlaybackRequiresUserGesture"));
}

- (BOOL)audioPlaybackRequiresUserGesture
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitAudioPlaybackRequiresUserGesture"));
}

- (void)setAudioPlaybackRequiresUserGesture:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitAudioPlaybackRequiresUserGesture"));
}

- (BOOL)overrideUserGestureRequirementForMainContent
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitMainContentUserGestureOverrideEnabled"));
}

- (void)setOverrideUserGestureRequirementForMainContent:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitMainContentUserGestureOverrideEnabled"));
}

- (BOOL)mediaPlaybackAllowsInline
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitMediaPlaybackAllowsInline"));
}

- (void)setMediaPlaybackAllowsInline:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitMediaPlaybackAllowsInline"));
}

- (BOOL)inlineMediaPlaybackRequiresPlaysInlineAttribute
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("InlineMediaPlaybackRequiresPlaysInlineAttribute"));
}

- (void)setInlineMediaPlaybackRequiresPlaysInlineAttribute:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("InlineMediaPlaybackRequiresPlaysInlineAttribute"));
}

- (BOOL)invisibleAutoplayNotPermitted
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("InvisibleAutoplayNotPermitted"));
}

- (void)setInvisibleAutoplayNotPermitted:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("InvisibleAutoplayNotPermitted"));
}

- (BOOL)mediaControlsScaleWithPageZoom
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitMediaControlsScaleWithPageZoom"));
}

- (void)setMediaControlsScaleWithPageZoom:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitMediaControlsScaleWithPageZoom"));
}

- (BOOL)allowsPictureInPictureMediaPlayback
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitAllowsPictureInPictureMediaPlayback"));
}

- (void)setAllowsPictureInPictureMediaPlayback:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitAllowsPictureInPictureMediaPlayback"));
}

- (BOOL)mockScrollbarsEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitMockScrollbarsEnabled"));
}

- (void)setMockScrollbarsEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitMockScrollbarsEnabled"));
}

- (NSString)pictographFontFamily
{
  return (NSString *)-[WebPreferences _stringValueForKey:](self, "_stringValueForKey:", CFSTR("WebKitPictographFont"));
}

- (void)setPictographFontFamily:(id)a3
{
  -[WebPreferences _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("WebKitPictographFont"));
}

- (BOOL)pageCacheSupportsPlugins
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitPageCacheSupportsPluginsPreferenceKey"));
}

- (void)setPageCacheSupportsPlugins:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitPageCacheSupportsPluginsPreferenceKey"));
}

- (void)_invalidateCachedPreferences
{
  NSObject *v3;
  _QWORD block[5];

  v3 = *(NSObject **)self->_private;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__WebPreferences_WebPrivate___invalidateCachedPreferences__block_invoke;
  block[3] = &unk_1E9D6B978;
  block[4] = self;
  dispatch_barrier_sync(v3, block);
  -[WebPreferences _updatePrivateBrowsingStateTo:](self, "_updatePrivateBrowsingStateTo:", -[WebPreferences privateBrowsingEnabled](self, "privateBrowsingEnabled"));
  -[WebPreferences _postPreferencesChangedNotification](self, "_postPreferencesChangedNotification");
}

void __58__WebPreferences_WebPrivate___invalidateCachedPreferences__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  const void *v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(const void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = v2;
    if (v4)
      CFRelease(v4);
  }
}

- (void)_synchronizeWebStoragePolicyWithCookiePolicy
{
  int v3;
  uint64_t v4;

  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C92C08], "sharedHTTPCookieStorage"), "cookieAcceptPolicy");
  if ((v3 & 0xFFFFFFFC) != 0)
    v4 = 2;
  else
    v4 = dword_1D80FBD00[v3];
  -[WebPreferences setStorageBlockingPolicy:](self, "setStorageBlockingPolicy:", v4);
}

- (void)setBackspaceKeyNavigationEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitBackspaceKeyNavigationEnabled"));
}

- (BOOL)backspaceKeyNavigationEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitBackspaceKeyNavigationEnabled"));
}

- (void)setWantsBalancedSetDefersLoadingBehavior:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitWantsBalancedSetDefersLoadingBehavior"));
}

- (BOOL)wantsBalancedSetDefersLoadingBehavior
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitWantsBalancedSetDefersLoadingBehavior"));
}

- (void)setShouldDisplaySubtitles:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitShouldDisplaySubtitles"));
}

- (BOOL)shouldDisplaySubtitles
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitShouldDisplaySubtitles"));
}

- (void)setShouldDisplayCaptions:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitShouldDisplayCaptions"));
}

- (BOOL)shouldDisplayCaptions
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitShouldDisplayCaptions"));
}

- (void)setShouldDisplayTextDescriptions:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitShouldDisplayTextDescriptions"));
}

- (BOOL)shouldDisplayTextDescriptions
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitShouldDisplayTextDescriptions"));
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitNotificationsEnabled"));
}

- (BOOL)notificationsEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitNotificationsEnabled"));
}

- (void)setShouldRespectImageOrientation:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitShouldRespectImageOrientation"));
}

- (BOOL)shouldRespectImageOrientation
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitShouldRespectImageOrientation"));
}

- (void)setIncrementalRenderingSuppressionTimeoutInSeconds:(double)a3
{
  *(float *)&a3 = a3;
  -[WebPreferences _setFloatValue:forKey:](self, "_setFloatValue:forKey:", CFSTR("WebKitIncrementalRenderingSuppressionTimeoutInSeconds"), a3);
}

- (double)incrementalRenderingSuppressionTimeoutInSeconds
{
  float v2;

  -[WebPreferences _floatValueForKey:](self, "_floatValueForKey:", CFSTR("WebKitIncrementalRenderingSuppressionTimeoutInSeconds"));
  return v2;
}

- (BOOL)diagnosticLoggingEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitDiagnosticLoggingEnabled"));
}

- (void)setDiagnosticLoggingEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitDiagnosticLoggingEnabled"));
}

- (void)setStorageBlockingPolicy:(int)a3
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v3 = *(_QWORD *)&a3;
  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = CFSTR("WebKitStorageBlockingPolicy");
  v6[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  objc_msgSend(v4, "registerDefaults:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
}

- (int)storageBlockingPolicy
{
  return -[WebPreferences _integerValueForKey:](self, "_integerValueForKey:", CFSTR("WebKitStorageBlockingPolicy"));
}

- (BOOL)plugInSnapshottingEnabled
{
  return 0;
}

- (BOOL)hiddenPageDOMTimerThrottlingEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitHiddenPageDOMTimerThrottlingEnabled"));
}

- (void)setHiddenPageDOMTimerThrottlingEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitHiddenPageDOMTimerThrottlingEnabled"));
}

- (BOOL)hiddenPageCSSAnimationSuspensionEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitHiddenPageCSSAnimationSuspensionEnabled"));
}

- (void)setHiddenPageCSSAnimationSuspensionEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitHiddenPageCSSAnimationSuspensionEnabled"));
}

- (BOOL)lowPowerVideoAudioBufferSizeEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitLowPowerVideoAudioBufferSizeEnabled"));
}

- (void)setLowPowerVideoAudioBufferSizeEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitLowPowerVideoAudioBufferSizeEnabled"));
}

- (BOOL)mediaSourceEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitMediaSourceEnabled"));
}

- (void)setMediaSourceEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitMediaSourceEnabled"));
}

- (BOOL)sourceBufferChangeTypeEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitSourceBufferChangeTypeEnabled"));
}

- (void)setSourceBufferChangeTypeEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitSourceBufferChangeTypeEnabled"));
}

- (BOOL)imageControlsEnabled
{
  return 0;
}

- (BOOL)serviceControlsEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitServiceControlsEnabled"));
}

- (void)setServiceControlsEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitServiceControlsEnabled"));
}

- (BOOL)gamepadsEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitGamepadsEnabled"));
}

- (void)setGamepadsEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitGamepadsEnabled"));
}

- (BOOL)shouldConvertPositionStyleOnCopy
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitShouldConvertPositionStyleOnCopy"));
}

- (void)setShouldConvertPositionStyleOnCopy:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitShouldConvertPositionStyleOnCopy"));
}

- (NSString)mediaKeysStorageDirectory
{
  return (NSString *)objc_msgSend(-[WebPreferences _stringValueForKey:](self, "_stringValueForKey:", CFSTR("WebKitMediaKeysStorageDirectory")), "stringByStandardizingPath");
}

- (void)setMediaKeysStorageDirectory:(id)a3
{
  -[WebPreferences _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("WebKitMediaKeysStorageDirectory"));
}

- (BOOL)mediaDevicesEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitMediaDevicesEnabled"));
}

- (void)setMediaDevicesEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitMediaDevicesEnabled"));
}

- (BOOL)mediaStreamEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitMediaStreamEnabled"));
}

- (void)setMediaStreamEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitMediaStreamEnabled"));
}

- (BOOL)peerConnectionEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitPeerConnectionEnabled"));
}

- (void)setPeerConnectionEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitPeerConnectionEnabled"));
}

- (BOOL)linkPreloadEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitLinkPreloadEnabled"));
}

- (void)setLinkPreloadEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitLinkPreloadEnabled"));
}

- (BOOL)mediaPreloadingEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitMediaPreloadingEnabled"));
}

- (void)setMediaPreloadingEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitMediaPreloadingEnabled"));
}

- (void)setHTTPEquivEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitHTTPEquivEnabled"));
}

- (BOOL)httpEquivEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitHTTPEquivEnabled"));
}

- (BOOL)javaScriptMarkupEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitJavaScriptMarkupEnabled"));
}

- (void)setJavaScriptMarkupEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitJavaScriptMarkupEnabled"));
}

- (BOOL)mediaDataLoadsAutomatically
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitMediaDataLoadsAutomatically"));
}

- (void)setMediaDataLoadsAutomatically:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitMediaDataLoadsAutomatically"));
}

- (BOOL)attachmentElementEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitAttachmentElementEnabled"));
}

- (void)setAttachmentElementEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitAttachmentElementEnabled"));
}

- (BOOL)allowsInlineMediaPlaybackAfterFullscreen
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitAllowsInlineMediaPlaybackAfterFullscreen"));
}

- (void)setAllowsInlineMediaPlaybackAfterFullscreen:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitAllowsInlineMediaPlaybackAfterFullscreen"));
}

- (BOOL)mockCaptureDevicesEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitMockCaptureDevicesEnabled"));
}

- (void)setMockCaptureDevicesEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitMockCaptureDevicesEnabled"));
}

- (BOOL)mockCaptureDevicesPromptEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitMockCaptureDevicesPromptEnabled"));
}

- (void)setMockCaptureDevicesPromptEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitMockCaptureDevicesPromptEnabled"));
}

- (BOOL)enumeratingAllNetworkInterfacesEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitEnumeratingAllNetworkInterfacesEnabled"));
}

- (void)setEnumeratingAllNetworkInterfacesEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitEnumeratingAllNetworkInterfacesEnabled"));
}

- (BOOL)iceCandidateFilteringEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitICECandidateFilteringEnabled"));
}

- (void)setIceCandidateFilteringEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitICECandidateFilteringEnabled"));
}

- (BOOL)mediaCaptureRequiresSecureConnection
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitMediaCaptureRequiresSecureConnection"));
}

- (void)setMediaCaptureRequiresSecureConnection:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitMediaCaptureRequiresSecureConnection"));
}

- (BOOL)dataTransferItemsEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitDataTransferItemsEnabled"));
}

- (void)setDataTransferItemsEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitDataTransferItemsEnabled"));
}

- (BOOL)customPasteboardDataEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitCustomPasteboardDataEnabled"));
}

- (void)setCustomPasteboardDataEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitCustomPasteboardDataEnabled"));
}

- (BOOL)cacheAPIEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitCacheAPIEnabled"));
}

- (void)setCacheAPIEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitCacheAPIEnabled"));
}

- (BOOL)downloadAttributeEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitDownloadAttributeEnabled"));
}

- (void)setDownloadAttributeEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitDownloadAttributeEnabled"));
}

- (void)setDirectoryUploadEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitDirectoryUploadEnabled"));
}

- (BOOL)directoryUploadEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitDirectoryUploadEnabled"));
}

- (BOOL)CSSOMViewScrollingAPIEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitCSSOMViewScrollingAPIEnabled"));
}

- (void)setCSSOMViewScrollingAPIEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitCSSOMViewScrollingAPIEnabled"));
}

- (BOOL)mediaUserGestureInheritsFromDocument
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitMediaUserGestureInheritsFromDocument"));
}

- (void)setMediaUserGestureInheritsFromDocument:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitMediaUserGestureInheritsFromDocument"));
}

- (BOOL)quickLookDocumentSavingEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitQuickLookDocumentSavingPreferenceKey"));
}

- (void)setQuickLookDocumentSavingEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitQuickLookDocumentSavingPreferenceKey"));
}

- (NSString)mediaContentTypesRequiringHardwareSupport
{
  return (NSString *)-[WebPreferences _stringValueForKey:](self, "_stringValueForKey:", CFSTR("WebKitMediaContentTypesRequiringHardwareSupport"));
}

- (void)setMediaContentTypesRequiringHardwareSupport:(id)a3
{
  -[WebPreferences _setStringValue:forKey:](self, "_setStringValue:forKey:", a3, CFSTR("WebKitMediaContentTypesRequiringHardwareSupport"));
}

- (BOOL)legacyEncryptedMediaAPIEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitLegacyEncryptedMediaAPIEnabled"));
}

- (void)setLegacyEncryptedMediaAPIEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitLegacyEncryptedMediaAPIEnabled"));
}

- (BOOL)encryptedMediaAPIEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitEncryptedMediaAPIEnabled"));
}

- (void)setEncryptedMediaAPIEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitEncryptedMediaAPIEnabled"));
}

- (BOOL)pictureInPictureAPIEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitPictureInPictureAPIEnabled"));
}

- (void)setPictureInPictureAPIEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitPictureInPictureAPIEnabled"));
}

- (BOOL)colorFilterEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitColorFilterEnabled"));
}

- (void)setColorFilterEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitColorFilterEnabled"));
}

- (BOOL)punchOutWhiteBackgroundsInDarkMode
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitPunchOutWhiteBackgroundsInDarkMode"));
}

- (void)setPunchOutWhiteBackgroundsInDarkMode:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitPunchOutWhiteBackgroundsInDarkMode"));
}

- (BOOL)allowMediaContentTypesRequiringHardwareSupportAsFallback
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitAllowMediaContentTypesRequiringHardwareSupportAsFallback"));
}

- (void)setAllowMediaContentTypesRequiringHardwareSupportAsFallback:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitAllowMediaContentTypesRequiringHardwareSupportAsFallback"));
}

- (BOOL)mediaCapabilitiesEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitMediaCapabilitiesEnabled"));
}

- (void)setMediaCapabilitiesEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitMediaCapabilitiesEnabled"));
}

- (BOOL)layoutFormattingContextIntegrationEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitLayoutFormattingContextIntegrationEnabled"));
}

- (void)setLayoutFormattingContextIntegrationEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitLayoutFormattingContextIntegrationEnabled"));
}

- (BOOL)isInAppBrowserPrivacyEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitDebugInAppBrowserPrivacyEnabled"));
}

- (void)setInAppBrowserPrivacyEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitDebugInAppBrowserPrivacyEnabled"));
}

- (BOOL)webSQLEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitWebSQLEnabled"));
}

- (void)setWebSQLEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitWebSQLEnabled"));
}

+ (id)_IBCreatorID
{
  id result;

  if (byte_1ECEC9932 == 1)
    return (id)qword_1ECEC9950;
  result = 0;
  qword_1ECEC9950 = 0;
  byte_1ECEC9932 = 1;
  return result;
}

+ (id)_concatenateKeyWithIBCreatorID:(id)a3
{
  id v4;

  v4 = +[WebPreferences _IBCreatorID](WebPreferences, "_IBCreatorID");
  if (v4)
    return (id)objc_msgSend(v4, "stringByAppendingString:", a3);
  else
    return a3;
}

- (BOOL)_isEnabledForFeature:(id)a3
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", objc_msgSend(a3, "preferenceKey"));
}

- (void)_setEnabled:(BOOL)a3 forFeature:(id)a4
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, objc_msgSend(a4, "preferenceKey"));
}

+ (void)_switchNetworkLoaderToNewTestingSession
{
  NetworkStorageSessionMap *v2;

  v2 = (NetworkStorageSessionMap *)WebThreadLock();
  NetworkStorageSessionMap::switchToNewTestingSession(v2);
}

+ (void)_setCurrentNetworkLoaderSessionCookieAcceptPolicy:(unint64_t)a3
{
  WebCore::NetworkStorageSession *v3;
  WebCore::NetworkStorageSession *v4;
  SessionID v5;
  uint64_t v6;
  void *v7;
  CFTypeRef cf;

  {
    v3 = (WebCore::NetworkStorageSession *)defaultNetworkStorageSession(void)::session;
    if (defaultNetworkStorageSession(void)::session)
      goto LABEL_8;
  }
  else
  {
    defaultNetworkStorageSession(void)::session = 0;
  }
  v4 = (WebCore::NetworkStorageSession *)WTF::fastMalloc((WTF *)0x128);
  v5.m_identifier = 1;
  v3 = (WebCore::NetworkStorageSession *)WebCore::NetworkStorageSession::NetworkStorageSession(v4, v5);
  {
    v6 = defaultNetworkStorageSession(void)::session;
    defaultNetworkStorageSession(void)::session = (uint64_t)v3;
    if (v6)
    {
      MEMORY[0x1D82A5C18](v6);
      if (*(_DWORD *)(v6 + 8))
      {
        *(_QWORD *)(v6 + 288) = 0;
        *(_OWORD *)(v6 + 256) = 0u;
        *(_OWORD *)(v6 + 272) = 0u;
        *(_OWORD *)(v6 + 224) = 0u;
        *(_OWORD *)(v6 + 240) = 0u;
        *(_OWORD *)(v6 + 192) = 0u;
        *(_OWORD *)(v6 + 208) = 0u;
        *(_OWORD *)(v6 + 160) = 0u;
        *(_OWORD *)(v6 + 176) = 0u;
        *(_OWORD *)(v6 + 128) = 0u;
        *(_OWORD *)(v6 + 144) = 0u;
        *(_OWORD *)(v6 + 96) = 0u;
        *(_OWORD *)(v6 + 112) = 0u;
        *(_OWORD *)(v6 + 64) = 0u;
        *(_OWORD *)(v6 + 80) = 0u;
        *(_OWORD *)(v6 + 32) = 0u;
        *(_OWORD *)(v6 + 48) = 0u;
        *(_OWORD *)v6 = 0u;
        *(_OWORD *)(v6 + 16) = 0u;
      }
      else
      {
        WTF::fastFree((WTF *)v6, v7);
      }
      v3 = (WebCore::NetworkStorageSession *)defaultNetworkStorageSession(void)::session;
    }
LABEL_8:
    WebCore::NetworkStorageSession::cookieStorage(v3);
    if (cf)
      goto LABEL_9;
LABEL_15:
    __break(0xC471u);
    return;
  }
  defaultNetworkStorageSession(void)::session = (uint64_t)v3;
  WebCore::NetworkStorageSession::cookieStorage(v3);
  if (!cf)
    goto LABEL_15;
LABEL_9:
  CFHTTPCookieStorageSetCookieAcceptPolicy();
  CFRelease(cf);
}

+ (void)_clearNetworkLoaderSession:(id)a3
{
  WebCore::NetworkStorageSession *v4;
  SessionID v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;

  {
    if (defaultNetworkStorageSession(void)::session)
      goto LABEL_7;
  }
  else
  {
    defaultNetworkStorageSession(void)::session = 0;
  }
  v4 = (WebCore::NetworkStorageSession *)WTF::fastMalloc((WTF *)0x128);
  v5.m_identifier = 1;
  WebCore::NetworkStorageSession::NetworkStorageSession(v4, v5);
  {
    v6 = defaultNetworkStorageSession(void)::session;
    defaultNetworkStorageSession(void)::session = (uint64_t)v4;
    if (!v6)
      goto LABEL_7;
    v7 = MEMORY[0x1D82A5C18]();
    if (*(_DWORD *)(v7 + 8))
    {
      *(_QWORD *)(v7 + 288) = 0;
      *(_OWORD *)(v7 + 256) = 0u;
      *(_OWORD *)(v7 + 272) = 0u;
      *(_OWORD *)(v7 + 224) = 0u;
      *(_OWORD *)(v7 + 240) = 0u;
      *(_OWORD *)(v7 + 192) = 0u;
      *(_OWORD *)(v7 + 208) = 0u;
      *(_OWORD *)(v7 + 160) = 0u;
      *(_OWORD *)(v7 + 176) = 0u;
      *(_OWORD *)(v7 + 128) = 0u;
      *(_OWORD *)(v7 + 144) = 0u;
      *(_OWORD *)(v7 + 96) = 0u;
      *(_OWORD *)(v7 + 112) = 0u;
      *(_OWORD *)(v7 + 64) = 0u;
      *(_OWORD *)(v7 + 80) = 0u;
      *(_OWORD *)(v7 + 32) = 0u;
      *(_OWORD *)(v7 + 48) = 0u;
      *(_OWORD *)v7 = 0u;
      *(_OWORD *)(v7 + 16) = 0u;
        goto LABEL_7;
    }
    else
    {
      WTF::fastFree((WTF *)v7, v8);
        goto LABEL_7;
    }
    defaultNetworkStorageSession(void)::session = 0;
  }
  else
  {
    defaultNetworkStorageSession(void)::session = (uint64_t)v4;
  }
LABEL_7:
  v9 = _Block_copy(a3);
  v10 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v10 = off_1E9D6E860;
  v10[1] = v9;
  v11 = v10;
  WebCore::NetworkStorageSession::deleteAllCookies();
  if (v11)
    (*(void (**)(_QWORD *))(*v11 + 8))(v11);
  _Block_release(0);
}

- (void)_setDoublePreferenceForTestingWithValue:(double)a3 forKey:(id)a4
{
  *(float *)&a3 = a3;
  -[WebPreferences _setFloatValue:forKey:](self, "_setFloatValue:forKey:", a4, a3);
}

- (BOOL)userGesturePromisePropagationEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitUserGesturePromisePropagationEnabled"));
}

- (void)setUserGesturePromisePropagationEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitUserGesturePromisePropagationEnabled"));
}

- (BOOL)requestIdleCallbackEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitRequestIdleCallbackEnabled"));
}

- (void)setRequestIdleCallbackEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitRequestIdleCallbackEnabled"));
}

- (BOOL)highlightAPIEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitHighlightAPIEnabled"));
}

- (void)setHighlightAPIEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitHighlightAPIEnabled"));
}

- (BOOL)asyncClipboardAPIEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitAsyncClipboardAPIEnabled"));
}

- (void)setAsyncClipboardAPIEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitAsyncClipboardAPIEnabled"));
}

- (BOOL)contactPickerAPIEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitContactPickerAPIEnabled"));
}

- (void)setContactPickerAPIEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitContactPickerAPIEnabled"));
}

- (BOOL)visualViewportAPIEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitVisualViewportAPIEnabled"));
}

- (void)setVisualViewportAPIEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitVisualViewportAPIEnabled"));
}

- (BOOL)CSSOMViewSmoothScrollingEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitCSSOMViewSmoothScrollingEnabled"));
}

- (void)setCSSOMViewSmoothScrollingEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitCSSOMViewSmoothScrollingEnabled"));
}

- (BOOL)webAnimationsCompositeOperationsEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitWebAnimationsCompositeOperationsEnabled"));
}

- (void)setWebAnimationsCompositeOperationsEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitWebAnimationsCompositeOperationsEnabled"));
}

- (BOOL)webAnimationsMutableTimelinesEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitWebAnimationsMutableTimelinesEnabled"));
}

- (void)setWebAnimationsMutableTimelinesEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitWebAnimationsMutableTimelinesEnabled"));
}

- (BOOL)privateClickMeasurementEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitPrivateClickMeasurementEnabled"));
}

- (void)setPrivateClickMeasurementEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitPrivateClickMeasurementEnabled"));
}

- (BOOL)genericCueAPIEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitGenericCueAPIEnabled"));
}

- (void)setGenericCueAPIEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitGenericCueAPIEnabled"));
}

- (BOOL)coreMathMLEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitCoreMathMLEnabled"));
}

- (void)setCoreMathMLEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitCoreMathMLEnabled"));
}

- (BOOL)linkPreloadResponsiveImagesEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitLinkPreloadResponsiveImagesEnabled"));
}

- (void)setLinkPreloadResponsiveImagesEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitLinkPreloadResponsiveImagesEnabled"));
}

- (BOOL)remotePlaybackEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitRemotePlaybackEnabled"));
}

- (void)setRemotePlaybackEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitRemotePlaybackEnabled"));
}

- (BOOL)readableByteStreamAPIEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitReadableByteStreamAPIEnabled"));
}

- (void)setReadableByteStreamAPIEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitReadableByteStreamAPIEnabled"));
}

- (BOOL)_mediaRecorderEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitMediaRecorderEnabled"));
}

- (void)_setMediaRecorderEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitMediaRecorderEnabled"));
}

- (BOOL)mediaRecorderEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitMediaRecorderEnabled"));
}

- (void)setMediaRecorderEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitMediaRecorderEnabled"));
}

- (BOOL)_speechRecognitionEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitSpeechRecognitionEnabled"));
}

- (void)_setSpeechRecognitionEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitSpeechRecognitionEnabled"));
}

- (int)_pitchCorrectionAlgorithm
{
  return -[WebPreferences _unsignedIntValueForKey:](self, "_unsignedIntValueForKey:", CFSTR("WebKitPitchCorrectionAlgorithm"));
}

- (void)_setPitchCorrectionAlgorithm:(int)a3
{
  -[WebPreferences _setUnsignedIntValue:forKey:](self, "_setUnsignedIntValue:forKey:", *(_QWORD *)&a3, CFSTR("WebKitPitchCorrectionAlgorithm"));
}

- (BOOL)constantPropertiesEnabled
{
  return 1;
}

- (BOOL)maskWebGLStringsEnabled
{
  return 1;
}

- (BOOL)CSSCustomPropertiesAndValuesEnabled
{
  return 1;
}

- (BOOL)syntheticEditingCommandsEnabled
{
  return 1;
}

- (BOOL)allowCrossOriginSubresourcesToAskForCredentials
{
  return 0;
}

- (BOOL)aspectRatioOfImgFromWidthAndHeightEnabled
{
  return 1;
}

- (BOOL)resizeObserverEnabled
{
  return 1;
}

- (void)setSubpixelCSSOMElementMetricsEnabled:(BOOL)a3
{
  -[WebPreferences _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, CFSTR("WebKitSubpixelCSSOMElementMetricsEnabled"));
}

- (BOOL)subpixelCSSOMElementMetricsEnabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitSubpixelCSSOMElementMetricsEnabled"));
}

- (BOOL)userTimingEnabled
{
  return 1;
}

- (BOOL)requestAnimationFrameEnabled
{
  return 1;
}

- (BOOL)resourceTimingEnabled
{
  return 1;
}

- (BOOL)cssShadowPartsEnabled
{
  return 1;
}

- (BOOL)isSecureContextAttributeEnabled
{
  return 1;
}

- (BOOL)fetchAPIEnabled
{
  return 1;
}

- (BOOL)fetchAPIKeepAliveEnabled
{
  return 1;
}

- (BOOL)intersectionObserverEnabled
{
  return 1;
}

- (BOOL)shadowDOMEnabled
{
  return 1;
}

- (BOOL)customElementsEnabled
{
  return 1;
}

- (BOOL)keygenElementEnabled
{
  return 0;
}

- (BOOL)isVideoPluginProxyEnabled
{
  return 0;
}

- (BOOL)isHixie76WebSocketProtocolEnabled
{
  return 0;
}

- (BOOL)accelerated2dCanvasEnabled
{
  return 0;
}

- (BOOL)experimentalNotificationsEnabled
{
  return 0;
}

- (BOOL)selectionAcrossShadowBoundariesEnabled
{
  return 1;
}

- (BOOL)isXSSAuditorEnabled
{
  return 0;
}

- (BOOL)subpixelAntialiasedLayerTextEnabled
{
  return 0;
}

- (BOOL)webGL2Enabled
{
  return -[WebPreferences _BOOLValueForKey:](self, "_BOOLValueForKey:", CFSTR("WebKitWebGLEnabled"));
}

- (BOOL)loadsSiteIconsIgnoringImageLoadingPreference
{
  return 0;
}

- (BOOL)displayListDrawingEnabled
{
  return 0;
}

- (BOOL)transformStreamAPIEnabled
{
  return 1;
}

- (BOOL)lineHeightUnitsEnabled
{
  return 1;
}

- (BOOL)CSSIndividualTransformPropertiesEnabled
{
  return 1;
}

- (BOOL)serverTimingEnabled
{
  return 1;
}

- (BOOL)offlineWebApplicationCacheEnabled
{
  return 0;
}

- (int64_t)applicationCacheTotalQuota
{
  return 0;
}

- (int64_t)applicationCacheDefaultOriginQuota
{
  return 0;
}

+ (id)_experimentalFeatures
{
  WebFeature *v3;
  unsigned __int8 v4;
  WebFeature *v5;
  int v6;
  WebFeature *v7;
  WebFeature *v8;
  WebFeature *v9;
  WebFeature *v10;
  WebFeature *v11;
  WebFeature *v12;
  WebFeature *v13;
  WebFeature *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  WebFeature *v189;
  WebFeature *cf;
  WebFeature *v191;
  WebFeature *v192;
  WebFeature *v193;
  WebFeature *v194;
  WebFeature *v195;
  WebFeature *v196;
  WebFeature *v197;
  WebFeature *v198;
  WebFeature *v199;
  WebFeature *v200;
  WebFeature *v201;
  WebFeature *v202;
  WebFeature *v203;
  WebFeature *v204;
  WebFeature *v205;
  WebFeature *v206;
  WebFeature *v207;
  WebFeature *v208;
  WebFeature *v209;
  WebFeature *v210;
  WebFeature *v211;
  WebFeature *v212;
  WebFeature *v213;
  WebFeature *v214;
  WebFeature *v215;
  WebFeature *v216;
  WebFeature *v217;
  WebFeature *v218;
  WebFeature *v219;
  WebFeature *v220;
  WebFeature *v221;
  WebFeature *v222;
  WebFeature *v223;
  WebFeature *v224;
  WebFeature *v225;
  WebFeature *v226;
  WebFeature *v227;
  WebFeature *v228;
  WebFeature *v229;
  WebFeature *v230;
  WebFeature *v231;
  WebFeature *v232;
  WebFeature *v233;
  WebFeature *v234;
  WebFeature *v235;
  WebFeature *v236;
  WebFeature *v237;
  WebFeature *v238;
  WebFeature *v239;
  WebFeature *v240;
  WebFeature *v241;
  WebFeature *v242;
  WebFeature *v243;
  WebFeature *v244;
  WebFeature *v245;
  WebFeature *v246;
  WebFeature *v247;
  WebFeature *v248;
  WebFeature *v249;
  WebFeature *v250;
  WebFeature *v251;
  WebFeature *v252;
  WebFeature *v253;
  WebFeature *v254;
  WebFeature *v255;
  WebFeature *v256;
  WebFeature *v257;
  WebFeature *v258;
  WebFeature *v259;
  WebFeature *v260;
  WebFeature *v261;
  WebFeature *v262;
  WebFeature *v263;
  WebFeature *v264;
  WebFeature *v265;
  WebFeature *v266;
  WebFeature *v267;
  WebFeature *v268;
  WebFeature *v269;
  WebFeature *v270;
  WebFeature *v271;
  WebFeature *v272;
  WebFeature *v273;
  WebFeature *v274;
  WebFeature *v275;
  WebFeature *v276;
  WebFeature *v277;
  WebFeature *v278;
  WebFeature *v279;
  WebFeature *v280;
  WebFeature *v281;
  WebFeature *v282;
  WebFeature *v283;
  WebFeature *v284;
  WebFeature *v285;
  WebFeature *v286;
  WebFeature *v287;
  WebFeature *v288;
  WebFeature *v289;
  WebFeature *v290;
  WebFeature *v291;
  WebFeature *v292;
  WebFeature *v293;
  WebFeature *v294;
  WebFeature *v295;
  WebFeature *v296;
  WebFeature *v297;
  WebFeature *v298;
  WebFeature *v299;
  WebFeature *v300;
  WebFeature *v301;
  WebFeature *v302;
  WebFeature *v303;
  WebFeature *v304;
  WebFeature *v305;
  WebFeature *v306;
  WebFeature *v307;
  WebFeature *v308;
  WebFeature *v309;
  WebFeature *v310;
  WebFeature *v311;
  WebFeature *v312;
  WebFeature *v313;
  WebFeature *v314;
  WebFeature *v315;
  WebFeature *v316;
  WebFeature *v317;
  WebFeature *v318;
  WebFeature *v319;
  WebFeature *v320;
  WebFeature *v321;
  WebFeature *v322;
  WebFeature *v323;
  WebFeature *v324;
  WebFeature *v325;
  WebFeature *v326;
  WebFeature *v327;
  WebFeature *v328;
  WebFeature *v329;
  WebFeature *v330;
  WebFeature *v331;
  WebFeature *v332;
  WebFeature *v333;
  WebFeature *v334;
  WebFeature *v335;
  WebFeature *v336;
  WebFeature *v337;
  WebFeature *v338;
  WebFeature *v339;
  WebFeature *v340;
  WebFeature *v341;
  WebFeature *v342;
  WebFeature *v343;
  WebFeature *v344;
  WebFeature *v345;
  WebFeature *v346;
  WebFeature *v347;
  WebFeature *v348;
  WebFeature *v349;
  WebFeature *v350;
  WebFeature *v351;
  WebFeature *v352;
  WebFeature *v353;
  _QWORD v354[175];

  v354[173] = *MEMORY[0x1E0C80C00];
  if ((_MergedGlobals_23 & 1) == 0)
  {
    LOWORD(v16) = 1;
    v189 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("GrammarAndSpellingPseudoElementsEnabled"), CFSTR("WebKitGrammarAndSpellingPseudoElementsEnabled"), CFSTR("::grammar-error and ::spelling-error pseudo-elements"), 6, 2, CFSTR("Enable the ::grammar-error and ::spelling-error CSS pseudo-elements"), v16);
    v354[0] = v189;
    LOWORD(v17) = 0;
    v353 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ThumbAndTrackPseudoElementsEnabled"), CFSTR("WebKitThumbAndTrackPseudoElementsEnabled"), CFSTR("::thumb and ::track pseudo-elements"), 4, 2, CFSTR("Enable support for CSS ::thumb and ::track pseudo-elements"), v17);
    v354[1] = v353;
    LOWORD(v18) = 0;
    v352 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("SelectShowPickerEnabled"), CFSTR("WebKitSelectShowPickerEnabled"), CFSTR("<select> showPicker() method"), 4, 3, CFSTR("Enable showPicker() method on <select>"), v18);
    v354[2] = v352;
    LOWORD(v19) = 1;
    v351 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("AbortSignalAnyOperationEnabled"), CFSTR("WebKitAbortSignalAnyOperationEnabled"), CFSTR("AbortSignal.any() API"), 6, 3, CFSTR("Enable AbortSignal.any() API"), v19);
    v354[3] = v351;
    LOWORD(v20) = 0;
    v350 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("AccessHandleEnabled"), CFSTR("WebKitAccessHandleEnabled"), CFSTR("AccessHandle API"), 6, 3, CFSTR("Enable AccessHandle API"), v20);
    v354[4] = v350;
    LOWORD(v21) = 1;
    v349 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("AllowWebGLInWorkers"), CFSTR("WebKitAllowWebGLInWorkers"), CFSTR("Allow WebGL in Web Workers"), 6, 3, &stru_1E9D6EC48, v21);
    v354[5] = v349;
    LOWORD(v22) = 0;
    v348 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("PerElementSpeakerSelectionEnabled"), CFSTR("WebKitPerElementSpeakerSelectionEnabled"), CFSTR("Allow per media element speaker device selection"), 4, 5, CFSTR("Allow per media element speaker device selection"), v22);
    v354[6] = v348;
    LOWORD(v23) = 0;
    v347 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ExposeSpeakersEnabled"), CFSTR("WebKitExposeSpeakersEnabled"), CFSTR("Allow speaker device selection"), 4, 5, CFSTR("Allow speaker device selection"), v23);
    v354[7] = v347;
    LOWORD(v24) = 1;
    v346 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("AllowUniversalAccessFromFileURLs"), CFSTR("WebKitAllowUniversalAccessFromFileURLs"), CFSTR("Allow universal access from file: URLs"), 3, 8, &stru_1E9D6EC48, v24);
    v354[8] = v346;
    LOWORD(v25) = 1;
    v345 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("AlternateWebMPlayerEnabled"), CFSTR("WebKitAlternateWebMPlayerEnabled"), CFSTR("Alternate WebM Player"), 6, 5, CFSTR("Enable Alternate WebM Player"), v25);
    v354[9] = v345;
    LOWORD(v26) = 0;
    v344 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ExtendedAudioDescriptionsEnabled"), CFSTR("WebKitExtendedAudioDescriptionsEnabled"), CFSTR("Audio descriptions for video - Extended"), 5, 5, CFSTR("Enable extended audio descriptions for video"), v26);
    v354[10] = v344;
    LOWORD(v27) = 0;
    v343 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("AudioDescriptionsEnabled"), CFSTR("WebKitAudioDescriptionsEnabled"), CFSTR("Audio descriptions for video - Standard"), 5, 5, CFSTR("Enable standard audio descriptions for video"), v27);
    v354[11] = v343;
    LOWORD(v28) = 0;
    v342 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("DOMAudioSessionEnabled"), CFSTR("WebKitDOMAudioSessionEnabled"), CFSTR("AudioSession API"), 6, 5, CFSTR("Enable AudioSession API"), v28);
    v354[12] = v342;
    LOWORD(v29) = 0;
    v341 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("DOMAudioSessionFullEnabled"), CFSTR("WebKitDOMAudioSessionFullEnabled"), CFSTR("AudioSession full API"), 4, 5, CFSTR("Enable AudioSession full API"), v29);
    v354[13] = v341;
    LOWORD(v30) = 0;
    v340 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("BroadcastChannelEnabled"), CFSTR("WebKitBroadcastChannelEnabled"), CFSTR("BroadcastChannel API"), 6, 3, CFSTR("BroadcastChannel API"), v30);
    v354[14] = v340;
    LOWORD(v31) = 1;
    v339 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("BroadcastChannelOriginPartitioningEnabled"), CFSTR("WebKitBroadcastChannelOriginPartitioningEnabled"), CFSTR("BroadcastChannel Origin Partitioning"), 6, 3, CFSTR("BroadcastChannel Origin Partitioning"), v31);
    v354[15] = v339;
    LOWORD(v32) = 0;
    v338 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSS3DTransformBackfaceVisibilityInteroperabilityEnabled"), CFSTR("WebKitCSS3DTransformBackfaceVisibilityInteroperabilityEnabled"), CFSTR("CSS 3D Transform Interoperability for backface-visibility"), 5, 2, CFSTR("Enable 3D transform behavior for backface-visibility that is specification-compliant but backwards incompatible"), v32);
    v354[16] = v338;
    LOWORD(v33) = 0;
    v337 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSCounterStyleAtRuleImageSymbolsEnabled"), CFSTR("WebKitCSSCounterStyleAtRuleImageSymbolsEnabled"), CFSTR("CSS @counter-style <image> symbols"), 4, 2, CFSTR("Enable support for <image> symbols in CSS @counter-style rules"), v33);
    v354[17] = v337;
    LOWORD(v34) = 1;
    v336 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSCounterStyleAtRulesEnabled"), CFSTR("WebKitCSSCounterStyleAtRulesEnabled"), CFSTR("CSS @counter-style"), 6, 2, CFSTR("Enable support for CSS @counter-style rules"), v34);
    v354[18] = v336;
    LOWORD(v35) = 1;
    v335 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSFontFaceSizeAdjustEnabled"), CFSTR("WebKitCSSFontFaceSizeAdjustEnabled"), CFSTR("CSS @font-face size-adjust"), 6, 2, CFSTR("Enable size-adjust descriptor in @font-face"), v35);
    v354[19] = v335;
    LOWORD(v36) = 1;
    v334 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSStartingStyleAtRuleEnabled"), CFSTR("WebKitCSSStartingStyleAtRuleEnabled"), CFSTR("CSS @starting-style rule"), 6, 2, CFSTR("Enable CSS @starting-style rule"), v36);
    v354[20] = v334;
    LOWORD(v37) = 1;
    v333 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("AccentColorEnabled"), CFSTR("WebKitAccentColorEnabled"), CFSTR("CSS Accent Color"), 6, 2, CFSTR("Enable accent-color CSS property"), v37);
    v354[21] = v333;
    LOWORD(v38) = 0;
    v332 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSAnchorPositioningEnabled"), CFSTR("WebKitCSSAnchorPositioningEnabled"), CFSTR("CSS Anchor Positioning"), 4, 2, CFSTR("Enable CSS Anchor Positioning"), v38);
    v354[22] = v332;
    LOWORD(v39) = 1;
    v331 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSContentVisibilityEnabled"), CFSTR("WebKitCSSContentVisibilityEnabled"), CFSTR("CSS Content Visibility"), 6, 2, CFSTR("Enable CSS content-visibility"), v39);
    v354[23] = v331;
    LOWORD(v40) = 0;
    v330 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSInputSecurityEnabled"), CFSTR("WebKitCSSInputSecurityEnabled"), CFSTR("CSS Input Security"), 4, 2, CFSTR("Enable input-security CSS property"), v40);
    v354[24] = v330;
    LOWORD(v41) = 0;
    v329 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("MasonryEnabled"), CFSTR("WebKitMasonryEnabled"), CFSTR("CSS Masonry Layout"), 5, 2, CFSTR("Enable Masonry Layout for CSS Grid"), v41);
    v354[25] = v329;
    LOWORD(v42) = 1;
    v328 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSMotionPathEnabled"), CFSTR("WebKitCSSMotionPathEnabled"), CFSTR("CSS Motion Path"), 6, 2, CFSTR("Enable CSS Motion Path support"), v42);
    v354[26] = v328;
    LOWORD(v43) = 1;
    v327 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSNestingEnabled"), CFSTR("WebKitCSSNestingEnabled"), CFSTR("CSS Nesting"), 6, 2, CFSTR("Enable support for CSS nesting https://www.w3.org/TR/css-nesting-1/"), v43);
    v354[27] = v327;
    LOWORD(v44) = 0;
    v326 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("OverscrollBehaviorEnabled"), CFSTR("WebKitOverscrollBehaviorEnabled"), CFSTR("CSS Overscroll Behavior"), 6, 2, CFSTR("Enable CSS overscroll-behavior"), v44);
    v354[28] = v326;
    LOWORD(v45) = 0;
    v325 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSPaintingAPIEnabled"), CFSTR("WebKitCSSPaintingAPIEnabled"), CFSTR("CSS Painting API"), 4, 2, CFSTR("Enable the CSS Painting API"), v45);
    v354[29] = v325;
    LOWORD(v46) = 0;
    v324 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSRhythmicSizingEnabled"), CFSTR("WebKitCSSRhythmicSizingEnabled"), CFSTR("CSS Rhythmic Sizing"), 4, 2, CFSTR("Enable CSS Rhythmic Sizing properties"), v46);
    v354[30] = v324;
    LOWORD(v47) = 1;
    v323 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSScopeAtRuleEnabled"), CFSTR("WebKitCSSScopeAtRuleEnabled"), CFSTR("CSS Scoping (@scope)"), 6, 2, CFSTR("Enable the CSS Scoping feature with @scope rule"), v47);
    v354[31] = v323;
    LOWORD(v48) = 0;
    v322 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSScrollAnchoringEnabled"), CFSTR("WebKitCSSScrollAnchoringEnabled"), CFSTR("CSS Scroll Anchoring"), 4, 2, CFSTR("Enable CSS Scroll Anchoring"), v48);
    v354[32] = v322;
    LOWORD(v49) = 0;
    v321 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSTypedOMColorEnabled"), CFSTR("WebKitCSSTypedOMColorEnabled"), CFSTR("CSS Typed OM: Color Support"), 4, 2, CFSTR("Enable the CSS Typed OM Color support"), v49);
    v354[33] = v321;
    LOWORD(v50) = 0;
    v320 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSColorContrastEnabled"), CFSTR("WebKitCSSColorContrastEnabled"), CFSTR("CSS color-contrast()"), 4, 2, CFSTR("Enable support for CSS color-contrast() defined in CSS Color 5"), v50);
    v354[34] = v320;
    LOWORD(v51) = 0;
    v319 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSDPropertyEnabled"), CFSTR("WebKitCSSDPropertyEnabled"), CFSTR("CSS d property"), 4, 2, CFSTR("Enable support for the CSS d property and SVG d presentation attribute"), v51);
    v354[35] = v319;
    LOWORD(v52) = 0;
    v318 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSFieldSizingEnabled"), CFSTR("WebKitCSSFieldSizingEnabled"), CFSTR("CSS field-sizing property"), 4, 2, CFSTR("Enable field-sizing CSS property"), v52);
    v354[36] = v318;
    LOWORD(v53) = 0;
    v317 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSFontVariantEmojiEnabled"), CFSTR("WebKitCSSFontVariantEmojiEnabled"), CFSTR("CSS font-variant-emoji property"), 4, 2, CFSTR("Enable the font-variant-emoji CSS property"), v53);
    v354[37] = v317;
    LOWORD(v54) = 1;
    v316 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSLightDarkEnabled"), CFSTR("WebKitCSSLightDarkEnabled"), CFSTR("CSS light-dark()"), 6, 2, CFSTR("Enable support for CSS light-dark() defined in CSS Color 5"), v54);
    v354[38] = v316;
    LOWORD(v55) = 1;
    v315 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSMarginTrimEnabled"), CFSTR("WebKitCSSMarginTrimEnabled"), CFSTR("CSS margin-trim property"), 6, 2, CFSTR("Enable margin-trim CSS property"), v55);
    v354[39] = v315;
    LOWORD(v56) = 0;
    v314 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSScrollbarColorEnabled"), CFSTR("WebKitCSSScrollbarColorEnabled"), CFSTR("CSS scrollbar-color property"), 4, 2, CFSTR("Enable scrollbar-color CSS property"), v56);
    v354[40] = v314;
    LOWORD(v57) = 0;
    v313 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSScrollbarGutterEnabled"), CFSTR("WebKitCSSScrollbarGutterEnabled"), CFSTR("CSS scrollbar-gutter property"), 4, 2, CFSTR("Enable scrollbar-gutter CSS property"), v57);
    v354[41] = v313;
    LOWORD(v58) = 0;
    v312 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSScrollbarWidthEnabled"), CFSTR("WebKitCSSScrollbarWidthEnabled"), CFSTR("CSS scrollbar-width property"), 4, 2, CFSTR("Enable scrollbar-width CSS property"), v58);
    v354[42] = v312;
    LOWORD(v59) = 1;
    v311 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSStyleQueriesEnabled"), CFSTR("WebKitCSSStyleQueriesEnabled"), CFSTR("CSS style queries"), 6, 2, CFSTR("Enable CSS style queries for custom properties"), v59);
    v354[43] = v311;
    LOWORD(v60) = 0;
    v310 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSTextBoxTrimEnabled"), CFSTR("WebKitCSSTextBoxTrimEnabled"), CFSTR("CSS text-box-trim property"), 5, 2, CFSTR("Enable text-box-trim"), v60);
    v354[44] = v310;
    LOWORD(v61) = 0;
    v309 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSTextGroupAlignEnabled"), CFSTR("WebKitCSSTextGroupAlignEnabled"), CFSTR("CSS text-group-align property"), 4, 2, CFSTR("Enable text-group-align CSS property"), v61);
    v354[45] = v309;
    LOWORD(v62) = 0;
    v308 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSTextJustifyEnabled"), CFSTR("WebKitCSSTextJustifyEnabled"), CFSTR("CSS text-justify property"), 4, 2, CFSTR("Enable the property text-justify, defined in CSS Text 3"), v62);
    v354[46] = v308;
    LOWORD(v63) = 0;
    v307 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSTextSpacingEnabled"), CFSTR("WebKitCSSTextSpacingEnabled"), CFSTR("CSS text-spacing property"), 4, 2, CFSTR("Enable the property text-spacing, defined in CSS Text 4"), v63);
    v354[47] = v307;
    LOWORD(v64) = 1;
    v306 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSTextWrapStyleEnabled"), CFSTR("WebKitCSSTextWrapStyleEnabled"), CFSTR("CSS text-wrap-style property"), 6, 2, CFSTR("Enable the property text-wrap-style, defined in CSS Text 4"), v64);
    v354[48] = v306;
    LOWORD(v65) = 0;
    v305 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSTextWrapPrettyEnabled"), CFSTR("WebKitCSSTextWrapPrettyEnabled"), CFSTR("CSS text-wrap: pretty"), 4, 2, CFSTR("Enable the pretty value for text-wrap-style"), v65);
    v354[49] = v305;
    LOWORD(v66) = 1;
    v304 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSOMViewScrollingAPIEnabled"), CFSTR("WebKitCSSOMViewScrollingAPIEnabled"), CFSTR("CSSOM View Scrolling API"), 6, 2, CFSTR("Implement standard behavior for scrollLeft, scrollTop, scrollWidth, scrollHeight, scrollTo, scrollBy and scrollingElement."), v66);
    v354[50] = v304;
    LOWORD(v67) = 1;
    v303 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSOMViewSmoothScrollingEnabled"), CFSTR("WebKitCSSOMViewSmoothScrollingEnabled"), CFSTR("CSSOM View Smooth Scrolling"), 6, 2, CFSTR("Enable DOM API and CSS property for 'smooth' scroll behavior"), v67);
    v354[51] = v303;
    LOWORD(v68) = 1;
    v302 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CanvasColorSpaceEnabled"), CFSTR("WebKitCanvasColorSpaceEnabled"), CFSTR("Canvas Color Spaces"), 6, 3, CFSTR("Enable use of predefined canvas color spaces"), v68);
    v354[52] = v302;
    LOWORD(v69) = 0;
    v301 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CanvasFiltersEnabled"), CFSTR("WebKitCanvasFiltersEnabled"), CFSTR("Canvas Filters"), 4, 3, CFSTR("Canvas Filters"), v69);
    v354[53] = v301;
    LOWORD(v70) = 0;
    v300 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CanvasLayersEnabled"), CFSTR("WebKitCanvasLayersEnabled"), CFSTR("Canvas Layers"), 4, 3, CFSTR("Enable Canvas Layers"), v70);
    v354[54] = v300;
    LOWORD(v71) = 0;
    v299 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ClearSiteDataHTTPHeaderEnabled"), CFSTR("WebKitClearSiteDataHTTPHeaderEnabled"), CFSTR("Clear-Site-Data HTTP Header"), 6, 6, CFSTR("Enable Clear-Site-Data HTTP Header support"), v71);
    v354[55] = v299;
    LOWORD(v72) = 0;
    v298 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CompressionStreamEnabled"), CFSTR("WebKitCompressionStreamEnabled"), CFSTR("Compression Stream API"), 6, 3, CFSTR("Enable Compression Stream API"), v72);
    v354[56] = v298;
    LOWORD(v73) = 0;
    v297 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ContactPickerAPIEnabled"), CFSTR("WebKitContactPickerAPIEnabled"), CFSTR("Contact Picker API"), 4, 3, CFSTR("Enable the Contact Picker API"), v73);
    v354[57] = v297;
    LOWORD(v74) = 0;
    v296 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CookieStoreAPIExtendedAttributesEnabled"), CFSTR("WebKitCookieStoreAPIExtendedAttributesEnabled"), CFSTR("Cookie Store API Extended Attributes"), 4, 3, CFSTR("Enable Extended Attributes of the Cookie Store API"), v74);
    v354[58] = v296;
    LOWORD(v75) = 0;
    v295 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CookieStoreAPIServiceWorkerEnabled"), CFSTR("WebKitCookieStoreAPIServiceWorkerEnabled"), CFSTR("Cookie Store API for Service Workers"), 4, 3, CFSTR("Enable Cookie Store API for Service Workers"), v75);
    v354[59] = v295;
    LOWORD(v76) = 0;
    v294 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CookieStoreAPIEnabled"), CFSTR("WebKitCookieStoreAPIEnabled"), CFSTR("Cookie Store API"), 4, 3, CFSTR("Enable Cookie Store API"), v76);
    v354[60] = v294;
    LOWORD(v77) = 0;
    v293 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CrossOriginEmbedderPolicyEnabled"), CFSTR("WebKitCrossOriginEmbedderPolicyEnabled"), CFSTR("Cross-Origin-Embedder-Policy (COEP) header"), 6, 8, CFSTR("Support for Cross-Origin-Embedder-Policy (COEP) header"), v77);
    v354[61] = v293;
    LOWORD(v78) = 0;
    v292 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CrossOriginOpenerPolicyEnabled"), CFSTR("WebKitCrossOriginOpenerPolicyEnabled"), CFSTR("Cross-Origin-Opener-Policy (COOP) header"), 6, 8, CFSTR("Support for Cross-Origin-Opener-Policy (COOP) header"), v78);
    v354[62] = v292;
    LOWORD(v79) = 1;
    v291 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CustomStateSetEnabled"), CFSTR("WebKitCustomStateSetEnabled"), CFSTR("CustomStateSet and :state() pseudo class"), 6, 3, CFSTR("Support for CustomStateSet in custom elements"), v79);
    v354[63] = v291;
    LOWORD(v80) = 1;
    v290 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("DeclarativeShadowRootsParserAPIsEnabled"), CFSTR("WebKitDeclarativeShadowRootsParserAPIsEnabled"), CFSTR("Declarative Shadow Roots Parser APIs"), 6, 3, CFSTR("Declarative Shadow Roots Parser APIs (Element/ShadowRoot's setHTMLUnsafe() and Document.parseHTMLUnsafe())"), v80);
    v354[64] = v290;
    LOWORD(v81) = 1;
    v289 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("DeclarativeShadowRootsSerializerAPIsEnabled"), CFSTR("WebKitDeclarativeShadowRootsSerializerAPIsEnabled"), CFSTR("Declarative Shadow Roots Serializer APIs"), 6, 3, CFSTR("Declarative Shadow Roots Serializer APIs (Element/ShadowRoot's getHTML() and ShadowRoot's serializable)"), v81);
    v354[65] = v289;
    LOWORD(v82) = 1;
    v288 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ShouldDeferAsynchronousScriptsUntilAfterDocumentLoadOrFirstPaint"), CFSTR("WebKitShouldDeferAsynchronousScriptsUntilAfterDocumentLoadOrFirstPaint"), CFSTR("Defer async scripts until DOMContentLoaded or first-paint"), 6, 3, CFSTR("Defer async scripts until DOMContentLoaded or first-paint"), v82);
    v354[66] = v288;
    LOWORD(v83) = 1;
    v287 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("DeprecateAESCFBWebCryptoEnabled"), CFSTR("WebKitDeprecateAESCFBWebCryptoEnabled"), CFSTR("Deprecate AES-CFB Web Crypto"), 6, 3, CFSTR("Enable Deprecation of AES-CFB from Web Crypto"), v83);
    v354[67] = v287;
    LOWORD(v84) = 1;
    v286 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("DeprecateRSAESPKCSWebCryptoEnabled"), CFSTR("WebKitDeprecateRSAESPKCSWebCryptoEnabled"), CFSTR("Deprecate RSAES-PKCS1-v1_5 Web Crypto"), 6, 3, CFSTR("Enable Deprecation of RSAES-PKCS1-v1_5 Web Crypto"), v84);
    v354[68] = v286;
    LOWORD(v85) = 0;
    v285 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("DeprecationReportingEnabled"), CFSTR("WebKitDeprecationReportingEnabled"), CFSTR("Deprecation Reporting"), 4, 3, CFSTR("Enable Deprecation Reporting"), v85);
    v354[69] = v285;
    LOWORD(v86) = 1;
    v284 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("UAVisualTransitionDetectionEnabled"), CFSTR("WebKitUAVisualTransitionDetectionEnabled"), CFSTR("Detect UA visual transitions"), 6, 3, CFSTR("Enable detection of UA visual transitions"), v86);
    v354[70] = v284;
    LOWORD(v87) = 0;
    v283 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("DigitalCredentialsEnabled"), CFSTR("WebKitDigitalCredentialsEnabled"), CFSTR("Digital Credentials API"), 4, 3, CFSTR("Enable the experimental Digital Credentials API"), v87);
    v354[71] = v283;
    LOWORD(v88) = 0;
    v282 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("IsThirdPartyCookieBlockingDisabled"), CFSTR("WebKitIsThirdPartyCookieBlockingDisabled"), CFSTR("Disable Full 3rd-Party Cookie Blocking (ITP)"), 3, 7, CFSTR("Disable full third-party cookie blocking when Intelligent Tracking Prevention is enabled"), v88);
    v354[72] = v282;
    LOWORD(v89) = 0;
    v281 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("IsFirstPartyWebsiteDataRemovalDisabled"), CFSTR("WebKitIsFirstPartyWebsiteDataRemovalDisabled"), CFSTR("Disable Removal of Non-Cookie Data After 7 Days of No User Interaction (ITP)"), 3, 7, CFSTR("Disable removal of all non-cookie website data after seven days of no user interaction when Intelligent Tracking Prevention is enabled"), v89);
    v354[73] = v281;
    LOWORD(v90) = 1;
    v280 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("DisallowSyncXHRDuringPageDismissalEnabled"), CFSTR("WebKitDisallowSyncXHRDuringPageDismissalEnabled"), CFSTR("Disallow sync XHR during page dismissal"), 6, 8, CFSTR("Disallow synchronous XMLHttpRequest during page dismissal"), v90);
    v354[74] = v280;
    LOWORD(v91) = 0;
    v279 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CanvasFingerprintingQuirkEnabled"), CFSTR("WebKitCanvasFingerprintingQuirkEnabled"), CFSTR("Enable Canvas fingerprinting-related quirk"), 6, 3, &stru_1E9D6EC48, v91);
    v354[75] = v279;
    LOWORD(v92) = 0;
    v278 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("FTPEnabled"), CFSTR("WebKitFTPEnabled"), CFSTR("FTP support enabled"), 3, 6, CFSTR("FTP support enabled"), v92);
    v354[76] = v278;
    LOWORD(v93) = 1;
    v277 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("FetchPriorityEnabled"), CFSTR("WebKitFetchPriorityEnabled"), CFSTR("Fetch Priority"), 6, 6, CFSTR("Enable Fetch Priority support"), v93);
    v354[77] = v277;
    LOWORD(v94) = 0;
    v276 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("FileSystemAccessEnabled"), CFSTR("WebKitFileSystemAccessEnabled"), CFSTR("File System Access API"), 6, 3, CFSTR("Enable File System Access API"), v94);
    v354[78] = v276;
    LOWORD(v95) = 0;
    v275 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("FilterLinkDecorationByDefaultEnabled"), CFSTR("WebKitFilterLinkDecorationByDefaultEnabled"), CFSTR("Filter Link Decoration"), 4, 6, CFSTR("Enable Filtering Link Decoration"), v95);
    v354[79] = v275;
    LOWORD(v96) = 0;
    v274 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("FullScreenKeyboardLock"), CFSTR("WebKitFullScreenKeyboardLock"), CFSTR("Fullscreen API based Keyboard Lock"), 4, 3, CFSTR("Fullscreen API based Keyboard Lock"), v96);
    v354[80] = v274;
    LOWORD(v97) = 0;
    v273 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("GamepadTriggerRumbleEnabled"), CFSTR("WebKitGamepadTriggerRumbleEnabled"), CFSTR("Gamepad trigger vibration support"), 4, 3, CFSTR("Support for Gamepad trigger vibration"), v97);
    v354[81] = v273;
    LOWORD(v98) = 0;
    v272 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("GamepadVibrationActuatorEnabled"), CFSTR("WebKitGamepadVibrationActuatorEnabled"), CFSTR("Gamepad.vibrationActuator support"), 6, 3, CFSTR("Support for Gamepad.vibrationActuator"), v98);
    v354[82] = v272;
    LOWORD(v99) = 1;
    v271 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("GraphicsContextFiltersEnabled"), CFSTR("WebKitGraphicsContextFiltersEnabled"), CFSTR("GraphicsContext Filter Rendering"), 6, 5, CFSTR("GraphicsContext Filter Rendering"), v99);
    v354[83] = v271;
    LOWORD(v100) = 1;
    v270 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("DetailsNameAttributeEnabled"), CFSTR("WebKitDetailsNameAttributeEnabled"), CFSTR("HTML <details name> attribute"), 6, 9, CFSTR("Enable HTML <details name> attribute"), v100);
    v354[84] = v270;
    LOWORD(v101) = 0;
    v269 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ModelElementEnabled"), CFSTR("WebKitModelElementEnabled"), CFSTR("HTML <model> element"), 4, 9, CFSTR("Enable HTML <model> element"), v101);
    v354[85] = v269;
    LOWORD(v102) = 0;
    v268 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ModelDocumentEnabled"), CFSTR("WebKitModelDocumentEnabled"), CFSTR("HTML <model> elements for stand-alone document"), 4, 9, CFSTR("Enable HTML <model> element for model documents"), v102);
    v354[86] = v268;
    LOWORD(v103) = 0;
    v267 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("InvokerAttributesEnabled"), CFSTR("WebKitInvokerAttributesEnabled"), CFSTR("HTML invoketarget & invokeaction attributes"), 4, 9, CFSTR("Enable HTML invoketarget & invokeaction attribute support"), v103);
    v354[87] = v267;
    v3 = [WebFeature alloc];
    {
      v4 = WebKit::defaultPopoverAttributeEnabled(void)::newSDK != 0;
    }
    else
    {
      v4 = WTF::linkedOnOrAfterSDKWithBehavior();
      WebKit::defaultPopoverAttributeEnabled(void)::newSDK = v4;
    }
    LOWORD(v104) = v4;
    v266 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:](v3, "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("PopoverAttributeEnabled"), CFSTR("WebKitPopoverAttributeEnabled"), CFSTR("HTML popover attribute"), 6, 9, CFSTR("Enable HTML popover attribute support"), v104);
    v354[88] = v266;
    LOWORD(v105) = 1;
    v265 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("SwitchControlEnabled"), CFSTR("WebKitSwitchControlEnabled"), CFSTR("HTML switch control"), 6, 9, CFSTR("Enable HTML switch control"), v105);
    v354[89] = v265;
    LOWORD(v106) = 0;
    v264 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("HighlightAPIEnabled"), CFSTR("WebKitHighlightAPIEnabled"), CFSTR("Highlight API"), 6, 2, CFSTR("Highlight API support"), v106);
    v354[90] = v264;
    LOWORD(v107) = 0;
    v263 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ItpDebugModeEnabled"), CFSTR("WebKitItpDebugModeEnabled"), CFSTR("ITP Debug Mode"), 3, 7, CFSTR("Intelligent Tracking Prevention Debug Mode"), v107);
    v354[91] = v263;
    LOWORD(v108) = 1;
    v262 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ImageAnimationControlEnabled"), CFSTR("WebKitImageAnimationControlEnabled"), CFSTR("Image Animation Control"), 6, 1, CFSTR("Enable controls for image animations"), v108);
    v354[92] = v262;
    LOWORD(v109) = 0;
    v261 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ImageCaptureEnabled"), CFSTR("WebKitImageCaptureEnabled"), CFSTR("Image Capture API"), 4, 5, CFSTR("Enable Image Capture API"), v109);
    v354[93] = v261;
    LOWORD(v110) = 1;
    v260 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("LazyIframeLoadingEnabled"), CFSTR("WebKitLazyIframeLoadingEnabled"), CFSTR("Lazy iframe loading"), 6, 9, CFSTR("Enable lazy iframe loading support"), v110);
    v354[94] = v260;
    LOWORD(v111) = 0;
    v259 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("LazyImageLoadingEnabled"), CFSTR("WebKitLazyImageLoadingEnabled"), CFSTR("Lazy image loading"), 6, 9, CFSTR("Enable lazy image loading support"), v111);
    v354[95] = v259;
    v5 = [WebFeature alloc];
    {
      v6 = WebKit::defaultShowModalDialogEnabled(void)::newSDK;
    }
    else
    {
      v6 = WTF::linkedOnOrAfterSDKWithBehavior();
      WebKit::defaultShowModalDialogEnabled(void)::newSDK = v6;
    }
    LOWORD(v112) = v6 == 0;
    v258 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:](v5, "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ShowModalDialogEnabled"), CFSTR("WebKitShowModalDialogEnabled"), CFSTR("Legacy showModalDialog() API"), 3, 3, CFSTR("Legacy showModalDialog() API"), v112);
    v354[96] = v258;
    LOWORD(v113) = 1;
    v257 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("LinkPreloadResponsiveImagesEnabled"), CFSTR("WebKitLinkPreloadResponsiveImagesEnabled"), CFSTR("Link preload responsive images"), 6, 6, CFSTR("Enable link preload responsive images"), v113);
    v354[97] = v257;
    LOWORD(v114) = 1;
    v256 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("LinkModulePreloadEnabled"), CFSTR("WebKitLinkModulePreloadEnabled"), CFSTR("Link rel=modulepreload"), 6, 6, CFSTR("Enable Link rel=modulepreload"), v114);
    v354[98] = v256;
    LOWORD(v115) = 0;
    v255 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("LinkPreconnectEarlyHintsEnabled"), CFSTR("WebKitLinkPreconnectEarlyHintsEnabled"), CFSTR("Link rel=preconnect via HTTP early hints"), 6, 6, CFSTR("Enable link rel=preconnect via early hints"), v115);
    v354[99] = v255;
    LOWORD(v116) = 0;
    v254 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("LinkPrefetchEnabled"), CFSTR("WebKitLinkPrefetchEnabled"), CFSTR("LinkPrefetch"), 4, 6, CFSTR("Enable LinkedPrefetch"), v116);
    v354[100] = v254;
    LOWORD(v117) = 1;
    v253 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("LiveRangeSelectionEnabled"), CFSTR("WebKitLiveRangeSelectionEnabled"), CFSTR("Live Ranges in Selection"), 6, 3, CFSTR("Live range behavior for ranges in the Selection object"), v117);
    v354[101] = v253;
    LOWORD(v118) = 1;
    v252 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("LoadWebArchiveWithEphemeralStorageEnabled"), CFSTR("WebKitLoadWebArchiveWithEphemeralStorageEnabled"), CFSTR("Load Web Archive with ephemeral storage"), 6, 3, CFSTR("Enable loading web archive with ephemeral storage"), v118);
    v354[102] = v252;
    LOWORD(v119) = 0;
    v251 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("LoginStatusAPIEnabled"), CFSTR("WebKitLoginStatusAPIEnabled"), CFSTR("Login Status API"), 4, 3, CFSTR("Enable the proposed Login Status API"), v119);
    v354[103] = v251;
    LOWORD(v120) = 0;
    v250 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ManagedMediaSourceEnabled"), CFSTR("WebKitManagedMediaSourceEnabled"), CFSTR("Managed Media Source API"), 6, 5, CFSTR("Managed Media Source API"), v120);
    v354[104] = v250;
    LOWORD(v121) = 0;
    v249 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ManagedMediaSourceNeedsAirPlay"), CFSTR("WebKitManagedMediaSourceNeedsAirPlay"), CFSTR("Managed Media Source Requires AirPlay source"), 6, 5, CFSTR("Managed Media Source Requires AirPlay source"), v121);
    v354[105] = v249;
    LOWORD(v122) = 0;
    v248 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("MediaCapabilitiesExtensionsEnabled"), CFSTR("WebKitMediaCapabilitiesExtensionsEnabled"), CFSTR("Media Capabilities Extensions"), 6, 5, CFSTR("Media Capabilities Extensions"), v122);
    v354[106] = v248;
    LOWORD(v123) = 0;
    v247 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("MediaRecorderEnabled"), CFSTR("WebKitMediaRecorderEnabled"), CFSTR("MediaRecorder"), 6, 5, CFSTR("MediaRecorder"), v123);
    v354[107] = v247;
    LOWORD(v124) = 0;
    v246 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("MediaStreamTrackProcessingEnabled"), CFSTR("WebKitMediaStreamTrackProcessingEnabled"), CFSTR("MediaStreamTrack Processing"), 6, 5, CFSTR("Enable MediaStreamTrack Processing"), v124);
    v354[108] = v246;
    LOWORD(v125) = 0;
    v245 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("NavigationAPIEnabled"), CFSTR("WebKitNavigationAPIEnabled"), CFSTR("Navigation API"), 4, 3, CFSTR("Enable Navigation API"), v125);
    v354[109] = v245;
    LOWORD(v126) = 0;
    v244 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("NotificationsEnabled"), CFSTR("WebKitNotificationsEnabled"), CFSTR("Notifications"), 6, 3, CFSTR("Enable the Notifications API"), v126);
    v354[110] = v244;
    LOWORD(v127) = 1;
    v243 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("OffscreenCanvasInWorkersEnabled"), CFSTR("WebKitOffscreenCanvasInWorkersEnabled"), CFSTR("OffscreenCanvas in Workers"), 6, 3, CFSTR("Support for the OffscreenCanvas APIs in Workers"), v127);
    v354[111] = v243;
    LOWORD(v128) = 1;
    v242 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("OffscreenCanvasEnabled"), CFSTR("WebKitOffscreenCanvasEnabled"), CFSTR("OffscreenCanvas"), 6, 3, CFSTR("Support for the OffscreenCanvas APIs"), v128);
    v354[112] = v242;
    LOWORD(v129) = 0;
    v241 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("OffscreenCanvasDeprecatedCommitEnabled"), CFSTR("WebKitOffscreenCanvasDeprecatedCommitEnabled"), CFSTR("OffscreenCanvasRenderingContext2D's deprecated commit() method"), 4, 3, CFSTR("Support for OffscreenCanvasRenderingContext2D's deprecated commit() method"), v129);
    v354[113] = v241;
    LOWORD(v130) = 1;
    v240 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("OverlappingBackingStoreProvidersEnabled"), CFSTR("WebKitOverlappingBackingStoreProvidersEnabled"), CFSTR("Overlapping backing stores"), 6, 2, CFSTR("Enable overlapping backing stores compositor optimization"), v130);
    v354[114] = v240;
    LOWORD(v131) = 0;
    v239 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("BlobRegistryTopOriginPartitioningEnabled"), CFSTR("WebKitBlobRegistryTopOriginPartitioningEnabled"), CFSTR("Partition Blob URL Registry"), 6, 8, CFSTR("Partition Blob URL Registry by Top-Level Origin"), v131);
    v354[115] = v239;
    LOWORD(v132) = 0;
    v238 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("PermissionsAPIEnabled"), CFSTR("WebKitPermissionsAPIEnabled"), CFSTR("Permissions API"), 6, 3, CFSTR("Enable Permissions API"), v132);
    v354[116] = v238;
    LOWORD(v133) = 1;
    v237 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("PreferPageRenderingUpdatesNear60FPSEnabled"), CFSTR("WebKitPreferPageRenderingUpdatesNear60FPSEnabled"), CFSTR("Prefer Page Rendering Updates near 60fps"), 6, 3, CFSTR("Prefer page rendering updates near 60 frames per second rather than using the display's refresh rate"), v133);
    v354[117] = v237;
    LOWORD(v134) = 0;
    v236 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("PrivateClickMeasurementDebugModeEnabled"), CFSTR("WebKitPrivateClickMeasurementDebugModeEnabled"), CFSTR("Private Click Measurement Debug Mode"), 3, 7, CFSTR("Enable Private Click Measurement Debug Mode"), v134);
    v354[118] = v236;
    LOWORD(v135) = 0;
    v235 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("PrivateTokenUsageByThirdPartyEnabled"), CFSTR("WebKitPrivateTokenUsageByThirdPartyEnabled"), CFSTR("Private Token usage by third party"), 6, 7, CFSTR("Enable private token usage by third party"), v135);
    v354[119] = v235;
    LOWORD(v136) = 0;
    v234 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ReadableByteStreamAPIEnabled"), CFSTR("WebKitReadableByteStreamAPIEnabled"), CFSTR("ReadableByteStream"), 4, 3, CFSTR("Enable Readable Byte Streams"), v136);
    v354[120] = v234;
    LOWORD(v137) = 1;
    v233 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ReportingEnabled"), CFSTR("WebKitReportingEnabled"), CFSTR("Reporting API"), 6, 3, CFSTR("Enable Reporting API"), v137);
    v354[121] = v233;
    LOWORD(v138) = 1;
    v232 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("RequestVideoFrameCallbackEnabled"), CFSTR("WebKitRequestVideoFrameCallbackEnabled"), CFSTR("RequestVideoFrameCallback"), 6, 5, CFSTR("Enable RequestVideoFrameCallback API"), v138);
    v354[122] = v232;
    LOWORD(v139) = 0;
    v231 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ScreenOrientationLockingAPIEnabled"), CFSTR("WebKitScreenOrientationLockingAPIEnabled"), CFSTR("Screen Orientation API (Locking / Unlocking)"), 4, 3, CFSTR("Enable Screen Orientation API (Locking / Unlocking)"), v139);
    v354[123] = v231;
    LOWORD(v140) = 0;
    v230 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ScreenOrientationAPIEnabled"), CFSTR("WebKitScreenOrientationAPIEnabled"), CFSTR("Screen Orientation API"), 6, 3, CFSTR("Enable Screen Orientation API"), v140);
    v354[124] = v230;
    LOWORD(v141) = 0;
    v229 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ScreenWakeLockAPIEnabled"), CFSTR("WebKitScreenWakeLockAPIEnabled"), CFSTR("Screen Wake Lock API"), 6, 3, CFSTR("Enable Screen Wake Lock API"), v141);
    v354[125] = v229;
    LOWORD(v142) = 0;
    v228 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ScreenCaptureEnabled"), CFSTR("WebKitScreenCaptureEnabled"), CFSTR("ScreenCapture"), 6, 5, CFSTR("Enable ScreenCapture"), v142);
    v354[126] = v228;
    LOWORD(v143) = 0;
    v227 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ScrollToTextFragmentFeatureDetectionEnabled"), CFSTR("WebKitScrollToTextFragmentFeatureDetectionEnabled"), CFSTR("Scroll To Text Fragment Feature Detection"), 5, 3, CFSTR("Enable Scroll To Text Fragment Feature Detection"), v143);
    v354[127] = v227;
    LOWORD(v144) = 0;
    v226 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ScrollToTextFragmentEnabled"), CFSTR("WebKitScrollToTextFragmentEnabled"), CFSTR("Scroll To Text Fragment"), 6, 3, CFSTR("Enable Scroll To Text Fragment"), v144);
    v354[128] = v226;
    LOWORD(v145) = 0;
    v225 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ScrollDrivenAnimationsEnabled"), CFSTR("WebKitScrollDrivenAnimationsEnabled"), CFSTR("Scroll-driven Animations"), 4, 1, CFSTR("Enable Scroll-driven Animations"), v145);
    v354[129] = v225;
    LOWORD(v146) = 1;
    v224 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("SelectionAPIForShadowDOMEnabled"), CFSTR("WebKitSelectionAPIForShadowDOMEnabled"), CFSTR("Selection API for shadow DOM"), 6, 3, CFSTR("Enable selection API for shadow DOM"), v146);
    v354[130] = v224;
    LOWORD(v147) = 1;
    v223 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("SendMouseEventsToDisabledFormControlsEnabled"), CFSTR("WebKitSendMouseEventsToDisabledFormControlsEnabled"), CFSTR("Send mouse events to disabled form controls"), 6, 9, CFSTR("Send mouse events to disabled form controls"), v147);
    v354[131] = v223;
    LOWORD(v148) = 0;
    v222 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ServiceWorkerNavigationPreloadEnabled"), CFSTR("WebKitServiceWorkerNavigationPreloadEnabled"), CFSTR("Service Worker Navigation Preload"), 6, 6, CFSTR("Enable Service Worker Navigation Preload API"), v148);
    v354[132] = v222;
    LOWORD(v149) = 0;
    v221 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ShapeDetection"), CFSTR("WebKitShapeDetection"), CFSTR("Shape Detection API"), 4, 5, CFSTR("Enable the Shape Detection API"), v149);
    v354[133] = v221;
    LOWORD(v150) = 0;
    v220 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("SharedWorkerEnabled"), CFSTR("WebKitSharedWorkerEnabled"), CFSTR("SharedWorker"), 6, 3, CFSTR("Enabled SharedWorker API"), v150);
    v354[134] = v220;
    LOWORD(v151) = 0;
    v219 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ShowMediaStatsContextMenuItemEnabled"), CFSTR("WebKitShowMediaStatsContextMenuItemEnabled"), CFSTR("Show Media Stats"), 3, 5, CFSTR("Adds a 'Media Stats' context menu item to <video> when the Develop menu is enabled"), v151);
    v354[135] = v219;
    LOWORD(v152) = 0;
    v218 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("SidewaysWritingModesEnabled"), CFSTR("WebKitSidewaysWritingModesEnabled"), CFSTR("Sideways writing modes"), 4, 2, CFSTR("Enable support for sideways writing modes"), v152);
    v354[136] = v218;
    LOWORD(v153) = 0;
    v217 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("StorageAPIEstimateEnabled"), CFSTR("WebKitStorageAPIEstimateEnabled"), CFSTR("Storage API Estimate"), 6, 3, CFSTR("Enable Storage API Estimate"), v153);
    v354[137] = v217;
    LOWORD(v154) = 0;
    v216 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("StorageAPIEnabled"), CFSTR("WebKitStorageAPIEnabled"), CFSTR("Storage API"), 6, 3, CFSTR("Enable Storage API"), v154);
    v354[138] = v216;
    LOWORD(v155) = 0;
    v215 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("TrackConfigurationEnabled"), CFSTR("WebKitTrackConfigurationEnabled"), CFSTR("Track Configuration API"), 4, 5, CFSTR("Track Configuration API"), v155);
    v354[139] = v215;
    LOWORD(v156) = 0;
    v214 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("TrustedTypesEnabled"), CFSTR("WebKitTrustedTypesEnabled"), CFSTR("Trusted Types"), 4, 3, CFSTR("Enable Trusted Types"), v156);
    v354[140] = v214;
    LOWORD(v157) = 0;
    v213 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("IPAddressAndLocalhostMixedContentUpgradeTestingEnabled"), CFSTR("WebKitIPAddressAndLocalhostMixedContentUpgradeTestingEnabled"), CFSTR("Upgrade IP addresses and localhost in mixed content"), 4, 8, CFSTR("Enable Upgrading IP addresses and localhost in mixed content"), v157);
    v354[141] = v213;
    LOWORD(v158) = 1;
    v212 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("UpgradeMixedContentEnabled"), CFSTR("WebKitUpgradeMixedContentEnabled"), CFSTR("Upgrade upgradable mixed content"), 6, 6, CFSTR("Upgrade upgradable mixed content"), v158);
    v354[142] = v212;
    LOWORD(v159) = 0;
    v211 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("UserActivationAPIEnabled"), CFSTR("WebKitUserActivationAPIEnabled"), CFSTR("User Activation API"), 6, 3, CFSTR("Enable User Activation API"), v159);
    v354[143] = v211;
    LOWORD(v160) = 0;
    v210 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("VerifyWindowOpenUserGestureFromUIProcess"), CFSTR("WebKitVerifyWindowOpenUserGestureFromUIProcess"), CFSTR("Verify window.open user gesture"), 4, 8, CFSTR("Verifies that the user gesture for window.open came from the UI process"), v160);
    v354[144] = v210;
    LOWORD(v161) = 1;
    v209 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("VerticalFormControlsEnabled"), CFSTR("WebKitVerticalFormControlsEnabled"), CFSTR("Vertical form control support"), 6, 9, CFSTR("Enable support for form controls in vertical writing mode"), v161);
    v354[145] = v209;
    LOWORD(v162) = 1;
    v208 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ViewTransitionsEnabled"), CFSTR("WebKitViewTransitionsEnabled"), CFSTR("View Transitions"), 6, 1, CFSTR("Enable the View Transitions API"), v162);
    v354[146] = v208;
    LOWORD(v163) = 0;
    v207 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebAnimationsCustomEffectsEnabled"), CFSTR("WebKitWebAnimationsCustomEffectsEnabled"), CFSTR("Web Animations custom effects"), 4, 1, CFSTR("Support for the CustomEffect interface"), v163);
    v354[147] = v207;
    LOWORD(v164) = 0;
    v206 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebAnimationsCustomFrameRateEnabled"), CFSTR("WebKitWebAnimationsCustomFrameRateEnabled"), CFSTR("Web Animations custom frame rate"), 4, 1, CFSTR("Support for specifying a custom frame rate for Web Animations"), v164);
    v354[148] = v206;
    LOWORD(v165) = 1;
    v205 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebCryptoSafeCurvesEnabled"), CFSTR("WebKitWebCryptoSafeCurvesEnabled"), CFSTR("Web Crypto Safe Curves"), 6, 3, CFSTR("Enable Web Crypto Safe Curves"), v165);
    v354[149] = v205;
    LOWORD(v166) = 0;
    v204 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebCryptoX25519Enabled"), CFSTR("WebKitWebCryptoX25519Enabled"), CFSTR("Web Crypto X25519 algorithm"), 5, 3, CFSTR("Enable Web Crypto X25519 algorithm"), v166);
    v354[150] = v204;
    LOWORD(v167) = 0;
    v203 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebLocksAPIEnabled"), CFSTR("WebKitWebLocksAPIEnabled"), CFSTR("Web Locks API"), 6, 3, CFSTR("Web Locks API"), v167);
    v354[151] = v203;
    LOWORD(v168) = 0;
    v202 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebShareFileAPIEnabled"), CFSTR("WebKitWebShareFileAPIEnabled"), CFSTR("Web Share API Level 2"), 6, 3, CFSTR("Enable level 2 of Web Share API"), v168);
    v354[152] = v202;
    LOWORD(v169) = 0;
    v201 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebAssemblyESMIntegrationEnabled"), CFSTR("WebKitWebAssemblyESMIntegrationEnabled"), CFSTR("WebAssembly ES module integration support"), 4, 4, CFSTR("Support for allowing WebAssembly modules to integrate as ES modules"), v169);
    v354[153] = v201;
    LOWORD(v170) = 0;
    v200 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebCodecsAV1Enabled"), CFSTR("WebKitWebCodecsAV1Enabled"), CFSTR("WebCodecs AV1 codec"), 5, 5, CFSTR("Enable WebCodecs AV1 codec"), v170);
    v354[154] = v200;
    LOWORD(v171) = 0;
    v199 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebCodecsAudioEnabled"), CFSTR("WebKitWebCodecsAudioEnabled"), CFSTR("WebCodecs Audio API"), 5, 5, CFSTR("Enable WebCodecs Audio API"), v171);
    v354[155] = v199;
    LOWORD(v172) = 0;
    v198 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebCodecsHEVCEnabled"), CFSTR("WebKitWebCodecsHEVCEnabled"), CFSTR("WebCodecs HEVC codec"), 6, 5, CFSTR("Enable WebCodecs HEVC codec"), v172);
    v354[156] = v198;
    LOWORD(v173) = 0;
    v197 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebCodecsVideoEnabled"), CFSTR("WebKitWebCodecsVideoEnabled"), CFSTR("WebCodecs Video API"), 6, 5, CFSTR("Enable WebCodecs Video API"), v173);
    v354[157] = v197;
    LOWORD(v174) = 0;
    v196 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebGLDraftExtensionsEnabled"), CFSTR("WebKitWebGLDraftExtensionsEnabled"), CFSTR("WebGL Draft Extensions"), 4, 3, CFSTR("Enable WebGL extensions that are still in draft status"), v174);
    v354[158] = v196;
    LOWORD(v175) = 0;
    v195 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebGLTimerQueriesEnabled"), CFSTR("WebKitWebGLTimerQueriesEnabled"), CFSTR("WebGL Timer Queries"), 3, 3, CFSTR("Enable WebGL extensions that provide GPU timer queries"), v175);
    v354[159] = v195;
    LOWORD(v176) = 0;
    v194 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebRTCAV1CodecEnabled"), CFSTR("WebKitWebRTCAV1CodecEnabled"), CFSTR("WebRTC AV1 codec"), 5, 5, CFSTR("Enable WebRTC AV1 codec"), v176);
    v354[160] = v194;
    LOWORD(v177) = 0;
    v193 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebRTCEncodedTransformEnabled"), CFSTR("WebKitWebRTCEncodedTransformEnabled"), CFSTR("WebRTC Encoded Transform API"), 6, 5, CFSTR("Enable WebRTC Encoded Transform API"), v177);
    v354[161] = v193;
    LOWORD(v178) = 0;
    v192 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebRTCH265CodecEnabled"), CFSTR("WebKitWebRTCH265CodecEnabled"), CFSTR("WebRTC HEVC codec"), 6, 5, CFSTR("Enable WebRTC HEVC codec"), v178);
    v354[162] = v192;
    LOWORD(v179) = 0;
    v191 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebRTCSFrameTransformEnabled"), CFSTR("WebKitWebRTCSFrameTransformEnabled"), CFSTR("WebRTC SFrame Transform API"), 4, 5, CFSTR("Enable WebRTC SFrame Transform API"), v179);
    v354[163] = v191;
    LOWORD(v180) = 0;
    cf = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebRTCVP9Profile2CodecEnabled"), CFSTR("WebKitWebRTCVP9Profile2CodecEnabled"), CFSTR("WebRTC VP9 profile 2 codec"), 6, 5, CFSTR("Enable WebRTC VP9 profile 2 codec"), v180);
    v354[164] = cf;
    LOWORD(v181) = 0;
    v7 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebTransportEnabled"), CFSTR("WebKitWebTransportEnabled"), CFSTR("WebTransport"), 4, 6, CFSTR("Enable WebTransport"), v181);
    v354[165] = v7;
    LOWORD(v182) = 1;
    v8 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WritingSuggestionsAttributeEnabled"), CFSTR("WebKitWritingSuggestionsAttributeEnabled"), CFSTR("Writing Suggestions"), 6, 3, CFSTR("Enable the writingsuggestions attribute"), v182);
    v354[166] = v8;
    LOWORD(v183) = 0;
    v9 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("IsFirstPartyWebsiteDataRemovalLiveOnTestingEnabled"), CFSTR("WebKitIsFirstPartyWebsiteDataRemovalLiveOnTestingEnabled"), CFSTR("[ITP Live-On] 1 Hour Timeout For Non-Cookie Data Removal"), 3, 7, CFSTR("Remove all non-cookie website data after just one hour of no user interaction when Intelligent Tracking Prevention is enabled"), v183);
    v354[167] = v9;
    LOWORD(v184) = 0;
    v10 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("IsFirstPartyWebsiteDataRemovalReproTestingEnabled"), CFSTR("WebKitIsFirstPartyWebsiteDataRemovalReproTestingEnabled"), CFSTR("[ITP Repro] 30 Second Timeout For Non-Cookie Data Removal"), 3, 7, CFSTR("Remove all non-cookie website data after just 30 seconds of no user interaction when Intelligent Tracking Prevention is enabled"), v184);
    v354[168] = v10;
    LOWORD(v185) = 1;
    v11 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("AlignContentOnBlocksEnabled"), CFSTR("WebKitAlignContentOnBlocksEnabled"), CFSTR("align-content on blocks"), 6, 2, CFSTR("Enable align-content for block containers"), v185);
    v354[169] = v11;
    LOWORD(v186) = 1;
    v12 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ElementCheckVisibilityEnabled"), CFSTR("WebKitElementCheckVisibilityEnabled"), CFSTR("element.checkVisibility() API"), 6, 3, CFSTR("Enable element.checkVisibility() API"), v186);
    v354[170] = v12;
    LOWORD(v187) = 0;
    v13 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("RequestIdleCallbackEnabled"), CFSTR("WebKitRequestIdleCallbackEnabled"), CFSTR("requestIdleCallback"), 5, 3, CFSTR("Enable requestIdleCallback support"), v187);
    v354[171] = v13;
    LOWORD(v188) = 0;
    v14 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSWordBreakAutoPhraseEnabled"), CFSTR("WebKitCSSWordBreakAutoPhraseEnabled"), CFSTR("word-break: auto-phrase enabled"), 4, 2, CFSTR("Enables the auto-phrase value of the word-break CSS property"), v188);
    v354[172] = v14;
    v15 = (const void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v354, 173);
    qword_1ECEC9960 = (uint64_t)v15;
    if (v15)
      CFRetain(v15);
    if (v14)
      CFRelease(v14);
    if (v13)
      CFRelease(v13);
    if (v12)
      CFRelease(v12);
    if (v11)
      CFRelease(v11);
    if (v10)
      CFRelease(v10);
    if (v9)
      CFRelease(v9);
    if (v8)
      CFRelease(v8);
    if (v7)
      CFRelease(v7);
    if (cf)
      CFRelease(cf);
    if (v191)
      CFRelease(v191);
    if (v192)
      CFRelease(v192);
    if (v193)
      CFRelease(v193);
    if (v194)
      CFRelease(v194);
    if (v195)
      CFRelease(v195);
    if (v196)
      CFRelease(v196);
    if (v197)
      CFRelease(v197);
    if (v198)
      CFRelease(v198);
    if (v199)
      CFRelease(v199);
    if (v200)
      CFRelease(v200);
    if (v201)
      CFRelease(v201);
    if (v202)
      CFRelease(v202);
    if (v203)
      CFRelease(v203);
    if (v204)
      CFRelease(v204);
    if (v205)
      CFRelease(v205);
    if (v206)
      CFRelease(v206);
    if (v207)
      CFRelease(v207);
    if (v208)
      CFRelease(v208);
    if (v209)
      CFRelease(v209);
    if (v210)
      CFRelease(v210);
    if (v211)
      CFRelease(v211);
    if (v212)
      CFRelease(v212);
    if (v213)
      CFRelease(v213);
    if (v214)
      CFRelease(v214);
    if (v215)
      CFRelease(v215);
    if (v216)
      CFRelease(v216);
    if (v217)
      CFRelease(v217);
    if (v218)
      CFRelease(v218);
    if (v219)
      CFRelease(v219);
    if (v220)
      CFRelease(v220);
    if (v221)
      CFRelease(v221);
    if (v222)
      CFRelease(v222);
    if (v223)
      CFRelease(v223);
    if (v224)
      CFRelease(v224);
    if (v225)
      CFRelease(v225);
    if (v226)
      CFRelease(v226);
    if (v227)
      CFRelease(v227);
    if (v228)
      CFRelease(v228);
    if (v229)
      CFRelease(v229);
    if (v230)
      CFRelease(v230);
    if (v231)
      CFRelease(v231);
    if (v232)
      CFRelease(v232);
    if (v233)
      CFRelease(v233);
    if (v234)
      CFRelease(v234);
    if (v235)
      CFRelease(v235);
    if (v236)
      CFRelease(v236);
    if (v237)
      CFRelease(v237);
    if (v238)
      CFRelease(v238);
    if (v239)
      CFRelease(v239);
    if (v240)
      CFRelease(v240);
    if (v241)
      CFRelease(v241);
    if (v242)
      CFRelease(v242);
    if (v243)
      CFRelease(v243);
    if (v244)
      CFRelease(v244);
    if (v245)
      CFRelease(v245);
    if (v246)
      CFRelease(v246);
    if (v247)
      CFRelease(v247);
    if (v248)
      CFRelease(v248);
    if (v249)
      CFRelease(v249);
    if (v250)
      CFRelease(v250);
    if (v251)
      CFRelease(v251);
    if (v252)
      CFRelease(v252);
    if (v253)
      CFRelease(v253);
    if (v254)
      CFRelease(v254);
    if (v255)
      CFRelease(v255);
    if (v256)
      CFRelease(v256);
    if (v257)
      CFRelease(v257);
    if (v258)
      CFRelease(v258);
    if (v259)
      CFRelease(v259);
    if (v260)
      CFRelease(v260);
    if (v261)
      CFRelease(v261);
    if (v262)
      CFRelease(v262);
    if (v263)
      CFRelease(v263);
    if (v264)
      CFRelease(v264);
    if (v265)
      CFRelease(v265);
    if (v266)
      CFRelease(v266);
    if (v267)
      CFRelease(v267);
    if (v268)
      CFRelease(v268);
    if (v269)
      CFRelease(v269);
    if (v270)
      CFRelease(v270);
    if (v271)
      CFRelease(v271);
    if (v272)
      CFRelease(v272);
    if (v273)
      CFRelease(v273);
    if (v274)
      CFRelease(v274);
    if (v275)
      CFRelease(v275);
    if (v276)
      CFRelease(v276);
    if (v277)
      CFRelease(v277);
    if (v278)
      CFRelease(v278);
    if (v279)
      CFRelease(v279);
    if (v280)
      CFRelease(v280);
    if (v281)
      CFRelease(v281);
    if (v282)
      CFRelease(v282);
    if (v283)
      CFRelease(v283);
    if (v284)
      CFRelease(v284);
    if (v285)
      CFRelease(v285);
    if (v286)
      CFRelease(v286);
    if (v287)
      CFRelease(v287);
    if (v288)
      CFRelease(v288);
    if (v289)
      CFRelease(v289);
    if (v290)
      CFRelease(v290);
    if (v291)
      CFRelease(v291);
    if (v292)
      CFRelease(v292);
    if (v293)
      CFRelease(v293);
    if (v294)
      CFRelease(v294);
    if (v295)
      CFRelease(v295);
    if (v296)
      CFRelease(v296);
    if (v297)
      CFRelease(v297);
    if (v298)
      CFRelease(v298);
    if (v299)
      CFRelease(v299);
    if (v300)
      CFRelease(v300);
    if (v301)
      CFRelease(v301);
    if (v302)
      CFRelease(v302);
    if (v303)
      CFRelease(v303);
    if (v304)
      CFRelease(v304);
    if (v305)
      CFRelease(v305);
    if (v306)
      CFRelease(v306);
    if (v307)
      CFRelease(v307);
    if (v308)
      CFRelease(v308);
    if (v309)
      CFRelease(v309);
    if (v310)
      CFRelease(v310);
    if (v311)
      CFRelease(v311);
    if (v312)
      CFRelease(v312);
    if (v313)
      CFRelease(v313);
    if (v314)
      CFRelease(v314);
    if (v315)
      CFRelease(v315);
    if (v316)
      CFRelease(v316);
    if (v317)
      CFRelease(v317);
    if (v318)
      CFRelease(v318);
    if (v319)
      CFRelease(v319);
    if (v320)
      CFRelease(v320);
    if (v321)
      CFRelease(v321);
    if (v322)
      CFRelease(v322);
    if (v323)
      CFRelease(v323);
    if (v324)
      CFRelease(v324);
    if (v325)
      CFRelease(v325);
    if (v326)
      CFRelease(v326);
    if (v327)
      CFRelease(v327);
    if (v328)
      CFRelease(v328);
    if (v329)
      CFRelease(v329);
    if (v330)
      CFRelease(v330);
    if (v331)
      CFRelease(v331);
    if (v332)
      CFRelease(v332);
    if (v333)
      CFRelease(v333);
    if (v334)
      CFRelease(v334);
    if (v335)
      CFRelease(v335);
    if (v336)
      CFRelease(v336);
    if (v337)
      CFRelease(v337);
    if (v338)
      CFRelease(v338);
    if (v339)
      CFRelease(v339);
    if (v340)
      CFRelease(v340);
    if (v341)
      CFRelease(v341);
    if (v342)
      CFRelease(v342);
    if (v343)
      CFRelease(v343);
    if (v344)
      CFRelease(v344);
    if (v345)
      CFRelease(v345);
    if (v346)
      CFRelease(v346);
    if (v347)
      CFRelease(v347);
    if (v348)
      CFRelease(v348);
    if (v349)
      CFRelease(v349);
    if (v350)
      CFRelease(v350);
    if (v351)
      CFRelease(v351);
    if (v352)
      CFRelease(v352);
    if (v353)
      CFRelease(v353);
    if (v189)
      CFRelease(v189);
    _MergedGlobals_23 = 1;
  }
  return (id)qword_1ECEC9960;
}

+ (id)_internalFeatures
{
  WebFeature *v3;
  WebFeature *v4;
  WebFeature *v5;
  WebFeature *v6;
  WebFeature *v7;
  WebFeature *v8;
  WebFeature *v9;
  WebFeature *v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  WebFeature *v87;
  WebFeature *cf;
  WebFeature *v89;
  WebFeature *v90;
  WebFeature *v91;
  WebFeature *v92;
  WebFeature *v93;
  WebFeature *v94;
  WebFeature *v95;
  WebFeature *v96;
  WebFeature *v97;
  WebFeature *v98;
  WebFeature *v99;
  WebFeature *v100;
  WebFeature *v101;
  WebFeature *v102;
  WebFeature *v103;
  WebFeature *v104;
  WebFeature *v105;
  WebFeature *v106;
  WebFeature *v107;
  WebFeature *v108;
  WebFeature *v109;
  WebFeature *v110;
  WebFeature *v111;
  WebFeature *v112;
  WebFeature *v113;
  WebFeature *v114;
  WebFeature *v115;
  WebFeature *v116;
  WebFeature *v117;
  WebFeature *v118;
  WebFeature *v119;
  WebFeature *v120;
  WebFeature *v121;
  WebFeature *v122;
  WebFeature *v123;
  WebFeature *v124;
  WebFeature *v125;
  WebFeature *v126;
  WebFeature *v127;
  WebFeature *v128;
  WebFeature *v129;
  WebFeature *v130;
  WebFeature *v131;
  WebFeature *v132;
  WebFeature *v133;
  WebFeature *v134;
  WebFeature *v135;
  WebFeature *v136;
  WebFeature *v137;
  WebFeature *v138;
  WebFeature *v139;
  WebFeature *v140;
  WebFeature *v141;
  WebFeature *v142;
  WebFeature *v143;
  WebFeature *v144;
  WebFeature *v145;
  WebFeature *v146;
  WebFeature *v147;
  WebFeature *v148;
  WebFeature *v149;
  WebFeature *v150;
  WebFeature *v151;
  WebFeature *v152;
  WebFeature *v153;
  _QWORD v154[77];

  v154[75] = *MEMORY[0x1E0C80C00];
  if ((_MergedGlobals_24 & 1) == 0)
  {
    LOWORD(v12) = 0;
    v87 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("PageAtRuleSupportEnabled"), CFSTR("WebKitPageAtRuleSupportEnabled"), CFSTR("@page CSS at-rule support"), 1, 2, CFSTR("Enable @page support"), v12);
    v154[0] = v87;
    LOWORD(v13) = 0;
    v153 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("AcceleratedFiltersEnabled"), CFSTR("WebKitAcceleratedFiltersEnabled"), CFSTR("Accelerated Filter Rendering"), 1, 0, CFSTR("Accelerated CSS and SVG filter rendering"), v13);
    v154[1] = v153;
    LOWORD(v14) = 0;
    v152 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("DOMTestingAPIsEnabled"), CFSTR("WebKitDOMTestingAPIsEnabled"), CFSTR("Additional Testing APIs for DOM Objects"), 2, 3, CFSTR("Enable additional testing APIs for DOM objects"), v14);
    v154[2] = v152;
    LOWORD(v15) = 0;
    v151 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("AllowViewportShrinkToFitContent"), CFSTR("WebKitAllowViewportShrinkToFitContent"), CFSTR("Allow Viewport Shrink to Fit Content"), 2, 0, CFSTR("Allow the viewport shrink to fit content heuristic when appropriate"), v15);
    v154[3] = v151;
    LOWORD(v16) = 0;
    v150 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("AlwaysAllowLocalWebarchive"), CFSTR("WebKitAlwaysAllowLocalWebarchive"), CFSTR("Always allow loading local Web Archive"), 2, 3, CFSTR("Enable always allowing loading local Web Archive"), v16);
    v154[4] = v150;
    LOWORD(v17) = 0;
    v149 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("AppBadgeEnabled"), CFSTR("WebKitAppBadgeEnabled"), CFSTR("App Badge"), 1, 3, CFSTR("Enable App Badge"), v17);
    v154[5] = v149;
    LOWORD(v18) = 0;
    v148 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("AppHighlightsEnabled"), CFSTR("WebKitAppHighlightsEnabled"), CFSTR("App Highlights"), 1, 2, CFSTR("Enable App Highlights"), v18);
    v154[6] = v148;
    LOWORD(v19) = 0;
    v147 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("UseAsyncUIKitInteractions"), CFSTR("WebKitUseAsyncUIKitInteractions"), CFSTR("Async UIKit Interactions"), 2, 0, CFSTR("Use Async UIKit Interactions"), v19);
    v154[7] = v147;
    LOWORD(v20) = 0;
    v146 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("AutomaticallyAdjustsViewScaleUsingMinimumEffectiveDeviceWidth"), CFSTR("WebKitAutomaticallyAdjustsViewScaleUsingMinimumEffectiveDeviceWidth"), CFSTR("Automatically Adjust View Scale"), 2, 0, CFSTR("Automatically Adjust View Scale to Fit Min. Effective Device Width"), v20);
    v154[8] = v146;
    LOWORD(v21) = 0;
    v145 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("SpringTimingFunctionEnabled"), CFSTR("WebKitSpringTimingFunctionEnabled"), CFSTR("CSS Spring Animations"), 1, 2, CFSTR("CSS Spring Animation prototype"), v21);
    v154[9] = v145;
    LOWORD(v22) = 0;
    v144 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CSSTextUnderlinePositionLeftRightEnabled"), CFSTR("WebKitCSSTextUnderlinePositionLeftRightEnabled"), CFSTR("CSS text-underline-position: left right"), 1, 2, CFSTR("Enable the property text-underline-position left and right value support"), v22);
    v154[10] = v144;
    LOWORD(v23) = 0;
    v143 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ClientBadgeEnabled"), CFSTR("WebKitClientBadgeEnabled"), CFSTR("Client Badge"), 1, 3, CFSTR("Enable Client Badge"), v23);
    v154[11] = v143;
    LOWORD(v24) = 0;
    v142 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CompositingBordersVisible"), CFSTR("WebKitShowDebugBorders"), CFSTR("Compositing borders visible"), 2, 0, &stru_1E9D6EC48, v24);
    v154[12] = v142;
    LOWORD(v25) = 0;
    v141 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CompositingRepaintCountersVisible"), CFSTR("WebKitShowRepaintCounter"), CFSTR("Compositing repaint counters visible"), 2, 0, &stru_1E9D6EC48, v25);
    v154[13] = v141;
    LOWORD(v26) = 1;
    v140 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("SampleBufferContentKeySessionSupportEnabled"), CFSTR("WebKitSampleBufferContentKeySessionSupportEnabled"), CFSTR("ContentKeySession support for SampleBuffer Renderers"), 1, 5, CFSTR("ContentKeySession support for SampleBuffer Renderers Enabled"), v26);
    v154[14] = v140;
    LOWORD(v27) = 0;
    v139 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("DOMPasteAccessRequestsEnabled"), CFSTR("WebKitDOMPasteAccessRequestsEnabled"), CFSTR("DOM Paste Access Requests"), 2, 3, CFSTR("Enable DOM Paste Access Requests"), v27);
    v154[15] = v139;
    LOWORD(v28) = 0;
    v138 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("DeclarativeWebPush"), CFSTR("WebKitDeclarativeWebPush"), CFSTR("Declarative Web Push"), 1, 3, CFSTR("Enable Declarative Web Push"), v28);
    v154[16] = v138;
    LOWORD(v29) = 0;
    v137 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("DisableScreenSizeOverride"), CFSTR("WebKitDisableScreenSizeOverride"), CFSTR("Disable screen size override"), 2, 0, &stru_1E9D6EC48, v29);
    v154[17] = v137;
    LOWORD(v30) = 0;
    v136 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ShouldDropNearSuspendedAssertionAfterDelay"), CFSTR("WebKitShouldDropNearSuspendedAssertionAfterDelay"), CFSTR("Drop Near-Suspended Assertion After Delay"), 2, 0, CFSTR("Causes processes to fully suspend after a delay"), v30);
    v154[18] = v136;
    LOWORD(v31) = 0;
    v135 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CryptoKitEnabled"), CFSTR("WebKitCryptoKitEnabled"), CFSTR("Enable CryptoKit for supported Algorithms."), 2, 8, CFSTR("Enable CryptoKit for supported Algorithms."), v31);
    v154[19] = v135;
    LOWORD(v32) = 1;
    v134 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ICECandidateFilteringEnabled"), CFSTR("WebKitICECandidateFilteringEnabled"), CFSTR("Enable ICE Candidate Filtering"), 2, 3, CFSTR("Enable ICE Candidate Filtering"), v32);
    v154[20] = v134;
    LOWORD(v33) = 0;
    v133 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("MockCaptureDevicesEnabled"), CFSTR("WebKitMockCaptureDevicesEnabled"), CFSTR("Enable Mock Capture Devices"), 2, 5, CFSTR("Enable Mock Capture Devices"), v33);
    v154[21] = v133;
    LOWORD(v34) = 0;
    v132 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("EnterKeyHintEnabled"), CFSTR("WebKitEnterKeyHintEnabled"), CFSTR("Enter Key Hint"), 2, 3, CFSTR("Enable the enterKeyHint HTML attribute"), v34);
    v154[22] = v132;
    LOWORD(v35) = 0;
    v131 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("EventHandlerDrivenSmoothKeyboardScrollingEnabled"), CFSTR("WebKitEventHandlerDrivenSmoothKeyboardScrollingEnabled"), CFSTR("EventHandler driven smooth keyboard scrolling"), 2, 3, CFSTR("Enable EventHandler driven smooth keyboard scrolling"), v35);
    v154[23] = v131;
    LOWORD(v36) = 1;
    v130 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("RestrictedHTTPResponseAccess"), CFSTR("WebKitRestrictedHTTPResponseAccess"), CFSTR("Filter HTTP Response for Web Processes"), 2, 6, CFSTR("Enable HTTP Response filtering for Web Processes"), v36);
    v154[24] = v130;
    LOWORD(v37) = 0;
    v129 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("BlockMediaLayerRehostingInWebContentProcess"), CFSTR("WebKitBlockMediaLayerRehostingInWebContentProcess"), CFSTR("GPU Process: Block Media Layer Re-hosting"), 2, 5, CFSTR("GPU Process: Block Media Layer Re-hosting in WebContent process"), v37);
    v154[25] = v129;
    LOWORD(v38) = 0;
    v128 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ManageCaptureStatusBarInGPUProcessEnabled"), CFSTR("WebKitManageCaptureStatusBarInGPUProcessEnabled"), CFSTR("GPU Process: Capture Status Bar management"), 2, 5, CFSTR("Enable Capture Status Bar management in GPU Process"), v38);
    v154[26] = v128;
    LOWORD(v39) = 0;
    v127 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("UseGPUProcessForWebGLEnabled"), CFSTR("WebKitUseGPUProcessForWebGLEnabled"), CFSTR("GPU Process: WebGL"), 2, 0, CFSTR("Process all WebGL operations in GPU Process"), v39);
    v154[27] = v127;
    LOWORD(v40) = 1;
    v126 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("AcceleratedDrawingEnabled"), CFSTR("WebKitAcceleratedDrawingEnabled"), CFSTR("GraphicsLayer accelerated drawing"), 2, 0, CFSTR("Enable GraphicsLayer accelerated drawing"), v40);
    v154[28] = v126;
    LOWORD(v41) = 0;
    v125 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ImageAnalysisDuringFindInPageEnabled"), CFSTR("WebKitImageAnalysisDuringFindInPageEnabled"), CFSTR("Image Analysis for Find-in-Page"), 1, 0, CFSTR("Trigger image analysis when performing Find-in-Page"), v41);
    v154[29] = v125;
    LOWORD(v42) = 0;
    v124 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("InWindowFullscreenEnabled"), CFSTR("WebKitInWindowFullscreenEnabled"), CFSTR("In-Window Fullscreen"), 2, 5, CFSTR("Enable In-Window Fullscreen"), v42);
    v154[30] = v124;
    LOWORD(v43) = 0;
    v123 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("LayerBasedSVGEngineEnabled"), CFSTR("WebKitLayerBasedSVGEngineEnabled"), CFSTR("Layer-based SVG Engine (LBSE)"), 1, 0, CFSTR("Enable next-generation layer-based SVG Engine (LBSE)"), v43);
    v154[31] = v123;
    LOWORD(v44) = 1;
    v122 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("LegacyOverflowScrollingTouchEnabled"), CFSTR("WebKitLegacyOverflowScrollingTouchEnabled"), CFSTR("Legacy -webkit-overflow-scrolling property"), 2, 0, CFSTR("Support the legacy -webkit-overflow-scrolling CSS property"), v44);
    v154[32] = v122;
    LOWORD(v45) = 0;
    v121 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("LegacyLineLayoutVisualCoverageEnabled"), CFSTR("WebKitLegacyLineLayoutVisualCoverageEnabled"), CFSTR("Legacy line layout visual coverage"), 2, 3, CFSTR("Enable legacy line layout visual coverage"), v45);
    v154[33] = v121;
    LOWORD(v46) = 1;
    v120 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("MediaCaptureRequiresSecureConnection"), CFSTR("WebKitMediaCaptureRequiresSecureConnection"), CFSTR("Limit Media Capture to Secure Sites"), 2, 5, CFSTR("Limit Media Capture to Secure Sites"), v46);
    v154[34] = v120;
    LOWORD(v47) = 0;
    v119 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("LinkSanitizerEnabled"), CFSTR("WebKitLinkSanitizerEnabled"), CFSTR("Link Sanitizer"), 1, 6, CFSTR("Enable link sanitizer"), v47);
    v154[35] = v119;
    LOWORD(v48) = 0;
    v118 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("LocalFileContentSniffingEnabled"), CFSTR("WebKitLocalFileContentSniffingEnabledPreferenceKey"), CFSTR("Local File Content Sniffing"), 2, 6, CFSTR("Enable Local File Content Sniffing"), v48);
    v154[36] = v118;
    LOWORD(v49) = 0;
    v117 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("LogsPageMessagesToSystemConsoleEnabled"), CFSTR("WebKitLogsPageMessagesToSystemConsoleEnabled"), CFSTR("Log page messages to system console"), 2, 3, CFSTR("Enable logging page messages to system console"), v49);
    v154[37] = v117;
    LOWORD(v50) = 0;
    v116 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("CoreMathMLEnabled"), CFSTR("WebKitCoreMathMLEnabled"), CFSTR("MathML Core"), 1, 3, CFSTR("Disable features removed from the MathML Core spec."), v50);
    v154[38] = v116;
    LOWORD(v51) = 0;
    v115 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("MomentumScrollingAnimatorEnabled"), CFSTR("WebKitMomentumScrollingAnimatorEnabled"), CFSTR("Momentum Scrolling Animator"), 2, 0, CFSTR("Generate momentum events in WebKit instead of using those delivered by the system"), v51);
    v154[39] = v115;
    LOWORD(v52) = 0;
    v114 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("MouseEventsSimulationEnabled"), CFSTR("WebKitMouseEventsSimulationEnabled"), CFSTR("Mouse events simulation"), 2, 3, CFSTR("Enable mouse events dispatch along with touch events on iOS"), v52);
    v154[40] = v114;
    LOWORD(v53) = 0;
    v113 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("MuteCameraOnMicrophoneInterruptionEnabled"), CFSTR("WebKitMuteCameraOnMicrophoneInterruptionEnabled"), CFSTR("Mute Camera on Microphone Interruption"), 2, 5, CFSTR("Mute Camera on Microphone Interruption"), v53);
    v154[41] = v113;
    LOWORD(v54) = 0;
    v112 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("FlexFormattingContextIntegrationEnabled"), CFSTR("WebKitFlexFormattingContextIntegrationEnabled"), CFSTR("Next-generation flex layout integration (FFC)"), 1, 3, CFSTR("Enable next-generation flex layout integration (FFC)"), v54);
    v154[42] = v112;
    LOWORD(v55) = 0;
    v111 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("OpportunisticSweepingAndGarbageCollectionEnabled"), CFSTR("WebKitOpportunisticSweepingAndGarbageCollectionEnabled"), CFSTR("Opportunistic Sweeping and GC"), 2, 4, CFSTR("Enable Opportunistic Sweeping and GC"), v55);
    v154[43] = v111;
    LOWORD(v56) = 1;
    v110 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("PreferSandboxedMediaParsing"), CFSTR("WebKitPreferSandboxedMediaParsing"), CFSTR("Prefer Sandboxed Parsing of Media"), 2, 5, CFSTR("Prefer parsing media out-of-process in a sandboxed service"), v56);
    v154[44] = v110;
    LOWORD(v57) = 0;
    v109 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("LegacyPluginQuirkForMailSignaturesEnabled"), CFSTR("WebKitLegacyPluginQuirkForMailSignaturesEnabled"), CFSTR("Quirk to get Mail to load signatures correctly with WebKitLegacy"), 2, 0, CFSTR("Quirk to get Mail to load signatures correctly with WebKitLegacy"), v57);
    v154[45] = v109;
    LOWORD(v58) = 1;
    v108 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("SpeakerSelectionRequiresUserGesture"), CFSTR("WebKitSpeakerSelectionRequiresUserGesture"), CFSTR("Require a user gesture for speaker selection"), 2, 5, CFSTR("Require a user gesture for speaker selection"), v58);
    v154[46] = v108;
    LOWORD(v59) = 1;
    v107 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("GetUserMediaRequiresFocus"), CFSTR("WebKitGetUserMediaRequiresFocus"), CFSTR("Require focus to start getUserMedia"), 2, 5, CFSTR("Require focus to start getUserMedia"), v59);
    v154[47] = v107;
    LOWORD(v60) = 0;
    v106 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ResourceLoadSchedulingEnabled"), CFSTR("WebKitResourceLoadSchedulingEnabled"), CFSTR("Resource Load Scheduling"), 2, 6, CFSTR("Network process side priority and visibility based resource load scheduling"), v60);
    v154[48] = v106;
    LOWORD(v61) = 0;
    v105 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ResourceUsageOverlayVisible"), CFSTR("WebKitResourceUsageOverlayVisible"), CFSTR("Resource usage overlay"), 2, 6, CFSTR("Make resource usage overlay visible"), v61);
    v154[49] = v105;
    LOWORD(v62) = 0;
    v104 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("IsSameSiteStrictEnforcementEnabled"), CFSTR("WebKitIsSameSiteStrictEnforcementEnabled"), CFSTR("SameSite strict enforcement (ITP)"), 1, 7, CFSTR("Enable SameSite strict enforcement to mitigate bounce tracking"), v62);
    v154[50] = v104;
    LOWORD(v63) = 0;
    v103 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ScrollToTextFragmentGenerationEnabled"), CFSTR("WebKitScrollToTextFragmentGenerationEnabled"), CFSTR("Scroll To Text Fragment Generation"), 1, 3, CFSTR("Enable Scroll To Text Fragment Generation Menu"), v63);
    v154[51] = v103;
    LOWORD(v64) = 1;
    v102 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("SecureContextChecksEnabled"), CFSTR("WebKitSecureContextChecksEnabled"), CFSTR("Secure Context Checks"), 2, 8, CFSTR("Allow access to HTTPS-only Web APIs over HTTP"), v64);
    v154[52] = v102;
    LOWORD(v65) = 0;
    v101 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("SiteIsolationEnabled"), CFSTR("WebKitSiteIsolationEnabled"), CFSTR("Site Isolation"), 1, 8, CFSTR("Put cross-origin iframes in a different process"), v65);
    v154[53] = v101;
    LOWORD(v66) = 1;
    v100 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("TextAnimationsEnabled"), CFSTR("WebKitTextAnimationsEnabled"), CFSTR("Text Animations"), 2, 0, CFSTR("Text Animations"), v66);
    v154[54] = v100;
    LOWORD(v67) = 0;
    v99 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ThreadedAnimationResolutionEnabled"), CFSTR("WebKitThreadedAnimationResolutionEnabled"), CFSTR("Threaded animation resolution"), 1, 1, CFSTR("Run accelerated animations on a separate thread"), v67);
    v154[55] = v99;
    LOWORD(v68) = 0;
    v98 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("TiledScrollingIndicatorVisible"), CFSTR("WebKitTiledScrollingIndicatorVisible"), CFSTR("Tiled scrolling indicator"), 2, 0, CFSTR("Make tiled scrolling indicator visible"), v68);
    v154[56] = v98;
    LOWORD(v69) = 0;
    v97 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("UndoManagerAPIEnabled"), CFSTR("WebKitUndoManagerAPIEnabled"), CFSTR("UndoManager DOM API"), 1, 3, CFSTR("Enable the UndoManager DOM API"), v69);
    v154[57] = v97;
    LOWORD(v70) = 1;
    v96 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("UserGesturePromisePropagationEnabled"), CFSTR("WebKitUserGesturePromisePropagationEnabled"), CFSTR("UserGesture Promise Propagation"), 2, 3, CFSTR("UserGesture Promise Propagation"), v70);
    v154[58] = v96;
    LOWORD(v71) = 0;
    v95 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("ServiceWorkersUserGestureEnabled"), CFSTR("WebKitServiceWorkersUserGestureEnabled"), CFSTR("Validate UserGesture requirements in Service Workers"), 2, 3, CFSTR("Validate UserGesture requirements in Service Workers"), v71);
    v154[59] = v95;
    LOWORD(v72) = 0;
    v94 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebAPIStatisticsEnabled"), CFSTR("WebKitWebAPIStatisticsEnabled"), CFSTR("Web API Statistics"), 1, 3, CFSTR("Enable Web API Statistics"), v72);
    v154[60] = v94;
    LOWORD(v73) = 0;
    v93 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebAPIsInShadowRealmEnabled"), CFSTR("WebKitWebAPIsInShadowRealmEnabled"), CFSTR("Web APIs in ShadowRealm"), 1, 3, CFSTR("Enable Web APIs to be exposed in ShadowRealm"), v73);
    v154[61] = v93;
    LOWORD(v74) = 0;
    v92 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebArchiveTestingModeEnabled"), CFSTR("WebKitWebArchiveTestingModeEnabled"), CFSTR("Web Archive testing mode"), 2, 3, CFSTR("Enable web archive testing mode"), v74);
    v154[62] = v92;
    LOWORD(v75) = 1;
    v91 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebGLUsingMetal"), CFSTR("WebKitWebGLUsingMetal"), CFSTR("WebGL via Metal"), 2, 3, CFSTR("Use the Metal backend for ANGLE"), v75);
    v154[63] = v91;
    LOWORD(v76) = 0;
    v90 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebInspectorEngineeringSettingsAllowed"), CFSTR("WebKitWebInspectorEngineeringSettingsAllowed"), CFSTR("WebInspector engineering settings allowed"), 2, 3, &stru_1E9D6EC48, v76);
    v154[64] = v90;
    LOWORD(v77) = 1;
    v89 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebRTCAudioLatencyAdaptationEnabled"), CFSTR("WebKitWebRTCAudioLatencyAdaptationEnabled"), CFSTR("WebRTC Audio Latency Adaptation"), 2, 5, CFSTR("Enable WebRTC Audio Latency Adaptation"), v77);
    v154[65] = v89;
    LOWORD(v78) = 1;
    cf = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebRTCDTMFEnabled"), CFSTR("WebKitWebRTCDTMFEnabled"), CFSTR("WebRTC DTMF"), 2, 5, CFSTR("Enable WebRTC DTMF"), v78);
    v154[66] = cf;
    LOWORD(v79) = 1;
    v3 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebRTCH264HardwareEncoderEnabled"), CFSTR("WebKitWebRTCH264HardwareEncoderEnabled"), CFSTR("WebRTC H264 Hardware encoder"), 2, 5, CFSTR("Enable H264 Hardware encoder"), v79);
    v154[67] = v3;
    LOWORD(v80) = 0;
    v4 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebRTCH264LowLatencyEncoderEnabled"), CFSTR("WebKitWebRTCH264LowLatencyEncoderEnabled"), CFSTR("WebRTC H264 LowLatency encoder"), 2, 5, CFSTR("Enable H264 LowLatency encoder"), v80);
    v154[68] = v4;
    LOWORD(v81) = 0;
    v5 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebRTCMediaPipelineAdditionalLoggingEnabled"), CFSTR("WebKitWebRTCMediaPipelineAdditionalLoggingEnabled"), CFSTR("WebRTC Media Pipeline Additional Logging"), 2, 5, CFSTR("Enable WebRTC Media Pipeline Additional Logging"), v81);
    v154[69] = v5;
    LOWORD(v82) = 0;
    v6 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebRTCRemoteVideoFrameEnabled"), CFSTR("WebKitWebRTCRemoteVideoFrameEnabled"), CFSTR("WebRTC Remote Video Frame"), 2, 5, CFSTR("Enable WebRTC Remote Video Frame"), v82);
    v154[70] = v6;
    LOWORD(v83) = 0;
    v7 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebRTCSocketsProxyingEnabled"), CFSTR("WebKitWebRTCSocketsProxyingEnabled"), CFSTR("WebRTC Sockets Proxying"), 2, 5, CFSTR("Enable WebRTC Sockets Proxying"), v83);
    v154[71] = v7;
    LOWORD(v84) = 1;
    v8 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WebRTCVP9Profile0CodecEnabled"), CFSTR("WebKitWebRTCVP9Profile0CodecEnabled"), CFSTR("WebRTC VP9 profile 0 codec"), 2, 5, CFSTR("Enable WebRTC VP9 profile 0 codec"), v84);
    v154[72] = v8;
    LOWORD(v85) = 1;
    v9 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("WriteRichTextDataWhenCopyingOrDragging"), CFSTR("WebKitWriteRichTextDataWhenCopyingOrDragging"), CFSTR("Write RTF on Copy"), 2, 0, CFSTR("Write RTF, RTFD and attributed strings to the pasteboard when copying or dragging"), v85);
    v154[73] = v9;
    LOWORD(v86) = 0;
    v10 = -[WebFeature initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:]([WebFeature alloc], "initWithKey:preferenceKey:name:status:category:details:defaultValue:hidden:", CFSTR("RequestStorageAccessThrowsExceptionUntilReload"), CFSTR("WebKitRequestStorageAccessThrowsExceptionUntilReload"), CFSTR("requestStorageAccess throws execption until reload"), 1, 3, CFSTR("requestStorageAccess throws execption until reload"), v86);
    v154[74] = v10;
    v11 = (const void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v154, 75);
    qword_1ECEC9970 = (uint64_t)v11;
    if (v11)
      CFRetain(v11);
    if (v10)
      CFRelease(v10);
    if (v9)
      CFRelease(v9);
    if (v8)
      CFRelease(v8);
    if (v7)
      CFRelease(v7);
    if (v6)
      CFRelease(v6);
    if (v5)
      CFRelease(v5);
    if (v4)
      CFRelease(v4);
    if (v3)
      CFRelease(v3);
    if (cf)
      CFRelease(cf);
    if (v89)
      CFRelease(v89);
    if (v90)
      CFRelease(v90);
    if (v91)
      CFRelease(v91);
    if (v92)
      CFRelease(v92);
    if (v93)
      CFRelease(v93);
    if (v94)
      CFRelease(v94);
    if (v95)
      CFRelease(v95);
    if (v96)
      CFRelease(v96);
    if (v97)
      CFRelease(v97);
    if (v98)
      CFRelease(v98);
    if (v99)
      CFRelease(v99);
    if (v100)
      CFRelease(v100);
    if (v101)
      CFRelease(v101);
    if (v102)
      CFRelease(v102);
    if (v103)
      CFRelease(v103);
    if (v104)
      CFRelease(v104);
    if (v105)
      CFRelease(v105);
    if (v106)
      CFRelease(v106);
    if (v107)
      CFRelease(v107);
    if (v108)
      CFRelease(v108);
    if (v109)
      CFRelease(v109);
    if (v110)
      CFRelease(v110);
    if (v111)
      CFRelease(v111);
    if (v112)
      CFRelease(v112);
    if (v113)
      CFRelease(v113);
    if (v114)
      CFRelease(v114);
    if (v115)
      CFRelease(v115);
    if (v116)
      CFRelease(v116);
    if (v117)
      CFRelease(v117);
    if (v118)
      CFRelease(v118);
    if (v119)
      CFRelease(v119);
    if (v120)
      CFRelease(v120);
    if (v121)
      CFRelease(v121);
    if (v122)
      CFRelease(v122);
    if (v123)
      CFRelease(v123);
    if (v124)
      CFRelease(v124);
    if (v125)
      CFRelease(v125);
    if (v126)
      CFRelease(v126);
    if (v127)
      CFRelease(v127);
    if (v128)
      CFRelease(v128);
    if (v129)
      CFRelease(v129);
    if (v130)
      CFRelease(v130);
    if (v131)
      CFRelease(v131);
    if (v132)
      CFRelease(v132);
    if (v133)
      CFRelease(v133);
    if (v134)
      CFRelease(v134);
    if (v135)
      CFRelease(v135);
    if (v136)
      CFRelease(v136);
    if (v137)
      CFRelease(v137);
    if (v138)
      CFRelease(v138);
    if (v139)
      CFRelease(v139);
    if (v140)
      CFRelease(v140);
    if (v141)
      CFRelease(v141);
    if (v142)
      CFRelease(v142);
    if (v143)
      CFRelease(v143);
    if (v144)
      CFRelease(v144);
    if (v145)
      CFRelease(v145);
    if (v146)
      CFRelease(v146);
    if (v147)
      CFRelease(v147);
    if (v148)
      CFRelease(v148);
    if (v149)
      CFRelease(v149);
    if (v150)
      CFRelease(v150);
    if (v151)
      CFRelease(v151);
    if (v152)
      CFRelease(v152);
    if (v153)
      CFRelease(v153);
    if (v87)
      CFRelease(v87);
    _MergedGlobals_24 = 1;
  }
  return (id)qword_1ECEC9970;
}

@end
