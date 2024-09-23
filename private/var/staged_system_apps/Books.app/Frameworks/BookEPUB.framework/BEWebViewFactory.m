@implementation BEWebViewFactory

+ (id)_standardProcessPoolWithSingleWebProcess:(BOOL)a3 forWebTOC:(BOOL)a4
{
  _BOOL8 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init((Class)_WKProcessPoolConfiguration);
  if (!a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "builtInPlugInsURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("BookEPUBWebProcessPlugin.bundle")));

    objc_msgSend(v6, "setInjectedBundleURL:", v9);
  }
  objc_msgSend(v6, "setUsesSingleWebProcess:", v5);
  objc_msgSend(v6, "setShouldThrowExceptionForGlobalConstantRedeclaration:", 0);
  objc_msgSend(v6, "setProcessSwapsOnNavigation:", 0);
  v10 = objc_msgSend(objc_alloc((Class)WKProcessPool), "_initWithConfiguration:", v6);

  return v10;
}

+ (id)_standardProcessPoolForAssetID:(id)a3 withSingleWebProcess:(BOOL)a4 forWebTOC:(BOOL)a5
{
  id v8;
  _QWORD *v9;
  id v10;
  _QWORD v12[2];
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t *v16;
  id v17;
  BOOL v18;
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_128FC;
  v24 = sub_1290C;
  v25 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v13 = sub_12914;
  v14 = &unk_377D10;
  v16 = &v20;
  v8 = a3;
  v15 = v8;
  v17 = a1;
  v18 = a4;
  v19 = a5;
  v9 = v12;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_3C1A70);
  v13((uint64_t)v9);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_3C1A70);

  v10 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v10;
}

+ (id)_standardWKPreferences:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  +[UIView be_enableWKContentViewOverrides](UIView, "be_enableWKContentViewOverrides");
  +[UILongPressGestureRecognizer be_enableUIVariableDelayLoupeGestureOverrides](UILongPressGestureRecognizer, "be_enableUIVariableDelayLoupeGestureOverrides");
  v4 = objc_alloc_init((Class)WKPreferences);
  objc_msgSend(v4, "_setDeveloperExtrasEnabled:", BEShouldEnableDeveloperExtrasSettings(a3));
  objc_msgSend(v4, "setJavaScriptCanOpenWindowsAutomatically:", 0);
  objc_msgSend(v4, "_setOfflineApplicationCacheIsEnabled:", 0);
  objc_msgSend(v4, "_setLargeImageAsyncDecodingEnabled:", 0);
  objc_msgSend(v4, "_setAnimatedImageAsyncDecodingEnabled:", 0);
  objc_msgSend(v4, "_setShouldSuppressKeyboardInputDuringProvisionalNavigation:", 1);
  objc_msgSend(v4, "_setTextAutosizingEnabled:", 0);
  objc_msgSend(v4, "_setJavaScriptCanAccessClipboard:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[WKPreferences _internalDebugFeatures](WKPreferences, "_internalDebugFeatures", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("SelectionFlippingEnabled")) & 1) != 0)
        {
          v13 = objc_msgSend(v4, "_isEnabledForInternalDebugFeature:", v11);

          if ((v13 & 1) == 0)
          {
            objc_msgSend(v4, "_setEnabled:forInternalDebugFeature:", 1, v11);
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
LABEL_12:

  if (objc_msgSend(v5, "BOOLForKey:", BKDisableAccleratedWebRendering[0]))
    objc_msgSend(v4, "_setAcceleratedDrawingEnabled:", 0);
  if (objc_msgSend(v5, "BOOLForKey:", BKWebDrawBorders))
    objc_msgSend(v4, "_setCompositingBordersVisible:", 1);

  return v4;
}

+ (id)_standardWKWebViewConfiguration:(id)a3 cacheItem:(id)a4 usesSingleWebProcess:(BOOL)a5 forWebTOC:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = objc_alloc_init((Class)WKWebpagePreferences);
  objc_msgSend(v12, "setPreferredContentMode:", 1);
  v13 = objc_alloc_init((Class)WKWebViewConfiguration);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[WKWebsiteDataStore defaultDataStore](WKWebsiteDataStore, "defaultDataStore"));
  objc_msgSend(v13, "setWebsiteDataStore:", v14);

  objc_msgSend(v13, "setDefaultWebpagePreferences:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bookID"));
  if (v7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bookID"));
    v17 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_single_process"), v16));

    v15 = (void *)v17;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_standardProcessPoolForAssetID:withSingleWebProcess:forWebTOC:", v15, v7, v6));
  objc_msgSend(v13, "setProcessPool:", v18);

  objc_msgSend(v13, "setPreferences:", v10);
  objc_msgSend(v13, "setAllowsAirPlayForMediaPlayback:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName")));
  objc_msgSend(v13, "setApplicationNameForUserAgent:", v20);

  objc_msgSend(v13, "_setAllowsMetaRefresh:", 0);
  objc_msgSend(v13, "_setApplePayEnabled:", 0);
  objc_msgSend(v13, "setMediaTypesRequiringUserActionForPlayback:", -1);
  objc_msgSend(v13, "_setMediaDataLoadsAutomatically:", 0);
  objc_msgSend(v13, "setSuppressesIncrementalRendering:", 1);
  objc_msgSend(v13, "setDataDetectorTypes:", 0);
  objc_msgSend(v13, "setAllowsPictureInPictureMediaPlayback:", 0);
  objc_msgSend(v13, "_setDragLiftDelay:", 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[BEURLSchemeHandler schemeHandlerForCacheItem:](BEURLSchemeHandler, "schemeHandlerForCacheItem:", v11));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "supportedSchemes"));
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v29;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(v13, "setURLSchemeHandler:forURLScheme:", v21, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v26));
        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v24);
  }

  return v13;
}

+ (void)_addJavascript:(id)a3 userContentController:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v21 = a3;
  v24 = a4;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[WKContentWorld pageWorld](WKContentWorld, "pageWorld"));
  v5 = BEURLIncludePatternsForBooks();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = 0;
  do
  {
    v22 = v7;
    v8 = qword_2E48C0[2 * v7];
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v21;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = v22 & 0x7FFFFFFFFFFFFFFDLL;
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          if (v12 == 1)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mainFrameOnlyJavascript:", v8));
            v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mainFrameJavascriptURL:", v8));
          }
          else
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "anyFrameJavascript:", v8));
            v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "anyFrameJavascriptURL:", v8));
          }
          v18 = (void *)v17;
          if (objc_msgSend(v16, "length"))
          {
            LOBYTE(v20) = 0;
            v19 = objc_msgSend(objc_alloc((Class)WKUserScript), "_initWithSource:injectionTime:forMainFrameOnly:includeMatchPatternStrings:excludeMatchPatternStrings:associatedURL:contentWorld:deferRunningUntilNotification:", v16, v8, v12 == 1, v6, &__NSArray0__struct, v18, v23, v20);
            objc_msgSend(v24, "addUserScript:", v19);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v11);
    }

    v7 = v22 + 1;
  }
  while (v22 != 3);

}

+ (void)_setupContentBlockingRulesforWebView:(id)a3 rule:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  objc_msgSend(v5, "be_suspendLoading");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BEContentBlockingRules sharedInstance](BEContentBlockingRules, "sharedInstance"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_131C4;
  v8[3] = &unk_377D38;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "applyContentBlockingRule:toWebView:completion:", a4, v7, v8);

}

+ (void)_applyMetaViewportOverridesToWebView:(id)a3 fixedLayoutSize:(CGSize)a4
{
  double height;
  double width;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  v6 = objc_opt_class(_BEFixedLayoutWKWebView);
  v7 = BUDynamicCast(v6, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "be_applyMetaViewportOverridesForFixedLayoutSize:", width, height);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "be_viewportArguments"));
    objc_msgSend(v11, "_overrideViewportWithArguments:", v10);

  }
}

+ (void)updateFixedLayoutWebView:(id)a3 fixedLayoutSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  NSString *v12;
  void *v13;
  id v14;
  NSSize v15;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v7 = objc_opt_class(_BEFixedLayoutWKWebView);
  v8 = BUDynamicCast(v7, v6);
  v14 = (id)objc_claimAutoreleasedReturnValue(v8);

  if (v14)
  {
    objc_msgSend(v14, "be_fixedLayoutSize");
    if (width != v10 || height != v9)
    {
      v15.width = width;
      v15.height = height;
      v12 = NSStringFromSize(v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      NSLog(CFSTR("{IMRenderingCache} Updating webView fixed layout size to %@"), v13);

      objc_msgSend(v14, "be_applyMetaViewportOverridesForFixedLayoutSize:", width, height);
    }
  }

}

+ (void)_modifyScrollViewBehaviors:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "scrollView"));
  objc_msgSend(v3, "be_configureForBooks");

}

+ (id)_booksViewWKWebViewConfiguration:(BOOL)a3 protocolCacheItem:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_standardWKPreferences:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_standardWKWebViewConfiguration:cacheItem:usesSingleWebProcess:forWebTOC:", v7, v6, 0, 0));

  objc_msgSend(v8, "setMediaTypesRequiringUserActionForPlayback:", 0);
  objc_msgSend(v8, "_setInvisibleAutoplayNotPermitted:", 0);
  objc_msgSend(v8, "_setInlineMediaPlaybackRequiresPlaysInlineAttribute:", 0);
  objc_msgSend(v8, "setAllowsInlineMediaPlayback:", 1);

  return v8;
}

+ (id)_viewConfiguredForBooks:(CGRect)a3 fixedLayoutSize:(CGSize)a4 protocolCacheItem:(id)a5 paginationOptions:(id)a6 cleanupOptions:(id)a7 cfiOptions:(id)a8 stylesheetSet:(id)a9 styleManager:(id)a10 contentSupportMode:(unint64_t)a11 imageFilterMode:(unint64_t)a12 completion:(id)a13
{
  double height;
  double width;
  double v21;
  double v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;

  height = a4.height;
  width = a4.width;
  v21 = a3.size.height;
  v22 = a3.size.width;
  v23 = a13;
  v24 = a10;
  v25 = a6;
  v26 = a5;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[BEWebViewFactory viewCreatedForBooksAtSize:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:imageFilterMode:](BEWebViewFactory, "viewCreatedForBooksAtSize:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:imageFilterMode:", v26, v25, a7, a8, a9, a12, v22, v21));
  +[BEWebViewFactory configureExistingWebView:fixedLayoutSize:protocolCacheItem:paginationOptions:styleManager:completion:](BEWebViewFactory, "configureExistingWebView:fixedLayoutSize:protocolCacheItem:paginationOptions:styleManager:completion:", v27, v26, v25, v24, v23, width, height);

  return v27;
}

+ (id)viewCreatedForBooksAtSize:(CGSize)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 imageFilterMode:(unint64_t)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return objc_msgSend(a1, "viewCreatedForBooksAtSize:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:imageFilterMode:lineGuideEnabled:", a4, a5, a6, a7, a8, a9, a3.width, a3.height, v10);
}

+ (id)viewCreatedForBooksAtSize:(CGSize)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 imageFilterMode:(unint64_t)a9 lineGuideEnabled:(BOOL)a10
{
  double height;
  double width;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _BOOL8 v23;
  BECFIUtilitiesJS *v24;
  BECFIUtilitiesJS *v25;
  BEContentSupportJS *v26;
  void *v27;
  BEContentSupportJS *v28;
  BEContentCleanupJS *v29;
  double v30;
  double v31;
  double v32;
  BEContentCleanupJS *v33;
  BEReadAloudJS *v34;
  BETriggerJS *v35;
  void *v36;
  void *v37;
  BENavigationHandler *v38;
  void *v39;
  BEUIHandler *v40;
  objc_class *v41;
  id v42;
  void *v43;
  void *v44;
  BETextFieldDisablingJS *v46;
  BEExternalIframeJS *v47;
  BEImageFilteringJS *v48;
  BEReadingSystemJS *v49;
  BEContentLayoutInfo *v50;
  BEBooksObjectJS *v51;
  void *v52;
  id v53;
  id v54;
  unint64_t v55;
  uint64_t v56;
  _QWORD v57[11];

  height = a3.height;
  width = a3.width;
  v18 = a5;
  v53 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a4;
  v56 = sub_139A0(v18);
  v54 = a1;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_booksViewWKWebViewConfiguration:protocolCacheItem:", objc_msgSend(v18, "developerExtrasEnabled"), v21));

  if (!objc_msgSend(v18, "mode"))
    objc_msgSend(v22, "_setDrawsBackground:", 0);
  v47 = objc_alloc_init(BEExternalIframeJS);
  v23 = objc_msgSend(v18, "mode") == &dword_4;
  v51 = objc_alloc_init(BEBooksObjectJS);
  v57[0] = v51;
  v50 = -[BEContentLayoutInfo initWithOptions:]([BEContentLayoutInfo alloc], "initWithOptions:", v18);
  v57[1] = v50;
  v49 = -[BEReadingSystemJS initWithPaginationMode:]([BEReadingSystemJS alloc], "initWithPaginationMode:", objc_msgSend(v18, "mode"));
  v57[2] = v49;
  v48 = objc_alloc_init(BEImageFilteringJS);
  v57[3] = v48;
  v46 = objc_alloc_init(BETextFieldDisablingJS);
  v57[4] = v46;
  v24 = [BECFIUtilitiesJS alloc];
  objc_msgSend(v18, "gapBetweenPages");
  v25 = -[BECFIUtilitiesJS initWithOptions:gapBetweenPages:paginatedTopToBottom:](v24, "initWithOptions:gapBetweenPages:paginatedTopToBottom:", v19, v23);
  v57[5] = v25;
  v52 = v22;
  v26 = [BEContentSupportJS alloc];
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "documentAttributes"));
  v55 = a9;
  v28 = -[BEContentSupportJS initWithMode:forDisplay:attributes:imageFilterMode:lineGuideEnabled:](v26, "initWithMode:forDisplay:attributes:imageFilterMode:lineGuideEnabled:", v56, 1, v27, a9, a10);
  v57[6] = v28;
  v29 = [BEContentCleanupJS alloc];
  objc_msgSend(v18, "pageLength");
  v31 = v30;
  objc_msgSend(v18, "gapBetweenPages");
  v33 = -[BEContentCleanupJS initWithOptions:pageLength:gapBetweenPages:](v29, "initWithOptions:pageLength:gapBetweenPages:", v20, v31, v32);

  v57[7] = v33;
  v57[8] = v47;
  v34 = objc_alloc_init(BEReadAloudJS);
  v57[9] = v34;
  v35 = objc_alloc_init(BETriggerJS);
  v57[10] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v57, 11));

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "userContentController"));
  objc_msgSend(v54, "_addJavascript:userContentController:", v36, v37);
  objc_msgSend(v53, "applyToUserContentController:", v37);

  v38 = -[BENavigationHandler initWithMode:]([BENavigationHandler alloc], "initWithMode:", 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "assetId"));

  -[BENavigationHandler setBookID:](v38, "setBookID:", v39);
  -[BENavigationHandler setExternalIframeJS:](v38, "setExternalIframeJS:", v47);
  v40 = objc_alloc_init(BEUIHandler);
  v41 = (objc_class *)objc_opt_class(BEWKWebView);
  if (v56 == 4)
    v41 = (objc_class *)objc_opt_class(_BEFixedLayoutWKWebView);
  v42 = objc_msgSend([v41 alloc], "initWithFrame:configuration:", v52, 0.0, 0.0, width, height);
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "UUIDString"));
  objc_msgSend(v42, "setBe_identifier:", v44);

  objc_msgSend(v42, "setAutoresizingMask:", 18);
  objc_msgSend(v42, "setBe_navigationHandler:", v38);
  objc_msgSend(v42, "setBe_userContentController:", v37);
  objc_msgSend(v42, "setNavigationDelegate:", v38);
  objc_msgSend(v42, "setBe_imageFilterMode:", v55);
  objc_msgSend(v42, "setBe_uiHandler:", v40);
  objc_msgSend(v42, "setUIDelegate:", v40);
  objc_msgSend(v42, "_setObservedRenderingProgressEvents:", 256);

  return v42;
}

+ (void)configureExistingWebView:(id)a3 fixedLayoutSize:(CGSize)a4 protocolCacheItem:(id)a5 paginationOptions:(id)a6 styleManager:(id)a7 completion:(id)a8
{
  CGFloat height;
  CGFloat width;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  CGFloat v30;
  CGFloat v31;
  uint64_t v32;

  height = a4.height;
  width = a4.width;
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a7;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_13B24;
  v24[3] = &unk_377D60;
  v25 = v15;
  v26 = v17;
  v28 = v18;
  v29 = a1;
  v30 = width;
  v31 = height;
  v32 = sub_139A0(v17);
  v27 = v16;
  v20 = v18;
  v21 = v16;
  v22 = v17;
  v23 = v15;
  objc_msgSend(v23, "be_configureFontWithStyleManager:completion:", v19, v24);

}

+ (void)_viewConfiguredForPagination:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 styleManager:(id)a9 forDisplay:(BOOL)a10 completion:(id)a11
{
  double height;
  double width;
  double y;
  double x;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  BEExternalIframeJS *v28;
  void *v29;
  id v30;
  BENavigationHandler *v31;
  void *v32;
  BEWKWebView *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  BENavigationHandler *v38;
  id v39;
  id v40;
  BEWKWebView *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  _QWORD v47[4];
  BEWKWebView *v48;
  id v49;
  id v50;
  BENavigationHandler *v51;
  id v52;
  id v53;
  id v54;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21 = a4;
  v22 = a5;
  v23 = a7;
  v43 = a11;
  v45 = a9;
  v24 = a8;
  v25 = a6;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_standardWKPreferences:", objc_msgSend(v22, "developerExtrasEnabled")));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_standardWKWebViewConfiguration:cacheItem:usesSingleWebProcess:forWebTOC:"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "userContentController"));
  objc_msgSend(v24, "applyToUserContentController:", v27);
  v28 = objc_alloc_init(BEExternalIframeJS);
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "javascriptProvidersWithPaginationOptions:cfiOptions:cleanupOptions:stylesheetSet:externalIframeJS:forDisplay:", v22, v23, v25, v24, v28, a10));

  v30 = objc_msgSend(v29, "mutableCopy");
  v44 = v30;
  objc_msgSend(a1, "_addJavascript:userContentController:", v30, v27);
  v31 = -[BENavigationHandler initWithMode:]([BENavigationHandler alloc], "initWithMode:", 0);
  if (v23)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "assetId"));
    -[BENavigationHandler setBookID:](v31, "setBookID:", v32);

  }
  -[BENavigationHandler setExternalIframeJS:](v31, "setExternalIframeJS:", v28);
  v33 = -[BEWKWebView initWithFrame:configuration:]([BEWKWebView alloc], "initWithFrame:configuration:", v26, x, y, width, height);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v42 = v23;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "UUIDString"));
  -[BEWKWebView setBe_identifier:](v33, "setBe_identifier:", v35);

  -[BEWKWebView setAutoresizingMask:](v33, "setAutoresizingMask:", 18);
  -[BEWKWebView setBe_navigationHandler:](v33, "setBe_navigationHandler:", v31);
  -[BEWKWebView setNavigationDelegate:](v33, "setNavigationDelegate:", v31);
  -[BEWKWebView setAccessibilityElementsHidden:](v33, "setAccessibilityElementsHidden:", 1);
  -[BEWKWebView setUserInteractionEnabled:](v33, "setUserInteractionEnabled:", 0);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_13FB0;
  v47[3] = &unk_377D88;
  v48 = v33;
  v49 = v22;
  v50 = v21;
  v51 = v31;
  v52 = v27;
  v53 = v43;
  v54 = a1;
  v36 = v43;
  v37 = v27;
  v38 = v31;
  v39 = v21;
  v40 = v22;
  v41 = v33;
  -[BEWKWebView be_configureFontWithStyleManager:completion:](v41, "be_configureFontWithStyleManager:completion:", v45, v47);

}

+ (id)viewConfiguredAsyncForBooks:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 imageFilterMode:(unint64_t)a8 stylesheetSet:(id)a9 styleManager:(id)a10 completion:(id)a11
{
  double height;
  double width;
  double y;
  double x;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22 = a11;
  v23 = a10;
  v24 = a9;
  v25 = a7;
  v26 = a6;
  v27 = a5;
  v28 = a4;
  v29 = objc_msgSend(a1, "_viewConfiguredForBooks:fixedLayoutSize:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:styleManager:contentSupportMode:imageFilterMode:completion:", v28, v27, v26, v25, v24, v23, x, y, width, height, CGSizeZero.width, CGSizeZero.height, sub_139A0(v27), a8, v22);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

  return v30;
}

+ (void)viewConfiguredAsyncForPagination:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 styleManager:(id)a9 completion:(id)a10
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  objc_msgSend(a1, "_viewConfiguredForPagination:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:styleManager:forDisplay:completion:", a4, a5, a6, a7, a8, a9, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, v10, a10);
}

+ (void)viewConfiguredForSearch:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 styleManager:(id)a9 contentSupportMode:(unint64_t)a10 completion:(id)a11
{
  double height;
  double width;
  double y;
  double x;
  id v21;
  id v22;
  _BOOL8 v23;
  BEBooksObjectJS *v24;
  BEImageFilteringJS *v25;
  BEContentLayoutInfo *v26;
  BECFIUtilitiesJS *v27;
  BECFIUtilitiesJS *v28;
  BEContentSupportJS *v29;
  void *v30;
  BEContentSupportJS *v31;
  BEContentCleanupJS *v32;
  double v33;
  double v34;
  double v35;
  BEContentCleanupJS *v36;
  uint64_t v37;
  void *v38;
  BENavigationHandler *v39;
  void *v40;
  BEWKWebView *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  BENavigationHandler *v46;
  id v47;
  id v48;
  BEWKWebView *v49;
  id v50;
  BEExternalIframeJS *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  _QWORD v60[4];
  BEWKWebView *v61;
  id v62;
  id v63;
  BENavigationHandler *v64;
  id v65;
  id v66;
  id v67;
  _QWORD v68[7];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v56 = a4;
  v21 = a5;
  v57 = a11;
  v58 = a9;
  v50 = a8;
  v52 = a7;
  v22 = a6;
  v54 = a1;
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_standardWKPreferences:", 0));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_standardWKWebViewConfiguration:cacheItem:usesSingleWebProcess:forWebTOC:", v59, v56, 1, 0));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "userContentController"));
  v51 = objc_alloc_init(BEExternalIframeJS);
  v23 = objc_msgSend(v21, "mode") == &dword_4;
  v24 = objc_alloc_init(BEBooksObjectJS);
  v68[0] = v24;
  v25 = objc_alloc_init(BEImageFilteringJS);
  v68[1] = v25;
  v26 = -[BEContentLayoutInfo initWithOptions:]([BEContentLayoutInfo alloc], "initWithOptions:", v21);
  v68[2] = v26;
  v27 = [BECFIUtilitiesJS alloc];
  objc_msgSend(v21, "gapBetweenPages");
  v28 = -[BECFIUtilitiesJS initWithOptions:gapBetweenPages:paginatedTopToBottom:](v27, "initWithOptions:gapBetweenPages:paginatedTopToBottom:", v52, v23);
  v68[3] = v28;
  v29 = [BEContentSupportJS alloc];
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "documentAttributes"));
  v31 = -[BEContentSupportJS initWithMode:forDisplay:attributes:imageFilterMode:lineGuideEnabled:](v29, "initWithMode:forDisplay:attributes:imageFilterMode:lineGuideEnabled:", a10, 0, v30, 0, 0);
  v68[4] = v31;
  v32 = [BEContentCleanupJS alloc];
  objc_msgSend(v21, "pageLength");
  v34 = v33;
  objc_msgSend(v21, "gapBetweenPages");
  v36 = -[BEContentCleanupJS initWithOptions:pageLength:gapBetweenPages:](v32, "initWithOptions:pageLength:gapBetweenPages:", v22, v34, v35);

  v68[5] = v36;
  v68[6] = v51;
  v37 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v68, 7));

  v38 = (void *)v37;
  objc_msgSend(v54, "_addJavascript:userContentController:", v37, v53);
  objc_msgSend(v50, "applyToUserContentController:", v53);

  v39 = -[BENavigationHandler initWithMode:]([BENavigationHandler alloc], "initWithMode:", 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "assetId"));

  -[BENavigationHandler setBookID:](v39, "setBookID:", v40);
  -[BENavigationHandler setExternalIframeJS:](v39, "setExternalIframeJS:", v51);
  v41 = -[BEWKWebView initWithFrame:configuration:]([BEWKWebView alloc], "initWithFrame:configuration:", v55, x, y, width, height);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "UUIDString"));
  -[BEWKWebView setBe_identifier:](v41, "setBe_identifier:", v43);

  -[BEWKWebView setAutoresizingMask:](v41, "setAutoresizingMask:", 18);
  -[BEWKWebView setBe_navigationHandler:](v41, "setBe_navigationHandler:", v39);
  -[BEWKWebView setNavigationDelegate:](v41, "setNavigationDelegate:", v39);
  -[BEWKWebView setUserInteractionEnabled:](v41, "setUserInteractionEnabled:", 0);
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_1462C;
  v60[3] = &unk_377D88;
  v61 = v41;
  v62 = v21;
  v67 = v54;
  v63 = v56;
  v64 = v39;
  v65 = v53;
  v66 = v57;
  v44 = v57;
  v45 = v53;
  v46 = v39;
  v47 = v56;
  v48 = v21;
  v49 = v41;
  -[BEWKWebView be_configureFontWithStyleManager:completion:](v49, "be_configureFontWithStyleManager:completion:", v58, v60);

}

+ (id)_viewConfiguredForBooks:(CGRect)a3 fixedLayoutSize:(CGSize)a4 protocolCacheItem:(id)a5 paginationOptions:(id)a6 cleanupOptions:(id)a7 cfiOptions:(id)a8 stylesheetSet:(id)a9 styleManager:(id)a10 contentSupportMode:(unint64_t)a11
{
  double height;
  double width;
  double v18;
  double v19;
  double y;
  double x;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  _BOOL8 v29;
  BECFIUtilitiesJS *v30;
  BECFIUtilitiesJS *v31;
  BEContentSupportJS *v32;
  void *v33;
  void *v34;
  BEContentSupportJS *v35;
  BEContentCleanupJS *v36;
  double v37;
  double v38;
  double v39;
  BEContentCleanupJS *v40;
  BEReadAloudJS *v41;
  BETriggerJS *v42;
  uint64_t v43;
  void *v44;
  BENavigationHandler *v45;
  void *v46;
  BEUIHandler *v47;
  objc_class *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  BETextFieldDisablingJS *v58;
  BEImageFilteringJS *v59;
  void *v60;
  BEReadingSystemJS *v61;
  BEContentLayoutInfo *v62;
  BEBooksObjectJS *v63;
  void *v64;
  id v65;
  void *v66;
  BEExternalIframeJS *v67;
  void *v68;
  _QWORD v69[11];

  height = a4.height;
  width = a4.width;
  v18 = a3.size.height;
  v19 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v23 = a5;
  v24 = a6;
  v65 = a10;
  v25 = a9;
  v26 = a8;
  v27 = a7;
  v66 = v23;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_booksViewWKWebViewConfiguration:protocolCacheItem:", objc_msgSend(v24, "developerExtrasEnabled"), v23));
  if (!objc_msgSend(v24, "mode"))
    objc_msgSend(v28, "_setDrawsBackground:", 0);
  v67 = objc_alloc_init(BEExternalIframeJS);
  v29 = objc_msgSend(v24, "mode") == &dword_4;
  v63 = objc_alloc_init(BEBooksObjectJS);
  v69[0] = v63;
  v62 = -[BEContentLayoutInfo initWithOptions:]([BEContentLayoutInfo alloc], "initWithOptions:", v24);
  v69[1] = v62;
  v61 = -[BEReadingSystemJS initWithPaginationMode:]([BEReadingSystemJS alloc], "initWithPaginationMode:", objc_msgSend(v24, "mode"));
  v69[2] = v61;
  v59 = objc_alloc_init(BEImageFilteringJS);
  v69[3] = v59;
  v58 = objc_alloc_init(BETextFieldDisablingJS);
  v69[4] = v58;
  v68 = v28;
  v30 = [BECFIUtilitiesJS alloc];
  objc_msgSend(v24, "gapBetweenPages");
  v31 = -[BECFIUtilitiesJS initWithOptions:gapBetweenPages:paginatedTopToBottom:](v30, "initWithOptions:gapBetweenPages:paginatedTopToBottom:", v26, v29);
  v69[5] = v31;
  v32 = [BEContentSupportJS alloc];
  v33 = v25;
  v60 = v26;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "documentAttributes"));
  v35 = -[BEContentSupportJS initWithMode:forDisplay:attributes:imageFilterMode:lineGuideEnabled:](v32, "initWithMode:forDisplay:attributes:imageFilterMode:lineGuideEnabled:", a11, 1, v34, 0, 0);
  v69[6] = v35;
  v36 = [BEContentCleanupJS alloc];
  objc_msgSend(v24, "pageLength");
  v38 = v37;
  objc_msgSend(v24, "gapBetweenPages");
  v40 = -[BEContentCleanupJS initWithOptions:pageLength:gapBetweenPages:](v36, "initWithOptions:pageLength:gapBetweenPages:", v27, v38, v39);

  v69[7] = v40;
  v69[8] = v67;
  v41 = objc_alloc_init(BEReadAloudJS);
  v69[9] = v41;
  v42 = objc_alloc_init(BETriggerJS);
  v69[10] = v42;
  v43 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v69, 11));

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "userContentController"));
  v64 = (void *)v43;
  objc_msgSend(a1, "_addJavascript:userContentController:", v43, v44);
  objc_msgSend(v33, "applyToUserContentController:", v44);

  v45 = -[BENavigationHandler initWithMode:]([BENavigationHandler alloc], "initWithMode:", 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "assetId"));

  -[BENavigationHandler setBookID:](v45, "setBookID:", v46);
  -[BENavigationHandler setExternalIframeJS:](v45, "setExternalIframeJS:", v67);
  v47 = objc_alloc_init(BEUIHandler);
  v48 = (objc_class *)objc_opt_class(BEWKWebView);
  if (a11 == 4)
    v48 = (objc_class *)objc_opt_class(_BEFixedLayoutWKWebView);
  v49 = objc_msgSend([v48 alloc], "initWithFrame:configuration:", v68, x, y, v19, v18);
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "UUIDString"));
  objc_msgSend(v49, "setBe_identifier:", v51);

  objc_msgSend(v49, "setAutoresizingMask:", 18);
  objc_msgSend(v49, "setBe_navigationHandler:", v45);
  objc_msgSend(v49, "setNavigationDelegate:", v45);
  objc_msgSend(v49, "setBe_uiHandler:", v47);
  objc_msgSend(v49, "setUIDelegate:", v47);
  objc_msgSend(v49, "_setObservedRenderingProgressEvents:", 256);
  if (v65)
    objc_msgSend(v49, "be_configureFontWithStyleManager:completion:", v65, &stru_377DC8);
  objc_msgSend(v49, "setBe_isHorizontalScroll:", objc_msgSend(v24, "isHorizontalScroll"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "sinfInfo"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "allKeys"));
  v54 = objc_msgSend(v53, "count");

  if (v54)
    objc_msgSend(v49, "be_containsProtectedContent");
  objc_msgSend(v49, "be_enableAX");
  objc_msgSend(v24, "applyToWebView:", v49);
  objc_msgSend(a1, "_setupContentBlockingRulesforWebView:rule:", v49, objc_msgSend(v66, "contentBlockingRule"));
  objc_msgSend(a1, "_applyMetaViewportOverridesToWebView:fixedLayoutSize:", v49, width, height);
  if (a11 == 4)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "configuration"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "defaultWebpagePreferences"));
    objc_msgSend(v56, "_setMouseEventPolicy:", 1);

  }
  objc_msgSend(a1, "_modifyScrollViewBehaviors:", v49);
  objc_msgSend(a1, "_configureNavigationForCoalescingLoadEvents:userContentController:", v45, v44);

  return v49;
}

+ (id)viewConfiguredForBooks:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 styleManager:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = objc_msgSend(a1, "_viewConfiguredForBooks:fixedLayoutSize:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:styleManager:contentSupportMode:", v24, v23, v22, v21, v20, v19, x, y, width, height, CGSizeZero.width, CGSizeZero.height, sub_139A0(v23));
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

  return v26;
}

+ (id)viewConfiguredForPictureBooks:(CGRect)a3 fixedLayoutSize:(CGSize)a4 protocolCacheItem:(id)a5 paginationOptions:(id)a6 cleanupOptions:(id)a7 cfiOptions:(id)a8 stylesheetSet:(id)a9
{
  double height;
  double width;
  double v15;
  double v16;
  double y;
  double x;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;

  height = a4.height;
  width = a4.width;
  v15 = a3.size.height;
  v16 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = objc_msgSend(a1, "_viewConfiguredForBooks:fixedLayoutSize:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:styleManager:contentSupportMode:", v24, v23, v22, v21, v20, 0, x, y, v16, v15, width, height, sub_139A0(v23));
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

  return v26;
}

+ (id)viewConfiguredForCoverContent:(CGRect)a3 bookID:(id)a4 protocolCacheItem:(id)a5 paginationOptions:(id)a6 cfiOptions:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  _BOOL8 v17;
  BEBooksObjectJS *v18;
  BEContentLayoutInfo *v19;
  BEReadingSystemJS *v20;
  BEImageFilteringJS *v21;
  BETextFieldDisablingJS *v22;
  BECFIUtilitiesJS *v23;
  BECFIUtilitiesJS *v24;
  BEContentSupportJS *v25;
  uint64_t v26;
  BEContentSupportJS *v27;
  void *v28;
  void *v29;
  BENavigationHandler *v30;
  BEWKWebView *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v37;
  id v38;
  id v39;
  void *v40;
  _QWORD v41[7];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a7;
  v16 = a6;
  v39 = a5;
  v38 = a4;
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_standardWKPreferences:", objc_msgSend(v16, "developerExtrasEnabled")));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_standardWKWebViewConfiguration:cacheItem:usesSingleWebProcess:forWebTOC:", v40, v39, 1, 0));
  v17 = objc_msgSend(v16, "mode") == &dword_4;
  v18 = objc_alloc_init(BEBooksObjectJS);
  v41[0] = v18;
  v19 = -[BEContentLayoutInfo initWithOptions:]([BEContentLayoutInfo alloc], "initWithOptions:", v16);
  v41[1] = v19;
  v20 = -[BEReadingSystemJS initWithPaginationMode:]([BEReadingSystemJS alloc], "initWithPaginationMode:", objc_msgSend(v16, "mode"));
  v41[2] = v20;
  v21 = objc_alloc_init(BEImageFilteringJS);
  v41[3] = v21;
  v22 = objc_alloc_init(BETextFieldDisablingJS);
  v41[4] = v22;
  v23 = [BECFIUtilitiesJS alloc];
  objc_msgSend(v16, "gapBetweenPages");
  v24 = -[BECFIUtilitiesJS initWithOptions:gapBetweenPages:paginatedTopToBottom:](v23, "initWithOptions:gapBetweenPages:paginatedTopToBottom:", v15, v17);

  v41[5] = v24;
  v25 = [BEContentSupportJS alloc];
  v26 = sub_139A0(v16);

  v27 = -[BEContentSupportJS initWithMode:forDisplay:imageFilterMode:lineGuideEnabled:](v25, "initWithMode:forDisplay:imageFilterMode:lineGuideEnabled:", v26, 1, 0, 0);
  v41[6] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 7));

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "userContentController"));
  objc_msgSend(a1, "_addJavascript:userContentController:", v28, v29);

  v30 = -[BENavigationHandler initWithMode:]([BENavigationHandler alloc], "initWithMode:", 3);
  -[BENavigationHandler setBookID:](v30, "setBookID:", v38);

  v31 = -[BEWKWebView initWithFrame:configuration:]([BEWKWebView alloc], "initWithFrame:configuration:", v37, x, y, width, height);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "UUIDString"));
  -[BEWKWebView setBe_identifier:](v31, "setBe_identifier:", v33);

  -[BEWKWebView setAutoresizingMask:](v31, "setAutoresizingMask:", 18);
  -[BEWKWebView setBe_navigationHandler:](v31, "setBe_navigationHandler:", v30);
  -[BEWKWebView setNavigationDelegate:](v31, "setNavigationDelegate:", v30);
  -[BEWKWebView setUserInteractionEnabled:](v31, "setUserInteractionEnabled:", 0);
  -[BEWKWebView be_enableAX](v31, "be_enableAX");
  v34 = objc_msgSend(v39, "contentBlockingRule");

  objc_msgSend(a1, "_setupContentBlockingRulesforWebView:rule:", v31, v34);
  objc_msgSend(a1, "_applyMetaViewportOverridesToWebView:fixedLayoutSize:", v31, CGSizeZero.width, CGSizeZero.height);
  objc_msgSend(a1, "_modifyScrollViewBehaviors:", v31);
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "userContentController"));
  objc_msgSend(a1, "_configureNavigationForCoalescingLoadEvents:userContentController:", v30, v35);

  return v31;
}

+ (id)viewConfiguredForPreview:(CGRect)a3 enableDeveloperExtras:(BOOL)a4 bookID:(id)a5 imageFilterMode:(unint64_t)a6 protocolCacheItem:(id)a7 cleanupOptions:(id)a8 stylesheetSet:(id)a9
{
  _BOOL8 v13;
  double height;
  double width;
  double y;
  double x;
  id v19;
  BEBooksObjectJS *v20;
  BEContentLayoutInfo *v21;
  BEWebViewFactoryPaginationOptions *v22;
  BEContentLayoutInfo *v23;
  BEReadingSystemJS *v24;
  BEImageFilteringJS *v25;
  BETextFieldDisablingJS *v26;
  BEContentSupportJS *v27;
  BEContentCleanupJS *v28;
  BETriggerJS *v29;
  void *v30;
  void *v31;
  BENavigationHandler *v32;
  BEUIHandler *v33;
  BEWKWebView *v34;
  void *v35;
  void *v36;
  id v37;
  BEExternalIframeJS *v39;
  void *v40;
  id v42;
  id v43;
  id v44;
  void *v45;
  _QWORD v46[9];

  v13 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v42 = a9;
  v19 = a8;
  v44 = a7;
  v43 = a5;
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_standardWKPreferences:", v13));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_standardWKWebViewConfiguration:cacheItem:usesSingleWebProcess:forWebTOC:", v45, v44, 0, 0));
  objc_msgSend(v40, "setSuppressesIncrementalRendering:", 0);
  objc_msgSend(v40, "setIgnoresViewportScaleLimits:", 1);
  v39 = objc_alloc_init(BEExternalIframeJS);
  v20 = objc_alloc_init(BEBooksObjectJS);
  v46[0] = v20;
  v21 = [BEContentLayoutInfo alloc];
  v22 = objc_opt_new(BEWebViewFactoryPaginationOptions);
  v23 = -[BEContentLayoutInfo initWithOptions:](v21, "initWithOptions:", v22);
  v46[1] = v23;
  v24 = -[BEReadingSystemJS initWithPaginationMode:]([BEReadingSystemJS alloc], "initWithPaginationMode:", 0);
  v46[2] = v24;
  v25 = objc_alloc_init(BEImageFilteringJS);
  v46[3] = v25;
  v26 = objc_alloc_init(BETextFieldDisablingJS);
  v46[4] = v26;
  v27 = -[BEContentSupportJS initWithMode:forDisplay:attributes:imageFilterMode:lineGuideEnabled:]([BEContentSupportJS alloc], "initWithMode:forDisplay:attributes:imageFilterMode:lineGuideEnabled:", 5, 1, &__NSDictionary0__struct, a6, 0);
  v46[5] = v27;
  v28 = -[BEContentCleanupJS initWithOptions:pageLength:gapBetweenPages:]([BEContentCleanupJS alloc], "initWithOptions:pageLength:gapBetweenPages:", v19, 0.0, 0.0);

  v46[6] = v28;
  v46[7] = v39;
  v29 = objc_alloc_init(BETriggerJS);
  v46[8] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 9));

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "userContentController"));
  objc_msgSend(a1, "_addJavascript:userContentController:", v30, v31);
  objc_msgSend(v42, "applyToUserContentController:", v31);

  v32 = -[BENavigationHandler initWithMode:]([BENavigationHandler alloc], "initWithMode:", 3);
  -[BENavigationHandler setBookID:](v32, "setBookID:", v43);

  -[BENavigationHandler setExternalIframeJS:](v32, "setExternalIframeJS:", v39);
  v33 = objc_alloc_init(BEUIHandler);
  v34 = -[BEWKWebView initWithFrame:configuration:]([BEWKWebView alloc], "initWithFrame:configuration:", v40, x, y, width, height);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "UUIDString"));
  -[BEWKWebView setBe_identifier:](v34, "setBe_identifier:", v36);

  -[BEWKWebView setAutoresizingMask:](v34, "setAutoresizingMask:", 18);
  -[BEWKWebView setBe_navigationHandler:](v34, "setBe_navigationHandler:", v32);
  -[BEWKWebView setNavigationDelegate:](v34, "setNavigationDelegate:", v32);
  -[BEWKWebView setBe_uiHandler:](v34, "setBe_uiHandler:", v33);
  -[BEWKWebView setUIDelegate:](v34, "setUIDelegate:", v33);
  -[BEWKWebView _setObservedRenderingProgressEvents:](v34, "_setObservedRenderingProgressEvents:", 64);
  -[BEWKWebView be_enableAX](v34, "be_enableAX");
  v37 = objc_msgSend(v44, "contentBlockingRule");

  objc_msgSend(a1, "_setupContentBlockingRulesforWebView:rule:", v34, v37);
  objc_msgSend(a1, "_configureNavigationForCoalescingLoadEvents:userContentController:", v32, v31);

  return v34;
}

+ (id)viewConfiguredForWebTOC:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  BEWKWebView *v10;
  void *v11;
  void *v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_standardWKPreferences:", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_standardWKWebViewConfiguration:cacheItem:usesSingleWebProcess:forWebTOC:", v8, 0, 1, 1));
  v10 = -[BEWKWebView initWithFrame:configuration:]([BEWKWebView alloc], "initWithFrame:configuration:", v9, x, y, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
  -[BEWKWebView setBe_identifier:](v10, "setBe_identifier:", v12);

  -[BEWKWebView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BEWKWebView setAutoresizingMask:](v10, "setAutoresizingMask:", 0);
  -[BEWKWebView be_enableAX](v10, "be_enableAX");
  objc_msgSend(a1, "_setupContentBlockingRulesforWebView:rule:", v10, 1);
  objc_msgSend(a1, "_applyMetaViewportOverridesToWebView:fixedLayoutSize:", v10, CGSizeZero.width, CGSizeZero.height);

  return v10;
}

+ (id)viewConfiguredForThemePreview
{
  void *v3;
  void *v4;
  BEThemePreviewWKWebView *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_standardWKPreferences:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_standardWKWebViewConfiguration:cacheItem:usesSingleWebProcess:forWebTOC:", v3, 0, 0, 0));
  objc_msgSend(v4, "_setDrawsBackground:", 0);
  v5 = -[BEThemePreviewWKWebView initWithFrame:configuration:]([BEThemePreviewWKWebView alloc], "initWithFrame:configuration:", v4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  return v5;
}

+ (void)updateThemePreviewWebView:(id)a3 styleManager:(id)a4 stylesheetSet:(id)a5 fontFamily:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = objc_opt_class(BEThemePreviewWKWebView);
  v13 = BUDynamicCast(v12, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "be_registerFontFamilyForStyleManager:fontFamily:", v9, v11);
    objc_msgSend(v10, "applyToWebView:", v16);
  }

}

+ (id)javascriptProvidersWithPaginationOptions:(id)a3 cfiOptions:(id)a4 cleanupOptions:(id)a5 stylesheetSet:(id)a6 forDisplay:(BOOL)a7
{
  return objc_msgSend(a1, "javascriptProvidersWithPaginationOptions:cfiOptions:cleanupOptions:stylesheetSet:externalIframeJS:forDisplay:", a3, a4, a5, a6, 0, a7);
}

+ (id)javascriptProvidersWithPaginationOptions:(id)a3 cfiOptions:(id)a4 cleanupOptions:(id)a5 stylesheetSet:(id)a6 externalIframeJS:(id)a7 forDisplay:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  BEExternalIframeJS *v17;
  _BOOL8 v18;
  BECFIUtilitiesJS *v19;
  BECFIUtilitiesJS *v20;
  BEContentSupportJS *v21;
  uint64_t v22;
  void *v23;
  BEContentSupportJS *v24;
  BEContentCleanupJS *v25;
  double v26;
  double v27;
  double v28;
  BEContentCleanupJS *v29;
  void *v30;
  BEReadingSystemJS *v32;
  BEImageFilteringJS *v33;
  BEExternalIframeJS *v34;
  BEContentLayoutInfo *v35;
  BEBooksObjectJS *v36;
  _QWORD v37[8];

  v8 = a8;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (BEExternalIframeJS *)a7;
  if (!v17)
    v17 = objc_alloc_init(BEExternalIframeJS);
  v34 = v17;
  v18 = objc_msgSend(v13, "mode") == &dword_4;
  v36 = objc_alloc_init(BEBooksObjectJS);
  v37[0] = v36;
  v35 = -[BEContentLayoutInfo initWithOptions:]([BEContentLayoutInfo alloc], "initWithOptions:", v13);
  v37[1] = v35;
  v33 = objc_alloc_init(BEImageFilteringJS);
  v37[2] = v33;
  v32 = -[BEReadingSystemJS initWithPaginationMode:]([BEReadingSystemJS alloc], "initWithPaginationMode:", objc_msgSend(v13, "mode"));
  v37[3] = v32;
  v19 = [BECFIUtilitiesJS alloc];
  objc_msgSend(v13, "gapBetweenPages");
  v20 = -[BECFIUtilitiesJS initWithOptions:gapBetweenPages:paginatedTopToBottom:](v19, "initWithOptions:gapBetweenPages:paginatedTopToBottom:", v14, v18);
  v37[4] = v20;
  v21 = [BEContentSupportJS alloc];
  v22 = sub_139A0(v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "documentAttributes"));
  v24 = -[BEContentSupportJS initWithMode:forDisplay:attributes:imageFilterMode:lineGuideEnabled:](v21, "initWithMode:forDisplay:attributes:imageFilterMode:lineGuideEnabled:", v22, v8, v23, 0, 0);
  v37[5] = v24;
  v25 = [BEContentCleanupJS alloc];
  objc_msgSend(v13, "pageLength");
  v27 = v26;
  objc_msgSend(v13, "gapBetweenPages");
  v29 = -[BEContentCleanupJS initWithOptions:pageLength:gapBetweenPages:](v25, "initWithOptions:pageLength:gapBetweenPages:", v15, v27, v28);
  v37[6] = v29;
  v37[7] = v34;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 8));

  return v30;
}

+ (id)viewConfiguredForPagination:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 styleManager:(id)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return objc_msgSend(a1, "_viewConfiguredForPagination:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:styleManager:forDisplay:", a4, a5, a6, a7, a8, a9, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, v10);
}

+ (id)_viewConfiguredForPagination:(CGRect)a3 protocolCacheItem:(id)a4 paginationOptions:(id)a5 cleanupOptions:(id)a6 cfiOptions:(id)a7 stylesheetSet:(id)a8 styleManager:(id)a9 forDisplay:(BOOL)a10
{
  double height;
  double width;
  double y;
  double x;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  BEExternalIframeJS *v27;
  void *v28;
  id v29;
  BENavigationHandler *v30;
  void *v31;
  BEWKWebView *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  id v38;
  void *v39;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20 = a4;
  v21 = a5;
  v22 = a7;
  v38 = a9;
  v23 = a8;
  v24 = a6;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_standardWKPreferences:", objc_msgSend(v21, "developerExtrasEnabled")));
  v39 = v20;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_standardWKWebViewConfiguration:cacheItem:usesSingleWebProcess:forWebTOC:"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "userContentController"));
  objc_msgSend(v23, "applyToUserContentController:", v26);
  v27 = objc_alloc_init(BEExternalIframeJS);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "javascriptProvidersWithPaginationOptions:cfiOptions:cleanupOptions:stylesheetSet:externalIframeJS:forDisplay:", v21, v22, v24, v23, v27, a10));

  v29 = objc_msgSend(v28, "mutableCopy");
  v36 = v29;
  objc_msgSend(a1, "_addJavascript:userContentController:", v29, v26);
  v30 = -[BENavigationHandler initWithMode:]([BENavigationHandler alloc], "initWithMode:", 0);
  if (v22)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "assetId"));
    -[BENavigationHandler setBookID:](v30, "setBookID:", v31);

  }
  -[BENavigationHandler setExternalIframeJS:](v30, "setExternalIframeJS:", v27);
  v32 = -[BEWKWebView initWithFrame:configuration:]([BEWKWebView alloc], "initWithFrame:configuration:", v25, x, y, width, height);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "UUIDString"));
  -[BEWKWebView setBe_identifier:](v32, "setBe_identifier:", v34);

  -[BEWKWebView setAutoresizingMask:](v32, "setAutoresizingMask:", 18);
  -[BEWKWebView setBe_navigationHandler:](v32, "setBe_navigationHandler:", v30);
  -[BEWKWebView setNavigationDelegate:](v32, "setNavigationDelegate:", v30);
  -[BEWKWebView setAccessibilityElementsHidden:](v32, "setAccessibilityElementsHidden:", 1);
  -[BEWKWebView setUserInteractionEnabled:](v32, "setUserInteractionEnabled:", 0);
  if (v38)
    -[BEWKWebView be_configureFontWithStyleManager:completion:](v32, "be_configureFontWithStyleManager:completion:", v38, &stru_377DE8);
  -[BEWKWebView setBe_isHorizontalScroll:](v32, "setBe_isHorizontalScroll:", objc_msgSend(v21, "isHorizontalScroll"));
  objc_msgSend(v21, "applyToWebView:", v32);
  objc_msgSend(a1, "_setupContentBlockingRulesforWebView:rule:", v32, objc_msgSend(v39, "contentBlockingRule"));
  objc_msgSend(a1, "_applyMetaViewportOverridesToWebView:fixedLayoutSize:", v32, CGSizeZero.width, CGSizeZero.height);
  objc_msgSend(a1, "_modifyScrollViewBehaviors:", v32);
  objc_msgSend(a1, "_configureNavigationForCoalescingLoadEvents:userContentController:", v30, v26);

  return v32;
}

+ (id)viewConfiguredForTocParse:(CGRect)a3 assetID:(id)a4 cleanupOptions:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  BEExternalIframeJS *v15;
  BECFIUtilitiesJS *v16;
  BECFIUtilitiesJSOptions *v17;
  BEBooksObjectJS *v18;
  BEContentLayoutInfo *v19;
  BEWebViewFactoryPaginationOptions *v20;
  BEContentLayoutInfo *v21;
  BEContentCleanupJS *v22;
  void *v23;
  BENavigationHandler *v24;
  BEWKWebView *v25;
  void *v26;
  void *v27;
  BECFIUtilitiesJS *v29;
  void *v30;
  _QWORD v31[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v12 = a4;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_standardWKPreferences:", 0));
  objc_msgSend(v30, "_setLoadsImagesAutomatically:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_standardWKWebViewConfiguration:cacheItem:usesSingleWebProcess:forWebTOC:", v30, 0, 1, 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userContentController"));
  v15 = objc_alloc_init(BEExternalIframeJS);
  v16 = [BECFIUtilitiesJS alloc];
  v17 = objc_opt_new(BECFIUtilitiesJSOptions);
  v29 = -[BECFIUtilitiesJS initWithOptions:gapBetweenPages:paginatedTopToBottom:](v16, "initWithOptions:gapBetweenPages:paginatedTopToBottom:", v17, 0, 0.0);

  v18 = objc_alloc_init(BEBooksObjectJS);
  v31[0] = v18;
  v19 = [BEContentLayoutInfo alloc];
  v20 = objc_opt_new(BEWebViewFactoryPaginationOptions);
  v21 = -[BEContentLayoutInfo initWithOptions:](v19, "initWithOptions:", v20);
  v31[1] = v21;
  v31[2] = v29;
  v22 = -[BEContentCleanupJS initWithOptions:pageLength:gapBetweenPages:]([BEContentCleanupJS alloc], "initWithOptions:pageLength:gapBetweenPages:", v11, 0.0, 0.0);

  v31[3] = v22;
  v31[4] = v15;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 5));

  objc_msgSend(a1, "_addJavascript:userContentController:", v23, v14);
  v24 = -[BENavigationHandler initWithMode:]([BENavigationHandler alloc], "initWithMode:", 0);
  -[BENavigationHandler setBookID:](v24, "setBookID:", v12);

  -[BENavigationHandler setExternalIframeJS:](v24, "setExternalIframeJS:", v15);
  v25 = -[BEWKWebView initWithFrame:configuration:]([BEWKWebView alloc], "initWithFrame:configuration:", v13, x, y, width, height);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "UUIDString"));
  -[BEWKWebView setBe_identifier:](v25, "setBe_identifier:", v27);

  -[BEWKWebView setAutoresizingMask:](v25, "setAutoresizingMask:", 18);
  -[BEWKWebView setBe_navigationHandler:](v25, "setBe_navigationHandler:", v24);
  -[BEWKWebView setNavigationDelegate:](v25, "setNavigationDelegate:", v24);
  -[BEWKWebView setAccessibilityElementsHidden:](v25, "setAccessibilityElementsHidden:", 1);
  -[BEWKWebView setUserInteractionEnabled:](v25, "setUserInteractionEnabled:", 0);
  objc_msgSend(a1, "_setupContentBlockingRulesforWebView:rule:", v25, 1);
  objc_msgSend(a1, "_configureNavigationForCoalescingLoadEvents:userContentController:", v24, v14);

  return v25;
}

+ (void)_configureNavigationForCoalescingLoadEvents:(id)a3 userContentController:(id)a4
{
  id v6;
  id v7;
  BEContentLoadJS *v8;
  void *v9;
  BEContentLoadJS *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setShouldWaitForJavascriptLoadComplete:", 1);
  v8 = objc_opt_new(BEContentLoadJS);
  v10 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  objc_msgSend(a1, "_addJavascript:userContentController:", v9, v6);

  objc_msgSend(v6, "removeScriptMessageHandlerForName:", CFSTR("BENavigationHandlerJSLoadComplete"));
  objc_msgSend(v6, "be_addScriptMessageHandler:name:", v7, CFSTR("BENavigationHandlerJSLoadComplete"));

}

@end
