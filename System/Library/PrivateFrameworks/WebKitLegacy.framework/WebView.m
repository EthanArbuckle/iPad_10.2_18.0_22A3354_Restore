@implementation WebView

+ (void)_makeAllWebViewsPerformSelector:(SEL)a3
{
  if ((byte_1ECEC97E6 & 1) != 0)
  {
    if (qword_1ECEC9818)
      objc_msgSend((id)qword_1ECEC9818, "makeObjectsPerformSelector:", a3);
  }
  else
  {
    qword_1ECEC9818 = 0;
    byte_1ECEC97E6 = 1;
  }
}

- (void)_removeFromAllWebViewsSet
{
  if ((byte_1ECEC97E6 & 1) != 0)
  {
    if (qword_1ECEC9818)
      CFSetRemoveValue((CFMutableSetRef)qword_1ECEC9818, self);
  }
  else
  {
    qword_1ECEC9818 = 0;
    byte_1ECEC97E6 = 1;
  }
}

- (void)_addToAllWebViewsSet
{
  __CFSet *Mutable;
  WebView *v4;
  const void *v5;

  if ((byte_1ECEC97E6 & 1) != 0)
  {
    Mutable = (__CFSet *)qword_1ECEC9818;
    if (qword_1ECEC9818)
      goto LABEL_3;
  }
  else
  {
    qword_1ECEC9818 = 0;
    byte_1ECEC97E6 = 1;
  }
  Mutable = CFSetCreateMutable(0, 0, &NonRetainingSetCallbacks);
  if ((byte_1ECEC97E6 & 1) == 0)
  {
    byte_1ECEC97E6 = 1;
    qword_1ECEC9818 = (uint64_t)Mutable;
    v4 = self;
    goto LABEL_4;
  }
  v5 = (const void *)qword_1ECEC9818;
  qword_1ECEC9818 = (uint64_t)Mutable;
  if (!v5)
  {
LABEL_3:
    v4 = self;
LABEL_4:
    CFSetSetValue(Mutable, v4);
    return;
  }
  CFRelease(v5);
  if (byte_1ECEC97E6 == 1)
  {
    CFSetSetValue((CFMutableSetRef)qword_1ECEC9818, self);
  }
  else
  {
    qword_1ECEC9818 = 0;
    byte_1ECEC97E6 = 1;
    CFSetSetValue(0, self);
  }
}

+ (id)_standardUserAgentWithApplicationName:(id)a3
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;

  MEMORY[0x1D82A3998](&v8, a3);
  WebCore::standardUserAgentWithApplicationName();
  if (v9)
  {
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v5 = v9;
    v9 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
      {
        WTF::StringImpl::destroy(v5, v3);
        v6 = v8;
        v8 = 0;
        if (!v6)
          return (id)v4;
      }
      else
      {
        *(_DWORD *)v5 -= 2;
        v6 = v8;
        v8 = 0;
        if (!v6)
          return (id)v4;
      }
      goto LABEL_8;
    }
  }
  else
  {
    v9 = 0;
    v4 = &stru_1E9D6EC48;
  }
  v6 = v8;
  v8 = 0;
  if (!v6)
    return (id)v4;
LABEL_8:
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    return (id)v4;
  }
  WTF::StringImpl::destroy(v6, v3);
  return (id)v4;
}

- (void)_setBrowserUserAgentProductVersion:(id)a3 buildVersion:(id)a4 bundleVersion:(id)a5
{
  -[WebView setApplicationNameForUserAgent:](self, "setApplicationNameForUserAgent:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Version/%@ Mobile/15E148 Safari/%@"), a4, a3, a5));
}

- (void)_setUIWebViewUserAgentWithBuildVersion:(id)a3
{
  -[WebView setApplicationNameForUserAgent:](self, "setApplicationNameForUserAgent:", CFSTR("Mobile/15E148"));
}

+ (void)_reportException:(OpaqueJSValue *)a3 inContext:(OpaqueJSContext *)a4
{
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  BOOL v8;
  _BYTE v10[8];

  if (a3 && a4)
  {
    JSC::JSLockHolder::JSLockHolder();
    v5 = *(unsigned int *)(16 * (*(_DWORD *)a4 & 0xFFFFFFFE) + 0x4C);
    v6 = *(_DWORD *)(16 * (*(_DWORD *)a4 & 0xFFFFFFFE) + 0x4C) != 0;
    v7 = 16 * v5;
    if ((_DWORD)v5)
      v8 = v7 == MEMORY[0x1E0DCEC78];
    else
      v8 = 1;
    if (!v8)
    {
      do
      {
        v7 = *(_QWORD *)(v7 + 16);
        v6 = v7 != 0;
      }
      while (v7 != MEMORY[0x1E0DCEC78] && v7 != 0);
    }
    if (v6)
      WebCore::reportException();
    MEMORY[0x1D82A33C8](v10);
  }
}

- (void)_dispatchPendingLoadRequests
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)WebCore::platformStrategies((WebCore *)self);
  v3 = v2[1];
  if (!v3)
  {
    v3 = (*(uint64_t (**)(_QWORD *))(*v2 + 16))(v2);
    v2[1] = v3;
  }
  WebResourceLoadScheduler::servePendingRequests(v3, 0);
}

- (void)_injectLaBanquePostaleQuirks
{
  WTF::StringImpl *v2;
  WebCore::UserScript *v3;
  StringImpl *v4;
  WTF::StringImpl *v5;
  uint64_t v6;
  WTF *v7;
  uint64_t v8;
  WTF::StringImpl *v9;
  WTF *v10;
  WTF *v11;
  uint64_t v12;
  WTF::StringImpl *v13;
  WTF *v14;
  WTF::StringImpl *v15;
  StringImpl *v16;
  WTF *v17;
  void *v18;
  WTF *v19;
  uint64_t v20;
  WTF *v21;
  uint64_t v22;
  WTF::StringImpl *v23[5];
  WebCore::UserScript *v24;
  WTF::StringImpl *v25;

  if (_MergedGlobals_11 == 1)
  {
    v2 = (WTF::StringImpl *)qword_1ECEC97F8;
  }
  else
  {
    createLaBanquePostaleQuirksScript(v23);
    v2 = v23[0];
    qword_1ECEC97F8 = (uint64_t)v23[0];
    _MergedGlobals_11 = 1;
  }
  v23[0] = 0;
  WTF::URL::invalidate((WTF::URL *)v23);
  v21 = 0;
  v22 = 0;
  v19 = 0;
  v20 = 0;
  v3 = (WebCore::UserScript *)WTF::fastMalloc((WTF *)0x58);
  MEMORY[0x1D82A3998](&v25, v2);
  MEMORY[0x1D82A3CC8](v3, &v25, v23, &v21, &v19, 1, 0, 0);
  v5 = v25;
  v24 = v3;
  v25 = 0;
  if (!v5)
  {
LABEL_6:
    v6 = HIDWORD(v20);
    if (!HIDWORD(v20))
      goto LABEL_15;
    goto LABEL_9;
  }
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
    goto LABEL_6;
  }
  WTF::StringImpl::destroy(v5, v4);
  v6 = HIDWORD(v20);
  if (!HIDWORD(v20))
    goto LABEL_15;
LABEL_9:
  v7 = v19;
  v8 = 8 * v6;
  do
  {
    v9 = *(WTF::StringImpl **)v7;
    *(_QWORD *)v7 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
        WTF::StringImpl::destroy(v9, v4);
      else
        *(_DWORD *)v9 -= 2;
    }
    v7 = (WTF *)((char *)v7 + 8);
    v8 -= 8;
  }
  while (v8);
LABEL_15:
  v10 = v19;
  if (v19)
  {
    v19 = 0;
    LODWORD(v20) = 0;
    WTF::fastFree(v10, v4);
  }
  if (HIDWORD(v22))
  {
    v11 = v21;
    v12 = 8 * HIDWORD(v22);
    do
    {
      v13 = *(WTF::StringImpl **)v11;
      *(_QWORD *)v11 = 0;
      if (v13)
      {
        if (*(_DWORD *)v13 == 2)
          WTF::StringImpl::destroy(v13, v4);
        else
          *(_DWORD *)v13 -= 2;
      }
      v11 = (WTF *)((char *)v11 + 8);
      v12 -= 8;
    }
    while (v12);
  }
  v14 = v21;
  if (v21)
  {
    v21 = 0;
    LODWORD(v22) = 0;
    WTF::fastFree(v14, v4);
  }
  v15 = v23[0];
  v23[0] = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2)
      WTF::StringImpl::destroy(v15, v4);
    else
      *(_DWORD *)v15 -= 2;
  }
  +[WebScriptWorld world](WebScriptWorld, "world");
  v24 = 0;
  WebCore::UserContentController::addUserScript();
  if (v3)
  {
    WebCore::UserScript::~UserScript(v3, v16);
    WTF::fastFree(v17, v18);
  }
}

- (void)_commonInitializationWithFrameName:(id)a3 groupName:(id)a4
{
  WebPreferences *v7;
  WebViewPrivate *v8;
  void *m_ptr;
  void *v10;
  WebViewPrivate *v11;
  void *v12;
  void *v13;
  CFTypeRef v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;
  double v18;
  double v19;
  WTF *v20;
  WebCore *v21;
  WebPlatformStrategies *v22;
  WebCore::WebSQLiteDatabaseTrackerClient *v23;
  WebCore::GamepadProvider *v24;
  WebCore::GameControllerGamepadProvider *v25;
  NSString *v26;
  const WTF::String *v27;
  StringImpl *v28;
  WTF::StringImpl *v29;
  WTF::StringImpl *v30;
  StringImpl *v31;
  WebViewPrivate *v32;
  WebViewGroup *v33;
  WebViewGroup *v34;
  WTF::StringImpl *v35;
  WTF *v36;
  void *v37;
  WTF::StringImpl *v38;
  WebViewGroup *v39;
  uint64_t v40;
  unsigned int *v41;
  WebEditorClient *v42;
  WebCore::WebRTCProvider *v43;
  uint64_t v44;
  _DWORD *v45;
  BackForwardList *v46;
  _DWORD *v47;
  unsigned int v48;
  _QWORD *v49;
  WTF::StringImpl *v50;
  WebCore::Process *IdentifierInternal;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  _QWORD *v56;
  WebCore::DummyModelPlayerProvider *v57;
  LegacyHistoryItemClient *v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  id *v62;
  StringImpl *v63;
  WebFrameView *v64;
  uint64_t v65;
  id *v66;
  WTF *v67;
  void *v68;
  _QWORD *v69;
  _DWORD *v70;
  LegacyHistoryItemClient *v71;
  WebCore::DummyModelPlayerProvider *v72;
  WebCore::DummyModelPlayerProvider *v73;
  WTF *v74;
  void *v75;
  _QWORD *v76;
  WTF *v77;
  WTF::StringImpl *v78;
  unsigned int *v79;
  unsigned int *v80;
  unsigned int v81;
  unsigned int v82;
  _DWORD *v83;
  _DWORD *v84;
  _QWORD *v85;
  uint64_t v86;
  WTF *v87;
  _DWORD *v88;
  uint64_t v89;
  unsigned int *v90;
  unsigned int v91;
  unsigned int v92;
  _QWORD *v93;
  _DWORD *v94;
  unsigned int *v95;
  unsigned int *v96;
  unsigned int v97;
  unsigned int v98;
  _DWORD *v99;
  _DWORD *v100;
  _DWORD *v101;
  uint64_t v102;
  unsigned int *v103;
  unsigned int *v104;
  unsigned int v105;
  unsigned int v106;
  WebEditorClient *v107;
  WTF *v108;
  void *v109;
  WebInspectorClient *v110;
  WebInspectorClient *v111;
  _QWORD *v112;
  _QWORD *v113;
  uint64_t v114;
  const WTF::String *v115;
  const WTF::String *v116;
  uint64_t v117;
  unint64_t v118;
  WTF::StringImpl *v119;
  WebCore::ApplicationCacheStorage *v120;
  uint64_t v121;
  _DWORD *v122;
  WTF *v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  _DWORD *v127;
  WebKit::WebStorageNamespaceProvider *v128;
  WebKit::WebStorageNamespaceProvider *v129;
  _DWORD *v130;
  _DWORD *v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  WebViewPrivate *v139;
  WTF::StringImpl *v140;
  WTF::StringImpl *v141;
  int v142;
  Page *v143;
  uint64_t v144;
  unsigned int *v145;
  unsigned int v146;
  unsigned int v147;
  unsigned int v148;
  unsigned int *v149;
  unsigned int v150;
  unsigned int v151;
  Page *v152;
  StringImpl *v153;
  WTF::StringImpl *v154;
  WTF *v155;
  void *v156;
  WTF *v157;
  void *v158;
  Page *v159;
  uint64_t v160;
  WebCore::GeolocationClient *v161;
  uint64_t v162;
  Page *v163;
  uint64_t v164;
  StringImpl *v165;
  WTF::StringImpl *v166;
  WTF::StringImpl *v167;
  void *v168;
  void *v169;
  WebFixedPositionContent *v170;
  WebViewPrivate *v171;
  void *v172;
  const __CFString *v173;
  Page *v174;
  StringImpl *v175;
  WTF::StringImpl *v176;
  char v177;
  uint64_t v178;
  unsigned int v179;
  _QWORD *v180;
  uint64_t v181;
  WebPreferences *v182;
  void *v183;
  WebCore *v184;
  unint64_t v185;
  unsigned int v186;
  unsigned int v187;
  uint64_t v188;
  _QWORD *v189;
  uint64_t v190;
  StringImpl *v191;
  uint64_t v192;
  _QWORD *v193;
  _QWORD *v194;
  _QWORD *v195;
  _QWORD *v196;
  WTF::StringImpl **v197;
  WebCore::Process *v198;
  uint64_t v199;
  uint64_t *v200;
  _QWORD *v201;
  _QWORD *v202;
  WebFrameView *v203;
  uint64_t v204;
  objc_super v205;
  uint64_t v206;
  id *v207;
  uint64_t v208;
  _QWORD *v209;
  _DWORD *v210;
  LegacyHistoryItemClient *v211;
  WebCore::DummyModelPlayerProvider *v212;
  WebCore::DummyModelPlayerProvider *v213;
  WTF *v214;
  _QWORD *v215;
  _DWORD *v216;
  _DWORD *v217;
  _QWORD *v218;
  WTF *v219;
  uint64_t v220;
  WTF::StringImpl *v221;
  int v222;
  _QWORD *v223;
  unsigned int *v224;
  _DWORD *v225;
  _DWORD *v226;
  _DWORD *v227;
  _DWORD *v228;
  uint64_t v229;
  unsigned int *v230;
  WebEditorClient *v231;
  WebEditorClient *v232;
  CFTypeRef cf[3];
  uint64_t v234;
  _QWORD *v235;
  WebInspectorClient *v236;
  WebCore::ApplicationCacheStorage *v237;
  _DWORD *v238;
  _DWORD *v239;
  WebKit::WebStorageNamespaceProvider *v240;
  _DWORD *v241;
  uint64_t v242;
  char v243;
  uint64_t v244;
  char v245;
  uint64_t v246;
  char v247;
  _QWORD v248[2];

  v7 = +[WebPreferences standardPreferences](WebPreferences, "standardPreferences");
  -[WebPreferences willAddToWebView](v7, "willAddToWebView");
  v8 = self->_private;
  if (v7)
    CFRetain(v7);
  m_ptr = v8->preferences.m_ptr;
  v8->preferences.m_ptr = v7;
  if (m_ptr)
    CFRelease(m_ptr);
  self->_private->mainFrameDocumentReady = 0;
  self->_private->drawsBackground = 1;
  v221 = (WTF::StringImpl *)0x11040000FFFFFFFFLL;
  WebCore::cachedCGColor();
  v11 = self->_private;
  v12 = (void *)cf[0];
  cf[0] = 0;
  v13 = v11->backgroundColor.m_ptr;
  v11->backgroundColor.m_ptr = v12;
  if (v13)
  {
    CFRelease(v13);
    v14 = cf[0];
    cf[0] = 0;
    if (v14)
      CFRelease(v14);
  }
  if (((unint64_t)v221 & 0x8000000000000) != 0)
  {
    v15 = (unsigned int *)((unint64_t)v221 & 0xFFFFFFFFFFFFLL);
    do
    {
      v16 = __ldaxr(v15);
      v17 = v16 - 1;
    }
    while (__stlxr(v17, v15));
    if (!v17)
    {
      atomic_store(1u, v15);
      WTF::fastFree((WTF *)v15, v10);
    }
  }
  -[WebView frame](self, "frame");
  v203 = -[WebFrameView initWithFrame:]([WebFrameView alloc], "initWithFrame:", 0.0, 0.0, v18, v19);
  -[WebFrameView setAutoresizingMask:](v203, "setAutoresizingMask:", 18);
  -[WebView addSubview:](self, "addSubview:", v203);
  v20 = (WTF *)-[WebView updateTouchBar](self, "updateTouchBar");
  if ((byte_1ECEC97E1 & 1) == 0)
  {
    WTF::logChannels(v20);
    LOBYTE(v246) = 0;
    v247 = 0;
    v21 = (WebCore *)WTF::LogChannels::initializeLogChannelsIfNecessary();
    WebCore::logChannels(v21);
    LOBYTE(v244) = 0;
    v245 = 0;
    WTF::LogChannels::initializeLogChannelsIfNecessary();
    {
      WTF::NeverDestroyed<WebKit::LogChannels,WTF::AnyThreadsAccessTraits>::NeverDestroyed<>((uint64_t)&WebKit::logChannels(void)::logChannels);
    }
    LOBYTE(v242) = 0;
    v243 = 0;
    v22 = (WebPlatformStrategies *)WTF::LogChannels::initializeLogChannelsIfNecessary();
    WebPlatformStrategies::initializeIfNecessary(v22);
    v23 = (WebCore::WebSQLiteDatabaseTrackerClient *)WebCore::initializeDOMWrapperHooks();
    WebCore::WebSQLiteDatabaseTrackerClient::sharedWebSQLiteDatabaseTrackerClient(v23);
    WebCore::SQLiteDatabaseTracker::setClient();
    if (-[WebPreferences databasesEnabled](v7, "databasesEnabled"))
      +[WebDatabaseManager sharedWebDatabaseManager](WebDatabaseManager, "sharedWebDatabaseManager");
    v24 = (WebCore::GamepadProvider *)-[WebPreferences storageTrackerEnabled](v7, "storageTrackerEnabled");
    if ((_DWORD)v24)
      WebKitInitializeStorageIfNecessary();
    if ((byte_1ECEC97E7 & 1) == 0)
    {
      v25 = (WebCore::GameControllerGamepadProvider *)WebCore::GamepadProvider::singleton(v24);
      WebCore::GameControllerGamepadProvider::singleton(v25);
      v24 = (WebCore::GamepadProvider *)WebCore::GamepadProvider::setSharedProvider();
      byte_1ECEC97E7 = 1;
    }
    if (WebCore::IOSApplication::isMobileSafari(v24))
      WebCore::DeprecatedGlobalSettings::setShouldManageAudioSessionCategory((WebCore::DeprecatedGlobalSettings *)1);
    v26 = NSTemporaryDirectory();
    MEMORY[0x1D82A3998](&v221, v26);
    WTF::FileSystemImpl::pathByAppendingComponent();
    WebCore::HTMLMediaElement::setMediaCacheDirectory((WebCore::HTMLMediaElement *)cf, v27);
    v29 = (WTF::StringImpl *)cf[0];
    cf[0] = 0;
    if (v29)
    {
      if (*(_DWORD *)v29 == 2)
      {
        WTF::StringImpl::destroy(v29, v28);
        v30 = v221;
        v221 = 0;
        if (!v30)
        {
LABEL_33:
          byte_1ECEC97E1 = 1;
          goto LABEL_34;
        }
LABEL_30:
        if (*(_DWORD *)v30 == 2)
          WTF::StringImpl::destroy(v30, v28);
        else
          *(_DWORD *)v30 -= 2;
        goto LABEL_33;
      }
      *(_DWORD *)v29 -= 2;
    }
    v30 = v221;
    v221 = 0;
    if (!v30)
      goto LABEL_33;
    goto LABEL_30;
  }
LABEL_34:
  MEMORY[0x1D82A3998](&v221, a4);
  MEMORY[0x1D82A3998](v248, objc_msgSend(self->_private->preferences.m_ptr, "_localStorageDatabasePath"));
  WebViewGroup::getOrCreate((WebViewGroup *)&v221, (const WTF::String *)v248, (WebViewGroup **)cf);
  v32 = self->_private;
  v33 = (WebViewGroup *)cf[0];
  cf[0] = 0;
  v34 = v32->group.m_ptr;
  v32->group.m_ptr = v33;
  if (!v34)
    goto LABEL_37;
  if (*(_DWORD *)v34 != 1)
  {
    --*(_DWORD *)v34;
LABEL_37:
    v35 = (WTF::StringImpl *)v248[0];
    v248[0] = 0;
    if (!v35)
      goto LABEL_42;
    goto LABEL_40;
  }
  WebViewGroup::~WebViewGroup(v34, v31);
  WTF::fastFree(v36, v37);
  v35 = (WTF::StringImpl *)v248[0];
  v248[0] = 0;
  if (!v35)
    goto LABEL_42;
LABEL_40:
  if (*(_DWORD *)v35 == 2)
  {
    WTF::StringImpl::destroy(v35, v31);
    v38 = v221;
    v221 = 0;
    if (!v38)
      goto LABEL_48;
    goto LABEL_45;
  }
  *(_DWORD *)v35 -= 2;
LABEL_42:
  v38 = v221;
  v221 = 0;
  if (!v38)
    goto LABEL_48;
LABEL_45:
  if (*(_DWORD *)v38 == 2)
    WTF::StringImpl::destroy(v38, v31);
  else
    *(_DWORD *)v38 -= 2;
LABEL_48:
  v39 = self->_private->group.m_ptr;
  v221 = (WTF::StringImpl *)self;
  WTF::HashTable<WebView *,WebView *,WTF::IdentityExtractor,WTF::DefaultHash<WebView *>,WTF::HashTraits<WebView *>,WTF::HashTraits<WebView *>>::add((uint64_t *)v39 + 2, (uint64_t *)&v221, (uint64_t)cf);
  v40 = WTF::fastMalloc((WTF *)0x18);
  *(_DWORD *)(v40 + 8) = 1;
  v41 = (unsigned int *)(v40 + 8);
  *(_QWORD *)v40 = &off_1E9D6BB60;
  v204 = v40;
  *(_QWORD *)(v40 + 16) = 0;
  WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>::generateIdentifierInternal();
  -[WebPreferences privateBrowsingEnabled](-[WebView preferences](self, "preferences"), "privateBrowsingEnabled");
  v42 = (WebEditorClient *)WTF::fastMalloc((WTF *)0xB8);
  WebEditorClient::WebEditorClient(v42, self);
  v231 = 0;
  v232 = v42;
  v43 = (WebCore::WebRTCProvider *)WTF::fastMalloc((WTF *)0x10);
  *((_DWORD *)v43 + 2) = 1;
  *(_QWORD *)v43 = &unk_1E9D6A8B0;
  v230 = (unsigned int *)v43;
  WebCore::WebRTCProvider::create(v43);
  v44 = WTF::fastMalloc((WTF *)0x10);
  *(_DWORD *)(v44 + 8) = 1;
  *(_QWORD *)v44 = &off_1E9D6BB88;
  v45 = (_DWORD *)*((_QWORD *)self->_private->group.m_ptr + 5);
  ++v45[2];
  v227 = v45;
  v228 = (_DWORD *)v44;
  v46 = (BackForwardList *)WTF::fastMalloc((WTF *)0x48);
  BackForwardList::BackForwardList(v46, self);
  v226 = v47;
  do
    v48 = __ldaxr(v41);
  while (__stlxr(v48 + 1, v41));
  v224 = (unsigned int *)v204;
  WebCore::CookieJar::create();
  v49 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v49 = &unk_1E9D6E888;
  v49[1] = self;
  v223 = v49;
  v50 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
  *(_QWORD *)v50 = off_1E9D6C260;
  v221 = v50;
  v222 = 0;
  if (WTF::ObjectIdentifierGeneric<WebCore::FrameIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>::m_generationProtected)
  {
    __break(0xC471u);
    JUMPOUT(0x1D8060294);
  }
  IdentifierInternal = (WebCore::Process *)WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>::generateIdentifierInternal();
  v52 = WebCore::Process::identifier(IdentifierInternal);
  v220 = 0;
  v53 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v53 = off_1E9D6C288;
  v53[1] = 0;
  v219 = 0;
  v248[0] = v53;
  v54 = (_QWORD *)WTF::fastMalloc((WTF *)8);
  *v54 = MEMORY[0x1E0DD8FB8] + 16;
  v218 = v54;
  WebBroadcastChannelRegistry::getOrCreate(-[WebPreferences privateBrowsingEnabled](-[WebView preferences](self, "preferences"), "privateBrowsingEnabled"), (uint64_t *)&v216);
  v55 = (uint64_t)v216;
  v216 = 0;
  v217 = (_DWORD *)v55;
  v56 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  v56[1] = 0;
  v56[2] = 0;
  *v56 = off_1E9D6C300;
  v214 = 0;
  v215 = v56;
  v57 = (WebCore::DummyModelPlayerProvider *)WTF::fastMalloc((WTF *)8);
  WebCore::DummyModelPlayerProvider::DummyModelPlayerProvider(v57);
  v212 = 0;
  v213 = v57;
  v58 = (LegacyHistoryItemClient *)WTF::fastMalloc((WTF *)0x10);
  *((_DWORD *)v58 + 2) = 1;
  *(_QWORD *)v58 = off_1E9D6C198;
  v211 = v58;
  v59 = LegacyHistoryItemClient::singleton(v58);
  ++*(_DWORD *)(v59 + 8);
  v210 = (_DWORD *)v59;
  v60 = (_QWORD *)WTF::fastMalloc((WTF *)8);
  *v60 = &unk_1E9D6E218;
  v209 = v60;
  v61 = WTF::fastMalloc((WTF *)0x20);
  WebCore::ChromeClient::ChromeClient((WebCore::ChromeClient *)v61);
  *(_QWORD *)v61 = &unk_1E9D6C4E0;
  *(_BYTE *)(v61 + 8) = 0;
  objc_initWeak((id *)(v61 + 16), self);
  *(_QWORD *)v61 = &unk_1E9D6CC80;
  *(_DWORD *)(v61 + 24) = 0;
  v207 = 0;
  v208 = v61;
  v62 = (id *)WTF::fastMalloc((WTF *)0x10);
  *v62 = &unk_1E9D6D430;
  objc_initWeak(v62 + 1, self);
  v201 = v248;
  v202 = &v218;
  v199 = v52;
  v200 = &v220;
  v197 = &v221;
  v198 = IdentifierInternal;
  v195 = &v225;
  v196 = &v223;
  v193 = &v227;
  v194 = &v226;
  WebCore::PageConfiguration::PageConfiguration();
  v206 = 0;
  v64 = v203;
  if (v62)
    (*((void (**)(id *))*v62 + 1))(v62);
  v65 = v208;
  v208 = 0;
  if (v65)
    (*(void (**)(uint64_t))(*(_QWORD *)v65 + 1904))(v65);
  v66 = v207;
  v207 = 0;
  if (v66)
  {
    objc_destroyWeak(v66 + 2);
    WebCore::ChromeClient::~ChromeClient((WebCore::ChromeClient *)v66);
    WTF::fastFree(v67, v68);
  }
  v69 = v209;
  v209 = 0;
  if (v69)
    (*(void (**)(_QWORD *))(*v69 + 152))(v69);
  v70 = v210;
  v210 = 0;
  if (v70)
  {
    if (v70[2] == 1)
    {
      (*(void (**)(_DWORD *))(*(_QWORD *)v70 + 8))(v70);
      v71 = v211;
      v211 = 0;
      if (!v71)
        goto LABEL_68;
      goto LABEL_63;
    }
    --v70[2];
  }
  v71 = v211;
  v211 = 0;
  if (!v71)
    goto LABEL_68;
LABEL_63:
  if (*((_DWORD *)v71 + 2) == 1)
    (*(void (**)(LegacyHistoryItemClient *))(*(_QWORD *)v71 + 8))(v71);
  else
    --*((_DWORD *)v71 + 2);
LABEL_68:
  v72 = v213;
  v213 = 0;
  if (v72)
    (*(void (**)(WebCore::DummyModelPlayerProvider *))(*(_QWORD *)v72 + 8))(v72);
  v73 = v212;
  v212 = 0;
  if (v73)
  {
    WebCore::DummyModelPlayerProvider::~DummyModelPlayerProvider(v73);
    WTF::fastFree(v74, v75);
  }
  v76 = v215;
  v215 = 0;
  if (v76)
    (*(void (**)(_QWORD *))(*v76 + 8))(v76);
  v77 = v214;
  v214 = 0;
  if (v77)
  {
    v78 = (WTF::StringImpl *)*((_QWORD *)v77 + 2);
    *((_QWORD *)v77 + 2) = 0;
    if (v78)
    {
      if (*(_DWORD *)v78 == 2)
      {
        WTF::StringImpl::destroy(v78, v63);
        v79 = (unsigned int *)*((_QWORD *)v77 + 1);
        *((_QWORD *)v77 + 1) = 0;
        if (!v79)
        {
LABEL_85:
          WTF::fastFree(v77, v63);
          goto LABEL_86;
        }
LABEL_81:
        v80 = v79 + 2;
        do
        {
          v81 = __ldaxr(v80);
          v82 = v81 - 1;
        }
        while (__stlxr(v82, v80));
        if (!v82)
        {
          atomic_store(1u, v79 + 2);
          (*(void (**)(unsigned int *))(*(_QWORD *)v79 + 8))(v79);
        }
        goto LABEL_85;
      }
      *(_DWORD *)v78 -= 2;
    }
    v79 = (unsigned int *)*((_QWORD *)v77 + 1);
    *((_QWORD *)v77 + 1) = 0;
    if (!v79)
      goto LABEL_85;
    goto LABEL_81;
  }
LABEL_86:
  v83 = v217;
  v217 = 0;
  if (v83)
  {
    if (v83[2] == 1)
    {
      (*(void (**)(_DWORD *))(*(_QWORD *)v83 + 8))(v83);
      v84 = v216;
      if (!v216)
        goto LABEL_95;
      goto LABEL_90;
    }
    --v83[2];
  }
  v84 = v216;
  if (!v216)
    goto LABEL_95;
LABEL_90:
  if (v84[2] == 1)
    (*(void (**)(_DWORD *))(*(_QWORD *)v84 + 8))(v84);
  else
    --v84[2];
LABEL_95:
  v85 = v218;
  v218 = 0;
  if (v85)
    (*(void (**)(_QWORD *))(*v85 + 8))(v85);
  v86 = v248[0];
  v248[0] = 0;
  if (v86)
    (*(void (**)(uint64_t))(*(_QWORD *)v86 + 8))(v86);
  v87 = v219;
  v219 = 0;
  if (v87)
  {
    v88 = (_DWORD *)*((_QWORD *)v87 + 1);
    *((_QWORD *)v87 + 1) = 0;
    if (v88)
    {
      if (v88[2] == 1)
        (*(void (**)(_DWORD *))(*(_QWORD *)v88 + 8))(v88);
      else
        --v88[2];
    }
    WTF::fastFree(v87, v63);
  }
  v89 = v220;
  v220 = 0;
  if (v89)
  {
    v90 = (unsigned int *)(v89 + 8);
    do
    {
      v91 = __ldaxr(v90);
      v92 = v91 - 1;
    }
    while (__stlxr(v92, v90));
    if (!v92)
    {
      atomic_store(1u, v90);
      v189 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v189 = off_1E9D6A4D8;
      v189[1] = v90;
      v248[0] = v189;
      WTF::ensureOnMainThread();
      v190 = v248[0];
      v248[0] = 0;
      if (v190)
        (*(void (**)(uint64_t))(*(_QWORD *)v190 + 8))(v190);
    }
  }
  if (v222 != -1)
    ((void (*)(_QWORD *, WTF::StringImpl **))off_1E9D6C1B8[v222])(v248, &v221);
  v93 = v223;
  v223 = 0;
  if (v93)
    (*(void (**)(_QWORD *))(*v93 + 8))(v93);
  v94 = v225;
  v225 = 0;
  if (v94)
  {
    if (v94[2] == 1)
    {
      (*(void (**)(_DWORD *))(*(_QWORD *)v94 + 120))(v94);
      v95 = v224;
      v224 = 0;
      if (!v95)
        goto LABEL_121;
      goto LABEL_117;
    }
    --v94[2];
  }
  v95 = v224;
  v224 = 0;
  if (!v95)
    goto LABEL_121;
LABEL_117:
  v96 = v95 + 2;
  do
  {
    v97 = __ldaxr(v96);
    v98 = v97 - 1;
  }
  while (__stlxr(v98, v96));
  if (!v98)
  {
    atomic_store(1u, v95 + 2);
    (*(void (**)(unsigned int *))(*(_QWORD *)v95 + 16))(v95);
  }
LABEL_121:
  v99 = v226;
  v226 = 0;
  if (!v99)
    goto LABEL_124;
  if (v99[2] != 1)
  {
    --v99[2];
LABEL_124:
    v100 = v227;
    v227 = 0;
    if (v100)
      goto LABEL_125;
LABEL_131:
    v101 = v228;
    v228 = 0;
    if (!v101)
      goto LABEL_134;
    goto LABEL_132;
  }
  (*(void (**)(_DWORD *))(*(_QWORD *)v99 + 8))(v99);
  v100 = v227;
  v227 = 0;
  if (!v100)
    goto LABEL_131;
LABEL_125:
  if (v100[2] == 1)
  {
    (*(void (**)(_DWORD *))(*(_QWORD *)v100 + 8))(v100);
    v101 = v228;
    v228 = 0;
    if (!v101)
      goto LABEL_134;
  }
  else
  {
    --v100[2];
    v101 = v228;
    v228 = 0;
    if (!v101)
      goto LABEL_134;
  }
LABEL_132:
  if (v101[2] == 1)
  {
    (*(void (**)(_DWORD *))(*(_QWORD *)v101 + 16))(v101);
    v102 = v229;
    v229 = 0;
    if (!v102)
      goto LABEL_136;
    goto LABEL_135;
  }
  --v101[2];
LABEL_134:
  v102 = v229;
  v229 = 0;
  if (v102)
LABEL_135:
    (*(void (**)(uint64_t))(*(_QWORD *)v102 + 8))(v102);
LABEL_136:
  v103 = v230;
  v230 = 0;
  if (!v103)
    goto LABEL_140;
  v104 = v103 + 2;
  do
  {
    v105 = __ldaxr(v104);
    v106 = v105 - 1;
  }
  while (__stlxr(v106, v104));
  if (v106)
  {
LABEL_140:
    v107 = v232;
    v232 = 0;
    if (!v107)
      goto LABEL_142;
    goto LABEL_141;
  }
  atomic_store(1u, v103 + 2);
  (*(void (**)(unsigned int *))(*(_QWORD *)v103 + 24))(v103);
  v107 = v232;
  v232 = 0;
  if (v107)
LABEL_141:
    (*(void (**)(WebEditorClient *))(*(_QWORD *)v107 + 8))(v107);
LABEL_142:
  if (v231)
  {
    WebEditorClient::~WebEditorClient(v231);
    WTF::fastFree(v108, v109);
  }
  v110 = (WebInspectorClient *)WTF::fastMalloc((WTF *)0x30);
  WebInspectorClient::WebInspectorClient(v110, self);
  v111 = v236;
  v236 = v110;
  if (v111)
    (*(void (**)(WebInspectorClient *))(*(_QWORD *)v111 + 8))(v111);
  v112 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v112 = &unk_1E9D6D840;
  v112[1] = self;
  v113 = v235;
  v235 = v112;
  if (v113)
    (*(void (**)(_QWORD *))(*v113 + 80))(v113);
  v114 = WTF::fastMalloc((WTF *)0x18);
  *(_DWORD *)(v114 + 8) = 0;
  *(_QWORD *)v114 = &unk_1E9D6C488;
  *(_QWORD *)(v114 + 16) = self;
  v117 = v234;
  v234 = v114;
  if (v117)
    (*(void (**)(uint64_t))(*(_QWORD *)v117 + 8))(v117);
  v118 = atomic_load(&qword_1ECEC9820);
  if (v118 != -1)
  {
    v221 = (WTF::StringImpl *)&v232;
    v248[0] = &v221;
    std::__call_once(&qword_1ECEC9820, v248, (void (__cdecl *)(void *))std::__call_once_proxy[abi:sn180100]<std::tuple<webApplicationCacheStorage(void)::$_0 &&>>);
  }
  if (byte_1ECEC97E8 == 1)
  {
    v119 = (WTF::StringImpl *)qword_1ECEC9828;
    if (!qword_1ECEC9828)
      goto LABEL_155;
    goto LABEL_154;
  }
  WebCore::ApplicationCacheStorage::create((WebCore::ApplicationCacheStorage *)&v221, v115, v116);
  v119 = v221;
  v221 = 0;
  WTF::Ref<WebCore::ApplicationCacheStorage,WTF::RawPtrTraits<WebCore::ApplicationCacheStorage>,WTF::DefaultRefDerefTraits<WebCore::ApplicationCacheStorage>>::~Ref(&v221, v191);
  qword_1ECEC9828 = (uint64_t)v119;
  byte_1ECEC97E8 = 1;
  if (v119)
LABEL_154:
    ++*(_DWORD *)v119;
LABEL_155:
  v120 = v237;
  v237 = v119;
  if (!v120)
    goto LABEL_158;
  if (*(_DWORD *)v120 != 1)
  {
    --*(_DWORD *)v120;
LABEL_158:
      goto LABEL_159;
LABEL_163:
    v125 = WTF::fastMalloc((WTF *)0x18);
    *(_DWORD *)(v125 + 8) = 1;
    *(_QWORD *)v125 = &unk_1E9D6D510;
    *(_QWORD *)(v125 + 16) = 0;
    WebDatabaseProvider::singleton(void)::databaseProvider = v125;
    *(_DWORD *)(v125 + 8) = 2;
    v122 = v238;
    v238 = (_DWORD *)v125;
    if (!v122)
      goto LABEL_166;
    goto LABEL_160;
  }
  WebCore::ApplicationCacheStorage::~ApplicationCacheStorage(v120, (StringImpl *)v115);
  WTF::fastFree(v123, v124);
    goto LABEL_163;
LABEL_159:
  v121 = WebDatabaseProvider::singleton(void)::databaseProvider;
  ++*(_DWORD *)(WebDatabaseProvider::singleton(void)::databaseProvider + 8);
  v122 = v238;
  v238 = (_DWORD *)v121;
  if (!v122)
    goto LABEL_166;
LABEL_160:
  if (v122[2] == 1)
    (*(void (**)(_DWORD *))(*(_QWORD *)v122 + 8))(v122);
  else
    --v122[2];
LABEL_166:
  {
    v126 = WebPluginInfoProvider::singleton(void)::pluginInfoProvider;
    ++*(_DWORD *)(WebPluginInfoProvider::singleton(void)::pluginInfoProvider + 8);
    v127 = v239;
    v239 = (_DWORD *)v126;
    if (!v127)
      goto LABEL_171;
  }
  else
  {
    v192 = WTF::fastMalloc((WTF *)0x28);
    *(_DWORD *)(v192 + 8) = 1;
    *(_QWORD *)(v192 + 32) = 0;
    *(_QWORD *)(v192 + 16) = 0;
    *(_QWORD *)(v192 + 24) = 0;
    *(_QWORD *)v192 = &unk_1E9D6E650;
    WebPluginInfoProvider::singleton(void)::pluginInfoProvider = v192;
    *(_DWORD *)(v192 + 8) = 2;
    v127 = v239;
    v239 = (_DWORD *)v192;
    if (!v127)
      goto LABEL_171;
  }
  if (v127[2] == 1)
    (*(void (**)(_DWORD *))(*(_QWORD *)v127 + 8))(v127);
  else
    --v127[2];
LABEL_171:
  v128 = WebViewGroup::storageNamespaceProvider(self->_private->group.m_ptr);
  ++*((_DWORD *)v128 + 2);
  v129 = v240;
  v240 = v128;
  if (!v129)
    goto LABEL_174;
  if (*((_DWORD *)v129 + 2) != 1)
  {
    --*((_DWORD *)v129 + 2);
LABEL_174:
    v130 = (_DWORD *)*((_QWORD *)self->_private->group.m_ptr + 6);
    if (!v130)
      goto LABEL_176;
    goto LABEL_175;
  }
  (*(void (**)(WebKit::WebStorageNamespaceProvider *))(*(_QWORD *)v129 + 8))(v129);
  v130 = (_DWORD *)*((_QWORD *)self->_private->group.m_ptr + 6);
  if (v130)
LABEL_175:
    ++v130[2];
LABEL_176:
  v131 = v241;
  v241 = v130;
  if (v131)
  {
    if (v131[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v131 + 8))(v131);
    else
      --v131[2];
  }
  WebCore::Page::create();
  v139 = self->_private;
  v140 = v221;
  v221 = 0;
  v141 = (WTF::StringImpl *)v139->page.m_ptr;
  v139->page.m_ptr = (Page *)v140;
  if (v141)
  {
    v142 = *(_DWORD *)v141 - 1;
    if (*(_DWORD *)v141 == 1)
    {
      v155 = (WTF *)MEMORY[0x1D82A65B4](v141, v132, v133, v134, v135, v136, v137, v138, &v227, &v226, &v225, &v223, &v221, IdentifierInternal, v199, &v220, v248, &v218);
      WTF::fastFree(v155, v156);
      v141 = v221;
      v221 = 0;
      if (!v141)
        goto LABEL_185;
      v142 = *(_DWORD *)v141 - 1;
      if (*(_DWORD *)v141 == 1)
      {
        v157 = (WTF *)MEMORY[0x1D82A65B4]();
        WTF::fastFree(v157, v158);
        goto LABEL_185;
      }
    }
    *(_DWORD *)v141 = v142;
  }
LABEL_185:
  v143 = self->_private->page.m_ptr;
  v144 = *((_QWORD *)v143 + 2);
  if (v144)
    goto LABEL_190;
  v144 = WTF::fastCompactMalloc((WTF *)0x10);
  *(_DWORD *)v144 = 1;
  *(_QWORD *)(v144 + 8) = v143;
  v145 = (unsigned int *)*((_QWORD *)v143 + 2);
  *((_QWORD *)v143 + 2) = v144;
  if (!v145)
    goto LABEL_190;
  do
  {
    v146 = __ldaxr(v145);
    v147 = v146 - 1;
  }
  while (__stlxr(v147, v145));
  if (v147)
  {
    v144 = *((_QWORD *)v143 + 2);
    if (v144)
      goto LABEL_190;
  }
  else
  {
    atomic_store(1u, v145);
    WTF::fastFree((WTF *)v145, v132);
    v144 = *((_QWORD *)v143 + 2);
    if (v144)
    {
      do
LABEL_190:
        v148 = __ldaxr((unsigned int *)v144);
      while (__stlxr(v148 + 1, (unsigned int *)v144));
    }
  }
  v149 = *(unsigned int **)(v204 + 16);
  *(_QWORD *)(v204 + 16) = v144;
  if (v149)
  {
    do
    {
      v150 = __ldaxr(v149);
      v151 = v150 - 1;
    }
    while (__stlxr(v151, v149));
    if (!v151)
    {
      atomic_store(1u, v149);
      WTF::fastFree((WTF *)v149, v132);
    }
  }
  v152 = self->_private->page.m_ptr;
  MEMORY[0x1D82A3998](&v221, a4);
  WebCore::Page::setGroupName((WebCore::Page *)v152, (const WTF::String *)&v221);
  v154 = v221;
  v221 = 0;
  if (v154)
  {
    if (*(_DWORD *)v154 == 2)
      WTF::StringImpl::destroy(v154, v153);
    else
      *(_DWORD *)v154 -= 2;
  }
  v159 = self->_private->page.m_ptr;
  v160 = WTF::fastMalloc((WTF *)0x10);
  *(_QWORD *)v160 = &unk_1E9D6DC88;
  *(_QWORD *)(v160 + 8) = self;
  WebCore::provideGeolocationTo((WebCore *)v159, (Page *)v160, v161);
  v162 = WTF::fastMalloc((WTF *)0x28);
  *(_QWORD *)v162 = &unk_1E9D6E178;
  *(_QWORD *)(v162 + 8) = self;
  *(_QWORD *)(v162 + 16) = 0;
  *(_QWORD *)(v162 + 24) = 0;
  *(_BYTE *)(v162 + 32) = 0;
  WebCore::provideNotification();
  {
    WebMediaKeySystemClient::singleton(void)::client = (uint64_t)&unk_1E9D6E078;
    *(_QWORD *)algn_1F0165F18 = 0;
  }
  WebCore::provideMediaKeySystemTo();
  WebCore::Page::setInspectable((WebCore::Page *)self->_private->page.m_ptr);
  v163 = self->_private->page.m_ptr;
  -[WebView window](self, "window");
  WebCore::Page::setCanStartMedia((WebCore::Page *)v163);
  v164 = *((_QWORD *)self->_private->page.m_ptr + 14);
  MEMORY[0x1D82A3998](&v221, -[WebPreferences _localStorageDatabasePath](-[WebView preferences](self, "preferences"), "_localStorageDatabasePath"));
  v166 = v221;
  if (v221)
    *(_DWORD *)v221 += 2;
  v167 = *(WTF::StringImpl **)(v164 + 440);
  *(_QWORD *)(v164 + 440) = v166;
  if (v167)
  {
    if (*(_DWORD *)v167 == 2)
    {
      WTF::StringImpl::destroy(v167, v165);
      v166 = v221;
      v221 = 0;
      if (!v166)
        goto LABEL_214;
      goto LABEL_212;
    }
    *(_DWORD *)v167 -= 2;
  }
  v221 = 0;
  if (!v166)
  {
LABEL_214:
    if (HIBYTE(word_1ECEC97E9) == 1)
      goto LABEL_215;
    goto LABEL_225;
  }
LABEL_212:
  if (*(_DWORD *)v166 != 2)
  {
    *(_DWORD *)v166 -= 2;
    goto LABEL_214;
  }
  v166 = (WTF::StringImpl *)WTF::StringImpl::destroy(v166, v165);
  if (HIBYTE(word_1ECEC97E9) == 1)
  {
LABEL_215:
    if (!(_BYTE)word_1ECEC97E9)
      goto LABEL_217;
    goto LABEL_216;
  }
LABEL_225:
  if ((WebCore::IOSApplication::isLaBanquePostale(v166) & 1) != 0)
  {
    v64 = v203;
    v177 = WTF::linkedOnOrAfterSDKWithBehavior();
    LOBYTE(word_1ECEC97E9) = v177 ^ 1;
    HIBYTE(word_1ECEC97E9) = 1;
    if ((v177 & 1) == 0)
LABEL_216:
      -[WebView _injectLaBanquePostaleQuirks](self, "_injectLaBanquePostaleQuirks", v193, v194, v195, v196, v197, v198, v199, v200, v201, v202, &v217, &v215, &v213, &v211, &v210, &v209, &v208,
        &v206);
  }
  else
  {
    word_1ECEC97E9 = 256;
    v64 = v203;
  }
LABEL_217:
  *(_DWORD *)(*((_QWORD *)self->_private->page.m_ptr + 14) + 544) = 5242880;
  -[WebView _updateScreenScaleFromWindow](self, "_updateScreenScaleFromWindow", v193, v194, v195, v196, v197, v198, v199, v200, v201, v202);
  v168 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v168, "addObserver:selector:name:object:", self, sel__wakWindowScreenScaleChanged_, *MEMORY[0x1E0DCDDD0], 0);
  v169 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v169, "addObserver:selector:name:object:", self, sel__wakWindowVisibilityChanged_, *MEMORY[0x1E0DCDDD8], 0);
  v170 = -[WebFixedPositionContent initWithWebView:]([WebFixedPositionContent alloc], "initWithWebView:", self);
  v171 = self->_private;
  v172 = v171->_fixedPositionContent.m_ptr;
  v171->_fixedPositionContent.m_ptr = v170;
  if (v172)
    CFRelease(v172);
  self->_private->deviceOrientation = (int)objc_msgSend(-[WebView _UIKitDelegateForwarder](self, "_UIKitDelegateForwarder"), "deviceOrientation");
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("WebSmartInsertDeleteEnabled")))
  {
    -[WebView setSmartInsertDeleteEnabled:](self, "setSmartInsertDeleteEnabled:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("WebSmartInsertDeleteEnabled")));
  }
  v174 = self->_private->page.m_ptr;
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v173);
  v248[0] = v221;
  +[WebFrame _createMainFrameWithPage:frameName:frameView:](WebFrame, "_createMainFrameWithPage:frameName:frameView:", v174, v248, v64);
  v176 = (WTF::StringImpl *)v248[0];
  v248[0] = 0;
  if (v176)
  {
    if (*(_DWORD *)v176 == 2)
      WTF::StringImpl::destroy(v176, v175);
    else
      *(_DWORD *)v176 -= 2;
  }
  v178 = WebThreadNSRunLoop();
  v179 = overriddenWebKitLinkTimeVersion;
  if (!overriddenWebKitLinkTimeVersion)
    v179 = NSVersionOfLinkTimeLibrary("UIKit");
  v180 = (_QWORD *)MEMORY[0x1E0C9B270];
  if (HIWORD(v179) <= 0xA68u)
    v180 = (_QWORD *)MEMORY[0x1E0C99748];
  -[WebView scheduleInRunLoop:forMode:](self, "scheduleInRunLoop:forMode:", v178, *v180);
  -[WebView _addToAllWebViewsSet](self, "_addToAllWebViewsSet");
  v181 = -[WebView nextKeyView](self, "nextKeyView");
  if (v181 && v64 != (WebFrameView *)v181)
    -[WebFrameView setNextKeyView:](v64, "setNextKeyView:", v181);
  v205.receiver = self;
  v205.super_class = (Class)WebView;
  -[WebView setNextKeyView:](&v205, sel_setNextKeyView_, v64);
  if (objc_msgSend((id)objc_opt_class(), "shouldIncludeInWebKitStatistics"))
    ++WebViewCount;
  -[WebView _setIsVisible:](self, "_setIsVisible:", -[WebView _isViewVisible](self, "_isViewVisible"));
  v182 = -[WebView preferences](self, "preferences");
  v183 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v183, "addObserver:selector:name:object:", self, sel__preferencesChangedNotification_, WebPreferencesChangedInternalNotification[0], v182);
  -[WebView _preferencesChanged:](self, "_preferencesChanged:", v182);
  WebCore::Settings::setFontFallbackPrefersPictographs(*((WebCore::Settings **)self->_private->page.m_ptr + 14));
  v184 = (WebCore *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("WebKitSuppressMemoryPressureHandler"));
  if ((v184 & 1) == 0)
  {
    WebCore::registerMemoryReleaseNotifyCallbacks(v184);
    v185 = atomic_load(&qword_1ECEC9810);
    if (v185 != -1)
    {
      v221 = (WTF::StringImpl *)&v232;
      v248[0] = &v221;
      std::__call_once(&qword_1ECEC9810, v248, (void (__cdecl *)(void *))std::__call_once_proxy[abi:sn180100]<std::tuple<WebInstallMemoryPressureHandler::$_0 &&>>);
    }
  }
  MEMORY[0x1D82A5684](cf);
  do
  {
    v186 = __ldaxr(v41);
    v187 = v186 - 1;
  }
  while (__stlxr(v187, v41));
  if (v187)
  {
    if (!v64)
      return;
    goto LABEL_245;
  }
  v188 = v204;
  atomic_store(1u, (unsigned int *)(v204 + 8));
  (*(void (**)(uint64_t))(*(_QWORD *)v188 + 16))(v188);
  if (v64)
LABEL_245:
    CFRelease(v64);
}

- (id)_initWithFrame:(CGRect)a3 frameName:(id)a4 groupName:(id)a5
{
  WebView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WebView;
  v7 = -[WebView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v7)
  {
    v7->_private = objc_alloc_init(WebViewPrivate);
    -[WebView _commonInitializationWithFrameName:groupName:](v7, "_commonInitializationWithFrameName:groupName:", a4, a5);
    -[WebView setMaintainsBackForwardList:](v7, "setMaintainsBackForwardList:", 1);
  }
  return v7;
}

+ (id)_supportedMIMETypes
{
  +[WebPluginDatabase sharedDatabase](WebPluginDatabase, "sharedDatabase");
  return (id)objc_msgSend(+[WebFrameView _viewTypesAllowImageTypeOmission:](WebFrameView, "_viewTypesAllowImageTypeOmission:", 0), "allKeys");
}

+ (void)enableWebThread
{
  if ((+[WebView(WebPrivate) enableWebThread]::isWebThreadEnabled & 1) == 0)
  {
    objc_opt_class();
    WebCoreObjCDeallocOnWebThread();
    objc_opt_class();
    WebCoreObjCDeallocOnWebThread();
    objc_opt_class();
    WebCoreObjCDeallocOnWebThread();
    objc_opt_class();
    WebCoreObjCDeallocOnWebThread();
    objc_opt_class();
    WebCoreObjCDeallocOnWebThread();
    objc_opt_class();
    WebCoreObjCDeallocOnWebThread();
    objc_opt_class();
    WebCoreObjCDeallocOnWebThread();
    objc_opt_class();
    WebCoreObjCDeallocOnWebThread();
    objc_opt_class();
    WebCoreObjCDeallocOnWebThread();
    objc_opt_class();
    WebCoreObjCDeallocOnWebThread();
    WebThreadEnable();
    +[WebView(WebPrivate) enableWebThread]::isWebThreadEnabled = 1;
  }
}

- (id)initSimpleHTMLDocumentWithStyle:(id)a3 frame:(CGRect)a4 preferences:(id)a5 groupName:(id)a6
{
  double height;
  double width;
  WebView *v11;
  const void **p_m_ptr;
  const void *v13;
  void *v14;
  WebViewPrivate *v15;
  void *v16;
  void *m_ptr;
  CFTypeRef v18;
  unsigned int *v19;
  unsigned int v20;
  unsigned int v21;
  StringImpl *v22;
  WebViewPrivate *v23;
  WebViewGroup *v24;
  WebViewGroup *v25;
  WTF::StringImpl *v26;
  WTF *v27;
  void *v28;
  WTF::StringImpl *v29;
  WebViewGroup *v30;
  uint64_t v31;
  unsigned int *v32;
  WebEditorClient *v33;
  WebCore::WebRTCProvider *v34;
  uint64_t v35;
  _DWORD *v36;
  BackForwardList *v37;
  _DWORD *v38;
  unsigned int v39;
  _QWORD *v40;
  WTF::StringImpl *v41;
  WebCore::Process *IdentifierInternal;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD *v47;
  WebCore::DummyModelPlayerProvider *v48;
  LegacyHistoryItemClient *v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  id *v53;
  StringImpl *v54;
  uint64_t v55;
  id *v56;
  WTF *v57;
  void *v58;
  _QWORD *v59;
  _DWORD *v60;
  LegacyHistoryItemClient *v61;
  WebCore::DummyModelPlayerProvider *v62;
  WebCore::DummyModelPlayerProvider *v63;
  WTF *v64;
  void *v65;
  _QWORD *v66;
  WTF *v67;
  WTF::StringImpl *v68;
  unsigned int *v69;
  unsigned int *v70;
  unsigned int v71;
  unsigned int v72;
  _DWORD *v73;
  _DWORD *v74;
  _QWORD *v75;
  uint64_t v76;
  WTF *v77;
  _DWORD *v78;
  uint64_t v79;
  unsigned int *v80;
  unsigned int v81;
  unsigned int v82;
  _QWORD *v83;
  _DWORD *v84;
  unsigned int *v85;
  unsigned int *v86;
  unsigned int v87;
  unsigned int v88;
  _DWORD *v89;
  _DWORD *v90;
  _DWORD *v91;
  uint64_t v92;
  unsigned int *v93;
  unsigned int *v94;
  unsigned int v95;
  unsigned int v96;
  WebEditorClient *v97;
  WTF *v98;
  void *v99;
  _QWORD *v100;
  _QWORD *v101;
  WebInspectorClient *v102;
  const WTF::String *v103;
  const WTF::String *v104;
  WebInspectorClient *v105;
  unint64_t v106;
  WTF::StringImpl *v107;
  WebCore::ApplicationCacheStorage *v108;
  uint64_t v109;
  _DWORD *v110;
  WTF *v111;
  void *v112;
  uint64_t v113;
  WebKit::WebStorageNamespaceProvider *v114;
  WebKit::WebStorageNamespaceProvider *v115;
  _DWORD *v116;
  _DWORD *v117;
  uint64_t v118;
  _DWORD *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  WebViewPrivate *v128;
  WTF::StringImpl *v129;
  WTF::StringImpl *v130;
  int v131;
  Page *v132;
  uint64_t v133;
  unsigned int *v134;
  unsigned int v135;
  unsigned int v136;
  unsigned int v137;
  unsigned int *v138;
  unsigned int v139;
  unsigned int v140;
  uint64_t v141;
  int v142;
  uint64_t v143;
  StringImpl *v144;
  WTF::StringImpl *v145;
  WTF *v146;
  void *v147;
  WTF *v148;
  void *v149;
  uint64_t v150;
  uint64_t v151;
  StringImpl *v152;
  WTF::StringImpl *v153;
  WebViewPrivate *v154;
  uint64_t v155;
  int v156;
  uint64_t v157;
  WebCore::Page *v158;
  StringImpl *v159;
  WTF::StringImpl *v160;
  WebCore::Page *v161;
  void *v162;
  void *v163;
  WebCore::DeprecatedGlobalSettings *v164;
  unsigned int v165;
  unsigned int v166;
  _QWORD *v168;
  uint64_t v169;
  StringImpl *v170;
  _QWORD *v171;
  _QWORD *v172;
  _QWORD *v173;
  _QWORD *v174;
  WTF::StringImpl **v175;
  WebCore::Process *v176;
  uint64_t v177;
  uint64_t *v178;
  _QWORD *v179;
  _QWORD *v180;
  id v181;
  WebFrameView *v182;
  uint64_t v183;
  uint64_t v184;
  id *v185;
  uint64_t v186;
  _QWORD *v187;
  _DWORD *v188;
  LegacyHistoryItemClient *v189;
  WebCore::DummyModelPlayerProvider *v190;
  WebCore::DummyModelPlayerProvider *v191;
  WTF *v192;
  _QWORD *v193;
  _DWORD *v194;
  _DWORD *v195;
  _QWORD *v196;
  WTF *v197;
  uint64_t v198;
  WTF::StringImpl *v199;
  int v200;
  _QWORD *v201;
  unsigned int *v202;
  _DWORD *v203;
  _DWORD *v204;
  _DWORD *v205;
  _DWORD *v206;
  uint64_t v207;
  unsigned int *v208;
  WebEditorClient *v209;
  WebEditorClient *v210;
  CFTypeRef cf[7];
  _QWORD *v212;
  WebInspectorClient *v213;
  WebCore::ApplicationCacheStorage *v214;
  _DWORD *v215;
  _DWORD *v216;
  WebKit::WebStorageNamespaceProvider *v217;
  _DWORD *v218;
  objc_super v219;
  _QWORD v220[2];

  height = a4.size.height;
  width = a4.size.width;
  v219.receiver = self;
  v219.super_class = (Class)WebView;
  v11 = -[WebView initWithFrame:](&v219, sel_initWithFrame_, a4.origin.x, a4.origin.y);
  if (!v11)
    return v11;
  v11->_private = objc_alloc_init(WebViewPrivate);
  if (a5)
  {
    objc_msgSend(a5, "willAddToWebView");
    p_m_ptr = (const void **)&v11->_private->preferences.m_ptr;
  }
  else
  {
    a5 = +[WebPreferences standardPreferences](WebPreferences, "standardPreferences");
    objc_msgSend(a5, "willAddToWebView");
    p_m_ptr = (const void **)&v11->_private->preferences.m_ptr;
    if (!a5)
      goto LABEL_6;
  }
  CFRetain(a5);
LABEL_6:
  v13 = *p_m_ptr;
  *p_m_ptr = a5;
  if (v13)
    CFRelease(v13);
  v11->_private->mainFrameDocumentReady = 0;
  v11->_private->drawsBackground = 1;
  v199 = (WTF::StringImpl *)0x11040000FFFFFFFFLL;
  WebCore::cachedCGColor();
  v15 = v11->_private;
  v16 = (void *)cf[0];
  cf[0] = 0;
  m_ptr = v15->backgroundColor.m_ptr;
  v15->backgroundColor.m_ptr = v16;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v18 = cf[0];
    cf[0] = 0;
    if (v18)
      CFRelease(v18);
  }
  if (((unint64_t)v199 & 0x8000000000000) != 0)
  {
    v19 = (unsigned int *)((unint64_t)v199 & 0xFFFFFFFFFFFFLL);
    do
    {
      v20 = __ldaxr(v19);
      v21 = v20 - 1;
    }
    while (__stlxr(v21, v19));
    if (!v21)
    {
      atomic_store(1u, v19);
      WTF::fastFree((WTF *)v19, v14);
    }
  }
  v182 = -[WebFrameView initWithFrame:]([WebFrameView alloc], "initWithFrame:", 0.0, 0.0, width, height);
  -[WebFrameView setAutoresizingMask:](v182, "setAutoresizingMask:", 18);
  -[WebView addSubview:](v11, "addSubview:", v182);
  MEMORY[0x1D82A3998](&v199, a6);
  MEMORY[0x1D82A3998](v220, objc_msgSend(v11->_private->preferences.m_ptr, "_localStorageDatabasePath"));
  WebViewGroup::getOrCreate((WebViewGroup *)&v199, (const WTF::String *)v220, (WebViewGroup **)cf);
  v23 = v11->_private;
  v24 = (WebViewGroup *)cf[0];
  cf[0] = 0;
  v25 = v23->group.m_ptr;
  v23->group.m_ptr = v24;
  if (!v25)
  {
LABEL_19:
    v26 = (WTF::StringImpl *)v220[0];
    v220[0] = 0;
    if (!v26)
      goto LABEL_24;
    goto LABEL_22;
  }
  if (*(_DWORD *)v25 != 1)
  {
    --*(_DWORD *)v25;
    goto LABEL_19;
  }
  WebViewGroup::~WebViewGroup(v25, v22);
  WTF::fastFree(v27, v28);
  v26 = (WTF::StringImpl *)v220[0];
  v220[0] = 0;
  if (!v26)
    goto LABEL_24;
LABEL_22:
  if (*(_DWORD *)v26 == 2)
  {
    WTF::StringImpl::destroy(v26, v22);
    v29 = v199;
    v199 = 0;
    if (!v29)
      goto LABEL_30;
    goto LABEL_27;
  }
  *(_DWORD *)v26 -= 2;
LABEL_24:
  v29 = v199;
  v199 = 0;
  if (!v29)
    goto LABEL_30;
LABEL_27:
  if (*(_DWORD *)v29 == 2)
    WTF::StringImpl::destroy(v29, v22);
  else
    *(_DWORD *)v29 -= 2;
LABEL_30:
  v30 = v11->_private->group.m_ptr;
  v199 = (WTF::StringImpl *)v11;
  WTF::HashTable<WebView *,WebView *,WTF::IdentityExtractor,WTF::DefaultHash<WebView *>,WTF::HashTraits<WebView *>,WTF::HashTraits<WebView *>>::add((uint64_t *)v30 + 2, (uint64_t *)&v199, (uint64_t)cf);
  v31 = WTF::fastMalloc((WTF *)0x18);
  v181 = a3;
  *(_DWORD *)(v31 + 8) = 1;
  v32 = (unsigned int *)(v31 + 8);
  *(_QWORD *)v31 = &off_1E9D6BB60;
  v183 = v31;
  *(_QWORD *)(v31 + 16) = 0;
  WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>::generateIdentifierInternal();
  -[WebPreferences privateBrowsingEnabled](-[WebView preferences](v11, "preferences"), "privateBrowsingEnabled");
  v33 = (WebEditorClient *)WTF::fastMalloc((WTF *)0xB8);
  WebEditorClient::WebEditorClient(v33, v11);
  v209 = 0;
  v210 = v33;
  v34 = (WebCore::WebRTCProvider *)WTF::fastMalloc((WTF *)0x10);
  *((_DWORD *)v34 + 2) = 1;
  *(_QWORD *)v34 = &unk_1E9D6A8B0;
  v208 = (unsigned int *)v34;
  WebCore::WebRTCProvider::create(v34);
  v35 = WTF::fastMalloc((WTF *)0x10);
  *(_DWORD *)(v35 + 8) = 1;
  *(_QWORD *)v35 = &off_1E9D6BB88;
  v206 = (_DWORD *)v35;
  v36 = (_DWORD *)*((_QWORD *)v11->_private->group.m_ptr + 5);
  ++v36[2];
  v205 = v36;
  v37 = (BackForwardList *)WTF::fastMalloc((WTF *)0x48);
  BackForwardList::BackForwardList(v37, v11);
  v204 = v38;
  do
    v39 = __ldaxr(v32);
  while (__stlxr(v39 + 1, v32));
  v202 = (unsigned int *)v183;
  WebCore::CookieJar::create();
  v40 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v40 = &unk_1E9D6E888;
  v40[1] = v11;
  v201 = v40;
  v41 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
  *(_QWORD *)v41 = off_1E9D6C398;
  v199 = v41;
  v200 = 0;
  if (WTF::ObjectIdentifierGeneric<WebCore::FrameIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>::m_generationProtected)
  {
    __break(0xC471u);
    JUMPOUT(0x1D8062168);
  }
  IdentifierInternal = (WebCore::Process *)WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>::generateIdentifierInternal();
  v43 = WebCore::Process::identifier(IdentifierInternal);
  v198 = 0;
  v44 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v44 = off_1E9D6C288;
  v44[1] = 0;
  v197 = 0;
  v220[0] = v44;
  v45 = (_QWORD *)WTF::fastMalloc((WTF *)8);
  *v45 = MEMORY[0x1E0DD8FB8] + 16;
  v196 = v45;
  WebBroadcastChannelRegistry::getOrCreate(-[WebPreferences privateBrowsingEnabled](-[WebView preferences](v11, "preferences"), "privateBrowsingEnabled"), (uint64_t *)&v194);
  v46 = (uint64_t)v194;
  v194 = 0;
  v195 = (_DWORD *)v46;
  v47 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  v47[1] = 0;
  v47[2] = 0;
  *v47 = off_1E9D6C300;
  v192 = 0;
  v193 = v47;
  v48 = (WebCore::DummyModelPlayerProvider *)WTF::fastMalloc((WTF *)8);
  WebCore::DummyModelPlayerProvider::DummyModelPlayerProvider(v48);
  v190 = 0;
  v191 = v48;
  v49 = (LegacyHistoryItemClient *)WTF::fastMalloc((WTF *)0x10);
  *((_DWORD *)v49 + 2) = 1;
  *(_QWORD *)v49 = off_1E9D6C198;
  v189 = v49;
  v50 = LegacyHistoryItemClient::singleton(v49);
  ++*(_DWORD *)(v50 + 8);
  v188 = (_DWORD *)v50;
  v51 = (_QWORD *)WTF::fastMalloc((WTF *)8);
  *v51 = &unk_1E9D6E218;
  v187 = v51;
  v52 = WTF::fastMalloc((WTF *)0x20);
  WebCore::ChromeClient::ChromeClient((WebCore::ChromeClient *)v52);
  *(_QWORD *)v52 = &unk_1E9D6C4E0;
  *(_BYTE *)(v52 + 8) = 0;
  objc_initWeak((id *)(v52 + 16), v11);
  *(_QWORD *)v52 = &unk_1E9D6CC80;
  *(_DWORD *)(v52 + 24) = 0;
  v185 = 0;
  v186 = v52;
  v53 = (id *)WTF::fastMalloc((WTF *)0x10);
  *v53 = &unk_1E9D6D430;
  objc_initWeak(v53 + 1, v11);
  v179 = v220;
  v180 = &v196;
  v177 = v43;
  v178 = &v198;
  v175 = &v199;
  v176 = IdentifierInternal;
  v173 = &v203;
  v174 = &v201;
  v171 = &v205;
  v172 = &v204;
  WebCore::PageConfiguration::PageConfiguration();
  v184 = 0;
  if (v53)
    (*((void (**)(id *))*v53 + 1))(v53);
  v55 = v186;
  v186 = 0;
  if (v55)
    (*(void (**)(uint64_t))(*(_QWORD *)v55 + 1904))(v55);
  v56 = v185;
  v185 = 0;
  if (v56)
  {
    objc_destroyWeak(v56 + 2);
    WebCore::ChromeClient::~ChromeClient((WebCore::ChromeClient *)v56);
    WTF::fastFree(v57, v58);
  }
  v59 = v187;
  v187 = 0;
  if (v59)
    (*(void (**)(_QWORD *))(*v59 + 152))(v59);
  v60 = v188;
  v188 = 0;
  if (v60)
  {
    if (v60[2] == 1)
    {
      (*(void (**)(_DWORD *))(*(_QWORD *)v60 + 8))(v60);
      v61 = v189;
      v189 = 0;
      if (!v61)
        goto LABEL_50;
      goto LABEL_45;
    }
    --v60[2];
  }
  v61 = v189;
  v189 = 0;
  if (!v61)
    goto LABEL_50;
LABEL_45:
  if (*((_DWORD *)v61 + 2) == 1)
    (*(void (**)(LegacyHistoryItemClient *))(*(_QWORD *)v61 + 8))(v61);
  else
    --*((_DWORD *)v61 + 2);
LABEL_50:
  v62 = v191;
  v191 = 0;
  if (v62)
    (*(void (**)(WebCore::DummyModelPlayerProvider *))(*(_QWORD *)v62 + 8))(v62);
  v63 = v190;
  v190 = 0;
  if (v63)
  {
    WebCore::DummyModelPlayerProvider::~DummyModelPlayerProvider(v63);
    WTF::fastFree(v64, v65);
  }
  v66 = v193;
  v193 = 0;
  if (v66)
    (*(void (**)(_QWORD *))(*v66 + 8))(v66);
  v67 = v192;
  v192 = 0;
  if (v67)
  {
    v68 = (WTF::StringImpl *)*((_QWORD *)v67 + 2);
    *((_QWORD *)v67 + 2) = 0;
    if (v68)
    {
      if (*(_DWORD *)v68 == 2)
      {
        WTF::StringImpl::destroy(v68, v54);
        v69 = (unsigned int *)*((_QWORD *)v67 + 1);
        *((_QWORD *)v67 + 1) = 0;
        if (!v69)
        {
LABEL_67:
          WTF::fastFree(v67, v54);
          goto LABEL_68;
        }
LABEL_63:
        v70 = v69 + 2;
        do
        {
          v71 = __ldaxr(v70);
          v72 = v71 - 1;
        }
        while (__stlxr(v72, v70));
        if (!v72)
        {
          atomic_store(1u, v69 + 2);
          (*(void (**)(unsigned int *))(*(_QWORD *)v69 + 8))(v69);
        }
        goto LABEL_67;
      }
      *(_DWORD *)v68 -= 2;
    }
    v69 = (unsigned int *)*((_QWORD *)v67 + 1);
    *((_QWORD *)v67 + 1) = 0;
    if (!v69)
      goto LABEL_67;
    goto LABEL_63;
  }
LABEL_68:
  v73 = v195;
  v195 = 0;
  if (v73)
  {
    if (v73[2] == 1)
    {
      (*(void (**)(_DWORD *))(*(_QWORD *)v73 + 8))(v73);
      v74 = v194;
      if (!v194)
        goto LABEL_77;
      goto LABEL_72;
    }
    --v73[2];
  }
  v74 = v194;
  if (!v194)
    goto LABEL_77;
LABEL_72:
  if (v74[2] == 1)
    (*(void (**)(_DWORD *))(*(_QWORD *)v74 + 8))(v74);
  else
    --v74[2];
LABEL_77:
  v75 = v196;
  v196 = 0;
  if (v75)
    (*(void (**)(_QWORD *))(*v75 + 8))(v75);
  v76 = v220[0];
  v220[0] = 0;
  if (v76)
    (*(void (**)(uint64_t))(*(_QWORD *)v76 + 8))(v76);
  v77 = v197;
  v197 = 0;
  if (v77)
  {
    v78 = (_DWORD *)*((_QWORD *)v77 + 1);
    *((_QWORD *)v77 + 1) = 0;
    if (v78)
    {
      if (v78[2] == 1)
        (*(void (**)(_DWORD *))(*(_QWORD *)v78 + 8))(v78);
      else
        --v78[2];
    }
    WTF::fastFree(v77, v54);
  }
  v79 = v198;
  v198 = 0;
  if (v79)
  {
    v80 = (unsigned int *)(v79 + 8);
    do
    {
      v81 = __ldaxr(v80);
      v82 = v81 - 1;
    }
    while (__stlxr(v82, v80));
    if (!v82)
    {
      atomic_store(1u, v80);
      v168 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v168 = off_1E9D6A4D8;
      v168[1] = v80;
      v220[0] = v168;
      WTF::ensureOnMainThread();
      v169 = v220[0];
      v220[0] = 0;
      if (v169)
        (*(void (**)(uint64_t))(*(_QWORD *)v169 + 8))(v169);
    }
  }
  if (v200 != -1)
    ((void (*)(_QWORD *, WTF::StringImpl **))off_1E9D6C1B8[v200])(v220, &v199);
  v83 = v201;
  v201 = 0;
  if (v83)
    (*(void (**)(_QWORD *))(*v83 + 8))(v83);
  v84 = v203;
  v203 = 0;
  if (v84)
  {
    if (v84[2] == 1)
    {
      (*(void (**)(_DWORD *))(*(_QWORD *)v84 + 120))(v84);
      v85 = v202;
      v202 = 0;
      if (!v85)
        goto LABEL_103;
      goto LABEL_99;
    }
    --v84[2];
  }
  v85 = v202;
  v202 = 0;
  if (!v85)
    goto LABEL_103;
LABEL_99:
  v86 = v85 + 2;
  do
  {
    v87 = __ldaxr(v86);
    v88 = v87 - 1;
  }
  while (__stlxr(v88, v86));
  if (!v88)
  {
    atomic_store(1u, v85 + 2);
    (*(void (**)(unsigned int *))(*(_QWORD *)v85 + 16))(v85);
  }
LABEL_103:
  v89 = v204;
  v204 = 0;
  if (v89)
  {
    if (v89[2] == 1)
    {
      (*(void (**)(_DWORD *))(*(_QWORD *)v89 + 8))(v89);
      v90 = v205;
      v205 = 0;
      if (!v90)
        goto LABEL_114;
      goto LABEL_107;
    }
    --v89[2];
  }
  v90 = v205;
  v205 = 0;
  if (!v90)
    goto LABEL_114;
LABEL_107:
  if (v90[2] == 1)
    (*(void (**)(_DWORD *))(*(_QWORD *)v90 + 8))(v90);
  else
    --v90[2];
LABEL_114:
  v91 = v206;
  v206 = 0;
  if (v91)
  {
    if (v91[2] == 1)
    {
      (*(void (**)(_DWORD *))(*(_QWORD *)v91 + 16))(v91);
      v92 = v207;
      v207 = 0;
      if (!v92)
        goto LABEL_119;
      goto LABEL_118;
    }
    --v91[2];
  }
  v92 = v207;
  v207 = 0;
  if (v92)
LABEL_118:
    (*(void (**)(uint64_t))(*(_QWORD *)v92 + 8))(v92);
LABEL_119:
  v93 = v208;
  v208 = 0;
  if (!v93)
    goto LABEL_123;
  v94 = v93 + 2;
  do
  {
    v95 = __ldaxr(v94);
    v96 = v95 - 1;
  }
  while (__stlxr(v96, v94));
  if (v96)
  {
LABEL_123:
    v97 = v210;
    v210 = 0;
    if (!v97)
      goto LABEL_125;
    goto LABEL_124;
  }
  atomic_store(1u, v93 + 2);
  (*(void (**)(unsigned int *))(*(_QWORD *)v93 + 24))(v93);
  v97 = v210;
  v210 = 0;
  if (v97)
LABEL_124:
    (*(void (**)(WebEditorClient *))(*(_QWORD *)v97 + 8))(v97);
LABEL_125:
  if (v209)
  {
    WebEditorClient::~WebEditorClient(v209);
    WTF::fastFree(v98, v99);
  }
  v100 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v100 = &unk_1E9D6D840;
  v100[1] = v11;
  v101 = v212;
  v212 = v100;
  if (v101)
    (*(void (**)(_QWORD *))(*v101 + 80))(v101);
  v102 = (WebInspectorClient *)WTF::fastMalloc((WTF *)0x30);
  WebInspectorClient::WebInspectorClient(v102, v11);
  v105 = v213;
  v213 = v102;
  if (v105)
    (*(void (**)(WebInspectorClient *))(*(_QWORD *)v105 + 8))(v105);
  v106 = atomic_load(&qword_1ECEC9820);
  if (v106 != -1)
  {
    v199 = (WTF::StringImpl *)&v210;
    v220[0] = &v199;
    std::__call_once(&qword_1ECEC9820, v220, (void (__cdecl *)(void *))std::__call_once_proxy[abi:sn180100]<std::tuple<webApplicationCacheStorage(void)::$_0 &&>>);
  }
  if (byte_1ECEC97E8 == 1)
  {
    v107 = (WTF::StringImpl *)qword_1ECEC9828;
    if (!qword_1ECEC9828)
      goto LABEL_136;
    goto LABEL_135;
  }
  WebCore::ApplicationCacheStorage::create((WebCore::ApplicationCacheStorage *)&v199, v103, v104);
  v107 = v199;
  v199 = 0;
  WTF::Ref<WebCore::ApplicationCacheStorage,WTF::RawPtrTraits<WebCore::ApplicationCacheStorage>,WTF::DefaultRefDerefTraits<WebCore::ApplicationCacheStorage>>::~Ref(&v199, v170);
  qword_1ECEC9828 = (uint64_t)v107;
  byte_1ECEC97E8 = 1;
  if (v107)
LABEL_135:
    ++*(_DWORD *)v107;
LABEL_136:
  v108 = v214;
  v214 = v107;
  if (!v108)
    goto LABEL_139;
  if (*(_DWORD *)v108 != 1)
  {
    --*(_DWORD *)v108;
LABEL_139:
      goto LABEL_140;
LABEL_144:
    v113 = WTF::fastMalloc((WTF *)0x18);
    *(_DWORD *)(v113 + 8) = 1;
    *(_QWORD *)v113 = &unk_1E9D6D510;
    *(_QWORD *)(v113 + 16) = 0;
    WebDatabaseProvider::singleton(void)::databaseProvider = v113;
    *(_DWORD *)(v113 + 8) = 2;
    v110 = v215;
    v215 = (_DWORD *)v113;
    if (!v110)
      goto LABEL_147;
    goto LABEL_141;
  }
  WebCore::ApplicationCacheStorage::~ApplicationCacheStorage(v108, (StringImpl *)v103);
  WTF::fastFree(v111, v112);
    goto LABEL_144;
LABEL_140:
  v109 = WebDatabaseProvider::singleton(void)::databaseProvider;
  ++*(_DWORD *)(WebDatabaseProvider::singleton(void)::databaseProvider + 8);
  v110 = v215;
  v215 = (_DWORD *)v109;
  if (!v110)
    goto LABEL_147;
LABEL_141:
  if (v110[2] == 1)
    (*(void (**)(_DWORD *))(*(_QWORD *)v110 + 8))(v110);
  else
    --v110[2];
LABEL_147:
  v114 = WebViewGroup::storageNamespaceProvider(v11->_private->group.m_ptr);
  ++*((_DWORD *)v114 + 2);
  v115 = v217;
  v217 = v114;
  if (!v115)
    goto LABEL_150;
  if (*((_DWORD *)v115 + 2) != 1)
  {
    --*((_DWORD *)v115 + 2);
LABEL_150:
    v116 = (_DWORD *)*((_QWORD *)v11->_private->group.m_ptr + 6);
    if (!v116)
      goto LABEL_152;
    goto LABEL_151;
  }
  (*(void (**)(WebKit::WebStorageNamespaceProvider *))(*(_QWORD *)v115 + 8))(v115);
  v116 = (_DWORD *)*((_QWORD *)v11->_private->group.m_ptr + 6);
  if (v116)
LABEL_151:
    ++v116[2];
LABEL_152:
  v117 = v218;
  v218 = v116;
  if (!v117)
    goto LABEL_155;
  if (v117[2] != 1)
  {
    --v117[2];
LABEL_155:
      goto LABEL_156;
LABEL_162:
    v120 = WTF::fastMalloc((WTF *)0x28);
    *(_DWORD *)(v120 + 8) = 1;
    *(_QWORD *)(v120 + 32) = 0;
    *(_QWORD *)(v120 + 16) = 0;
    *(_QWORD *)(v120 + 24) = 0;
    *(_QWORD *)v120 = &unk_1E9D6E650;
    WebPluginInfoProvider::singleton(void)::pluginInfoProvider = v120;
    *(_DWORD *)(v120 + 8) = 2;
    v119 = v216;
    v216 = (_DWORD *)v120;
    if (!v119)
      goto LABEL_165;
    goto LABEL_157;
  }
  (*(void (**)(_DWORD *))(*(_QWORD *)v117 + 8))(v117);
    goto LABEL_162;
LABEL_156:
  v118 = WebPluginInfoProvider::singleton(void)::pluginInfoProvider;
  ++*(_DWORD *)(WebPluginInfoProvider::singleton(void)::pluginInfoProvider + 8);
  v119 = v216;
  v216 = (_DWORD *)v118;
  if (!v119)
    goto LABEL_165;
LABEL_157:
  if (v119[2] == 1)
    (*(void (**)(_DWORD *))(*(_QWORD *)v119 + 8))(v119);
  else
    --v119[2];
LABEL_165:
  WebCore::Page::create();
  v128 = v11->_private;
  v129 = v199;
  v199 = 0;
  v130 = (WTF::StringImpl *)v128->page.m_ptr;
  v128->page.m_ptr = (Page *)v129;
  if (v130)
  {
    v131 = *(_DWORD *)v130 - 1;
    if (*(_DWORD *)v130 == 1)
    {
      v146 = (WTF *)MEMORY[0x1D82A65B4](v130, v121, v122, v123, v124, v125, v126, v127, &v205, &v204, &v203, &v201, &v199, IdentifierInternal, v43, &v198, v220, &v196);
      WTF::fastFree(v146, v147);
      v130 = v199;
      v199 = 0;
      if (!v130)
        goto LABEL_168;
      v131 = *(_DWORD *)v130 - 1;
      if (*(_DWORD *)v130 == 1)
      {
        v148 = (WTF *)MEMORY[0x1D82A65B4]();
        WTF::fastFree(v148, v149);
        goto LABEL_168;
      }
    }
    *(_DWORD *)v130 = v131;
  }
LABEL_168:
  v132 = v11->_private->page.m_ptr;
  v133 = *((_QWORD *)v132 + 2);
  if (v133)
    goto LABEL_173;
  v133 = WTF::fastCompactMalloc((WTF *)0x10);
  *(_DWORD *)v133 = 1;
  *(_QWORD *)(v133 + 8) = v132;
  v134 = (unsigned int *)*((_QWORD *)v132 + 2);
  *((_QWORD *)v132 + 2) = v133;
  if (!v134)
    goto LABEL_173;
  do
  {
    v135 = __ldaxr(v134);
    v136 = v135 - 1;
  }
  while (__stlxr(v136, v134));
  if (v136)
  {
    v133 = *((_QWORD *)v132 + 2);
    if (v133)
      goto LABEL_173;
  }
  else
  {
    atomic_store(1u, v134);
    WTF::fastFree((WTF *)v134, v121);
    v133 = *((_QWORD *)v132 + 2);
    if (v133)
    {
      do
LABEL_173:
        v137 = __ldaxr((unsigned int *)v133);
      while (__stlxr(v137 + 1, (unsigned int *)v133));
    }
  }
  v138 = *(unsigned int **)(v183 + 16);
  *(_QWORD *)(v183 + 16) = v133;
  if (v138)
  {
    do
    {
      v139 = __ldaxr(v138);
      v140 = v139 - 1;
    }
    while (__stlxr(v140, v138));
    if (!v140)
    {
      atomic_store(1u, v138);
      WTF::fastFree((WTF *)v138, v121);
    }
  }
  -[WebView setSmartInsertDeleteEnabled:](v11, "setSmartInsertDeleteEnabled:", 1, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180, &v195, &v193, &v191, &v189, &v188, &v187,
    &v186,
    &v184);
  WebCore::Settings::setMinimumLogicalFontSize(*((WebCore::Settings **)v11->_private->page.m_ptr + 14), 9.0);
  WebCore::Settings::setDefaultFontSize(*((WebCore::Settings **)v11->_private->page.m_ptr + 14), (double)(int)objc_msgSend(v11->_private->preferences.m_ptr, "defaultFontSize"));
  WebCore::Settings::setDefaultFixedFontSize(*((WebCore::Settings **)v11->_private->page.m_ptr + 14), 13.0);
  v141 = *((_QWORD *)v11->_private->page.m_ptr + 14);
  v142 = objc_msgSend(a5, "acceleratedDrawingEnabled");
  v143 = 64;
  if (!v142)
    v143 = 0;
  *(_QWORD *)(v141 + 664) = *(_QWORD *)(v141 + 664) & 0xFFFFFFFFFFFFFFBFLL | v143;
  WebCore::Settings::setFontFallbackPrefersPictographs(*((WebCore::Settings **)v11->_private->page.m_ptr + 14));
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v220[0] = v199;
  WebCore::SettingsBase::setPictographFontFamily();
  v145 = (WTF::StringImpl *)v220[0];
  v220[0] = 0;
  if (v145)
  {
    if (*(_DWORD *)v145 == 2)
      WTF::StringImpl::destroy(v145, v144);
    else
      *(_DWORD *)v145 -= 2;
  }
  v150 = *((_QWORD *)v11->_private->page.m_ptr + 14);
  *(_QWORD *)(v150 + 688) &= ~0x20000000000000uLL;
  v151 = *((_QWORD *)v11->_private->page.m_ptr + 14);
  *(_QWORD *)(v151 + 688) |= 0x10000000000000uLL;
  MEMORY[0x1D82A3998](&v199, objc_msgSend(v11->_private->preferences.m_ptr, "standardFontFamily"));
  WebCore::SettingsBase::setStandardFontFamily();
  v153 = v199;
  v199 = 0;
  if (v153)
  {
    if (*(_DWORD *)v153 == 2)
      WTF::StringImpl::destroy(v153, v152);
    else
      *(_DWORD *)v153 -= 2;
  }
  WebCore::Settings::setMinimumFontSize(*((WebCore::Settings **)v11->_private->page.m_ptr + 14), (double)(int)objc_msgSend(v11->_private->preferences.m_ptr, "minimumFontSize"));
  v154 = v11->_private;
  v155 = *((_QWORD *)v154->page.m_ptr + 14);
  v156 = objc_msgSend(v154->preferences.m_ptr, "httpEquivEnabled");
  v157 = 0x80000;
  if (!v156)
    v157 = 0;
  *(_QWORD *)(v155 + 680) = *(_QWORD *)(v155 + 680) & 0xFFFFFFFFFFF7FFFFLL | v157;
  v158 = (WebCore::Page *)v11->_private->page.m_ptr;
  MEMORY[0x1D82A3998](&v199, a6);
  WebCore::Page::setGroupName(v158, (const WTF::String *)&v199);
  v160 = v199;
  v199 = 0;
  if (v160)
  {
    if (*(_DWORD *)v160 == 2)
    {
      WTF::StringImpl::destroy(v160, v159);
      v161 = (WebCore::Page *)v11->_private->page.m_ptr;
      if (byte_1ECEC97EC == 1)
        goto LABEL_197;
      goto LABEL_204;
    }
    *(_DWORD *)v160 -= 2;
  }
  v161 = (WebCore::Page *)v11->_private->page.m_ptr;
  if (byte_1ECEC97EC == 1)
    goto LABEL_197;
LABEL_204:
  byte_1ECEC97EB = MGGetBoolAnswer();
  byte_1ECEC97EC = 1;
LABEL_197:
  WebCore::Page::setInspectable(v161);
  -[WebView _updateScreenScaleFromWindow](v11, "_updateScreenScaleFromWindow");
  v162 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v162, "addObserver:selector:name:object:", v11, sel__wakWindowScreenScaleChanged_, *MEMORY[0x1E0DCDDD0], 0);
  v163 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v163, "addObserver:selector:name:object:", v11, sel__wakWindowVisibilityChanged_, *MEMORY[0x1E0DCDDD8], 0);
  +[WebFrame _createMainFrameWithSimpleHTMLDocumentWithPage:frameView:style:](WebFrame, "_createMainFrameWithSimpleHTMLDocumentWithPage:frameView:style:", v11->_private->page.m_ptr, v182, v181);
  -[WebView _addToAllWebViewsSet](v11, "_addToAllWebViewsSet");
  ++WebViewCount;
  WebCore::SecurityPolicy::setLocalLoadPolicy();
  v164 = (WebCore::DeprecatedGlobalSettings *)-[WebPreferences attachmentElementEnabled](-[WebView preferences](v11, "preferences"), "attachmentElementEnabled");
  *(_BYTE *)(WebCore::DeprecatedGlobalSettings::shared(v164) + 25) = (_BYTE)v164;
  MEMORY[0x1D82A5684](cf);
  do
  {
    v165 = __ldaxr(v32);
    v166 = v165 - 1;
  }
  while (__stlxr(v166, v32));
  if (!v166)
  {
    atomic_store(1u, (unsigned int *)(v183 + 8));
    (*(void (**)(uint64_t))(*(_QWORD *)v183 + 16))(v183);
    if (!v182)
      return v11;
    goto LABEL_201;
  }
  if (v182)
LABEL_201:
    CFRelease(v182);
  return v11;
}

+ (void)_releaseMemoryNow
{
  WebThreadRun();
}

uint64_t __40__WebView_WebPrivate___releaseMemoryNow__block_invoke()
{
  return WebCore::releaseMemory();
}

- (void)_replaceCurrentHistoryItem:(id)a3
{
  _DWORD *v4;
  WTF *v5;
  void *v6;
  _DWORD *v7;

  if (-[WebView _mainCoreFrame](self, "_mainCoreFrame"))
  {
    if (a3)
    {
      v4 = *(_DWORD **)(*((_QWORD *)a3 + 1) + 8);
      if (v4)
        ++*v4;
    }
    else
    {
      v4 = 0;
    }
    v7 = v4;
    WebCore::HistoryController::replaceCurrentItem();
    if (v7)
    {
      if (*v7 == 1)
      {
        v5 = (WTF *)MEMORY[0x1D82A3F20]();
        WTF::fastFree(v5, v6);
      }
      else
      {
        --*v7;
      }
    }
  }
}

+ (void)willEnterBackgroundWithCompletionHandler:(id)a3
{
  WebThreadRun();
}

void __64__WebView_WebPrivate__willEnterBackgroundWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  _QWORD *v4;

  WTF::RunLoop::main((WTF::RunLoop *)+[WebView _releaseMemoryNow](WebView, "_releaseMemoryNow"));
  v2 = _Block_copy(*(const void **)(a1 + 32));
  v3 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v3 = off_1E9D6C3C0;
  v3[1] = v2;
  v4 = v3;
  WTF::RunLoop::dispatch();
  if (v4)
    (*(void (**)(_QWORD *))(*v4 + 8))(v4);
  _Block_release(0);
}

+ (BOOL)isCharacterSmartReplaceExempt:(unsigned __int16)a3 isPreviousCharacter:(BOOL)a4
{
  return WebCore::isCharacterSmartReplaceExempt();
}

- (void)updateLayoutIgnorePendingStyleSheets
{
  WebThreadRun();
}

uint64_t __59__WebView_WebPrivate__updateLayoutIgnorePendingStyleSheets__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "_mainCoreFrame");
  if (result)
  {
    v2 = result;
    do
    {
      if (!*(_BYTE *)(v2 + 144))
      {
        if (*(_QWORD *)(v2 + 296))
          WebCore::Document::updateLayout();
      }
      result = WebCore::FrameTree::traverseNext((WebCore::FrameTree *)(v2 + 48), 0);
      v2 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)_requestStartDataInteraction:(CGPoint)a3 globalPosition:(CGPoint)a4
{
  uint64_t v5;
  BOOL v6;
  WebCore::EventHandler *v8;
  IntPoint v9;
  IntPoint v10;
  CGPoint v11;
  CGPoint v12;

  v12 = a3;
  v11 = a4;
  WebThreadLock();
  v5 = *((_QWORD *)self->_private->page.m_ptr + 20);
  if (v5)
    v6 = *(_BYTE *)(v5 + 144) == 0;
  else
    v6 = 0;
  if (!v6)
    return 0;
  v8 = *(WebCore::EventHandler **)(v5 + 640);
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v10, &v12);
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v9, &v11);
  return WebCore::EventHandler::tryToBeginDragAtPoint(v8, &v10, &v9);
}

- (void)_startDrag:(const void *)a3
{
  CFTypeRef v5;
  WebUITextIndicatorData *v6;
  uint64_t v7;
  WebViewPrivate *v8;
  void *m_ptr;
  uint64_t v10;
  WebUITextIndicatorData *v11;
  WebViewPrivate *v12;
  void *v13;
  void *v14;
  void *v15;
  WebViewPrivate **p_private;
  RetainPtr<NSURL> *p_draggedLinkURL;
  void *v18;
  uint64_t v19;
  const void *v20;
  const void *v21;
  const void **p_m_ptr;
  const void *v23;
  void *v24;
  WebViewPrivate *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  unsigned int v30;
  unsigned __int8 v31;
  unint64_t v32;
  _BYTE v33[112];
  char v34;

  v5 = *(CFTypeRef *)a3;
  if (*(_QWORD *)a3)
  {
    CFRetain(*(CFTypeRef *)a3);
    CFRelease(v5);
  }
  v33[0] = 0;
  v34 = 0;
  if (*((_BYTE *)a3 + 120))
  {
    WebCore::TextIndicatorData::TextIndicatorData((uint64_t)v33, (const WebCore::TextIndicatorData *)((char *)a3 + 8));
    v34 = 1;
    v6 = [WebUITextIndicatorData alloc];
    if (!v34)
    {
      std::__throw_bad_optional_access[abi:sn180100]();
      __break(1u);
      return;
    }
    v7 = -[WebUITextIndicatorData initWithImage:textIndicatorData:scale:](v6, "initWithImage:textIndicatorData:scale:", v5, v33, *((float *)self->_private->page.m_ptr + 91));
    v8 = self->_private;
    m_ptr = v8->textIndicatorData.m_ptr;
    v8->textIndicatorData.m_ptr = (void *)v7;
    if (m_ptr)
      CFRelease(m_ptr);
    v10 = *((_QWORD *)a3 + 32);
    if (!v10)
      goto LABEL_15;
  }
  else
  {
    v11 = -[WebUITextIndicatorData initWithImage:scale:]([WebUITextIndicatorData alloc], "initWithImage:scale:", v5, *((float *)self->_private->page.m_ptr + 91));
    v12 = self->_private;
    v13 = v12->textIndicatorData.m_ptr;
    v12->textIndicatorData.m_ptr = v11;
    if (v13)
      CFRelease(v13);
    v10 = *((_QWORD *)a3 + 32);
    if (!v10)
      goto LABEL_15;
  }
  if (*(_DWORD *)(v10 + 4))
  {
    v14 = (void *)WTF::URL::operator NSURL *();
    v15 = v14;
    p_private = &self->_private;
    p_draggedLinkURL = &self->_private->draggedLinkURL;
    if (v14)
      CFRetain(v14);
    goto LABEL_16;
  }
LABEL_15:
  v15 = 0;
  p_private = &self->_private;
  p_draggedLinkURL = &self->_private->draggedLinkURL;
LABEL_16:
  v18 = p_draggedLinkURL->m_ptr;
  p_draggedLinkURL->m_ptr = v15;
  if (v18)
    CFRelease(v18);
  v19 = *((_QWORD *)a3 + 31);
  if (v19 && *(_DWORD *)(v19 + 4))
  {
    v20 = (const void *)WTF::StringImpl::operator NSString *();
    v21 = v20;
    p_m_ptr = (const void **)&(*p_private)->draggedLinkTitle.m_ptr;
    if (v20)
      CFRetain(v20);
  }
  else
  {
    v21 = 0;
    p_m_ptr = (const void **)&(*p_private)->draggedLinkTitle.m_ptr;
  }
  v23 = *p_m_ptr;
  *p_m_ptr = v21;
  if (v23)
    CFRelease(v23);
  WebCore::IntRect::operator CGRect();
  v25 = *p_private;
  v25->dragPreviewFrameInRootViewCoordinates.origin.x = v26;
  v25->dragPreviewFrameInRootViewCoordinates.origin.y = v27;
  v25->dragPreviewFrameInRootViewCoordinates.size.width = v28;
  v25->dragPreviewFrameInRootViewCoordinates.size.height = v29;
  v30 = *((unsigned __int16 *)a3 + 108);
  if (v30 < 0x100 || (v31 = v30 - 1, v31 > 7u))
    v32 = 0;
  else
    v32 = qword_1D80FBC60[(char)v31];
  (*p_private)->dragSourceAction = v32;
  std::__optional_destruct_base<WebCore::TextIndicatorData,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v33, v24);
}

- (CGRect)_dataInteractionCaretRect
{
  Page *m_ptr;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  WTF *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  WebThreadLock();
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    ++*(_DWORD *)m_ptr;
    WebCore::DragCaretController::caretRectInRootViewCoordinates(*((WebCore::DragCaretController **)m_ptr + 7));
    WebCore::IntRect::operator CGRect();
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    if (*(_DWORD *)m_ptr == 1)
    {
      v12 = (WTF *)MEMORY[0x1D82A65B4](m_ptr);
      WTF::fastFree(v12, v13);
    }
    else
    {
      --*(_DWORD *)m_ptr;
    }
  }
  else
  {
    v11 = 0.0;
    v9 = 0.0;
    v7 = 0.0;
    v5 = 0.0;
  }
  v14 = v5;
  v15 = v7;
  v16 = v9;
  v17 = v11;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (WebUITextIndicatorData)_dataOperationTextIndicator
{
  return (WebUITextIndicatorData *)self->_private->dataOperationTextIndicator.m_ptr;
}

- (unint64_t)_dragSourceAction
{
  return self->_private->dragSourceAction;
}

- (NSString)_draggedLinkTitle
{
  return (NSString *)self->_private->draggedLinkTitle.m_ptr;
}

- (NSURL)_draggedLinkURL
{
  return (NSURL *)self->_private->draggedLinkURL.m_ptr;
}

- (CGRect)_draggedElementBounds
{
  WebViewPrivate *v2;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  v2 = self->_private;
  x = v2->dragPreviewFrameInRootViewCoordinates.origin.x;
  y = v2->dragPreviewFrameInRootViewCoordinates.origin.y;
  width = v2->dragPreviewFrameInRootViewCoordinates.size.width;
  height = v2->dragPreviewFrameInRootViewCoordinates.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)_getDataInteractionData
{
  return self->_private->textIndicatorData.m_ptr;
}

- (unint64_t)dragDestinationActionMaskForSession:(id)a3
{
  return objc_msgSend(-[WebView _UIDelegateForwarder](self, "_UIDelegateForwarder"), "webView:dragDestinationActionMaskForSession:", self, a3);
}

- (DragData)dragDataForSession:(SEL)a3 client:(id)a4 global:(CGPoint)a5 operation:(CGPoint)a6
{
  float v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  uint64_t v11;
  unint64_t v12;
  float v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  unint64_t v17;
  float v19[2];
  unint64_t v20;
  float v21[2];
  uint64_t v22;
  CGPoint v23;
  CGPoint v24;

  v24 = a5;
  v23 = a6;
  -[WebView dragDestinationActionMaskForSession:](self, "dragDestinationActionMaskForSession:");
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v21, &v24);
  v7 = roundf(v21[0]);
  v8 = 0x7FFFFFFFLL;
  v9 = (int)v7;
  if (v7 <= -2147500000.0)
    v9 = 0x80000000;
  if (v7 < 2147500000.0)
    v8 = v9;
  v10 = roundf(v21[1]);
  v11 = 0x7FFFFFFF00000000;
  v12 = 0x8000000000000000;
  if (v10 > -2147500000.0)
    v12 = (unint64_t)(int)v10 << 32;
  if (v10 < 2147500000.0)
    v11 = v12;
  v22 = v11 | v8;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v19, &v23);
  v13 = roundf(v19[0]);
  v14 = 0x7FFFFFFFLL;
  v15 = 0x80000000;
  if (v13 > -2147500000.0)
    v15 = (int)v13;
  if (v13 < 2147500000.0)
    v14 = v15;
  v16 = roundf(v19[1]);
  if (v16 >= 2147500000.0)
  {
    v17 = 0x7FFFFFFF00000000;
  }
  else if (v16 <= -2147500000.0)
  {
    v17 = 0x8000000000000000;
  }
  else
  {
    v17 = (unint64_t)(int)v16 << 32;
  }
  v20 = v17 | v14;
  return (DragData *)WebCore::DragData::DragData();
}

- (unint64_t)_enteredDataInteraction:(id)a3 client:(CGPoint)a4 global:(CGPoint)a5 operation:(unint64_t)a6
{
  double y;
  double x;
  double v9;
  double v10;
  unsigned int *v13;
  unint64_t v14;
  unsigned int *v15;
  unsigned int v16;
  StringImpl *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl **v19;
  uint64_t v20;
  WTF::StringImpl *v21;
  unsigned int v22;
  unsigned int v23;
  unint64_t result;
  _QWORD *v25;
  _QWORD *v26;
  WTF *v27[2];
  WTF::StringImpl *v28[2];
  unsigned __int16 v29;
  int v30;

  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  v13 = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
  v14 = (unint64_t)v13;
  if (!v13)
    return v14;
  v15 = v13 + 2;
  do
    v16 = __ldaxr(v15);
  while (__stlxr(v16 + 1, v15));
  WebThreadLock();
  if (self)
  {
    -[WebView dragDataForSession:client:global:operation:](self, "dragDataForSession:client:global:operation:", a3, a6, v10, v9, x, y);
  }
  else
  {
    *(_OWORD *)v28 = 0u;
    *(_OWORD *)v27 = 0u;
  }
  WebCore::DragController::dragEnteredOrUpdated();
  if (!v30)
  {
    if (v29 < 0x100u)
    {
LABEL_10:
      v14 = 0;
LABEL_11:
      v18 = v28[1];
      if (v28[1])
      {
LABEL_12:
        if (*(_DWORD *)v18 == 2)
          WTF::StringImpl::destroy(v18, v17);
        else
          *(_DWORD *)v18 -= 2;
      }
    }
    else
    {
      v14 = v29;
      switch((char)v29)
      {
        case 1:
          goto LABEL_11;
        case 4:
        case 16:
          v14 = 16;
          v18 = v28[1];
          if (v28[1])
            goto LABEL_12;
          break;
        default:
          goto LABEL_10;
      }
    }
    if (HIDWORD(v27[1]))
    {
      v19 = (WTF::StringImpl **)v27[0];
      v20 = 8 * HIDWORD(v27[1]);
      do
      {
        v21 = *v19;
        *v19 = 0;
        if (v21)
        {
          if (*(_DWORD *)v21 == 2)
            WTF::StringImpl::destroy(v21, v17);
          else
            *(_DWORD *)v21 -= 2;
        }
        ++v19;
        v20 -= 8;
      }
      while (v20);
    }
    if (v27[0])
      WTF::fastFree(v27[0], v17);
    do
    {
      v22 = __ldaxr(v15);
      v23 = v22 - 1;
    }
    while (__stlxr(v23, v15));
    if (!v23)
    {
      atomic_store(1u, v15);
      v25 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v25 = off_1E9D6A4D8;
      v25[1] = v15;
      v26 = v25;
      WTF::ensureOnMainThread();
      if (v26)
        (*(void (**)(_QWORD *))(*v26 + 8))(v26);
    }
    return v14;
  }
  result = std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (unint64_t)_updatedDataInteraction:(id)a3 client:(CGPoint)a4 global:(CGPoint)a5 operation:(unint64_t)a6
{
  double y;
  double x;
  double v9;
  double v10;
  unsigned int *v13;
  unint64_t v14;
  unsigned int *v15;
  unsigned int v16;
  StringImpl *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl **v19;
  uint64_t v20;
  WTF::StringImpl *v21;
  unsigned int v22;
  unsigned int v23;
  unint64_t result;
  _QWORD *v25;
  _QWORD *v26;
  WTF *v27[2];
  WTF::StringImpl *v28[2];
  unsigned __int16 v29;
  int v30;

  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  v13 = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
  v14 = (unint64_t)v13;
  if (!v13)
    return v14;
  v15 = v13 + 2;
  do
    v16 = __ldaxr(v15);
  while (__stlxr(v16 + 1, v15));
  WebThreadLock();
  if (self)
  {
    -[WebView dragDataForSession:client:global:operation:](self, "dragDataForSession:client:global:operation:", a3, a6, v10, v9, x, y);
  }
  else
  {
    *(_OWORD *)v28 = 0u;
    *(_OWORD *)v27 = 0u;
  }
  WebCore::DragController::dragEnteredOrUpdated();
  if (!v30)
  {
    if (v29 < 0x100u)
    {
LABEL_10:
      v14 = 0;
LABEL_11:
      v18 = v28[1];
      if (v28[1])
      {
LABEL_12:
        if (*(_DWORD *)v18 == 2)
          WTF::StringImpl::destroy(v18, v17);
        else
          *(_DWORD *)v18 -= 2;
      }
    }
    else
    {
      v14 = v29;
      switch((char)v29)
      {
        case 1:
          goto LABEL_11;
        case 4:
        case 16:
          v14 = 16;
          v18 = v28[1];
          if (v28[1])
            goto LABEL_12;
          break;
        default:
          goto LABEL_10;
      }
    }
    if (HIDWORD(v27[1]))
    {
      v19 = (WTF::StringImpl **)v27[0];
      v20 = 8 * HIDWORD(v27[1]);
      do
      {
        v21 = *v19;
        *v19 = 0;
        if (v21)
        {
          if (*(_DWORD *)v21 == 2)
            WTF::StringImpl::destroy(v21, v17);
          else
            *(_DWORD *)v21 -= 2;
        }
        ++v19;
        v20 -= 8;
      }
      while (v20);
    }
    if (v27[0])
      WTF::fastFree(v27[0], v17);
    do
    {
      v22 = __ldaxr(v15);
      v23 = v22 - 1;
    }
    while (__stlxr(v23, v15));
    if (!v23)
    {
      atomic_store(1u, v15);
      v25 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v25 = off_1E9D6A4D8;
      v25[1] = v15;
      v26 = v25;
      WTF::ensureOnMainThread();
      if (v26)
        (*(void (**)(_QWORD *))(*v26 + 8))(v26);
    }
    return v14;
  }
  result = std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (void)_exitedDataInteraction:(id)a3 client:(CGPoint)a4 global:(CGPoint)a5 operation:(unint64_t)a6
{
  double y;
  double x;
  double v9;
  double v10;
  unsigned int *v13;
  unsigned int *v14;
  unsigned int v15;
  StringImpl *v16;
  uint64_t v17;
  WTF::StringImpl **v18;
  uint64_t v19;
  WTF::StringImpl *v20;
  unsigned int v21;
  unsigned int v22;
  _QWORD *v23;
  _QWORD *v24;
  WTF *v25[2];
  WTF::StringImpl *v26[2];

  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  v13 = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
  if (!v13)
    return;
  v14 = v13 + 2;
  do
    v15 = __ldaxr(v14);
  while (__stlxr(v15 + 1, v14));
  WebThreadLock();
  if (self)
  {
    -[WebView dragDataForSession:client:global:operation:](self, "dragDataForSession:client:global:operation:", a3, a6, v10, v9, x, y);
  }
  else
  {
    *(_OWORD *)v26 = 0u;
    *(_OWORD *)v25 = 0u;
  }
  WebCore::DragController::dragExited();
  if (!v26[1])
  {
LABEL_10:
    v17 = HIDWORD(v25[1]);
    if (!HIDWORD(v25[1]))
      goto LABEL_19;
LABEL_13:
    v18 = (WTF::StringImpl **)v25[0];
    v19 = 8 * v17;
    do
    {
      v20 = *v18;
      *v18 = 0;
      if (v20)
      {
        if (*(_DWORD *)v20 == 2)
          WTF::StringImpl::destroy(v20, v16);
        else
          *(_DWORD *)v20 -= 2;
      }
      ++v18;
      v19 -= 8;
    }
    while (v19);
    goto LABEL_19;
  }
  if (*(_DWORD *)v26[1] != 2)
  {
    *(_DWORD *)v26[1] -= 2;
    goto LABEL_10;
  }
  WTF::StringImpl::destroy(v26[1], v16);
  v17 = HIDWORD(v25[1]);
  if (HIDWORD(v25[1]))
    goto LABEL_13;
LABEL_19:
  if (v25[0])
    WTF::fastFree(v25[0], v16);
  do
  {
    v21 = __ldaxr(v14);
    v22 = v21 - 1;
  }
  while (__stlxr(v22, v14));
  if (!v22)
  {
    atomic_store(1u, v14);
    v23 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v23 = off_1E9D6A4D8;
    v23[1] = v14;
    v24 = v23;
    WTF::ensureOnMainThread();
    if (v24)
      (*(void (**)(_QWORD *))(*v24 + 8))(v24);
  }
}

- (BOOL)_tryToPerformDataInteraction:(id)a3 client:(CGPoint)a4 global:(CGPoint)a5 operation:(unint64_t)a6
{
  double y;
  double x;
  double v9;
  double v10;
  StringImpl *v13;
  char v14;
  uint64_t v15;
  WTF::StringImpl **v16;
  uint64_t v17;
  WTF::StringImpl *v18;
  WTF *v20[2];
  WTF::StringImpl *v21[2];

  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  WebThreadLock();
  if (self)
  {
    -[WebView dragDataForSession:client:global:operation:](self, "dragDataForSession:client:global:operation:", a3, a6, v10, v9, x, y);
  }
  else
  {
    *(_OWORD *)v21 = 0u;
    *(_OWORD *)v20 = 0u;
  }
  v14 = WebCore::DragController::performDragOperation();
  if (!v21[1])
  {
LABEL_7:
    v15 = HIDWORD(v20[1]);
    if (!HIDWORD(v20[1]))
      goto LABEL_16;
    goto LABEL_10;
  }
  if (*(_DWORD *)v21[1] != 2)
  {
    *(_DWORD *)v21[1] -= 2;
    goto LABEL_7;
  }
  WTF::StringImpl::destroy(v21[1], v13);
  v15 = HIDWORD(v20[1]);
  if (!HIDWORD(v20[1]))
    goto LABEL_16;
LABEL_10:
  v16 = (WTF::StringImpl **)v20[0];
  v17 = 8 * v15;
  do
  {
    v18 = *v16;
    *v16 = 0;
    if (v18)
    {
      if (*(_DWORD *)v18 == 2)
        WTF::StringImpl::destroy(v18, v13);
      else
        *(_DWORD *)v18 -= 2;
    }
    ++v16;
    v17 -= 8;
  }
  while (v17);
LABEL_16:
  if (v20[0])
    WTF::fastFree(v20[0], v13);
  return v14;
}

- (void)_endedDataInteraction:(CGPoint)a3 global:(CGPoint)a4
{
  WebViewPrivate *v5;
  void *m_ptr;
  WebViewPrivate *v7;
  CGSize v8;
  WebViewPrivate *v9;
  void *v10;
  WebViewPrivate *v11;
  void *v12;

  WebThreadLock();
  WebCore::DragController::dragEnded(*((WebCore::DragController **)self->_private->page.m_ptr + 8));
  v5 = self->_private;
  m_ptr = v5->dataOperationTextIndicator.m_ptr;
  v5->dataOperationTextIndicator.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v7 = self->_private;
  v8 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  v7->dragPreviewFrameInRootViewCoordinates.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  v7->dragPreviewFrameInRootViewCoordinates.size = v8;
  self->_private->dragSourceAction = 0;
  v9 = self->_private;
  v10 = v9->draggedLinkTitle.m_ptr;
  v9->draggedLinkTitle.m_ptr = 0;
  if (v10)
    CFRelease(v10);
  v11 = self->_private;
  v12 = v11->draggedLinkURL.m_ptr;
  v11->draggedLinkURL.m_ptr = 0;
  if (v12)
    CFRelease(v12);
}

- (void)_didConcludeEditDrag
{
  WebViewPrivate *v3;
  void *m_ptr;
  Page *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  WebUITextIndicatorData *v9;
  uint64_t v10;
  void *v11;
  WebViewPrivate *v12;
  void *v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;
  _DWORD *v17;
  _DWORD *v18;
  _DWORD *v19;
  WTF *v20;
  _DWORD *v21;
  uint64_t v22;
  WTF *v23;
  void *v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  WTF *v28;
  void *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD v32[6];
  WTF *v33;
  int v34;
  _DWORD *v35;
  _DWORD *v36;
  _DWORD *v37;
  uint64_t v38;
  _DWORD *v39;
  uint64_t v40;
  uint64_t v41;
  char v42;

  v3 = self->_private;
  m_ptr = v3->dataOperationTextIndicator.m_ptr;
  v3->dataOperationTextIndicator.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v5 = self->_private->page.m_ptr;
  if (v5)
  {
    ++*(_DWORD *)v5;
    v6 = WebCore::FocusController::focusedOrMainFrame(*((WebCore::FocusController **)v5 + 9));
    if (!v6)
    {
LABEL_49:
      if (*(_DWORD *)v5 == 1)
      {
        v28 = (WTF *)MEMORY[0x1D82A65B4](v5);
        WTF::fastFree(v28, v29);
      }
      else
      {
        --*(_DWORD *)v5;
      }
      return;
    }
    v7 = (unsigned int *)(v6 + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 + 1, v7));
    WebCore::VisibleSelection::toNormalizedRange((WebCore::VisibleSelection *)(*(_QWORD *)(*(_QWORD *)(v6 + 296) + 3064)
                                                                             + 56));
    if (!v42)
      goto LABEL_47;
    WebCore::TextIndicator::createWithRange();
    if (!v39)
      goto LABEL_32;
    v9 = [WebUITextIndicatorData alloc];
    WebCore::TextIndicatorData::TextIndicatorData((uint64_t)v32, (const WebCore::TextIndicatorData *)(v39 + 2));
    v10 = -[WebUITextIndicatorData initWithImage:textIndicatorData:scale:](v9, "initWithImage:textIndicatorData:scale:", 0, v32, *((float *)v5 + 91));
    v12 = self->_private;
    v13 = v12->dataOperationTextIndicator.m_ptr;
    v12->dataOperationTextIndicator.m_ptr = (void *)v10;
    if (v13)
      CFRelease(v13);
    if ((v38 & 0x8000000000000) == 0)
      goto LABEL_15;
    v14 = (unsigned int *)(v38 & 0xFFFFFFFFFFFFLL);
    do
    {
      v15 = __ldaxr(v14);
      v16 = v15 - 1;
    }
    while (__stlxr(v16, v14));
    if (!v16)
    {
      atomic_store(1u, v14);
      WTF::fastFree((WTF *)v14, v11);
      v17 = v37;
      v37 = 0;
      if (!v17)
        goto LABEL_19;
    }
    else
    {
LABEL_15:
      v17 = v37;
      v37 = 0;
      if (!v17)
        goto LABEL_19;
    }
    if (v17[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v17 + 8))(v17);
    else
      --v17[2];
LABEL_19:
    v18 = v36;
    v36 = 0;
    if (v18)
    {
      if (v18[2] == 1)
      {
        (*(void (**)(_DWORD *))(*(_QWORD *)v18 + 8))(v18);
        v19 = v35;
        v35 = 0;
        if (!v19)
          goto LABEL_27;
LABEL_25:
        if (v19[2] == 1)
        {
          (*(void (**)(_DWORD *))(*(_QWORD *)v19 + 8))(v19);
          v20 = v33;
          if (!v33)
          {
LABEL_29:
            v21 = v39;
            v39 = 0;
            if (v21)
            {
              if (*v21 == 1)
              {
                v23 = (WTF *)MEMORY[0x1D82A4514]();
                WTF::fastFree(v23, v24);
                if (v42)
                  goto LABEL_33;
                goto LABEL_47;
              }
              --*v21;
            }
LABEL_32:
            if (v42)
            {
LABEL_33:
              v22 = v41;
              v41 = 0;
              if (v22)
              {
                if (*(_DWORD *)(v22 + 24) == 2)
                {
                  if ((*(_WORD *)(v22 + 30) & 0x400) == 0)
                    WebCore::Node::removedLastRef((WebCore::Node *)v22);
                }
                else
                {
                  *(_DWORD *)(v22 + 24) -= 2;
                }
              }
              v25 = v40;
              v40 = 0;
              if (v25)
              {
                if (*(_DWORD *)(v25 + 24) == 2)
                {
                  if ((*(_WORD *)(v25 + 30) & 0x400) == 0)
                    WebCore::Node::removedLastRef((WebCore::Node *)v25);
                }
                else
                {
                  *(_DWORD *)(v25 + 24) -= 2;
                }
              }
              goto LABEL_47;
            }
            do
            {
LABEL_47:
              v26 = __ldaxr(v7);
              v27 = v26 - 1;
            }
            while (__stlxr(v27, v7));
            if (!v27)
            {
              atomic_store(1u, v7);
              v30 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
              *v30 = off_1E9D6A4D8;
              v30[1] = v7;
              v32[0] = v30;
              WTF::ensureOnMainThread();
              v31 = v32[0];
              v32[0] = 0;
              if (v31)
                (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
            }
            goto LABEL_49;
          }
LABEL_28:
          v33 = 0;
          v34 = 0;
          WTF::fastFree(v20, v11);
          goto LABEL_29;
        }
        --v19[2];
LABEL_27:
        v20 = v33;
        if (!v33)
          goto LABEL_29;
        goto LABEL_28;
      }
      --v18[2];
    }
    v19 = v35;
    v35 = 0;
    if (!v19)
      goto LABEL_27;
    goto LABEL_25;
  }
}

+ (void)_registerPluginMIMEType:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_opt_class();
  +[WebView registerViewClass:representationClass:forMIMEType:](WebView, "registerViewClass:representationClass:forMIMEType:", v4, objc_opt_class(), a3);
  if (byte_1ECEC97ED == 1)
  {
    v5 = (id)qword_1ECEC9830;
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    qword_1ECEC9830 = (uint64_t)v5;
    byte_1ECEC97ED = 1;
  }
  objc_msgSend(v5, "addObject:", a3);
}

+ (void)_unregisterPluginMIMEType:(id)a3
{
  id v4;

  objc_msgSend(a1, "_unregisterViewClassAndRepresentationClassForMIMEType:");
  if (byte_1ECEC97ED == 1)
  {
    v4 = (id)qword_1ECEC9830;
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    qword_1ECEC9830 = (uint64_t)v4;
    byte_1ECEC97ED = 1;
  }
  objc_msgSend(v4, "removeObject:", a3);
}

+ (BOOL)_viewClass:(Class *)a3 andRepresentationClass:(Class *)a4 forMIMEType:(id)a5 allowingPlugins:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v9;
  objc_class *v10;
  uint64_t v11;
  BOOL v12;
  objc_class *v13;
  int v14;

  v6 = a6;
  v9 = objc_msgSend(a5, "lowercaseString");
  v10 = (objc_class *)objc_msgSend(+[WebFrameView _viewTypesAllowImageTypeOmission:](WebFrameView, "_viewTypesAllowImageTypeOmission:", 1), "_webkit_objectForMIMEType:", v9);
  v11 = objc_msgSend(+[WebDataSource _repTypesAllowImageTypeOmission:](WebDataSource, "_repTypesAllowImageTypeOmission:", 1), "_webkit_objectForMIMEType:", v9);
  if (v10)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (v12
    || (v13 = (objc_class *)v11,
        objc_msgSend((id)-[objc_class supportedMIMETypes](+[WebView _getPDFViewClass](WebView, "_getPDFViewClass"), "supportedMIMETypes"), "containsObject:", v9)))
  {
    if (v6)
      +[WebPluginDatabase sharedDatabase](WebPluginDatabase, "sharedDatabase");
    v10 = (objc_class *)objc_msgSend(+[WebFrameView _viewTypesAllowImageTypeOmission:](WebFrameView, "_viewTypesAllowImageTypeOmission:", 0), "_webkit_objectForMIMEType:", v9);
    v13 = (objc_class *)objc_msgSend(+[WebDataSource _repTypesAllowImageTypeOmission:](WebDataSource, "_repTypesAllowImageTypeOmission:", 0), "_webkit_objectForMIMEType:", v9);
  }
  LOBYTE(v14) = 0;
  if (v10 && v13)
  {
    if (v10 == (objc_class *)objc_opt_class() && v13 == (objc_class *)objc_opt_class())
    {
      if ((objc_msgSend(+[WebHTMLView unsupportedTextMIMETypes](WebHTMLView, "unsupportedTextMIMETypes"), "containsObject:", v9) & 1) != 0)
      {
        LOBYTE(v14) = 0;
        return v14;
      }
      if (!v6)
      {
        if (byte_1ECEC97ED == 1)
        {
          if (objc_msgSend((id)qword_1ECEC9830, "containsObject:", v9))
          {
LABEL_24:
            if ((objc_msgSend(+[WebHTMLView supportedNonImageMIMETypes](WebHTMLView, "supportedNonImageMIMETypes"), "containsObject:", v9) & 1) == 0)
            {
              v14 = objc_msgSend(+[WebHTMLView supportedMIMETypes](WebHTMLView, "supportedMIMETypes"), "containsObject:", v9);
              if (!v14)
                return v14;
            }
          }
        }
        else
        {
          qword_1ECEC9830 = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E20]);
          byte_1ECEC97ED = 1;
          if (objc_msgSend((id)qword_1ECEC9830, "containsObject:", v9))
            goto LABEL_24;
        }
      }
    }
    if (a3)
      *a3 = v10;
    if (a4)
      *a4 = v13;
    LOBYTE(v14) = 1;
  }
  return v14;
}

- (BOOL)_viewClass:(Class *)a3 andRepresentationClass:(Class *)a4 forMIMEType:(id)a5
{
  return objc_msgSend((id)objc_opt_class(), "_viewClass:andRepresentationClass:forMIMEType:allowingPlugins:", a3, a4, a5, 0);
}

+ (void)_setAlwaysUsesComplexTextCodePath:(BOOL)a3
{
  WebCore::FontCascade::setCodePath();
}

+ (void)closeAllWebViews
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WebCore::LocalDOMWindow::dispatchAllPendingUnloadEvents((WebCore::LocalDOMWindow *)a1);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  if (byte_1ECEC97E6 == 1)
  {
    v2 = (void *)qword_1ECEC9818;
  }
  else
  {
    v2 = 0;
    qword_1ECEC9818 = 0;
    byte_1ECEC97E6 = 1;
  }
  v3 = (void *)objc_msgSend(v2, "allObjects", (_QWORD)v8);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "close");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

+ (BOOL)canShowFile:(id)a3
{
  return objc_msgSend((id)objc_opt_class(), "canShowMIMEType:", +[WebView _MIMETypeForFile:](WebView, "_MIMETypeForFile:", a3));
}

- (BOOL)_isClosed
{
  WebViewPrivate *v2;

  v2 = self->_private;
  return !v2 || v2->closed;
}

- (void)_dispatchUnloadEvent
{
  WebThreadRun();
}

WebCore *__43__WebView_WebPrivate___dispatchUnloadEvent__block_invoke(uint64_t a1)
{
  WebCore *result;
  uint64_t v2;
  uint64_t v3;
  WebCore *v4;

  result = (WebCore *)objc_msgSend(*(id *)(a1 + 32), "mainFrame");
  if (result)
  {
    v2 = *(_QWORD *)(*((_QWORD *)result + 1) + 8);
    if (v2)
    {
      if (*(_QWORD *)(v2 + 296))
      {
        v3 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 736);
        if (!v3 || (result = *(WebCore **)(v3 + 96)) == 0)
          result = (WebCore *)WebCore::threadGlobalDataSlow(result);
        if (!*((_QWORD *)result + 5))
          WebCore::ThreadGlobalData::initializeEventNames(result);
        WebCore::Event::create();
        WebCore::Document::dispatchWindowEvent();
        result = v4;
        if (v4)
        {
          if (*((_DWORD *)v4 + 4) == 1)
            return (WebCore *)(*(uint64_t (**)())(*(_QWORD *)v4 + 8))();
          else
            --*((_DWORD *)v4 + 4);
        }
      }
    }
  }
  return result;
}

- (id)styleAtSelectionStart
{
  WebCore::EditingStyle *v2;
  DOMObjectInternal *v3;
  DOMObjectInternal *v4;
  int v5;
  WTF *v7;
  void *v8;
  WebCore::EditingStyle *v9;

  if (!-[WebView _mainCoreFrame](self, "_mainCoreFrame"))
    return 0;
  WebCore::EditingStyle::styleAtSelectionStart();
  v2 = v9;
  if (!v9)
    return 0;
  if (*((_QWORD *)v9 + 1))
  {
    v3 = (DOMObjectInternal *)WebCore::MutableStyleProperties::ensureCSSStyleDeclaration(*((WebCore::MutableStyleProperties **)v9
                                                                                         + 1));
    v4 = kit(v3);
    v2 = v9;
    v5 = *(_DWORD *)v9 - 1;
    if (*(_DWORD *)v9 != 1)
      goto LABEL_6;
LABEL_10:
    WebCore::EditingStyle::~EditingStyle(v2);
    WTF::fastFree(v7, v8);
    return v4;
  }
  v4 = 0;
  v5 = *(_DWORD *)v9 - 1;
  if (*(_DWORD *)v9 == 1)
    goto LABEL_10;
LABEL_6:
  *(_DWORD *)v2 = v5;
  return v4;
}

- (unint64_t)_renderTreeSize
{
  unint64_t result;

  result = (unint64_t)self->_private->page.m_ptr;
  if (result)
    return WebCore::Page::renderTreeSize((WebCore::Page *)result);
  return result;
}

- (void)_dispatchTileDidDraw:(id)a3
{
  id v5;
  int *p_didDrawTiles;

  v5 = -[WebView _webMailDelegate](self, "_webMailDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "_webthread_webView:tileDidDraw:", self, a3);
  }
  else
  {
    p_didDrawTiles = &self->_private->didDrawTiles;
    while (!__ldxr((unsigned int *)p_didDrawTiles))
    {
      if (!__stxr(1u, (unsigned int *)p_didDrawTiles))
      {
        WebThreadLock();
        objc_msgSend((id)objc_msgSend(-[WebView _UIKitDelegateForwarder](self, "_UIKitDelegateForwarder"), "asyncForwarder"), "webViewDidDrawTiles:", self);
        return;
      }
    }
    __clrex();
  }
}

- (void)_willStartScrollingOrZooming
{
  WebViewPrivate *v2;

  v2 = self->_private;
  if (!v2->mainViewIsScrollingOrZooming)
  {
    v2->mainViewIsScrollingOrZooming = 1;
    -[WebView hideFormValidationMessage](self, "hideFormValidationMessage");
    -[WebFrame setTimeoutsPaused:](-[WebView mainFrame](self, "mainFrame"), "setTimeoutsPaused:", 1);
    -[WebView setDefersCallbacks:](self, "setDefersCallbacks:", 1);
  }
}

- (void)_didFinishScrollingOrZooming
{
  WebViewPrivate *v2;
  WebCore::LocalFrameView *v4;

  v2 = self->_private;
  if (v2->mainViewIsScrollingOrZooming)
  {
    v2->mainViewIsScrollingOrZooming = 0;
    -[WebView setDefersCallbacks:](self, "setDefersCallbacks:", 0);
    -[WebFrame setTimeoutsPaused:](-[WebView mainFrame](self, "mainFrame"), "setTimeoutsPaused:", 0);
    v4 = *(WebCore::LocalFrameView **)(-[WebView _mainCoreFrame](self, "_mainCoreFrame") + 288);
    if (v4)
      WebCore::LocalFrameView::resumeVisibleImageAnimationsIncludingSubframes(v4);
  }
}

- (void)_setResourceLoadSchedulerSuspended:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  v3 = a3;
  v4 = (_QWORD *)WebCore::platformStrategies((WebCore *)self);
  v5 = v4[1];
  if (v5)
  {
    v6 = *(_DWORD *)(v5 + 80);
    if (v3)
    {
LABEL_3:
      *(_DWORD *)(v5 + 80) = v6 + 1;
      return;
    }
  }
  else
  {
    v5 = (*(uint64_t (**)(_QWORD *))(*v4 + 16))(v4);
    v4[1] = v5;
    v6 = *(_DWORD *)(v5 + 80);
    if (v3)
      goto LABEL_3;
  }
  v7 = v6 - 1;
  *(_DWORD *)(v5 + 80) = v7;
  if (!v7)
  {
    if ((v8 = *(_QWORD *)(v5 + 8)) != 0 && *(_DWORD *)(v8 - 12)
      || (v9 = *(_QWORD **)(v5 + 16), (v10 = v9[22]) != 0) && *(_DWORD *)(v10 - 12)
      || v9[2] != v9[3]
      || v9[6] != v9[7]
      || v9[10] != v9[11]
      || v9[14] != v9[15]
      || v9[18] != v9[19])
    {
      if ((*(_QWORD *)(v5 + 56) & 0xFFFFFFFFFFFFLL) == 0
        || *(double *)((*(_QWORD *)(v5 + 56) & 0xFFFFFFFFFFFFLL) + 8) == 0.0)
      {
        WebCore::TimerBase::start();
      }
    }
  }
}

+ (BOOL)_isUnderMemoryPressure
{
  uint64_t v2;
  int v3;

  v2 = WTF::MemoryPressureHandler::singleton((WTF::MemoryPressureHandler *)a1);
  v3 = atomic_load((unsigned __int8 *)(v2 + 4));
  return v3 == 2 || *(_BYTE *)(v2 + 7) != 0;
}

- (void)_closePluginDatabases
{
  BOOL v2;

  if (--pluginDatabaseClientCount)
    v2 = 1;
  else
    v2 = applicationIsTerminating == 0;
  if (!v2)
    +[WebPluginDatabase closeSharedDatabase](WebPluginDatabase, "closeSharedDatabase");
}

- (void)_closeWithFastTeardown
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  -[WebView _closePluginDatabases](self, "_closePluginDatabases");
}

- (void)_close
{
  -[WebView _clearDelegates](self, "_clearDelegates");
  WebThreadRun();
}

void __29__WebView_WebPrivate___close__block_invoke(uint64_t a1)
{
  uint64_t v1;
  char v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  _DWORD *v7;
  uint64_t v8;
  WTF *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  WTF *v13;
  uint64_t v14;
  void *v15;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  if (v1 && !*(_BYTE *)(v1 + 736))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("WebViewWillCloseNotification"), *(_QWORD *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 736) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_removeFromAllWebViewsSet");
    if (applicationIsTerminating)
    {
      if (byte_1ECEC97EF == 1)
      {
        if (byte_1ECEC97EE)
        {
LABEL_7:
          objc_msgSend(*(id *)(a1 + 32), "_closeWithFastTeardown");
          return;
        }
      }
      else
      {
        v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("WebKitEnableFullDocumentTeardown"));
        byte_1ECEC97EE = v3 ^ 1;
        byte_1ECEC97EF = 1;
        if ((v3 & 1) == 0)
          goto LABEL_7;
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 737) = 1;
    v4 = objc_msgSend(*(id *)(a1 + 32), "_mainCoreFrame");
    if (v4)
      WebCore::FrameLoader::detachFromParent(*(WebCore::FrameLoader **)(v4 + 280));
    objc_msgSend(*(id *)(a1 + 32), "setHostWindow:", 0);
    WebViewGroup::removeWebView(*(WebViewGroup **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16), *(WebView **)(a1 + 32));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    v7 = *(_DWORD **)(v6 + 8);
    *(_QWORD *)(v6 + 8) = 0;
    if (v7)
    {
      if (*v7 == 1)
      {
        v9 = (WTF *)MEMORY[0x1D82A65B4]();
        WTF::fastFree(v9, v10);
        v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 1008);
        if (!v8)
          goto LABEL_19;
        goto LABEL_17;
      }
      --*v7;
    }
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 1008);
    if (!v8)
    {
LABEL_19:
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_notificationProvider", v5), "unregisterWebView:", *(_QWORD *)(a1 + 32));
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", *(_QWORD *)(a1 + 32));
      +[WebPreferences _removeReferenceForIdentifier:](WebPreferences, "_removeReferenceForIdentifier:", objc_msgSend(*(id *)(a1 + 32), "preferencesIdentifier"));
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      v15 = *(void **)(v14 + 208);
      *(_QWORD *)(v14 + 208) = 0;
      objc_msgSend(v15, "didRemoveFromWebView");
      objc_msgSend(*(id *)(a1 + 32), "_closePluginDatabases");
      if (v15)
        CFRelease(v15);
      return;
    }
LABEL_17:
    *(_QWORD *)(v8 + 16) = 0;
    WebCore::RunLoopObserver::invalidate(*(WebCore::RunLoopObserver **)(v8 + 24));
    WebCore::RunLoopObserver::invalidate(*(WebCore::RunLoopObserver **)(v8 + 32));
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    v13 = *(WTF **)(v12 + 1008);
    *(_QWORD *)(v12 + 1008) = 0;
    if (v13)
      v5 = WebViewRenderingUpdateScheduler::operator delete(v13, v11);
    goto LABEL_19;
  }
}

- (BOOL)_isProcessingUserGesture
{
  return WebCore::UserGestureIndicator::processingUserGesture(0, (const Document *)a2);
}

+ (id)_MIMETypeForFile:(id)a3
{
  int v4;
  id result;
  void *v6;
  void *v7;
  void *v8;

  if (!objc_msgSend(0, "length")
    || (v4 = objc_msgSend(0, "isEqualToString:", CFSTR("application/octet-stream")), result = 0, v4))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingAtPath:", a3);
    v7 = (void *)objc_msgSend(v6, "readDataOfLength:", 1024);
    objc_msgSend(v6, "closeFile");
    if (objc_msgSend(v7, "length"))
      v8 = (void *)objc_msgSend(v7, "_webkit_guessedMIMEType");
    else
      v8 = 0;
    if (objc_msgSend(v8, "length"))
      return v8;
    else
      return CFSTR("application/octet-stream");
  }
  return result;
}

- (id)_downloadURL:(id)a3
{
  const void *v4;
  id v5;

  v4 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C80]), "initWithURL:", a3);
  v5 = +[NSURLDownload _downloadWithRequest:delegate:directory:](WebDownload, "_downloadWithRequest:delegate:directory:", v4, self->_private->downloadDelegate, 0);
  if (v4)
    CFRelease(v4);
  return v5;
}

- (id)_openNewWindowWithRequest:(id)a3
{
  id v4;
  WebView *v5;
  WebView *v6;

  v4 = -[WebView _UIDelegateForwarder](self, "_UIDelegateForwarder", a3);
  v5 = (WebView *)objc_msgSend(v4, "webView:createWebViewWithRequest:windowFeatures:", self, 0, MEMORY[0x1E0C9AA70]);
  v6 = v5;
  if (v5)
    CallUIDelegate(v5, (objc_selector *)sel_webViewShow_);
  return v6;
}

- (BOOL)_useDarkAppearance
{
  WebViewPrivate *v2;
  WebCore::Page *m_ptr;

  v2 = self->_private;
  if (v2 && (m_ptr = (WebCore::Page *)v2->page.m_ptr) != 0)
    return WebCore::Page::useDarkAppearance(m_ptr);
  else
    return 0;
}

- (void)_setUseDarkAppearance:(BOOL)a3
{
  WebViewPrivate *v3;
  Page *m_ptr;

  v3 = self->_private;
  if (v3)
  {
    m_ptr = v3->page.m_ptr;
    if (m_ptr)
      -[WebView _setUseDarkAppearance:useElevatedUserInterfaceLevel:](self, "_setUseDarkAppearance:useElevatedUserInterfaceLevel:", a3, *((unsigned __int8 *)m_ptr + 451));
  }
}

- (BOOL)_useElevatedUserInterfaceLevel
{
  WebViewPrivate *v2;
  Page *m_ptr;

  v2 = self->_private;
  return v2 && (m_ptr = v2->page.m_ptr) != 0 && *((_BYTE *)m_ptr + 451) != 0;
}

- (void)_setUseElevatedUserInterfaceLevel:(BOOL)a3
{
  WebViewPrivate *v3;
  WebCore::Page *m_ptr;

  v3 = self->_private;
  if (v3)
  {
    m_ptr = (WebCore::Page *)v3->page.m_ptr;
    if (m_ptr)
      -[WebView _setUseDarkAppearance:useElevatedUserInterfaceLevel:](self, "_setUseDarkAppearance:useElevatedUserInterfaceLevel:", WebCore::Page::useDarkAppearance(m_ptr), a3);
  }
}

- (void)_setUseDarkAppearance:(BOOL)a3 useInactiveAppearance:(BOOL)a4
{
  -[WebView _setUseDarkAppearance:useElevatedUserInterfaceLevel:](self, "_setUseDarkAppearance:useElevatedUserInterfaceLevel:", a3, !a4);
}

- (void)_setUseDarkAppearance:(BOOL)a3 useElevatedUserInterfaceLevel:(BOOL)a4
{
  WebViewPrivate *v4;
  WebCore::Page *m_ptr;

  v4 = self->_private;
  if (v4)
  {
    m_ptr = (WebCore::Page *)v4->page.m_ptr;
    if (m_ptr)
      WebCore::Page::effectiveAppearanceDidChange(m_ptr);
  }
}

+ (void)_setIconLoadingEnabled:(BOOL)a3
{
  iconLoadingEnabled = a3;
}

+ (BOOL)_isIconLoadingEnabled
{
  return iconLoadingEnabled;
}

- (id)inspector
{
  WebInspector *v4;
  WebViewPrivate *v5;
  void *m_ptr;

  if (self->_private->inspector.m_ptr)
    return self->_private->inspector.m_ptr;
  v4 = -[WebInspector initWithInspectedWebView:]([WebInspector alloc], "initWithInspectedWebView:", self);
  v5 = self->_private;
  m_ptr = v5->inspector.m_ptr;
  v5->inspector.m_ptr = v4;
  if (!m_ptr)
    return self->_private->inspector.m_ptr;
  CFRelease(m_ptr);
  return self->_private->inspector.m_ptr;
}

+ (void)_enableRemoteInspector
{
  Inspector::RemoteInspector *v2;

  v2 = (Inspector::RemoteInspector *)Inspector::RemoteInspector::singleton((Inspector::RemoteInspector *)a1);
  Inspector::RemoteInspector::start(v2);
}

+ (void)_disableRemoteInspector
{
  Inspector::RemoteInspector *v2;

  v2 = (Inspector::RemoteInspector *)Inspector::RemoteInspector::singleton((Inspector::RemoteInspector *)a1);
  Inspector::RemoteInspector::stop(v2);
}

+ (BOOL)_isRemoteInspectorEnabled
{
  return *(_BYTE *)(Inspector::RemoteInspector::singleton((Inspector::RemoteInspector *)a1) + 112);
}

+ (BOOL)_hasRemoteInspectorSession
{
  return *(_BYTE *)(Inspector::RemoteInspector::singleton((Inspector::RemoteInspector *)a1) + 113);
}

- (BOOL)allowsRemoteInspection
{
  return WebCore::Page::inspectable((WebCore::Page *)self->_private->page.m_ptr);
}

- (void)setAllowsRemoteInspection:(BOOL)a3
{
  WebCore::Page::setInspectable((WebCore::Page *)self->_private->page.m_ptr);
}

- (void)setShowingInspectorIndication:(BOOL)a3
{
  void *m_ptr;
  WebIndicateLayer *v5;
  WebViewPrivate *v6;
  void *v7;
  WebViewPrivate *v8;
  void *v9;

  m_ptr = self->_private->indicateLayer.m_ptr;
  if (a3)
  {
    if (!m_ptr)
    {
      v5 = -[WebIndicateLayer initWithWebView:]([WebIndicateLayer alloc], "initWithWebView:", self);
      v6 = self->_private;
      v7 = v6->indicateLayer.m_ptr;
      v6->indicateLayer.m_ptr = v5;
      if (v7)
        CFRelease(v7);
      objc_msgSend(self->_private->indicateLayer.m_ptr, "setNeedsLayout");
      objc_msgSend((id)objc_msgSend((id)-[WebView window](self, "window"), "hostLayer"), "addSublayer:", self->_private->indicateLayer.m_ptr);
    }
  }
  else
  {
    objc_msgSend(m_ptr, "removeFromSuperlayer");
    v8 = self->_private;
    v9 = v8->indicateLayer.m_ptr;
    v8->indicateLayer.m_ptr = 0;
    if (v9)
      CFRelease(v9);
  }
}

- (void)_setHostApplicationProcessIdentifier:(int)a3 auditToken:(id *)a4
{
  Inspector::RemoteInspector *v4;

  v4 = CFDataCreate(0, (const UInt8 *)a4, 32);
  Inspector::RemoteInspector::singleton(v4);
  if (v4)
    CFRetain(v4);
  Inspector::RemoteInspector::setParentProcessInformation();
  if (v4)
  {
    CFRelease(v4);
    CFRelease(v4);
  }
}

- (NakedPtr<WebCore::Page>)page
{
  Page **v2;

  *v2 = self->_private->page.m_ptr;
  return (NakedPtr<WebCore::Page>)self;
}

- (void)_mouseDidMoveOverElement:(id)a3 modifierFlags:(unint64_t)a4
{
  if (a3)
    CallUIDelegate(self, (objc_selector *)sel_webView_mouseDidMoveOverElement_modifierFlags_, (objc_object *)a3, a4);
}

- (void)_loadBackForwardListFromOtherView:(id)a3
{
  Page *m_ptr;
  uint64_t v5;
  uint64_t v7;
  WebCore::BackForwardController *v8;
  _DWORD *v9;
  WTF *v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  BOOL v15;
  unsigned int *v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  WTF *v21;
  void *v22;
  uint64_t v23;
  WebCore::HistoryItem *v25;
  WTF *v26;
  void *v27;
  uint64_t v28;
  _DWORD *v29;
  _QWORD *v30;
  _DWORD *v31;
  WebCore::HistoryItem *v32;
  _DWORD *v33;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    v5 = *(_QWORD *)(*((_QWORD *)a3 + 10) + 8);
    if (v5)
    {
      v7 = *((_QWORD *)m_ptr + 17);
      v8 = *(WebCore::BackForwardController **)(v5 + 136);
      WebCore::BackForwardController::currentItem(v8);
      v9 = v33;
      v33 = 0;
      if (v9)
      {
        if (*v9 == 1)
        {
          v10 = (WTF *)MEMORY[0x1D82A3F20]();
          WTF::fastFree(v10, v11);
        }
        else
        {
          --*v9;
        }
        v12 = WebCore::BackForwardController::forwardCount(v8);
        v13 = -(int)WebCore::BackForwardController::backCount(v8);
        if (v12 >= v13)
        {
          v20 = v12 + 1;
          do
          {
            if (!v13)
            {
              v23 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a3 + 10) + 8) + 160);
              if (v23 && *(_BYTE *)(v23 + 144) == 0)
                WebCore::HistoryController::saveDocumentAndScrollState(*(WebCore::HistoryController **)(v23 + 184));
            }
            WebCore::BackForwardController::itemAtIndex(v8);
            WebCore::HistoryItem::copy(v32);
            v25 = v32;
            v32 = 0;
            if (v25)
            {
              if (*(_DWORD *)v25 == 1)
              {
                v26 = (WTF *)MEMORY[0x1D82A3F20]();
                WTF::fastFree(v26, v27);
              }
              else
              {
                --*(_DWORD *)v25;
              }
            }
            v28 = *((_QWORD *)self->_private->page.m_ptr + 20);
            (*(void (**)(_QWORD, _QWORD, _QWORD, _DWORD **))(**(_QWORD **)(v7 + 16) + 16))(*(_QWORD *)(v7 + 16), *(_QWORD *)(v28 + 32), *(_QWORD *)(v28 + 40), &v33);
            v29 = v33;
            v33 = 0;
            if (v29)
            {
              if (*v29 == 1)
              {
                v21 = (WTF *)MEMORY[0x1D82A3F20]();
                WTF::fastFree(v21, v22);
              }
              else
              {
                --*v29;
              }
            }
            ++v13;
          }
          while (v20 != v13);
        }
        v14 = *((_QWORD *)self->_private->page.m_ptr + 20);
        if (v14)
          v15 = *(_BYTE *)(v14 + 144) == 0;
        else
          v15 = 0;
        if (v15)
        {
          v16 = (unsigned int *)(v14 + 8);
          do
            v17 = __ldaxr(v16);
          while (__stlxr(v17 + 1, v16));
          WebCore::Page::goToItem();
          do
          {
            v18 = __ldaxr(v16);
            v19 = v18 - 1;
          }
          while (__stlxr(v19, v16));
          if (!v19)
          {
            atomic_store(1u, v16);
            v30 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
            *v30 = off_1E9D6A4D8;
            v30[1] = v16;
            v33 = v30;
            WTF::ensureOnMainThread();
            v31 = v33;
            v33 = 0;
            if (v31)
              (*(void (**)(_DWORD *))(*(_QWORD *)v31 + 8))(v31);
          }
        }
      }
    }
  }
}

- (void)_setFormDelegate:(id)a3
{
  WebViewPrivate *v4;
  void *m_ptr;

  self->_private->formDelegate = (WebFormDelegate *)a3;
  objc_msgSend(self->_private->formDelegateForwarder.m_ptr, "clearTarget");
  v4 = self->_private;
  m_ptr = v4->formDelegateForwarder.m_ptr;
  v4->formDelegateForwarder.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id)_formDelegate
{
  return self->_private->formDelegate;
}

- (id)_formDelegateForwarder
{
  WebViewPrivate *v2;
  _WebSafeForwarder *v5;
  WebViewPrivate *v6;
  void *m_ptr;

  v2 = self->_private;
  if (v2->closing)
    return 0;
  if (v2->formDelegateForwarder.m_ptr)
    return self->_private->formDelegateForwarder.m_ptr;
  v5 = -[_WebSafeForwarder initWithTarget:defaultTarget:]([_WebSafeForwarder alloc], "initWithTarget:defaultTarget:", -[WebView _formDelegate](self, "_formDelegate"), +[WebDefaultFormDelegate sharedFormDelegate](WebDefaultFormDelegate, "sharedFormDelegate"));
  v6 = self->_private;
  m_ptr = v6->formDelegateForwarder.m_ptr;
  v6->formDelegateForwarder.m_ptr = v5;
  if (!m_ptr)
    return self->_private->formDelegateForwarder.m_ptr;
  CFRelease(m_ptr);
  return self->_private->formDelegateForwarder.m_ptr;
}

- (id)_formDelegateForSelector:(SEL)a3
{
  WebFormDelegate *formDelegate;

  formDelegate = self->_private->formDelegate;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    formDelegate = +[WebDefaultFormDelegate sharedFormDelegate](WebDefaultFormDelegate, "sharedFormDelegate");
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return 0;
  }
  return formDelegate;
}

- (void)_preferencesChangedNotification:(id)a3
{
  if ((WebThreadIsLocked() & 1) == 0)
    WebThreadLock();
  if (-[WebFrame _loadsSynchronously](-[WebView mainFrame](self, "mainFrame"), "_loadsSynchronously"))
    -[WebView _preferencesChanged:](self, "_preferencesChanged:", objc_msgSend(a3, "object"));
  else
    WebThreadRun();
}

uint64_t __55__WebView_WebPrivate___preferencesChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "object");
  result = objc_msgSend(*(id *)(a1 + 40), "preferences");
  if (v2 == result)
    return objc_msgSend(*(id *)(a1 + 40), "_preferencesChanged:", v2);
  return result;
}

- (void)_preferencesChanged:(id)a3
{
  WebViewPrivate *v5;
  StringImpl *v6;
  WTF::StringImpl *v7;
  uint64_t v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t *v13;
  uint64_t v14;
  unsigned int v15;
  char v16;
  int v17;
  char v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  WebCore::DeprecatedGlobalSettings *v34;
  char v35;
  WebCore::DatabaseManager *v36;
  WebCore::DatabaseManager *v37;
  StringImpl *v38;
  WTF::StringImpl *v39;
  WTF::StringImpl *v40;
  Page *m_ptr;
  SessionID v42;
  WTF::StringImpl *v43;
  WebKit::WebStorageNamespaceProvider *v44;
  SessionID v45;
  const WTF::String *v46;
  StringImpl *v47;
  WTF::StringImpl *v48;
  Page *v49;
  StringImpl *v50;
  WTF::StringImpl *v51;
  uint64_t v52;
  double v53;
  WebViewPrivate *v54;
  uint64_t v55;
  WebCore::LegacyTileCache *v56;
  WTF::StringImpl *v57;
  WTF::StringImpl *v58;
  int v59;
  unsigned int v60;

  v5 = self->_private;
  if (v5->userAgentOverridden)
  {
    if (!v5->page.m_ptr)
      return;
  }
  else
  {
    -[WebView _invalidateUserAgentCache](self, "_invalidateUserAgentCache");
    if (!self->_private->page.m_ptr)
      return;
  }
  if (byte_1ECEC97E1 == 1)
  {
    if (objc_msgSend(a3, "databasesEnabled"))
      +[WebDatabaseManager sharedWebDatabaseManager](WebDatabaseManager, "sharedWebDatabaseManager");
    if (objc_msgSend(a3, "storageTrackerEnabled"))
      WebKitInitializeStorageIfNecessary();
  }
  WTF::makeVector<WTF::String>((void *)objc_msgSend(a3, "additionalSupportedImageTypes"), (uint64_t)&v58);
  WebCore::setAdditionalSupportedImageTypes();
  if (v60)
  {
    v7 = v58;
    v8 = 8 * v60;
    do
    {
      v9 = *(WTF::StringImpl **)v7;
      *(_QWORD *)v7 = 0;
      if (v9)
      {
        if (*(_DWORD *)v9 == 2)
          WTF::StringImpl::destroy(v9, v6);
        else
          *(_DWORD *)v9 -= 2;
      }
      v7 = (WTF::StringImpl *)((char *)v7 + 8);
      v8 -= 8;
    }
    while (v8);
  }
  v10 = v58;
  if (v58)
  {
    v58 = 0;
    v59 = 0;
    WTF::fastFree(v10, v6);
  }
  -[WebView _preferencesChangedGenerated:](self, "_preferencesChangedGenerated:", a3);
  v11 = *((_QWORD *)self->_private->page.m_ptr + 14);
  v12 = -[WebView interactiveFormValidationEnabled](self, "interactiveFormValidationEnabled");
  v13 = (uint64_t *)(v11 + 664);
  v14 = 0x20000000;
  if (!v12)
    v14 = 0;
  *(_QWORD *)(v11 + 680) = *(_QWORD *)(v11 + 680) & 0xFFFFFFFFDFFFFFFFLL | v14;
  *(_DWORD *)(v11 + 608) = -[WebView validationMessageTimerMagnification](self, "validationMessageTimerMagnification");
  objc_msgSend(a3, "storageBlockingPolicy");
  WebCore::Settings::setStorageBlockingPolicy();
  v15 = objc_msgSend(a3, "editableLinkBehavior");
  if (v15 >= 5)
    v16 = 0;
  else
    v16 = v15;
  *(_BYTE *)(v11 + 369) = v16;
  *(_DWORD *)(v11 + 424) = objc_msgSend(a3, "javaScriptRuntimeFlags");
  v17 = objc_msgSend(a3, "textDirectionSubmenuInclusionBehavior");
  if (v17 == 2)
    v18 = 2;
  else
    v18 = v17 == 1;
  *(_BYTE *)(v11 + 550) = v18;
  objc_msgSend(a3, "_backForwardCacheExpirationInterval");
  *(_QWORD *)(v11 + 312) = v19;
  *(_BYTE *)(v11 + 520) = objc_msgSend(a3, "_pitchCorrectionAlgorithm");
  v20 = objc_msgSend(a3, "developerExtrasEnabled");
  v21 = 0x400000000000;
  if (!v20)
    v21 = 0;
  *(_QWORD *)(v11 + 672) = *(_QWORD *)(v11 + 672) & 0xFFFFBFFFFFFFFFFFLL | v21;
  if (objc_msgSend(a3, "mediaPlaybackRequiresUserGesture"))
  {
    v22 = *(unsigned int *)(v11 + 720) | ((unint64_t)*(unsigned __int8 *)(v11 + 724) << 32);
    v23 = *(_QWORD *)(v11 + 704);
    v24 = *(_QWORD *)(v11 + 712);
    v25 = *(_QWORD *)(v11 + 696);
    v27 = *v13;
    v26 = *(_QWORD *)(v11 + 672);
    v28 = *(_QWORD *)(v11 + 680);
    v29 = *(_QWORD *)(v11 + 688) | 0x200000000000;
    *(_QWORD *)(v11 + 688) = v29;
LABEL_34:
    v33 = 0x100000000000;
    goto LABEL_36;
  }
  v30 = objc_msgSend(a3, "videoPlaybackRequiresUserGesture");
  v31 = 0x200000000000;
  if (!v30)
    v31 = 0;
  *(_QWORD *)(v11 + 688) = *(_QWORD *)(v11 + 688) & 0xFFFFDFFFFFFFFFFFLL | v31;
  v32 = objc_msgSend(a3, "audioPlaybackRequiresUserGesture");
  v22 = *(unsigned int *)(v11 + 720) | ((unint64_t)*(unsigned __int8 *)(v11 + 724) << 32);
  v23 = *(_QWORD *)(v11 + 704);
  v24 = *(_QWORD *)(v11 + 712);
  v29 = *(_QWORD *)(v11 + 688);
  v25 = *(_QWORD *)(v11 + 696);
  v26 = *(_QWORD *)(v11 + 672);
  v28 = *(_QWORD *)(v11 + 680);
  v27 = *v13;
  if (v32)
    goto LABEL_34;
  v33 = 0;
LABEL_36:
  *v13 = v27;
  *(_QWORD *)(v11 + 672) = v26;
  *(_QWORD *)(v11 + 680) = v28;
  *(_QWORD *)(v11 + 688) = v29 & 0xFFFFEFFFFFFFFFFFLL | v33;
  *(_QWORD *)(v11 + 696) = v25;
  *(_QWORD *)(v11 + 704) = v23;
  *(_QWORD *)(v11 + 712) = v24;
  *(_DWORD *)(v11 + 720) = v22;
  *(_BYTE *)(v11 + 724) = BYTE4(v22);
  v34 = (WebCore::DeprecatedGlobalSettings *)objc_msgSend(a3, "webSQLEnabled");
  v35 = (char)v34;
  v36 = (WebCore::DatabaseManager *)WebCore::DeprecatedGlobalSettings::shared(v34);
  *((_BYTE *)v36 + 24) = v35;
  v37 = (WebCore::DatabaseManager *)WebCore::DatabaseManager::singleton(v36);
  objc_msgSend(a3, "databasesEnabled");
  WebCore::DatabaseManager::setIsAvailable(v37);
  MEMORY[0x1D82A3998](&v58, objc_msgSend(a3, "_localStorageDatabasePath"));
  v39 = v58;
  if (v58)
    *(_DWORD *)v58 += 2;
  v40 = *(WTF::StringImpl **)(v11 + 440);
  *(_QWORD *)(v11 + 440) = v39;
  if (v40)
  {
    if (*(_DWORD *)v40 == 2)
    {
      WTF::StringImpl::destroy(v40, v38);
      v39 = v58;
      v58 = 0;
      if (!v39)
        goto LABEL_47;
      goto LABEL_44;
    }
    *(_DWORD *)v40 -= 2;
  }
  v58 = 0;
  if (!v39)
    goto LABEL_47;
LABEL_44:
  if (*(_DWORD *)v39 == 2)
    WTF::StringImpl::destroy(v39, v38);
  else
    *(_DWORD *)v39 -= 2;
LABEL_47:
  m_ptr = self->_private->page.m_ptr;
  if (objc_msgSend(a3, "privateBrowsingEnabled"))
    v42.m_identifier = 0x8000000000000001;
  else
    v42.m_identifier = 1;
  WebCore::Page::setSessionID((WebCore::Page *)m_ptr, v42);
  WebBroadcastChannelRegistry::getOrCreate(objc_msgSend(a3, "privateBrowsingEnabled"), (uint64_t *)&v57);
  v58 = v57;
  WebCore::Page::setBroadcastChannelRegistry();
  v43 = v58;
  v58 = 0;
  if (v43)
  {
    if (*((_DWORD *)v43 + 2) == 1)
      (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v43 + 8))(v43);
    else
      --*((_DWORD *)v43 + 2);
  }
  v44 = WebViewGroup::storageNamespaceProvider(self->_private->group.m_ptr);
  if (objc_msgSend(a3, "privateBrowsingEnabled"))
    v45.m_identifier = 0x8000000000000001;
  else
    v45.m_identifier = 1;
  WebCore::StorageNamespaceProvider::setSessionIDForTesting(v44, v45);
  WebCore::DeprecatedGlobalSettings::setAudioSessionCategoryOverride((WebCore::DeprecatedGlobalSettings *)objc_msgSend(a3, "audioSessionCategoryOverride"));
  WebCore::DeprecatedGlobalSettings::setNetworkDataUsageTrackingEnabled((WebCore::DeprecatedGlobalSettings *)objc_msgSend(a3, "networkDataUsageTrackingEnabled"));
  MEMORY[0x1D82A3998](&v58, objc_msgSend(a3, "networkInterfaceName"));
  WebCore::DeprecatedGlobalSettings::setNetworkInterfaceName((WebCore::DeprecatedGlobalSettings *)&v58, v46);
  v48 = v58;
  v58 = 0;
  if (v48)
  {
    if (*(_DWORD *)v48 == 2)
      WTF::StringImpl::destroy(v48, v47);
    else
      *(_DWORD *)v48 -= 2;
  }
  v49 = self->_private->page.m_ptr;
  MEMORY[0x1D82A3998](&v58, objc_msgSend(a3, "mediaKeysStorageDirectory"));
  WebCore::Page::setMediaKeysStorageDirectory((WebCore::Page *)v49, (const WTF::String *)&v58);
  v51 = v58;
  v58 = 0;
  if (v51)
  {
    if (*(_DWORD *)v51 == 2)
      WTF::StringImpl::destroy(v51, v50);
    else
      *(_DWORD *)v51 -= 2;
  }
  WebCore::DeprecatedGlobalSettings::setTrackingPreventionEnabled((WebCore::DeprecatedGlobalSettings *)objc_msgSend(a3, "resourceLoadStatisticsEnabled"));
  v52 = objc_msgSend(a3, "zoomsTextOnly");
  v54 = self->_private;
  if (v54->zoomsTextOnly != (_DWORD)v52)
  {
    *(float *)&v53 = v54->zoomMultiplier;
    -[WebView _setZoomMultiplier:isTextOnly:](self, "_setZoomMultiplier:isTextOnly:", v52, v53);
  }
  v55 = objc_msgSend((id)-[WebView window](self, "window"), "tileCache");
  if (v55)
  {
    v56 = (WebCore::LegacyTileCache *)v55;
    objc_msgSend(a3, "showDebugBorders");
    WebCore::LegacyTileCache::setTileBordersVisible(v56);
    objc_msgSend(a3, "showRepaintCounter");
    WebCore::LegacyTileCache::setTilePaintCountersVisible(v56);
    *((_BYTE *)v56 + 66) = objc_msgSend(a3, "acceleratedDrawingEnabled");
  }
  objc_msgSend(MEMORY[0x1E0DCDD68], "_setInterpolationQuality:", objc_msgSend(a3, "_interpolationQuality"));
  WebCore::Page::settingsDidChange((WebCore::Page *)self->_private->page.m_ptr);
}

- (id)_UIKitDelegateForwarder
{
  WebViewPrivate *v2;
  _WebSafeForwarder *v5;
  WebViewPrivate *v6;
  void *m_ptr;

  v2 = self->_private;
  if (v2->closing)
    return 0;
  if (v2->UIKitDelegateForwarder.m_ptr)
    return self->_private->UIKitDelegateForwarder.m_ptr;
  v5 = -[_WebSafeForwarder initWithTarget:defaultTarget:]([_WebSafeForwarder alloc], "initWithTarget:defaultTarget:", self->_private->UIKitDelegate, +[WebDefaultUIKitDelegate sharedUIKitDelegate](WebDefaultUIKitDelegate, "sharedUIKitDelegate"));
  v6 = self->_private;
  m_ptr = v6->UIKitDelegateForwarder.m_ptr;
  v6->UIKitDelegateForwarder.m_ptr = v5;
  if (!m_ptr)
    return self->_private->UIKitDelegateForwarder.m_ptr;
  CFRelease(m_ptr);
  return self->_private->UIKitDelegateForwarder.m_ptr;
}

- (void)_cacheResourceLoadDelegateImplementations
{
  WebViewPrivate *v2;
  id resourceProgressDelegate;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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

  v2 = self->_private;
  resourceProgressDelegate = v2->resourceProgressDelegate;
  if (resourceProgressDelegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webView_resource_didFailLoadingWithError_fromDataSource_);
    else
      v4 = 0;
    v2->resourceLoadDelegateImplementations.didFailLoadingWithErrorFromDataSourceFunc = (void *)v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webView_resource_didFinishLoadingFromDataSource_);
    else
      v5 = 0;
    v2->resourceLoadDelegateImplementations.didFinishLoadingFromDataSourceFunc = (void *)v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webView_didLoadResourceFromMemoryCache_response_length_fromDataSource_);
    else
      v6 = 0;
    v2->resourceLoadDelegateImplementations.didLoadResourceFromMemoryCacheFunc = (void *)v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webView_resource_didReceiveAuthenticationChallenge_fromDataSource_);
    else
      v7 = 0;
    v2->resourceLoadDelegateImplementations.didReceiveAuthenticationChallengeFunc = (void *)v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webView_resource_canAuthenticateAgainstProtectionSpace_forDataSource_);
    else
      v8 = 0;
    v2->resourceLoadDelegateImplementations.canAuthenticateAgainstProtectionSpaceFunc = (void *)v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webView_connectionPropertiesForResource_dataSource_);
    else
      v9 = 0;
    v2->resourceLoadDelegateImplementations.connectionPropertiesFunc = (void *)v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webThreadWebView_resource_didFinishLoadingFromDataSource_);
    else
      v10 = 0;
    v2->resourceLoadDelegateImplementations.webThreadDidFinishLoadingFromDataSourceFunc = (void *)v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webThreadWebView_resource_didFailLoadingWithError_fromDataSource_);
    else
      v11 = 0;
    v2->resourceLoadDelegateImplementations.webThreadDidFailLoadingWithErrorFromDataSourceFunc = (void *)v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webThreadWebView_identifierForInitialRequest_fromDataSource_);
    else
      v12 = 0;
    v2->resourceLoadDelegateImplementations.webThreadIdentifierForRequestFunc = (void *)v12;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webThreadWebView_didLoadResourceFromMemoryCache_response_length_fromDataSource_);
    else
      v13 = 0;
    v2->resourceLoadDelegateImplementations.webThreadDidLoadResourceFromMemoryCacheFunc = (void *)v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webThreadWebView_resource_willSendRequest_redirectResponse_fromDataSource_);
    else
      v14 = 0;
    v2->resourceLoadDelegateImplementations.webThreadWillSendRequestFunc = (void *)v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webThreadWebView_resource_didReceiveResponse_fromDataSource_);
    else
      v15 = 0;
    v2->resourceLoadDelegateImplementations.webThreadDidReceiveResponseFunc = (void *)v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webThreadWebView_resource_didReceiveContentLength_fromDataSource_);
    else
      v16 = 0;
    v2->resourceLoadDelegateImplementations.webThreadDidReceiveContentLengthFunc = (void *)v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webThreadWebView_resource_willCacheResponse_fromDataSource_);
    else
      v17 = 0;
    v2->resourceLoadDelegateImplementations.webThreadWillCacheResponseFunc = (void *)v17;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webView_resource_didReceiveContentLength_fromDataSource_);
    else
      v18 = 0;
    v2->resourceLoadDelegateImplementations.didReceiveContentLengthFunc = (void *)v18;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webView_resource_didReceiveResponse_fromDataSource_);
    else
      v19 = 0;
    v2->resourceLoadDelegateImplementations.didReceiveResponseFunc = (void *)v19;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webView_identifierForInitialRequest_fromDataSource_);
    else
      v20 = 0;
    v2->resourceLoadDelegateImplementations.identifierForRequestFunc = (void *)v20;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webView_plugInFailedWithError_dataSource_);
    else
      v21 = 0;
    v2->resourceLoadDelegateImplementations.plugInFailedWithErrorFunc = (void *)v21;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webView_resource_willCacheResponse_fromDataSource_);
    else
      v22 = 0;
    v2->resourceLoadDelegateImplementations.willCacheResponseFunc = (void *)v22;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webView_resource_willSendRequest_redirectResponse_fromDataSource_);
    else
      v23 = 0;
    v2->resourceLoadDelegateImplementations.willSendRequestFunc = (void *)v23;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webView_resource_shouldUseCredentialStorageForDataSource_);
    else
      v24 = 0;
    v2->resourceLoadDelegateImplementations.shouldUseCredentialStorageFunc = (void *)v24;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2->resourceLoadDelegateImplementations.shouldPaintBrokenImageForURLFunc = (void *)objc_msgSend(resourceProgressDelegate, "methodForSelector:", sel_webView_shouldPaintBrokenImageForURL_);
    else
      v2->resourceLoadDelegateImplementations.shouldPaintBrokenImageForURLFunc = 0;
  }
  else
  {
    bzero(&v2->resourceLoadDelegateImplementations, 0xB0uLL);
  }
}

- (void)_cacheFrameLoadDelegateImplementations
{
  WebViewPrivate *v2;
  id frameLoadDelegate;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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

  v2 = self->_private;
  frameLoadDelegate = v2->frameLoadDelegate;
  if (!frameLoadDelegate)
  {
    bzero(&v2->frameLoadDelegateImplementations, 0xF0uLL);
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didCancelClientRedirectForFrame_);
  else
    v5 = 0;
  v2->frameLoadDelegateImplementations.didCancelClientRedirectForFrameFunc = (void *)v5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didChangeLocationWithinPageForFrame_);
  else
    v6 = 0;
  v2->frameLoadDelegateImplementations.didChangeLocationWithinPageForFrameFunc = (void *)v6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didPushStateWithinPageForFrame_);
  else
    v7 = 0;
  v2->frameLoadDelegateImplementations.didPushStateWithinPageForFrameFunc = (void *)v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didReplaceStateWithinPageForFrame_);
  else
    v8 = 0;
  v2->frameLoadDelegateImplementations.didReplaceStateWithinPageForFrameFunc = (void *)v8;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didPopStateWithinPageForFrame_);
  else
    v9 = 0;
  v2->frameLoadDelegateImplementations.didPopStateWithinPageForFrameFunc = (void *)v9;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didCreateJavaScriptContext_forFrame_);
  else
    v10 = 0;
  v2->frameLoadDelegateImplementations.didCreateJavaScriptContextForFrameFunc = (void *)v10;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didClearWindowObject_forFrame_);
  else
    v11 = 0;
  v2->frameLoadDelegateImplementations.didClearWindowObjectForFrameFunc = (void *)v11;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didClearWindowObjectForFrame_inScriptWorld_);
  else
    v12 = 0;
  v2->frameLoadDelegateImplementations.didClearWindowObjectForFrameInScriptWorldFunc = (void *)v12;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v13 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didClearInspectorWindowObject_forFrame_);
  else
    v13 = 0;
  v2->frameLoadDelegateImplementations.didClearInspectorWindowObjectForFrameFunc = (void *)v13;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didCommitLoadForFrame_);
  else
    v14 = 0;
  v2->frameLoadDelegateImplementations.didCommitLoadForFrameFunc = (void *)v14;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v15 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didFailLoadWithError_forFrame_);
  else
    v15 = 0;
  v2->frameLoadDelegateImplementations.didFailLoadWithErrorForFrameFunc = (void *)v15;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didFailProvisionalLoadWithError_forFrame_);
  else
    v16 = 0;
  v2->frameLoadDelegateImplementations.didFailProvisionalLoadWithErrorForFrameFunc = (void *)v16;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v17 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didFinishDocumentLoadForFrame_);
  else
    v17 = 0;
  v2->frameLoadDelegateImplementations.didFinishDocumentLoadForFrameFunc = (void *)v17;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didFinishLoadForFrame_);
  else
    v18 = 0;
  v2->frameLoadDelegateImplementations.didFinishLoadForFrameFunc = (void *)v18;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v19 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didFirstLayoutInFrame_);
  else
    v19 = 0;
  v2->frameLoadDelegateImplementations.didFirstLayoutInFrameFunc = (void *)v19;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v20 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didFirstVisuallyNonEmptyLayoutInFrame_);
  else
    v20 = 0;
  v2->frameLoadDelegateImplementations.didFirstVisuallyNonEmptyLayoutInFrameFunc = (void *)v20;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v21 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didLayout_);
  else
    v21 = 0;
  v2->frameLoadDelegateImplementations.didLayoutFunc = (void *)v21;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v22 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didHandleOnloadEventsForFrame_);
  else
    v22 = 0;
  v2->frameLoadDelegateImplementations.didHandleOnloadEventsForFrameFunc = (void *)v22;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v23 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didReceiveServerRedirectForProvisionalLoadForFrame_);
  else
    v23 = 0;
  v2->frameLoadDelegateImplementations.didReceiveServerRedirectForProvisionalLoadForFrameFunc = (void *)v23;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v24 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didReceiveTitle_forFrame_);
  else
    v24 = 0;
  v2->frameLoadDelegateImplementations.didReceiveTitleForFrameFunc = (void *)v24;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v25 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didStartProvisionalLoadForFrame_);
  else
    v25 = 0;
  v2->frameLoadDelegateImplementations.didStartProvisionalLoadForFrameFunc = (void *)v25;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v26 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_willCloseFrame_);
  else
    v26 = 0;
  v2->frameLoadDelegateImplementations.willCloseFrameFunc = (void *)v26;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v27 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_willPerformClientRedirectToURL_delay_fireDate_forFrame_);
  else
    v27 = 0;
  v2->frameLoadDelegateImplementations.willPerformClientRedirectToURLDelayFireDateForFrameFunc = (void *)v27;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v28 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_windowScriptObjectAvailable_);
  else
    v28 = 0;
  v2->frameLoadDelegateImplementations.windowScriptObjectAvailableFunc = (void *)v28;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v29 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webViewDidDisplayInsecureContent_);
  else
    v29 = 0;
  v2->frameLoadDelegateImplementations.didDisplayInsecureContentFunc = (void *)v29;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v30 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didRunInsecureContent_);
  else
    v30 = 0;
  v2->frameLoadDelegateImplementations.didRunInsecureContentFunc = (void *)v30;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v31 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didDetectXSS_);
  else
    v31 = 0;
  v2->frameLoadDelegateImplementations.didDetectXSSFunc = (void *)v31;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v32 = objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webView_didRemoveFrameFromHierarchy_);
  else
    v32 = 0;
  v2->frameLoadDelegateImplementations.didRemoveFrameFromHierarchyFunc = (void *)v32;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v2->frameLoadDelegateImplementations.webThreadDidLayoutFunc = 0;
    -[WebView page](self, "page");
    if (!v33)
      return;
    goto LABEL_91;
  }
  v2->frameLoadDelegateImplementations.webThreadDidLayoutFunc = (void *)objc_msgSend(frameLoadDelegate, "methodForSelector:", sel_webThreadWebView_didLayout_);
  -[WebView page](self, "page");
  if (v33)
LABEL_91:
    WebCore::Page::addLayoutMilestones();
}

- (void)_cacheScriptDebugDelegateImplementations
{
  WebViewPrivate *v2;
  WebScriptDebugDelegateImplementationCache *p_scriptDebugDelegateImplementations;
  id scriptDebugDelegate;
  uint64_t v5;
  uint64_t v6;
  _QWORD *p_didParseSourceFunc;
  uint64_t v8;
  uint64_t v9;
  void **p_exceptionWasRaisedFunc;

  v2 = self->_private;
  p_scriptDebugDelegateImplementations = &v2->scriptDebugDelegateImplementations;
  scriptDebugDelegate = v2->scriptDebugDelegate;
  if (!scriptDebugDelegate)
  {
    bzero(&v2->scriptDebugDelegateImplementations, 0x20uLL);
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    p_didParseSourceFunc = &v2->scriptDebugDelegateImplementations.didParseSourceFunc;
    v2->scriptDebugDelegateImplementations.didParseSourceFunc = 0;
    goto LABEL_9;
  }
  v5 = objc_msgSend(scriptDebugDelegate, "methodForSelector:", sel_webView_didParseSource_baseLineNumber_fromURL_sourceId_forWebFrame_);
  v2->scriptDebugDelegateImplementations.didParseSourceFunc = (void *)v5;
  if (!v5)
  {
    p_didParseSourceFunc = &v2->scriptDebugDelegateImplementations.didParseSourceFunc;
LABEL_9:
    p_scriptDebugDelegateImplementations->didParseSourceExpectsBaseLineNumber = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = objc_msgSend(scriptDebugDelegate, "methodForSelector:", sel_webView_didParseSource_fromURL_sourceId_forWebFrame_);
    else
      v8 = 0;
    *p_didParseSourceFunc = v8;
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
  p_scriptDebugDelegateImplementations->didParseSourceExpectsBaseLineNumber = 1;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_5:
    v6 = 0;
    goto LABEL_14;
  }
LABEL_13:
  v6 = objc_msgSend(scriptDebugDelegate, "methodForSelector:", sel_webView_failedToParseSource_baseLineNumber_fromURL_withError_forWebFrame_);
LABEL_14:
  v2->scriptDebugDelegateImplementations.failedToParseSourceFunc = (void *)v6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = objc_msgSend(scriptDebugDelegate, "methodForSelector:", sel_webView_exceptionWasRaised_hasHandler_sourceId_line_forWebFrame_);
    v2->scriptDebugDelegateImplementations.exceptionWasRaisedFunc = (void *)v9;
    if (v9)
    {
      v2->scriptDebugDelegateImplementations.exceptionWasRaisedExpectsHasHandlerFlag = 1;
      return;
    }
    p_exceptionWasRaisedFunc = &v2->scriptDebugDelegateImplementations.exceptionWasRaisedFunc;
  }
  else
  {
    p_exceptionWasRaisedFunc = &v2->scriptDebugDelegateImplementations.exceptionWasRaisedFunc;
    v2->scriptDebugDelegateImplementations.exceptionWasRaisedFunc = 0;
  }
  v2->scriptDebugDelegateImplementations.exceptionWasRaisedExpectsHasHandlerFlag = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    *p_exceptionWasRaisedFunc = (void *)objc_msgSend(scriptDebugDelegate, "methodForSelector:", sel_webView_exceptionWasRaised_sourceId_line_forWebFrame_);
  else
    *p_exceptionWasRaisedFunc = 0;
}

- (void)_cacheHistoryDelegateImplementations
{
  WebViewPrivate *v2;
  id historyDelegate;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = self->_private;
  historyDelegate = v2->historyDelegate;
  if (historyDelegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = objc_msgSend(historyDelegate, "methodForSelector:", sel_webView_didNavigateWithNavigationData_inFrame_);
    else
      v4 = 0;
    v2->historyDelegateImplementations.navigatedFunc = (void *)v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = objc_msgSend(historyDelegate, "methodForSelector:", sel_webView_didPerformClientRedirectFromURL_toURL_inFrame_);
    else
      v5 = 0;
    v2->historyDelegateImplementations.clientRedirectFunc = (void *)v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = objc_msgSend(historyDelegate, "methodForSelector:", sel_webView_didPerformServerRedirectFromURL_toURL_inFrame_);
    else
      v6 = 0;
    v2->historyDelegateImplementations.serverRedirectFunc = (void *)v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = objc_msgSend(historyDelegate, "methodForSelector:", sel_webView_updateHistoryTitle_forURL_);
    else
      v7 = 0;
    v2->historyDelegateImplementations.deprecatedSetTitleFunc = (void *)v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = objc_msgSend(historyDelegate, "methodForSelector:", sel_webView_updateHistoryTitle_forURL_inFrame_);
    else
      v8 = 0;
    v2->historyDelegateImplementations.setTitleFunc = (void *)v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2->historyDelegateImplementations.populateVisitedLinksFunc = (void *)objc_msgSend(historyDelegate, "methodForSelector:", sel_populateVisitedLinksForWebView_);
    else
      v2->historyDelegateImplementations.populateVisitedLinksFunc = 0;
  }
  else
  {
    bzero(&v2->historyDelegateImplementations, 0x30uLL);
  }
}

- (id)_policyDelegateForwarder
{
  WebViewPrivate *v2;
  _WebSafeForwarder *v5;
  WebViewPrivate *v6;
  void *m_ptr;

  v2 = self->_private;
  if (v2->closing)
    return 0;
  if (v2->policyDelegateForwarder.m_ptr)
    return self->_private->policyDelegateForwarder.m_ptr;
  v5 = -[_WebSafeForwarder initWithTarget:defaultTarget:]([_WebSafeForwarder alloc], "initWithTarget:defaultTarget:", self->_private->policyDelegate, +[WebDefaultPolicyDelegate sharedPolicyDelegate](WebDefaultPolicyDelegate, "sharedPolicyDelegate"));
  v6 = self->_private;
  m_ptr = v6->policyDelegateForwarder.m_ptr;
  v6->policyDelegateForwarder.m_ptr = v5;
  if (!m_ptr)
    return self->_private->policyDelegateForwarder.m_ptr;
  CFRelease(m_ptr);
  return self->_private->policyDelegateForwarder.m_ptr;
}

- (id)_UIDelegateForwarder
{
  WebViewPrivate *v2;
  _WebSafeForwarder *v5;
  WebViewPrivate *v6;
  void *m_ptr;

  v2 = self->_private;
  if (v2->closing)
    return 0;
  if (v2->UIDelegateForwarder.m_ptr)
    return self->_private->UIDelegateForwarder.m_ptr;
  v5 = -[_WebSafeForwarder initWithTarget:defaultTarget:]([_WebSafeForwarder alloc], "initWithTarget:defaultTarget:", self->_private->UIDelegate, +[WebDefaultUIDelegate sharedUIDelegate](WebDefaultUIDelegate, "sharedUIDelegate"));
  v6 = self->_private;
  m_ptr = v6->UIDelegateForwarder.m_ptr;
  v6->UIDelegateForwarder.m_ptr = v5;
  if (!m_ptr)
    return self->_private->UIDelegateForwarder.m_ptr;
  CFRelease(m_ptr);
  return self->_private->UIDelegateForwarder.m_ptr;
}

- (id)_UIDelegateForSelector:(SEL)a3
{
  id UIDelegate;

  UIDelegate = self->_private->UIDelegate;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    UIDelegate = +[WebDefaultUIDelegate sharedUIDelegate](WebDefaultUIDelegate, "sharedUIDelegate");
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return 0;
  }
  return UIDelegate;
}

- (id)_editingDelegateForwarder
{
  WebViewPrivate *v2;
  BOOL v3;
  _WebSafeForwarder *v6;
  WebViewPrivate *v7;
  void *m_ptr;

  v2 = self->_private;
  if (v2)
    v3 = !v2->closing;
  else
    v3 = 0;
  if (!v3)
    return 0;
  if (v2->editingDelegateForwarder.m_ptr)
    return self->_private->editingDelegateForwarder.m_ptr;
  v6 = -[_WebSafeForwarder initWithTarget:defaultTarget:]([_WebSafeForwarder alloc], "initWithTarget:defaultTarget:", self->_private->editingDelegate, +[WebDefaultEditingDelegate sharedEditingDelegate](WebDefaultEditingDelegate, "sharedEditingDelegate"));
  v7 = self->_private;
  m_ptr = v7->editingDelegateForwarder.m_ptr;
  v7->editingDelegateForwarder.m_ptr = v6;
  if (!m_ptr)
    return self->_private->editingDelegateForwarder.m_ptr;
  CFRelease(m_ptr);
  return self->_private->editingDelegateForwarder.m_ptr;
}

+ (void)_unregisterViewClassAndRepresentationClassForMIMEType:(id)a3
{
  uint64_t *v4;
  StringImpl *v5;
  WTF::ASCIICaseInsensitiveHash *v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  int i;
  uint64_t v11;
  WTF::StringImpl *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  WTF::ASCIICaseInsensitiveHash *v18;

  objc_msgSend(+[WebFrameView _viewTypesAllowImageTypeOmission:](WebFrameView, "_viewTypesAllowImageTypeOmission:", 0), "removeObjectForKey:", a3);
  v4 = (uint64_t *)WebCore::MIMETypeRegistry::supportedNonImageMIMETypes((WebCore::MIMETypeRegistry *)objc_msgSend(+[WebDataSource _repTypesAllowImageTypeOmission:](WebDataSource, "_repTypesAllowImageTypeOmission:", 0), "removeObjectForKey:", a3));
  MEMORY[0x1D82A3998](&v18, a3);
  v6 = v18;
  v7 = *v4;
  if (*v4)
  {
    v8 = *(_DWORD *)(v7 - 8);
    v9 = WTF::ASCIICaseInsensitiveHash::hash(v18, v5);
    for (i = 0; ; v9 = i + v11)
    {
      v11 = v9 & v8;
      v12 = *(WTF::StringImpl **)(v7 + 8 * v11);
      if (v12 != (WTF::StringImpl *)-1)
      {
        if (!v12)
          goto LABEL_20;
        if (WTF::equalIgnoringASCIICaseCommon<WTF::StringImpl,WTF::StringImpl>(*(_QWORD *)(v7 + 8 * v11), (uint64_t)v6))
        {
          break;
        }
      }
      ++i;
    }
    if ((_DWORD)v11 == *(_DWORD *)(v7 - 4))
      goto LABEL_20;
    *(_QWORD *)(v7 + 8 * v11) = -1;
    if (*(_DWORD *)v12 == 2)
    {
      WTF::StringImpl::destroy(v12, v5);
      ++*(_DWORD *)(*v4 - 16);
      v13 = *v4;
      if (*v4)
      {
LABEL_10:
        --*(_DWORD *)(v13 - 12);
        v14 = *v4;
        if (!*v4)
          goto LABEL_20;
        goto LABEL_14;
      }
    }
    else
    {
      *(_DWORD *)v12 -= 2;
      ++*(_DWORD *)(*v4 - 16);
      v13 = *v4;
      if (*v4)
        goto LABEL_10;
    }
    *(_DWORD *)(v13 - 12) = -1;
    v14 = *v4;
    if (!*v4)
    {
LABEL_20:
      v6 = v18;
      goto LABEL_21;
    }
LABEL_14:
    v15 = 6 * *(_DWORD *)(v14 - 12);
    v16 = *(_DWORD *)(v14 - 4);
    if (v15 < v16 && v16 >= 9)
      WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::ASCIICaseInsensitiveHash,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::rehash(v4, v16 >> 1, 0);
    goto LABEL_20;
  }
LABEL_21:
  v18 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v5);
    else
      *(_DWORD *)v6 -= 2;
  }
}

+ (void)_registerViewClass:(Class)a3 representationClass:(Class)a4 forURLScheme:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  WebCore::MIMETypeRegistry *v11;
  uint64_t *v12;
  StringImpl *v13;
  WTF::StringImpl *v14;
  __objc2_class **p_superclass;
  __objc2_class *v16;
  __objc2_class *v17;
  const void *v18;
  uint64_t v19;
  WTF::StringImpl *v20;

  v9 = objc_msgSend(a1, "_generatedMIMETypeForURLScheme:", a5);
  objc_msgSend(a1, "registerViewClass:representationClass:forMIMEType:", a3, a4, v9);
  v10 = objc_opt_class();
  v11 = (WebCore::MIMETypeRegistry *)objc_opt_class();
  if ((WebCore::MIMETypeRegistry *)v10 != v11
    || (v12 = (uint64_t *)WebCore::MIMETypeRegistry::supportedNonImageMIMETypes(v11),
        MEMORY[0x1D82A3998](&v20, v9),
        WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::ASCIICaseInsensitiveHash,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t)&v19, v12, &v20), v14 = v20, v20 = 0, !v14))
  {
LABEL_5:
    p_superclass = &OBJC_METACLASS____WebSafeAsyncForwarder.superclass;
    if ((byte_1ECEC97F0 & 1) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
  if (*(_DWORD *)v14 != 2)
  {
    *(_DWORD *)v14 -= 2;
    goto LABEL_5;
  }
  WTF::StringImpl::destroy(v14, v13);
  p_superclass = (__objc2_class **)(&OBJC_METACLASS____WebSafeAsyncForwarder + 8);
  if ((byte_1ECEC97F0 & 1) != 0)
  {
LABEL_6:
    v16 = p_superclass[263];
    if (v16)
      goto LABEL_9;
    goto LABEL_7;
  }
LABEL_13:
  qword_1ECEC9838 = 0;
  byte_1ECEC97F0 = 1;
LABEL_7:
  v16 = (__objc2_class *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17 = p_superclass[263];
  p_superclass[263] = v16;
  if (v17)
  {
    CFRelease(v17);
    v16 = p_superclass[263];
  }
LABEL_9:
  v18 = (const void *)objc_msgSend((id)objc_msgSend(a5, "lowercaseString"), "copy");
  -[__objc2_class addObject:](v16, "addObject:", v18);
  if (v18)
    CFRelease(v18);
}

+ (id)_generatedMIMETypeForURLScheme:(id)a3
{
  return (id)objc_msgSend(CFSTR("x-apple-web-kit/"), "stringByAppendingString:", objc_msgSend(a3, "lowercaseString"));
}

+ (BOOL)_representationExistsForURLScheme:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (byte_1ECEC97F0 == 1)
  {
    v3 = qword_1ECEC9838;
    v4 = objc_msgSend(a3, "lowercaseString");
    v5 = (void *)v3;
  }
  else
  {
    qword_1ECEC9838 = 0;
    byte_1ECEC97F0 = 1;
    v4 = objc_msgSend(a3, "lowercaseString");
    v5 = 0;
  }
  return objc_msgSend(v5, "containsObject:", v4);
}

+ (BOOL)_canHandleRequest:(id)a3 forMainFrame:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;

  if (!a3)
    return 0;
  v4 = a4;
  if ((objc_msgSend(MEMORY[0x1E0C92C58], "canHandleRequest:") & 1) != 0)
    return 1;
  v7 = (void *)objc_msgSend((id)objc_msgSend(a3, "URL"), "scheme");
  if (v4 && (objc_msgSend(a1, "_representationExistsForURLScheme:", v7) & 1) != 0)
    return 1;
  if ((objc_msgSend(v7, "_webkit_isCaseInsensitiveEqualToString:", CFSTR("applewebdata")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(v7, "_webkit_isCaseInsensitiveEqualToString:", CFSTR("blob"));
}

+ (BOOL)_canHandleRequest:(id)a3
{
  return objc_msgSend(a1, "_canHandleRequest:forMainFrame:", a3, 1);
}

+ (id)_decodeData:(id)a3
{
  StringImpl *v4;
  const __CFString *v5;
  WTF::StringImpl *v6;
  WebCore::TextResourceDecoder *v7;
  WTF *v8;
  void *v9;
  WTF::StringImpl *v10;
  _QWORD v12[4];
  WTF::StringImpl *v13;
  WebCore::TextResourceDecoder *v14;
  WTF::StringImpl *v15;

  WebCore::HTMLNames::init((WebCore::HTMLNames *)a1);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v12[0] = &unk_1E9D6C1D8;
  memset(&v12[1], 0, 24);
  WebCore::TextResourceDecoder::create((WebCore::TextResourceDecoder *)&v13, (const WTF::String *)v12, 0);
  if (a3)
  {
    objc_msgSend(a3, "bytes");
    objc_msgSend(a3, "length");
  }
  WebCore::TextResourceDecoder::decodeAndFlush();
  if (!v15)
  {
    v15 = 0;
    v5 = &stru_1E9D6EC48;
LABEL_9:
    v7 = v14;
    v14 = 0;
    if (!v7)
      goto LABEL_14;
    goto LABEL_10;
  }
  v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
  v6 = v15;
  v15 = 0;
  if (!v6)
    goto LABEL_9;
  if (*(_DWORD *)v6 == 2)
  {
    WTF::StringImpl::destroy(v6, v4);
    v7 = v14;
    v14 = 0;
    if (!v7)
      goto LABEL_14;
  }
  else
  {
    *(_DWORD *)v6 -= 2;
    v7 = v14;
    v14 = 0;
    if (!v7)
      goto LABEL_14;
  }
LABEL_10:
  if (*(_DWORD *)v7 == 1)
  {
    WebCore::TextResourceDecoder::~TextResourceDecoder(v7);
    WTF::fastFree(v8, v9);
  }
  else
  {
    --*(_DWORD *)v7;
  }
LABEL_14:
  v10 = v13;
  v13 = 0;
  if (!v10)
    return (id)v5;
  if (*(_DWORD *)v10 != 2)
  {
    *(_DWORD *)v10 -= 2;
    return (id)v5;
  }
  WTF::StringImpl::destroy(v10, v4);
  return (id)v5;
}

- (void)_pushPerformingProgrammaticFocus
{
  ++self->_private->programmaticFocusCount;
}

- (void)_popPerformingProgrammaticFocus
{
  --self->_private->programmaticFocusCount;
}

- (BOOL)_isPerformingProgrammaticFocus
{
  return self->_private->programmaticFocusCount != 0;
}

- (void)_didCommitLoadForFrame:(id)a3
{
  if (-[WebView mainFrame](self, "mainFrame") == a3)
    self->_private->didDrawTiles = 0;
}

- (void)_setUIKitDelegate:(id)a3
{
  WebViewPrivate *v4;
  void *m_ptr;

  self->_private->UIKitDelegate = a3;
  objc_msgSend(self->_private->UIKitDelegateForwarder.m_ptr, "clearTarget");
  v4 = self->_private;
  m_ptr = v4->UIKitDelegateForwarder.m_ptr;
  v4->UIKitDelegateForwarder.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id)_UIKitDelegate
{
  return self->_private->UIKitDelegate;
}

- (void)setWebMailDelegate:(id)a3
{
  self->_private->WebMailDelegate = a3;
}

- (id)_webMailDelegate
{
  return self->_private->WebMailDelegate;
}

- (id)caretChangeListener
{
  return self->_private->_caretChangeListener;
}

- (void)setCaretChangeListener:(id)a3
{
  self->_private->_caretChangeListener = (WebCaretChangeListener *)a3;
}

- (id)caretChangeListeners
{
  return self->_private->_caretChangeListeners.m_ptr;
}

- (void)addCaretChangeListener:(id)a3
{
  id v5;
  WebViewPrivate *v6;
  void *m_ptr;

  if (!self->_private->_caretChangeListeners.m_ptr)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = self->_private;
    m_ptr = v6->_caretChangeListeners.m_ptr;
    v6->_caretChangeListeners.m_ptr = v5;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  objc_msgSend(self->_private->_caretChangeListeners.m_ptr, "addObject:", a3);
}

- (void)removeCaretChangeListener:(id)a3
{
  objc_msgSend(self->_private->_caretChangeListeners.m_ptr, "removeObject:", a3);
}

- (void)removeAllCaretChangeListeners
{
  objc_msgSend(self->_private->_caretChangeListeners.m_ptr, "removeAllObjects");
}

- (void)caretChanged
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[WebCaretChangeListener caretChanged](self->_private->_caretChangeListener, "caretChanged");
  v3 = (void *)objc_msgSend(self->_private->_caretChangeListeners.m_ptr, "copy");
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "caretChanged");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
  if (v3)
    CFRelease(v3);
}

- (void)_clearDelegates
{
  -[WebView _setFormDelegate:](self, "_setFormDelegate:", 0);
  -[WebView _setUIKitDelegate:](self, "_setUIKitDelegate:", 0);
  -[WebView setCaretChangeListener:](self, "setCaretChangeListener:", 0);
  -[WebView removeAllCaretChangeListeners](self, "removeAllCaretChangeListeners");
  -[WebView setWebMailDelegate:](self, "setWebMailDelegate:", 0);
  -[WebView setDownloadDelegate:](self, "setDownloadDelegate:", 0);
  -[WebView setEditingDelegate:](self, "setEditingDelegate:", 0);
  -[WebView setFrameLoadDelegate:](self, "setFrameLoadDelegate:", 0);
  -[WebView setPolicyDelegate:](self, "setPolicyDelegate:", 0);
  -[WebView setResourceLoadDelegate:](self, "setResourceLoadDelegate:", 0);
  -[WebView setScriptDebugDelegate:](self, "setScriptDebugDelegate:", 0);
  -[WebView setUIDelegate:](self, "setUIDelegate:", 0);
}

- (id)_displayURL
{
  WebFrame *v3;
  WebDataSource *v4;
  WebDataSource *v5;
  NSURL *v6;
  NSURL *v7;
  NSURL *v8;
  CFTypeRef v9;

  WebThreadLock();
  v3 = -[WebView mainFrame](self, "mainFrame");
  v4 = -[WebFrame provisionalDataSource](v3, "provisionalDataSource");
  v5 = v4;
  if (v4)
  {
    v6 = -[WebDataSource unreachableURL](v4, "unreachableURL");
    if (v6)
    {
LABEL_3:
      CFRetain(v6);
      CFRetain(v6);
      v7 = v6;
      goto LABEL_7;
    }
  }
  else
  {
    v5 = -[WebFrame dataSource](v3, "dataSource");
    v6 = -[WebDataSource unreachableURL](v5, "unreachableURL");
    if (v6)
      goto LABEL_3;
  }
  v8 = -[NSMutableURLRequest URL](-[WebDataSource request](v5, "request"), "URL");
  v7 = v8;
  if (v8)
    CFRetain(v8);
LABEL_7:
  v9 = (id)CFMakeCollectable(v7);
  if (v6)
    CFRelease(v6);
  return (id)v9;
}

- (void)_setUseFastImageScalingMode:(BOOL)a3
{
  Page *m_ptr;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    if (WebCore::Page::inLowQualityImageInterpolationMode((WebCore::Page *)m_ptr) != a3)
    {
      WebCore::Page::setInLowQualityImageInterpolationMode((WebCore::Page *)self->_private->page.m_ptr);
      -[WebView setNeedsDisplay:](self, "setNeedsDisplay:", 1);
    }
  }
}

- (BOOL)_inFastImageScalingMode
{
  Page *m_ptr;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
    LOBYTE(m_ptr) = WebCore::Page::inLowQualityImageInterpolationMode((WebCore::Page *)m_ptr);
  return (char)m_ptr;
}

- (BOOL)_cookieEnabled
{
  Page *m_ptr;
  _BOOL8 v3;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
    return (*(_QWORD *)(*((_QWORD *)m_ptr + 14) + 664) >> 59) & 1;
  else
    LOBYTE(v3) = 1;
  return v3;
}

- (void)_setCookieEnabled:(BOOL)a3
{
  Page *m_ptr;
  uint64_t v4;
  uint64_t v5;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    v4 = *((_QWORD *)m_ptr + 14);
    v5 = 0x800000000000000;
    if (!a3)
      v5 = 0;
    *(_QWORD *)(v4 + 664) = *(_QWORD *)(v4 + 664) & 0xF7FFFFFFFFFFFFFFLL | v5;
  }
}

- (BOOL)_locked_plugInsAreRunningInFrame:(id)a3
{
  uint64_t v5;
  void *v6;
  BOOL result;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = objc_msgSend((id)objc_msgSend(a3, "frameView"), "documentView");
  if (v5)
  {
    v6 = (void *)v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend((id)objc_msgSend(v6, "_pluginController"), "plugInsAreRunning") & 1) != 0)
    {
      return 1;
    }
  }
  v8 = (void *)objc_msgSend(a3, "childFrames");
  v9 = objc_msgSend(v8, "count");
  if (!v9)
    return 0;
  v10 = 0;
  v11 = v9 - 1;
  do
  {
    result = -[WebView _locked_plugInsAreRunningInFrame:](self, "_locked_plugInsAreRunningInFrame:", objc_msgSend(v8, "objectAtIndex:", v10));
    if (result)
      break;
  }
  while (v11 != v10++);
  return result;
}

- (BOOL)_pluginsAreRunning
{
  WebThreadLock();
  return -[WebView _locked_plugInsAreRunningInFrame:](self, "_locked_plugInsAreRunningInFrame:", -[WebView mainFrame](self, "mainFrame"));
}

- (void)_locked_recursivelyPerformPlugInSelector:(SEL)a3 inFrame:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t i;

  v7 = objc_msgSend((id)objc_msgSend(a4, "frameView"), "documentView");
  if (v7)
  {
    v8 = (void *)v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend((id)objc_msgSend(v8, "_pluginController"), "performSelector:", a3);
  }
  v9 = (void *)objc_msgSend(a4, "childFrames");
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    for (i = 0; i != v10; ++i)
      -[WebView _locked_recursivelyPerformPlugInSelector:inFrame:](self, "_locked_recursivelyPerformPlugInSelector:inFrame:", a3, objc_msgSend(v9, "objectAtIndex:", i));
  }
}

- (void)_destroyAllPlugIns
{
  WebThreadLock();
  -[WebView _locked_recursivelyPerformPlugInSelector:inFrame:](self, "_locked_recursivelyPerformPlugInSelector:inFrame:", sel_destroyAllPlugins, -[WebView mainFrame](self, "mainFrame"));
}

- (void)_startAllPlugIns
{
  WebThreadLock();
  -[WebView _locked_recursivelyPerformPlugInSelector:inFrame:](self, "_locked_recursivelyPerformPlugInSelector:inFrame:", sel_startAllPlugins, -[WebView mainFrame](self, "mainFrame"));
}

- (void)_stopAllPlugIns
{
  WebThreadLock();
  -[WebView _locked_recursivelyPerformPlugInSelector:inFrame:](self, "_locked_recursivelyPerformPlugInSelector:inFrame:", sel_stopAllPlugins, -[WebView mainFrame](self, "mainFrame"));
}

- (void)_stopAllPlugInsForPageCache
{
  WebThreadLock();
  -[WebView _locked_recursivelyPerformPlugInSelector:inFrame:](self, "_locked_recursivelyPerformPlugInSelector:inFrame:", sel_stopPluginsForPageCache, -[WebView mainFrame](self, "mainFrame"));
}

- (void)_restorePlugInsFromCache
{
  WebThreadLock();
  -[WebView _locked_recursivelyPerformPlugInSelector:inFrame:](self, "_locked_recursivelyPerformPlugInSelector:inFrame:", sel_restorePluginsFromCache, -[WebView mainFrame](self, "mainFrame"));
}

- (BOOL)_setMediaLayer:(id)a3 forPluginView:(id)a4
{
  _BYTE *v7;
  _BYTE *v8;
  _BYTE *v9;
  WebCore::LocalFrameView *v10;
  uint64_t v11;
  uint64_t v12;
  WebCore::LocalFrameView *v13;

  WebThreadLock();
  v7 = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
  if (v7)
  {
    v8 = v7;
    v9 = v7;
    while (1)
    {
      v10 = (WebCore::LocalFrameView *)*((_QWORD *)v9 + 36);
      if (v10)
      {
        v11 = WebCore::LocalFrameView::graphicsLayerForPlatformWidget(v10, (WAKView *)a4);
        if (v11)
        {
          v12 = v11;
          if ((id)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 496))(v11) != a3)
            break;
        }
      }
      v7 = (_BYTE *)WebCore::FrameTree::traverseNext((WebCore::FrameTree *)(v9 + 48), 0);
      if (!v7)
        return (char)v7;
      v9 = v7;
      if (v7[144])
      {
        LOBYTE(v7) = 0;
        return (char)v7;
      }
    }
    (*(void (**)(uint64_t, id, uint64_t))(*(_QWORD *)v12 + 512))(v12, a3, 2);
    v13 = (WebCore::LocalFrameView *)*((_QWORD *)v8 + 36);
    if (v13)
      WebCore::LocalFrameView::flushCompositingStateIncludingSubframes(v13);
    LOBYTE(v7) = 1;
  }
  return (char)v7;
}

- (void)_setNeedsUnrestrictedGetMatchedCSSRules:(BOOL)a3
{
  Page *m_ptr;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
    *(_QWORD *)(*((_QWORD *)m_ptr + 14) + 672) = *(_QWORD *)(*((_QWORD *)m_ptr + 14) + 672) & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (void)_attachScriptDebuggerToAllFrames
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  v2 = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
  if (v2)
  {
    v3 = (uint64_t)v2;
    do
    {
      if (!*(_BYTE *)(v3 + 144))
      {
        v5 = *(_QWORD **)(*(_QWORD *)(v3 + 280) + 16);
        if (((*(uint64_t (**)(_QWORD *))(*v5 + 1072))(v5) & 1) != 0)
          v4 = 0;
        else
          v4 = (void *)v5[2];
        objc_msgSend(v4, "_attachScriptDebugger");
      }
      v3 = WebCore::FrameTree::traverseNext((WebCore::FrameTree *)(v3 + 48), 0);
    }
    while (v3);
  }
}

- (void)_detachScriptDebuggerFromAllFrames
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  v2 = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
  if (v2)
  {
    v3 = (uint64_t)v2;
    do
    {
      if (!*(_BYTE *)(v3 + 144))
      {
        v5 = *(_QWORD **)(*(_QWORD *)(v3 + 280) + 16);
        if (((*(uint64_t (**)(_QWORD *))(*v5 + 1072))(v5) & 1) != 0)
          v4 = 0;
        else
          v4 = (void *)v5[2];
        objc_msgSend(v4, "_detachScriptDebugger");
      }
      v3 = WebCore::FrameTree::traverseNext((WebCore::FrameTree *)(v3 + 48), 0);
    }
    while (v3);
  }
}

- (void)setBackgroundColor:(CGColor *)a3
{
  WebViewPrivate *v5;
  void *m_ptr;

  if (a3 && !CFEqual(self->_private->backgroundColor.m_ptr, a3))
  {
    v5 = self->_private;
    CFRetain(a3);
    m_ptr = v5->backgroundColor.m_ptr;
    v5->backgroundColor.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
    -[WebFrame _updateBackgroundAndUpdatesWhileOffscreen](-[WebView mainFrame](self, "mainFrame"), "_updateBackgroundAndUpdatesWhileOffscreen");
  }
}

- (CGColor)backgroundColor
{
  return (CGColor *)self->_private->backgroundColor.m_ptr;
}

- (BOOL)defersCallbacks
{
  Page *m_ptr;

  m_ptr = self->_private->page.m_ptr;
  return m_ptr && *((_BYTE *)m_ptr + 339) != 0;
}

- (void)setDefersCallbacks:(BOOL)a3
{
  Page *m_ptr;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
    WebCore::Page::setDefersLoading((WebCore::Page *)m_ptr);
}

- (id)quickLookContentForURL:(id)a3
{
  return 0;
}

- (BOOL)_isStopping
{
  return self->_private->isStopping;
}

- (BOOL)_isClosing
{
  return self->_private->closing;
}

- (void)_setDeviceOrientation:(unint64_t)a3
{
  self->_private->deviceOrientation = a3;
}

- (unint64_t)_deviceOrientation
{
  return self->_private->deviceOrientation;
}

+ (id)_productivityDocumentMIMETypes
{
  return (id)objc_msgSend((id)WebCore::QLPreviewGetSupportedMIMETypesSet((WebCore *)a1), "allObjects");
}

- (void)_setAllowsMessaging:(BOOL)a3
{
  self->_private->allowsMessaging = a3;
}

- (BOOL)_allowsMessaging
{
  return self->_private->allowsMessaging;
}

- (void)_setFixedLayoutSize:(CGSize)a3
{
  WebFrame *v4;
  LocalFrame *m_ptr;
  int v6;
  CGSize v7;

  v7 = a3;
  self->_private->fixedLayoutSize = a3;
  v4 = -[WebView mainFrame](self, "mainFrame");
  if (v4)
  {
    m_ptr = v4->_private->coreFrame.m_ptr;
    if (m_ptr)
    {
      WebCore::IntSize::IntSize((WebCore::IntSize *)&v6, &v7);
      WebCore::ScrollView::setFixedLayoutSize();
      WebCore::ScrollView::setUseFixedLayout(*((WebCore::ScrollView **)m_ptr + 36));
      -[WebView setNeedsDisplay:](self, "setNeedsDisplay:", 1);
    }
  }
}

- (CGSize)_fixedLayoutSize
{
  WebViewPrivate *v2;
  double width;
  double height;
  CGSize result;

  v2 = self->_private;
  width = v2->fixedLayoutSize.width;
  height = v2->fixedLayoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_synchronizeCustomFixedPositionLayoutRect
{
  Lock *p_pendingFixedPositionLayoutRectMutex;
  const CGRect *v5;
  int v6;
  uint64_t v7;
  WebViewPrivate *v8;
  CGSize v9;
  WebFrame *v10;
  uint64_t v11;
  uint64_t v12;

  p_pendingFixedPositionLayoutRectMutex = &self->_private->pendingFixedPositionLayoutRectMutex;
  if (__ldaxr(&p_pendingFixedPositionLayoutRectMutex->m_byte.value.__a_.__a_value))
  {
    __clrex();
  }
  else if (!__stxr(1u, &p_pendingFixedPositionLayoutRectMutex->m_byte.value.__a_.__a_value))
  {
    goto LABEL_5;
  }
  MEMORY[0x1D82A3914](p_pendingFixedPositionLayoutRectMutex, a2);
LABEL_5:
  if (CGRectIsNull(self->_private->pendingFixedPositionLayoutRect))
  {
    v6 = __ldxr(&p_pendingFixedPositionLayoutRectMutex->m_byte.value.__a_.__a_value);
    if (v6 == 1)
    {
      if (__stlxr(0, &p_pendingFixedPositionLayoutRectMutex->m_byte.value.__a_.__a_value))
        WTF::Lock::unlockSlow((WTF::Lock *)p_pendingFixedPositionLayoutRectMutex);
    }
    else
    {
      __clrex();
      WTF::Lock::unlockSlow((WTF::Lock *)p_pendingFixedPositionLayoutRectMutex);
    }
    return;
  }
  v11 = WebCore::enclosingIntRect((WebCore *)&self->_private->pendingFixedPositionLayoutRect, v5);
  v12 = v7;
  v8 = self->_private;
  v9 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  v8->pendingFixedPositionLayoutRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  v8->pendingFixedPositionLayoutRect.size = v9;
  LODWORD(v8) = __ldxr(&p_pendingFixedPositionLayoutRectMutex->m_byte.value.__a_.__a_value);
  if ((_DWORD)v8 != 1)
  {
    __clrex();
LABEL_16:
    WTF::Lock::unlockSlow((WTF::Lock *)p_pendingFixedPositionLayoutRectMutex);
    v10 = -[WebView mainFrame](self, "mainFrame", v11, v12);
    if (!v10)
      return;
    goto LABEL_17;
  }
  if (__stlxr(0, &p_pendingFixedPositionLayoutRectMutex->m_byte.value.__a_.__a_value))
    goto LABEL_16;
  v10 = -[WebView mainFrame](self, "mainFrame", v11, v7);
  if (!v10)
    return;
LABEL_17:
  if (v10->_private->coreFrame.m_ptr)
    WebCore::LocalFrameView::setCustomFixedPositionLayoutRect();
}

- (void)_setCustomFixedPositionLayoutRectInWebThread:(CGRect)a3 synchronize:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  Lock *p_pendingFixedPositionLayoutRectMutex;
  WebViewPrivate *v12;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_pendingFixedPositionLayoutRectMutex = &self->_private->pendingFixedPositionLayoutRectMutex;
  if (__ldaxr(&p_pendingFixedPositionLayoutRectMutex->m_byte.value.__a_.__a_value))
  {
    __clrex();
  }
  else if (!__stxr(1u, &p_pendingFixedPositionLayoutRectMutex->m_byte.value.__a_.__a_value))
  {
    goto LABEL_5;
  }
  MEMORY[0x1D82A3914](p_pendingFixedPositionLayoutRectMutex, a2);
LABEL_5:
  v12 = self->_private;
  v12->pendingFixedPositionLayoutRect.origin.x = x;
  v12->pendingFixedPositionLayoutRect.origin.y = y;
  v12->pendingFixedPositionLayoutRect.size.width = width;
  v12->pendingFixedPositionLayoutRect.size.height = height;
  LODWORD(v12) = __ldxr(&p_pendingFixedPositionLayoutRectMutex->m_byte.value.__a_.__a_value);
  if ((_DWORD)v12 == 1)
  {
    if (!__stlxr(0, &p_pendingFixedPositionLayoutRectMutex->m_byte.value.__a_.__a_value))
    {
      if (!v4)
        return;
      goto LABEL_8;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)p_pendingFixedPositionLayoutRectMutex);
  if (!v4)
    return;
LABEL_8:
  WebThreadRun();
}

uint64_t __80__WebView_WebPrivate___setCustomFixedPositionLayoutRectInWebThread_synchronize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_synchronizeCustomFixedPositionLayoutRect");
}

- (void)_setCustomFixedPositionLayoutRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  Lock *p_pendingFixedPositionLayoutRectMutex;
  WebViewPrivate *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_pendingFixedPositionLayoutRectMutex = &self->_private->pendingFixedPositionLayoutRectMutex;
  if (__ldaxr(&p_pendingFixedPositionLayoutRectMutex->m_byte.value.__a_.__a_value))
  {
    __clrex();
  }
  else if (!__stxr(1u, &p_pendingFixedPositionLayoutRectMutex->m_byte.value.__a_.__a_value))
  {
    goto LABEL_5;
  }
  MEMORY[0x1D82A3914](p_pendingFixedPositionLayoutRectMutex, a2);
LABEL_5:
  v10 = self->_private;
  v10->pendingFixedPositionLayoutRect.origin.x = x;
  v10->pendingFixedPositionLayoutRect.origin.y = y;
  v10->pendingFixedPositionLayoutRect.size.width = width;
  v10->pendingFixedPositionLayoutRect.size.height = height;
  LODWORD(v10) = __ldxr(&p_pendingFixedPositionLayoutRectMutex->m_byte.value.__a_.__a_value);
  if ((_DWORD)v10 == 1)
  {
    if (!__stlxr(0, &p_pendingFixedPositionLayoutRectMutex->m_byte.value.__a_.__a_value))
      goto LABEL_10;
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)p_pendingFixedPositionLayoutRectMutex);
LABEL_10:
  -[WebView _synchronizeCustomFixedPositionLayoutRect](self, "_synchronizeCustomFixedPositionLayoutRect");
}

- (BOOL)_fetchCustomFixedPositionLayoutRect:(CGRect *)a3
{
  Lock *p_pendingFixedPositionLayoutRectMutex;
  BOOL IsNull;
  BOOL v8;
  WebViewPrivate *v9;
  CGSize size;
  WebViewPrivate *v11;
  CGSize v12;
  int v13;

  p_pendingFixedPositionLayoutRectMutex = &self->_private->pendingFixedPositionLayoutRectMutex;
  if (__ldaxr(&p_pendingFixedPositionLayoutRectMutex->m_byte.value.__a_.__a_value))
  {
    __clrex();
  }
  else if (!__stxr(1u, &p_pendingFixedPositionLayoutRectMutex->m_byte.value.__a_.__a_value))
  {
    goto LABEL_5;
  }
  MEMORY[0x1D82A3914](p_pendingFixedPositionLayoutRectMutex, a2);
LABEL_5:
  IsNull = CGRectIsNull(self->_private->pendingFixedPositionLayoutRect);
  v8 = IsNull;
  if (!IsNull)
  {
    v9 = self->_private;
    size = v9->pendingFixedPositionLayoutRect.size;
    a3->origin = v9->pendingFixedPositionLayoutRect.origin;
    a3->size = size;
    v11 = self->_private;
    v12 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v11->pendingFixedPositionLayoutRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v11->pendingFixedPositionLayoutRect.size = v12;
  }
  v13 = __ldxr(&p_pendingFixedPositionLayoutRectMutex->m_byte.value.__a_.__a_value);
  if (v13 == 1)
  {
    if (!__stlxr(0, &p_pendingFixedPositionLayoutRectMutex->m_byte.value.__a_.__a_value))
      return !IsNull;
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)p_pendingFixedPositionLayoutRectMutex);
  return !v8;
}

- (void)_viewGeometryDidChange
{
  if (-[WebView _mainCoreFrame](self, "_mainCoreFrame"))
    WebCore::LocalFrame::viewportOffsetChanged();
}

- (void)_overflowScrollPositionChangedTo:(CGPoint)a3 forNode:(id)a4 isUserScroll:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  WebCore::LocalFrame *v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  unint64_t v13;
  float v14[2];
  IntPoint v15;
  CGPoint v16;

  v16 = a3;
  v5 = *((_QWORD *)a4 + 2);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 528);
  if (v6)
  {
    v7 = *(WebCore::LocalFrame **)(v6 + 8);
    if (v7)
    {
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v14, &v16);
      v8 = roundf(v14[0]);
      v9 = 0x7FFFFFFFLL;
      v10 = (int)v8;
      if (v8 <= -2147500000.0)
        v10 = 0x80000000;
      if (v8 < 2147500000.0)
        v9 = v10;
      v11 = roundf(v14[1]);
      v12 = 0x7FFFFFFF00000000;
      v13 = 0x8000000000000000;
      if (v11 > -2147500000.0)
        v13 = (unint64_t)(int)v11 << 32;
      if (v11 < 2147500000.0)
        v12 = v13;
      v15 = (IntPoint)(v12 | v9);
      WebCore::LocalFrame::overflowScrollPositionChangedForNode(v7, &v15, (Node *)v5);
    }
  }
}

+ (void)_doNotStartObservingNetworkReachability
{
  *(_BYTE *)(WebCore::DeprecatedGlobalSettings::shared((WebCore::DeprecatedGlobalSettings *)a1) + 16) = 1;
}

- (id)_touchEventRegions
{
  _QWORD *v2;

  v2 = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
  if (v2 && v2[37])
    WebCore::Document::getTouchRects();
  return 0;
}

- (BOOL)usesPageCache
{
  return self->_private->usesPageCache
      && -[WebPreferences usesPageCache](-[WebView preferences](self, "preferences"), "usesPageCache");
}

- (void)setUsesPageCache:(BOOL)a3
{
  self->_private->usesPageCache = a3;
  -[WebView _preferencesChanged:](self, "_preferencesChanged:", -[WebView preferences](self, "preferences"));
  -[WebPreferences _postPreferencesChangedAPINotification](-[WebView preferences](self, "preferences"), "_postPreferencesChangedAPINotification");
}

- (id)textIteratorForRect:(CGRect)a3
{
  const CGRect *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  Node *var0;
  Node *v9;
  WebTextIterator *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  VisiblePosition v15;
  uint64_t v16;
  VisiblePosition v17;
  _BYTE v18[104];
  uint64_t v19;
  uint64_t v20;
  char v21;
  CGRect v22;

  v22 = a3;
  v4 = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
  if (!v4)
    return v4;
  v5 = WebCore::enclosingIntRect((WebCore *)&v22, v3);
  v7 = v6;
  v16 = v5;
  WebCore::LocalFrame::visiblePositionForPoint((WebCore::LocalFrame *)v4, (const WebCore::IntPoint *)&v16);
  v14 = ((v7 & 0xFFFFFFFF00000000) + v5) & 0xFFFFFFFF00000000 | (v7 + v5);
  WebCore::LocalFrame::visiblePositionForPoint((WebCore::LocalFrame *)v4, (const WebCore::IntPoint *)&v14);
  WebCore::VisibleSelection::VisibleSelection((WebCore::VisibleSelection *)v18, &v17, &v15);
  WebCore::VisibleSelection::toNormalizedRange((WebCore::VisibleSelection *)v18);
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v18);
  var0 = v15.var0.var0.var0;
  v15.var0.var0.var0 = 0;
  if (var0)
  {
    if (*((_DWORD *)var0 + 6) == 2)
    {
      if ((*((_WORD *)var0 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)var0);
    }
    else
    {
      *((_DWORD *)var0 + 6) -= 2;
    }
  }
  v9 = v17.var0.var0.var0;
  v17.var0.var0.var0 = 0;
  if (v9)
  {
    if (*((_DWORD *)v9 + 6) == 2)
    {
      if ((*((_WORD *)v9 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)v9);
    }
    else
    {
      *((_DWORD *)v9 + 6) -= 2;
    }
  }
  v10 = -[WebTextIterator initWithRange:]([WebTextIterator alloc], "initWithRange:", kit());
  v4 = (id)CFMakeCollectable(v10);
  if (!v21)
    return v4;
  v11 = v20;
  v20 = 0;
  if (v11)
  {
    if (*(_DWORD *)(v11 + 24) == 2)
    {
      if ((*(_WORD *)(v11 + 30) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)v11);
    }
    else
    {
      *(_DWORD *)(v11 + 24) -= 2;
    }
  }
  v12 = v19;
  v19 = 0;
  if (!v12)
    return v4;
  if (*(_DWORD *)(v12 + 24) != 2)
  {
    *(_DWORD *)(v12 + 24) -= 2;
    return v4;
  }
  if ((*(_WORD *)(v12 + 30) & 0x400) != 0)
    return v4;
  WebCore::Node::removedLastRef((WebCore::Node *)v12);
  return v4;
}

- (void)_executeCoreCommandByName:(id)a3 value:(id)a4
{
  Page *m_ptr;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  WebCore::Editor *v10;
  StringImpl *v11;
  WTF::StringImpl *v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;
  WebCore::Node *v17;
  WTF::StringImpl *v18;
  unsigned int v19;
  unsigned int v20;
  WTF *v21;
  void *v22;
  _QWORD *v23;
  _QWORD *v24;
  WTF::StringImpl *v25;
  WTF::StringImpl *v26;
  WTF::StringImpl *v27;
  _QWORD *v28;
  WebCore::Node *v29;
  uint64_t v30;
  WTF::StringImpl *v31;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    ++*(_DWORD *)m_ptr;
    v7 = WebCore::FocusController::focusedOrMainFrame(*((WebCore::FocusController **)m_ptr + 9));
    if (!v7)
    {
LABEL_25:
      if (*(_DWORD *)m_ptr == 1)
      {
        v21 = (WTF *)MEMORY[0x1D82A65B4](m_ptr);
        WTF::fastFree(v21, v22);
      }
      else
      {
        --*(_DWORD *)m_ptr;
      }
      return;
    }
    v8 = (unsigned int *)(v7 + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 + 1, v8));
    v10 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v7 + 296));
    MEMORY[0x1D82A3998](&v27, a3);
    WebCore::Editor::command(v10, (const WTF::String *)&v27);
    MEMORY[0x1D82A3998](&v31, a4);
    WebCore::Editor::Command::execute();
    v12 = v31;
    v31 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2)
      {
        WTF::StringImpl::destroy(v12, v11);
        v13 = v30;
        v30 = 0;
        if (!v13)
        {
LABEL_14:
          v17 = v29;
          v29 = 0;
          if (v17)
          {
            if (*((_DWORD *)v17 + 6) == 2)
            {
              if ((*((_WORD *)v17 + 15) & 0x400) == 0)
                WebCore::Node::removedLastRef(v17);
            }
            else
            {
              *((_DWORD *)v17 + 6) -= 2;
            }
          }
          v18 = v27;
          v27 = 0;
          if (v18)
          {
            if (*(_DWORD *)v18 == 2)
              WTF::StringImpl::destroy(v18, v11);
            else
              *(_DWORD *)v18 -= 2;
          }
          do
          {
            v19 = __ldaxr(v8);
            v20 = v19 - 1;
          }
          while (__stlxr(v20, v8));
          if (!v20)
          {
            atomic_store(1u, v8);
            v23 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
            *v23 = off_1E9D6A4D8;
            v23[1] = v8;
            v28 = v23;
            WTF::ensureOnMainThread();
            v24 = v28;
            v28 = 0;
            if (v24)
              (*(void (**)(_QWORD *))(*v24 + 8))(v24);
          }
          goto LABEL_25;
        }
LABEL_11:
        v14 = (unsigned int *)(v13 + 8);
        do
        {
          v15 = __ldaxr(v14);
          v16 = v15 - 1;
        }
        while (__stlxr(v16, v14));
        if (!v16)
        {
          atomic_store(1u, v14);
          v25 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
          *(_QWORD *)v25 = off_1E9D6A4D8;
          *((_QWORD *)v25 + 1) = v14;
          v31 = v25;
          WTF::ensureOnMainThread();
          v26 = v31;
          v31 = 0;
          if (v26)
            (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v26 + 8))(v26);
        }
        goto LABEL_14;
      }
      *(_DWORD *)v12 -= 2;
    }
    v13 = v30;
    v30 = 0;
    if (!v13)
      goto LABEL_14;
    goto LABEL_11;
  }
}

- (void)_clearMainFrameName
{
  uint64_t v2;
  BOOL v3;

  v2 = *((_QWORD *)self->_private->page.m_ptr + 20);
  if (v2)
    v3 = *(_BYTE *)(v2 + 144) == 0;
  else
    v3 = 0;
  if (v3)
    WebCore::FrameTree::clearName((WebCore::FrameTree *)(v2 + 48));
}

- (void)setSelectTrailingWhitespaceEnabled:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = *((_QWORD *)self->_private->page.m_ptr + 14);
  v4 = *(_QWORD *)(v3 + 696);
  if (((v4 >> 3) & 1) != a3)
  {
    v5 = v3 + 664;
    v6 = *(unsigned int *)(v3 + 720) | ((unint64_t)*(unsigned __int8 *)(v3 + 724) << 32);
    v7 = *(_QWORD *)(v3 + 712);
    v8 = *(_QWORD *)(v3 + 704);
    v9 = *(_QWORD *)(v3 + 688);
    v10 = *(_QWORD *)(v3 + 680);
    v11 = *(_QWORD *)(v3 + 672);
    v12 = *(_QWORD *)(v3 + 664);
    v13 = 8;
    if (!a3)
      v13 = 0;
    *(_QWORD *)v5 = v12;
    *(_QWORD *)(v5 + 8) = v11;
    *(_QWORD *)(v5 + 16) = v10;
    *(_QWORD *)(v5 + 24) = v9;
    *(_QWORD *)(v5 + 40) = v8;
    *(_QWORD *)(v5 + 48) = v7;
    *(_QWORD *)(v5 + 32) = v4 & 0xFFFFFFFFFFFFFFF7 | v13;
    *(_DWORD *)(v5 + 56) = v6;
    *(_BYTE *)(v5 + 60) = BYTE4(v6);
    -[WebView setSmartInsertDeleteEnabled:](self, "setSmartInsertDeleteEnabled:", !a3);
  }
}

- (BOOL)isSelectTrailingWhitespaceEnabled
{
  return (*(_QWORD *)(*((_QWORD *)self->_private->page.m_ptr + 14) + 696) >> 3) & 1;
}

- (void)setMemoryCacheDelegateCallsEnabled:(BOOL)a3
{
  WebCore::Page::setMemoryCacheClientCallsEnabled((WebCore::Page *)self->_private->page.m_ptr);
}

- (BOOL)areMemoryCacheDelegateCallsEnabled
{
  return *((_BYTE *)self->_private->page.m_ptr + 345);
}

- (BOOL)_postsAcceleratedCompositingNotifications
{
  return self->_private->postsAcceleratedCompositingNotifications;
}

- (void)_setPostsAcceleratedCompositingNotifications:(BOOL)a3
{
  self->_private->postsAcceleratedCompositingNotifications = a3;
}

- (BOOL)_isUsingAcceleratedCompositing
{
  const WebCore::Frame *v2;
  const WebCore::Frame *v3;
  const WebCore::Frame *v4;
  _QWORD *v5;
  void *v6;
  void *v7;

  v2 = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
  if (v2)
  {
    v3 = v2;
    v4 = v2;
    while (1)
    {
      if (!*((_BYTE *)v4 + 144))
      {
        v5 = *(_QWORD **)(*((_QWORD *)v4 + 35) + 16);
        v6 = ((*(uint64_t (**)(_QWORD *))(*v5 + 1072))(v5) & 1) != 0 ? 0 : (void *)v5[2];
        v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "frameView"), "documentView");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v7, "_isUsingAcceleratedCompositing") & 1) != 0)
          break;
      }
      v2 = (const WebCore::Frame *)WebCore::FrameTree::traverseNext((const WebCore::Frame *)((char *)v4 + 48), v3);
      v4 = v2;
      if (!v2)
        return (char)v2;
    }
    LOBYTE(v2) = 1;
  }
  return (char)v2;
}

- (void)_setBaseCTM:(CGAffineTransform *)a3 forContext:(CGContext *)a4
{
  CGContextSetBaseCTM();
}

- (BOOL)interactiveFormValidationEnabled
{
  return self->_private->interactiveFormValidationEnabled;
}

- (void)setInteractiveFormValidationEnabled:(BOOL)a3
{
  self->_private->interactiveFormValidationEnabled = a3;
}

- (int)validationMessageTimerMagnification
{
  return self->_private->validationMessageTimerMagnification;
}

- (void)setValidationMessageTimerMagnification:(int)a3
{
  self->_private->validationMessageTimerMagnification = a3;
}

- (id)_contentsOfUserInterfaceItem:(id)a3
{
  ValidationBubble *m_ptr;
  WTF::StringImpl **v6;
  WTF::StringImpl *v7;
  double v8;
  const __CFString *v9;
  void *v10;
  StringImpl *v11;
  _QWORD v13[2];
  _QWORD v14[2];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("validationBubble")))
    return 0;
  m_ptr = self->_private->formValidationBubble.m_ptr;
  v6 = (WTF::StringImpl **)((char *)m_ptr + 16);
  if (!m_ptr)
    v6 = (WTF::StringImpl **)MEMORY[0x1E0CBF738];
  v7 = *v6;
  if (*v6)
    *(_DWORD *)v7 += 2;
  if (m_ptr)
  {
    v8 = *((double *)m_ptr + 3);
    v15 = a3;
    v13[0] = CFSTR("message");
    if (v7)
    {
LABEL_8:
      v9 = (const __CFString *)WTF::StringImpl::operator NSString *();
      goto LABEL_12;
    }
  }
  else
  {
    v8 = 0.0;
    v15 = a3;
    v13[0] = CFSTR("message");
    if (v7)
      goto LABEL_8;
  }
  v9 = &stru_1E9D6EC48;
LABEL_12:
  v13[1] = CFSTR("fontSize");
  v14[0] = v9;
  v14[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v16[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v11);
    else
      *(_DWORD *)v7 -= 2;
  }
  return v10;
}

- (BOOL)_isSoftwareRenderable
{
  const WebCore::Frame *v2;
  const WebCore::Frame *v3;
  uint64_t v4;
  WebCore::LocalFrameView *v5;
  int isSoftwareRenderable;

  v2 = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
  if (v2)
  {
    v3 = v2;
    v4 = (uint64_t)v2;
    while (1)
    {
      if (!*(_BYTE *)(v4 + 144))
      {
        v5 = *(WebCore::LocalFrameView **)(v4 + 288);
        if (v5)
        {
          isSoftwareRenderable = WebCore::LocalFrameView::isSoftwareRenderable(v5);
          if (!isSoftwareRenderable)
            break;
        }
      }
      v4 = WebCore::FrameTree::traverseNext((WebCore::FrameTree *)(v4 + 48), v3);
      if (!v4)
        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    LOBYTE(isSoftwareRenderable) = 1;
  }
  return isSoftwareRenderable;
}

- (void)setTracksRepaints:(BOOL)a3
{
  WebCore::LocalFrameView *v3;

  v3 = *(WebCore::LocalFrameView **)(-[WebView _mainCoreFrame](self, "_mainCoreFrame") + 288);
  if (v3)
    WebCore::LocalFrameView::setTracksRepaints(v3);
}

- (BOOL)isTrackingRepaints
{
  uint64_t v2;

  v2 = *(_QWORD *)(-[WebView _mainCoreFrame](self, "_mainCoreFrame") + 288);
  return v2 && v2 != 0 && *(_BYTE *)(v2 + 1371) != 0;
}

- (void)resetTrackedRepaints
{
  WebCore::LocalFrameView *v2;

  v2 = *(WebCore::LocalFrameView **)(-[WebView _mainCoreFrame](self, "_mainCoreFrame") + 288);
  if (v2)
    WebCore::LocalFrameView::resetTrackedRepaints(v2);
}

- (id)trackedRepaintRects
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  const FloatRect *v5;
  uint64_t v6;
  void *v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;
  int v13;
  unint64_t v14;
  BOOL v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v23;
  int v24;
  int v25;
  int v26;
  unint64_t v27;
  unint64_t v28;

  v2 = *(_QWORD *)(-[WebView _mainCoreFrame](self, "_mainCoreFrame") + 288);
  if (!v2 || !*(_BYTE *)(v2 + 1371))
    return 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)(v2 + 1068));
  v4 = *(unsigned int *)(v2 + 1068);
  if ((_DWORD)v4)
  {
    v5 = *(const FloatRect **)(v2 + 1056);
    v6 = 16 * v4;
    do
    {
      v7 = (void *)MEMORY[0x1E0CB3B18];
      WebCore::LayoutRect::LayoutRect((WebCore::LayoutRect *)&v23, v5);
      v9 = v23 - (v8 & 0xFFFFFFC0);
      v10 = (int)(v9 + 32) >> 6;
      v12 = v24 - (v11 & 0xFFFFFFC0);
      v13 = (int)(v12 + 32) >> 6;
      v14 = (v10 + v23 / 64) | ((unint64_t)(v13 + v24 / 64) << 32);
      v15 = __OFADD__(v9, v25);
      v16 = v9 + v25;
      v17 = (v9 >> 31) + 0x7FFFFFFF;
      if (!v15)
        v17 = v16;
      v18 = (v17 / 64 - v10 + ((int)(v17 - (v16 & 0xFFFFFFC0) + 32) >> 6));
      v15 = __OFADD__(v12, v26);
      v19 = v12 + v26;
      v20 = (v12 >> 31) + 0x7FFFFFFF;
      if (!v15)
        v20 = v19;
      v27 = v14;
      v28 = v18 | ((unint64_t)(v20 / 64 - v13 + ((int)(v20 - (v19 & 0xFFFFFFC0) + 32) >> 6)) << 32);
      WebCore::IntRect::operator CGRect();
      v21 = objc_msgSend(v7, "valueWithRect:");
      if (v21)
        objc_msgSend(v3, "addObject:", v21);
      ++v5;
      v6 -= 16;
    }
    while (v6);
  }
  return (id)(id)CFMakeCollectable(v3);
}

+ (void)_addOriginAccessAllowListEntryWithSourceOrigin:(id)a3 destinationProtocol:(id)a4 destinationHost:(id)a5 allowDestinationSubdomains:(BOOL)a6
{
  _BOOL8 v6;
  const WTF::String *v9;
  WTF *v10;
  StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  WTF *v14;
  unsigned int v15;
  unsigned int v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  uint64_t v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *v22;
  WTF::StringImpl *v23;
  WTF *v24;

  v6 = a6;
  MEMORY[0x1D82A3998](&v23, a3);
  WebCore::SecurityOrigin::createFromString((WebCore::SecurityOrigin *)&v23, v9);
  v10 = v24;
  MEMORY[0x1D82A3998](&v22, a4);
  MEMORY[0x1D82A3998](&v21, a5);
  WebCore::SecurityPolicy::addOriginAccessAllowlistEntry(v10, (const WebCore::SecurityOrigin *)&v22, (const WTF::String *)&v21, (const WTF::String *)v6);
  v12 = v21;
  v21 = 0;
  if (!v12)
  {
LABEL_4:
    v13 = v22;
    v22 = 0;
    if (!v13)
      goto LABEL_9;
    goto LABEL_7;
  }
  if (*(_DWORD *)v12 != 2)
  {
    *(_DWORD *)v12 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v12, v11);
  v13 = v22;
  v22 = 0;
  if (!v13)
    goto LABEL_9;
LABEL_7:
  if (*(_DWORD *)v13 == 2)
  {
    WTF::StringImpl::destroy(v13, v11);
    v14 = v24;
    v24 = 0;
    if (!v14)
      goto LABEL_14;
    goto LABEL_12;
  }
  *(_DWORD *)v13 -= 2;
LABEL_9:
  v14 = v24;
  v24 = 0;
  if (!v14)
    goto LABEL_14;
  do
  {
LABEL_12:
    v15 = __ldaxr((unsigned int *)v14);
    v16 = v15 - 1;
  }
  while (__stlxr(v16, (unsigned int *)v14));
  if (v16)
  {
LABEL_14:
    v17 = v23;
    v23 = 0;
    if (!v17)
      return;
    goto LABEL_15;
  }
  atomic_store(1u, (unsigned int *)v14);
  v18 = (WTF::StringImpl *)*((_QWORD *)v14 + 6);
  *((_QWORD *)v14 + 6) = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2)
      WTF::StringImpl::destroy(v18, v11);
    else
      *(_DWORD *)v18 -= 2;
  }
  v19 = (WTF::StringImpl *)*((_QWORD *)v14 + 5);
  *((_QWORD *)v14 + 5) = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2)
      WTF::StringImpl::destroy(v19, v11);
    else
      *(_DWORD *)v19 -= 2;
  }
  v20 = *((unsigned int *)v14 + 8);
  if ((_DWORD)v20 != -1)
    ((void (*)(WTF::StringImpl **, char *))off_1E9D6C240[v20])(&v22, (char *)v14 + 8);
  *((_DWORD *)v14 + 8) = -1;
  WTF::fastFree(v14, v11);
  v17 = v23;
  v23 = 0;
  if (v17)
  {
LABEL_15:
    if (*(_DWORD *)v17 == 2)
      WTF::StringImpl::destroy(v17, v11);
    else
      *(_DWORD *)v17 -= 2;
  }
}

+ (void)_removeOriginAccessAllowListEntryWithSourceOrigin:(id)a3 destinationProtocol:(id)a4 destinationHost:(id)a5 allowDestinationSubdomains:(BOOL)a6
{
  _BOOL8 v6;
  const WTF::String *v9;
  WTF *v10;
  StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  WTF *v14;
  unsigned int v15;
  unsigned int v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  uint64_t v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *v22;
  WTF::StringImpl *v23;
  WTF *v24;

  v6 = a6;
  MEMORY[0x1D82A3998](&v23, a3);
  WebCore::SecurityOrigin::createFromString((WebCore::SecurityOrigin *)&v23, v9);
  v10 = v24;
  MEMORY[0x1D82A3998](&v22, a4);
  MEMORY[0x1D82A3998](&v21, a5);
  WebCore::SecurityPolicy::removeOriginAccessAllowlistEntry(v10, (const WebCore::SecurityOrigin *)&v22, (const WTF::String *)&v21, (const WTF::String *)v6);
  v12 = v21;
  v21 = 0;
  if (!v12)
  {
LABEL_4:
    v13 = v22;
    v22 = 0;
    if (!v13)
      goto LABEL_9;
    goto LABEL_7;
  }
  if (*(_DWORD *)v12 != 2)
  {
    *(_DWORD *)v12 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v12, v11);
  v13 = v22;
  v22 = 0;
  if (!v13)
    goto LABEL_9;
LABEL_7:
  if (*(_DWORD *)v13 == 2)
  {
    WTF::StringImpl::destroy(v13, v11);
    v14 = v24;
    v24 = 0;
    if (!v14)
      goto LABEL_14;
    goto LABEL_12;
  }
  *(_DWORD *)v13 -= 2;
LABEL_9:
  v14 = v24;
  v24 = 0;
  if (!v14)
    goto LABEL_14;
  do
  {
LABEL_12:
    v15 = __ldaxr((unsigned int *)v14);
    v16 = v15 - 1;
  }
  while (__stlxr(v16, (unsigned int *)v14));
  if (v16)
  {
LABEL_14:
    v17 = v23;
    v23 = 0;
    if (!v17)
      return;
    goto LABEL_15;
  }
  atomic_store(1u, (unsigned int *)v14);
  v18 = (WTF::StringImpl *)*((_QWORD *)v14 + 6);
  *((_QWORD *)v14 + 6) = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2)
      WTF::StringImpl::destroy(v18, v11);
    else
      *(_DWORD *)v18 -= 2;
  }
  v19 = (WTF::StringImpl *)*((_QWORD *)v14 + 5);
  *((_QWORD *)v14 + 5) = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2)
      WTF::StringImpl::destroy(v19, v11);
    else
      *(_DWORD *)v19 -= 2;
  }
  v20 = *((unsigned int *)v14 + 8);
  if ((_DWORD)v20 != -1)
    ((void (*)(WTF::StringImpl **, char *))off_1E9D6C240[v20])(&v22, (char *)v14 + 8);
  *((_DWORD *)v14 + 8) = -1;
  WTF::fastFree(v14, v11);
  v17 = v23;
  v23 = 0;
  if (v17)
  {
LABEL_15:
    if (*(_DWORD *)v17 == 2)
      WTF::StringImpl::destroy(v17, v11);
    else
      *(_DWORD *)v17 -= 2;
  }
}

- (BOOL)_isViewVisible
{
  void *v3;

  v3 = (void *)-[WebView window](self, "window");
  if (v3)
  {
    LODWORD(v3) = objc_msgSend(v3, "isVisible");
    if ((_DWORD)v3)
      LOBYTE(v3) = -[WebView isHiddenOrHasHiddenAncestor](self, "isHiddenOrHasHiddenAncestor") ^ 1;
  }
  return (char)v3;
}

- (void)_updateVisibilityState
{
  WebViewPrivate *v2;

  v2 = self->_private;
  if (v2)
  {
    if (v2->page.m_ptr)
      -[WebView _setIsVisible:](self, "_setIsVisible:", -[WebView _isViewVisible](self, "_isViewVisible"));
  }
}

- (void)_updateActiveState
{
  WebViewPrivate *v2;
  Page *m_ptr;
  WebCore::FocusController *v4;

  v2 = self->_private;
  if (v2)
  {
    m_ptr = v2->page.m_ptr;
    if (m_ptr)
    {
      v4 = (WebCore::FocusController *)*((_QWORD *)m_ptr + 9);
      objc_msgSend((id)-[WebView window](self, "window"), "isKeyWindow");
      WebCore::FocusController::setActive(v4);
    }
  }
}

+ (void)_addUserScriptToGroup:(id)a3 world:(id)a4 source:(id)a5 url:(id)a6 includeMatchPatternStrings:(id)a7 excludeMatchPatternStrings:(id)a8 injectionTime:(int)a9 injectedFrames:(int)a10
{
  StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  WebCore::UserScript *v19;
  StringImpl *v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *v22;
  WebViewGroup *v23;
  uint64_t v24;
  WTF *v25;
  uint64_t v26;
  WTF::StringImpl *v27;
  WTF *v28;
  WTF *v29;
  uint64_t v30;
  WTF::StringImpl *v31;
  WTF *v32;
  WTF *v33;
  void *v34;
  WTF *v35;
  void *v36;
  WTF *v37;
  int v38;
  unsigned int v39;
  WTF *v40;
  int v41;
  unsigned int v42;
  WebCore::UserScript *v43;
  WebViewGroup *v44;
  WTF::StringImpl *v45;
  WTF::StringImpl *v46[5];
  WTF::StringImpl *v47;

  MEMORY[0x1D82A3998](&v45, a3);
  v17 = v45;
  if (v45)
  {
    if (!*((_DWORD *)v45 + 1))
    {
      v45 = 0;
LABEL_46:
      if (*(_DWORD *)v17 == 2)
        WTF::StringImpl::destroy(v17, v16);
      else
        *(_DWORD *)v17 -= 2;
      return;
    }
    MEMORY[0x1D82A3998](v46, a3);
    v40 = 0;
    WebViewGroup::getOrCreate((WebViewGroup *)v46, (const WTF::String *)&v40, &v44);
    v18 = v46[0];
    v46[0] = 0;
    if (v18)
    {
      if (*(_DWORD *)v18 == 2)
      {
        WTF::StringImpl::destroy(v18, v16);
        if (a4)
        {
LABEL_7:
          WTF::makeVector<WTF::String>(a7, (uint64_t)&v40);
          WTF::makeVector<WTF::String>(a8, (uint64_t)&v37);
          v19 = (WebCore::UserScript *)WTF::fastMalloc((WTF *)0x58);
          MEMORY[0x1D82A3998](&v47, a5);
          MEMORY[0x1D82A38F0](v46, a6);
          MEMORY[0x1D82A3CC8](v19, &v47, v46, &v40, &v37, a9 != 0, a10 != 0, 0);
          v43 = v19;
          v21 = v46[0];
          v46[0] = 0;
          if (v21)
          {
            if (*(_DWORD *)v21 == 2)
            {
              WTF::StringImpl::destroy(v21, v20);
              v22 = v47;
              v47 = 0;
              if (!v22)
                goto LABEL_19;
LABEL_17:
              if (*(_DWORD *)v22 == 2)
              {
                WTF::StringImpl::destroy(v22, v20);
                v24 = v39;
                if (!v39)
                {
LABEL_28:
                  v28 = v37;
                  if (v37)
                  {
                    v37 = 0;
                    v38 = 0;
                    WTF::fastFree(v28, v20);
                  }
                  if (v42)
                  {
                    v29 = v40;
                    v30 = 8 * v42;
                    do
                    {
                      v31 = *(WTF::StringImpl **)v29;
                      *(_QWORD *)v29 = 0;
                      if (v31)
                      {
                        if (*(_DWORD *)v31 == 2)
                          WTF::StringImpl::destroy(v31, v20);
                        else
                          *(_DWORD *)v31 -= 2;
                      }
                      v29 = (WTF *)((char *)v29 + 8);
                      v30 -= 8;
                    }
                    while (v30);
                  }
                  v32 = v40;
                  if (v40)
                  {
                    v40 = 0;
                    v41 = 0;
                    WTF::fastFree(v32, v20);
                  }
                  v23 = v44;
                  v43 = 0;
                  WebCore::UserContentController::addUserScript();
                  if (v19)
                  {
                    WebCore::UserScript::~UserScript(v19, v16);
                    WTF::fastFree(v33, v34);
                  }
                  goto LABEL_41;
                }
LABEL_22:
                v25 = v37;
                v26 = 8 * v24;
                do
                {
                  v27 = *(WTF::StringImpl **)v25;
                  *(_QWORD *)v25 = 0;
                  if (v27)
                  {
                    if (*(_DWORD *)v27 == 2)
                      WTF::StringImpl::destroy(v27, v20);
                    else
                      *(_DWORD *)v27 -= 2;
                  }
                  v25 = (WTF *)((char *)v25 + 8);
                  v26 -= 8;
                }
                while (v26);
                goto LABEL_28;
              }
              *(_DWORD *)v22 -= 2;
LABEL_19:
              v24 = v39;
              if (!v39)
                goto LABEL_28;
              goto LABEL_22;
            }
            *(_DWORD *)v21 -= 2;
          }
          v22 = v47;
          v47 = 0;
          if (!v22)
            goto LABEL_19;
          goto LABEL_17;
        }
LABEL_14:
        v23 = v44;
        if (!v44)
        {
LABEL_43:
          v17 = v45;
          v45 = 0;
          if (!v17)
            return;
          goto LABEL_46;
        }
LABEL_41:
        if (*(_DWORD *)v23 == 1)
        {
          WebViewGroup::~WebViewGroup(v23, v16);
          WTF::fastFree(v35, v36);
          v17 = v45;
          v45 = 0;
          if (!v17)
            return;
          goto LABEL_46;
        }
        --*(_DWORD *)v23;
        goto LABEL_43;
      }
      *(_DWORD *)v18 -= 2;
    }
    if (a4)
      goto LABEL_7;
    goto LABEL_14;
  }
}

+ (void)_addUserStyleSheetToGroup:(id)a3 world:(id)a4 source:(id)a5 url:(id)a6 includeMatchPatternStrings:(id)a7 excludeMatchPatternStrings:(id)a8 injectedFrames:(int)a9
{
  StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WebCore::UserScript *v18;
  StringImpl *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  WebViewGroup *v22;
  uint64_t v23;
  WTF *v24;
  uint64_t v25;
  WTF::StringImpl *v26;
  WTF *v27;
  WTF *v28;
  uint64_t v29;
  WTF::StringImpl *v30;
  WTF *v31;
  WTF *v32;
  void *v33;
  WTF *v34;
  void *v35;
  WTF *v36;
  int v37;
  unsigned int v38;
  WTF *v39;
  int v40;
  unsigned int v41;
  WebCore::UserScript *v42;
  WebViewGroup *v43;
  WTF::StringImpl *v44;
  WTF::StringImpl *v45[5];
  WTF::StringImpl *v46;

  MEMORY[0x1D82A3998](&v44, a3);
  v16 = v44;
  if (v44)
  {
    if (!*((_DWORD *)v44 + 1))
    {
      v44 = 0;
LABEL_46:
      if (*(_DWORD *)v16 == 2)
        WTF::StringImpl::destroy(v16, v15);
      else
        *(_DWORD *)v16 -= 2;
      return;
    }
    MEMORY[0x1D82A3998](v45, a3);
    v39 = 0;
    WebViewGroup::getOrCreate((WebViewGroup *)v45, (const WTF::String *)&v39, &v43);
    v17 = v45[0];
    v45[0] = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2)
      {
        WTF::StringImpl::destroy(v17, v15);
        if (a4)
        {
LABEL_7:
          WTF::makeVector<WTF::String>(a7, (uint64_t)&v39);
          WTF::makeVector<WTF::String>(a8, (uint64_t)&v36);
          v18 = (WebCore::UserScript *)WTF::fastMalloc((WTF *)0x68);
          MEMORY[0x1D82A3998](&v46, a5);
          MEMORY[0x1D82A38F0](v45, a6);
          WebCore::UserStyleSheet::UserStyleSheet();
          v42 = v18;
          v20 = v45[0];
          v45[0] = 0;
          if (v20)
          {
            if (*(_DWORD *)v20 == 2)
            {
              WTF::StringImpl::destroy(v20, v19);
              v21 = v46;
              v46 = 0;
              if (!v21)
                goto LABEL_19;
LABEL_17:
              if (*(_DWORD *)v21 == 2)
              {
                WTF::StringImpl::destroy(v21, v19);
                v23 = v38;
                if (!v38)
                {
LABEL_28:
                  v27 = v36;
                  if (v36)
                  {
                    v36 = 0;
                    v37 = 0;
                    WTF::fastFree(v27, v19);
                  }
                  if (v41)
                  {
                    v28 = v39;
                    v29 = 8 * v41;
                    do
                    {
                      v30 = *(WTF::StringImpl **)v28;
                      *(_QWORD *)v28 = 0;
                      if (v30)
                      {
                        if (*(_DWORD *)v30 == 2)
                          WTF::StringImpl::destroy(v30, v19);
                        else
                          *(_DWORD *)v30 -= 2;
                      }
                      v28 = (WTF *)((char *)v28 + 8);
                      v29 -= 8;
                    }
                    while (v29);
                  }
                  v31 = v39;
                  if (v39)
                  {
                    v39 = 0;
                    v40 = 0;
                    WTF::fastFree(v31, v19);
                  }
                  v22 = v43;
                  v42 = 0;
                  WebCore::UserContentController::addUserStyleSheet();
                  if (v18)
                  {
                    WebCore::UserScript::~UserScript(v18, v15);
                    WTF::fastFree(v32, v33);
                  }
                  goto LABEL_41;
                }
LABEL_22:
                v24 = v36;
                v25 = 8 * v23;
                do
                {
                  v26 = *(WTF::StringImpl **)v24;
                  *(_QWORD *)v24 = 0;
                  if (v26)
                  {
                    if (*(_DWORD *)v26 == 2)
                      WTF::StringImpl::destroy(v26, v19);
                    else
                      *(_DWORD *)v26 -= 2;
                  }
                  v24 = (WTF *)((char *)v24 + 8);
                  v25 -= 8;
                }
                while (v25);
                goto LABEL_28;
              }
              *(_DWORD *)v21 -= 2;
LABEL_19:
              v23 = v38;
              if (!v38)
                goto LABEL_28;
              goto LABEL_22;
            }
            *(_DWORD *)v20 -= 2;
          }
          v21 = v46;
          v46 = 0;
          if (!v21)
            goto LABEL_19;
          goto LABEL_17;
        }
LABEL_14:
        v22 = v43;
        if (!v43)
        {
LABEL_43:
          v16 = v44;
          v44 = 0;
          if (!v16)
            return;
          goto LABEL_46;
        }
LABEL_41:
        if (*(_DWORD *)v22 == 1)
        {
          WebViewGroup::~WebViewGroup(v22, v15);
          WTF::fastFree(v34, v35);
          v16 = v44;
          v44 = 0;
          if (!v16)
            return;
          goto LABEL_46;
        }
        --*(_DWORD *)v22;
        goto LABEL_43;
      }
      *(_DWORD *)v17 -= 2;
    }
    if (a4)
      goto LABEL_7;
    goto LABEL_14;
  }
}

+ (void)_removeUserScriptFromGroup:(id)a3 world:(id)a4 url:(id)a5
{
  StringImpl *v7;
  const WTF::StringImpl *v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  int i;
  uint64_t v14;
  WTF *v15;
  uint64_t v16;
  WebCore::UserContentController *v17;
  WebCore::DOMWrapperWorld *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21[5];
  WTF::StringImpl *v22;

  MEMORY[0x1D82A3998](&v22, a3);
  if (v22)
  {
    if (*((_DWORD *)v22 + 1))
    {
      {
        webViewGroups(void)::webViewGroups = 0;
        v20 = v22;
        v22 = 0;
LABEL_21:
        if (*(_DWORD *)v20 == 2)
          WTF::StringImpl::destroy(v20, v7);
        else
          *(_DWORD *)v20 -= 2;
        return;
      }
      v9 = webViewGroups(void)::webViewGroups;
      if (webViewGroups(void)::webViewGroups)
      {
        v10 = *(_DWORD *)(webViewGroups(void)::webViewGroups - 8);
        v11 = *((_DWORD *)v22 + 4);
        v12 = v11 < 0x100 ? WTF::StringImpl::hashSlowCase(v22) : v11 >> 8;
        for (i = 0; ; v12 = i + v14)
        {
          v14 = v12 & v10;
          v15 = *(WTF **)(v9 + 16 * v14);
          if (v15 != (WTF *)-1)
          {
            if (!v15)
              goto LABEL_20;
            if ((WTF::equal(v15, v22, v8) & 1) != 0)
              break;
          }
          ++i;
        }
        if (a4)
        {
          v16 = *(_QWORD *)(v9 + 16 * v14 + 8);
          if (v16)
          {
            v17 = *(WebCore::UserContentController **)(v16 + 40);
            v18 = *(WebCore::DOMWrapperWorld **)(*((_QWORD *)a4 + 1) + 8);
            MEMORY[0x1D82A38F0](v21, a5);
            WebCore::UserContentController::removeUserScript(v17, v18, (const WTF::URL *)v21);
            v19 = v21[0];
            v21[0] = 0;
            if (v19)
            {
              if (*(_DWORD *)v19 != 2)
              {
                *(_DWORD *)v19 -= 2;
                v20 = v22;
                v22 = 0;
                if (!v20)
                  return;
                goto LABEL_21;
              }
              WTF::StringImpl::destroy(v19, v7);
            }
          }
        }
      }
    }
LABEL_20:
    v20 = v22;
    v22 = 0;
    if (!v20)
      return;
    goto LABEL_21;
  }
}

+ (void)_removeUserStyleSheetFromGroup:(id)a3 world:(id)a4 url:(id)a5
{
  StringImpl *v7;
  const WTF::StringImpl *v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  int i;
  uint64_t v14;
  WTF *v15;
  uint64_t v16;
  WebCore::UserContentController *v17;
  WebCore::DOMWrapperWorld *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21[5];
  WTF::StringImpl *v22;

  MEMORY[0x1D82A3998](&v22, a3);
  if (v22)
  {
    if (*((_DWORD *)v22 + 1))
    {
      {
        webViewGroups(void)::webViewGroups = 0;
        v20 = v22;
        v22 = 0;
LABEL_21:
        if (*(_DWORD *)v20 == 2)
          WTF::StringImpl::destroy(v20, v7);
        else
          *(_DWORD *)v20 -= 2;
        return;
      }
      v9 = webViewGroups(void)::webViewGroups;
      if (webViewGroups(void)::webViewGroups)
      {
        v10 = *(_DWORD *)(webViewGroups(void)::webViewGroups - 8);
        v11 = *((_DWORD *)v22 + 4);
        v12 = v11 < 0x100 ? WTF::StringImpl::hashSlowCase(v22) : v11 >> 8;
        for (i = 0; ; v12 = i + v14)
        {
          v14 = v12 & v10;
          v15 = *(WTF **)(v9 + 16 * v14);
          if (v15 != (WTF *)-1)
          {
            if (!v15)
              goto LABEL_20;
            if ((WTF::equal(v15, v22, v8) & 1) != 0)
              break;
          }
          ++i;
        }
        if (a4)
        {
          v16 = *(_QWORD *)(v9 + 16 * v14 + 8);
          if (v16)
          {
            v17 = *(WebCore::UserContentController **)(v16 + 40);
            v18 = *(WebCore::DOMWrapperWorld **)(*((_QWORD *)a4 + 1) + 8);
            MEMORY[0x1D82A38F0](v21, a5);
            WebCore::UserContentController::removeUserStyleSheet(v17, v18, (const WTF::URL *)v21);
            v19 = v21[0];
            v21[0] = 0;
            if (v19)
            {
              if (*(_DWORD *)v19 != 2)
              {
                *(_DWORD *)v19 -= 2;
                v20 = v22;
                v22 = 0;
                if (!v20)
                  return;
                goto LABEL_21;
              }
              WTF::StringImpl::destroy(v19, v7);
            }
          }
        }
      }
    }
LABEL_20:
    v20 = v22;
    v22 = 0;
    if (!v20)
      return;
    goto LABEL_21;
  }
}

+ (void)_removeUserScriptsFromGroup:(id)a3 world:(id)a4
{
  StringImpl *v5;
  const WTF::StringImpl *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  int i;
  uint64_t v12;
  WTF *v13;
  uint64_t v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;

  MEMORY[0x1D82A3998](&v16, a3);
  if (v16)
  {
    if (*((_DWORD *)v16 + 1))
    {
      {
        webViewGroups(void)::webViewGroups = 0;
        v15 = v16;
        v16 = 0;
LABEL_17:
        if (*(_DWORD *)v15 == 2)
          WTF::StringImpl::destroy(v15, v5);
        else
          *(_DWORD *)v15 -= 2;
        return;
      }
      v7 = webViewGroups(void)::webViewGroups;
      if (webViewGroups(void)::webViewGroups)
      {
        v8 = *(_DWORD *)(webViewGroups(void)::webViewGroups - 8);
        v9 = *((_DWORD *)v16 + 4);
        if (v9 < 0x100)
          v10 = WTF::StringImpl::hashSlowCase(v16);
        else
          v10 = v9 >> 8;
        for (i = 0; ; v10 = i + v12)
        {
          v12 = v10 & v8;
          v13 = *(WTF **)(v7 + 16 * v12);
          if (v13 != (WTF *)-1)
          {
            if (!v13)
              goto LABEL_16;
            if ((WTF::equal(v13, v16, v6) & 1) != 0)
              break;
          }
          ++i;
        }
        if (a4)
        {
          v14 = *(_QWORD *)(v7 + 16 * v12 + 8);
          if (v14)
            WebCore::UserContentController::removeUserScripts(*(WebCore::UserContentController **)(v14 + 40), *(WebCore::DOMWrapperWorld **)(*((_QWORD *)a4 + 1) + 8));
        }
      }
    }
LABEL_16:
    v15 = v16;
    v16 = 0;
    if (!v15)
      return;
    goto LABEL_17;
  }
}

+ (void)_removeUserStyleSheetsFromGroup:(id)a3 world:(id)a4
{
  StringImpl *v5;
  const WTF::StringImpl *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  int i;
  uint64_t v12;
  WTF *v13;
  uint64_t v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;

  MEMORY[0x1D82A3998](&v16, a3);
  if (v16)
  {
    if (*((_DWORD *)v16 + 1))
    {
      {
        webViewGroups(void)::webViewGroups = 0;
        v15 = v16;
        v16 = 0;
LABEL_17:
        if (*(_DWORD *)v15 == 2)
          WTF::StringImpl::destroy(v15, v5);
        else
          *(_DWORD *)v15 -= 2;
        return;
      }
      v7 = webViewGroups(void)::webViewGroups;
      if (webViewGroups(void)::webViewGroups)
      {
        v8 = *(_DWORD *)(webViewGroups(void)::webViewGroups - 8);
        v9 = *((_DWORD *)v16 + 4);
        if (v9 < 0x100)
          v10 = WTF::StringImpl::hashSlowCase(v16);
        else
          v10 = v9 >> 8;
        for (i = 0; ; v10 = i + v12)
        {
          v12 = v10 & v8;
          v13 = *(WTF **)(v7 + 16 * v12);
          if (v13 != (WTF *)-1)
          {
            if (!v13)
              goto LABEL_16;
            if ((WTF::equal(v13, v16, v6) & 1) != 0)
              break;
          }
          ++i;
        }
        if (a4)
        {
          v14 = *(_QWORD *)(v7 + 16 * v12 + 8);
          if (v14)
            WebCore::UserContentController::removeUserStyleSheets(*(WebCore::UserContentController **)(v14 + 40), *(WebCore::DOMWrapperWorld **)(*((_QWORD *)a4 + 1) + 8));
        }
      }
    }
LABEL_16:
    v15 = v16;
    v16 = 0;
    if (!v15)
      return;
    goto LABEL_17;
  }
}

+ (void)_removeAllUserContentFromGroup:(id)a3
{
  StringImpl *v3;
  const WTF::StringImpl *v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int i;
  uint64_t v10;
  WTF *v11;
  uint64_t v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;

  MEMORY[0x1D82A3998](&v14, a3);
  if (v14)
  {
    if (*((_DWORD *)v14 + 1))
    {
      {
        webViewGroups(void)::webViewGroups = 0;
        v13 = v14;
        v14 = 0;
LABEL_16:
        if (*(_DWORD *)v13 == 2)
          WTF::StringImpl::destroy(v13, v3);
        else
          *(_DWORD *)v13 -= 2;
        return;
      }
      v5 = webViewGroups(void)::webViewGroups;
      if (webViewGroups(void)::webViewGroups)
      {
        v6 = *(_DWORD *)(webViewGroups(void)::webViewGroups - 8);
        v7 = *((_DWORD *)v14 + 4);
        if (v7 < 0x100)
          v8 = WTF::StringImpl::hashSlowCase(v14);
        else
          v8 = v7 >> 8;
        for (i = 0; ; v8 = i + v10)
        {
          v10 = v8 & v6;
          v11 = *(WTF **)(v5 + 16 * v10);
          if (v11 != (WTF *)-1)
          {
            if (!v11)
              goto LABEL_15;
            if ((WTF::equal(v11, v14, v4) & 1) != 0)
              break;
          }
          ++i;
        }
        v12 = *(_QWORD *)(v5 + 16 * v10 + 8);
        if (v12)
          WebCore::UserContentController::removeAllUserContent(*(WebCore::UserContentController **)(v12 + 40));
      }
    }
LABEL_15:
    v13 = v14;
    v14 = 0;
    if (!v13)
      return;
    goto LABEL_16;
  }
}

- (void)_forceRepaintForTesting
{
  -[WebView _updateRendering](self, "_updateRendering");
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  objc_msgSend(MEMORY[0x1E0CD28B0], "synchronize");
}

+ (void)_setDomainRelaxationForbidden:(BOOL)a3 forURLScheme:(id)a4
{
  _BOOL8 v4;
  const WTF::String *v5;
  StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;

  v4 = a3;
  MEMORY[0x1D82A3998](&v8, a4);
  WebCore::LegacySchemeRegistry::setDomainRelaxationForbiddenForURLScheme((WebCore::LegacySchemeRegistry *)v4, (uint64_t)&v8, v5);
  v7 = v8;
  v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v6);
    else
      *(_DWORD *)v7 -= 2;
  }
}

+ (void)_registerURLSchemeAsSecure:(id)a3
{
  const WTF::String *v3;
  StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  MEMORY[0x1D82A3998](&v6, a3);
  WebCore::LegacySchemeRegistry::registerURLSchemeAsSecure((WebCore::LegacySchemeRegistry *)&v6, v3);
  v5 = v6;
  v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
}

+ (void)_registerURLSchemeAsAllowingDatabaseAccessInPrivateBrowsing:(id)a3
{
  const WTF::String *v3;
  StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  MEMORY[0x1D82A3998](&v6, a3);
  WebCore::LegacySchemeRegistry::registerURLSchemeAsAllowingDatabaseAccessInPrivateBrowsing((WebCore::LegacySchemeRegistry *)&v6, v3);
  v5 = v6;
  v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
}

- (void)_scaleWebView:(float)a3 atOrigin:(CGPoint)a4
{
  Page *m_ptr;
  IntPoint v7;
  CGPoint v8;

  v8 = a4;
  -[WebView hideFormValidationMessage](self, "hideFormValidationMessage");
  m_ptr = self->_private->page.m_ptr;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v7, &v8);
  WebCore::Page::setPageScaleFactor((WebCore::Page *)m_ptr, a3, &v7);
}

- (float)_viewScaleFactor
{
  return *((float *)self->_private->page.m_ptr + 89);
}

- (void)_setUseFixedLayout:(BOOL)a3
{
  WebCore::ScrollView **v4;

  v4 = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
  if (v4 && v4[36])
  {
    WebCore::ScrollView::setUseFixedLayout(v4[36]);
    if (!a3)
      WebCore::ScrollView::setFixedLayoutSize();
  }
}

- (BOOL)_useFixedLayout
{
  _QWORD *v2;
  WebCore::ScrollView *v3;

  v2 = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
  if (v2 && (v3 = (WebCore::ScrollView *)v2[36]) != 0)
    return WebCore::ScrollView::useFixedLayout(v3);
  else
    return 0;
}

- (void)_setPaginationMode:(int)a3
{
  uint64_t v4;

  if (self)
  {
    -[WebView page](self, "page");
    if (v4)
    {
      switch(a3)
      {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
          WebCore::Page::setPagination();
          break;
        default:
          return;
      }
    }
  }
}

- (int)_paginationMode
{
  unsigned int v2;
  uint64_t v4;

  if (self)
  {
    -[WebView page](self, "page");
    if (v4 && (v2 = (*(_BYTE *)(v4 + 468) - 1), v2 <= 3))
      LODWORD(self) = v2 + 1;
    else
      LODWORD(self) = 0;
  }
  return (int)self;
}

- (void)_listenForLayoutMilestones:(unint64_t)a3
{
  uint64_t v3;

  if (self)
  {
    -[WebView page](self, "page");
    if (v3)
      WebCore::Page::addLayoutMilestones();
  }
}

- (unint64_t)_layoutMilestones
{
  uint64_t v2;

  if (self)
  {
    objc_msgSend((id)self, "page");
    if (v2)
      return *(_WORD *)(v2 + 660) & 7;
    else
      return 0;
  }
  return self;
}

- (int)_visibilityState
{
  Page *m_ptr;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
    LODWORD(m_ptr) = WebCore::Page::visibilityState((WebCore::Page *)m_ptr) ^ 1;
  return (int)m_ptr;
}

- (void)_setIsVisible:(BOOL)a3
{
  Page *m_ptr;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
    WebCore::Page::setIsVisible((WebCore::Page *)m_ptr);
}

- (void)_setVisibilityState:(int)a3 isInitialState:(BOOL)a4
{
  Page *m_ptr;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    WebCore::Page::setIsVisible((WebCore::Page *)m_ptr);
    if (a3 == 2)
      WebCore::Page::setIsPrerender((WebCore::Page *)self->_private->page.m_ptr);
  }
}

- (void)_setPaginationBehavesLikeColumns:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  int v6;

  if (self)
  {
    -[WebView page](self, "page");
    v4 = v5;
    if (v5)
    {
      v5 = *(_QWORD *)(v5 + 468);
      v6 = *(_DWORD *)(v4 + 476);
      BYTE1(v5) = a3;
      WebCore::Page::setPagination();
    }
  }
}

- (BOOL)_paginationBehavesLikeColumns
{
  uint64_t v3;

  if (self)
  {
    -[WebView page](self, "page");
    if (v3)
      LOBYTE(self) = *(_BYTE *)(v3 + 469) != 0;
    else
      LOBYTE(self) = 0;
  }
  return (char)self;
}

- (void)_setPageLength:(double)a3
{
  uint64_t v3;

  if (self)
  {
    -[WebView page](self, "page");
    if (v3)
      WebCore::Page::setPagination();
  }
}

- (double)_pageLength
{
  unint64_t v2;
  uint64_t v4;

  if (!self)
    return 1.0;
  -[WebView page](self, "page");
  if (!v4)
    return 1.0;
  LODWORD(v2) = *(_DWORD *)(v4 + 472);
  return (double)v2;
}

- (void)_setGapBetweenPages:(double)a3
{
  uint64_t v3;

  if (self)
  {
    -[WebView page](self, "page");
    if (v3)
      WebCore::Page::setPagination();
  }
}

- (double)_gapBetweenPages
{
  unint64_t v2;
  uint64_t v4;

  if (!self)
    return 0.0;
  -[WebView page](self, "page");
  if (!v4)
    return 0.0;
  LODWORD(v2) = *(_DWORD *)(v4 + 476);
  return (double)v2;
}

- (BOOL)_paginationLineGridEnabled
{
  return 0;
}

- (unint64_t)_pageCount
{
  WebCore::Page *v2;

  if (self)
  {
    objc_msgSend((id)self, "page");
    self = (unint64_t)v2;
    if (v2)
      return WebCore::Page::pageCount(v2);
  }
  return self;
}

- (unint64_t)markAllMatchesForText:(id)a3 caseSensitive:(BOOL)a4 highlight:(BOOL)a5 limit:(unint64_t)a6
{
  return -[WebView countMatchesForText:options:highlight:limit:markMatches:](self, "countMatchesForText:options:highlight:limit:markMatches:", a3, !a4, a5, a6, 1);
}

- (unint64_t)countMatchesForText:(id)a3 caseSensitive:(BOOL)a4 highlight:(BOOL)a5 limit:(unint64_t)a6 markMatches:(BOOL)a7
{
  return -[WebView countMatchesForText:options:highlight:limit:markMatches:](self, "countMatchesForText:options:highlight:limit:markMatches:", a3, !a4, a5, a6, a7);
}

- (BOOL)searchFor:(id)a3 direction:(BOOL)a4 caseSensitive:(BOOL)a5 wrap:(BOOL)a6 startInSelection:(BOOL)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 8;
  if (a4)
    v7 = 0;
  v8 = 16;
  if (!a6)
    v8 = 0;
  v9 = v7 | v8 | !a5;
  v10 = 32;
  if (!a7)
    v10 = 0;
  return -[WebView findString:options:](self, "findString:options:", a3, v9 | v10);
}

+ (void)_setLoadResourcesSerially:(BOOL)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  WebCore *v7;
  uint64_t v8;

  if (WebPlatformStrategies::initializeIfNecessary(void)::platformStrategies)
  {
    v4 = (_QWORD *)WebCore::platformStrategies((WebCore *)a1);
    v5 = v4[1];
    if (v5)
    {
LABEL_3:
      *(_BYTE *)(v5 + 84) = a3;
      return;
    }
  }
  else
  {
    v6 = operator new();
    *(_OWORD *)(v6 + 8) = 0u;
    *(_OWORD *)(v6 + 24) = 0u;
    *(_OWORD *)(v6 + 40) = 0u;
    *(_QWORD *)v6 = &off_1E9D6E318;
    *(_QWORD *)(v6 + 56) = &unk_1E9D6E458;
    WebPlatformStrategies::initializeIfNecessary(void)::platformStrategies = v6;
    v7 = (WebCore *)WebCore::setPlatformStrategies();
    v4 = (_QWORD *)WebCore::platformStrategies(v7);
    v5 = v4[1];
    if (v5)
      goto LABEL_3;
  }
  v8 = (*(uint64_t (**)(_QWORD *))(*v4 + 16))(v4);
  v4[1] = v8;
  *(_BYTE *)(v8 + 84) = a3;
}

+ (void)_setHTTPPipeliningEnabled:(BOOL)a3
{
  WebCore::ResourceRequest::setHTTPPipeliningEnabled((WebCore::ResourceRequest *)a3);
}

- (void)_setPortsForUpgradingInsecureSchemeForTesting:(unsigned __int16)a3 withSecurePort:(unsigned __int16)a4
{
  WebCore::Page *v4;

  if (self)
  {
    -[WebView page](self, "page");
    if (v4)
      WebCore::Page::setPortsForUpgradingInsecureSchemeForTesting(v4);
  }
}

- (void)_didScrollDocumentInFrameView:(id)a3
{
  -[WebView hideFormValidationMessage](self, "hideFormValidationMessage");
  objc_msgSend(-[WebView _UIDelegateForwarder](self, "_UIDelegateForwarder"), "webView:didScrollDocumentInFrameView:", self, a3);
}

- (id)_fixedPositionContent
{
  WebViewPrivate *v2;

  v2 = self->_private;
  if (v2)
    return v2->_fixedPositionContent.m_ptr;
  else
    return 0;
}

- (void)_documentScaleChanged
{
  id v3;
  void *m_ptr;

  v3 = -[WebView currentNodeHighlight](self, "currentNodeHighlight");
  if (v3)
    objc_msgSend(v3, "setNeedsDisplay");
  m_ptr = self->_private->indicateLayer.m_ptr;
  if (m_ptr)
  {
    objc_msgSend(m_ptr, "setNeedsLayout");
    objc_msgSend(self->_private->indicateLayer.m_ptr, "setNeedsDisplay");
  }
}

- (BOOL)_wantsTelephoneNumberParsing
{
  Page *m_ptr;
  _BOOL8 v3;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
    return (*(_QWORD *)(*((_QWORD *)m_ptr + 14) + 696) >> 49) & 1;
  else
    LOBYTE(v3) = 0;
  return v3;
}

- (void)_setWantsTelephoneNumberParsing:(BOOL)a3
{
  Page *m_ptr;
  uint64_t v4;
  uint64_t v5;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    v4 = *((_QWORD *)m_ptr + 14);
    v5 = 0x2000000000000;
    if (!a3)
      v5 = 0;
    *(_QWORD *)(v4 + 696) = *(_QWORD *)(v4 + 696) & 0xFFFDFFFFFFFFFFFFLL | v5;
  }
}

- (BOOL)_webGLEnabled
{
  Page *m_ptr;
  _BOOL8 v3;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
    return (*(_QWORD *)(*((_QWORD *)m_ptr + 14) + 704) >> 21) & 1;
  else
    LOBYTE(v3) = 0;
  return v3;
}

- (void)_setWebGLEnabled:(BOOL)a3
{
  Page *m_ptr;
  uint64_t v4;
  uint64_t v5;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    v4 = *((_QWORD *)m_ptr + 14);
    v5 = 0x200000;
    if (!a3)
      v5 = 0;
    *(_QWORD *)(v4 + 704) = *(_QWORD *)(v4 + 704) & 0xFFFFFFFFFFDFFFFFLL | v5;
  }
}

+ (void)_setTileCacheLayerPoolCapacity:(unsigned int)a3
{
  WebCore::LegacyTileCache::setLayerPoolCapacity(*(WebCore::LegacyTileCache **)&a3);
}

- (void)_setUnobscuredSafeAreaInsets:(WebEdgeInsets)a3
{
  Page *m_ptr;
  WTF *v4;
  void *v5;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    ++*(_DWORD *)m_ptr;
    WebCore::Page::setUnobscuredSafeAreaInsets();
    if (*(_DWORD *)m_ptr == 1)
    {
      v4 = (WTF *)MEMORY[0x1D82A65B4](m_ptr);
      WTF::fastFree(v4, v5);
    }
    else
    {
      --*(_DWORD *)m_ptr;
    }
  }
}

- (WebEdgeInsets)_unobscuredSafeAreaInsets
{
  Page *m_ptr;
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  WTF *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  WebEdgeInsets result;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    v3 = (*(_DWORD *)m_ptr)++;
    v4 = *((float *)m_ptr + 102);
    v5 = *((float *)m_ptr + 105);
    v6 = *((float *)m_ptr + 104);
    v7 = *((float *)m_ptr + 103);
    if (v3)
    {
      *(_DWORD *)m_ptr = v3;
    }
    else
    {
      v8 = (WTF *)MEMORY[0x1D82A65B4]();
      WTF::fastFree(v8, v9);
    }
  }
  else
  {
    v4 = 0.0;
    v5 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
  }
  v10 = v4;
  v11 = v5;
  v12 = v6;
  v13 = v7;
  result.var3 = v13;
  result.var2 = v12;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (void)_setUseSystemAppearance:(BOOL)a3
{
  WebViewPrivate *v3;
  WebCore::Page *m_ptr;

  v3 = self->_private;
  if (v3)
  {
    m_ptr = (WebCore::Page *)v3->page.m_ptr;
    if (m_ptr)
      WebCore::Page::setUseSystemAppearance(m_ptr);
  }
}

- (BOOL)_useSystemAppearance
{
  Page *m_ptr;

  m_ptr = self->_private->page.m_ptr;
  return m_ptr && *((_BYTE *)m_ptr + 450) != 0;
}

- (void)_setSourceApplicationAuditData:(id)a3
{
  uint64_t v4;
  WebViewPrivate *v5;
  void *m_ptr;

  if (self->_private->sourceApplicationAuditData.m_ptr != a3)
  {
    v4 = objc_msgSend(a3, "copy");
    v5 = self->_private;
    m_ptr = v5->sourceApplicationAuditData.m_ptr;
    v5->sourceApplicationAuditData.m_ptr = (void *)v4;
    if (m_ptr)
      CFRelease(m_ptr);
  }
}

- (NSData)_sourceApplicationAuditData
{
  return (NSData *)self->_private->sourceApplicationAuditData.m_ptr;
}

- (void)_setFontFallbackPrefersPictographs:(BOOL)a3
{
  Page *m_ptr;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
    WebCore::Settings::setFontFallbackPrefersPictographs(*((WebCore::Settings **)m_ptr + 14));
}

- (BOOL)shouldRequestCandidates
{
  return 0;
}

+ (void)initialize
{
  void *v3;
  void *v4;

  if ((byte_1ECEC97E2 & 1) == 0)
  {
    byte_1ECEC97E2 = 1;
    WTF::allPrivileges((WTF *)a1);
    WTF::setProcessPrivileges();
    WebCore::NetworkStorageSession::permitProcessToUseCookieAPI((WebCore::NetworkStorageSession *)1);
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel__cacheModelChangedNotification_, WebPreferencesCacheModelChangedInternalNotification, 0);
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v4, "addObserver:selector:name:object:", a1, sel__preferencesRemovedNotification_, WebPreferencesRemovedNotification[0], 0);
    byte_1ECEC97E3 = 0;
  }
}

+ (BOOL)_canShowMIMEType:(id)a3 allowingPlugins:(BOOL)a4
{
  return objc_msgSend(a1, "_viewClass:andRepresentationClass:forMIMEType:allowingPlugins:", 0, 0, a3, a4);
}

+ (BOOL)canShowMIMEType:(NSString *)MIMEType
{
  return objc_msgSend(a1, "_canShowMIMEType:allowingPlugins:", MIMEType, 1);
}

- (BOOL)_canShowMIMEType:(id)a3
{
  return objc_msgSend((id)objc_opt_class(), "_canShowMIMEType:allowingPlugins:", a3, 0);
}

- (id)_pluginForMIMEType:(id)a3
{
  return 0;
}

- (id)_pluginForExtension:(id)a3
{
  return 0;
}

- (BOOL)_isMIMETypeRegisteredAsPlugin:(id)a3
{
  return 0;
}

+ (BOOL)canShowMIMETypeAsHTML:(NSString *)MIMEType
{
  return -[NSString isEqualToString:](MIMEType, "isEqualToString:", CFSTR("text/html"))
      || +[WebFrameView _canShowMIMETypeAsHTML:](WebFrameView, "_canShowMIMETypeAsHTML:", MIMEType);
}

+ (NSArray)MIMETypesShownAsHTML
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v2 = +[WebFrameView _viewTypesAllowImageTypeOmission:](WebFrameView, "_viewTypesAllowImageTypeOmission:", 1);
  v3 = (void *)objc_msgSend(v2, "keyEnumerator");
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  while (1)
  {
    v5 = objc_msgSend(v3, "nextObject");
    if (!v5)
      break;
    v6 = objc_msgSend(v2, "objectForKey:", v5);
    if (v6 == objc_opt_class())
      objc_msgSend(v4, "addObject:", v5);
  }
  return (NSArray *)(id)CFMakeCollectable(v4);
}

+ (void)setMIMETypesShownAsHTML:(NSArray *)MIMETypes
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = (void *)objc_msgSend(+[WebFrameView _viewTypesAllowImageTypeOmission:](WebFrameView, "_viewTypesAllowImageTypeOmission:", 1), "copy");
  v5 = (void *)objc_msgSend(v4, "keyEnumerator");
  while (1)
  {
    v6 = objc_msgSend(v5, "nextObject");
    if (!v6)
      break;
    v7 = objc_msgSend(v4, "objectForKey:", v6);
    if (v7 == objc_opt_class())
      +[WebView _unregisterViewClassAndRepresentationClassForMIMEType:](WebView, "_unregisterViewClassAndRepresentationClassForMIMEType:", v6);
  }
  v8 = -[NSArray count](MIMETypes, "count");
  if (v8 >= 1)
  {
    v9 = 0;
    v10 = v8;
    do
    {
      v11 = objc_opt_class();
      +[WebView registerViewClass:representationClass:forMIMEType:](WebView, "registerViewClass:representationClass:forMIMEType:", v11, objc_opt_class(), -[NSArray objectAtIndex:](MIMETypes, "objectAtIndex:", v9++));
    }
    while (v10 != v9);
  }
  if (v4)
    CFRelease(v4);
}

+ (void)registerURLSchemeAsLocal:(NSString *)scheme
{
  const WTF::String *v3;
  StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  MEMORY[0x1D82A3998](&v6, scheme);
  WebCore::LegacySchemeRegistry::registerURLSchemeAsLocal((WebCore::LegacySchemeRegistry *)&v6, v3);
  v5 = v6;
  v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
}

- (id)_initWithArguments:(id)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("frame"));
  if (v5)
  {
    objc_msgSend(v5, "rectValue");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v7 = *MEMORY[0x1E0CB3438];
    v9 = *(double *)(MEMORY[0x1E0CB3438] + 8);
    v11 = *(double *)(MEMORY[0x1E0CB3438] + 16);
    v13 = *(double *)(MEMORY[0x1E0CB3438] + 24);
  }
  return -[WebView initWithFrame:frameName:groupName:](self, "initWithFrame:frameName:groupName:", objc_msgSend(a3, "objectForKey:", CFSTR("frameName")), objc_msgSend(a3, "objectForKey:", CFSTR("groupName")), v7, v9, v11, v13);
}

- (WebView)initWithFrame:(CGRect)a3
{
  return -[WebView initWithFrame:frameName:groupName:](self, "initWithFrame:frameName:groupName:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  WebViewPrivate *v5;
  objc_super v6;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    v4 = (void *)MEMORY[0x1D82A8E64]();
    v5 = self->_private;
    if (v5)
      -[WebGeolocationProvider stopTrackingWebView:](v5->_geolocationProvider, "stopTrackingWebView:", self);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
    -[WebView close](self, "close");
    if (objc_msgSend((id)objc_opt_class(), "shouldIncludeInWebKitStatistics"))
      --WebViewCount;

    self->_private = 0;
    objc_autoreleasePoolPop(v4);
    v6.receiver = self;
    v6.super_class = (Class)WebView;
    -[WebView dealloc](&v6, sel_dealloc);
  }
}

- (void)close
{
  WebViewRenderingUpdateScheduler *value;
  void *v4;
  WebViewPrivate *v5;
  WTF *v6;

  -[WebView _close](self, "_close");
  value = self->_private->renderingUpdateScheduler.__ptr_.__value_;
  if (value)
  {
    *((_QWORD *)value + 2) = 0;
    WebCore::RunLoopObserver::invalidate(*((WebCore::RunLoopObserver **)value + 3));
    WebCore::RunLoopObserver::invalidate(*((WebCore::RunLoopObserver **)value + 4));
    v5 = self->_private;
    v6 = (WTF *)v5->renderingUpdateScheduler.__ptr_.__value_;
    v5->renderingUpdateScheduler.__ptr_.__value_ = 0;
    if (v6)
      WebViewRenderingUpdateScheduler::operator delete(v6, v4);
  }
}

- (void)setShouldCloseWithWindow:(BOOL)shouldCloseWithWindow
{
  self->_private->shouldCloseWithWindow = shouldCloseWithWindow;
}

- (BOOL)shouldCloseWithWindow
{
  return self->_private->shouldCloseWithWindow;
}

- (void)viewDidMoveToWindow
{
  WebViewPrivate *v2;
  uint64_t v4;
  WebViewPrivate *v5;
  WebPreferences *v6;
  uint64_t v7;
  WebCore::LegacyTileCache *v8;

  v2 = self->_private;
  if (v2 && !v2->closed)
  {
    v4 = -[WebView window](self, "window");
    v5 = self->_private;
    if (v4)
    {
      WebCore::Page::setCanStartMedia((WebCore::Page *)v5->page.m_ptr);
      WebCore::Page::setIsInWindow((WebCore::Page *)self->_private->page.m_ptr);
      v6 = -[WebView preferences](self, "preferences");
      v7 = objc_msgSend((id)-[WebView window](self, "window"), "tileCache");
      if (v7)
      {
        v8 = (WebCore::LegacyTileCache *)v7;
        -[WebPreferences showDebugBorders](v6, "showDebugBorders");
        WebCore::LegacyTileCache::setTileBordersVisible(v8);
        -[WebPreferences showRepaintCounter](v6, "showRepaintCounter");
        WebCore::LegacyTileCache::setTilePaintCountersVisible(v8);
        *((_BYTE *)v8 + 66) = -[WebPreferences acceleratedDrawingEnabled](v6, "acceleratedDrawingEnabled");
      }
    }
    else
    {
      objc_msgSend(v5->fullscreenController.m_ptr, "requestHideAndExitFullscreen");
    }
    -[WebView _updateActiveState](self, "_updateActiveState");
    -[WebView _updateVisibilityState](self, "_updateVisibilityState");
  }
}

- (void)_wakWindowVisibilityChanged:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "object");
  if (v4 == -[WebView window](self, "window"))
    -[WebView _updateVisibilityState](self, "_updateVisibilityState");
}

- (void)_updateScreenScaleFromWindow
{
  void *v3;
  UIScreen *v4;
  double v5;
  float v6;

  v3 = (void *)-[WebView window](self, "window");
  if (v3)
  {
    objc_msgSend(v3, "screenScale");
    v6 = v5;
  }
  else
  {
    WebCore::screenScaleFactor(0, v4);
  }
  WebCore::Page::setDeviceScaleFactor((WebCore::Page *)self->_private->page.m_ptr, v6);
}

- (void)setPreferences:(WebPreferences *)preferences
{
  WebPreferences *v3;
  WebViewPrivate *v5;
  void *m_ptr;
  void *v7;
  WebViewPrivate *v8;
  void *v9;
  void *v10;

  v3 = preferences;
  if (preferences)
  {
    if (self->_private->preferences.m_ptr == preferences)
      return;
  }
  else
  {
    v3 = +[WebPreferences standardPreferences](WebPreferences, "standardPreferences");
    if (self->_private->preferences.m_ptr == v3)
      return;
  }
  -[WebPreferences willAddToWebView](v3, "willAddToWebView");
  v5 = self->_private;
  m_ptr = v5->preferences.m_ptr;
  v5->preferences.m_ptr = 0;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v7, "removeObserver:name:object:", self, WebPreferencesChangedInternalNotification[0], -[WebView preferences](self, "preferences"));
  +[WebPreferences _removeReferenceForIdentifier:](WebPreferences, "_removeReferenceForIdentifier:", objc_msgSend(m_ptr, "identifier"));
  v8 = self->_private;
  if (v3)
    CFRetain(v3);
  v9 = v8->preferences.m_ptr;
  v8->preferences.m_ptr = v3;
  if (v9)
    CFRelease(v9);
  v10 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__preferencesChangedNotification_, WebPreferencesChangedInternalNotification[0], -[WebView preferences](self, "preferences"));
  -[WebView _preferencesChanged:](self, "_preferencesChanged:", -[WebView preferences](self, "preferences"));
  -[WebPreferences _postPreferencesChangedAPINotification](-[WebView preferences](self, "preferences"), "_postPreferencesChangedAPINotification");
  objc_msgSend(m_ptr, "didRemoveFromWebView");
  if (m_ptr)
    CFRelease(m_ptr);
}

- (WebPreferences)preferences
{
  return (WebPreferences *)self->_private->preferences.m_ptr;
}

- (void)setPreferencesIdentifier:(NSString *)preferencesIdentifier
{
  WebPreferences *v5;

  if (!self->_private->closed
    && (-[NSString isEqual:](preferencesIdentifier, "isEqual:", -[WebPreferences identifier](-[WebView preferences](self, "preferences"), "identifier")) & 1) == 0)
  {
    v5 = -[WebPreferences initWithIdentifier:]([WebPreferences alloc], "initWithIdentifier:", preferencesIdentifier);
    -[WebView setPreferences:](self, "setPreferences:", v5);
    if (v5)
      CFRelease(v5);
  }
}

- (NSString)preferencesIdentifier
{
  return -[WebPreferences identifier](-[WebView preferences](self, "preferences"), "identifier");
}

- (void)setUIDelegate:(id)UIDelegate
{
  WebViewPrivate *v4;
  void *m_ptr;

  self->_private->UIDelegate = UIDelegate;
  objc_msgSend(self->_private->UIDelegateForwarder.m_ptr, "clearTarget");
  v4 = self->_private;
  m_ptr = v4->UIDelegateForwarder.m_ptr;
  v4->UIDelegateForwarder.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id)UIDelegate
{
  return self->_private->UIDelegate;
}

- (id)_resourceLoadDelegateForwarder
{
  WebViewPrivate *v2;
  _WebSafeForwarder *v5;
  WebViewPrivate *v6;
  void *m_ptr;

  v2 = self->_private;
  if (v2->closing)
    return 0;
  if (v2->resourceProgressDelegateForwarder.m_ptr)
    return self->_private->resourceProgressDelegateForwarder.m_ptr;
  v5 = -[_WebSafeForwarder initWithTarget:defaultTarget:]([_WebSafeForwarder alloc], "initWithTarget:defaultTarget:", -[WebView resourceLoadDelegate](self, "resourceLoadDelegate"), +[WebDefaultResourceLoadDelegate sharedResourceLoadDelegate](WebDefaultResourceLoadDelegate, "sharedResourceLoadDelegate"));
  v6 = self->_private;
  m_ptr = v6->resourceProgressDelegateForwarder.m_ptr;
  v6->resourceProgressDelegateForwarder.m_ptr = v5;
  if (!m_ptr)
    return self->_private->resourceProgressDelegateForwarder.m_ptr;
  CFRelease(m_ptr);
  return self->_private->resourceProgressDelegateForwarder.m_ptr;
}

- (void)setResourceLoadDelegate:(id)resourceLoadDelegate
{
  WebViewPrivate *v5;
  void *m_ptr;

  objc_msgSend(self->_private->resourceProgressDelegateForwarder.m_ptr, "clearTarget");
  v5 = self->_private;
  m_ptr = v5->resourceProgressDelegateForwarder.m_ptr;
  v5->resourceProgressDelegateForwarder.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  self->_private->resourceProgressDelegate = resourceLoadDelegate;
  -[WebView _cacheResourceLoadDelegateImplementations](self, "_cacheResourceLoadDelegateImplementations");
}

- (id)resourceLoadDelegate
{
  return self->_private->resourceProgressDelegate;
}

- (void)setDownloadDelegate:(id)downloadDelegate
{
  self->_private->downloadDelegate = downloadDelegate;
}

- (id)downloadDelegate
{
  return self->_private->downloadDelegate;
}

- (void)setPolicyDelegate:(id)policyDelegate
{
  WebViewPrivate *v4;
  void *m_ptr;

  self->_private->policyDelegate = policyDelegate;
  objc_msgSend(self->_private->policyDelegateForwarder.m_ptr, "clearTarget");
  v4 = self->_private;
  m_ptr = v4->policyDelegateForwarder.m_ptr;
  v4->policyDelegateForwarder.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id)policyDelegate
{
  return self->_private->policyDelegate;
}

- (id)_frameLoadDelegateForwarder
{
  WebViewPrivate *v2;
  _WebSafeForwarder *v5;
  WebViewPrivate *v6;
  void *m_ptr;

  v2 = self->_private;
  if (v2->closing)
    return 0;
  if (v2->frameLoadDelegateForwarder.m_ptr)
    return self->_private->frameLoadDelegateForwarder.m_ptr;
  v5 = -[_WebSafeForwarder initWithTarget:defaultTarget:]([_WebSafeForwarder alloc], "initWithTarget:defaultTarget:", -[WebView frameLoadDelegate](self, "frameLoadDelegate"), +[WebDefaultFrameLoadDelegate sharedFrameLoadDelegate](WebDefaultFrameLoadDelegate, "sharedFrameLoadDelegate"));
  v6 = self->_private;
  m_ptr = v6->frameLoadDelegateForwarder.m_ptr;
  v6->frameLoadDelegateForwarder.m_ptr = v5;
  if (!m_ptr)
    return self->_private->frameLoadDelegateForwarder.m_ptr;
  CFRelease(m_ptr);
  return self->_private->frameLoadDelegateForwarder.m_ptr;
}

- (void)setFrameLoadDelegate:(id)frameLoadDelegate
{
  WebViewPrivate *v5;
  void *m_ptr;

  objc_msgSend(self->_private->frameLoadDelegateForwarder.m_ptr, "clearTarget");
  v5 = self->_private;
  m_ptr = v5->frameLoadDelegateForwarder.m_ptr;
  v5->frameLoadDelegateForwarder.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  self->_private->frameLoadDelegate = frameLoadDelegate;
  -[WebView _cacheFrameLoadDelegateImplementations](self, "_cacheFrameLoadDelegateImplementations");
}

- (id)frameLoadDelegate
{
  return self->_private->frameLoadDelegate;
}

- (WebFrame)mainFrame
{
  WebViewPrivate *v2;
  Page *m_ptr;
  uint64_t v4;
  BOOL v5;
  WebFrame **v6;

  v2 = self->_private;
  if (v2
    && (m_ptr = v2->page.m_ptr) != 0
    && ((v4 = *((_QWORD *)m_ptr + 20)) != 0 ? (v5 = *(_BYTE *)(v4 + 144) == 0) : (v5 = 0),
        v5
     && (v6 = *(WebFrame ***)(*(_QWORD *)(v4 + 280) + 16),
         (((uint64_t (*)(WebFrame **, SEL))(*v6)[67].super.isa)(v6, a2) & 1) == 0)))
  {
    return v6[2];
  }
  else
  {
    return 0;
  }
}

- (WebFrame)selectedFrame
{
  WebFrame *result;

  result = -[WebView _focusedFrame](self, "_focusedFrame");
  if (!result)
    return (WebFrame *)-[WebFrame _findFrameWithSelection](-[WebView mainFrame](self, "mainFrame"), "_findFrameWithSelection");
  return result;
}

- (WebBackForwardList)backForwardList
{
  Page *m_ptr;
  BackForwardList *v3;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr && (v3 = *(BackForwardList **)(*((_QWORD *)m_ptr + 17) + 16), *((_BYTE *)v3 + 65)))
    return (WebBackForwardList *)kit(v3);
  else
    return 0;
}

- (void)setMaintainsBackForwardList:(BOOL)flag
{
  Page *m_ptr;
  uint64_t v4;
  int v5;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    v4 = *(_QWORD *)(*((_QWORD *)m_ptr + 17) + 16);
    *(_BYTE *)(v4 + 65) = flag;
    if (!flag)
    {
      v5 = *(_DWORD *)(v4 + 60);
      BackForwardList::setCapacity(v4, 0);
      BackForwardList::setCapacity(v4, v5);
    }
  }
}

- (BOOL)goBack
{
  if (!self->_private->page.m_ptr)
    return 0;
  if ((WebThreadIsCurrent() & 1) != 0 || (WebThreadIsEnabled() & 1) == 0)
    return WebCore::BackForwardController::goBack(*((WebCore::BackForwardController **)self->_private->page.m_ptr + 17));
  WebThreadRun();
  return 1;
}

uint64_t __17__WebView_goBack__block_invoke(uint64_t a1)
{
  return WebCore::BackForwardController::goBack(*(WebCore::BackForwardController **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80)
                                                                                               + 8)
                                                                                   + 136));
}

- (BOOL)goForward
{
  if (!self->_private->page.m_ptr)
    return 0;
  if ((WebThreadIsCurrent() & 1) != 0 || (WebThreadIsEnabled() & 1) == 0)
    return WebCore::BackForwardController::goForward(*((WebCore::BackForwardController **)self->_private->page.m_ptr + 17));
  WebThreadRun();
  return 1;
}

uint64_t __20__WebView_goForward__block_invoke(uint64_t a1)
{
  return WebCore::BackForwardController::goForward(*(WebCore::BackForwardController **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80)
                                                                                                  + 8)
                                                                                      + 136));
}

- (BOOL)goToBackForwardItem:(WebHistoryItem *)item
{
  Page *m_ptr;
  uint64_t v4;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  _QWORD *v11;
  _QWORD *v12;

  m_ptr = self->_private->page.m_ptr;
  if (!m_ptr)
    return m_ptr != 0;
  v4 = *((_QWORD *)m_ptr + 20);
  if (!v4 || *(_BYTE *)(v4 + 144) != 0)
    return m_ptr != 0;
  v6 = (unsigned int *)(v4 + 8);
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 + 1, v6));
  WebCore::Page::goToItem();
  do
  {
    v8 = __ldaxr(v6);
    v9 = v8 - 1;
  }
  while (__stlxr(v9, v6));
  if (v9)
    return m_ptr != 0;
  atomic_store(1u, v6);
  v11 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v11 = off_1E9D6A4D8;
  v11[1] = v6;
  v12 = v11;
  WTF::ensureOnMainThread();
  if (!v12)
    return m_ptr != 0;
  (*(void (**)(_QWORD *))(*v12 + 8))(v12);
  return m_ptr != 0;
}

- (void)setTextSizeMultiplier:(float)textSizeMultiplier
{
  uint64_t v5;
  double v6;

  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("WebKitDebugFullPageZoomPreferenceKey")) ^ 1;
  *(float *)&v6 = textSizeMultiplier;
  -[WebView _setZoomMultiplier:isTextOnly:](self, "_setZoomMultiplier:isTextOnly:", v5, v6);
}

- (float)textSizeMultiplier
{
  _BOOL4 v3;
  float result;

  v3 = -[WebView _realZoomMultiplierIsTextOnly](self, "_realZoomMultiplierIsTextOnly");
  result = 1.0;
  if (v3)
    return self->_private->zoomMultiplier;
  return result;
}

- (void)_setZoomMultiplier:(float)a3 isTextOnly:(BOOL)a4
{
  WebCore::LocalFrame *v6;
  float v7;
  float v8;

  self->_private->zoomMultiplier = a3;
  self->_private->zoomsTextOnly = a4;
  -[WebView hideFormValidationMessage](self, "hideFormValidationMessage");
  v6 = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
  if (v6)
  {
    if (self->_private->zoomsTextOnly)
    {
      v7 = 1.0;
      v8 = a3;
    }
    else
    {
      v8 = 1.0;
      v7 = a3;
    }
    WebCore::LocalFrame::setPageAndTextZoomFactors(v6, v7, v8);
  }
}

- (float)_zoomMultiplier:(BOOL)a3
{
  int v3;
  int v5;
  float result;

  v3 = a3;
  v5 = -[WebView _realZoomMultiplierIsTextOnly](self, "_realZoomMultiplierIsTextOnly");
  result = 1.0;
  if (v5 == v3)
    return self->_private->zoomMultiplier;
  return result;
}

- (float)_realZoomMultiplier
{
  return self->_private->zoomMultiplier;
}

- (BOOL)_realZoomMultiplierIsTextOnly
{
  WebViewPrivate *v2;

  v2 = self->_private;
  return v2->page.m_ptr && v2->zoomsTextOnly;
}

- (BOOL)_canZoomOut:(BOOL)a3
{
  _BOOL8 v3;
  NSView *v5;
  float v7;

  v3 = a3;
  v5 = -[WebFrameView documentView](-[WebFrame frameView](-[WebView mainFrame](self, "mainFrame"), "frameView"), "documentView");
  if (-[NSView conformsToProtocol:](v5, "conformsToProtocol:", &unk_1F018DAB8))
    return -[NSView _canZoomOut](v5, "_canZoomOut");
  -[WebView _zoomMultiplier:](self, "_zoomMultiplier:", v3);
  return (float)(v7 / 1.2) > 0.5;
}

- (BOOL)_canZoomIn:(BOOL)a3
{
  _BOOL8 v3;
  NSView *v5;
  float v7;

  v3 = a3;
  v5 = -[WebFrameView documentView](-[WebFrame frameView](-[WebView mainFrame](self, "mainFrame"), "frameView"), "documentView");
  if (-[NSView conformsToProtocol:](v5, "conformsToProtocol:", &unk_1F018DAB8))
    return -[NSView _canZoomIn](v5, "_canZoomIn");
  -[WebView _zoomMultiplier:](self, "_zoomMultiplier:", v3);
  return (float)(v7 * 1.2) < 3.0;
}

- (void)_zoomOut:(id)a3 isTextOnly:(BOOL)a4
{
  _BOOL8 v4;
  NSView *v7;
  float v8;

  v4 = a4;
  v7 = -[WebFrameView documentView](-[WebFrame frameView](-[WebView mainFrame](self, "mainFrame"), "frameView"), "documentView");
  if (-[NSView conformsToProtocol:](v7, "conformsToProtocol:", &unk_1F018DAB8))
  {
    -[NSView _zoomOut:](v7, "_zoomOut:", a3);
  }
  else
  {
    -[WebView _zoomMultiplier:](self, "_zoomMultiplier:", v4);
    if ((float)(v8 / 1.2) > 0.5)
      -[WebView _setZoomMultiplier:isTextOnly:](self, "_setZoomMultiplier:isTextOnly:", v4);
  }
}

- (void)_zoomIn:(id)a3 isTextOnly:(BOOL)a4
{
  _BOOL8 v4;
  NSView *v7;
  float v8;

  v4 = a4;
  v7 = -[WebFrameView documentView](-[WebFrame frameView](-[WebView mainFrame](self, "mainFrame"), "frameView"), "documentView");
  if (-[NSView conformsToProtocol:](v7, "conformsToProtocol:", &unk_1F018DAB8))
  {
    -[NSView _zoomIn:](v7, "_zoomIn:", a3);
  }
  else
  {
    -[WebView _zoomMultiplier:](self, "_zoomMultiplier:", v4);
    if ((float)(v8 * 1.2) < 3.0)
      -[WebView _setZoomMultiplier:isTextOnly:](self, "_setZoomMultiplier:isTextOnly:", v4);
  }
}

- (BOOL)_canResetZoom:(BOOL)a3
{
  _BOOL8 v3;
  NSView *v5;
  float v7;

  v3 = a3;
  v5 = -[WebFrameView documentView](-[WebFrame frameView](-[WebView mainFrame](self, "mainFrame"), "frameView"), "documentView");
  if (-[NSView conformsToProtocol:](v5, "conformsToProtocol:", &unk_1F018DAB8))
    return -[NSView _canResetZoom](v5, "_canResetZoom");
  -[WebView _zoomMultiplier:](self, "_zoomMultiplier:", v3);
  return v7 != 1.0;
}

- (void)_resetZoom:(id)a3 isTextOnly:(BOOL)a4
{
  _BOOL8 v4;
  NSView *v7;
  double v8;

  v4 = a4;
  v7 = -[WebFrameView documentView](-[WebFrame frameView](-[WebView mainFrame](self, "mainFrame"), "frameView"), "documentView");
  if (-[NSView conformsToProtocol:](v7, "conformsToProtocol:", &unk_1F018DAB8))
  {
    -[NSView _resetZoom:](v7, "_resetZoom:", a3);
  }
  else
  {
    -[WebView _zoomMultiplier:](self, "_zoomMultiplier:", v4);
    if (*(float *)&v8 != 1.0)
    {
      LODWORD(v8) = 1.0;
      -[WebView _setZoomMultiplier:isTextOnly:](self, "_setZoomMultiplier:isTextOnly:", v4, v8);
    }
  }
}

- (void)setApplicationNameForUserAgent:(NSString *)applicationNameForUserAgent
{
  uint64_t v4;
  WebViewPrivate *v5;
  void *m_ptr;

  v4 = -[NSString copy](applicationNameForUserAgent, "copy");
  v5 = self->_private;
  m_ptr = v5->applicationNameForUserAgent.m_ptr;
  v5->applicationNameForUserAgent.m_ptr = (void *)v4;
  if (m_ptr)
    CFRelease(m_ptr);
  if (!self->_private->userAgentOverridden)
    -[WebView _invalidateUserAgentCache](self, "_invalidateUserAgentCache");
}

- (void)_invalidateUserAgentCache
{
  WebViewPrivate *v3;
  WTF::StringImpl *m_ptr;
  Page *v5;

  v3 = self->_private;
  m_ptr = (WTF::StringImpl *)v3->userAgent.m_impl.m_ptr;
  if (m_ptr)
  {
    v3->userAgent.m_impl.m_ptr = 0;
    if (*(_DWORD *)m_ptr != 2)
    {
      *(_DWORD *)m_ptr -= 2;
      v5 = self->_private->page.m_ptr;
      if (!v5)
        return;
      goto LABEL_4;
    }
    WTF::StringImpl::destroy(m_ptr, (StringImpl *)a2);
    v5 = self->_private->page.m_ptr;
    if (v5)
LABEL_4:
      WebCore::Page::userAgentChanged((WebCore::Page *)v5);
  }
}

- (NSString)applicationNameForUserAgent
{
  WebViewPrivate *v2;
  void *m_ptr;

  v2 = self->_private;
  m_ptr = v2->applicationNameForUserAgent.m_ptr;
  if (m_ptr)
    CFRetain(v2->applicationNameForUserAgent.m_ptr);
  return (NSString *)(id)CFMakeCollectable(m_ptr);
}

- (void)setCustomUserAgent:(NSString *)customUserAgent
{
  StringImpl *v5;
  WebViewPrivate *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *m_ptr;
  int v9;
  StringImpl *v10;
  WTF::StringImpl *v11;

  -[WebView _invalidateUserAgentCache](self, "_invalidateUserAgentCache");
  MEMORY[0x1D82A3998](&v11, customUserAgent);
  v6 = self->_private;
  v7 = v11;
  v11 = 0;
  m_ptr = (WTF::StringImpl *)v6->userAgent.m_impl.m_ptr;
  v6->userAgent.m_impl.m_ptr = (StringImpl *)v7;
  if (m_ptr)
  {
    v9 = *(_DWORD *)m_ptr - 2;
    if (*(_DWORD *)m_ptr != 2)
    {
LABEL_5:
      *(_DWORD *)m_ptr = v9;
      goto LABEL_6;
    }
    WTF::StringImpl::destroy(m_ptr, v5);
    m_ptr = v11;
    v11 = 0;
    if (m_ptr)
    {
      v9 = *(_DWORD *)m_ptr - 2;
      if (*(_DWORD *)m_ptr == 2)
      {
        WTF::StringImpl::destroy(m_ptr, v10);
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
LABEL_6:
  self->_private->userAgentOverridden = customUserAgent != 0;
}

- (NSString)customUserAgent
{
  WebViewPrivate *v2;

  v2 = self->_private;
  if (!v2->userAgentOverridden)
    return 0;
  if (v2->userAgent.m_impl.m_ptr)
    return (NSString *)WTF::StringImpl::operator NSString *();
  return (NSString *)&stru_1E9D6EC48;
}

- (void)setMediaStyle:(NSString *)mediaStyle
{
  uint64_t v4;
  WebViewPrivate *v5;
  void *m_ptr;

  if (self->_private->mediaStyle.m_ptr != mediaStyle)
  {
    v4 = -[NSString copy](mediaStyle, "copy");
    v5 = self->_private;
    m_ptr = v5->mediaStyle.m_ptr;
    v5->mediaStyle.m_ptr = (void *)v4;
    if (m_ptr)
      CFRelease(m_ptr);
  }
}

- (NSString)mediaStyle
{
  return (NSString *)self->_private->mediaStyle.m_ptr;
}

- (BOOL)supportsTextEncoding
{
  NSView *v2;
  int v3;

  v2 = -[WebFrameView documentView](-[WebFrame frameView](-[WebView mainFrame](self, "mainFrame"), "frameView"), "documentView");
  v3 = -[NSView conformsToProtocol:](v2, "conformsToProtocol:", &unk_1F0174AF8);
  if (v3)
    LOBYTE(v3) = -[NSView supportsTextEncoding](v2, "supportsTextEncoding");
  return v3;
}

- (void)setCustomTextEncodingName:(NSString *)customTextEncodingName
{
  NSString *v5;
  _QWORD *v6;
  WebCore::FrameLoader *v7;
  StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  v5 = -[WebView customTextEncodingName](self, "customTextEncodingName");
  if (v5 != customTextEncodingName && !-[NSString isEqualToString:](customTextEncodingName, "isEqualToString:", v5))
  {
    v6 = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
    if (v6)
    {
      v7 = (WebCore::FrameLoader *)v6[35];
      MEMORY[0x1D82A3998](&v10, customTextEncodingName);
      WebCore::FrameLoader::reloadWithOverrideEncoding(v7, (const WTF::String *)&v10);
      v9 = v10;
      v10 = 0;
      if (v9)
      {
        if (*(_DWORD *)v9 == 2)
          WTF::StringImpl::destroy(v9, v8);
        else
          *(_DWORD *)v9 -= 2;
      }
    }
  }
}

- (id)_mainFrameOverrideEncoding
{
  id result;
  uint64_t v4;

  result = -[WebFrame provisionalDataSource](-[WebView mainFrame](self, "mainFrame"), "provisionalDataSource");
  if (result || (result = -[WebFrame _dataSource](-[WebView mainFrame](self, "mainFrame"), "_dataSource")) != 0)
  {
    objc_msgSend(result, "_documentLoader");
    result = *(id *)(v4 + 1624);
    if (result)
    {
      if (*((_DWORD *)result + 1))
        return (id)WTF::StringImpl::operator NSString *();
      else
        return 0;
    }
  }
  return result;
}

- (NSString)stringByEvaluatingJavaScriptFromString:(NSString *)script
{
  return (NSString *)-[WebFrame _stringByEvaluatingJavaScriptFromString:](-[WebView mainFrame](self, "mainFrame"), "_stringByEvaluatingJavaScriptFromString:", script);
}

- (WebScriptObject)windowScriptObject
{
  WebScriptObject *result;

  result = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
  if (result)
    return (WebScriptObject *)WebCore::ScriptController::windowScriptObject(result[19].super.isa);
  return result;
}

- (String)_userAgentString
{
  StringImpl **v2;
  StringImpl **v3;
  StringImpl *m_ptr;
  WebView *v5;
  uint64_t v6;
  StringImpl *v7;
  WebViewPrivate *v8;
  WTF::StringImpl *v9;
  int v10;
  StringImpl *v11;
  WTF::StringImpl *v12;

  v3 = v2;
  m_ptr = self->_private->userAgent.m_impl.m_ptr;
  if (m_ptr)
    goto LABEL_8;
  v5 = self;
  v6 = objc_msgSend((id)objc_opt_class(), "_standardUserAgentWithApplicationName:", self->_private->applicationNameForUserAgent.m_ptr);
  MEMORY[0x1D82A3998](&v12, v6);
  v8 = v5->_private;
  v9 = v12;
  v12 = 0;
  self = (WebView *)v8->userAgent.m_impl.m_ptr;
  v8->userAgent.m_impl.m_ptr = (StringImpl *)v9;
  if (!self)
    goto LABEL_7;
  v10 = LODWORD(self->super.super.super.isa) - 2;
  if (LODWORD(self->super.super.super.isa) == 2)
  {
    WTF::StringImpl::destroy((WTF::StringImpl *)self, v7);
    self = (WebView *)v12;
    v12 = 0;
    if (!self)
      goto LABEL_7;
    v10 = LODWORD(self->super.super.super.isa) - 2;
    if (LODWORD(self->super.super.super.isa) == 2)
    {
      self = (WebView *)WTF::StringImpl::destroy((WTF::StringImpl *)self, v11);
      m_ptr = v5->_private->userAgent.m_impl.m_ptr;
      if (!m_ptr)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  LODWORD(self->super.super.super.isa) = v10;
LABEL_7:
  m_ptr = v5->_private->userAgent.m_impl.m_ptr;
  if (m_ptr)
LABEL_8:
    *(_DWORD *)m_ptr += 2;
LABEL_9:
  *v3 = m_ptr;
  return (String)self;
}

- (NSString)userAgentForURL:(NSURL *)URL
{
  StringImpl *v3;
  NSString *v4;
  WTF::StringImpl *v6;

  if (!self)
    return (NSString *)&stru_1E9D6EC48;
  -[WebView _userAgentString](self, "_userAgentString", URL);
  if (!v6)
    return (NSString *)&stru_1E9D6EC48;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v6 == 2)
    WTF::StringImpl::destroy(v6, v3);
  else
    *(_DWORD *)v6 -= 2;
  return v4;
}

- (void)setHostWindow:(NSWindow *)hostWindow
{
  WebViewPrivate *v5;
  const WebCore::Frame *v6;
  WebViewPrivate *v7;
  void *m_ptr;
  uint64_t v9;
  void *v10;
  _QWORD *v11;

  v5 = self->_private;
  if ((!hostWindow || !v5->closed) && v5->hostWindow.m_ptr != hostWindow)
  {
    v6 = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
    v7 = self->_private;
    if (hostWindow)
      CFRetain(hostWindow);
    m_ptr = v7->hostWindow.m_ptr;
    v7->hostWindow.m_ptr = hostWindow;
    if (m_ptr)
      CFRelease(m_ptr);
    if (v6)
    {
      v9 = (uint64_t)v6;
      do
      {
        if (!*(_BYTE *)(v9 + 144))
        {
          v11 = *(_QWORD **)(*(_QWORD *)(v9 + 280) + 16);
          if (((*(uint64_t (**)(_QWORD *))(*v11 + 1072))(v11) & 1) != 0)
            v10 = 0;
          else
            v10 = (void *)v11[2];
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "frameView"), "documentView"), "viewDidMoveToHostWindow");
        }
        v9 = WebCore::FrameTree::traverseNext((WebCore::FrameTree *)(v9 + 48), v6);
      }
      while (v9);
    }
  }
}

- (NSWindow)hostWindow
{
  WebViewPrivate *v2;

  v2 = self->_private;
  if (v2)
    return (NSWindow *)v2->hostWindow.m_ptr;
  else
    return 0;
}

- (id)documentViewAtWindowPoint:(CGPoint)a3
{
  return (id)objc_msgSend(-[WebView _frameViewAtWindowPoint:](self, "_frameViewAtWindowPoint:", a3.x, a3.y), "documentView");
}

- (id)_elementAtWindowPoint:(CGPoint)a3
{
  double y;
  double x;
  id result;
  id v6;
  void *v7;
  NSString *v8;
  _QWORD v9[2];

  y = a3.y;
  x = a3.x;
  v9[1] = *MEMORY[0x1E0C80C00];
  result = -[WebView _frameViewAtWindowPoint:](self, "_frameViewAtWindowPoint:");
  if (result)
  {
    v6 = result;
    v7 = (void *)objc_msgSend(result, "documentView");
    if (objc_msgSend(v7, "conformsToProtocol:", &unk_1F0174800))
    {
      objc_msgSend(v7, "convertPoint:fromView:", 0, x, y);
      return (id)objc_msgSend(v7, "elementAtPoint:");
    }
    else
    {
      v8 = WebElementFrameKey;
      v9[0] = objc_msgSend(v6, "webFrame");
      return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    }
  }
  return result;
}

- (NSDictionary)elementAtPoint:(NSPoint)point
{
  -[WebView convertPoint:toView:](self, "convertPoint:toView:", 0, point.x, point.y);
  return (NSDictionary *)-[WebView _elementAtWindowPoint:](self, "_elementAtWindowPoint:");
}

- (BOOL)acceptsFirstResponder
{
  return -[WebFrameView acceptsFirstResponder](-[WebFrame frameView](-[WebView mainFrame](self, "mainFrame"), "frameView"), "acceptsFirstResponder");
}

- (BOOL)becomeFirstResponder
{
  return !self->_private->becomingFirstResponder
      && -[WebFrameView acceptsFirstResponder](-[WebFrame frameView](-[WebView mainFrame](self, "mainFrame"), "frameView"), "acceptsFirstResponder");
}

- (id)_webcore_effectiveFirstResponder
{
  WebFrameView *v3;
  objc_super v5;

  v3 = -[WebFrame frameView](-[WebView mainFrame](self, "mainFrame"), "frameView");
  if (v3)
    return -[WebFrameView _webcore_effectiveFirstResponder](v3, "_webcore_effectiveFirstResponder");
  v5.receiver = self;
  v5.super_class = (Class)WebView;
  return -[WebView _webcore_effectiveFirstResponder](&v5, sel__webcore_effectiveFirstResponder);
}

- (void)setNextKeyView:(id)a3
{
  WebFrameView *v5;
  objc_super v6;

  v5 = -[WebFrame frameView](-[WebView mainFrame](self, "mainFrame"), "frameView");
  if (v5)
  {
    -[WebFrameView setNextKeyView:](v5, "setNextKeyView:", a3);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WebView;
    -[WebView setNextKeyView:](&v6, sel_setNextKeyView_, a3);
  }
}

- (BOOL)searchFor:(NSString *)string direction:(BOOL)forward caseSensitive:(BOOL)caseFlag wrap:(BOOL)wrapFlag
{
  return -[WebView searchFor:direction:caseSensitive:wrap:startInSelection:](self, "searchFor:direction:caseSensitive:wrap:startInSelection:", string, forward, caseFlag, wrapFlag, 0);
}

+ (void)registerViewClass:(Class)viewClass representationClass:(Class)representationClass forMIMEType:(NSString *)MIMEType
{
  uint64_t v7;
  WebCore::MIMETypeRegistry *v8;
  uint64_t *v9;
  StringImpl *v10;
  WTF::StringImpl *v11;
  uint64_t v12;
  WTF::StringImpl *v13;

  objc_msgSend(+[WebFrameView _viewTypesAllowImageTypeOmission:](WebFrameView, "_viewTypesAllowImageTypeOmission:", 1), "setObject:forKey:", viewClass, MIMEType);
  objc_msgSend(+[WebDataSource _repTypesAllowImageTypeOmission:](WebDataSource, "_repTypesAllowImageTypeOmission:", 1), "setObject:forKey:", representationClass, MIMEType);
  v7 = objc_opt_class();
  v8 = (WebCore::MIMETypeRegistry *)objc_opt_class();
  if ((WebCore::MIMETypeRegistry *)v7 == v8)
  {
    v9 = (uint64_t *)WebCore::MIMETypeRegistry::supportedNonImageMIMETypes(v8);
    MEMORY[0x1D82A3998](&v13, MIMEType);
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::ASCIICaseInsensitiveHash,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t)&v12, v9, &v13);
    v11 = v13;
    v13 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2)
        WTF::StringImpl::destroy(v11, v10);
      else
        *(_DWORD *)v11 -= 2;
    }
  }
}

- (void)setGroupName:(NSString *)groupName
{
  WebViewGroup *m_ptr;
  StringImpl *v6;
  WebViewPrivate *v7;
  WebViewGroup *v8;
  WTF::StringImpl *v9;
  WTF *v10;
  void *v11;
  WTF::StringImpl *v12;
  WebViewGroup *v13;
  WebViewPrivate *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  Page *v19;
  StringImpl *v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *v22;
  WTF::StringImpl *v23[3];
  WTF::StringImpl *v24;

  m_ptr = self->_private->group.m_ptr;
  if (m_ptr)
    WebViewGroup::removeWebView(m_ptr, self);
  MEMORY[0x1D82A3998](&v24, groupName);
  MEMORY[0x1D82A3998](&v22, objc_msgSend(self->_private->preferences.m_ptr, "_localStorageDatabasePath"));
  WebViewGroup::getOrCreate((WebViewGroup *)&v24, (const WTF::String *)&v22, (WebViewGroup **)v23);
  v7 = self->_private;
  v8 = v7->group.m_ptr;
  v7->group.m_ptr = (WebViewGroup *)v23[0];
  if (v8)
  {
    if (*(_DWORD *)v8 == 1)
    {
      WebViewGroup::~WebViewGroup(v8, v6);
      WTF::fastFree(v10, v11);
      v9 = v22;
      v22 = 0;
      if (!v9)
        goto LABEL_11;
      goto LABEL_9;
    }
    --*(_DWORD *)v8;
  }
  v9 = v22;
  v22 = 0;
  if (!v9)
  {
LABEL_11:
    v12 = v24;
    v24 = 0;
    if (!v12)
      goto LABEL_17;
    goto LABEL_14;
  }
LABEL_9:
  if (*(_DWORD *)v9 != 2)
  {
    *(_DWORD *)v9 -= 2;
    goto LABEL_11;
  }
  WTF::StringImpl::destroy(v9, v6);
  v12 = v24;
  v24 = 0;
  if (!v12)
    goto LABEL_17;
LABEL_14:
  if (*(_DWORD *)v12 == 2)
    WTF::StringImpl::destroy(v12, v6);
  else
    *(_DWORD *)v12 -= 2;
LABEL_17:
  v13 = self->_private->group.m_ptr;
  v24 = (WTF::StringImpl *)self;
  WTF::HashTable<WebView *,WebView *,WTF::IdentityExtractor,WTF::DefaultHash<WebView *>,WTF::HashTraits<WebView *>,WTF::HashTraits<WebView *>>::add((uint64_t *)v13 + 2, (uint64_t *)&v24, (uint64_t)v23);
  v14 = self->_private;
  if (v14->page.m_ptr)
  {
    v15 = (WTF::StringImpl *)*((_QWORD *)v14->group.m_ptr + 5);
    ++*((_DWORD *)v15 + 2);
    v23[0] = v15;
    WebCore::Page::setUserContentProvider();
    v16 = v23[0];
    v23[0] = 0;
    if (v16)
    {
      if (*((_DWORD *)v16 + 2) == 1)
        (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v16 + 8))(v16);
      else
        --*((_DWORD *)v16 + 2);
    }
    v17 = (WTF::StringImpl *)*((_QWORD *)self->_private->group.m_ptr + 6);
    ++*((_DWORD *)v17 + 2);
    v23[0] = v17;
    WebCore::Page::setVisitedLinkStore();
    v18 = v23[0];
    v23[0] = 0;
    if (v18)
    {
      if (*((_DWORD *)v18 + 2) == 1)
        (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v18 + 8))(v18);
      else
        --*((_DWORD *)v18 + 2);
    }
    v19 = self->_private->page.m_ptr;
    MEMORY[0x1D82A3998](v23, groupName);
    WebCore::Page::setGroupName((WebCore::Page *)v19, (const WTF::String *)v23);
    v21 = v23[0];
    v23[0] = 0;
    if (v21)
    {
      if (*(_DWORD *)v21 == 2)
        WTF::StringImpl::destroy(v21, v20);
      else
        *(_DWORD *)v21 -= 2;
    }
  }
}

- (NSString)groupName
{
  NSString *result;

  result = (NSString *)self->_private->page.m_ptr;
  if (result)
  {
    if (*(_QWORD *)WebCore::Page::groupName((WebCore::Page *)result))
      return (NSString *)WTF::StringImpl::operator NSString *();
    else
      return (NSString *)&stru_1E9D6EC48;
  }
  return result;
}

- (double)estimatedProgress
{
  Page *m_ptr;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
    return *(double *)(*((_QWORD *)m_ptr + 16) + 128);
  else
    return 0.0;
}

- (void)setMainFrameURL:(NSString *)mainFrameURL
{
  uint64_t v5;
  uint64_t v6;
  WebFrame *v7;

  if (-[NSString hasPrefix:](mainFrameURL, "hasPrefix:", CFSTR("/")))
    v5 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", mainFrameURL, 0);
  else
    v5 = objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithDataAsString:", mainFrameURL);
  v6 = v5;
  v7 = -[WebView mainFrame](self, "mainFrame");
  -[WebFrame loadRequest:](v7, "loadRequest:", objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", v6));
}

- (NSString)mainFrameURL
{
  WebDataSource *v3;
  NSURL *v4;

  v3 = -[WebFrame provisionalDataSource](-[WebView mainFrame](self, "mainFrame"), "provisionalDataSource");
  if (v3)
    v4 = -[NSMutableURLRequest URL](-[WebDataSource request](v3, "request"), "URL");
  else
    v4 = (NSURL *)objc_msgSend((id)objc_msgSend(-[WebFrame _dataSource](-[WebView mainFrame](self, "mainFrame"), "_dataSource"), "request"), "URL");
  return (NSString *)-[NSURL _web_originalDataAsString](v4, "_web_originalDataAsString");
}

- (NSString)mainFrameTitle
{
  NSString *result;

  result = (NSString *)objc_msgSend(-[WebFrame _dataSource](-[WebView mainFrame](self, "mainFrame"), "_dataSource"), "pageTitle");
  if (!result)
    return (NSString *)&stru_1E9D6EC48;
  return result;
}

- (id)mainFrameIconURL
{
  WebFrame *v2;
  LocalFrame *m_ptr;
  uint64_t v4;

  v2 = -[WebView mainFrame](self, "mainFrame");
  if (v2
    && (m_ptr = v2->_private->coreFrame.m_ptr) != 0
    && (v4 = *(_QWORD *)(*((_QWORD *)m_ptr + 35) + 88)) != 0
    && *(_DWORD *)(v4 + 2828))
  {
    return (id)WTF::URL::operator NSURL *();
  }
  else
  {
    return 0;
  }
}

- (DOMDocument)mainFrameDocument
{
  if (self->_private->mainFrameDocumentReady)
    return -[WebFrame DOMDocument](-[WebView mainFrame](self, "mainFrame"), "DOMDocument");
  else
    return 0;
}

- (void)setDrawsBackground:(BOOL)drawsBackground
{
  WebViewPrivate *v3;

  v3 = self->_private;
  if (v3->drawsBackground != drawsBackground)
  {
    v3->drawsBackground = drawsBackground;
    -[WebFrame _updateBackgroundAndUpdatesWhileOffscreen](-[WebView mainFrame](self, "mainFrame"), "_updateBackgroundAndUpdatesWhileOffscreen");
  }
}

- (BOOL)drawsBackground
{
  WebViewPrivate *v2;

  v2 = self->_private;
  return !v2 || v2->drawsBackground;
}

- (void)setShouldUpdateWhileOffscreen:(BOOL)shouldUpdateWhileOffscreen
{
  WebViewPrivate *v3;

  v3 = self->_private;
  if (v3->shouldUpdateWhileOffscreen != shouldUpdateWhileOffscreen)
  {
    v3->shouldUpdateWhileOffscreen = shouldUpdateWhileOffscreen;
    -[WebFrame _updateBackgroundAndUpdatesWhileOffscreen](-[WebView mainFrame](self, "mainFrame"), "_updateBackgroundAndUpdatesWhileOffscreen");
  }
}

- (BOOL)shouldUpdateWhileOffscreen
{
  return self->_private->shouldUpdateWhileOffscreen;
}

- (void)setCurrentNodeHighlight:(id)a3
{
  WebViewPrivate *v4;
  void *m_ptr;

  v4 = self->_private;
  if (a3)
    CFRetain(a3);
  m_ptr = v4->currentNodeHighlight.m_ptr;
  v4->currentNodeHighlight.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id)currentNodeHighlight
{
  return self->_private->currentNodeHighlight.m_ptr;
}

- (id)previousValidKeyView
{
  WebView *v2;
  id v3;
  __CFSet *Mutable;
  objc_super v6;

  v2 = self;
  v6.receiver = self;
  v6.super_class = (Class)WebView;
  v3 = -[WebView previousValidKeyView](&v6, sel_previousValidKeyView);
  if (objc_msgSend(v3, "isDescendantOf:", v2))
  {
    Mutable = CFSetCreateMutable(0, 0, 0);
    CFSetAddValue(Mutable, v3);
    while (1)
    {
      CFSetAddValue(Mutable, v2);
      v2 = (WebView *)-[WebView previousKeyView](v2, "previousKeyView");
      if (!v2 || CFSetGetValue(Mutable, v2))
        break;
      if ((objc_msgSend(v3, "isDescendantOf:", v2) & 1) == 0)
      {
        v3 = -[WebView previousValidKeyView](v2, "previousValidKeyView");
        break;
      }
    }
    if (Mutable)
      CFRelease(Mutable);
  }
  return v3;
}

+ (BOOL)_didSetCacheModel
{
  return byte_1ECEC97E4;
}

+ (unint64_t)_maxCacheModelInAnyInstance
{
  void *v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;

  if (byte_1ECEC97E6 == 1)
  {
    v2 = (void *)objc_msgSend((id)qword_1ECEC9818, "objectEnumerator");
    v3 = (void *)objc_msgSend((id)objc_msgSend(v2, "nextObject"), "preferences");
    v4 = 0;
    if (!v3)
      return v4;
  }
  else
  {
    qword_1ECEC9818 = 0;
    byte_1ECEC97E6 = 1;
    v2 = (void *)objc_msgSend(0, "objectEnumerator");
    v3 = (void *)objc_msgSend((id)objc_msgSend(v2, "nextObject"), "preferences");
    v4 = 0;
    if (!v3)
      return v4;
  }
  do
  {
    v5 = objc_msgSend(v3, "cacheModel");
    if (v4 <= v5)
      v4 = v5;
    v3 = (void *)objc_msgSend((id)objc_msgSend(v2, "nextObject"), "preferences");
  }
  while (v3);
  return v4;
}

+ (void)_cacheModelChangedNotification:(id)a3
{
  WebThreadRun();
}

unint64_t __42__WebView__cacheModelChangedNotification___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  void *v5;
  WebCacheModel v6;
  unint64_t v7;
  unint64_t result;

  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "cacheModel");
  if (!objc_msgSend(*(id *)(a1 + 40), "_didSetCacheModel")
    || v2 > objc_msgSend(*(id *)(a1 + 40), "_cacheModel"))
  {
    v3 = *(void **)(a1 + 40);
    v4 = v2;
    return objc_msgSend(v3, "_setCacheModel:", v4);
  }
  result = objc_msgSend(*(id *)(a1 + 40), "_cacheModel");
  if (v2 < result)
  {
    v5 = *(void **)(a1 + 40);
    v6 = -[WebPreferences cacheModel](+[WebPreferences standardPreferences](WebPreferences, "standardPreferences"), "cacheModel");
    v7 = objc_msgSend(*(id *)(a1 + 40), "_maxCacheModelInAnyInstance");
    if (v6 <= v7)
      v4 = v7;
    else
      v4 = v6;
    v3 = v5;
    return objc_msgSend(v3, "_setCacheModel:", v4);
  }
  return result;
}

+ (void)_preferencesRemovedNotification:(id)a3
{
  uint64_t v4;
  WebCacheModel v5;
  unint64_t v6;
  unint64_t v7;

  v4 = objc_msgSend((id)objc_msgSend(a3, "object"), "cacheModel");
  if (v4 == objc_msgSend(a1, "_cacheModel"))
  {
    v5 = -[WebPreferences cacheModel](+[WebPreferences standardPreferences](WebPreferences, "standardPreferences"), "cacheModel");
    v6 = objc_msgSend(a1, "_maxCacheModelInAnyInstance");
    if (v5 <= v6)
      v7 = v6;
    else
      v7 = v5;
    objc_msgSend(a1, "_setCacheModel:", v7);
  }
}

- (id)_focusedFrame
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend((id)-[WebView window](self, "window"), "firstResponder");
  if (!v3)
    return 0;
  v4 = (void *)v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !objc_msgSend(v4, "isDescendantOf:", -[WebFrame frameView](-[WebView mainFrame](self, "mainFrame"), "frameView")))
  {
    return 0;
  }
  do
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    v4 = (void *)objc_msgSend(v4, "superview");
  }
  while (v4);
  return (id)objc_msgSend(v4, "webFrame");
}

- (BOOL)_isLoading
{
  WebFrame *v2;

  v2 = -[WebView mainFrame](self, "mainFrame");
  return (objc_msgSend(-[WebFrame _dataSource](v2, "_dataSource"), "isLoading") & 1) != 0
      || -[WebDataSource isLoading](-[WebFrame provisionalDataSource](v2, "provisionalDataSource"), "isLoading");
}

- (id)_frameViewAtWindowPoint:(CGPoint)a3
{
  id result;
  id v5;
  int v6;

  if (self->_private->closed)
    return 0;
  v5 = (id)-[WebView hitTest:](self, "hitTest:", a3.x, a3.y);
  v6 = objc_msgSend(v5, "isDescendantOf:", -[WebFrame frameView](-[WebView mainFrame](self, "mainFrame"), "frameView"));
  result = 0;
  if (v6 && v5)
  {
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      result = (id)objc_msgSend(v5, "superview");
      v5 = result;
      if (!result)
        return result;
    }
    return v5;
  }
  return result;
}

- (BOOL)_continuousCheckingAllowed
{
  if ((-[WebView _continuousCheckingAllowed]::readAllowContinuousSpellCheckingDefault & 1) == 0)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("NSAllowContinuousSpellChecking")))
    {
      -[WebView _continuousCheckingAllowed]::allowContinuousSpellChecking = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSAllowContinuousSpellChecking"));
    }
    -[WebView _continuousCheckingAllowed]::readAllowContinuousSpellCheckingDefault = 1;
  }
  return -[WebView _continuousCheckingAllowed]::allowContinuousSpellChecking;
}

- (id)_responderForResponderOperations
{
  WebView *v2;
  uint64_t v3;
  WebFrameView *v4;
  WebFrameView *v5;
  NSView *v6;

  v2 = self;
  v3 = objc_msgSend((id)-[WebView window](self, "window"), "firstResponder");
  v4 = -[WebFrame frameView](-[WebView mainFrame](v2, "mainFrame"), "frameView");
  if ((WebView *)v3 != v2)
  {
    v5 = v4;
    v2 = (WebView *)v3;
    if (!-[WAKView _web_firstResponderIsSelfOrDescendantView](v4, "_web_firstResponderIsSelfOrDescendantView"))
    {
      v6 = -[WebFrameView documentView](v5, "documentView");
      if (v6)
        return v6;
      else
        return v5;
    }
  }
  return v2;
}

- (void)takeStringURLFrom:(id)sender
{
  uint64_t v4;
  WebFrame *v5;

  v4 = objc_msgSend(sender, "stringValue");
  v5 = -[WebView mainFrame](self, "mainFrame");
  -[WebFrame loadRequest:](v5, "loadRequest:", objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithDataAsString:", v4)));
}

- (BOOL)canGoBack
{
  Page *m_ptr;

  WebThreadLock();
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
    return WebCore::BackForwardController::canGoBackOrForward(*((WebCore::BackForwardController **)m_ptr + 17));
  else
    return 0;
}

- (BOOL)canGoForward
{
  Page *m_ptr;

  WebThreadLock();
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
    return WebCore::BackForwardController::canGoBackOrForward(*((WebCore::BackForwardController **)m_ptr + 17));
  else
    return 0;
}

- (void)stopLoading:(id)sender
{
  if (WebThreadNotCurrent())
  {
    self->_private->isStopping = 1;
    *MEMORY[0x1E0DD9000] = 1;
  }
  WebThreadRun();
}

uint64_t __37__WebView_WebIBActions__stopLoading___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 792) = 0;
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "mainFrame"), "stopLoading");
}

- (void)stopLoadingAndClear
{
  if (WebThreadNotCurrent() && (WebThreadIsLocked() & 1) == 0)
  {
    self->_private->isStopping = 1;
    *MEMORY[0x1E0DD9000] = 1;
  }
  WebThreadRun();
}

void __44__WebView_WebIBActions__stopLoadingAndClear__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  int v4;
  int v5;
  WebPlainWhiteView *v6;
  WebPlainWhiteView *v7;
  double v8;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 792) = 0;
  v1 = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "mainFrame");
  objc_msgSend(v1, "stopLoading");
  v2 = WebCore::Document::loader(*(WebCore::Document **)(*(_QWORD *)(v1[1] + 8) + 296));
  WebCore::DocumentWriter::end((WebCore::DocumentWriter *)(v2 + 112));
  v3 = (void *)objc_msgSend(v1, "frameView");
  objc_msgSend((id)objc_msgSend(v3, "documentView"), "scale");
  v5 = v4;
  v6 = [WebPlainWhiteView alloc];
  v7 = -[WebPlainWhiteView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0CB3438], *(double *)(MEMORY[0x1E0CB3438] + 8), *(double *)(MEMORY[0x1E0CB3438] + 16), *(double *)(MEMORY[0x1E0CB3438] + 24));
  LODWORD(v8) = v5;
  -[WebPlainWhiteView setScale:](v7, "setScale:", v8);
  objc_msgSend(v3, "bounds");
  -[WebPlainWhiteView setFrame:](v7, "setFrame:");
  objc_msgSend(v3, "_setDocumentView:", v7);
  -[WebPlainWhiteView setNeedsDisplay:](v7, "setNeedsDisplay:", 1);
  if (v7)
    CFRelease(v7);
}

- (void)reload:(id)sender
{
  WebThreadRun();
}

uint64_t __32__WebView_WebIBActions__reload___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "mainFrame"), "reload");
}

- (void)reloadFromOrigin:(id)sender
{
  -[WebFrame reloadFromOrigin](-[WebView mainFrame](self, "mainFrame", sender), "reloadFromOrigin");
}

- (BOOL)canMakeTextSmaller
{
  return -[WebView _canZoomOut:](self, "_canZoomOut:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("WebKitDebugFullPageZoomPreferenceKey")) ^ 1);
}

- (void)makeTextSmaller:(id)sender
{
  -[WebView _zoomOut:isTextOnly:](self, "_zoomOut:isTextOnly:", sender, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("WebKitDebugFullPageZoomPreferenceKey")) ^ 1);
}

- (BOOL)canMakeTextLarger
{
  return -[WebView _canZoomIn:](self, "_canZoomIn:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("WebKitDebugFullPageZoomPreferenceKey")) ^ 1);
}

- (void)makeTextLarger:(id)sender
{
  -[WebView _zoomIn:isTextOnly:](self, "_zoomIn:isTextOnly:", sender, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("WebKitDebugFullPageZoomPreferenceKey")) ^ 1);
}

- (BOOL)canMakeTextStandardSize
{
  return -[WebView _canResetZoom:](self, "_canResetZoom:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("WebKitDebugFullPageZoomPreferenceKey")) ^ 1);
}

- (void)makeTextStandardSize:(id)sender
{
  -[WebView _resetZoom:isTextOnly:](self, "_resetZoom:isTextOnly:", sender, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("WebKitDebugFullPageZoomPreferenceKey")) ^ 1);
}

- (void)toggleContinuousSpellChecking:(id)sender
{
  -[WebView setContinuousSpellCheckingEnabled:](self, "setContinuousSpellCheckingEnabled:", -[WebView isContinuousSpellCheckingEnabled](self, "isContinuousSpellCheckingEnabled", sender) ^ 1);
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  uint64_t v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  const void *v10;
  const void *v11;
  const void *v12;

  if (a3 && a4)
  {
    if (self)
      -[WebView page](self, "page");
    v6 = WTF::fastMalloc((WTF *)0x20);
    MEMORY[0x1D82A3608](v6, a3, a4);
    WebCore::Page::addSchedulePair();
    if (v6)
    {
      do
      {
        v8 = __ldaxr((unsigned int *)v6);
        v9 = v8 - 1;
      }
      while (__stlxr(v9, (unsigned int *)v6));
      if (!v9)
      {
        atomic_store(1u, (unsigned int *)v6);
        v10 = *(const void **)(v6 + 24);
        *(_QWORD *)(v6 + 24) = 0;
        if (v10)
          CFRelease(v10);
        v11 = *(const void **)(v6 + 16);
        *(_QWORD *)(v6 + 16) = 0;
        if (v11)
          CFRelease(v11);
        v12 = *(const void **)(v6 + 8);
        *(_QWORD *)(v6 + 8) = 0;
        if (v12)
          CFRelease(v12);
        WTF::fastFree((WTF *)v6, v7);
      }
    }
  }
}

- (void)unscheduleFromRunLoop:(id)a3 forMode:(id)a4
{
  uint64_t v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  const void *v10;
  const void *v11;
  const void *v12;

  if (a3 && a4)
  {
    if (self)
      -[WebView page](self, "page");
    v6 = WTF::fastMalloc((WTF *)0x20);
    MEMORY[0x1D82A3608](v6, a3, a4);
    WebCore::Page::removeSchedulePair();
    if (v6)
    {
      do
      {
        v8 = __ldaxr((unsigned int *)v6);
        v9 = v8 - 1;
      }
      while (__stlxr(v9, (unsigned int *)v6));
      if (!v9)
      {
        atomic_store(1u, (unsigned int *)v6);
        v10 = *(const void **)(v6 + 24);
        *(_QWORD *)(v6 + 24) = 0;
        if (v10)
          CFRelease(v10);
        v11 = *(const void **)(v6 + 16);
        *(_QWORD *)(v6 + 16) = 0;
        if (v11)
          CFRelease(v11);
        v12 = *(const void **)(v6 + 8);
        *(_QWORD *)(v6 + 8) = 0;
        if (v12)
          CFRelease(v12);
        WTF::fastFree((WTF *)v6, v7);
      }
    }
  }
}

- (BOOL)findString:(id)a3 options:(unint64_t)a4
{
  int v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  void *v12;
  unint64_t v13;
  int v14;
  uint64_t v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  int v19;
  _BOOL8 v20;

  if (self->_private->closed)
  {
LABEL_2:
    LOBYTE(v4) = 0;
    return v4;
  }
  v6 = -[WebView _selectedOrMainFrame](self, "_selectedOrMainFrame");
  v7 = 0;
  v8 = v6;
  do
  {
    if (v8)
    {
      if ((a4 & 8) == 0)
        goto LABEL_7;
    }
    else if ((a4 & 8) == 0)
    {
LABEL_7:
      v9 = WebCore::FrameTree::traverseNext();
      if (!v9)
        goto LABEL_13;
      goto LABEL_11;
    }
    v9 = WebCore::FrameTree::traversePrevious();
    if (!v9)
      goto LABEL_13;
LABEL_11:
    if (*(_BYTE *)(v9 + 144)
      || (v10 = *(_QWORD **)(*(_QWORD *)(v9 + 280) + 16),
          ((*(uint64_t (**)(_QWORD *))(*v10 + 1072))(v10) & 1) != 0))
    {
LABEL_13:
      v11 = 0;
      goto LABEL_14;
    }
    v11 = (id)v10[2];
LABEL_14:
    v12 = (void *)objc_msgSend((id)objc_msgSend(v8, "frameView"), "documentView");
    if (objc_msgSend(v12, "conformsToProtocol:", &unk_1F0174DB8))
    {
      if (v8 == v6)
        v7 = v12;
      if (v8 == v11)
        v13 = a4;
      else
        v13 = a4 & 0xFFFFFFFFFFFFFFEFLL;
      if (objc_msgSend(v12, "conformsToProtocol:", &unk_1F0174990))
      {
        if ((objc_msgSend(v12, "_findString:options:", a3, v13) & 1) != 0)
          goto LABEL_37;
      }
      else
      {
        v14 = objc_msgSend(v12, "conformsToProtocol:", &unk_1F0174C68);
        v15 = (v13 >> 4) & 1;
        v16 = (v13 & 1) == 0;
        if (v14)
        {
          if ((objc_msgSend(v12, "searchFor:direction:caseSensitive:wrap:startInSelection:", a3, (v13 & 8) == 0, v16, v15, (v13 >> 5) & 1) & 1) != 0)goto LABEL_37;
        }
        else if (objc_msgSend(v12, "searchFor:direction:caseSensitive:wrap:", a3, (v13 & 8) == 0, v16, v15))
        {
LABEL_37:
          if (v8 != v6)
            objc_msgSend(v6, "_clearSelection");
          v17 = (void *)-[WebView window](self, "window");
          v18 = v12;
LABEL_45:
          objc_msgSend(v17, "makeFirstResponder:", v18);
          LOBYTE(v4) = 1;
          return v4;
        }
      }
      if (v8 == v11)
        goto LABEL_2;
    }
    if (!v11)
      break;
    v8 = v11;
  }
  while (v11 != v6);
  LOBYTE(v4) = 0;
  if ((a4 & 0x10) != 0 && v7)
  {
    if (objc_msgSend(v7, "conformsToProtocol:", &unk_1F0174990))
    {
      if ((objc_msgSend(v7, "_findString:options:", a3, a4) & 1) == 0)
        goto LABEL_2;
    }
    else
    {
      v19 = objc_msgSend(v7, "conformsToProtocol:", &unk_1F0174C68);
      v20 = (a4 & 1) == 0;
      if (v19)
      {
        if ((objc_msgSend(v7, "searchFor:direction:caseSensitive:wrap:startInSelection:", a3, (a4 & 8) == 0, v20, 1, (a4 >> 5) & 1) & 1) == 0)goto LABEL_2;
      }
      else
      {
        v4 = objc_msgSend(v7, "searchFor:direction:caseSensitive:wrap:", a3, (a4 & 8) == 0, v20, 1);
        if (!v4)
          return v4;
      }
    }
    v17 = (void *)-[WebView window](self, "window");
    v18 = v7;
    goto LABEL_45;
  }
  return v4;
}

- (id)DOMRangeOfString:(id)a3 relativeTo:(id)a4 options:(unint64_t)a5
{
  void *m_ptr;
  StringImpl *v6;
  WebCore::Node *v7;
  WebCore::Node *v8;
  WTF::StringImpl *v9;
  WebCore::Node *v11;
  WebCore::Node *v12;
  char v13;
  WTF::StringImpl *v14;
  WebCore::Node *v15;
  WebCore::Node *v16;
  char v17;

  m_ptr = self->_private->page.m_ptr;
  if (!m_ptr)
    return m_ptr;
  MEMORY[0x1D82A3998](&v14, a3);
  WebCore::makeSimpleRange();
  WebCore::Page::rangeOfString();
  m_ptr = kit();
  if (v17)
  {
    v7 = v16;
    v16 = 0;
    if (v7)
    {
      if (*((_DWORD *)v7 + 6) == 2)
      {
        if ((*((_WORD *)v7 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v7);
      }
      else
      {
        *((_DWORD *)v7 + 6) -= 2;
      }
    }
    v8 = v15;
    v15 = 0;
    if (v8)
    {
      if (*((_DWORD *)v8 + 6) == 2)
      {
        if ((*((_WORD *)v8 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v8);
      }
      else
      {
        *((_DWORD *)v8 + 6) -= 2;
      }
    }
  }
  if (v13)
  {
    if (v12)
    {
      if (*((_DWORD *)v12 + 6) == 2)
      {
        if ((*((_WORD *)v12 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v12);
      }
      else
      {
        *((_DWORD *)v12 + 6) -= 2;
      }
    }
    if (v11)
    {
      if (*((_DWORD *)v11 + 6) == 2)
      {
        if ((*((_WORD *)v11 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v11);
      }
      else
      {
        *((_DWORD *)v11 + 6) -= 2;
      }
    }
  }
  v9 = v14;
  v14 = 0;
  if (!v9)
    return m_ptr;
  if (*(_DWORD *)v9 != 2)
  {
    *(_DWORD *)v9 -= 2;
    return m_ptr;
  }
  WTF::StringImpl::destroy(v9, v6);
  return m_ptr;
}

- (void)setTabKeyCyclesThroughElements:(BOOL)a3
{
  Page *m_ptr;

  self->_private->tabKeyCyclesThroughElementsChanged = 1;
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
    *((_BYTE *)m_ptr + 338) = a3;
}

- (BOOL)tabKeyCyclesThroughElements
{
  Page *m_ptr;

  m_ptr = self->_private->page.m_ptr;
  return m_ptr && *((_BYTE *)m_ptr + 338) != 0;
}

- (void)setScriptDebugDelegate:(id)a3
{
  self->_private->scriptDebugDelegate = a3;
  -[WebView _cacheScriptDebugDelegateImplementations](self, "_cacheScriptDebugDelegateImplementations");
  if (a3)
    -[WebView _attachScriptDebuggerToAllFrames](self, "_attachScriptDebuggerToAllFrames");
  else
    -[WebView _detachScriptDebuggerFromAllFrames](self, "_detachScriptDebuggerFromAllFrames");
}

- (id)scriptDebugDelegate
{
  return self->_private->scriptDebugDelegate;
}

- (void)setHistoryDelegate:(id)a3
{
  self->_private->historyDelegate = a3;
  -[WebView _cacheHistoryDelegateImplementations](self, "_cacheHistoryDelegateImplementations");
}

- (id)historyDelegate
{
  return self->_private->historyDelegate;
}

- (BOOL)shouldClose
{
  WebCore::FrameLoader **v2;

  v2 = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
  if (v2)
    return WebCore::FrameLoader::shouldClose(v2[35]);
  else
    return 1;
}

- (BOOL)canMarkAllTextMatches
{
  int v2;
  WebFrame *v3;
  NSView *v4;
  uint64_t v5;
  _QWORD *v6;

  if (self->_private->closed)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    v3 = -[WebView mainFrame](self, "mainFrame");
    while (1)
    {
      v4 = -[WebFrameView documentView](-[WebFrame frameView](v3, "frameView"), "documentView");
      if (v4)
      {
        v2 = -[NSView conformsToProtocol:](v4, "conformsToProtocol:", &unk_1F0174918);
        if (!v2)
          break;
      }
      if (v3)
      {
        v5 = WebCore::FrameTree::traverseNext();
        if (!v5)
          goto LABEL_14;
      }
      else
      {
        v5 = WebCore::FrameTree::traverseNext();
        if (!v5)
          goto LABEL_14;
      }
      if (!*(_BYTE *)(v5 + 144))
      {
        v6 = *(_QWORD **)(*(_QWORD *)(v5 + 280) + 16);
        if (((*(uint64_t (**)(_QWORD *))(*v6 + 1072))(v6) & 1) == 0)
        {
          v3 = (WebFrame *)v6[2];
          if (v3)
            continue;
        }
      }
LABEL_14:
      LOBYTE(v2) = 1;
      return v2;
    }
  }
  return v2;
}

- (unint64_t)countMatchesForText:(id)a3 options:(unint64_t)a4 highlight:(BOOL)a5 limit:(unint64_t)a6 markMatches:(BOOL)a7
{
  return -[WebView countMatchesForText:inDOMRange:options:highlight:limit:markMatches:](self, "countMatchesForText:inDOMRange:options:highlight:limit:markMatches:", a3, 0, a4, a5, a6, a7);
}

- (unint64_t)countMatchesForText:(id)a3 inDOMRange:(id)a4 options:(unint64_t)a5 highlight:(BOOL)a6 limit:(unint64_t)a7 markMatches:(BOOL)a8
{
  _BOOL4 v9;
  _BOOL8 v11;
  WebFrame *v15;
  unint64_t v16;
  unsigned int v17;
  NSView *v18;
  uint64_t v19;
  _QWORD *v20;
  NSView *v21;
  uint64_t v22;
  _QWORD *v23;
  NSView *v24;
  uint64_t v25;
  _QWORD *v26;
  NSView *v27;
  uint64_t v28;
  _QWORD *v29;

  if (self->_private->closed)
    return 0;
  v9 = a8;
  v11 = a6;
  v15 = -[WebView mainFrame](self, "mainFrame");
  v16 = a7 - 1;
  v17 = 0;
  if (v9)
  {
    if (a7)
    {
      do
      {
        v18 = -[WebFrameView documentView](-[WebFrame frameView](v15, "frameView"), "documentView");
        if (-[NSView conformsToProtocol:](v18, "conformsToProtocol:", &unk_1F0174918))
        {
          -[NSView setMarkedTextMatchesAreHighlighted:](v18, "setMarkedTextMatchesAreHighlighted:", v11);
          v17 += -[NSView countMatchesForText:inDOMRange:options:limit:markMatches:](v18, "countMatchesForText:inDOMRange:options:limit:markMatches:", a3, a4, a5, a7 - v17, 1);
          if (v16 < v17)
            break;
        }
        if (v15)
        {
          v19 = WebCore::FrameTree::traverseNext();
          if (!v19)
            return v17;
        }
        else
        {
          v19 = WebCore::FrameTree::traverseNext();
          if (!v19)
            return v17;
        }
        if (*(_BYTE *)(v19 + 144))
          break;
        v20 = *(_QWORD **)(*(_QWORD *)(v19 + 280) + 16);
        if (((*(uint64_t (**)(_QWORD *))(*v20 + 1072))(v20) & 1) != 0)
          break;
        v15 = (WebFrame *)v20[2];
      }
      while (v15);
    }
    else
    {
      do
      {
        v24 = -[WebFrameView documentView](-[WebFrame frameView](v15, "frameView"), "documentView");
        if (-[NSView conformsToProtocol:](v24, "conformsToProtocol:", &unk_1F0174918))
        {
          -[NSView setMarkedTextMatchesAreHighlighted:](v24, "setMarkedTextMatchesAreHighlighted:", v11);
          v17 += -[NSView countMatchesForText:inDOMRange:options:limit:markMatches:](v24, "countMatchesForText:inDOMRange:options:limit:markMatches:", a3, a4, a5, 0, 1);
          if (v16 < v17)
            break;
        }
        if (v15)
        {
          v25 = WebCore::FrameTree::traverseNext();
          if (!v25)
            return v17;
        }
        else
        {
          v25 = WebCore::FrameTree::traverseNext();
          if (!v25)
            return v17;
        }
        if (*(_BYTE *)(v25 + 144))
          break;
        v26 = *(_QWORD **)(*(_QWORD *)(v25 + 280) + 16);
        if (((*(uint64_t (**)(_QWORD *))(*v26 + 1072))(v26) & 1) != 0)
          break;
        v15 = (WebFrame *)v26[2];
      }
      while (v15);
    }
  }
  else if (a7)
  {
    do
    {
      v21 = -[WebFrameView documentView](-[WebFrame frameView](v15, "frameView"), "documentView");
      if (-[NSView conformsToProtocol:](v21, "conformsToProtocol:", &unk_1F0174918))
      {
        v17 += -[NSView countMatchesForText:inDOMRange:options:limit:markMatches:](v21, "countMatchesForText:inDOMRange:options:limit:markMatches:", a3, a4, a5, a7 - v17, 0);
        if (v16 < v17)
          break;
      }
      if (v15)
      {
        v22 = WebCore::FrameTree::traverseNext();
        if (!v22)
          return v17;
      }
      else
      {
        v22 = WebCore::FrameTree::traverseNext();
        if (!v22)
          return v17;
      }
      if (*(_BYTE *)(v22 + 144))
        break;
      v23 = *(_QWORD **)(*(_QWORD *)(v22 + 280) + 16);
      if (((*(uint64_t (**)(_QWORD *))(*v23 + 1072))(v23) & 1) != 0)
        break;
      v15 = (WebFrame *)v23[2];
    }
    while (v15);
  }
  else
  {
    do
    {
      v27 = -[WebFrameView documentView](-[WebFrame frameView](v15, "frameView"), "documentView");
      if (-[NSView conformsToProtocol:](v27, "conformsToProtocol:", &unk_1F0174918))
      {
        v17 += -[NSView countMatchesForText:inDOMRange:options:limit:markMatches:](v27, "countMatchesForText:inDOMRange:options:limit:markMatches:", a3, a4, a5, 0, 0);
        if (v16 < v17)
          break;
      }
      if (v15)
      {
        v28 = WebCore::FrameTree::traverseNext();
        if (!v28)
          return v17;
      }
      else
      {
        v28 = WebCore::FrameTree::traverseNext();
        if (!v28)
          return v17;
      }
      if (*(_BYTE *)(v28 + 144))
        break;
      v29 = *(_QWORD **)(*(_QWORD *)(v28 + 280) + 16);
      if (((*(uint64_t (**)(_QWORD *))(*v29 + 1072))(v29) & 1) != 0)
        break;
      v15 = (WebFrame *)v29[2];
    }
    while (v15);
  }
  return v17;
}

- (void)unmarkAllTextMatches
{
  WebFrame *v2;
  NSView *v3;
  uint64_t v4;
  _QWORD *v5;

  if (!self->_private->closed)
  {
    v2 = -[WebView mainFrame](self, "mainFrame");
    do
    {
      v3 = -[WebFrameView documentView](-[WebFrame frameView](v2, "frameView"), "documentView");
      if (-[NSView conformsToProtocol:](v3, "conformsToProtocol:", &unk_1F0174918))
        -[NSView unmarkAllTextMatches](v3, "unmarkAllTextMatches");
      if (v2)
      {
        v4 = WebCore::FrameTree::traverseNext();
        if (!v4)
          return;
      }
      else
      {
        v4 = WebCore::FrameTree::traverseNext();
        if (!v4)
          return;
      }
      if (*(_BYTE *)(v4 + 144))
        break;
      v5 = *(_QWORD **)(*(_QWORD *)(v4 + 280) + 16);
      if (((*(uint64_t (**)(_QWORD *))(*v5 + 1072))(v5) & 1) != 0)
        break;
      v2 = (WebFrame *)v5[2];
    }
    while (v2);
  }
}

- (id)rectsForTextMatches
{
  void *v2;
  WebFrame *v5;
  NSView *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  double x;
  double y;
  double width;
  double height;
  void *v24;
  uint64_t v25;
  _QWORD *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  NSRect v33;
  NSRect v34;
  NSRect v35;

  v32 = *MEMORY[0x1E0C80C00];
  if (self->_private->closed)
    return (id)MEMORY[0x1E0C9AA60];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = -[WebView mainFrame](self, "mainFrame");
  do
  {
    v6 = -[WebFrameView documentView](-[WebFrame frameView](v5, "frameView"), "documentView");
    if (-[NSView conformsToProtocol:](v6, "conformsToProtocol:", &unk_1F0174918))
    {
      -[NSView visibleRect](v6, "visibleRect");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v15 = (void *)-[NSView rectsForTextMatches](v6, "rectsForTextMatches", 0);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v28 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "rectValue");
            v35.origin.x = v8;
            v35.origin.y = v10;
            v35.size.width = v12;
            v35.size.height = v14;
            v34 = NSIntersectionRect(v33, v35);
            x = v34.origin.x;
            y = v34.origin.y;
            width = v34.size.width;
            height = v34.size.height;
            if (!NSIsEmptyRect(v34))
            {
              v24 = (void *)MEMORY[0x1D82A8E64]();
              -[NSView convertRect:toView:](v6, "convertRect:toView:", self, x, y, width, height);
              objc_msgSend(v2, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:"));
              objc_autoreleasePoolPop(v24);
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v17);
      }
    }
    if (v5)
    {
      v25 = WebCore::FrameTree::traverseNext();
      if (!v25)
        return v2;
    }
    else
    {
      v25 = WebCore::FrameTree::traverseNext();
      if (!v25)
        return v2;
    }
    if (*(_BYTE *)(v25 + 144))
      break;
    v26 = *(_QWORD **)(*(_QWORD *)(v25 + 280) + 16);
    if (((*(uint64_t (**)(_QWORD *))(*v26 + 1072))(v26) & 1) != 0)
      break;
    v5 = (WebFrame *)v26[2];
  }
  while (v5);
  return v2;
}

- (void)scrollDOMRangeToVisible:(id)a3
{
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "startContainer"), "ownerDocument"), "webFrame"), "_scrollDOMRangeToVisible:", a3);
}

- (void)scrollDOMRangeToVisible:(id)a3 withInset:(double)a4
{
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "startContainer"), "ownerDocument"), "webFrame"), "_scrollDOMRangeToVisible:withInset:", a3, a4);
}

- (BOOL)allowsUndo
{
  return self->_private->allowsUndo;
}

- (void)setAllowsUndo:(BOOL)a3
{
  self->_private->allowsUndo = a3;
}

- (void)setPageSizeMultiplier:(float)a3
{
  -[WebView _setZoomMultiplier:isTextOnly:](self, "_setZoomMultiplier:isTextOnly:", 0);
}

- (float)pageSizeMultiplier
{
  BOOL v3;
  float result;

  v3 = -[WebView _realZoomMultiplierIsTextOnly](self, "_realZoomMultiplierIsTextOnly");
  result = 1.0;
  if (!v3)
    return self->_private->zoomMultiplier;
  return result;
}

- (BOOL)canZoomPageIn
{
  return -[WebView _canZoomIn:](self, "_canZoomIn:", 0);
}

- (void)zoomPageIn:(id)a3
{
  -[WebView _zoomIn:isTextOnly:](self, "_zoomIn:isTextOnly:", a3, 0);
}

- (BOOL)canZoomPageOut
{
  return -[WebView _canZoomOut:](self, "_canZoomOut:", 0);
}

- (void)zoomPageOut:(id)a3
{
  -[WebView _zoomOut:isTextOnly:](self, "_zoomOut:isTextOnly:", a3, 0);
}

- (BOOL)canResetPageZoom
{
  return -[WebView _canResetZoom:](self, "_canResetZoom:", 0);
}

- (void)resetPageZoom:(id)a3
{
  -[WebView _resetZoom:isTextOnly:](self, "_resetZoom:isTextOnly:", a3, 0);
}

- (void)setMediaVolume:(float)a3
{
  Page *m_ptr;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
    WebCore::Page::setMediaVolume((WebCore::Page *)m_ptr, a3);
}

- (float)mediaVolume
{
  Page *m_ptr;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
    return *((float *)m_ptr + 87);
  else
    return 0.0;
}

- (void)suspendAllMediaPlayback
{
  Page *m_ptr;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
    WebCore::Page::suspendAllMediaPlayback((WebCore::Page *)m_ptr);
}

- (void)resumeAllMediaPlayback
{
  Page *m_ptr;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
    WebCore::Page::resumeAllMediaPlayback((WebCore::Page *)m_ptr);
}

- (void)addVisitedLinks:(id)a3
{
  WTF *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (WTF *)*((_QWORD *)self->_private->group.m_ptr + 6);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(a3);
        WebVisitedLinkStore::addVisitedLink(v4, *(__CFString **)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)removeVisitedLink:(id)a3
{
  WebVisitedLinkStore *v3;
  __CFString *v4;
  StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;

  v3 = (WebVisitedLinkStore *)*((_QWORD *)self->_private->group.m_ptr + 6);
  MEMORY[0x1D82A38F0](&v7, a3);
  if (v7)
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebVisitedLinkStore::removeVisitedLink(v3, &v4->isa);
  v6 = v7;
  v7 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v5);
    else
      *(_DWORD *)v6 -= 2;
  }
}

- (DOMCSSStyleDeclaration)computedStyleForElement:(DOMElement *)element pseudoElement:(NSString *)pseudoElement
{
  const __CFString *v4;

  if (pseudoElement)
    v4 = (const __CFString *)pseudoElement;
  else
    v4 = &stru_1E9D6EC48;
  return -[DOMDocument getComputedStyle:pseudoElement:](-[DOMNode ownerDocument](element, "ownerDocument"), "getComputedStyle:pseudoElement:", element, v4);
}

- (DOMRange)editableDOMRangeForPoint:(NSPoint)point
{
  DOMRange *v3;
  double y;
  double x;
  uint64_t v6;
  BOOL v7;
  WebCore::Editor *v9;
  CGFloat v10;
  CGFloat v11;
  WebCore::Node *v12;
  WebCore::Node *v13;
  CGPoint v14;
  IntPoint v15;
  WebCore::Node *v16;
  WebCore::Node *v17;
  char v18;

  v3 = (DOMRange *)self;
  if (!self)
    return v3;
  y = point.y;
  x = point.x;
  -[WebView page](self, "page");
  if (!v16)
    return 0;
  v6 = *((_QWORD *)v16 + 20);
  if (v6)
    v7 = *(_BYTE *)(v6 + 144) == 0;
  else
    v7 = 0;
  if (!v7)
    return 0;
  v9 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v6 + 296));
  -[DOMRange convertPoint:toView:](v3, "convertPoint:toView:", 0, x, y);
  v14.x = v10;
  v14.y = v11;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v15, &v14);
  WebCore::Editor::rangeForPoint(v9, &v15);
  v3 = (DOMRange *)kit();
  if (!v18)
    return v3;
  v12 = v17;
  v17 = 0;
  if (v12)
  {
    if (*((_DWORD *)v12 + 6) == 2)
    {
      if ((*((_WORD *)v12 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v12);
    }
    else
    {
      *((_DWORD *)v12 + 6) -= 2;
    }
  }
  v13 = v16;
  v16 = 0;
  if (!v13)
    return v3;
  if (*((_DWORD *)v13 + 6) == 2)
  {
    if ((*((_WORD *)v13 + 15) & 0x400) != 0)
      return v3;
    WebCore::Node::removedLastRef(v13);
    return v3;
  }
  else
  {
    *((_DWORD *)v13 + 6) -= 2;
    return v3;
  }
}

- (BOOL)_shouldChangeSelectedDOMRange:(id)a3 toDOMRange:(id)a4 affinity:(unint64_t)a5 stillSelecting:(BOOL)a6
{
  return objc_msgSend(-[WebView _editingDelegateForwarder](self, "_editingDelegateForwarder"), "webView:shouldChangeSelectedDOMRange:toDOMRange:affinity:stillSelecting:", self, a3, a4, a5, a6);
}

- (void)_setMaintainsInactiveSelection:(BOOL)a3
{
  self->_private->shouldMaintainInactiveSelection = a3;
}

- (BOOL)maintainsInactiveSelection
{
  return self->_private->shouldMaintainInactiveSelection;
}

- (void)setSelectedDOMRange:(DOMRange *)range affinity:(NSSelectionAffinity)selectionAffinity
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  WebCore::Node *v8;
  WebCore::Node *v9;

  v5 = -[WebView _selectedOrMainFrame](self, "_selectedOrMainFrame");
  if (v5)
  {
    v6 = *(_QWORD *)(v5[1] + 8);
    if (v6)
    {
      if (range)
      {
        v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)((_QWORD)-[DOMRange startContainer](range, "startContainer")[16] + 40)
                                   + 8)
                       + 528);
        if (v7 && *(_QWORD *)(v7 + 8))
        {
          WebCore::makeSimpleRange();
          WebCore::FrameSelection::setSelectedRange();
          if (v9)
          {
            if (*((_DWORD *)v9 + 6) == 2)
            {
              if ((*((_WORD *)v9 + 15) & 0x400) == 0)
                WebCore::Node::removedLastRef(v9);
            }
            else
            {
              *((_DWORD *)v9 + 6) -= 2;
            }
          }
          if (v8)
          {
            if (*((_DWORD *)v8 + 6) == 2)
            {
              if ((*((_WORD *)v8 + 15) & 0x400) == 0)
                WebCore::Node::removedLastRef(v8);
            }
            else
            {
              *((_DWORD *)v8 + 6) -= 2;
            }
          }
        }
      }
      else
      {
        WebCore::FrameSelection::clear(*(WebCore::FrameSelection **)(*(_QWORD *)(v6 + 296) + 3064));
      }
    }
  }
}

- (DOMRange)selectedDOMRange
{
  _QWORD *v2;
  uint64_t v3;
  DOMObjectInternal *v4;
  WebCore::Node *v6;
  WebCore::Node *v7;
  char v8;

  v2 = -[WebView _selectedOrMainFrame](self, "_selectedOrMainFrame");
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2[1] + 8);
  if (!v3)
    return 0;
  WebCore::VisibleSelection::toNormalizedRange((WebCore::VisibleSelection *)(*(_QWORD *)(*(_QWORD *)(v3 + 296) + 3064)
                                                                           + 56));
  v4 = kit();
  if (!v8)
    return (DOMRange *)v4;
  if (v7)
  {
    if (*((_DWORD *)v7 + 6) == 2)
    {
      if ((*((_WORD *)v7 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v7);
    }
    else
    {
      *((_DWORD *)v7 + 6) -= 2;
    }
  }
  if (!v6)
    return (DOMRange *)v4;
  if (*((_DWORD *)v6 + 6) != 2)
  {
    *((_DWORD *)v6 + 6) -= 2;
    return (DOMRange *)v4;
  }
  if ((*((_WORD *)v6 + 15) & 0x400) != 0)
    return (DOMRange *)v4;
  WebCore::Node::removedLastRef(v6);
  return (DOMRange *)v4;
}

- (NSSelectionAffinity)selectionAffinity
{
  _QWORD *v2;
  uint64_t v3;

  v2 = -[WebView _selectedOrMainFrame](self, "_selectedOrMainFrame");
  if (v2 && (v3 = *(_QWORD *)(v2[1] + 8)) != 0)
    return (unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v3 + 296) + 3064) + 152);
  else
    return 1;
}

- (void)setEditable:(BOOL)editable
{
  _BOOL4 v3;
  Page *m_ptr;
  WebViewPrivate *v6;
  WebCore::Document **v7;
  WebCore::Document **v8;
  WebCore::Editor *v9;

  v3 = editable;
  if (-[WebView isEditable](self, "isEditable") != editable)
  {
    m_ptr = self->_private->page.m_ptr;
    if (m_ptr)
    {
      *((_BYTE *)m_ptr + 656) = v3;
      v6 = self->_private;
      if (v6->tabKeyCyclesThroughElementsChanged)
      {
        v7 = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
        if (!v7)
          return;
      }
      else
      {
        *((_BYTE *)v6->page.m_ptr + 338) = !v3;
        v7 = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
        if (!v7)
          return;
      }
      if (v3)
      {
        v8 = v7;
        v9 = (WebCore::Editor *)WebCore::Document::editor(v7[37]);
        WebCore::Editor::applyEditingStyleToBodyElement(v9);
        if (!-[WebView selectedDOMRange](self, "selectedDOMRange"))
          WebCore::FrameSelection::setSelectionFromNone(*((WebCore::FrameSelection **)v8[37] + 383));
      }
    }
  }
}

- (BOOL)isEditable
{
  Page *m_ptr;

  m_ptr = self->_private->page.m_ptr;
  return m_ptr && *((_BYTE *)m_ptr + 656) != 0;
}

- (void)setTypingStyle:(DOMCSSStyleDeclaration *)typingStyle
{
  objc_msgSend(-[WebView _selectedOrMainFrame](self, "_selectedOrMainFrame"), "_setTypingStyle:withUndoAction:", typingStyle, 59);
}

- (DOMCSSStyleDeclaration)typingStyle
{
  return (DOMCSSStyleDeclaration *)objc_msgSend(-[WebView _selectedOrMainFrame](self, "_selectedOrMainFrame"), "_typingStyle");
}

- (void)setSmartInsertDeleteEnabled:(BOOL)smartInsertDeleteEnabled
{
  uint64_t v3;
  unint64_t v4;
  _BOOL4 v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = *((_QWORD *)self->_private->page.m_ptr + 14);
  v4 = *(_QWORD *)(v3 + 696);
  if (((v4 >> 38) & 1) != smartInsertDeleteEnabled)
  {
    v5 = smartInsertDeleteEnabled;
    v7 = v3 + 664;
    v8 = *(unsigned int *)(v3 + 720) | ((unint64_t)*(unsigned __int8 *)(v3 + 724) << 32);
    v9 = *(_QWORD *)(v3 + 712);
    v10 = *(_QWORD *)(v3 + 704);
    v11 = *(_QWORD *)(v3 + 688);
    v12 = *(_QWORD *)(v3 + 680);
    v13 = *(_QWORD *)(v3 + 672);
    v14 = *(_QWORD *)(v3 + 664);
    v15 = 0x4000000000;
    if (!smartInsertDeleteEnabled)
      v15 = 0;
    *(_QWORD *)v7 = v14;
    *(_QWORD *)(v7 + 8) = v13;
    *(_QWORD *)(v7 + 16) = v12;
    *(_QWORD *)(v7 + 24) = v11;
    *(_QWORD *)(v7 + 40) = v10;
    *(_QWORD *)(v7 + 48) = v9;
    *(_QWORD *)(v7 + 32) = v4 & 0xFFFFFFBFFFFFFFFFLL | v15;
    *(_DWORD *)(v7 + 56) = v8;
    *(_BYTE *)(v7 + 60) = BYTE4(v8);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "setBool:forKey:", (*(_QWORD *)(*((_QWORD *)self->_private->page.m_ptr + 14) + 696) >> 38) & 1, CFSTR("WebSmartInsertDeleteEnabled"));
    -[WebView setSelectTrailingWhitespaceEnabled:](self, "setSelectTrailingWhitespaceEnabled:", !v5);
  }
}

- (BOOL)smartInsertDeleteEnabled
{
  return (*(_QWORD *)(*((_QWORD *)self->_private->page.m_ptr + 14) + 696) >> 38) & 1;
}

- (void)setContinuousSpellCheckingEnabled:(BOOL)continuousSpellCheckingEnabled
{
  if (byte_1ECEC97E3 != continuousSpellCheckingEnabled)
  {
    byte_1ECEC97E3 = continuousSpellCheckingEnabled;
    if (-[WebView isContinuousSpellCheckingEnabled](self, "isContinuousSpellCheckingEnabled"))
      objc_msgSend((id)objc_opt_class(), "_preflightSpellChecker");
    else
      -[WebFrame _unmarkAllMisspellings](-[WebView mainFrame](self, "mainFrame"), "_unmarkAllMisspellings");
  }
}

- (BOOL)isContinuousSpellCheckingEnabled
{
  return byte_1ECEC97E3 && -[WebView _continuousCheckingAllowed](self, "_continuousCheckingAllowed");
}

- (NSUndoManager)undoManager
{
  if (self->_private->allowsUndo)
    return (NSUndoManager *)objc_msgSend(-[WebView _editingDelegateForwarder](self, "_editingDelegateForwarder"), "undoManagerForWebView:", self);
  else
    return 0;
}

- (void)registerForEditingDelegateNotification:(id)a3 selector:(SEL)a4
{
  void *v7;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "addObserver:selector:name:object:", self->_private->editingDelegate, a4, a3, self);
}

- (void)setEditingDelegate:(id)editingDelegate
{
  void *v5;
  WebViewPrivate *v6;
  void *m_ptr;

  if (self->_private->editingDelegate != editingDelegate)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v5, "removeObserver:name:object:", self->_private->editingDelegate, CFSTR("WebViewDidBeginEditingNotification"), self);
    objc_msgSend(v5, "removeObserver:name:object:", self->_private->editingDelegate, CFSTR("WebViewDidChangeNotification"), self);
    objc_msgSend(v5, "removeObserver:name:object:", self->_private->editingDelegate, CFSTR("WebViewDidEndEditingNotification"), self);
    objc_msgSend(v5, "removeObserver:name:object:", self->_private->editingDelegate, CFSTR("WebViewDidChangeTypingStyleNotification"), self);
    objc_msgSend(v5, "removeObserver:name:object:", self->_private->editingDelegate, CFSTR("WebViewDidChangeSelectionNotification"), self);
    self->_private->editingDelegate = editingDelegate;
    v6 = self->_private;
    m_ptr = v6->editingDelegateForwarder.m_ptr;
    v6->editingDelegateForwarder.m_ptr = 0;
    if (m_ptr)
      CFRelease(m_ptr);
    -[WebView registerForEditingDelegateNotification:selector:](self, "registerForEditingDelegateNotification:selector:", CFSTR("WebViewDidBeginEditingNotification"), sel_webViewDidBeginEditing_);
    -[WebView registerForEditingDelegateNotification:selector:](self, "registerForEditingDelegateNotification:selector:", CFSTR("WebViewDidChangeNotification"), sel_webViewDidChange_);
    -[WebView registerForEditingDelegateNotification:selector:](self, "registerForEditingDelegateNotification:selector:", CFSTR("WebViewDidEndEditingNotification"), sel_webViewDidEndEditing_);
    -[WebView registerForEditingDelegateNotification:selector:](self, "registerForEditingDelegateNotification:selector:", CFSTR("WebViewDidChangeTypingStyleNotification"), sel_webViewDidChangeTypingStyle_);
    -[WebView registerForEditingDelegateNotification:selector:](self, "registerForEditingDelegateNotification:selector:", CFSTR("WebViewDidChangeSelectionNotification"), sel_webViewDidChangeSelection_);
  }
}

- (id)editingDelegate
{
  return self->_private->editingDelegate;
}

- (DOMCSSStyleDeclaration)styleDeclarationWithText:(NSString *)text
{
  DOMCSSStyleDeclaration *v4;

  v4 = (DOMCSSStyleDeclaration *)objc_msgSend((id)objc_msgSend(-[WebView _selectedOrMainFrame](self, "_selectedOrMainFrame"), "DOMDocument"), "createCSSStyleDeclaration");
  -[DOMCSSStyleDeclaration setCssText:](v4, "setCssText:", text);
  return v4;
}

- (BOOL)isAutomaticQuoteSubstitutionEnabled
{
  return 0;
}

- (BOOL)isAutomaticLinkDetectionEnabled
{
  return 0;
}

- (BOOL)isAutomaticDashSubstitutionEnabled
{
  return 0;
}

- (BOOL)isAutomaticTextReplacementEnabled
{
  return 0;
}

- (BOOL)isAutomaticSpellingCorrectionEnabled
{
  return 0;
}

- (void)replaceSelectionWithNode:(DOMNode *)node
{
  objc_msgSend(-[WebView _selectedOrMainFrame](self, "_selectedOrMainFrame"), "_replaceSelectionWithNode:selectReplacement:smartReplace:matchStyle:", node, 1, 0, 0);
}

- (void)replaceSelectionWithText:(NSString *)text
{
  objc_msgSend(-[WebView _selectedOrMainFrame](self, "_selectedOrMainFrame"), "_replaceSelectionWithText:selectReplacement:smartReplace:", text, 1, 0);
}

- (void)replaceSelectionWithMarkupString:(NSString *)markupString
{
  objc_msgSend(-[WebView _selectedOrMainFrame](self, "_selectedOrMainFrame"), "_replaceSelectionWithMarkupString:baseURLString:selectReplacement:smartReplace:", markupString, 0, 1, 0);
}

- (void)replaceSelectionWithArchive:(WebArchive *)archive
{
  objc_msgSend((id)objc_msgSend(-[WebView _selectedOrMainFrame](self, "_selectedOrMainFrame"), "_dataSource"), "_replaceSelectionWithArchive:selectReplacement:", archive, 1);
}

- (void)deleteSelection
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;

  v2 = -[WebView _selectedOrMainFrame](self, "_selectedOrMainFrame");
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)(v2[1] + 8);
    if (v4)
    {
      WebCore::Document::editor(*(WebCore::Document **)(v4 + 296));
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "frameView"), "documentView"), "_canSmartCopyOrDelete");
      WebCore::Editor::deleteSelectionWithSmartDelete();
    }
  }
}

- (void)applyStyle:(DOMCSSStyleDeclaration *)style
{
  _QWORD *v4;
  uint64_t v5;
  WebCore::MutableStyleProperties *v6;
  WTF *v7;
  void *v8;
  WebCore::MutableStyleProperties *v9;

  v4 = -[WebView _selectedOrMainFrame](self, "_selectedOrMainFrame");
  if (v4)
  {
    v5 = *(_QWORD *)(v4[1] + 8);
    if (v5)
    {
      (*(void (**)(WebCore::MutableStyleProperties **__return_ptr))(*(_QWORD *)style->super._internal + 160))(&v9);
      WebCore::Document::editor(*(WebCore::Document **)(v5 + 296));
      WebCore::Editor::applyStyle();
      v6 = v9;
      v9 = 0;
      if (v6)
      {
        if (*(_DWORD *)v6 == 1)
        {
          WebCore::MutableStyleProperties::~MutableStyleProperties(v6);
          WTF::fastFree(v7, v8);
        }
        else
        {
          --*(_DWORD *)v6;
        }
      }
    }
  }
}

- (void)_performResponderOperation:(SEL)a3 with:(id)a4
{
  id v6;

  if (-[WebView(WebViewEditingActions) _performResponderOperation:with:]::reentered == 1)
  {
    objc_msgSend(-[WAKResponder nextResponder](self, "nextResponder"), "tryToPerform:with:", a3, a4);
  }
  else
  {
    v6 = -[WebView _responderForResponderOperations](self, "_responderForResponderOperations");
    -[WebView(WebViewEditingActions) _performResponderOperation:with:]::reentered = 1;
    objc_msgSend(v6, "tryToPerform:with:", a3, a4);
    -[WebView(WebViewEditingActions) _performResponderOperation:with:]::reentered = 0;
  }
}

- (void)alignCenter:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)alignJustified:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)alignLeft:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)alignRight:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)capitalizeWord:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)centerSelectionInVisibleArea:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)changeAttributes:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)changeBaseWritingDirection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)changeBaseWritingDirectionToLTR:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)changeBaseWritingDirectionToRTL:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)changeColor:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)changeDocumentBackgroundColor:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)changeFont:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)changeSpelling:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)checkSpelling:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)complete:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)copy:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)copyFont:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)cut:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)delete:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)deleteBackward:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)deleteBackwardByDecomposingPreviousCharacter:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)deleteForward:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)deleteToBeginningOfLine:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)deleteToBeginningOfParagraph:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)deleteToEndOfLine:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)deleteToEndOfParagraph:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)deleteToMark:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)deleteWordBackward:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)deleteWordForward:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)ignoreSpelling:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)indent:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)insertBacktab:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)insertLineBreak:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)insertNewline:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)insertNewlineIgnoringFieldEditor:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)insertParagraphSeparator:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)insertTab:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)insertTabIgnoringFieldEditor:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)lowercaseWord:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)makeBaseWritingDirectionLeftToRight:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)makeBaseWritingDirectionRightToLeft:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)makeTextWritingDirectionNatural:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveBackward:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveBackwardAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveDown:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveDownAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveForward:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveForwardAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveLeft:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveLeftAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveParagraphBackwardAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveParagraphForwardAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveRight:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveRightAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveToBeginningOfDocument:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveToBeginningOfDocumentAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveToBeginningOfLine:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveToBeginningOfLineAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveToBeginningOfParagraph:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveToBeginningOfParagraphAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveToBeginningOfSentence:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)moveToBeginningOfSentenceAndModifySelection:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)moveToEndOfDocument:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveToEndOfDocumentAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveToEndOfLine:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveToEndOfLineAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveToEndOfParagraph:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveToEndOfParagraphAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveToEndOfSentence:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)moveToEndOfSentenceAndModifySelection:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)moveToLeftEndOfLine:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveToLeftEndOfLineAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveToRightEndOfLine:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveToRightEndOfLineAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveUp:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveUpAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveWordBackward:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveWordBackwardAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveWordForward:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveWordForwardAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveWordLeft:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveWordLeftAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveWordRight:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)moveWordRightAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)orderFrontSubstitutionsPanel:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)outdent:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)overWrite:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)pageDown:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)pageDownAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)pageUp:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)pageUpAndModifySelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)paste:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)pasteAsPlainText:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)pasteAsRichText:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)pasteFont:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)performFindPanelAction:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)scrollLineDown:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)scrollLineUp:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)scrollPageDown:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)scrollPageUp:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)scrollToBeginningOfDocument:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)scrollToEndOfDocument:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)selectAll:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)selectLine:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)selectParagraph:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)selectSentence:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)selectToMark:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)selectWord:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)setMark:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)showGuessPanel:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)startSpeaking:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)stopSpeaking:(id)sender
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, sender);
}

- (void)subscript:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)superscript:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)swapWithMark:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)takeFindStringFromSelection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)toggleBaseWritingDirection:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)transpose:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)underline:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)unscript:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)uppercaseWord:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)yank:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)yankAndSelect:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)clearText:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)toggleBold:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)toggleItalic:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)toggleUnderline:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (void)insertDictationPhrases:(id)a3 metadata:(id)a4
{
  _QWORD *v5;
  uint64_t v6;
  StringImpl *v7;
  WTF *v8;
  WTF *v9;
  uint64_t v10;
  WTF::StringImpl **v11;
  uint64_t v12;
  WTF::StringImpl *v13;
  WTF *v14;
  WTF *v15;
  int v16;
  unsigned int v17;

  v5 = -[WebView _selectedOrMainFrame](self, "_selectedOrMainFrame");
  if (v5)
  {
    v6 = *(_QWORD *)(v5[1] + 8);
    if (v6)
    {
      WebCore::Document::editor(*(WebCore::Document **)(v6 + 296));
      vectorForDictationPhrasesArray((NSArray *)a3, (unsigned int *)&v15);
      WebCore::Editor::insertDictationPhrases();
      v8 = v15;
      if (v17)
      {
        v9 = (WTF *)((char *)v15 + 16 * v17);
        do
        {
          v10 = *((unsigned int *)v8 + 3);
          if ((_DWORD)v10)
          {
            v11 = *(WTF::StringImpl ***)v8;
            v12 = 8 * v10;
            do
            {
              v13 = *v11;
              *v11 = 0;
              if (v13)
              {
                if (*(_DWORD *)v13 == 2)
                  WTF::StringImpl::destroy(v13, v7);
                else
                  *(_DWORD *)v13 -= 2;
              }
              ++v11;
              v12 -= 8;
            }
            while (v12);
          }
          v14 = *(WTF **)v8;
          if (*(_QWORD *)v8)
          {
            *(_QWORD *)v8 = 0;
            *((_DWORD *)v8 + 2) = 0;
            WTF::fastFree(v14, v7);
          }
          v8 = (WTF *)((char *)v8 + 16);
        }
        while (v8 != v9);
        v8 = v15;
      }
      if (v8)
      {
        v15 = 0;
        v16 = 0;
        WTF::fastFree(v8, v7);
      }
    }
  }
}

- (void)insertText:(id)a3
{
  -[WebView _performResponderOperation:with:](self, "_performResponderOperation:with:", a2, a3);
}

- (id)typingAttributes
{
  _QWORD *v2;
  uint64_t v3;
  WebCore::Editor *v4;
  const void *v5;
  StringImpl *v6;
  CFTypeRef v7;
  const void *v8;
  _BYTE v10[80];
  const void *v11;

  v2 = -[WebView _selectedOrMainFrame](self, "_selectedOrMainFrame");
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2[1] + 8);
  if (!v3)
    return 0;
  v4 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(v3 + 296));
  WebCore::Editor::fontAttributesAtSelectionStart(v4);
  WebCore::FontAttributes::createDictionary((WebCore::FontAttributes *)v10);
  v5 = v11;
  v11 = 0;
  v7 = (id)CFMakeCollectable(v5);
  v8 = v11;
  v11 = 0;
  if (v8)
    CFRelease(v8);
  WebCore::FontAttributes::~FontAttributes((WebCore::FontAttributes *)v10, v6);
  return (id)v7;
}

- (void)_insertNewlineInQuotedContent
{
  objc_msgSend(-[WebView _selectedOrMainFrame](self, "_selectedOrMainFrame"), "_insertParagraphSeparatorInQuotedContent");
}

- (void)_replaceSelectionWithNode:(id)a3 matchStyle:(BOOL)a4
{
  objc_msgSend(-[WebView _selectedOrMainFrame](self, "_selectedOrMainFrame"), "_replaceSelectionWithNode:selectReplacement:smartReplace:matchStyle:", a3, 1, 0, a4);
}

- (BOOL)_selectionIsCaret
{
  _QWORD *v2;
  uint64_t v3;

  v2 = -[WebView _selectedOrMainFrame](self, "_selectedOrMainFrame");
  if (v2)
  {
    v3 = *(_QWORD *)(v2[1] + 8);
    if (v3)
      LOBYTE(v2) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 296) + 3064) + 153) == 1;
    else
      LOBYTE(v2) = 0;
  }
  return (char)v2;
}

- (BOOL)_selectionIsAll
{
  _QWORD *v2;

  v2 = -[WebView _selectedOrMainFrame](self, "_selectedOrMainFrame");
  if (v2 && *(_QWORD *)(v2[1] + 8))
    return WebCore::VisibleSelection::isAll();
  else
    return 0;
}

- (void)_simplifyMarkup:(id)a3 endNode:(id)a4
{
  WebFrame *v6;
  LocalFrame *m_ptr;
  WebCore::Node *v8;
  WebCore::Document *v9;
  WebCore::Editor *v10;
  WebCore::Node *v11;

  v6 = -[WebView mainFrame](self, "mainFrame");
  if (v6)
  {
    if (a3)
    {
      m_ptr = v6->_private->coreFrame.m_ptr;
      if (m_ptr)
      {
        v8 = (WebCore::Node *)*((_QWORD *)a3 + 2);
        v9 = *(WebCore::Document **)(*((_QWORD *)v8 + 5) + 8);
        if (v9 == *((WebCore::Document **)m_ptr + 37))
        {
          v10 = (WebCore::Editor *)WebCore::Document::editor(v9);
          if (a4)
            v11 = (WebCore::Node *)*((_QWORD *)a4 + 2);
          else
            v11 = 0;
          WebCore::Editor::simplifyMarkup(v10, v8, v11);
        }
      }
    }
  }
}

+ (void)_setCacheModel:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  WebCore::MemoryCache *v18;
  WebCore::MemoryCache *v19;
  WebCore::BackForwardCache *v20;
  WebCore::BackForwardCache *v21;
  unint64_t v22;
  CFTypeRef cf;

  if (byte_1ECEC97E4 == 1 && qword_1ECEC9800 == a3)
    return;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C92C50], "sharedURLCache"), "_CFURLCache");
  v5 = (void *)_CFURLCacheCopyCacheDirectory();
  if (!v5)
  {
    v5 = NSHomeDirectory();
    if (v5)
    {
      v6 = v5;
      CFRetain(v5);
      v5 = v6;
    }
  }
  cf = v5;
  if ((byte_1ECEC97E5 & 1) == 0)
  {
    qword_1ECEC9808 = (unint64_t)WTF::ramSize((WTF *)v5) >> 20;
    byte_1ECEC97E5 = 1;
  }
  v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfFileSystemForPath:error:", cf, 0);
  v8 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CB2B00]), "unsignedLongLongValue");
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C92C50], "sharedURLCache");
  v10 = v9;
  v11 = 0;
  if (a3)
  {
    if (a3 != 1)
    {
      if (a3 == 2)
      {
        if ((unint64_t)qword_1ECEC9808 <= 0x3FF)
          v17 = 0x800000;
        else
          v17 = 0x1000000;
        if (v8 >> 27 <= 0x7C)
        {
          if (v8 >> 26 <= 0x7C)
          {
            if (v8 >> 25 <= 0x7C)
            {
              if (v8 >> 24 <= 0x7C)
              {
                if (v8 >> 23 <= 0x7C)
                  v16 = 52428800;
                else
                  v16 = 78643200;
              }
              else
              {
                v16 = 104857600;
              }
            }
            else
            {
              v16 = 131072000;
            }
          }
          else
          {
            v16 = 157286400;
          }
        }
        else
        {
          v16 = 183500800;
        }
        if ((unint64_t)qword_1ECEC9808 <= 0x3FF)
          v13 = 25165824;
        else
          v13 = 50331648;
        v11 = 0x404E000000000000;
      }
      else
      {
        v17 = 0;
        v16 = 0;
        v13 = 0;
      }
      goto LABEL_53;
    }
    v12 = qword_1ECEC9808;
    if ((unint64_t)qword_1ECEC9808 <= 0xFFF && (unint64_t)qword_1ECEC9808 <= 0x7FF)
    {
      if ((unint64_t)qword_1ECEC9808 <= 0x3FF)
      {
        if ((unint64_t)qword_1ECEC9808 <= 0x1FF)
          v17 = 0x80000;
        else
          v17 = 0x100000;
      }
      else
      {
        v17 = 0x200000;
      }
    }
    else
    {
      v17 = 0x400000;
    }
    v14 = 41943040;
    v15 = 20971520;
    if (v8 >> 25 > 0x7C)
      v15 = 31457280;
    if (v8 >> 26 <= 0x7C)
      v14 = v15;
    if (v8 >> 27 <= 0x7C)
      v16 = v14;
    else
      v16 = 52428800;
  }
  else
  {
    v16 = objc_msgSend(v9, "diskCapacity");
    v17 = 0;
    v12 = qword_1ECEC9808;
  }
  if (v12 <= 0x3FF)
    v13 = 12582912;
  else
    v13 = 25165824;
LABEL_53:
  v18 = (WebCore::MemoryCache *)objc_msgSend(v10, "diskCapacity");
  if (v16 <= (unint64_t)v18)
    v16 = (unint64_t)v18;
  v19 = (WebCore::MemoryCache *)WebCore::MemoryCache::singleton(v18);
  v20 = (WebCore::BackForwardCache *)WebCore::MemoryCache::setCapacities(v19);
  *((_QWORD *)v19 + 2) = v11;
  v21 = (WebCore::BackForwardCache *)WebCore::BackForwardCache::singleton(v20);
  WebCore::BackForwardCache::setMaxSize(v21);
  v22 = objc_msgSend(v10, "memoryCapacity");
  if (v17 <= v22)
    v17 = v22;
  if (objc_msgSend(v10, "_CFURLCache"))
    CFURLCacheSetMemoryCapacity();
  else
    objc_msgSend(v10, "setMemoryCapacity:", v17);
  objc_msgSend(v10, "setDiskCapacity:", v16);
  +[WebView _setTileCacheLayerPoolCapacity:](WebView, "_setTileCacheLayerPoolCapacity:", v13);
  qword_1ECEC9800 = a3;
  byte_1ECEC97E4 = 1;
  if (cf)
    CFRelease(cf);
}

+ (unint64_t)_cacheModel
{
  return qword_1ECEC9800;
}

+ (BOOL)shouldIncludeInWebKitStatistics
{
  return 0;
}

- (BOOL)_becomingFirstResponderFromOutside
{
  return self->_private->becomingFirstResponderFromOutside;
}

- (void)_addObject:(id)a3 forIdentifier:(unint64_t)a4
{
  WebViewPrivate *v7;
  uint64_t m_table;
  uint64_t *p_identifierMap;
  int v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *v17;
  int v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  const void *v23;

  v7 = self->_private;
  m_table = (uint64_t)v7->identifierMap.m_impl.var0.m_table;
  if (m_table && *(_DWORD *)(m_table - 12))
  {
    p_identifierMap = (uint64_t *)&v7->identifierMap;
LABEL_6:
    v10 = *(_DWORD *)(m_table - 8);
    goto LABEL_7;
  }
  CFRetain(self);
  p_identifierMap = (uint64_t *)&self->_private->identifierMap;
  m_table = *p_identifierMap;
  if (*p_identifierMap)
    goto LABEL_6;
  WTF::HashTable<unsigned long,WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>>,WTF::DefaultHash<unsigned long>,WTF::HashMap<unsigned long,WTF::RetainPtr<objc_object *>,WTF::DefaultHash<unsigned long>,WTF::HashTraits<unsigned long>,WTF::HashTraits<WTF::RetainPtr<objc_object *>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned long>>::rehash(p_identifierMap, 8u);
  m_table = *p_identifierMap;
  if (*p_identifierMap)
    goto LABEL_6;
  v10 = 0;
LABEL_7:
  v11 = (~(a4 << 32) + a4) ^ ((~(a4 << 32) + a4) >> 22);
  v12 = 9 * ((v11 + ~(v11 << 13)) ^ ((v11 + ~(v11 << 13)) >> 8));
  v13 = (v12 ^ (v12 >> 15)) + ~((v12 ^ (v12 >> 15)) << 27);
  v14 = v10 & ((v13 >> 31) ^ v13);
  v15 = (unint64_t *)(m_table + 16 * v14);
  v16 = *v15;
  if (!*v15)
  {
LABEL_15:
    *v15 = a4;
    if (a3)
      CFRetain(a3);
    v19 = (const void *)v15[1];
    v15[1] = (unint64_t)a3;
    if (v19)
      CFRelease(v19);
    if (*p_identifierMap)
    {
      ++*(_DWORD *)(*p_identifierMap - 12);
      v20 = *p_identifierMap;
      if (*p_identifierMap)
        goto LABEL_21;
    }
    else
    {
      MEMORY[0xFFFFFFFFFFFFFFF4] = 1;
      v20 = *p_identifierMap;
      if (*p_identifierMap)
      {
LABEL_21:
        v21 = (*(_DWORD *)(v20 - 16) + *(_DWORD *)(v20 - 12));
        v22 = *(unsigned int *)(v20 - 4);
        if (v22 <= 0x400)
        {
LABEL_22:
          if (3 * v22 > 4 * v21)
            return;
          if (!(_DWORD)v22)
          {
            WTF::HashTable<unsigned long,WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>>,WTF::DefaultHash<unsigned long>,WTF::HashMap<unsigned long,WTF::RetainPtr<objc_object *>,WTF::DefaultHash<unsigned long>,WTF::HashTraits<unsigned long>,WTF::HashTraits<WTF::RetainPtr<objc_object *>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned long>>::rehash(p_identifierMap, 8u);
            return;
          }
          goto LABEL_33;
        }
LABEL_31:
        if (v22 > 2 * v21)
          return;
LABEL_33:
        WTF::HashTable<unsigned long,WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>>,WTF::DefaultHash<unsigned long>,WTF::HashMap<unsigned long,WTF::RetainPtr<objc_object *>,WTF::DefaultHash<unsigned long>,WTF::HashTraits<unsigned long>,WTF::HashTraits<WTF::RetainPtr<objc_object *>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned long>>::rehash(p_identifierMap, (_DWORD)v22 << (6 * *(_DWORD *)(v20 - 12) >= (2 * v22)));
        return;
      }
    }
    v21 = *(unsigned int *)(v20 - 16);
    v22 = *(unsigned int *)(v20 - 4);
    if (v22 <= 0x400)
      goto LABEL_22;
    goto LABEL_31;
  }
  v17 = 0;
  v18 = 1;
  while (v16 != a4)
  {
    if (v16 == -1)
      v17 = v15;
    v14 = (v14 + v18) & v10;
    v15 = (unint64_t *)(m_table + 16 * v14);
    v16 = *v15;
    ++v18;
    if (!*v15)
    {
      if (v17)
      {
        *v17 = 0;
        v17[1] = 0;
        --*(_DWORD *)(*p_identifierMap - 16);
        v15 = v17;
      }
      goto LABEL_15;
    }
  }
  if (a3)
    CFRetain(a3);
  v23 = (const void *)v15[1];
  v15[1] = (unint64_t)a3;
  if (v23)
    CFRelease(v23);
}

- (id)_objectForIdentifier:(unint64_t)a3
{
  unsigned int *m_tableForLLDB;
  unsigned int v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char *v11;
  const void *v12;

  m_tableForLLDB = self->_private->identifierMap.m_impl.var0.m_tableForLLDB;
  if (!m_tableForLLDB)
    return 0;
  v4 = *(m_tableForLLDB - 2);
  v5 = (~(a3 << 32) + a3) ^ ((~(a3 << 32) + a3) >> 22);
  v6 = 9 * ((v5 + ~(v5 << 13)) ^ ((v5 + ~(v5 << 13)) >> 8));
  v7 = (v6 ^ (v6 >> 15)) + ~((v6 ^ (v6 >> 15)) << 27);
  v8 = v4 & ((v7 >> 31) ^ v7);
  v9 = *(_QWORD *)&m_tableForLLDB[4 * v8];
  if (v9 != a3)
  {
    v10 = 1;
    while (v9)
    {
      v8 = ((_DWORD)v8 + v10) & v4;
      v9 = *(_QWORD *)&m_tableForLLDB[4 * v8];
      ++v10;
      if (v9 == a3)
        goto LABEL_6;
    }
    return 0;
  }
LABEL_6:
  v11 = (char *)&m_tableForLLDB[4 * v8];
  v12 = (const void *)*((_QWORD *)v11 + 1);
  if (v12)
  {
    CFRetain(*((CFTypeRef *)v11 + 1));
    CFRelease(v12);
  }
  return (id)v12;
}

- (void)_removeObjectForIdentifier:(unint64_t)a3
{
  WebViewPrivate *v4;
  unsigned int *m_tableForLLDB;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t *p_identifierMap;
  unsigned int *v14;
  const void *v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int *v20;
  WebView *v21;

  v4 = self->_private;
  m_tableForLLDB = v4->identifierMap.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    v6 = *(m_tableForLLDB - 2);
    v7 = (~(a3 << 32) + a3) ^ ((~(a3 << 32) + a3) >> 22);
    v8 = 9 * ((v7 + ~(v7 << 13)) ^ ((v7 + ~(v7 << 13)) >> 8));
    v9 = (v8 ^ (v8 >> 15)) + ~((v8 ^ (v8 >> 15)) << 27);
    v10 = v6 & ((v9 >> 31) ^ v9);
    v11 = *(_QWORD *)&m_tableForLLDB[4 * v10];
    if (v11 == a3)
    {
LABEL_6:
      if (v10 != *(m_tableForLLDB - 1))
      {
        p_identifierMap = (uint64_t *)&v4->identifierMap;
        v14 = &m_tableForLLDB[4 * v10];
        v15 = (const void *)*((_QWORD *)v14 + 1);
        *(_QWORD *)v14 = -1;
        *((_QWORD *)v14 + 1) = 0;
        if (v15)
          CFRelease(v15);
        ++*(_DWORD *)(*p_identifierMap - 16);
        if (*p_identifierMap)
        {
          --*(_DWORD *)(*p_identifierMap - 12);
          v16 = *p_identifierMap;
          if (!*p_identifierMap)
            goto LABEL_20;
        }
        else
        {
          MEMORY[0xFFFFFFFFFFFFFFF4] = -1;
          v16 = *p_identifierMap;
          if (!*p_identifierMap)
            goto LABEL_20;
        }
        v17 = 6 * *(_DWORD *)(v16 - 12);
        v18 = *(_DWORD *)(v16 - 4);
        if (v17 < v18 && v18 >= 9)
          WTF::HashTable<unsigned long,WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>>,WTF::DefaultHash<unsigned long>,WTF::HashMap<unsigned long,WTF::RetainPtr<objc_object *>,WTF::DefaultHash<unsigned long>,WTF::HashTraits<unsigned long>,WTF::HashTraits<WTF::RetainPtr<objc_object *>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned long>>::rehash(p_identifierMap, v18 >> 1);
      }
    }
    else
    {
      v12 = 1;
      while (v11)
      {
        v10 = ((_DWORD)v10 + v12) & v6;
        v11 = *(_QWORD *)&m_tableForLLDB[4 * v10];
        ++v12;
        if (v11 == a3)
          goto LABEL_6;
      }
    }
  }
LABEL_20:
  v20 = self->_private->identifierMap.m_impl.var0.m_tableForLLDB;
  if (!v20 || !*(v20 - 3))
    v21 = self;
}

- (void)_retrieveKeyboardUIModeFromPreferences:(id)a3
{
  const __CFString *v4;
  Boolean keyExistsAndHasValidFormat;

  v4 = (const __CFString *)*MEMORY[0x1E0C9B248];
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E0C9B248]);
  keyExistsAndHasValidFormat = 0;
  self->_private->_keyboardUIMode = (CFPreferencesGetAppIntegerValue(CFSTR("AppleKeyboardUIMode"), v4, &keyExistsAndHasValidFormat) >> 1) & 1;
}

- (int)_keyboardUIMode
{
  WebViewPrivate *v2;
  void *v5;

  v2 = self->_private;
  if (v2->_keyboardUIModeAccessed)
    return v2->_keyboardUIMode;
  v2->_keyboardUIModeAccessed = 1;
  -[WebView _retrieveKeyboardUIModeFromPreferences:](self, "_retrieveKeyboardUIModeFromPreferences:", 0);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__retrieveKeyboardUIModeFromPreferences_, WebPreferencesChangedInternalNotification[0], 0);
  return self->_private->_keyboardUIMode;
}

- (void)_mainCoreFrame
{
  WebViewPrivate *v2;
  Page *m_ptr;
  _BYTE *v4;

  v2 = self->_private;
  if (!v2)
    return 0;
  m_ptr = v2->page.m_ptr;
  if (!m_ptr)
    return 0;
  v4 = (_BYTE *)*((_QWORD *)m_ptr + 20);
  if (v4[144])
    return 0;
  else
    return v4;
}

- (id)_selectedOrMainFrame
{
  id result;

  result = -[WebView selectedFrame](self, "selectedFrame");
  if (!result)
    return -[WebView mainFrame](self, "mainFrame");
  return result;
}

- (void)_clearCredentials
{
  WebCore::FrameLoader **v2;
  uint64_t (***v3)(_QWORD);
  uint64_t v4;

  v2 = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
  if (v2)
  {
    v3 = (uint64_t (***)(_QWORD))WebCore::FrameLoader::networkingContext(v2[35]);
    if (v3)
    {
      v4 = (**v3)(v3);
      WebCore::CredentialStorage::clearCredentials((WebCore::CredentialStorage *)(v4 + 96));
    }
  }
}

- (BOOL)_needsOneShotDrawingSynchronization
{
  return self->_private->needsOneShotDrawingSynchronization;
}

- (void)_setNeedsOneShotDrawingSynchronization:(BOOL)a3
{
  self->_private->needsOneShotDrawingSynchronization = a3;
}

- (void)_scheduleUpdateRendering
{
  WebViewPrivate *v2;
  uint64_t v4;
  WebCore::RunLoopObserver **v5;
  WebCore::RunLoopObserver **v6;
  void *v7;
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  _QWORD *v14;
  WebCore::RunLoopObserver *v15;
  WTF *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  _QWORD *v25;
  void *v26;
  WebCore::RunLoopObserver *v27;
  WTF *v28;
  void *v29;
  WebViewPrivate *v30;
  WTF *value;
  WebViewRenderingUpdateScheduler *v32;

  v2 = self->_private;
  if (v2->closing)
    return;
  if (!v2->renderingUpdateScheduler.__ptr_.__value_)
  {
    v4 = WTF::fastMalloc((WTF *)0x30);
    *(_QWORD *)v4 = 0;
    *(_DWORD *)(v4 + 8) = 0;
    *(_QWORD *)(v4 + 16) = self;
    *(_QWORD *)(v4 + 24) = 0;
    v5 = (WebCore::RunLoopObserver **)(v4 + 24);
    *(_QWORD *)(v4 + 32) = 0;
    v6 = (WebCore::RunLoopObserver **)(v4 + 32);
    *(_DWORD *)(v4 + 39) = 0;
    v8 = WTF::fastCompactMalloc((WTF *)0x10);
    *(_DWORD *)v8 = 1;
    *(_QWORD *)(v8 + 8) = v4;
    v9 = *(unsigned int **)v4;
    *(_QWORD *)v4 = v8;
    if (v9)
    {
      do
      {
        v10 = __ldaxr(v9);
        v11 = v10 - 1;
      }
      while (__stlxr(v11, v9));
      if (v11)
      {
        v8 = *(_QWORD *)v4;
        if (!*(_QWORD *)v4)
          goto LABEL_8;
      }
      else
      {
        atomic_store(1u, v9);
        WTF::fastFree((WTF *)v9, v7);
        v8 = *(_QWORD *)v4;
        if (!*(_QWORD *)v4)
          goto LABEL_8;
      }
    }
    do
      v12 = __ldaxr((unsigned int *)v8);
    while (__stlxr(v12 + 1, (unsigned int *)v8));
LABEL_8:
    v13 = WTF::fastMalloc((WTF *)0x18);
    v14 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v14 = &off_1E9D6C200;
    v14[1] = v8;
    *(_QWORD *)v13 = v14;
    *(_WORD *)(v13 + 8) = 256;
    *(_QWORD *)(v13 + 16) = 0;
    v15 = *v5;
    *v5 = (WebCore::RunLoopObserver *)v13;
    if (v15)
    {
      WebCore::RunLoopObserver::~RunLoopObserver(v15);
      WTF::fastFree(v16, v17);
    }
    v18 = *(_QWORD *)v4;
    if (*(_QWORD *)v4)
      goto LABEL_15;
    v18 = WTF::fastCompactMalloc((WTF *)0x10);
    *(_DWORD *)v18 = 1;
    *(_QWORD *)(v18 + 8) = v4;
    v20 = *(unsigned int **)v4;
    *(_QWORD *)v4 = v18;
    if (!v20)
      goto LABEL_15;
    do
    {
      v21 = __ldaxr(v20);
      v22 = v21 - 1;
    }
    while (__stlxr(v22, v20));
    if (v22)
    {
      v18 = *(_QWORD *)v4;
      if (*(_QWORD *)v4)
        goto LABEL_15;
    }
    else
    {
      atomic_store(1u, v20);
      WTF::fastFree((WTF *)v20, v19);
      v18 = *(_QWORD *)v4;
      if (*(_QWORD *)v4)
      {
        do
LABEL_15:
          v23 = __ldaxr((unsigned int *)v18);
        while (__stlxr(v23 + 1, (unsigned int *)v18));
      }
    }
    v24 = WTF::fastMalloc((WTF *)0x18);
    v25 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v25 = &off_1E9D6C228;
    v25[1] = v18;
    *(_QWORD *)v24 = v25;
    *(_WORD *)(v24 + 8) = 1280;
    *(_QWORD *)(v24 + 16) = 0;
    v27 = *v6;
    *v6 = (WebCore::RunLoopObserver *)v24;
    if (v27)
    {
      WebCore::RunLoopObserver::~RunLoopObserver(v27);
      WTF::fastFree(v28, v29);
    }
    v30 = self->_private;
    value = (WTF *)v30->renderingUpdateScheduler.__ptr_.__value_;
    v30->renderingUpdateScheduler.__ptr_.__value_ = (WebViewRenderingUpdateScheduler *)v4;
    if (value)
      WebViewRenderingUpdateScheduler::operator delete(value, v26);
  }
  v32 = self->_private->renderingUpdateScheduler.__ptr_.__value_;
  if (*((_BYTE *)v32 + 40))
    *((_BYTE *)v32 + 41) = 1;
  WebCore::RunLoopObserver::schedule();
}

- (void)_updateRendering
{
  Page *m_ptr;

  -[WebView _synchronizeCustomFixedPositionLayoutRect](self, "_synchronizeCustomFixedPositionLayoutRect");
  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    WebCore::Page::updateRendering((WebCore::Page *)m_ptr);
    WebCore::Page::finalizeRenderingUpdate();
  }
}

- (void)_willStartRenderingUpdateDisplay
{
  Page *m_ptr;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
    WebCore::Page::willStartRenderingUpdateDisplay((WebCore::Page *)m_ptr);
}

- (void)_didCompleteRenderingUpdateDisplay
{
  WebViewPrivate *v3;
  WebCore::Page *m_ptr;
  WebViewRenderingUpdateScheduler *value;

  v3 = self->_private;
  m_ptr = (WebCore::Page *)v3->page.m_ptr;
  if (m_ptr)
  {
    WebCore::Page::didCompleteRenderingUpdateDisplay(m_ptr);
    v3 = self->_private;
  }
  value = v3->renderingUpdateScheduler.__ptr_.__value_;
  if (value)
  {
    *((_BYTE *)value + 42) = 0;
    WebCore::RunLoopObserver::schedule();
  }
}

- (void)_didCompleteRenderingFrame
{
  Page *m_ptr;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
    WebCore::Page::didCompleteRenderingFrame((WebCore::Page *)m_ptr);
}

- (BOOL)_flushCompositingChanges
{
  _QWORD *v2;
  WebCore::LocalFrameView *v3;

  v2 = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
  if (v2 && (v3 = (WebCore::LocalFrameView *)v2[36]) != 0)
    return WebCore::LocalFrameView::flushCompositingStateIncludingSubframes(v3);
  else
    return 1;
}

- (void)_scheduleRenderingUpdateForPendingTileCacheRepaint
{
  Page *m_ptr;
  WTF *v3;
  void *v4;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    ++*(_DWORD *)m_ptr;
    WebCore::Page::scheduleRenderingUpdate();
    if (*(_DWORD *)m_ptr == 1)
    {
      v3 = (WTF *)MEMORY[0x1D82A65B4](m_ptr);
      WTF::fastFree(v3, v4);
    }
    else
    {
      --*(_DWORD *)m_ptr;
    }
  }
}

- (void)_enterVideoFullscreenForVideoElement:(NakedPtr<WebCore:(unsigned int)a4 :HTMLVideoElement>)a3 mode:
{
  uint64_t v4;
  void *m_ptr;
  void *v8;
  void *v9;
  CFTypeRef *v10;
  WebViewPrivate *v11;
  void *v12;
  uint64_t m_size;
  char *v14;
  uint64_t v15;
  _QWORD *m_buffer;
  uint64_t v17;
  CFTypeRef v18;
  id v19;
  WebViewPrivate *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  CFTypeRef v25;
  CFTypeRef cf;

  v4 = *(_QWORD *)&a4;
  m_ptr = self->_private->fullscreenController.m_ptr;
  if (m_ptr)
  {
    objc_msgSend(m_ptr, "videoElement");
    if (cf == *(CFTypeRef *)a3.var0)
    {
      v9 = self->_private->fullscreenController.m_ptr;
      v25 = cf;
      v10 = &v25;
LABEL_12:
      objc_msgSend(v9, "setVideoElement:", v10, v23);
      return;
    }
    v8 = self->_private->fullscreenController.m_ptr;
    if (v8)
    {
      objc_msgSend(v8, "videoElement");
      v8 = (void *)cf;
    }
    else
    {
      cf = 0;
    }
    WebCore::HTMLMediaElement::exitFullscreen((WebCore::HTMLMediaElement *)v8);
    v11 = self->_private;
    v12 = v11->fullscreenController.m_ptr;
    cf = v12;
    v11->fullscreenController.m_ptr = 0;
    m_size = v11->fullscreenControllersExiting.m_size;
    if ((_DWORD)m_size == v11->fullscreenControllersExiting.m_capacity)
    {
      v14 = WTF::Vector<WTF::RetainPtr<WebVideoFullscreenController>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v11->fullscreenControllersExiting, m_size + 1, (unint64_t)&cf);
      v15 = v11->fullscreenControllersExiting.m_size;
      m_buffer = v11->fullscreenControllersExiting.m_buffer;
      v17 = *(_QWORD *)v14;
      *(_QWORD *)v14 = 0;
      m_buffer[v15] = v17;
      v18 = cf;
      v11->fullscreenControllersExiting.m_size = v15 + 1;
      cf = 0;
      if (v18)
        CFRelease(v18);
      v9 = self->_private->fullscreenController.m_ptr;
      if (v9)
        goto LABEL_11;
    }
    else
    {
      *((_QWORD *)v11->fullscreenControllersExiting.m_buffer + m_size) = v12;
      v11->fullscreenControllersExiting.m_size = m_size + 1;
      v9 = self->_private->fullscreenController.m_ptr;
      if (v9)
      {
LABEL_11:
        v23 = *(_QWORD *)a3.var0;
        v10 = (CFTypeRef *)&v23;
        goto LABEL_12;
      }
    }
  }
  v19 = objc_alloc_init(MEMORY[0x1E0DCDDB0]);
  v20 = self->_private;
  v21 = v20->fullscreenController.m_ptr;
  v20->fullscreenController.m_ptr = v19;
  if (v21)
    CFRelease(v21);
  v22 = self->_private->fullscreenController.m_ptr;
  v24 = *(_QWORD *)a3.var0;
  objc_msgSend(v22, "setVideoElement:", &v24);
  objc_msgSend(self->_private->fullscreenController.m_ptr, "enterFullscreen:mode:", objc_msgSend((id)objc_msgSend((id)-[WebView window](self, "window"), "hostLayer"), "delegate"), v4);
}

- (void)_exitVideoFullscreen
{
  WebViewPrivate *v3;
  void *m_ptr;
  unsigned int m_size;
  WebViewPrivate *v6;
  void *v7;
  CFTypeRef *m_buffer;
  CFTypeRef v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = self->_private;
  m_ptr = v3->fullscreenController.m_ptr;
  m_size = v3->fullscreenControllersExiting.m_size;
  if (!m_ptr)
  {
    if (!m_size)
      return;
LABEL_7:
    m_buffer = (CFTypeRef *)v3->fullscreenControllersExiting.m_buffer;
    m_ptr = (void *)*m_buffer;
    if (*m_buffer)
    {
      CFRetain(*m_buffer);
      v3 = self->_private;
      m_buffer = (CFTypeRef *)v3->fullscreenControllersExiting.m_buffer;
      v9 = *m_buffer;
      *m_buffer = 0;
      if (v9)
      {
        CFRelease(v9);
        v10 = m_buffer + 1;
        v11 = v3->fullscreenControllersExiting.m_size;
        v12 = (uint64_t)v3->fullscreenControllersExiting.m_buffer + 8 * v11;
        if (m_buffer + 1 == (CFTypeRef *)v12)
          goto LABEL_14;
        goto LABEL_13;
      }
    }
    else
    {
      *m_buffer = 0;
    }
    v10 = m_buffer + 1;
    v11 = v3->fullscreenControllersExiting.m_size;
    v12 = (uint64_t)v3->fullscreenControllersExiting.m_buffer + 8 * v11;
    if (m_buffer + 1 == (CFTypeRef *)v12)
      goto LABEL_14;
    do
    {
LABEL_13:
      *(v10 - 1) = *v10;
      *v10++ = 0;
    }
    while (v10 != (_QWORD *)v12);
LABEL_14:
    v3->fullscreenControllersExiting.m_size = v11 - 1;
    objc_msgSend(m_ptr, "exitFullscreen");
    if (!m_ptr)
      return;
    goto LABEL_15;
  }
  if (m_size)
    goto LABEL_7;
  CFRetain(v3->fullscreenController.m_ptr);
  v6 = self->_private;
  v7 = v6->fullscreenController.m_ptr;
  v6->fullscreenController.m_ptr = 0;
  if (v7)
    CFRelease(v7);
  objc_msgSend(m_ptr, "exitFullscreen");
LABEL_15:
  CFRelease(m_ptr);
}

- (void)_getWebCoreDictationAlternatives:(void *)a3 fromTextAlternatives:(const void *)a4
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v4 = *((unsigned int *)a4 + 3);
  if ((_DWORD)v4)
  {
    v6 = *(_QWORD *)a4 + 16;
    v7 = 24 * v4;
    do
    {
      v12 = WebCore::AlternativeTextUIController::addAlternatives();
      if (v12)
      {
        v14 = *(_OWORD *)(v6 - 16);
        v15 = v12;
        v13 = *((unsigned int *)a3 + 3);
        if ((_DWORD)v13 == *((_DWORD *)a3 + 2))
        {
          v8 = WTF::Vector<WebCore::DictationAlternative,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)a3, v13 + 1, (unint64_t)&v14);
          v9 = *(_QWORD *)a3 + 24 * *((unsigned int *)a3 + 3);
          v10 = *(_OWORD *)v8;
          v11 = *((_QWORD *)v8 + 2);
        }
        else
        {
          v9 = *(_QWORD *)a3 + 24 * v13;
          v10 = v14;
          v11 = v15;
        }
        *(_QWORD *)(v9 + 16) = v11;
        *(_OWORD *)v9 = v10;
        ++*((_DWORD *)a3 + 3);
      }
      v6 += 24;
      v7 -= 24;
    }
    while (v7);
  }
}

- (void)_removeDictationAlternatives:()ObjectIdentifierGeneric<WebCore:()WTF:(unsigned long long>)a3 :ObjectIdentifierMainThreadAccessTraits<uint64_t> :DictationContextType
{
  JUMPOUT(0x1D82A6098);
}

- (Vector<WTF::String,)_dictationAlternatives:()ObjectIdentifierGeneric<WebCore:()WTF:(unsigned long long>)a3 :ObjectIdentifierMainThreadAccessTraits<uint64_t> :DictationContextType
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unsigned int *v6;
  uint64_t v7;
  Vector<WTF::String, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> result;

  v4 = v3;
  v5 = (void *)objc_msgSend((id)WebCore::AlternativeTextUIController::alternativesForContext(), "alternativeStrings");
  v6 = WTF::makeVector<WTF::String>(v5, v4);
  result.var1 = v7;
  result.var2 = HIDWORD(v7);
  result.var0 = (String *)v6;
  return result;
}

- (CGPoint)_convertPointFromRootView:(CGPoint)a3
{
  double y;
  CGFloat x;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[WebView bounds](self, "bounds");
  v6 = v5 - y;
  v7 = x;
  result.y = v6;
  result.x = v7;
  return result;
}

- (CGRect)_convertRectFromRootView:(CGRect)a3
{
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[WebView bounds](self, "bounds");
  v8 = v7 - y - height;
  v9 = x;
  v10 = width;
  v11 = height;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v9;
  return result;
}

- (void)hideFormValidationMessage
{
  WebViewPrivate *v2;
  ValidationBubble *m_ptr;
  WTF *v4;
  void *v5;

  v2 = self->_private;
  m_ptr = v2->formValidationBubble.m_ptr;
  v2->formValidationBubble.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 1)
    {
      v4 = (WTF *)MEMORY[0x1D82A53F0]();
      WTF::fastFree(v4, v5);
    }
    else
    {
      --*(_DWORD *)m_ptr;
    }
  }
}

- (id)candidateList
{
  return 0;
}

- (void)_closeWindow
{
  objc_msgSend(-[WebView _UIDelegateForwarder](self, "_UIDelegateForwarder"), "webViewClose:", self);
}

- (void)_setDeviceOrientationProvider:(id)a3
{
  WebViewPrivate *v3;

  v3 = self->_private;
  if (v3)
    v3->m_deviceOrientationProvider = (WebDeviceOrientationProvider *)a3;
}

- (id)_deviceOrientationProvider
{
  WebViewPrivate *v2;

  v2 = self->_private;
  if (v2)
    return v2->m_deviceOrientationProvider;
  else
    return 0;
}

- (void)_setGeolocationProvider:(id)a3
{
  WebViewPrivate *v3;

  v3 = self->_private;
  if (v3)
    v3->_geolocationProvider = (WebGeolocationProvider *)a3;
}

- (id)_geolocationProvider
{
  WebViewPrivate *v2;

  v2 = self->_private;
  if (v2)
    return v2->_geolocationProvider;
  else
    return 0;
}

- (void)_geolocationDidChangePosition:(id)a3
{
  WebViewPrivate *v3;
  Page *m_ptr;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  char v13;
  _OWORD v14[7];
  char v15;

  v3 = self->_private;
  if (v3)
  {
    m_ptr = v3->page.m_ptr;
    if (m_ptr)
    {
      *(_QWORD *)&v14[0] = WebCore::GeolocationController::supplementName((WebCore::GeolocationController *)self);
      *((_QWORD *)&v14[0] + 1) = v6;
      WTF::HashTable<WTF::ASCIILiteral,WTF::KeyValuePair<WTF::ASCIILiteral,std::unique_ptr<WebCore::Supplement<WebCore::Page>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::ASCIILiteral,std::unique_ptr<WebCore::Supplement<WebCore::Page>>>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebCore::Supplement<WebCore::Page>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebCore::Supplement<WebCore::Page>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::ASCIILiteral>>::lookup<WTF::HashMapTranslatorAdapter<WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebCore::Supplement<WebCore::Page>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebCore::Supplement<WebCore::Page>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::IdentityHashTranslator<WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebCore::Supplement<WebCore::Page>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebCore::Supplement<WebCore::Page>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ASCIILiteral>>>,WTF::ASCIILiteral>(*((const char ***)m_ptr + 1), (const char **)v14);
      if (a3)
      {
        v7 = *((_QWORD *)a3 + 1);
        v8 = *(_OWORD *)(v7 + 40);
        v9 = *(_OWORD *)(v7 + 24);
        v14[0] = *(_OWORD *)(v7 + 8);
        v14[1] = v9;
        v14[2] = v8;
        v10 = *(_OWORD *)(v7 + 72);
        v11 = *(_OWORD *)(v7 + 104);
        v12 = *(_OWORD *)(v7 + 56);
        v14[5] = *(_OWORD *)(v7 + 88);
        v14[6] = v11;
        v14[3] = v12;
        v14[4] = v10;
        v13 = 1;
      }
      else
      {
        v13 = 0;
        LOBYTE(v14[0]) = 0;
      }
      v15 = v13;
      WebCore::GeolocationController::positionChanged();
    }
  }
}

- (void)_geolocationDidFailWithMessage:(id)a3
{
  WebViewPrivate *v3;
  StringImpl *v5;
  WTF *v6;
  WTF::StringImpl *v7;
  int v8;
  Page *m_ptr;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  StringImpl *v12;
  WTF::StringImpl *v13;
  WTF *v14;
  WTF::StringImpl *v15[2];

  v3 = self->_private;
  if (v3 && v3->page.m_ptr)
  {
    MEMORY[0x1D82A3998](v15, a3);
    v6 = (WTF *)WTF::fastMalloc((WTF *)0x10);
    *(_QWORD *)v6 = 0x100000001;
    v7 = v15[0];
    if (v15[0])
    {
      v8 = *(_DWORD *)v15[0];
      *(_DWORD *)v15[0] += 2;
      *((_QWORD *)v6 + 1) = v7;
      v14 = v6;
      v15[0] = 0;
      if (v8)
        *(_DWORD *)v7 = v8;
      else
        v7 = (WTF::StringImpl *)WTF::StringImpl::destroy(v7, v5);
    }
    else
    {
      *((_QWORD *)v6 + 1) = 0;
      v14 = v6;
    }
    m_ptr = self->_private->page.m_ptr;
    v10 = (WTF::StringImpl *)WebCore::GeolocationController::supplementName(v7);
    if (m_ptr)
    {
      v15[0] = v10;
      v15[1] = v11;
      WTF::HashTable<WTF::ASCIILiteral,WTF::KeyValuePair<WTF::ASCIILiteral,std::unique_ptr<WebCore::Supplement<WebCore::Page>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::ASCIILiteral,std::unique_ptr<WebCore::Supplement<WebCore::Page>>>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebCore::Supplement<WebCore::Page>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebCore::Supplement<WebCore::Page>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::ASCIILiteral>>::lookup<WTF::HashMapTranslatorAdapter<WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebCore::Supplement<WebCore::Page>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebCore::Supplement<WebCore::Page>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::IdentityHashTranslator<WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebCore::Supplement<WebCore::Page>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebCore::Supplement<WebCore::Page>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ASCIILiteral>>>,WTF::ASCIILiteral>(*((const char ***)m_ptr + 1), (const char **)v15);
    }
    WebCore::GeolocationController::errorOccurred();
    if (v14)
    {
      if (*(_DWORD *)v14 == 1)
      {
        v13 = (WTF::StringImpl *)*((_QWORD *)v14 + 1);
        *((_QWORD *)v14 + 1) = 0;
        if (v13)
        {
          if (*(_DWORD *)v13 == 2)
            WTF::StringImpl::destroy(v13, v12);
          else
            *(_DWORD *)v13 -= 2;
        }
        WTF::fastFree(v14, v12);
      }
      else
      {
        --*(_DWORD *)v14;
      }
    }
  }
}

- (void)_resetAllGeolocationPermission
{
  WebCore::LocalFrame *v2;

  v2 = -[WebView _mainCoreFrame](self, "_mainCoreFrame");
  if (v2)
    WebCore::LocalFrame::resetAllGeolocationPermission(v2);
}

- (void)_setNotificationProvider:(id)a3
{
  WebViewPrivate *v3;

  v3 = self->_private;
  if (v3)
  {
    if (!v3->_notificationProvider)
    {
      v3->_notificationProvider = (WebNotificationProvider *)a3;
      -[WebNotificationProvider registerWebView:](self->_private->_notificationProvider, "registerWebView:", self);
    }
  }
}

- (id)_notificationProvider
{
  WebViewPrivate *v2;

  v2 = self->_private;
  if (v2)
    return v2->_notificationProvider;
  else
    return 0;
}

- (void)_notificationDidShow:(id)a3
{
  objc_msgSend(-[WebView _notificationProvider](self, "_notificationProvider"), "webView:didShowNotification:", self, a3);
}

- (void)_notificationDidClick:(id)a3
{
  objc_msgSend(-[WebView _notificationProvider](self, "_notificationProvider"), "webView:didClickNotification:", self, a3);
}

- (void)_notificationsDidClose:(id)a3
{
  objc_msgSend(-[WebView _notificationProvider](self, "_notificationProvider"), "webView:didCloseNotifications:", self, a3);
}

- (id)_notificationIDForTesting:(OpaqueJSValue *)a3
{
  Page *m_ptr;
  uint64_t v4;
  uint64_t v5;
  StringImpl *v6;
  const __CFString *v7;
  WTF::StringImpl *v8;
  int v9;
  WTF *v11;
  void *v12;
  _QWORD v13[3];
  WTF::StringImpl *v14;

  m_ptr = self->_private->page.m_ptr;
  if (m_ptr)
  {
    ++*(_DWORD *)m_ptr;
    -[WebFrame globalContext](-[WebView mainFrame](self, "mainFrame"), "globalContext");
    v4 = WebCore::JSNotification::toWrapped();
    v5 = *(_QWORD *)(v4 + 72);
    v13[0] = *(_QWORD *)(v4 + 64);
    v13[1] = v5;
    WTF::UUID::toString((WTF::UUID *)v13);
    if (v14)
    {
      v7 = (const __CFString *)WTF::StringImpl::operator NSString *();
      v8 = v14;
      v14 = 0;
      if (v8)
      {
        if (*(_DWORD *)v8 != 2)
        {
          *(_DWORD *)v8 -= 2;
          v9 = *(_DWORD *)m_ptr - 1;
          if (*(_DWORD *)m_ptr == 1)
            goto LABEL_11;
LABEL_9:
          *(_DWORD *)m_ptr = v9;
          return (id)v7;
        }
        WTF::StringImpl::destroy(v8, v6);
        v9 = *(_DWORD *)m_ptr - 1;
        if (*(_DWORD *)m_ptr != 1)
          goto LABEL_9;
LABEL_11:
        v11 = (WTF *)MEMORY[0x1D82A65B4](m_ptr);
        WTF::fastFree(v11, v12);
        return (id)v7;
      }
    }
    else
    {
      v7 = &stru_1E9D6EC48;
    }
    v9 = *(_DWORD *)m_ptr - 1;
    if (*(_DWORD *)m_ptr != 1)
      goto LABEL_9;
    goto LABEL_11;
  }
  return 0;
}

- (void)_clearNotificationPermissionState
{
  WebCore::NotificationController *m_ptr;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  WTF *v10;
  void *v11;
  char v12;
  char *v13;
  char v14;

  m_ptr = (WebCore::NotificationController *)self->_private->page.m_ptr;
  if (!m_ptr)
    return;
  ++*(_DWORD *)m_ptr;
  v3 = WebCore::NotificationController::clientFrom(m_ptr, (Page *)a2);
  v5 = *(_QWORD *)(v3 + 24);
  if (!v5)
  {
LABEL_12:
    if (*(_DWORD *)m_ptr == 1)
    {
      v10 = (WTF *)MEMORY[0x1D82A65B4](m_ptr);
      WTF::fastFree(v10, v11);
    }
    else
    {
      --*(_DWORD *)m_ptr;
    }
    return;
  }
  *(_QWORD *)(v3 + 24) = 0;
  v6 = *(unsigned int *)(v5 - 4);
  if (!(_DWORD)v6)
  {
LABEL_11:
    WTF::fastFree((WTF *)(v5 - 16), v4);
    goto LABEL_12;
  }
  v7 = v5;
  while (1)
  {
    v8 = *(unsigned int *)(v7 + 24);
    if ((_DWORD)v8 == -1)
      break;
    v13 = &v12;
    if ((((uint64_t (*)(char **, uint64_t))__const__ZNSt3__116__variant_detail12__visitation6__base11__visit_altB8sn180100INS1_9__variant15__value_visitorIN3WTF7VisitorIZNK7WebCore18SecurityOriginData23isHashTableDeletedValueEvEUlRKNS9_5TupleEE_JZNKS9_23isHashTableDeletedValueEvEUlRKNS8_16ProcessQualifiedINS6_23ObjectIdentifierGenericINS8_26OpaqueOriginIdentifierTypeENS6_38ObjectIdentifierThreadSafeAccessTraitsIyEEyEEEEE_EEEEEJRKNS0_6__implIJSA_SK_EEEEEEDcOT_DpOT0____fmatrix_0[v8])(&v13, v7) & 1) == 0)
    {
      v9 = *(unsigned int *)(v7 + 24);
      if ((_DWORD)v9 != -1)
        ((void (*)(char *, uint64_t))*(&__const__ZNSt3__116__variant_detail12__visitation6__base11__visit_altB8sn180100IZNS0_6__dtorINS0_8__traitsIJN7WebCore18SecurityOriginData5TupleENS6_16ProcessQualifiedIN3WTF23ObjectIdentifierGenericINS6_26OpaqueOriginIdentifierTypeENSA_38ObjectIdentifierThreadSafeAccessTraitsIyEEyEEEEEEELNS0_6_TraitE1EE9__destroyB8sn180100EvEUlRT_E_JRSJ_EEEDcOSK_DpOT0____fmatrix_0
                                               + v9))(&v14, v7);
      *(_DWORD *)(v7 + 24) = -1;
    }
    v7 += 32;
    if (!--v6)
      goto LABEL_11;
  }
  std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
}

+ (Class)_getPDFRepresentationClass
{
  Class result;

  result = (Class)s_pdfRepresentationClass;
  if (!s_pdfRepresentationClass)
    return (Class)objc_opt_class();
  return result;
}

+ (void)_setPDFRepresentationClass:(Class)a3
{
  s_pdfRepresentationClass = (uint64_t)a3;
}

+ (Class)_getPDFViewClass
{
  Class result;

  result = (Class)s_pdfViewClass;
  if (!s_pdfViewClass)
    return (Class)objc_opt_class();
  return result;
}

+ (void)_setPDFViewClass:(Class)a3
{
  s_pdfViewClass = (uint64_t)a3;
}

- (id)_editableElementsInRect:(CGRect)a3
{
  WTF *v3;
  id v4;
  void *v5;
  WebCore::Node **v6;
  uint64_t v7;
  WebCore::Node *v8;
  CFTypeRef v9;
  void *v11;
  WTF *v12;
  uint64_t v13;
  uint64_t v14;
  WTF *v15;
  _BYTE v16[16];
  WTF *v17;
  int v18;
  unsigned int v19;
  CGRect v20;

  v20 = a3;
  if (!self)
    return (id)MEMORY[0x1E0C9AA60];
  -[WebView page](self, "page");
  v3 = v17;
  if (!v17)
    return (id)MEMORY[0x1E0C9AA60];
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v16, &v20);
  WebCore::Page::editableElementsInRect(v3, (const WebCore::FloatRect *)v16);
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v5 = (void *)objc_msgSend(v4, "initWithCapacity:", v19);
  if (v19)
  {
    v6 = (WebCore::Node **)v17;
    v7 = 8 * v19;
    do
    {
      v8 = kit(*v6);
      if (v8)
        objc_msgSend(v5, "addObject:", v8);
      ++v6;
      v7 -= 8;
    }
    while (v7);
  }
  v9 = (id)CFMakeCollectable(v5);
  if (v19)
  {
    v12 = v17;
    v13 = 8 * v19;
    do
    {
      v14 = *(_QWORD *)v12;
      *(_QWORD *)v12 = 0;
      if (v14)
      {
        if (*(_DWORD *)(v14 + 24) == 2)
        {
          if ((*(_WORD *)(v14 + 30) & 0x400) == 0)
            WebCore::Node::removedLastRef((WebCore::Node *)v14);
        }
        else
        {
          *(_DWORD *)(v14 + 24) -= 2;
        }
      }
      v12 = (WTF *)((char *)v12 + 8);
      v13 -= 8;
    }
    while (v13);
  }
  v15 = v17;
  if (!v17)
    return (id)v9;
  v17 = 0;
  v18 = 0;
  WTF::fastFree(v15, v11);
  return (id)v9;
}

- (void)revealCurrentSelection
{
  WebCore::Page *v2;

  if (self)
  {
    -[WebView page](self, "page");
    if (v2)
      WebCore::Page::revealCurrentSelection(v2);
  }
}

- (void)_installVisualIdentificationOverlayForViewIfNeeded:(id)a3 kind:(id)a4
{
  objc_msgSend(MEMORY[0x1E0DCDDB8], "installForWebViewIfNeeded:kind:deprecated:", a3, a4, 1);
}

- (id)fullScreenPlaceholderView
{
  return 0;
}

- (void)_preferencesChangedGenerated:(id)a3
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  StringImpl *v15;
  WTF::StringImpl *v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  StringImpl *v21;
  WTF::StringImpl *v22;
  StringImpl *v23;
  WTF::StringImpl *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  float v29;
  int v30;
  uint64_t v31;
  int v32;
  int v33;
  unint64_t v34;
  int v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  float v43;
  float v44;
  float v45;
  int v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  float v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  float v61;
  StringImpl *v62;
  WTF::StringImpl *v63;
  uint64_t v64;
  uint64_t v65;
  float v66;
  int v67;
  uint64_t v68;
  float v69;
  float v70;
  int v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  int v81;
  uint64_t v82;
  float v83;
  int v84;
  uint64_t v85;
  int v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  int v102;
  uint64_t v103;
  int v104;
  uint64_t v105;
  int v106;
  uint64_t v107;
  unsigned int *v108;
  int v109;
  unint64_t v110;
  int v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  int v118;
  uint64_t v119;
  unint64_t v120;
  int v121;
  uint64_t v122;
  uint64_t v123;
  int v124;
  uint64_t v125;
  int v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  int v130;
  uint64_t v131;
  int v132;
  uint64_t v133;
  int v134;
  unint64_t v135;
  uint64_t v136;
  int v137;
  uint64_t v138;
  int v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  int v143;
  uint64_t v144;
  int v145;
  uint64_t v146;
  int v147;
  uint64_t v148;
  int v149;
  uint64_t v150;
  int v151;
  uint64_t v152;
  int v153;
  uint64_t v154;
  uint64_t v155;
  int v156;
  uint64_t v157;
  uint64_t v158;
  int v159;
  unint64_t v160;
  int v161;
  uint64_t v162;
  StringImpl *v163;
  WTF::StringImpl *v164;
  int v165;
  uint64_t v166;
  int v167;
  uint64_t v168;
  int v169;
  uint64_t v170;
  int v171;
  uint64_t v172;
  int v173;
  uint64_t v174;
  int v175;
  uint64_t v176;
  int v177;
  uint64_t v178;
  int v179;
  uint64_t v180;
  int v181;
  uint64_t v182;
  int v183;
  uint64_t v184;
  StringImpl *v185;
  WTF::StringImpl *v186;
  int v187;
  uint64_t v188;
  int v189;
  uint64_t v190;
  int v191;
  uint64_t v192;
  int v193;
  uint64_t v194;
  int v195;
  uint64_t v196;
  int v197;
  uint64_t v198;
  int v199;
  uint64_t v200;
  int v201;
  uint64_t v202;
  int v203;
  uint64_t v204;
  int v205;
  uint64_t v206;
  float v207;
  float v208;
  StringImpl *v209;
  WTF::StringImpl *v210;
  WTF::StringImpl *v211;
  int v212;
  uint64_t v213;
  StringImpl *v214;
  WTF::StringImpl *v215;
  int v216;
  uint64_t v217;
  int v218;
  uint64_t v219;
  StringImpl *v220;
  WTF::StringImpl *v221;
  float v222;
  int v223;
  uint64_t v224;
  float v225;
  int v226;
  uint64_t v227;
  int v228;
  uint64_t v229;
  int v230;
  uint64_t v231;
  int v232;
  uint64_t v233;
  int v234;
  uint64_t v235;
  uint64_t v236;
  int v237;
  uint64_t v238;
  int v239;
  uint64_t v240;
  uint64_t v241;
  int v242;
  uint64_t v243;
  int v244;
  uint64_t v245;
  int v246;
  uint64_t v247;
  int v248;
  unsigned int *v249;
  uint64_t v250;
  unint64_t v251;
  int v252;
  unint64_t v253;
  int v254;
  uint64_t v255;
  int v256;
  uint64_t v257;
  int v258;
  uint64_t v259;
  int v260;
  uint64_t v261;
  int v262;
  uint64_t v263;
  int v264;
  int v265;
  unint64_t v266;
  int v267;
  uint64_t v268;
  int v269;
  uint64_t v270;
  int v271;
  uint64_t v272;
  unint64_t v273;
  int v274;
  uint64_t v275;
  int v276;
  uint64_t v277;
  uint64_t v278;
  int v279;
  uint64_t v280;
  int v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  int v286;
  uint64_t v287;
  uint64_t v288;
  int v289;
  uint64_t v290;
  uint64_t v291;
  int v292;
  uint64_t v293;
  int v294;
  uint64_t v295;
  int v296;
  uint64_t v297;
  int v298;
  uint64_t v299;
  int v300;
  uint64_t v301;
  uint64_t v302;
  int v303;
  uint64_t v304;
  uint64_t v305;
  int v306;
  uint64_t v307;
  int v308;
  uint64_t v309;
  int v310;
  uint64_t v311;
  int v312;
  uint64_t v313;
  int v314;
  uint64_t v315;
  int v316;
  uint64_t v317;
  int v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  int v322;
  uint64_t v323;
  int v324;
  uint64_t v325;
  int v326;
  uint64_t v327;
  int v328;
  uint64_t v329;
  int v330;
  uint64_t v331;
  int v332;
  uint64_t v333;
  int v334;
  uint64_t v335;
  uint64_t v336;
  int v337;
  uint64_t v338;
  int v339;
  uint64_t v340;
  int v341;
  uint64_t v342;
  int v343;
  uint64_t v344;
  int v345;
  uint64_t v346;
  int v347;
  uint64_t v348;
  int v349;
  uint64_t v350;
  int v351;
  uint64_t v352;
  int v353;
  uint64_t v354;
  int v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  int v359;
  uint64_t v360;
  int v361;
  uint64_t v362;
  int v363;
  uint64_t v364;
  int v365;
  uint64_t v366;
  int v367;
  uint64_t v368;
  uint64_t v369;
  int v370;
  uint64_t v371;
  int v372;
  uint64_t v373;
  uint64_t v374;
  int v375;
  uint64_t v376;
  int v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  int v381;
  uint64_t v382;
  int v383;
  uint64_t v384;
  uint64_t v385;
  int v386;
  uint64_t v387;
  int v388;
  uint64_t v389;
  int v390;
  uint64_t v391;
  int v392;
  uint64_t v393;
  int v394;
  uint64_t v395;
  int v396;
  uint64_t v397;
  uint64_t v398;
  int v399;
  uint64_t v400;
  int v401;
  uint64_t v402;
  int v403;
  uint64_t v404;
  uint64_t v405;
  int v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  int v410;
  uint64_t v411;
  uint64_t v412;
  int v413;
  uint64_t v414;
  int v415;
  uint64_t v416;
  uint64_t v417;
  int v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  int v422;
  uint64_t v423;
  uint64_t v424;
  int v425;
  uint64_t v426;
  int v427;
  uint64_t v428;
  int v429;
  unint64_t v430;
  int v431;
  uint64_t v432;
  int v433;
  uint64_t v434;
  int v435;
  uint64_t v436;
  int v437;
  uint64_t v438;
  int v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  int v443;
  int v444;
  unint64_t v445;
  uint64_t v446;
  int v447;
  uint64_t v448;
  uint64_t v449;
  int v450;
  uint64_t v451;
  int v452;
  uint64_t v453;
  int v454;
  uint64_t v455;
  int v456;
  uint64_t v457;
  uint64_t v458;
  int v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  int v463;
  uint64_t v464;
  int v465;
  uint64_t v466;
  uint64_t v467;
  int v468;
  uint64_t v469;
  int v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  int v476;
  uint64_t v477;
  int v478;
  uint64_t v479;
  uint64_t v480;
  int v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  int v485;
  uint64_t v486;
  int v487;
  uint64_t v488;
  int v489;
  uint64_t v490;
  int v491;
  unint64_t v492;
  uint64_t v493;
  int v494;
  unint64_t v495;
  unint64_t v496;
  uint64_t v497;
  int v498;
  uint64_t v499;
  int v500;
  uint64_t v501;
  uint64_t v502;
  int v503;
  uint64_t v504;
  int v505;
  uint64_t v506;
  int v507;
  uint64_t v508;
  int v509;
  uint64_t v510;
  int v511;
  uint64_t v512;
  int v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  uint64_t v517;
  uint64_t v518;
  int v519;
  uint64_t v520;
  uint64_t v521;
  int v522;
  uint64_t v523;
  int v524;
  uint64_t v525;
  int v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  int v531;
  uint64_t v532;
  uint64_t v533;
  int v534;
  uint64_t v535;
  int v536;
  uint64_t v537;
  uint64_t v538;
  int v539;
  uint64_t v540;
  int v541;
  uint64_t v542;
  int v543;
  uint64_t v544;
  uint64_t v545;
  uint64_t v546;
  int v547;
  uint64_t v548;
  uint64_t v549;
  int v550;
  uint64_t v551;
  uint64_t v552;
  int v553;
  uint64_t v554;
  int v555;
  int v556;
  unint64_t v557;
  unsigned int v558;
  int v559;
  uint64_t v560;
  int v561;
  uint64_t v562;
  int v563;
  uint64_t v564;
  uint64_t v565;
  int v566;
  uint64_t v567;
  int v568;
  uint64_t v569;
  int v570;
  uint64_t v571;
  uint64_t v572;
  int v573;
  uint64_t v574;
  int v575;
  uint64_t v576;
  uint64_t v577;
  uint64_t v578;
  int v579;
  uint64_t v580;
  int v581;
  uint64_t v582;
  int v583;
  uint64_t v584;
  int v585;
  uint64_t v586;
  uint64_t v587;
  uint64_t v588;
  int v589;
  uint64_t v590;
  int v591;
  uint64_t v592;
  uint64_t v593;
  int v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;
  uint64_t v598;
  uint64_t v599;
  int v600;
  uint64_t v601;
  int v602;
  uint64_t v603;
  uint64_t v604;
  int v605;
  uint64_t v606;
  int v607;
  uint64_t v608;
  int v609;
  uint64_t v610;
  int v611;
  int v612;
  unint64_t v613;
  unsigned int v614;
  int v615;
  uint64_t v616;
  int v617;
  uint64_t v618;
  uint64_t v619;
  uint64_t v620;
  int v621;
  uint64_t v622;
  int v623;
  uint64_t v624;
  int v625;
  uint64_t v626;
  int v627;
  uint64_t v628;
  uint64_t v629;
  uint64_t v630;
  uint64_t v631;
  uint64_t v632;
  uint64_t v633;
  uint64_t v634;
  uint64_t v635;
  unint64_t v636;
  int v637;
  uint64_t v638;
  int v639;
  uint64_t v640;
  int v641;
  uint64_t v642;
  int v643;
  uint64_t v644;
  int v645;
  uint64_t v646;
  int v647;
  unint64_t v648;
  int v649;
  unint64_t v650;
  int v651;
  unint64_t v652;
  int v653;
  int v654;
  unint64_t v655;
  uint64_t v656;
  uint64_t v657;
  int v658;
  uint64_t v659;
  int v660;
  uint64_t v661;
  int v662;
  uint64_t v663;
  uint64_t v664;
  int v665;
  unint64_t v666;
  int v667;
  unint64_t v668;
  int v669;
  int v670;
  unint64_t v671;
  int v672;
  int v673;
  unint64_t v674;
  uint64_t v675;
  int v676;
  uint64_t v677;
  int v678;
  uint64_t v679;
  int v680;
  uint64_t v681;
  uint64_t v682;
  int v683;
  int v684;
  unint64_t v685;
  int v686;
  int v687;
  unint64_t v688;
  int v689;
  int v690;
  unint64_t v691;
  int v692;
  int v693;
  unint64_t v694;
  uint64_t v695;
  int v696;
  int v697;
  unint64_t v698;
  int v699;
  unint64_t v700;
  int v701;
  unint64_t v702;
  int v703;
  unint64_t v704;
  int v705;
  unint64_t v706;
  int v707;
  unint64_t v708;
  int v709;
  int v710;
  unint64_t v711;
  uint64_t v712;
  int v713;
  uint64_t v714;
  int v715;
  uint64_t v716;
  int v717;
  uint64_t v718;
  int v719;
  unsigned int v720;
  unint64_t v721;
  int v722;
  unint64_t v723;
  uint64_t v724;
  int v725;
  uint64_t v726;
  uint64_t v727;
  int v728;
  uint64_t v729;
  int v730;
  uint64_t v731;
  uint64_t v732;
  int v733;
  uint64_t v734;
  int v735;
  uint64_t v736;
  WebCore::DeprecatedGlobalSettings *v737;
  WebCore::DeprecatedGlobalSettings *v738;
  WebCore::DeprecatedGlobalSettings *v739;
  WebCore::DeprecatedGlobalSettings *v740;
  WebCore::DeprecatedGlobalSettings *v741;
  WebCore::DeprecatedGlobalSettings *v742;
  WebCore::DeprecatedGlobalSettings *v743;
  WebCore::DeprecatedGlobalSettings *v744;
  WebCore::DeprecatedGlobalSettings *v745;
  WebCore::DeprecatedGlobalSettings *v746;
  WTF::StringImpl *v747;

  v4 = *((_QWORD *)self->_private->page.m_ptr + 14);
  v5 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitJavaScriptCanOpenWindowsAutomatically"));
  v6 = 0x100000000000;
  if (!v5)
    v6 = 0;
  *(_QWORD *)(v4 + 680) = *(_QWORD *)(v4 + 680) & 0xFFFFEFFFFFFFFFFFLL | v6;
  v7 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitVideoPlaybackRequiresUserGesture"));
  v8 = 0x200000000000;
  if (!v7)
    v8 = 0;
  *(_QWORD *)(v4 + 688) = *(_QWORD *)(v4 + 688) & 0xFFFFDFFFFFFFFFFFLL | v8;
  MEMORY[0x1D82A3998](&v747, objc_msgSend(a3, "_stringValueForKey:", CFSTR("WebKitFTPDirectoryTemplatePath")));
  v10 = v747;
  if (v747)
    *(_DWORD *)v747 += 2;
  v11 = *(WTF::StringImpl **)(v4 + 384);
  *(_QWORD *)(v4 + 384) = v10;
  if (!v11)
  {
LABEL_10:
    v12 = v4 + 664;
    v747 = 0;
    if (!v10)
      goto LABEL_16;
    goto LABEL_13;
  }
  if (*(_DWORD *)v11 != 2)
  {
    *(_DWORD *)v11 -= 2;
    goto LABEL_10;
  }
  WTF::StringImpl::destroy(v11, v9);
  v10 = v747;
  v12 = v4 + 664;
  v747 = 0;
  if (!v10)
    goto LABEL_16;
LABEL_13:
  if (*(_DWORD *)v10 == 2)
    WTF::StringImpl::destroy(v10, v9);
  else
    *(_DWORD *)v10 -= 2;
LABEL_16:
  v13 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAudioPlaybackRequiresUserGesture"));
  v14 = 0x100000000000;
  if (!v13)
    v14 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFEFFFFFFFFFFFLL | v14;
  MEMORY[0x1D82A3998](&v747, objc_msgSend(a3, "_stringValueForKey:", CFSTR("WebKitFantasyFont")));
  WebCore::SettingsBase::setFantasyFontFamily();
  v16 = v747;
  v747 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy(v16, v15);
    else
      *(_DWORD *)v16 -= 2;
  }
  v17 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitRequiresPageVisibilityToPlayAudio"));
  v18 = 0x80000000000;
  if (!v17)
    v18 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFF7FFFFFFFFFFLL | v18;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitPunchOutWhiteBackgroundsInDarkMode"));
  WebCore::Settings::setPunchOutWhiteBackgroundsInDarkMode((WebCore::Settings *)v4);
  *(_BYTE *)(v4 + 520) = objc_msgSend(a3, "_integerValueForKey:", CFSTR("WebKitPitchCorrectionAlgorithm"));
  v19 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitPictureInPictureAPIEnabled"));
  v20 = 0x10000000000;
  if (!v19)
    v20 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFEFFFFFFFFFFLL | v20;
  MEMORY[0x1D82A3998](&v747, objc_msgSend(a3, "_stringValueForKey:", CFSTR("WebKitFixedFont")));
  WebCore::SettingsBase::setFixedFontFamily();
  v22 = v747;
  v747 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 2)
      WTF::StringImpl::destroy(v22, v21);
    else
      *(_DWORD *)v22 -= 2;
  }
  MEMORY[0x1D82A3998](&v747, objc_msgSend(a3, "_stringValueForKey:", CFSTR("WebKitPictographFont")));
  WebCore::SettingsBase::setPictographFontFamily();
  v24 = v747;
  v747 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 2)
      WTF::StringImpl::destroy(v24, v23);
    else
      *(_DWORD *)v24 -= 2;
  }
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitForceFTPDirectoryListings")))
    v25 = 256;
  else
    v25 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFFFFFFFEFFLL | v25;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitForceWebGLUsesLowPower")))
    v26 = 512;
  else
    v26 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFFFFFFFDFFLL | v26;
  v27 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitEnablePasswordEchoPreferenceKey"));
  v28 = 0x8000000;
  if (!v27)
    v28 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFF7FFFFFFLL | v28;
  objc_msgSend(a3, "_floatValueForKey:", CFSTR("WebKitPasswordEchoDurationPreferenceKey"));
  *(double *)(v4 + 512) = v29;
  v30 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitPassiveTouchListenersAsDefaultOnDocument"));
  v31 = 0x2000000;
  if (!v30)
    v31 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFDFFFFFFLL | v31;
  v32 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitPDFPluginHUDEnabled"));
  v33 = 0x40000000;
  if (!v32)
    v33 = 0;
  v34 = *(_DWORD *)(v12 + 56) & 0x9FFFFFFF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *(_DWORD *)(v12 + 56) = *(_DWORD *)(v12 + 56) & 0x9FFFFFFF | v33;
  *(_BYTE *)(v12 + 60) = BYTE4(v34);
  v35 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitNeedsKeyboardEventDisambiguationQuirks"));
  v36 = 0x40000;
  if (!v35)
    v36 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFFBFFFFLL | v36;
  v37 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitNeedsFrameNameFallbackToIdQuirk"));
  v38 = 0x20000;
  if (!v37)
    v38 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFFDFFFFLL | v38;
  v39 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitNeedsAdobeFrameReloadingQuirk"));
  v40 = 0x8000;
  if (!v39)
    v40 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFFF7FFFLL | v40;
  v41 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMockScrollbarsControllerEnabled"));
  v42 = 4096;
  if (!v41)
    v42 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFFFEFFFLL | v42;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitHiddenPageCSSAnimationSuspensionEnabled"));
  WebCore::Settings::setHiddenPageCSSAnimationSuspensionEnabled((WebCore::Settings *)v4);
  objc_msgSend(a3, "_floatValueForKey:", CFSTR("WebKitMinimumZoomFontSizePreferenceKey"));
  *(double *)(v4 + 648) = v43;
  objc_msgSend(a3, "_floatValueForKey:", CFSTR("WebKitMinimumLogicalFontSize"));
  WebCore::Settings::setMinimumLogicalFontSize((WebCore::Settings *)v4, v44);
  objc_msgSend(a3, "_floatValueForKey:", CFSTR("WebKitMinimumFontSize"));
  WebCore::Settings::setMinimumFontSize((WebCore::Settings *)v4, v45);
  v46 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMediaUserGestureInheritsFromDocument"));
  v47 = 2048;
  if (!v46)
    v47 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFFFF7FFLL | v47;
  v48 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMediaStreamEnabled"));
  v49 = 0x1000000;
  if (!v48)
    v49 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFEFFFFFFLL | v49;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMediaPreloadingEnabled")))
    v50 = 512;
  else
    v50 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFFFFDFFLL | v50;
  objc_msgSend(a3, "_floatValueForKey:", CFSTR("WebKitMediaPreferredFullscreenWidth"));
  *(double *)(v4 + 472) = v51;
  v52 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMediaEnabled"));
  v53 = 0x80000000000000;
  if (!v52)
    v53 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFF7FFFFFFFFFFFFFLL | v53;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMediaDataLoadsAutomatically")))
    v54 = 256;
  else
    v54 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFFFFEFFLL | v54;
  v55 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMediaControlsScaleWithPageZoom"));
  v56 = 128;
  if (!v55)
    v56 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFFFFF7FLL | v56;
  v57 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMediaControlsContextMenusEnabled"));
  v58 = 1024;
  if (!v57)
    v58 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFFFFFBFFLL | v58;
  v59 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitIncompleteImageBorderEnabled"));
  v60 = 0x4000000;
  if (!v59)
    v60 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFFFBFFFFFFLL | v60;
  objc_msgSend(a3, "_floatValueForKey:", CFSTR("WebKitIncrementalRenderingSuppressionTimeoutInSeconds"));
  *(double *)(v4 + 400) = v61;
  MEMORY[0x1D82A3998](&v747, objc_msgSend(a3, "_stringValueForKey:", CFSTR("WebKitMediaContentTypesRequiringHardwareSupport")));
  WebCore::SettingsBase::setMediaContentTypesRequiringHardwareSupport((WebCore::SettingsBase *)v4, (const WTF::String *)&v747);
  v63 = v747;
  v747 = 0;
  if (v63)
  {
    if (*(_DWORD *)v63 == 2)
      WTF::StringImpl::destroy(v63, v62);
    else
      *(_DWORD *)v63 -= 2;
  }
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitInlineMediaPlaybackRequiresPlaysInlineAttribute")))v64 = 0x10000000;
  else
    v64 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFFEFFFFFFFLL | v64;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMediaCapabilitiesEnabled")))
    v65 = 32;
  else
    v65 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFFFFFDFLL | v65;
  objc_msgSend(a3, "_floatValueForKey:", CFSTR("WebKitMaxParseDurationPreferenceKey"));
  *(double *)(v4 + 448) = v66;
  v67 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMathMLEnabled"));
  v68 = 512;
  if (!v67)
    v68 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFFFFFDFFLL | v68;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDisplayImagesKey"));
  WebCore::Settings::setLoadsImagesAutomatically((WebCore::Settings *)v4);
  objc_msgSend(a3, "_floatValueForKey:", CFSTR("WebKitInteractionRegionInlinePadding"));
  *(double *)(v4 + 408) = v69;
  objc_msgSend(a3, "_floatValueForKey:", CFSTR("WebKitInteractionRegionMinimumCornerRadius"));
  *(double *)(v4 + 416) = v70;
  v71 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLoadDeferringEnabled"));
  v72 = 0x1000000000000000;
  if (!v71)
    v72 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xEFFFFFFFFFFFFFFFLL | v72;
  v73 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLinkPreloadEnabled"));
  v74 = 0x100000000000000;
  if (!v73)
    v74 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFEFFFFFFFFFFFFFFLL | v74;
  v75 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitInterruptAudioOnPageVisibilityChangeEnabled"));
  v76 = 0x100000;
  if (!v75)
    v76 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFFEFFFFFLL | v76;
  v77 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitInterruptVideoOnPageVisibilityChangeEnabled"));
  v78 = 0x200000;
  if (!v77)
    v78 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFFDFFFFFLL | v78;
  v79 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("InvisibleAutoplayNotPermitted"));
  v80 = 0x40000000;
  if (!v79)
    v80 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFFBFFFFFFFLL | v80;
  v81 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLinkPreconnect"));
  v82 = 0x40000000000000;
  if (!v81)
    v82 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFBFFFFFFFFFFFFFLL | v82;
  objc_msgSend(a3, "_floatValueForKey:", CFSTR("WebKitLayoutViewportHeightExpansionFactor"));
  WebCore::Settings::setLayoutViewportHeightExpansionFactor((WebCore::Settings *)v4, v83);
  *(_DWORD *)(v4 + 428) = objc_msgSend(a3, "_integerValueForKey:", CFSTR("WebKitLayoutFallbackWidth"));
  v84 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLargeImageAsyncDecodingEnabled"));
  v85 = 0x400000000000;
  if (!v84)
    v85 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFBFFFFFFFFFFFLL | v85;
  *(_DWORD *)(v4 + 424) = objc_msgSend(a3, "_integerValueForKey:", CFSTR("WebKitJavaScriptRuntimeFlagsPreferenceKey"));
  v86 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitJavaScriptMarkupEnabled"));
  v87 = 0x20000000000000;
  if (!v86)
    v87 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFDFFFFFFFFFFFFFLL | v87;
  v88 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitJavaScriptCanAccessClipboard"));
  v89 = 0x80000000000;
  if (!v88)
    v89 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFF7FFFFFFFFFFLL | v89;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAcceleratedCompositingEnabled"));
  WebCore::Settings::setAcceleratedCompositingEnabled((WebCore::Settings *)v4);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAcceleratedCompositingForFixedPositionEnabled")))
    v90 = 32;
  else
    v90 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFFFFFFDFLL | v90;
  v91 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWirelessPlaybackTargetAPIEnabled"));
  v92 = 0x2000000000;
  if (!v91)
    v92 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFDFFFFFFFFFLL | v92;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWindowFocusRestricted")))
    v93 = 0x1000000000;
  else
    v93 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFEFFFFFFFFFLL | v93;
  v94 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAggressiveTileRetentionEnabled"));
  v95 = 1024;
  if (!v94)
    v95 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFFFFFBFFLL | v95;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebSocketEnabled")))
    v96 = 0x100000000;
  else
    v96 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFEFFFFFFFFLL | v96;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAllowContentSecurityPolicySourceStarToMatchAnyProtocol")))v97 = 0x2000;
  else
    v97 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFFFFDFFFLL | v97;
  v98 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAllowDisplayOfInsecureContent"));
  v99 = 0x4000;
  if (!v98)
    v99 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFFFFBFFFLL | v99;
  v100 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAllowFileAccessFromFileURLs"));
  v101 = 0x8000;
  if (!v100)
    v101 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFFFF7FFFLL | v101;
  v102 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAllowMultiElementImplicitFormSubmissionPreferenceKey"));
  v103 = 0x20000;
  if (!v102)
    v103 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFFFDFFFFLL | v103;
  v104 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAllowRunningOfInsecureContent"));
  v105 = 0x40000;
  if (!v104)
    v105 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFFFBFFFFLL | v105;
  v106 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAllowSettingAnyXHRHeaderFromFileURLs"));
  v107 = 0x80000;
  if (!v106)
    v107 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFFF7FFFFLL | v107;
  v108 = (unsigned int *)(v12 + 56);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMediaPlaybackAllowsAirPlay")))
    v109 = 0x800000;
  else
    v109 = 0;
  v110 = *(_DWORD *)(v12 + 56) & 0xFF7FFFFF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v108 = *(_DWORD *)(v12 + 56) & 0xFF7FFFFF | v109;
  *(_BYTE *)(v12 + 60) = BYTE4(v110);
  v111 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMediaPlaybackAllowsInline"));
  v112 = 0x400000;
  if (!v111)
    v112 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFFBFFFFFLL | v112;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAllowsInlineMediaPlaybackAfterFullscreen")))
    v113 = 0x800000;
  else
    v113 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFF7FFFFFLL | v113;
  v114 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAllowsPictureInPictureMediaPlayback"));
  v115 = 0x1000000;
  if (!v114)
    v115 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFEFFFFFFLL | v115;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAlternateFormControlDesignEnabled")))
    v116 = 0x200000000;
  else
    v116 = 0;
  v117 = (*v108 | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32)) & 0xFFFFFFFDFFFFFFFFLL | v116;
  *v108 = *v108;
  *(_BYTE *)(v12 + 60) = BYTE4(v117);
  v118 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAlternateFullScreenControlDesignEnabled"));
  v119 = 0x400000000;
  if (!v118)
    v119 = 0;
  v120 = (*(unsigned int *)(v12 + 56) | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32)) & 0xFFFFFFFBFFFFFFFFLL | v119;
  *v108 = *v108;
  *(_BYTE *)(v12 + 60) = BYTE4(v120);
  v121 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAnimatedImageAsyncDecodingEnabled"));
  v122 = 0x2000000;
  if (!v121)
    v122 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFDFFFFFFLL | v122;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAppleMailPaginationQuirkEnabled")))
    v123 = 0x10000000;
  else
    v123 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFEFFFFFFFLL | v123;
  v124 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitApplePayCapabilityDisclosureAllowed"));
  v125 = 0x20000000000;
  if (!v124)
    v125 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFDFFFFFFFFFFLL | v125;
  v126 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitApplePayEnabled"));
  v127 = 0x40000000000;
  if (!v126)
    v127 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFBFFFFFFFFFFLL | v127;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAsynchronousSpellCheckingEnabled")))
    v128 = 0x100000000;
  else
    v128 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFEFFFFFFFFLL | v128;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAudioControlsScaleWithPageZoom")))
    v129 = 0x200000000;
  else
    v129 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFDFFFFFFFFLL | v129;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAuthorAndUserStylesEnabledPreferenceKey"));
  WebCore::Settings::setAuthorAndUserStylesEnabled((WebCore::Settings *)v4);
  v130 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebSecurityEnabled"));
  v131 = 0x20000000;
  if (!v130)
    v131 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFDFFFFFFFLL | v131;
  v132 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitBackspaceKeyNavigationEnabled"));
  v133 = 0x8000000000;
  if (!v132)
    v133 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFF7FFFFFFFFFLL | v133;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebAudioEnabled")))
    v134 = 32;
  else
    v134 = 0;
  v135 = *v108 & 0xFFFFFFDF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v108 = *v108 & 0xFFFFFFDF | v134;
  *(_BYTE *)(v12 + 60) = BYTE4(v135);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWantsBalancedSetDefersLoadingBehavior")))
    v136 = 0x2000;
  else
    v136 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFFDFFFLL | v136;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitVisualViewportEnabled"));
  WebCore::Settings::setVisualViewportEnabled((WebCore::Settings *)v4);
  *(_DWORD *)(v4 + 612) = objc_msgSend(a3, "_integerValueForKey:", CFSTR("WebKitVisibleDebugOverlayRegions"));
  v137 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitVideoQualityIncludesDisplayCompositingEnabled"));
  v138 = 0x1000000000000000;
  if (!v137)
    v138 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xEFFFFFFFFFFFFFFFLL | v138;
  v139 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitVideoPresentationModeAPIEnabled"));
  v140 = 512;
  if (!v139)
    v140 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFFFDFFLL | v140;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitVideoFullscreenRequiresElementFullscreen")))
    v141 = 0x1000000000;
  else
    v141 = 0;
  v142 = (*v108 | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32)) & 0xFFFFFFEFFFFFFFFFLL | v141;
  *v108 = *v108;
  *(_BYTE *)(v12 + 60) = BYTE4(v142);
  v143 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitVP9DecoderEnabled"));
  v144 = 0x2000000000000000;
  if (!v143)
    v144 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xDFFFFFFFFFFFFFFFLL | v144;
  v145 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitUsesEncodingDetector"));
  v146 = 64;
  if (!v145)
    v146 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFFFFBFLL | v146;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitUsesPageCachePreferenceKey"));
  WebCore::Settings::setUsesBackForwardCache((WebCore::Settings *)v4);
  *(_BYTE *)(v4 + 560) = objc_msgSend(a3, "_integerValueForKey:", CFSTR("WebKitUserInterfaceDirectionPolicy")) != 0;
  v147 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitUsePreHTML5ParserQuirks"));
  v148 = 4;
  if (!v147)
    v148 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFFFFFBLL | v148;
  v149 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitUseImageDocumentForSubframePDF"));
  v150 = 2;
  if (!v149)
    v150 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFFFFFDLL | v150;
  v151 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitTreatsAnyTextCSSLinkAsStylesheet"));
  v152 = 0x100000000000000;
  if (!v151)
    v152 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFEFFFFFFFFFFFFFFLL | v152;
  v153 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitTextInteractionEnabled"));
  v154 = 0x10000000000000;
  if (!v153)
    v154 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFEFFFFFFFFFFFFFLL | v154;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitTextAutosizingEnabled"));
  WebCore::Settings::setTextAutosizingEnabled((WebCore::Settings *)v4);
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitTextAreasAreResizable"));
  WebCore::Settings::setTextAreasAreResizable((WebCore::Settings *)v4);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitTemporaryTileCohortRetentionEnabled")))
    v155 = 0x4000000000000;
  else
    v155 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFBFFFFFFFFFFFFLL | v155;
  v156 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitTelephoneParsingEnabledPreferenceKey"));
  v157 = 0x2000000000000;
  if (!v156)
    v157 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFDFFFFFFFFFFFFLL | v157;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCaretBrowsingEnabled")))
    v158 = 0x4000000000000;
  else
    v158 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFBFFFFFFFFFFFFLL | v158;
  v159 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitSystemPreviewEnabled"));
  v160 = 0xFFFFFF8000000000;
  if (!v159)
    v160 = 0;
  *(_BYTE *)(v12 + 60) = (v160 & 0xFFFFFF80FFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v12 + 60) & 0x7F) << 32)) >> 32;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitColorFilterEnabled"));
  WebCore::Settings::setColorFilterEnabled((WebCore::Settings *)v4);
  *(_BYTE *)(v4 + 549) = objc_msgSend(a3, "_integerValueForKey:", CFSTR("WebKitSystemLayoutDirection")) != 0;
  v161 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitSuppressesIncrementalRendering"));
  v162 = 0x800000000000;
  if (!v161)
    v162 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFF7FFFFFFFFFFFLL | v162;
  MEMORY[0x1D82A3998](&v747, objc_msgSend(a3, "_stringValueForKey:", CFSTR("WebKitStandardFont")));
  WebCore::SettingsBase::setStandardFontFamily();
  v164 = v747;
  v747 = 0;
  if (v164)
  {
    if (*(_DWORD *)v164 == 2)
      WTF::StringImpl::destroy(v164, v163);
    else
      *(_DWORD *)v164 -= 2;
  }
  v165 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitStandalonePreferenceKey"));
  v166 = 0x80000000000;
  if (!v165)
    v166 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFF7FFFFFFFFFFLL | v166;
  v167 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitContentChangeObserverEnabled"));
  v168 = 0x200000000000;
  if (!v167)
    v168 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFDFFFFFFFFFFFLL | v168;
  v169 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitContentDispositionAttachmentSandboxEnabled"));
  v170 = 0x200000000000000;
  if (!v169)
    v170 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFDFFFFFFFFFFFFFFLL | v170;
  v171 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitSpatialNavigationEnabled"));
  v172 = 0x8000000000;
  if (!v171)
    v172 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFF7FFFFFFFFFLL | v172;
  v173 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitSourceBufferChangeTypeEnabled"));
  v174 = 0x4000;
  if (!v173)
    v174 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFFFFBFFFLL | v174;
  v175 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShrinksStandaloneImagesToFit"));
  v176 = 0x800000000;
  if (!v175)
    v176 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFF7FFFFFFFFLL | v176;
  v177 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShowsURLsInToolTips"));
  v178 = 0x400000000;
  if (!v177)
    v178 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFBFFFFFFFFLL | v178;
  v179 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShowsToolTipOverTruncatedText"));
  v180 = 0x200000000;
  if (!v179)
    v180 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFDFFFFFFFFLL | v180;
  v181 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShouldUseServiceWorkerShortTimeout"));
  v182 = 0x8000000;
  if (!v181)
    v182 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFF7FFFFFFLL | v182;
  v183 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShouldSuppressTextInputFromEditingDuringProvisionalNavigation"));
  v184 = 0x2000000;
  if (!v183)
    v184 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFFDFFFFFFLL | v184;
  MEMORY[0x1D82A3998](&v747, objc_msgSend(a3, "_stringValueForKey:", CFSTR("WebKitCursiveFont")));
  WebCore::SettingsBase::setCursiveFontFamily();
  v186 = v747;
  v747 = 0;
  if (v186)
  {
    if (*(_DWORD *)v186 == 2)
      WTF::StringImpl::destroy(v186, v185);
    else
      *(_DWORD *)v186 -= 2;
  }
  v187 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShouldRestrictBaseURLSchemes"));
  v188 = 0x1000000;
  if (!v187)
    v188 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFFEFFFFFFLL | v188;
  v189 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShouldRespectImageOrientation"));
  v190 = 0x800000;
  if (!v189)
    v190 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFFF7FFFFFLL | v190;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDNSPrefetchingEnabled"));
  WebCore::Settings::setDNSPrefetchingEnabled((WebCore::Settings *)v4);
  v191 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShouldPrintBackgroundsPreferenceKey"));
  v192 = 0x400000;
  if (!v191)
    v192 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFFFBFFFFFLL | v192;
  v193 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDOMPasteAllowedPreferenceKey"));
  v194 = 0x40000000000000;
  if (!v193)
    v194 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFBFFFFFFFFFFFFFLL | v194;
  v195 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShouldIgnoreMetaViewport"));
  v196 = 0x100000;
  if (!v195)
    v196 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFFFEFFFFFLL | v196;
  *(_BYTE *)(v4 + 616) = objc_msgSend(a3, "_integerValueForKey:", CFSTR("WebKitDataDetectorTypes"));
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShouldEnableTextAutosizingBoost"));
  WebCore::Settings::setShouldEnableTextAutosizingBoost((WebCore::Settings *)v4);
  v197 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShouldDisplayTextDescriptions"));
  v198 = 0x800000000000000;
  if (!v197)
    v198 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xF7FFFFFFFFFFFFFFLL | v198;
  v199 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShouldDisplaySubtitles"));
  v200 = 0x400000000000000;
  if (!v199)
    v200 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFBFFFFFFFFFFFFFFLL | v200;
  v201 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShouldDisplayCaptions"));
  v202 = 0x200000000000000;
  if (!v201)
    v202 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFDFFFFFFFFFFFFFFLL | v202;
  v203 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShouldDecidePolicyBeforeLoadingQuickLookPreview"));
  v204 = 0x4000;
  if (!v203)
    v204 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFFFFFBFFFLL | v204;
  v205 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShouldConvertPositionStyleOnCopy"));
  v206 = 0x2000;
  if (!v205)
    v206 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFFFFFDFFFLL | v206;
  objc_msgSend(a3, "_floatValueForKey:", CFSTR("WebKitDefaultFixedFontSize"));
  WebCore::Settings::setDefaultFixedFontSize((WebCore::Settings *)v4, v207);
  objc_msgSend(a3, "_floatValueForKey:", CFSTR("WebKitDefaultFontSize"));
  WebCore::Settings::setDefaultFontSize((WebCore::Settings *)v4, v208);
  MEMORY[0x1D82A3998](&v747, objc_msgSend(a3, "_stringValueForKey:", CFSTR("WebKitDefaultTextEncodingName")));
  v210 = v747;
  if (v747)
    *(_DWORD *)v747 += 2;
  v211 = *(WTF::StringImpl **)(v4 + 344);
  *(_QWORD *)(v4 + 344) = v210;
  if (!v211)
  {
LABEL_252:
    v747 = 0;
    if (!v210)
      goto LABEL_258;
    goto LABEL_255;
  }
  if (*(_DWORD *)v211 != 2)
  {
    *(_DWORD *)v211 -= 2;
    goto LABEL_252;
  }
  WTF::StringImpl::destroy(v211, v209);
  v210 = v747;
  v747 = 0;
  if (!v210)
    goto LABEL_258;
LABEL_255:
  if (*(_DWORD *)v210 == 2)
    WTF::StringImpl::destroy(v210, v209);
  else
    *(_DWORD *)v210 -= 2;
LABEL_258:
  v212 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShouldConvertInvalidURLsToBlank"));
  v213 = 4096;
  if (!v212)
    v213 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFFFFFEFFFLL | v213;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShouldAllowUserInstalledFonts"));
  WebCore::Settings::setShouldAllowUserInstalledFonts((WebCore::Settings *)v4);
  MEMORY[0x1D82A3998](&v747, objc_msgSend(a3, "_stringValueForKey:", CFSTR("WebKitSerifFont")));
  WebCore::SettingsBase::setSerifFontFamily();
  v215 = v747;
  v747 = 0;
  if (v215)
  {
    if (*(_DWORD *)v215 == 2)
      WTF::StringImpl::destroy(v215, v214);
    else
      *(_DWORD *)v215 -= 2;
  }
  *(_DWORD *)(v4 + 360) = objc_msgSend(a3, "_integerValueForKey:", CFSTR("WebKitDeviceHeight"));
  v216 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDeviceOrientationEventEnabled"));
  v217 = 0x2000000000000;
  if (!v216)
    v217 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFDFFFFFFFFFFFFLL | v217;
  v218 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDeviceOrientationPermissionAPIEnabled"));
  v219 = 0x4000000000000;
  if (!v218)
    v219 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFBFFFFFFFFFFFFLL | v219;
  *(_DWORD *)(v4 + 364) = objc_msgSend(a3, "_integerValueForKey:", CFSTR("WebKitDeviceWidth"));
  MEMORY[0x1D82A3998](&v747, objc_msgSend(a3, "_stringValueForKey:", CFSTR("WebKitSansSerifFont")));
  WebCore::SettingsBase::setSansSerifFontFamily();
  v221 = v747;
  v747 = 0;
  if (v221)
  {
    if (*(_DWORD *)v221 == 2)
      WTF::StringImpl::destroy(v221, v220);
    else
      *(_DWORD *)v221 -= 2;
  }
  objc_msgSend(a3, "_floatValueForKey:", CFSTR("WebKitSampledPageTopColorMinHeight"));
  *(double *)(v4 + 536) = v222;
  v223 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDisabledAdaptationsMetaTagEnabled"));
  v224 = 0x4000000000000;
  if (!v223)
    v224 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFBFFFFFFFFFFFFLL | v224;
  objc_msgSend(a3, "_floatValueForKey:", CFSTR("WebKitSampledPageTopColorMaxDifference"));
  *(double *)(v4 + 528) = v225;
  v226 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDownloadAttributeEnabled"));
  v227 = 0x200000000000000;
  if (!v226)
    v227 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFDFFFFFFFFFFFFFFLL | v227;
  *(_BYTE *)(v4 + 369) = objc_msgSend(a3, "_integerValueForKey:", CFSTR("WebKitEditableLinkBehavior"));
  v228 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitRequiresUserGestureToLoadVideo"));
  v229 = 0x400000000000;
  if (!v228)
    v229 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFBFFFFFFFFFFFLL | v229;
  v230 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitEnableInheritURIQueryComponent"));
  v231 = 0x1000000000000000;
  if (!v230)
    v231 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xEFFFFFFFFFFFFFFFLL | v231;
  v232 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitEncryptedMediaAPIEnabled"));
  v233 = 0x20000000000000;
  if (!v232)
    v233 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFDFFFFFFFFFFFFFLL | v233;
  v234 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitGrammarAndSpellingPseudoElementsEnabled"));
  v235 = 0x4000;
  if (!v234)
    v235 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFFFFFFBFFFLL | v235;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitThumbAndTrackPseudoElementsEnabled")))
    v236 = 0x20000000000000;
  else
    v236 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFDFFFFFFFFFFFFFLL | v236;
  v237 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitSelectShowPickerEnabled"));
  v238 = 4;
  if (!v237)
    v238 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFFFFFFFFBLL | v238;
  v239 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitPageAtRuleSupportEnabled"));
  v240 = 0x1000000;
  if (!v239)
    v240 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFEFFFFFFLL | v240;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAbortSignalAnyOperationEnabled")))
    v241 = 4;
  else
    v241 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFFFFFFFBLL | v241;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAcceleratedFiltersEnabled"));
  WebCore::Settings::setAcceleratedFiltersEnabled((WebCore::Settings *)v4);
  v242 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAccessHandleEnabled"));
  v243 = 256;
  if (!v242)
    v243 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFFFFFEFFLL | v243;
  v244 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDOMTestingAPIsEnabled"));
  v245 = 0x80000000000000;
  if (!v244)
    v245 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFF7FFFFFFFFFFFFFLL | v245;
  v246 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAllowMediaContentTypesRequiringHardwareSupportAsFallback"));
  v247 = 0x10000;
  if (!v246)
    v247 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFFFEFFFFLL | v247;
  v248 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAllowViewportShrinkToFitContent"));
  v249 = (unsigned int *)(v12 + 56);
  v250 = 0x100000000;
  if (!v248)
    v250 = 0;
  v251 = (*(unsigned int *)(v12 + 56) | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32)) & 0xFFFFFFFEFFFFFFFFLL | v250;
  *v249 = *(_DWORD *)(v12 + 56);
  *(_BYTE *)(v12 + 60) = BYTE4(v251);
  v252 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAllowWebGLInWorkers"));
  v253 = 0x8000000000000000;
  if (!v252)
    v253 = 0;
  *(_QWORD *)(v12 + 48) = v253 & 0x8000000000000000 | *(_QWORD *)(v12 + 48) & 0x7FFFFFFFFFFFFFFFLL;
  v254 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitPerElementSpeakerSelectionEnabled"));
  v255 = 0x10000000;
  if (!v254)
    v255 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFEFFFFFFFLL | v255;
  v256 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitExposeSpeakersEnabled"));
  v257 = 0x20000;
  if (!v256)
    v257 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFFFDFFFFLL | v257;
  v258 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAllowTopNavigationToDataURLs"));
  v259 = 0x100000;
  if (!v258)
    v259 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFFEFFFFFLL | v259;
  v260 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAllowUniversalAccessFromFileURLs"));
  v261 = 0x200000;
  if (!v260)
    v261 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFFDFFFFFLL | v261;
  v262 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAlternateWebMPlayerEnabled"));
  v263 = 0x10000000000;
  if (!v262)
    v263 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFEFFFFFFFFFFLL | v263;
  v264 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAlwaysAllowLocalWebarchive"));
  v265 = 2;
  if (!v264)
    v265 = 0;
  v266 = *(_DWORD *)(v12 + 56) & 0xFFFFFFFD | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFFFFFFFD | v265;
  *(_BYTE *)(v12 + 60) = BYTE4(v266);
  v267 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAppBadgeEnabled"));
  v268 = 0x8000000;
  if (!v267)
    v268 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFF7FFFFFFLL | v268;
  v269 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAppHighlightsEnabled"));
  v270 = 0x80000000000;
  if (!v269)
    v270 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFF7FFFFFFFFFFLL | v270;
  WebCore::Settings::setAsyncFrameScrollingEnabled((WebCore::Settings *)v4);
  WebCore::Settings::setAsyncOverflowScrollingEnabled((WebCore::Settings *)v4);
  v271 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitUseAsyncUIKitInteractions"));
  v272 = 0x800000000;
  if (!v271)
    v272 = 0;
  v273 = (*(unsigned int *)(v12 + 56) | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32)) & 0xFFFFFFF7FFFFFFFFLL | v272;
  *v249 = *v249;
  *(_BYTE *)(v12 + 60) = BYTE4(v273);
  v274 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAsyncClipboardAPIEnabled"));
  v275 = 0x20000000;
  if (!v274)
    v275 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFDFFFFFFFLL | v275;
  v276 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAttachmentWideLayoutEnabled"));
  v277 = 0x100000000000;
  if (!v276)
    v277 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFEFFFFFFFFFFFLL | v277;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitExtendedAudioDescriptionsEnabled")))
    v278 = 0x20000000000000;
  else
    v278 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFDFFFFFFFFFFFFFLL | v278;
  v279 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAudioDescriptionsEnabled"));
  v280 = 0x10000000000000;
  if (!v279)
    v280 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFEFFFFFFFFFFFFFLL | v280;
  v281 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDOMAudioSessionEnabled"));
  v282 = 0x8000000000000;
  if (!v281)
    v282 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFF7FFFFFFFFFFFFLL | v282;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDOMAudioSessionFullEnabled")))
    v283 = 0x10000000000000;
  else
    v283 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFEFFFFFFFFFFFFFLL | v283;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAutomaticallyAdjustsViewScaleUsingMinimumEffectiveDeviceWidth")))v284 = 0x800000000;
  else
    v284 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFF7FFFFFFFFLL | v284;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitBeaconAPIEnabled")))
    v285 = 0x10000000000;
  else
    v285 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFEFFFFFFFFFFLL | v285;
  v286 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitBroadcastChannelEnabled"));
  v287 = 0x40000000000;
  if (!v286)
    v287 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFBFFFFFFFFFFLL | v287;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitBroadcastChannelOriginPartitioningEnabled")))
    v288 = 0x80000000000;
  else
    v288 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFF7FFFFFFFFFFLL | v288;
  v289 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSS3DTransformBackfaceVisibilityInteroperabilityEnabled"));
  v290 = 16;
  if (!v289)
    v290 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFFFFFEFLL | v290;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSCounterStyleAtRuleImageSymbolsEnabled")))
    v291 = 256;
  else
    v291 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFFFFEFFLL | v291;
  v292 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSCounterStyleAtRulesEnabled"));
  v293 = 512;
  if (!v292)
    v293 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFFFFDFFLL | v293;
  v294 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSFontFaceSizeAdjustEnabled"));
  v295 = 4096;
  if (!v294)
    v295 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFFFEFFFLL | v295;
  v296 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSStartingStyleAtRuleEnabled"));
  v297 = 0x4000000;
  if (!v296)
    v297 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFBFFFFFFLL | v297;
  v298 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAccentColorEnabled"));
  v299 = 128;
  if (!v298)
    v299 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFFFFFF7FLL | v299;
  v300 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSAnchorPositioningEnabled"));
  v301 = 32;
  if (!v300)
    v301 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFFFFFDFLL | v301;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSContentVisibilityEnabled")))
    v302 = 128;
  else
    v302 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFFFFF7FLL | v302;
  v303 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSInputSecurityEnabled"));
  v304 = 0x4000;
  if (!v303)
    v304 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFFFBFFFLL | v304;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMasonryEnabled")))
    v305 = 16;
  else
    v305 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFFFFFEFLL | v305;
  v306 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSMotionPathEnabled"));
  v307 = 0x20000;
  if (!v306)
    v307 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFFDFFFFLL | v307;
  v308 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSNestingEnabled"));
  v309 = 0x40000;
  if (!v308)
    v309 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFFBFFFFLL | v309;
  v310 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitOverscrollBehaviorEnabled"));
  v311 = 0x800000;
  if (!v310)
    v311 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFF7FFFFFLL | v311;
  v312 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSPaintingAPIEnabled"));
  v313 = 0x80000;
  if (!v312)
    v313 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFF7FFFFLL | v313;
  v314 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSRhythmicSizingEnabled"));
  v315 = 0x100000;
  if (!v314)
    v315 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFEFFFFFLL | v315;
  v316 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSScopeAtRuleEnabled"));
  v317 = 0x200000;
  if (!v316)
    v317 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFDFFFFFLL | v317;
  v318 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSScrollAnchoringEnabled"));
  v319 = 0x400000;
  if (!v318)
    v319 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFBFFFFFLL | v319;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitSpringTimingFunctionEnabled")))
    v320 = 0x40000000000;
  else
    v320 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFBFFFFFFFFFFLL | v320;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSTypedOMColorEnabled")))
    v321 = 0x800000000;
  else
    v321 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFF7FFFFFFFFLL | v321;
  v322 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSUnprefixedBackdropFilterEnabled"));
  v323 = 0x1000000000;
  if (!v322)
    v323 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFEFFFFFFFFFLL | v323;
  v324 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSColorContrastEnabled"));
  v325 = 64;
  if (!v324)
    v325 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFFFFFBFLL | v325;
  v326 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSDPropertyEnabled"));
  v327 = 1024;
  if (!v326)
    v327 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFFFFBFFLL | v327;
  v328 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSFieldSizingEnabled"));
  v329 = 2048;
  if (!v328)
    v329 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFFFF7FFLL | v329;
  v330 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSFontVariantEmojiEnabled"));
  v331 = 0x2000;
  if (!v330)
    v331 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFFFDFFFLL | v331;
  v332 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSLightDarkEnabled"));
  v333 = 0x8000;
  if (!v332)
    v333 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFFF7FFFLL | v333;
  v334 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSMarginTrimEnabled"));
  v335 = 0x10000;
  if (!v334)
    v335 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFFEFFFFLL | v335;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSScrollbarColorEnabled")))
    v336 = 0x800000;
  else
    v336 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFF7FFFFFLL | v336;
  v337 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSScrollbarGutterEnabled"));
  v338 = 0x1000000;
  if (!v337)
    v338 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFEFFFFFFLL | v338;
  v339 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSScrollbarWidthEnabled"));
  v340 = 0x2000000;
  if (!v339)
    v340 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFDFFFFFFLL | v340;
  v341 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSStyleQueriesEnabled"));
  v342 = 0x8000000;
  if (!v341)
    v342 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFF7FFFFFFLL | v342;
  v343 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSTextBoxTrimEnabled"));
  v344 = 0x10000000;
  if (!v343)
    v344 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFEFFFFFFFLL | v344;
  v345 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSTextGroupAlignEnabled"));
  v346 = 0x20000000;
  if (!v345)
    v346 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFDFFFFFFFLL | v346;
  v347 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSTextJustifyEnabled"));
  v348 = 0x40000000;
  if (!v347)
    v348 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFBFFFFFFFLL | v348;
  v349 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSTextSpacingEnabled"));
  v350 = 0x80000000;
  if (!v349)
    v350 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFF7FFFFFFFLL | v350;
  v351 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSTextUnderlinePositionLeftRightEnabled"));
  v352 = 0x100000000;
  if (!v351)
    v352 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFEFFFFFFFFLL | v352;
  v353 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSTextWrapStyleEnabled"));
  v354 = 0x400000000;
  if (!v353)
    v354 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFBFFFFFFFFLL | v354;
  v355 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSTextWrapPrettyEnabled"));
  v356 = 0x200000000;
  if (!v355)
    v356 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFDFFFFFFFFLL | v356;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFFFFFFFELL | objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSOMViewScrollingAPIEnabled"));
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSOMViewSmoothScrollingEnabled")))
    v357 = 2;
  else
    v357 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFFFFFFFDLL | v357;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCacheAPIEnabled")))
    v358 = 0x100000000000;
  else
    v358 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFEFFFFFFFFFFFLL | v358;
  v359 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCanvasColorSpaceEnabled"));
  v360 = 0x200000000000;
  if (!v359)
    v360 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFDFFFFFFFFFFFLL | v360;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCanvasFiltersEnabled"));
  WebCore::Settings::setCanvasFiltersEnabled((WebCore::Settings *)v4);
  v361 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCanvasLayersEnabled"));
  v362 = 0x1000000000000;
  if (!v361)
    v362 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFEFFFFFFFFFFFFLL | v362;
  v363 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCanvasUsesAcceleratedDrawing"));
  v364 = 0x2000000000000;
  if (!v363)
    v364 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFDFFFFFFFFFFFFLL | v364;
  v365 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitClearSiteDataHTTPHeaderEnabled"));
  v366 = 0x8000000000000;
  if (!v365)
    v366 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFF7FFFFFFFFFFFFLL | v366;
  v367 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitClientBadgeEnabled"));
  v368 = 0x10000000000000;
  if (!v367)
    v368 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFEFFFFFFFFFFFFFLL | v368;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitInputTypeColorEnabled")))
    v369 = 4;
  else
    v369 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFFFFFFFBLL | v369;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShowDebugBorders"));
  WebCore::Settings::setShowDebugBorders((WebCore::Settings *)v4);
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShowRepaintCounter"));
  WebCore::Settings::setShowRepaintCounter((WebCore::Settings *)v4);
  v370 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCompressionStreamEnabled"));
  v371 = 0x80000000000000;
  if (!v370)
    v371 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFF7FFFFFFFFFFFFFLL | v371;
  v372 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitContactPickerAPIEnabled"));
  v373 = 0x100000000000000;
  if (!v372)
    v373 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFEFFFFFFFFFFFFFFLL | v373;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitSampleBufferContentKeySessionSupportEnabled"));
  WebCore::Settings::setSampleBufferContentKeySessionSupportEnabled((WebCore::Settings *)v4);
  *(_QWORD *)v12 &= ~0x400000000000000uLL;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCookieStoreAPIExtendedAttributesEnabled")))
    v374 = 0x2000000000000000;
  else
    v374 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xDFFFFFFFFFFFFFFFLL | v374;
  v375 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCookieStoreAPIServiceWorkerEnabled"));
  v376 = 0x4000000000000000;
  if (!v375)
    v376 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xBFFFFFFFFFFFFFFFLL | v376;
  v377 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCookieStoreAPIEnabled"));
  v378 = 0x1000000000000000;
  if (!v377)
    v378 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xEFFFFFFFFFFFFFFFLL | v378;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCrossOriginEmbedderPolicyEnabled")))
    v379 = 2;
  else
    v379 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFFFFFFDLL | v379;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCrossOriginOpenerPolicyEnabled")))
    v380 = 4;
  else
    v380 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFFFFFFBLL | v380;
  v381 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCustomStateSetEnabled"));
  v382 = 0x4000000000;
  if (!v381)
    v382 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFBFFFFFFFFFLL | v382;
  v383 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDOMPasteAccessRequestsEnabled"));
  v384 = 0x20000000000000;
  if (!v383)
    v384 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFDFFFFFFFFFFFFFLL | v384;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDOMTimersThrottlingEnabledPreferenceKey")))
    v385 = 0x100000000000000;
  else
    v385 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFEFFFFFFFFFFFFFFLL | v385;
  v386 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDataTransferItemsEnabled"));
  v387 = 0x8000000000;
  if (!v386)
    v387 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFF7FFFFFFFFFLL | v387;
  v388 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDataListElementEnabled"));
  v389 = 0x400000000000;
  if (!v388)
    v389 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFBFFFFFFFFFFFLL | v389;
  v390 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitInputTypeDateEnabled"));
  v391 = 8;
  if (!v390)
    v391 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFFFFFFF7 | v391;
  v392 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDateTimeInputsEditableComponentsEnabled"));
  v393 = 0x800000000000;
  if (!v392)
    v393 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFF7FFFFFFFFFFFLL | v393;
  v394 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDeclarativeShadowRootsParserAPIsEnabled"));
  v395 = 0x10000000000;
  if (!v394)
    v395 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFEFFFFFFFFFFLL | v395;
  v396 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDeclarativeShadowRootsSerializerAPIsEnabled"));
  v397 = 0x20000000000;
  if (!v396)
    v397 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFDFFFFFFFFFFLL | v397;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDeclarativeWebPush")))
    v398 = 0x1000000000000;
  else
    v398 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFEFFFFFFFFFFFFLL | v398;
  v399 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShouldDeferAsynchronousScriptsUntilAfterDocumentLoadOrFirstPaint"));
  v400 = 0x8000;
  if (!v399)
    v400 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFFFFF7FFFLL | v400;
  v401 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDeprecateAESCFBWebCryptoEnabled"));
  v402 = 0x40000000000;
  if (!v401)
    v402 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFBFFFFFFFFFFLL | v402;
  v403 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDeprecateRSAESPKCSWebCryptoEnabled"));
  v404 = 0x80000000000;
  if (!v403)
    v404 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFF7FFFFFFFFFFLL | v404;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDeprecationReportingEnabled")))
    v405 = 0x100000000000;
  else
    v405 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFEFFFFFFFFFFFLL | v405;
  v406 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitUAVisualTransitionDetectionEnabled"));
  v407 = 0x400000000000000;
  if (!v406)
    v407 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFBFFFFFFFFFFFFFFLL | v407;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDiagnosticLoggingEnabled")))
    v408 = 0x800000000000;
  else
    v408 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFF7FFFFFFFFFFFLL | v408;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDigitalCredentialsEnabled")))
    v409 = 0x1000000000000;
  else
    v409 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFEFFFFFFFFFFFFLL | v409;
  v410 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDirectoryUploadEnabled"));
  v411 = 0x2000000000000;
  if (!v410)
    v411 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFDFFFFFFFFFFFFLL | v411;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitIsThirdPartyCookieBlockingDisabled")))
    v412 = 0x20000000000;
  else
    v412 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFDFFFFFFFFFFLL | v412;
  v413 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitIsFirstPartyWebsiteDataRemovalDisabled"));
  v414 = 0x100000000;
  if (!v413)
    v414 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFEFFFFFFFFLL | v414;
  v415 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDisallowSyncXHRDuringPageDismissalEnabled"));
  v416 = 0x8000000000000;
  if (!v415)
    v416 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFF7FFFFFFFFFFFFLL | v416;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShouldDropNearSuspendedAssertionAfterDelay")))
    v417 = 0x40000;
  else
    v417 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFFFFBFFFFLL | v417;
  v418 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitEmbedElementEnabled"));
  v419 = 0x800000000000000;
  if (!v418)
    v419 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xF7FFFFFFFFFFFFFFLL | v419;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCanvasFingerprintingQuirkEnabled")))
    v420 = 0x800000000000;
  else
    v420 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFF7FFFFFFFFFFFLL | v420;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCryptoKitEnabled")))
    v421 = 8;
  else
    v421 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFFFFFF7 | v421;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitICECandidateFilteringEnabled"));
  WebCore::Settings::setICECandidateFilteringEnabled((WebCore::Settings *)v4);
  v422 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLegacyEncryptedMediaAPIEnabled"));
  v423 = 256;
  if (!v422)
    v423 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFFFFFEFFLL | v423;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMockCaptureDevicesEnabled"));
  WebCore::Settings::setMockCaptureDevicesEnabled((WebCore::Settings *)v4);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitEnterKeyHintEnabled")))
    v424 = 0x2000000000000000;
  else
    v424 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xDFFFFFFFFFFFFFFFLL | v424;
  v425 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitEventHandlerDrivenSmoothKeyboardScrollingEnabled"));
  v426 = 0x4000000000000000;
  if (!v425)
    v426 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xBFFFFFFFFFFFFFFFLL | v426;
  v427 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitFTPEnabled"));
  v428 = 1024;
  if (!v427)
    v428 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFFFFFFFBFFLL | v428;
  v429 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitFetchPriorityEnabled"));
  v430 = 0x8000000000000000;
  if (!v429)
    v430 = 0;
  *(_QWORD *)(v12 + 8) = v430 & 0x8000000000000000 | *(_QWORD *)(v12 + 8) & 0x7FFFFFFFFFFFFFFFLL;
  v431 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitFileSystemAccessEnabled"));
  v432 = 2;
  if (!v431)
    v432 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFFFFFFFFFDLL | v432;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFFFFFFFFFELL | (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitFileReaderAPIEnabled")) != 0);
  v433 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitFilterLinkDecorationByDefaultEnabled"));
  v434 = 4;
  if (!v433)
    v434 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFFFFFFFFFBLL | v434;
  v435 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitFullScreenKeyboardLock"));
  v436 = 0x100000000000000;
  if (!v435)
    v436 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFEFFFFFFFFFFFFFFLL | v436;
  v437 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitFullScreenEnabled"));
  v438 = 0x80000000000000;
  if (!v437)
    v438 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFF7FFFFFFFFFFFFFLL | v438;
  v439 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitBlockMediaLayerRehostingInWebContentProcess"));
  v440 = 0x1000000000000000;
  if (!v439)
    v440 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xEFFFFFFFFFFFFFFFLL | v440;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitManageCaptureStatusBarInGPUProcessEnabled")))
    v441 = 0x80000000;
  else
    v441 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFF7FFFFFFFLL | v441;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitUseGPUProcessForWebGLEnabled")))
    v442 = 0x2000000000000000;
  else
    v442 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xDFFFFFFFFFFFFFFFLL | v442;
  v443 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebRTCPlatformCodecsInGPUProcessEnabled"));
  v444 = 0x20000;
  if (!v443)
    v444 = 0;
  v445 = *(_DWORD *)(v12 + 56) & 0xFFFDFFFF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFFFDFFFF | v444;
  *(_BYTE *)(v12 + 60) = BYTE4(v445);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitGamepadTriggerRumbleEnabled")))
    v446 = 0x200000000000000;
  else
    v446 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFDFFFFFFFFFFFFFFLL | v446;
  v447 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitGamepadVibrationActuatorEnabled"));
  v448 = 0x400000000000000;
  if (!v447)
    v448 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFBFFFFFFFFFFFFFFLL | v448;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitGamepadsEnabled")))
    v449 = 0x800000000000000;
  else
    v449 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xF7FFFFFFFFFFFFFFLL | v449;
  v450 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitGenericCueAPIEnabled"));
  v451 = 0x40000000000000;
  if (!v450)
    v451 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFBFFFFFFFFFFFFFLL | v451;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitGraphicsContextFiltersEnabled"));
  WebCore::Settings::setGraphicsContextFiltersEnabled((WebCore::Settings *)v4);
  v452 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAcceleratedDrawingEnabled"));
  v453 = 64;
  if (!v452)
    v453 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFFFFFFBFLL | v453;
  v454 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDetailsNameAttributeEnabled"));
  v455 = 0x200000000000;
  if (!v454)
    v455 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFFFFDFFFFFFFFFFFLL | v455;
  v456 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitModelElementEnabled"));
  v457 = 0x100000000;
  if (!v456)
    v457 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFEFFFFFFFFLL | v457;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitInvokerAttributesEnabled")))
    v458 = 0x80000000;
  else
    v458 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFF7FFFFFFFLL | v458;
  v459 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitPopoverAttributeEnabled"));
  v460 = 0x20000000;
  if (!v459)
    v460 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFDFFFFFFFLL | v460;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitSwitchControlEnabled")))
    v461 = 0x1000000000000;
  else
    v461 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFEFFFFFFFFFFFFLL | v461;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitHiddenPageDOMTimerThrottlingAutoIncreases"));
  WebCore::Settings::setHiddenPageDOMTimerThrottlingAutoIncreases((WebCore::Settings *)v4);
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitHiddenPageDOMTimerThrottlingEnabled"));
  WebCore::Settings::setHiddenPageDOMTimerThrottlingEnabled((WebCore::Settings *)v4);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitHighlightAPIEnabled")))
    v462 = 0x40000;
  else
    v462 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFFFFFBFFFFLL | v462;
  v463 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitHyperlinkAuditingEnabled"));
  v464 = 0x100000;
  if (!v463)
    v464 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFFFFEFFFFFLL | v464;
  v465 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitItpDebugModeEnabled"));
  v466 = 0x40000000000;
  if (!v465)
    v466 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFBFFFFFFFFFFLL | v466;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitTextAutosizingUsesIdempotentMode"));
  WebCore::Settings::setTextAutosizingUsesIdempotentMode((WebCore::Settings *)v4);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitImageAnalysisDuringFindInPageEnabled")))
    v467 = 0x4000000000000000;
  else
    v467 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xBFFFFFFFFFFFFFFFLL | v467;
  v468 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitImageAnimationControlEnabled"));
  v469 = 0x8000000000;
  if (!v468)
    v469 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFF7FFFFFFFFFLL | v469;
  v470 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitImageCaptureEnabled"));
  v471 = 0x80000;
  if (!v470)
    v471 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFFF7FFFFLL | v471;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitInWindowFullscreenEnabled")))
    v472 = 0x2000000;
  else
    v472 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFFFDFFFFFFLL | v472;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitIndexedDBAPIEnabled")))
    v473 = 0x8000000;
  else
    v473 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFFF7FFFFFFLL | v473;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitJavaScriptEnabled")))
    v474 = 0x10000000000000;
  else
    v474 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFEFFFFFFFFFFFFFLL | v474;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLayerBasedSVGEngineEnabled"));
  WebCore::Settings::setLayerBasedSVGEngineEnabled((WebCore::Settings *)v4);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLazyIframeLoadingEnabled")))
    v475 = 0x1000000000000;
  else
    v475 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFEFFFFFFFFFFFFLL | v475;
  v476 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLazyImageLoadingEnabled"));
  v477 = 0x2000000000000;
  if (!v476)
    v477 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFDFFFFFFFFFFFFLL | v477;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLegacyOverflowScrollingTouchEnabled"));
  WebCore::Settings::setLegacyOverflowScrollingTouchEnabled((WebCore::Settings *)v4);
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLegacyLineLayoutVisualCoverageEnabled"));
  WebCore::Settings::setLegacyLineLayoutVisualCoverageEnabled((WebCore::Settings *)v4);
  v478 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShowModalDialogEnabled"));
  v479 = 0x40000000;
  if (!v478)
    v479 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFBFFFFFFFLL | v479;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMediaCaptureRequiresSecureConnection")))
    v480 = 0x400000;
  else
    v480 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFFBFFFFFLL | v480;
  v481 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLinkSanitizerEnabled"));
  v482 = 0x400000000000000;
  if (!v481)
    v482 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFBFFFFFFFFFFFFFFLL | v482;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLinkPreloadResponsiveImagesEnabled")))
    v483 = 0x200000000000000;
  else
    v483 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFDFFFFFFFFFFFFFFLL | v483;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLinkModulePreloadEnabled")))
    v484 = 0x10000000000000;
  else
    v484 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFEFFFFFFFFFFFFFLL | v484;
  v485 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLinkPreconnectEarlyHintsEnabled"));
  v486 = 0x20000000000000;
  if (!v485)
    v486 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFDFFFFFFFFFFFFFLL | v486;
  v487 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLinkPrefetchEnabled"));
  v488 = 0x80000000000000;
  if (!v487)
    v488 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFF7FFFFFFFFFFFFFLL | v488;
  v489 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLiveRangeSelectionEnabled"));
  v490 = 0x800000000000000;
  if (!v489)
    v490 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xF7FFFFFFFFFFFFFFLL | v490;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLoadWebArchiveWithEphemeralStorageEnabled")))
    v491 = 4;
  else
    v491 = 0;
  v492 = *v249 & 0xFFFFFFFB | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFFFFFFFB | v491;
  *(_BYTE *)(v12 + 60) = BYTE4(v492);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLocalFileContentSniffingEnabledPreferenceKey")))
    v493 = 0x4000000000000000;
  else
    v493 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xBFFFFFFFFFFFFFFFLL | v493;
  v494 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLocalStorageEnabledPreferenceKey"));
  v495 = 0x8000000000000000;
  if (!v494)
    v495 = 0;
  v496 = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFFFFFFELL;
  *(_QWORD *)(v12 + 16) = v495 & 0x8000000000000000 | *(_QWORD *)(v12 + 16) & 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)(v12 + 24) = v496;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLogsPageMessagesToSystemConsoleEnabled")))
    v497 = 4;
  else
    v497 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFFFFFFBLL | v497;
  v498 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLoginStatusAPIEnabled"));
  v499 = 2;
  if (!v498)
    v499 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFFFFFFDLL | v499;
  v500 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMainContentUserGestureOverrideEnabled"));
  v501 = 8;
  if (!v500)
    v501 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFFFFFF7 | v501;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitManagedMediaSourceEnabled")))
    v502 = 0x2000;
  else
    v502 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFFFFDFFFLL | v502;
  v503 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitManagedMediaSourceNeedsAirPlay"));
  v504 = 0x8000;
  if (!v503)
    v504 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFFFF7FFFLL | v504;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCoreMathMLEnabled"));
  WebCore::Settings::setCoreMathMLEnabled((WebCore::Settings *)v4);
  v505 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMediaCapabilitiesExtensionsEnabled"));
  v506 = 64;
  if (!v505)
    v506 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFFFFFBFLL | v506;
  v507 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMediaCapabilityGrantsEnabled"));
  v508 = 0x40000000000000;
  if (!v507)
    v508 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFBFFFFFFFFFFFFFLL | v508;
  v509 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMediaSessionEnabled"));
  v510 = 4096;
  if (!v509)
    v510 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFFFFEFFFLL | v510;
  v511 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMediaSourceEnabled"));
  v512 = 1024;
  if (!v511)
    v512 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFFFFBFFLL | v512;
  v513 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMediaDevicesEnabled"));
  v514 = 0x800000;
  if (!v513)
    v514 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFF7FFFFFLL | v514;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMediaRecorderEnabled")))
    v515 = 2048;
  else
    v515 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFFFEF7FFLL | v515;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMediaStreamTrackProcessingEnabled")))
    v516 = 0x2000000;
  else
    v516 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFDFFFFFFLL | v516;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMomentumScrollingAnimatorEnabled")))
    v517 = 0x2000;
  else
    v517 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFFFDFFFLL | v517;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitInputTypeMonthEnabled")))
    v518 = 32;
  else
    v518 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFFFFFFDFLL | v518;
  v519 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMouseEventsSimulationEnabled"));
  v520 = 0x1000000000000;
  if (!v519)
    v520 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFEFFFFFFFFFFFFLL | v520;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMuteCameraOnMicrophoneInterruptionEnabled")))
    v521 = 0x8000000;
  else
    v521 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFF7FFFFFFLL | v521;
  v522 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitNavigationAPIEnabled"));
  v523 = 0x4000;
  if (!v522)
    v523 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFFFBFFFLL | v523;
  v524 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitUseSiteSpecificSpoofing"));
  v525 = 0x80000;
  if (!v524)
    v525 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFF7FFFFLL | v525;
  v526 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitNeedsStorageAccessFromFileURLsQuirk"));
  v527 = 0x100000;
  if (!v526)
    v527 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFEFFFFFLL | v527;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitFlexFormattingContextIntegrationEnabled")))
    v528 = 32;
  else
    v528 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFFFFFFFFDFLL | v528;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitNotificationsEnabled")))
    v529 = 0x200000000;
  else
    v529 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFDFFFFFFFFLL | v529;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAccessibilityThreadTextApisEnabled")))
    v530 = 512;
  else
    v530 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFFFFFDFFLL | v530;
  v531 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitOffscreenCanvasInWorkersEnabled"));
  v532 = 0x2000000000;
  if (!v531)
    v532 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFDFFFFFFFFFLL | v532;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitOffscreenCanvasEnabled")))
    v533 = 0x1000000000;
  else
    v533 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFEFFFFFFFFFLL | v533;
  v534 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitOffscreenCanvasDeprecatedCommitEnabled"));
  v535 = 0x800000000;
  if (!v534)
    v535 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFF7FFFFFFFFLL | v535;
  v536 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitOpportunisticSweepingAndGarbageCollectionEnabled"));
  v537 = 0x200000;
  if (!v536)
    v537 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFDFFFFFLL | v537;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitOverlappingBackingStoreProvidersEnabled")))
    v538 = 0x400000;
  else
    v538 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFFBFFFFFLL | v538;
  v539 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitBlobRegistryTopOriginPartitioningEnabled"));
  v540 = 0x20000000000;
  if (!v539)
    v540 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFDFFFFFFFFFFLL | v540;
  v541 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitPermissionsAPIEnabled"));
  v542 = 0x10000000;
  if (!v541)
    v542 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFEFFFFFFFLL | v542;
  v543 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitPreferPageRenderingUpdatesNear60FPSEnabled"));
  v544 = 0x80000000;
  if (!v543)
    v544 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFF7FFFFFFFLL | v544;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitPreferSandboxedMediaParsing")))
    v545 = 0x100000000000000;
  else
    v545 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFEFFFFFFFFFFFFFFLL | v545;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitPrivateClickMeasurementDebugModeEnabled")))
    v546 = 0x200000000;
  else
    v546 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFDFFFFFFFFLL | v546;
  v547 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitPrivateClickMeasurementEnabled"));
  v548 = 0x400000000;
  if (!v547)
    v548 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFBFFFFFFFFLL | v548;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitPrivateTokenUsageByThirdPartyEnabled")))
    v549 = 0x1000000000;
  else
    v549 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFEFFFFFFFFFLL | v549;
  v550 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitPushAPIEnabled"));
  v551 = 0x4000000000;
  if (!v550)
    v551 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFBFFFFFFFFFLL | v551;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLegacyPluginQuirkForMailSignaturesEnabled")))
    v552 = 0x8000000000000;
  else
    v552 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFF7FFFFFFFFFFFFLL | v552;
  v553 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitGoogleAntiFlickerOptimizationQuirkEnabled"));
  v554 = 0x2000;
  if (!v553)
    v554 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFFFFFFDFFFLL | v554;
  v555 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitRemotePlaybackEnabled"));
  v556 = 0x1000000;
  if (!v555)
    v556 = 0;
  v557 = *(_DWORD *)(v12 + 56) & 0xFEFFFFFF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  v558 = *v249 & 0xFEFFFFFF | v556;
  *(_QWORD *)(v12 + 48) &= ~2uLL;
  *v249 = v558;
  *(_BYTE *)(v12 + 60) = BYTE4(v557);
  v559 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitReportingEnabled"));
  v560 = 0x8000000000;
  if (!v559)
    v560 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFF7FFFFFFFFFLL | v560;
  v561 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitRequestVideoFrameCallbackEnabled"));
  v562 = 0x40000000000;
  if (!v561)
    v562 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFBFFFFFFFFFFLL | v562;
  v563 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitSpeakerSelectionRequiresUserGesture"));
  v564 = 0x40000000;
  if (!v563)
    v564 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFBFFFFFFFLL | v564;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitFullscreenRequirementForScreenOrientationLockingEnabled")))v565 = 2048;
  else
    v565 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFFFFFFF7FFLL | v565;
  v566 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitGetUserMediaRequiresFocus"));
  v567 = 0x40000;
  if (!v566)
    v567 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFFFBFFFFLL | v567;
  v568 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitResourceLoadSchedulingEnabled"));
  v569 = 0x800000000000;
  if (!v568)
    v569 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFF7FFFFFFFFFFFLL | v569;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitResourceUsageOverlayVisible"));
  WebCore::Settings::setResourceUsageOverlayVisible((WebCore::Settings *)v4);
  v570 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitSKAttributionEnabled"));
  v571 = 0x1000000000000;
  if (!v570)
    v571 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFEFFFFFFFFFFFFLL | v571;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitIsSameSiteStrictEnforcementEnabled")))
    v572 = 0x10000000000;
  else
    v572 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFEFFFFFFFFFFLL | v572;
  v573 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitScreenOrientationLockingAPIEnabled"));
  v574 = 0x4000000000000;
  if (!v573)
    v574 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFBFFFFFFFFFFFFLL | v574;
  v575 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitScreenOrientationAPIEnabled"));
  v576 = 0x2000000000000;
  if (!v575)
    v576 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFDFFFFFFFFFFFFLL | v576;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitScreenWakeLockAPIEnabled")))
    v577 = 0x8000000000000;
  else
    v577 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFF7FFFFFFFFFFFFLL | v577;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitScreenCaptureEnabled")))
    v578 = 0x20000000;
  else
    v578 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFDFFFFFFFLL | v578;
  WebCore::Settings::setScrollingPerformanceTestingEnabled((WebCore::Settings *)v4);
  v579 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitScrollToTextFragmentFeatureDetectionEnabled"));
  v580 = 0x200000000000000;
  if (!v579)
    v580 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFDFFFFFFFFFFFFFFLL | v580;
  v581 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitScrollToTextFragmentGenerationEnabled"));
  v582 = 0x400000000000000;
  if (!v581)
    v582 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFBFFFFFFFFFFFFFFLL | v582;
  v583 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitScrollToTextFragmentIndicatorEnabled"));
  v584 = 0x800000000000000;
  if (!v583)
    v584 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xF7FFFFFFFFFFFFFFLL | v584;
  v585 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitScrollToTextFragmentMarkingEnabled"));
  v586 = 0x1000000000000000;
  if (!v585)
    v586 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xEFFFFFFFFFFFFFFFLL | v586;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitScrollToTextFragmentEnabled")))
    v587 = 0x100000000000000;
  else
    v587 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFEFFFFFFFFFFFFFFLL | v587;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitScrollAnimatorEnabled")))
    v588 = 0x40000000000000;
  else
    v588 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFBFFFFFFFFFFFFFLL | v588;
  v589 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitScrollDrivenAnimationsEnabled"));
  v590 = 0x80000000000000;
  if (!v589)
    v590 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFF7FFFFFFFFFFFFFLL | v590;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFFFFFFFFELL | (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitSearchInputIncrementalAttributeAndSearchEventEnabled")) != 0);
  v591 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitSecureContextChecksEnabled"));
  v592 = 2;
  if (!v591)
    v592 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFFFFFFFFDLL | v592;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitSelectionAPIForShadowDOMEnabled")))
    v593 = 16;
  else
    v593 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFFFFFFFEFLL | v593;
  v594 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitSendMouseEventsToDisabledFormControlsEnabled"));
  v595 = 32;
  if (!v594)
    v595 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFFFFFFFDFLL | v595;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitServiceWorkerNavigationPreloadEnabled")))
    v596 = 64;
  else
    v596 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFFFFFFF3FLL | v596;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShapeDetection")))
    v597 = 512;
  else
    v597 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFFFFFFDFFLL | v597;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitSharedWorkerEnabled")))
    v598 = 1024;
  else
    v598 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFFFFFFBFFLL | v598;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitShowMediaStatsContextMenuItemEnabled")))
    v599 = 0x20000000;
  else
    v599 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFDFFFFFFFLL | v599;
  v600 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitSidewaysWritingModesEnabled"));
  v601 = 0x1000000000;
  if (!v600)
    v601 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFEFFFFFFFFFLL | v601;
  v602 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitSiteIsolationEnabled"));
  v603 = 0x2000000000;
  if (!v602)
    v603 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFDFFFFFFFFFLL | v603;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitSpeechRecognitionEnabled")))
    v604 = 0x10000000000;
  else
    v604 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFEFFFFFFFFFFLL | v604;
  v605 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitSpeechSynthesisAPIEnabled"));
  v606 = 0x20000000000;
  if (!v605)
    v606 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFDFFFFFFFFFFLL | v606;
  v607 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitStorageAPIEstimateEnabled"));
  v608 = 0x200000000000;
  if (!v607)
    v608 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFDFFFFFFFFFFFLL | v608;
  v609 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitStorageAPIEnabled"));
  v610 = 0x100000000000;
  if (!v609)
    v610 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFEFFFFFFFFFFFLL | v610;
  objc_msgSend(a3, "_integerValueForKey:", CFSTR("WebKitStorageBlockingPolicy"));
  WebCore::Settings::setStorageBlockingPolicy();
  *(_QWORD *)(v12 + 32) |= 0x4000000uLL;
  v611 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitTextAnimationsEnabled"));
  v612 = 0x4000000;
  if (!v611)
    v612 = 0;
  v613 = *(_DWORD *)(v12 + 56) & 0xFBFFFFFF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  v614 = *v249 & 0xFBFFFFFF | v612;
  *(_QWORD *)(v12 + 40) &= ~0x8000000000000000;
  *v249 = v614;
  *(_BYTE *)(v12 + 60) = BYTE4(v613);
  v615 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitThreadedAnimationResolutionEnabled"));
  v616 = 0x800000000000;
  if (!v615)
    v616 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFF7FFFFFFFFFFFLL | v616;
  v617 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitTiledScrollingIndicatorVisible"));
  v618 = 0x100000000;
  if (!v617)
    v618 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFEFFFFFFFFLL | v618;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitInputTypeTimeEnabled")))
    v619 = 64;
  else
    v619 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFFFFFFBFLL | v619;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitTrackConfigurationEnabled")))
    v620 = 0x40000000000000;
  else
    v620 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFBFFFFFFFFFFFFFLL | v620;
  v621 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitTrustedTypesEnabled"));
  v622 = 0x200000000000000;
  if (!v621)
    v622 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFDFFFFFFFFFFFFFFLL | v622;
  v623 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitUndoManagerAPIEnabled"));
  v624 = 0x800000000000000;
  if (!v623)
    v624 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xF7FFFFFFFFFFFFFFLL | v624;
  v625 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitUnifiedPDFEnabled"));
  v626 = 0x8000000000000;
  if (!v625)
    v626 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFF7FFFFFFFFFFFFLL | v626;
  v627 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitIPAddressAndLocalhostMixedContentUpgradeTestingEnabled"));
  v628 = 0x200000;
  if (!v627)
    v628 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFFFFDFFFFFLL | v628;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitUpgradeMixedContentEnabled")))
    v629 = 0x4000000000000000;
  else
    v629 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xBFFFFFFFFFFFFFFFLL | v629;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFFFFFELL | (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitUseGiantTiles")) != 0);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitUserActivationAPIEnabled")))
    v630 = 8;
  else
    v630 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFFFFF7 | v630;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitUserGesturePromisePropagationEnabled")))
    v631 = 16;
  else
    v631 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFFFFEFLL | v631;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitServiceWorkersUserGestureEnabled")))
    v632 = 256;
  else
    v632 = 0;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v12 + 32) & 0xFFFFFFFFFFFFFEFFLL | v632;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitVerifyWindowOpenUserGestureFromUIProcess")))
    v633 = 128;
  else
    v633 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFFFF7FLL | v633;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitVerticalFormControlsEnabled")))
    v634 = 256;
  else
    v634 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFFFEFFLL | v634;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitViewTransitionsEnabled")))
    v635 = 1024;
  else
    v635 = 0;
  v636 = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFFFFFFFELL;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFFFBFFLL | v635;
  *(_QWORD *)(v12 + 48) = v636;
  v637 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitVisualViewportAPIEnabled"));
  v638 = 2048;
  if (!v637)
    v638 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFFF7FFLL | v638;
  v639 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebAPIStatisticsEnabled"));
  v640 = 0x4000;
  if (!v639)
    v640 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFFBFFFLL | v640;
  v641 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebAPIsInShadowRealmEnabled"));
  v642 = 0x8000;
  if (!v641)
    v642 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFF7FFFLL | v642;
  v643 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebAnimationsCustomEffectsEnabled"));
  v644 = 0x10000;
  if (!v643)
    v644 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFEFFFFLL | v644;
  v645 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebAnimationsCustomFrameRateEnabled"));
  v646 = 0x20000;
  if (!v645)
    v646 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFDFFFFLL | v646;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebArchiveDebugModeEnabledPreferenceKey")))
    v647 = 8;
  else
    v647 = 0;
  v648 = *v249 & 0xFFFFFFF7 | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFFFFFFF7 | v647;
  *(_BYTE *)(v12 + 60) = BYTE4(v648);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebArchiveTestingModeEnabled")))
    v649 = 16;
  else
    v649 = 0;
  v650 = *v249 & 0xFFFFFFEF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFFFFFFEF | v649;
  *(_BYTE *)(v12 + 60) = BYTE4(v650);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebAuthenticationASEnabled")))
    v651 = 0x10000000;
  else
    v651 = 0;
  v652 = *v249 & 0xEFFFFFFF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xEFFFFFFF | v651;
  *(_BYTE *)(v12 + 60) = BYTE4(v652);
  v653 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebAuthenticationEnabled"));
  v654 = 64;
  if (!v653)
    v654 = 0;
  v655 = *(_DWORD *)(v12 + 56) & 0xFFFFFFBF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFFFFFFBF | v654;
  *(_BYTE *)(v12 + 60) = BYTE4(v655);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebCryptoSafeCurvesEnabled")))
    v656 = 0x40000;
  else
    v656 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFBFFFFLL | v656;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebCryptoX25519Enabled")))
    v657 = 0x80000;
  else
    v657 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFF7FFFFLL | v657;
  v658 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebLocksAPIEnabled"));
  v659 = 0x4000000;
  if (!v658)
    v659 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFBFFFFFFLL | v659;
  v660 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebShareFileAPIEnabled"));
  v661 = 0x80000000;
  if (!v660)
    v661 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFF7FFFFFFFLL | v661;
  v662 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebShareEnabled"));
  v663 = 0x40000000;
  if (!v662)
    v663 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFBFFFFFFFLL | v663;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebAssemblyESMIntegrationEnabled")))
    v664 = 0x4000000000000000;
  else
    v664 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xBFFFFFFFFFFFFFFFLL | v664;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebCodecsAV1Enabled")))
    v665 = 128;
  else
    v665 = 0;
  v666 = *v249 & 0xFFFFFF7F | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFFFFFF7F | v665;
  *(_BYTE *)(v12 + 60) = BYTE4(v666);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebCodecsAudioEnabled")))
    v667 = 256;
  else
    v667 = 0;
  v668 = *v249 & 0xFFFFFEFF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFFFFFEFF | v667;
  *(_BYTE *)(v12 + 60) = BYTE4(v668);
  v669 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebCodecsHEVCEnabled"));
  v670 = 512;
  if (!v669)
    v670 = 0;
  v671 = *(_DWORD *)(v12 + 56) & 0xFFFFFDFF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFFFFFDFF | v670;
  *(_BYTE *)(v12 + 60) = BYTE4(v671);
  v672 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebCodecsVideoEnabled"));
  v673 = 1024;
  if (!v672)
    v673 = 0;
  v674 = *(_DWORD *)(v12 + 56) & 0xFFFFFBFF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFFFFFBFF | v673;
  *(_BYTE *)(v12 + 60) = BYTE4(v674);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebGLDraftExtensionsEnabled")))
    v675 = 0x100000;
  else
    v675 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFEFFFFFLL | v675;
  v676 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebGLTimerQueriesEnabled"));
  v677 = 0x800000;
  if (!v676)
    v677 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFF7FFFFFLL | v677;
  *v249 = *v249 & 0xFFFFFFFE | (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebGLUsingMetal")) != 0);
  v678 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebGLEnabled"));
  v679 = 0x200000;
  if (!v678)
    v679 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFDFFFFFLL | v679;
  v680 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebGPUEnabled"));
  v681 = 0x1000000;
  if (!v680)
    v681 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFEFFFFFFLL | v681;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebInspectorEngineeringSettingsAllowed")))
    v682 = 0x2000000;
  else
    v682 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFDFFFFFFLL | v682;
  v683 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebRTCAV1CodecEnabled"));
  v684 = 0x2000;
  if (!v683)
    v684 = 0;
  v685 = *(_DWORD *)(v12 + 56) & 0xFFFFDFFF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFFFFDFFF | v684;
  *(_BYTE *)(v12 + 60) = BYTE4(v685);
  v686 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebRTCDTMFEnabled"));
  v687 = 0x4000;
  if (!v686)
    v687 = 0;
  v688 = *(_DWORD *)(v12 + 56) & 0xFFFFBFFF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFFFFBFFF | v687;
  *(_BYTE *)(v12 + 60) = BYTE4(v688);
  v689 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebRTCEncodedTransformEnabled"));
  v690 = 0x8000;
  if (!v689)
    v690 = 0;
  v691 = *(_DWORD *)(v12 + 56) & 0xFFFF7FFF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFFFF7FFF | v690;
  *(_BYTE *)(v12 + 60) = BYTE4(v691);
  v692 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebRTCH265CodecEnabled"));
  v693 = 0x10000;
  if (!v692)
    v693 = 0;
  v694 = *(_DWORD *)(v12 + 56) & 0xFFFEFFFF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFFFEFFFF | v693;
  *(_BYTE *)(v12 + 60) = BYTE4(v694);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebRTCMediaPipelineAdditionalLoggingEnabled")))
    v695 = 0x10000000;
  else
    v695 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFEFFFFFFFLL | v695;
  v696 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitPeerConnectionVideoScalingAdaptationDisabled"));
  v697 = 4096;
  if (!v696)
    v697 = 0;
  v698 = *(_DWORD *)(v12 + 56) & 0xFFFFEFFF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFFFFEFFF | v697;
  *(_BYTE *)(v12 + 60) = BYTE4(v698);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitPeerConnectionEnabled")))
    v699 = 2048;
  else
    v699 = 0;
  v700 = *v249 & 0xFFFFF7FF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFFFFF7FF | v699;
  *(_BYTE *)(v12 + 60) = BYTE4(v700);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebRTCRemoteVideoFrameEnabled")))
    v701 = 0x40000;
  else
    v701 = 0;
  v702 = *v249 & 0xFFFBFFFF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFFFBFFFF | v701;
  *(_BYTE *)(v12 + 60) = BYTE4(v702);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebRTCSFrameTransformEnabled")))
    v703 = 0x80000;
  else
    v703 = 0;
  v704 = *v249 & 0xFFF7FFFF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFFF7FFFF | v703;
  *(_BYTE *)(v12 + 60) = BYTE4(v704);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebRTCSocketsProxyingEnabled")))
    v705 = 0x100000;
  else
    v705 = 0;
  v706 = *v249 & 0xFFEFFFFF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFFEFFFFF | v705;
  *(_BYTE *)(v12 + 60) = BYTE4(v706);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebRTCVP9Profile0CodecEnabled")))
    v707 = 0x200000;
  else
    v707 = 0;
  v708 = *v249 & 0xFFDFFFFF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFFDFFFFF | v707;
  *(_BYTE *)(v12 + 60) = BYTE4(v708);
  v709 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebRTCVP9Profile2CodecEnabled"));
  v710 = 0x400000;
  if (!v709)
    v710 = 0;
  v711 = *(_DWORD *)(v12 + 56) & 0xFFBFFFFF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFFBFFFFF | v710;
  *(_BYTE *)(v12 + 60) = BYTE4(v711);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebTransportEnabled")))
    v712 = 0x200000000;
  else
    v712 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFDFFFFFFFFLL | v712;
  v713 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitInputTypeWeekEnabled"));
  v714 = 128;
  if (!v713)
    v714 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFFFFFF7FLL | v714;
  v715 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWheelEventGesturesBecomeNonBlocking"));
  v716 = 0x800000000;
  if (!v715)
    v716 = 0;
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFF7FFFFFFFFLL | v716;
  v717 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitPassiveWheelListenersAsDefaultOnDocument"));
  v718 = 0x4000000;
  if (!v717)
    v718 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFFFFFBFFFFFFLL | v718;
  v719 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWriteRichTextDataWhenCopyingOrDragging"));
  v720 = 0x80000000;
  if (!v719)
    v720 = 0;
  v721 = *(_DWORD *)(v12 + 56) & 0x7FFFFFFF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0x7FFFFFFF | v720;
  *(_BYTE *)(v12 + 60) = BYTE4(v721);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWritingSuggestionsAttributeEnabled")))
    v722 = 0x2000000;
  else
    v722 = 0;
  v723 = *v249 & 0xFDFFFFFF | ((unint64_t)*(unsigned __int8 *)(v12 + 60) << 32);
  *v249 = *v249 & 0xFDFFFFFF | v722;
  *(_BYTE *)(v12 + 60) = BYTE4(v723);
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitIsFirstPartyWebsiteDataRemovalLiveOnTestingEnabled")))v724 = 0x200000000;
  else
    v724 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFDFFFFFFFFLL | v724;
  v725 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitIsFirstPartyWebsiteDataRemovalReproTestingEnabled"));
  v726 = 0x400000000;
  if (!v725)
    v726 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFBFFFFFFFFLL | v726;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAlignContentOnBlocksEnabled")))
    v727 = 2048;
  else
    v727 = 0;
  *(_QWORD *)v12 = *(_QWORD *)v12 & 0xFFFFFFFFFFFFF7FFLL | v727;
  v728 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitInputTypeDateTimeLocalEnabled"));
  v729 = 16;
  if (!v728)
    v729 = 0;
  *(_QWORD *)(v12 + 48) = *(_QWORD *)(v12 + 48) & 0xFFFFFFFFFFFFFFEFLL | v729;
  v730 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitElementCheckVisibilityEnabled"));
  v731 = 0x400000000000000;
  if (!v730)
    v731 = 0;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v12 + 8) & 0xFBFFFFFFFFFFFFFFLL | v731;
  if (objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitHTTPEquivEnabled")))
    v732 = 0x80000;
  else
    v732 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 + 16) & 0xFFFFFFFFFFF7FFFFLL | v732;
  v733 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitRequestIdleCallbackEnabled"));
  v734 = 0x10000000000;
  if (!v733)
    v734 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFEFFFFFFFFFFLL | v734;
  v735 = objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitRequestStorageAccessThrowsExceptionUntilReload"));
  v736 = 0x20000000000;
  if (!v735)
    v736 = 0;
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v12 + 24) & 0xFFFFFDFFFFFFFFFFLL | v736;
  objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCSSWordBreakAutoPhraseEnabled"));
  WebCore::Settings::setCSSWordBreakAutoPhraseEnabled((WebCore::Settings *)v4);
  WebCore::DeprecatedGlobalSettings::setMockScrollbarsEnabled((WebCore::DeprecatedGlobalSettings *)objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMockScrollbarsEnabled")));
  v737 = (WebCore::DeprecatedGlobalSettings *)objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitLowPowerVideoAudioBufferSizeEnabled"));
  *(_BYTE *)(WebCore::DeprecatedGlobalSettings::shared(v737) + 18) = (_BYTE)v737;
  v738 = (WebCore::DeprecatedGlobalSettings *)objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebMParserEnabled"));
  *(_BYTE *)(WebCore::DeprecatedGlobalSettings::shared(v738) + 32) = (_BYTE)v738;
  WebCore::DeprecatedGlobalSettings::setAVFoundationEnabled((WebCore::DeprecatedGlobalSettings *)objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAVFoundationEnabled")));
  v739 = (WebCore::DeprecatedGlobalSettings *)objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitAttachmentElementEnabled"));
  *(_BYTE *)(WebCore::DeprecatedGlobalSettings::shared(v739) + 25) = (_BYTE)v739;
  v740 = (WebCore::DeprecatedGlobalSettings *)objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitCustomPasteboardDataEnabled"));
  *(_BYTE *)(WebCore::DeprecatedGlobalSettings::shared(v740) + 21) = (_BYTE)v740;
  v741 = (WebCore::DeprecatedGlobalSettings *)objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitDisableScreenSizeOverride"));
  *(_BYTE *)(WebCore::DeprecatedGlobalSettings::shared(v741) + 17) = (_BYTE)v741;
  WebCore::DeprecatedGlobalSettings::setMediaSourceInlinePaintingEnabled((WebCore::DeprecatedGlobalSettings *)objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitMediaSourceInlinePaintingEnabled")));
  v742 = (WebCore::DeprecatedGlobalSettings *)objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitRestrictedHTTPResponseAccess"));
  *(_BYTE *)(WebCore::DeprecatedGlobalSettings::shared(v742) + 22) = (_BYTE)v742;
  v743 = (WebCore::DeprecatedGlobalSettings *)objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitModelDocumentEnabled"));
  *(_BYTE *)(WebCore::DeprecatedGlobalSettings::shared(v743) + 37) = (_BYTE)v743;
  WebCore::DeprecatedGlobalSettings::setOpusDecoderEnabled((WebCore::DeprecatedGlobalSettings *)objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitOpusDecoderEnabled")));
  v744 = (WebCore::DeprecatedGlobalSettings *)objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitReadableByteStreamAPIEnabled"));
  *(_BYTE *)(WebCore::DeprecatedGlobalSettings::shared(v744) + 30) = (_BYTE)v744;
  WebCore::DeprecatedGlobalSettings::setVorbisDecoderEnabled((WebCore::DeprecatedGlobalSettings *)objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitVorbisDecoderEnabled")));
  v745 = (WebCore::DeprecatedGlobalSettings *)objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebRTCAudioLatencyAdaptationEnabled"));
  *(_BYTE *)(WebCore::DeprecatedGlobalSettings::shared(v745) + 29) = (_BYTE)v745;
  v746 = (WebCore::DeprecatedGlobalSettings *)objc_msgSend(a3, "_BOOLValueForKey:", CFSTR("WebKitWebRTCH264LowLatencyEncoderEnabled"));
  *(_BYTE *)(WebCore::DeprecatedGlobalSettings::shared(v746) + 26) = (_BYTE)v746;
}

@end
