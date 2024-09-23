uint64_t sub_1000020D0(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10000285C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 144));
  objc_destroyWeak((id *)(v3 - 136));
  _Unwind_Resume(a1);
}

void sub_1000028C4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 80);
  v17 = 0;
  LOBYTE(v12) = 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "attributedStringForConstellationContent:defaultAttributes:identifier:language:assetsBaseURL:assetFileInfoManager:supportsLinks:error:", v3, v4, v5, v6, v7, v8, v12, &v17));
  v10 = v17;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000029C0;
  block[3] = &unk_100008330;
  objc_copyWeak(&v15, (id *)(a1 + 88));
  objc_copyWeak(&v16, (id *)(a1 + 96));
  v14 = v9;
  v11 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);

}

void sub_1000029C0(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tip"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v5 = objc_msgSend(v2, "isEqualToString:", v4);

  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "bodyTextView"));
    objc_msgSend(v7, "setAttributedText:", v6);

    objc_msgSend(WeakRetained, "setContentTextOperation:", 0);
  }

}

void sub_100003880(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  v3 = objc_claimAutoreleasedReturnValue(+[TPSLogger default](TPSLogger, "default"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "xpc connection failed: %@", (uint8_t *)&v4, 0xCu);
  }

}

void sub_100003A44(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  v3 = objc_claimAutoreleasedReturnValue(+[TPSLogger default](TPSLogger, "default"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "xpc connection failed: %@", (uint8_t *)&v4, 0xCu);
  }

}

id objc_msgSend_TPSSafeDictionaryForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "TPSSafeDictionaryForKey:");
}

id objc_msgSend_TPSSafeStringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "TPSSafeStringForKey:");
}

id objc_msgSend__destroyXPCConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_destroyXPCConnection");
}

id objc_msgSend__setInteractiveTextSelectionDisabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setInteractiveTextSelectionDisabled:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addExecutionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addExecutionBlock:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_analyticsViewModeForTraitCollection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "analyticsViewModeForTraitCollection:");
}

id objc_msgSend_appController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appController");
}

id objc_msgSend_assetConfigurationForAssets_language_sizeClass_style_assetFileInfoManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetConfigurationForAssets:language:sizeClass:style:assetFileInfoManager:");
}

id objc_msgSend_assetFileInfoManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetFileInfoManager");
}

id objc_msgSend_assetPathFromAssetConfiguration_type_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetPathFromAssetConfiguration:type:");
}

id objc_msgSend_assetRatioType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetRatioType");
}

id objc_msgSend_assetSizes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetSizes");
}

id objc_msgSend_assets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assets");
}

id objc_msgSend_assetsConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetsConfiguration");
}

id objc_msgSend_attributedStringForConstellationContent_defaultAttributes_identifier_language_assetsBaseURL_assetFileInfoManager_supportsLinks_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributedStringForConstellationContent:defaultAttributes:identifier:language:assetsBaseURL:assetFileInfoManager:supportsLinks:error:");
}

id objc_msgSend_baseURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baseURL");
}

id objc_msgSend_bodyContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bodyContent");
}

id objc_msgSend_bodyText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bodyText");
}

id objc_msgSend_bodyTextView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bodyTextView");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_boundingRectWithSize_options_attributes_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_cacheIdentifierForType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cacheIdentifierForType:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelAllOperations");
}

id objc_msgSend_cancelConstellationContentParserOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelConstellationContentParserOperation");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_cancelScheduledIncreaseViewCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelScheduledIncreaseViewCount");
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "categoryIdentifier");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_clearNotificationIgnoreCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearNotificationIgnoreCount");
}

id objc_msgSend_clientConditionID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConditionID");
}

id objc_msgSend_collectionID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectionID");
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constant");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToAnchor_multiplier_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:multiplier:constant:");
}

id objc_msgSend_constraintEqualToSystemSpacingBelowAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToSystemSpacingBelowAnchor:multiplier:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "content");
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentType");
}

id objc_msgSend_contentViewedForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentViewedForIdentifier:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_correlationID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "correlationID");
}

id objc_msgSend_createViews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createViews");
}

id objc_msgSend_currentImagePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentImagePath");
}

id objc_msgSend_dataCacheForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataCacheForIdentifier:");
}

id objc_msgSend_default(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "default");
}

id objc_msgSend_defaultBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultBackgroundColor");
}

id objc_msgSend_defaultLabelColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultLabelColor");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultTextLabelFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultTextLabelFont");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_eventWithContentID_collectionID_correlationID_clientConditionID_viewMethod_viewMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventWithContentID:collectionID:correlationID:clientConditionID:viewMethod:viewMode:");
}

id objc_msgSend_eventWithContentID_collectionID_correlationID_launchType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventWithContentID:collectionID:correlationID:launchType:");
}

id objc_msgSend_fetchImageWithIdentifier_path_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchImageWithIdentifier:path:");
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstBaselineAnchor");
}

id objc_msgSend_fullContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fullContent");
}

id objc_msgSend_fullContentAssets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fullContentAssets");
}

id objc_msgSend_getImageForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getImageForIdentifier:");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_heightToWidthRatioForViewMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heightToWidthRatioForViewMode:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "image");
}

id objc_msgSend_initWithAppController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAppController:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDictionary_metadata_identifierKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:metadata:identifierKey:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_insertSubview_belowSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertSubview:belowSubview:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isPhoneUI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPhoneUI");
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "language");
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastBaselineAnchor");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lineHeight");
}

id objc_msgSend_link(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "link");
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "log");
}

id objc_msgSend_playVideo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playVideo");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeVideoPlayerLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeVideoPlayerLayer");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_scheduleIncreaseViewCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleIncreaseViewCount");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setAspectFillAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAspectFillAsset:");
}

id objc_msgSend_setAssetSizes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetSizes:");
}

id objc_msgSend_setAssetsConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetsConfiguration:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setCacheVideoIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCacheVideoIdentifier:");
}

id objc_msgSend_setCategory_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCategory:error:");
}

id objc_msgSend_setCollectionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCollectionID:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setContentTextOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentTextOperation:");
}

id objc_msgSend_setDataDetectorTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataDetectorTypes:");
}

id objc_msgSend_setDefaultBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultBackgroundColor:");
}

id objc_msgSend_setDefaultSessionDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultSessionDelegate:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEditable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEditable:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setHeightTracksTextView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeightTracksTextView:");
}

id objc_msgSend_setIgnoreLinks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIgnoreLinks:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setLanguage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLanguage:");
}

id objc_msgSend_setLanguageCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLanguageCode:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLineFragmentPadding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineFragmentPadding:");
}

id objc_msgSend_setLinkTextAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLinkTextAttributes:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setNoImageBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNoImageBackgroundColor:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTextContainerInset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextContainerInset:");
}

id objc_msgSend_setTip_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTip:");
}

id objc_msgSend_setTraitCollection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTraitCollection:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setVideoDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVideoDelegate:");
}

id objc_msgSend_setVideoPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVideoPath:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_singleTipViewController_handleURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "singleTipViewController:handleURL:");
}

id objc_msgSend_singleTipViewController_tipViewed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "singleTipViewController:tipViewed:");
}

id objc_msgSend_stopVideoPlayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopVideoPlayer");
}

id objc_msgSend_syncCacheImmediately(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncCacheImmediately");
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBlueColor");
}

id objc_msgSend_textContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textContainer");
}

id objc_msgSend_tip(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tip");
}

id objc_msgSend_tipNotificationInteractedByUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tipNotificationInteractedByUser");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_titleLabelFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleLabelFont");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_updateAssetsConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAssetsConfiguration");
}

id objc_msgSend_updateBodyText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateBodyText");
}

id objc_msgSend_updateImageWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateImageWithCompletionHandler:");
}

id objc_msgSend_updateVideoAndPlayImmediately_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateVideoAndPlayImmediately:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceStyle");
}

id objc_msgSend_videoPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "videoPath");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "widthAnchor");
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection");
}
