id _WTVCLog()
{
  if (_WTVCLog_onceToken[0] != -1)
    dispatch_once(_WTVCLog_onceToken, &__block_literal_global);
  return (id)_WTVCLog_log;
}

void sub_24A7D036C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24A7D1008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  uint64_t v10;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 136));
  _Unwind_Resume(a1);
}

id WTIAWritingToolsLog()
{
  if (WTIAWritingToolsLog_onceToken != -1)
    dispatch_once(&WTIAWritingToolsLog_onceToken, &__block_literal_global_1);
  return (id)WTIAWritingToolsLog___instance;
}

id WTIATextAssistantLog()
{
  if (WTIATextAssistantLog_onceToken != -1)
    dispatch_once(&WTIATextAssistantLog_onceToken, &__block_literal_global_3);
  return (id)WTIATextAssistantLog___instance;
}

id getIASignalAnalyticsClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getIASignalAnalyticsClass_softClass;
  v7 = getIASignalAnalyticsClass_softClass;
  if (!getIASignalAnalyticsClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getIASignalAnalyticsClass_block_invoke;
    v3[3] = &unk_251C07110;
    v3[4] = &v4;
    __getIASignalAnalyticsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_24A7D15C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getIAChannelWritingTools()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getIAChannelWritingToolsSymbolLoc_ptr;
  v7 = getIAChannelWritingToolsSymbolLoc_ptr;
  if (!getIAChannelWritingToolsSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = (id *)dlsym(v1, "IAChannelWritingTools");
    v5[3] = (uint64_t)v0;
    getIAChannelWritingToolsSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getIAPayloadValueWritingToolsFeatureRewrite()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getIAPayloadValueWritingToolsFeatureRewriteSymbolLoc_ptr;
  v7 = getIAPayloadValueWritingToolsFeatureRewriteSymbolLoc_ptr;
  if (!getIAPayloadValueWritingToolsFeatureRewriteSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = (id *)dlsym(v1, "IAPayloadValueWritingToolsFeatureRewrite");
    v5[3] = (uint64_t)v0;
    getIAPayloadValueWritingToolsFeatureRewriteSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getIAPayloadValueWritingToolsFeatureAdjust()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getIAPayloadValueWritingToolsFeatureAdjustSymbolLoc_ptr;
  v7 = getIAPayloadValueWritingToolsFeatureAdjustSymbolLoc_ptr;
  if (!getIAPayloadValueWritingToolsFeatureAdjustSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = (id *)dlsym(v1, "IAPayloadValueWritingToolsFeatureAdjust");
    v5[3] = (uint64_t)v0;
    getIAPayloadValueWritingToolsFeatureAdjustSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getIAPayloadValueWritingToolsFeatureTransform()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getIAPayloadValueWritingToolsFeatureTransformSymbolLoc_ptr;
  v7 = getIAPayloadValueWritingToolsFeatureTransformSymbolLoc_ptr;
  if (!getIAPayloadValueWritingToolsFeatureTransformSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = (id *)dlsym(v1, "IAPayloadValueWritingToolsFeatureTransform");
    v5[3] = (uint64_t)v0;
    getIAPayloadValueWritingToolsFeatureTransformSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getIAPayloadValueWritingToolsFeatureUnspecified()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getIAPayloadValueWritingToolsFeatureUnspecifiedSymbolLoc_ptr;
  v7 = getIAPayloadValueWritingToolsFeatureUnspecifiedSymbolLoc_ptr;
  if (!getIAPayloadValueWritingToolsFeatureUnspecifiedSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = (id *)dlsym(v1, "IAPayloadValueWritingToolsFeatureUnspecified");
    v5[3] = (uint64_t)v0;
    getIAPayloadValueWritingToolsFeatureUnspecifiedSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

void sub_24A7D2598(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

id getIASignalWritingToolsActionSelected()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getIASignalWritingToolsActionSelectedSymbolLoc_ptr;
  v7 = getIASignalWritingToolsActionSelectedSymbolLoc_ptr;
  if (!getIASignalWritingToolsActionSelectedSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = (id *)dlsym(v1, "IASignalWritingToolsActionSelected");
    v5[3] = (uint64_t)v0;
    getIASignalWritingToolsActionSelectedSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getIAPayloadKeyWritingToolsUI()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getIAPayloadKeyWritingToolsUISymbolLoc_ptr;
  v7 = getIAPayloadKeyWritingToolsUISymbolLoc_ptr;
  if (!getIAPayloadKeyWritingToolsUISymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = (id *)dlsym(v1, "IAPayloadKeyWritingToolsUI");
    v5[3] = (uint64_t)v0;
    getIAPayloadKeyWritingToolsUISymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getIAPayloadKeyWritingToolsFeature()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getIAPayloadKeyWritingToolsFeatureSymbolLoc_ptr;
  v7 = getIAPayloadKeyWritingToolsFeatureSymbolLoc_ptr;
  if (!getIAPayloadKeyWritingToolsFeatureSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = (id *)dlsym(v1, "IAPayloadKeyWritingToolsFeature");
    v5[3] = (uint64_t)v0;
    getIAPayloadKeyWritingToolsFeatureSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getIAPayloadKeyWritingToolsInputText()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getIAPayloadKeyWritingToolsInputTextSymbolLoc_ptr;
  v7 = getIAPayloadKeyWritingToolsInputTextSymbolLoc_ptr;
  if (!getIAPayloadKeyWritingToolsInputTextSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = (id *)dlsym(v1, "IAPayloadKeyWritingToolsInputText");
    v5[3] = (uint64_t)v0;
    getIAPayloadKeyWritingToolsInputTextSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

void sub_24A7D2CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getIAPayloadValueWritingToolsUIRewritingView()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getIAPayloadValueWritingToolsUIRewritingViewSymbolLoc_ptr;
  v7 = getIAPayloadValueWritingToolsUIRewritingViewSymbolLoc_ptr;
  if (!getIAPayloadValueWritingToolsUIRewritingViewSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = (id *)dlsym(v1, "IAPayloadValueWritingToolsUIRewritingView");
    v5[3] = (uint64_t)v0;
    getIAPayloadValueWritingToolsUIRewritingViewSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getIASignalWritingToolsButtonTapped()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getIASignalWritingToolsButtonTappedSymbolLoc_ptr;
  v7 = getIASignalWritingToolsButtonTappedSymbolLoc_ptr;
  if (!getIASignalWritingToolsButtonTappedSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = (id *)dlsym(v1, "IASignalWritingToolsButtonTapped");
    v5[3] = (uint64_t)v0;
    getIASignalWritingToolsButtonTappedSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getIAPayloadKeyWritingToolsInteractionType()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getIAPayloadKeyWritingToolsInteractionTypeSymbolLoc_ptr;
  v7 = getIAPayloadKeyWritingToolsInteractionTypeSymbolLoc_ptr;
  if (!getIAPayloadKeyWritingToolsInteractionTypeSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = (id *)dlsym(v1, "IAPayloadKeyWritingToolsInteractionType");
    v5[3] = (uint64_t)v0;
    getIAPayloadKeyWritingToolsInteractionTypeSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getIAPayloadValueWritingToolsInteractionTypeUnspecified()
{
  id *IAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc;
  uint64_t v2;

  IAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc = (id *)getIAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc();
  if (IAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc)
    return *IAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc;
  v2 = -[WTAnalyticsDelegate init].cold.1();
  return (id)getIASignalWritingToolsResultsAccepted(v2);
}

id getIASignalWritingToolsResultsAccepted()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getIASignalWritingToolsResultsAcceptedSymbolLoc_ptr;
  v7 = getIASignalWritingToolsResultsAcceptedSymbolLoc_ptr;
  if (!getIASignalWritingToolsResultsAcceptedSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = (id *)dlsym(v1, "IASignalWritingToolsResultsAccepted");
    v5[3] = (uint64_t)v0;
    getIASignalWritingToolsResultsAcceptedSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getIAPayloadKeyWritingToolsAcceptedAll()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getIAPayloadKeyWritingToolsAcceptedAllSymbolLoc_ptr;
  v7 = getIAPayloadKeyWritingToolsAcceptedAllSymbolLoc_ptr;
  if (!getIAPayloadKeyWritingToolsAcceptedAllSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = (id *)dlsym(v1, "IAPayloadKeyWritingToolsAcceptedAll");
    v5[3] = (uint64_t)v0;
    getIAPayloadKeyWritingToolsAcceptedAllSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getIAPayloadKeyWritingToolsResultIndices()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getIAPayloadKeyWritingToolsResultIndicesSymbolLoc_ptr;
  v7 = getIAPayloadKeyWritingToolsResultIndicesSymbolLoc_ptr;
  if (!getIAPayloadKeyWritingToolsResultIndicesSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = (id *)dlsym(v1, "IAPayloadKeyWritingToolsResultIndices");
    v5[3] = (uint64_t)v0;
    getIAPayloadKeyWritingToolsResultIndicesSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getIASignalWritingToolsResultsRejected()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getIASignalWritingToolsResultsRejectedSymbolLoc_ptr;
  v7 = getIASignalWritingToolsResultsRejectedSymbolLoc_ptr;
  if (!getIASignalWritingToolsResultsRejectedSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = (id *)dlsym(v1, "IASignalWritingToolsResultsRejected");
    v5[3] = (uint64_t)v0;
    getIASignalWritingToolsResultsRejectedSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getIAPayloadKeyWritingToolsRejectedAll()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getIAPayloadKeyWritingToolsRejectedAllSymbolLoc_ptr;
  v7 = getIAPayloadKeyWritingToolsRejectedAllSymbolLoc_ptr;
  if (!getIAPayloadKeyWritingToolsRejectedAllSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = (id *)dlsym(v1, "IAPayloadKeyWritingToolsRejectedAll");
    v5[3] = (uint64_t)v0;
    getIAPayloadKeyWritingToolsRejectedAllSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getIASignalWritingToolsResultsOffered()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getIASignalWritingToolsResultsOfferedSymbolLoc_ptr;
  v7 = getIASignalWritingToolsResultsOfferedSymbolLoc_ptr;
  if (!getIASignalWritingToolsResultsOfferedSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = (id *)dlsym(v1, "IASignalWritingToolsResultsOffered");
    v5[3] = (uint64_t)v0;
    getIASignalWritingToolsResultsOfferedSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getIAPayloadKeyWritingToolsNumResultsOffered()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getIAPayloadKeyWritingToolsNumResultsOfferedSymbolLoc_ptr;
  v7 = getIAPayloadKeyWritingToolsNumResultsOfferedSymbolLoc_ptr;
  if (!getIAPayloadKeyWritingToolsNumResultsOfferedSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = (id *)dlsym(v1, "IAPayloadKeyWritingToolsNumResultsOffered");
    v5[3] = (uint64_t)v0;
    getIAPayloadKeyWritingToolsNumResultsOfferedSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

void sub_24A7D3F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getIASignalAnalyticsClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!InputAnalyticsLibraryCore_frameworkLibrary)
    InputAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("IASignalAnalytics");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getIASignalAnalyticsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t InputAnalyticsLibrary()
{
  uint64_t v0;
  void *v2;

  if (!InputAnalyticsLibraryCore_frameworkLibrary)
    InputAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = InputAnalyticsLibraryCore_frameworkLibrary;
  if (!InputAnalyticsLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getIASignalWritingToolsUIResumedSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getIASignalWritingToolsUIResumedSymbolLoc_ptr;
  v6 = getIASignalWritingToolsUIResumedSymbolLoc_ptr;
  if (!getIASignalWritingToolsUIResumedSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = dlsym(v1, "IASignalWritingToolsUIResumed");
    v4[3] = (uint64_t)v0;
    getIASignalWritingToolsUIResumedSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_24A7D4300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getIAPayloadValueWritingToolsInteractionTypeShowRewrittenSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getIAPayloadValueWritingToolsInteractionTypeShowRewrittenSymbolLoc_ptr;
  v6 = getIAPayloadValueWritingToolsInteractionTypeShowRewrittenSymbolLoc_ptr;
  if (!getIAPayloadValueWritingToolsInteractionTypeShowRewrittenSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = dlsym(v1, "IAPayloadValueWritingToolsInteractionTypeShowRewritten");
    v4[3] = (uint64_t)v0;
    getIAPayloadValueWritingToolsInteractionTypeShowRewrittenSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_24A7D4390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getIAPayloadValueWritingToolsInteractionTypeRetrySymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getIAPayloadValueWritingToolsInteractionTypeRetrySymbolLoc_ptr;
  v6 = getIAPayloadValueWritingToolsInteractionTypeRetrySymbolLoc_ptr;
  if (!getIAPayloadValueWritingToolsInteractionTypeRetrySymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = dlsym(v1, "IAPayloadValueWritingToolsInteractionTypeRetry");
    v4[3] = (uint64_t)v0;
    getIAPayloadValueWritingToolsInteractionTypeRetrySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_24A7D4420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getIAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getIAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc_ptr;
  v6 = getIAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc_ptr;
  if (!getIAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = dlsym(v1, "IAPayloadValueWritingToolsInteractionTypeUnspecified");
    v4[3] = (uint64_t)v0;
    getIAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_24A7D44B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getIAPayloadKeyWritingToolsResultTextSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getIAPayloadKeyWritingToolsResultTextSymbolLoc_ptr;
  v6 = getIAPayloadKeyWritingToolsResultTextSymbolLoc_ptr;
  if (!getIAPayloadKeyWritingToolsResultTextSymbolLoc_ptr)
  {
    v1 = (void *)InputAnalyticsLibrary();
    v0 = dlsym(v1, "IAPayloadKeyWritingToolsResultText");
    v4[3] = (uint64_t)v0;
    getIAPayloadKeyWritingToolsResultTextSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_24A7D4540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_24A7D5088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24A7D53B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24A7D56D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_24A7D5C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24A7D82A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24A7D8C18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  uint64_t v10;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 136));
  _Unwind_Resume(a1);
}

void sub_24A7DA710(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_24A7DA9E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_24A7E09AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24A7E0F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  id *v26;
  id *v27;
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _performSyncOnMain(void *a1)
{
  id v1;
  id v2;
  _QWORD block[4];
  id v4;

  v1 = a1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___performSyncOnMain_block_invoke;
  block[3] = &unk_251C07478;
  v4 = v1;
  v2 = v1;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);

}

uint64_t ___performSyncOnMain_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_24A7E1F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void type metadata accessor for UIWritingToolsResultOptions(uint64_t a1)
{
  sub_24A7E5A60(a1, &qword_25795B290);
}

void type metadata accessor for WTRequestedTool(uint64_t a1)
{
  sub_24A7E5A60(a1, &qword_25795B298);
}

void sub_24A7E5A60(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_24A7E5AA4()
{
  uint64_t v0;

  v0 = sub_24A7EB56C();
  __swift_allocate_value_buffer(v0, qword_2544D66A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2544D66A0);
  return sub_24A7EB560();
}

void sub_24A7E5B18(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_24A7E5B20@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_24A7E5B34@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_24A7E5B48@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_24A7E5B5C(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_24A7E5B8C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_24A7E5BB8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_24A7E5BDC(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_24A7E5BF0(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_24A7E5C04(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_24A7E5C18@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_24A7E5C2C(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_24A7E5C40(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_24A7E5C54(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_24A7E5C68()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_24A7E5C78()
{
  return sub_24A7EB614();
}

_QWORD *sub_24A7E5C90(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

BOOL sub_24A7E5CA4(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24A7E5CB8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_24A7E5DEC(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

_QWORD *sub_24A7E5CF4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_QWORD *sub_24A7E5D00@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_24A7E5D10(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_24A7E5D1C()
{
  return sub_24A7E5D64(&qword_25795B2A0, (uint64_t)&unk_24A7EDC4C);
}

uint64_t sub_24A7E5D40()
{
  return sub_24A7E5D64(&qword_25795B2A8, (uint64_t)&unk_24A7EDC18);
}

uint64_t sub_24A7E5D64(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for UIWritingToolsResultOptions(255);
    result = MEMORY[0x24BD1ADE0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24A7E5DA4()
{
  return sub_24A7E5D64(&qword_25795B2B0, (uint64_t)&unk_24A7EDC78);
}

uint64_t sub_24A7E5DC8()
{
  return sub_24A7E5D64(&qword_25795B2B8, (uint64_t)&unk_24A7EDCB4);
}

uint64_t sub_24A7E5DEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WritingTools(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
    goto LABEL_17;
  if (a2 + 9 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 9) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 9;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 9;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 9;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v8 = v6 - 10;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for WritingTools(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_24A7E5F6C + 4 * byte_24A7EDDC1[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_24A7E5FA0 + 4 * byte_24A7EDDBC[v4]))();
}

uint64_t sub_24A7E5FA0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A7E5FA8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A7E5FB0);
  return result;
}

uint64_t sub_24A7E5FBC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A7E5FC4);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_24A7E5FC8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A7E5FD0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A7E5FDC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_24A7E5FE8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for WritingTools()
{
  return &type metadata for WritingTools;
}

unint64_t sub_24A7E6004()
{
  unint64_t result;

  result = qword_25795B2C0;
  if (!qword_25795B2C0)
  {
    result = MEMORY[0x24BD1ADE0](&unk_24A7EDE2C, &type metadata for WritingTools);
    atomic_store(result, (unint64_t *)&qword_25795B2C0);
  }
  return result;
}

uint64_t sub_24A7E6048(unsigned __int8 a1)
{
  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_24A7E6074 + 4 * byte_24A7EDDC6[a1]))("Panel_iOS", 9);
}

const char *sub_24A7E6074()
{
  return "Panel_iPadOS";
}

const char *sub_24A7E6088()
{
  return "Panel_visionOS";
}

const char *sub_24A7E60BC()
{
  return "OpenEndedAdjustment";
}

BOOL sub_24A7E6118(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24A7E612C()
{
  sub_24A7EB6E0();
  sub_24A7EB6EC();
  return sub_24A7EB6F8();
}

uint64_t sub_24A7E6170()
{
  return sub_24A7EB6EC();
}

uint64_t sub_24A7E6198()
{
  sub_24A7EB6E0();
  sub_24A7EB6EC();
  return sub_24A7EB6F8();
}

const char *sub_24A7E61D8()
{
  return "WritingTools";
}

uint64_t sub_24A7E61EC()
{
  unsigned __int8 *v0;

  return sub_24A7E6048(*v0);
}

uint64_t sub_24A7E6220(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_24A7E62F0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_24A7E6FB8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_24A7E6FB8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_24A7E62F0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_24A7EB608();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_24A7E64A8(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_24A7EB62C();
  if (!v8)
  {
    sub_24A7EB638();
    __break(1u);
LABEL_17:
    result = sub_24A7EB644();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_24A7E64A8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_24A7E653C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_24A7E6714(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_24A7E6714(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24A7E653C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_24A7E66B0(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_24A7EB620();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_24A7EB638();
      __break(1u);
LABEL_10:
      v2 = sub_24A7EB5C0();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_24A7EB644();
    __break(1u);
LABEL_14:
    result = sub_24A7EB638();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_24A7E66B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25795B2C8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24A7E6714(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25795B2C8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_24A7EB644();
  __break(1u);
  return result;
}

id sub_24A7E6860()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  id v17;
  char v18;
  id result;
  void *v20;
  uint64_t v21;
  int v22;
  unint64_t v23;
  int v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  void (*v37)(char *, uint64_t);
  uint8_t *v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  int v55;
  uint64_t v56;
  uint64_t v57[3];
  ValueMetadata *v58;
  unint64_t v59;
  uint64_t v60;

  v0 = sub_24A7EB500();
  v1 = *(_QWORD *)(v0 - 8);
  v52 = v0;
  v53 = v1;
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v50 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v51 = (char *)&v50 - v4;
  v56 = sub_24A7EB50C();
  v5 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v7 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24A7EB524();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_24A7EB548();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v17 = objc_msgSend(v16, sel_userInterfaceIdiom);

  if (v17 == (id)6)
  {
    v58 = &type metadata for WritingTools;
    v59 = sub_24A7E6F54();
    v18 = 2;
    goto LABEL_7;
  }
  if (v17 == (id)1)
  {
    v58 = &type metadata for WritingTools;
    v59 = sub_24A7E6F54();
    v18 = 1;
LABEL_7:
    LOBYTE(v57[0]) = v18;
    goto LABEL_8;
  }
  if (!v17)
  {
    v58 = &type metadata for WritingTools;
    v59 = sub_24A7E6F54();
    LOBYTE(v57[0]) = 0;
LABEL_8:
    v55 = sub_24A7EB4F4();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v57);
    goto LABEL_10;
  }
  v55 = 0;
LABEL_10:
  result = objc_msgSend((id)objc_opt_self(), sel_sharedConnection);
  if (result)
  {
    v20 = result;
    v54 = objc_msgSend(result, sel_isWritingToolsAllowed);

    sub_24A7EB518();
    sub_24A7EB53C();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    sub_24A7EB530();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    v21 = v56;
    v22 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v56);
    v23 = 0x2544D6000uLL;
    if (v22 == *MEMORY[0x24BE3BDE0])
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v21);
      v24 = 1;
      v25 = v54;
    }
    else if (v22 == *MEMORY[0x24BE3BDF0])
    {
      (*(void (**)(char *, uint64_t))(v5 + 96))(v7, v21);
      v27 = v52;
      v26 = v53;
      v28 = v51;
      (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v51, v7, v52);
      if (qword_2544D65F0 != -1)
        swift_once();
      v29 = sub_24A7EB56C();
      __swift_project_value_buffer(v29, (uint64_t)qword_2544D66A0);
      v30 = v50;
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v50, v28, v27);
      v31 = sub_24A7EB554();
      v32 = sub_24A7EB5D8();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = (uint8_t *)swift_slowAlloc();
        v34 = swift_slowAlloc();
        v57[0] = v34;
        *(_DWORD *)v33 = 136315138;
        sub_24A7E6F0C();
        v35 = sub_24A7EB6C8();
        v60 = sub_24A7E6220(v35, v36, v57);
        sub_24A7EB5FC();
        swift_bridgeObjectRelease();
        v37 = *(void (**)(char *, uint64_t))(v53 + 8);
        v37(v30, v27);
        _os_log_impl(&dword_24A7CB000, v31, v32, "isAvailable: unavailable, info = %s", v33, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24BD1AE34](v34, -1, -1);
        v38 = v33;
        v23 = 0x2544D6000;
        MEMORY[0x24BD1AE34](v38, -1, -1);

        v37(v28, v27);
      }
      else
      {

        v39 = *(void (**)(char *, uint64_t))(v26 + 8);
        v39(v30, v27);
        v39(v28, v27);
      }
      v24 = 0;
      v25 = v54;
    }
    else
    {
      v25 = v54;
      if (v22 == *MEMORY[0x24BE3C018])
      {
        v24 = 1;
      }
      else
      {
        if (qword_2544D65F0 != -1)
          swift_once();
        v40 = sub_24A7EB56C();
        __swift_project_value_buffer(v40, (uint64_t)qword_2544D66A0);
        v41 = sub_24A7EB554();
        v42 = sub_24A7EB5CC();
        if (os_log_type_enabled(v41, v42))
        {
          v43 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v43 = 0;
          _os_log_impl(&dword_24A7CB000, v41, v42, "isAvailable: @unknown default", v43, 2u);
          MEMORY[0x24BD1AE34](v43, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v21);
        v24 = 0;
      }
    }
    v44 = *(_QWORD *)(v23 + 1520);
    v45 = v55;
    if (v44 != -1)
      swift_once();
    v46 = sub_24A7EB56C();
    __swift_project_value_buffer(v46, (uint64_t)qword_2544D66A0);
    v47 = sub_24A7EB554();
    v48 = sub_24A7EB5D8();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = swift_slowAlloc();
      *(_DWORD *)v49 = 67109632;
      LODWORD(v57[0]) = v45 & 1;
      sub_24A7EB5FC();
      *(_WORD *)(v49 + 8) = 1024;
      LODWORD(v57[0]) = v25;
      sub_24A7EB5FC();
      *(_WORD *)(v49 + 14) = 1024;
      LODWORD(v57[0]) = v24;
      sub_24A7EB5FC();
      _os_log_impl(&dword_24A7CB000, v47, v48, "isAvailable: featureEnabled = %{BOOL}d, isMDMAllowed = %{BOOL}d, gmAvailable (current) = %{BOOL}d", (uint8_t *)v49, 0x14u);
      MEMORY[0x24BD1AE34](v49, -1, -1);
    }

    return (id)(v45 & v25 & v24);
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_24A7E6F0C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2544D6600;
  if (!qword_2544D6600)
  {
    v1 = sub_24A7EB500();
    result = MEMORY[0x24BD1ADE0](MEMORY[0x24BE3BFF8], v1);
    atomic_store(result, (unint64_t *)&qword_2544D6600);
  }
  return result;
}

unint64_t sub_24A7E6F54()
{
  unint64_t result;

  result = qword_2544D65F8;
  if (!qword_2544D65F8)
  {
    result = MEMORY[0x24BD1ADE0](&unk_24A7EDE54, &type metadata for WritingTools);
    atomic_store(result, (unint64_t *)&qword_2544D65F8);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_24A7E6FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD1ADC8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24A7E70B0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_prompt);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_24A7E717C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_prompt);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A7E71D8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_prompt);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24A7E7240())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24A7E72C8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestedTool;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_24A7E7354(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestedTool);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_24A7E739C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24A7E7424()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_editable);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_24A7E74B0(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_editable);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_24A7E74F8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24A7E7580()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsInlineEditing);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_24A7E760C(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsInlineEditing);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_24A7E7654())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24A7E76DC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_allowedResultOptions;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_24A7E7768(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_allowedResultOptions);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_24A7E77B0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void *sub_24A7E7840()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_24A7E78E8(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

void sub_24A7E7938(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t (*sub_24A7E7998())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24A7E7A20()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForInputDashboard);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_24A7E7AAC(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForInputDashboard);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_24A7E7AF4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24A7E7B7C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForAssistant);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_24A7E7C08(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForAssistant);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_24A7E7C50())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24A7E7CA0@<X0>(uint64_t a1@<X8>)
{
  return sub_24A7E7E70(&OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sessionUUID, a1);
}

uint64_t sub_24A7E7CB8(uint64_t a1)
{
  return sub_24A7E7FD0(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sessionUUID);
}

uint64_t (*sub_24A7E7CC4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24A7E7D14@<X0>(uint64_t a1@<X8>)
{
  return sub_24A7E7E70(&OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_suggestionUUID, a1);
}

uint64_t sub_24A7E7D2C(uint64_t a1)
{
  return sub_24A7E7FD0(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_suggestionUUID);
}

uint64_t (*sub_24A7E7D38())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_24A7E7D88(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25795B320);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1 + *a3;
  swift_beginAccess();
  sub_24A7E9C7C(v8, (uint64_t)v7);
  v9 = sub_24A7EB4E8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) != 1)
  {
    v11 = (void *)sub_24A7EB4D0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
  }
  return v11;
}

uint64_t sub_24A7E7E64@<X0>(uint64_t a1@<X8>)
{
  return sub_24A7E7E70(&OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_contextUUID, a1);
}

uint64_t sub_24A7E7E70@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + *a1;
  swift_beginAccess();
  return sub_24A7E9C7C(v4, a2);
}

void sub_24A7E7EC8(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25795B320);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_24A7EB4DC();
    v10 = sub_24A7EB4E8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    v11 = sub_24A7EB4E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  v12 = (uint64_t)a1 + *a4;
  swift_beginAccess();
  v13 = a1;
  sub_24A7E9CC4((uint64_t)v9, v12);
  swift_endAccess();

}

uint64_t sub_24A7E7FC4(uint64_t a1)
{
  return sub_24A7E7FD0(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_contextUUID);
}

uint64_t sub_24A7E7FD0(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + *a2;
  swift_beginAccess();
  sub_24A7E9CC4(a1, v4);
  return swift_endAccess();
}

uint64_t sub_24A7E8024(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25795B320);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A7E9C7C(a1, (uint64_t)v10);
  v11 = *a2 + *a5;
  swift_beginAccess();
  sub_24A7E9CC4((uint64_t)v10, v11);
  return swift_endAccess();
}

uint64_t (*sub_24A7E80D0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24A7E8158()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isQuestionnairePopover);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_24A7E81E4(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isQuestionnairePopover);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_24A7E822C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24A7E8270(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24A7E82A8 + 4 * byte_24A7EDEA0[a1]))(0xD000000000000012, 0x800000024A7EF1A0);
}

uint64_t sub_24A7E82A8()
{
  return 0x74706D6F7270;
}

uint64_t sub_24A7E82BC()
{
  return 0x6574736575716572;
}

uint64_t sub_24A7E82E0()
{
  return 0x656C626174696465;
}

uint64_t sub_24A7E82F8(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_24A7E83BC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24A7E83F4 + 4 * byte_24A7EDEAC[a1]))(0xD000000000000012, 0x800000024A7EF1A0);
}

uint64_t sub_24A7E83F4()
{
  return 0x74706D6F7270;
}

uint64_t sub_24A7E8408()
{
  return 0x6574736575716572;
}

uint64_t sub_24A7E842C()
{
  return 0x656C626174696465;
}

uint64_t sub_24A7E8444(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_24A7E8508(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = sub_24A7E8270(*a1);
  v5 = v4;
  if (v3 == sub_24A7E8270(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_24A7EB6D4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24A7E8590()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_24A7EB6E0();
  sub_24A7E8270(v1);
  sub_24A7EB5B4();
  swift_bridgeObjectRelease();
  return sub_24A7EB6F8();
}

uint64_t sub_24A7E85F0()
{
  unsigned __int8 *v0;

  sub_24A7E8270(*v0);
  sub_24A7EB5B4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A7E8630()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_24A7EB6E0();
  sub_24A7E8270(v1);
  sub_24A7EB5B4();
  swift_bridgeObjectRelease();
  return sub_24A7EB6F8();
}

uint64_t sub_24A7E868C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24A7EAED4();
  *a1 = result;
  return result;
}

uint64_t sub_24A7E86B8@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_24A7E8270(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_24A7E86E0()
{
  unsigned __int8 *v0;

  return sub_24A7E83BC(*v0);
}

uint64_t sub_24A7E86E8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24A7EAED4();
  *a1 = result;
  return result;
}

uint64_t sub_24A7E870C()
{
  return 0;
}

void sub_24A7E8718(_BYTE *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_24A7E8724()
{
  sub_24A7E9D30();
  return sub_24A7EB71C();
}

uint64_t sub_24A7E874C()
{
  sub_24A7E9D30();
  return sub_24A7EB728();
}

uint64_t sub_24A7E8774(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  __int128 *v14;
  uint64_t v15;
  void **v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  id v48[3];
  char v49;
  char v50;
  char v51;
  char v52;
  __int128 v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_25795B320);
  v2 = MEMORY[0x24BDAC7A8](v39);
  v38 = (uint64_t)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v33 - v5;
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v33 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25795B328);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24A7E9D30();
  v13 = v41;
  sub_24A7EB710();
  v14 = (__int128 *)(v13 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_prompt);
  swift_beginAccess();
  v53 = *v14;
  v52 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25795B338);
  sub_24A7E9D74();
  v15 = (uint64_t)v40;
  sub_24A7EB6BC();
  if (v15)
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v40 = v8;
  swift_beginAccess();
  v52 = 1;
  sub_24A7EB6A4();
  swift_beginAccess();
  v51 = 2;
  sub_24A7EB698();
  swift_beginAccess();
  v50 = 3;
  sub_24A7EB698();
  swift_beginAccess();
  v49 = 4;
  sub_24A7EB6B0();
  v37 = v9;
  v17 = (void **)(v13 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration);
  swift_beginAccess();
  v18 = *v17;
  if (*v17)
  {
    v19 = (void *)objc_opt_self();
    v48[0] = 0;
    v20 = v18;
    v21 = objc_msgSend(v19, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v20, 1, v48);
    v22 = v48[0];
    if (!v21)
    {
      v25 = v22;
      sub_24A7EB4B8();

      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v37);
    }
    v35 = v20;
    v36 = (void *)sub_24A7EB4C4();
    v24 = v23;

    v48[0] = v36;
    v34 = (unint64_t)v24;
    v48[1] = v24;
    v47 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25795B358);
    sub_24A7E9ED0();
    sub_24A7EB6BC();

    sub_24A7E9F78((uint64_t)v36, v34);
  }
  swift_beginAccess();
  v47 = 6;
  v26 = v37;
  sub_24A7EB698();
  swift_beginAccess();
  v46 = 7;
  sub_24A7EB698();
  v36 = v6;
  v27 = v13 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sessionUUID;
  swift_beginAccess();
  v28 = (uint64_t)v40;
  sub_24A7E9C7C(v27, (uint64_t)v40);
  v45 = 8;
  v39 = sub_24A7E9E14();
  sub_24A7EB6BC();
  sub_24A7E9E90(v28);
  v29 = v13 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_suggestionUUID;
  swift_beginAccess();
  v30 = (uint64_t)v36;
  sub_24A7E9C7C(v29, (uint64_t)v36);
  v44 = 9;
  sub_24A7EB6BC();
  sub_24A7E9E90(v30);
  v31 = v13 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_contextUUID;
  swift_beginAccess();
  v32 = v38;
  sub_24A7E9C7C(v31, v38);
  v43 = 10;
  sub_24A7EB6BC();
  sub_24A7E9E90(v32);
  swift_beginAccess();
  v42 = 11;
  sub_24A7EB698();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v26);
}

id WTStartupOptions.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id WTStartupOptions.init()()
{
  _BYTE *v0;
  _QWORD *v1;
  char *v2;
  uint64_t v3;
  void (*v4)(char *, uint64_t, uint64_t, uint64_t);
  objc_super v6;

  v1 = &v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_prompt];
  *v1 = 0;
  v1[1] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestedTool] = 0;
  v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_editable] = 0;
  v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsInlineEditing] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_allowedResultOptions] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration] = 0;
  v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForInputDashboard] = 0;
  v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForAssistant] = 0;
  v2 = &v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sessionUUID];
  v3 = sub_24A7EB4E8();
  v4 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56);
  v4(v2, 1, 1, v3);
  v4(&v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_suggestionUUID], 1, 1, v3);
  v4(&v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_contextUUID], 1, 1, v3);
  v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isQuestionnairePopover] = 0;
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for WTStartupOptions();
  return objc_msgSendSuper2(&v6, sel_init);
}

id WTStartupOptions.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return WTStartupOptions.init(from:)(a1);
}

id WTStartupOptions.init(from:)(_QWORD *a1)
{
  _BYTE *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(void);
  char *v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t *v19;
  id *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t *v27;
  uint64_t v28;
  _BYTE *v29;
  _BYTE *v30;
  uint64_t v31;
  void **v32;
  uint64_t v33;
  uint64_t *v34;
  unint64_t v35;
  void *v36;
  char v37;
  _BYTE *v38;
  char v39;
  _BYTE *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  _BYTE *v48;
  id v49;
  objc_class *v50;
  _BYTE *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  _BYTE *v55;
  uint64_t *v56;
  _BYTE *v57;
  _BYTE *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  _BYTE *v62;
  _QWORD *v63;
  _BYTE *v64;
  _BYTE *v65;
  _BYTE *v66;
  id *v67;
  uint64_t *v68;
  objc_super v69;
  char v70;
  char v71;
  char v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  char v76;
  char v77;
  char v78;
  char v79;
  uint64_t v80;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25795B320);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v52 = (uint64_t)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v53 = (uint64_t)&v51 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v54 = (char *)&v51 - v8;
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_25795B370);
  v61 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t *)&v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_prompt];
  *v11 = 0;
  v11[1] = 0;
  v68 = v11;
  v59 = (uint64_t *)&v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestedTool];
  *(_QWORD *)&v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestedTool] = 0;
  v58 = &v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_editable];
  v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_editable] = 0;
  v57 = &v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsInlineEditing];
  v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsInlineEditing] = 0;
  v56 = (uint64_t *)&v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_allowedResultOptions];
  *(_QWORD *)&v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_allowedResultOptions] = 0;
  v67 = (id *)&v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration];
  *(_QWORD *)&v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration] = 0;
  v55 = &v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForInputDashboard];
  v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForInputDashboard] = 0;
  v12 = &v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForAssistant];
  v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForAssistant] = 0;
  v13 = (uint64_t)&v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sessionUUID];
  v14 = sub_24A7EB4E8();
  v15 = *(void (**)(void))(*(_QWORD *)(v14 - 8) + 56);
  v80 = v13;
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v15)(v13, 1, 1, v14);
  v66 = &v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_suggestionUUID];
  v15();
  v65 = &v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_contextUUID];
  v15();
  v16 = &v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isQuestionnairePopover];
  v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isQuestionnairePopover] = 0;
  v17 = a1[3];
  v63 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v17);
  sub_24A7E9D30();
  v62 = v1;
  v18 = v64;
  sub_24A7EB704();
  if (v18)
  {
    v20 = v67;
    v21 = v62;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v63);
    swift_bridgeObjectRelease();

    sub_24A7E9E90(v80);
    sub_24A7E9E90((uint64_t)v66);
    sub_24A7E9E90((uint64_t)v65);

    type metadata accessor for WTStartupOptions();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v19 = v59;
    v64 = v12;
    v51 = v16;
    v79 = 0;
    v23 = sub_24A7EB65C();
    v25 = v24;
    v26 = v10;
    v27 = v68;
    swift_beginAccess();
    *v27 = v23;
    v27[1] = v25;
    swift_bridgeObjectRelease();
    v78 = 1;
    v28 = sub_24A7EB680();
    swift_beginAccess();
    *v19 = v28;
    v77 = 2;
    LOBYTE(v28) = sub_24A7EB674();
    v29 = v58;
    swift_beginAccess();
    *v29 = v28 & 1;
    v76 = 3;
    LOBYTE(v28) = sub_24A7EB674();
    v30 = v57;
    swift_beginAccess();
    *v30 = v28 & 1;
    v75 = 4;
    v31 = sub_24A7EB68C();
    v32 = v67;
    v33 = v31;
    v34 = v56;
    swift_beginAccess();
    *v34 = v33;
    v72 = 5;
    sub_24A7EA1EC();
    sub_24A7EB668();
    v35 = v74;
    v59 = (uint64_t *)v73;
    if (v74 >> 60 != 15)
      __asm { BR              X10 }
    swift_beginAccess();
    v36 = *v32;
    *v32 = 0;

    v72 = 6;
    v37 = sub_24A7EB674();
    v58 = (_BYTE *)v35;
    v38 = v55;
    swift_beginAccess();
    *v38 = v37 & 1;
    v71 = 7;
    v39 = sub_24A7EB674();
    v40 = v64;
    swift_beginAccess();
    *v40 = v39 & 1;
    v70 = 8;
    v41 = sub_24A7EA35C(&qword_25795B380, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    v42 = (uint64_t)v54;
    v64 = (_BYTE *)v41;
    sub_24A7EB668();
    v43 = v80;
    swift_beginAccess();
    sub_24A7E9CC4(v42, v43);
    swift_endAccess();
    v70 = 9;
    v44 = v60;
    sub_24A7EB668();
    v45 = (uint64_t)v66;
    swift_beginAccess();
    sub_24A7E9CC4(v53, v45);
    swift_endAccess();
    v70 = 10;
    sub_24A7EB668();
    v46 = (uint64_t)v65;
    swift_beginAccess();
    sub_24A7E9CC4(v52, v46);
    swift_endAccess();
    v70 = 11;
    v47 = sub_24A7EB674();
    (*(void (**)(char *, uint64_t))(v61 + 8))(v26, v44);
    sub_24A7EA230((uint64_t)v59, (unint64_t)v58);
    v48 = v51;
    swift_beginAccess();
    *v48 = v47 & 1;
    v49 = v62;

    v50 = (objc_class *)type metadata accessor for WTStartupOptions();
    v69.receiver = v49;
    v69.super_class = v50;
    v21 = objc_msgSendSuper2(&v69, sel_init);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v63);
  }
  return v21;
}

uint64_t sub_24A7E9A18()
{
  sub_24A7EA2C0();
  return sub_24A7EB578();
}

id WTStartupOptions.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WTStartupOptions();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_24A7E9BB0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  id v5;
  id result;

  v5 = objc_allocWithZone((Class)type metadata accessor for WTStartupOptions());
  result = WTStartupOptions.init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_24A7E9C04(_QWORD *a1)
{
  return sub_24A7E8774(a1);
}

uint64_t (*sub_24A7E9C24(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v1;
  __int128 v3[2];

  sub_24A7EAFF0(a1, (uint64_t)v3);
  v1 = swift_allocObject();
  sub_24A7EB058(v3, v1 + 16);
  return sub_24A7EB070;
}

uint64_t sub_24A7E9C7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25795B320);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A7E9CC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25795B320);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24A7E9D30()
{
  unint64_t result;

  result = qword_25795B330;
  if (!qword_25795B330)
  {
    atomic_store(result, (unint64_t *)&qword_25795B330);
  }
  return result;
}

unint64_t sub_24A7E9D74()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_25795B340;
  if (!qword_25795B340)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25795B338);
    v2 = MEMORY[0x24BEE0D08];
    result = MEMORY[0x24BD1ADE0](MEMORY[0x24BEE4AA8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25795B340);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD1ADD4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_24A7E9E14()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_25795B348;
  if (!qword_25795B348)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25795B320);
    v2 = sub_24A7EA35C(&qword_25795B350, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
    result = MEMORY[0x24BD1ADE0](MEMORY[0x24BEE4AA8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25795B348);
  }
  return result;
}

uint64_t sub_24A7E9E90(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25795B320);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24A7E9ED0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_25795B360;
  if (!qword_25795B360)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25795B358);
    v2 = sub_24A7E9F34();
    result = MEMORY[0x24BD1ADE0](MEMORY[0x24BEE4AA8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25795B360);
  }
  return result;
}

unint64_t sub_24A7E9F34()
{
  unint64_t result;

  result = qword_25795B368;
  if (!qword_25795B368)
  {
    result = MEMORY[0x24BD1ADE0](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_25795B368);
  }
  return result;
}

uint64_t sub_24A7E9F78(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t (*static WTSceneConnectionOptionsDefinition.sceneDelegateMethod.getter())()
{
  uint64_t (*v0)();

  swift_beginAccess();
  v0 = off_25795B2D0;
  swift_retain();
  return v0;
}

uint64_t static WTSceneConnectionOptionsDefinition.sceneDelegateMethod.setter(uint64_t (*a1)(), uint64_t a2)
{
  swift_beginAccess();
  off_25795B2D0 = a1;
  qword_25795B2D8 = a2;
  return swift_release();
}

uint64_t (*static WTSceneConnectionOptionsDefinition.sceneDelegateMethod.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t (*sub_24A7EA0A4())@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v0;
  uint64_t (*v1)();
  uint64_t v2;

  swift_beginAccess();
  v1 = off_25795B2D0;
  v0 = qword_25795B2D8;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v2 + 24) = v0;
  swift_retain();
  return sub_24A7EAF70;
}

uint64_t sub_24A7EA120(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v1 = a1[1];
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  swift_retain();
  sub_24A7EB590();
  return swift_release();
}

uint64_t type metadata accessor for WTStartupOptions()
{
  uint64_t result;

  result = qword_25795B3D8;
  if (!qword_25795B3D8)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_24A7EA1EC()
{
  unint64_t result;

  result = qword_25795B378;
  if (!qword_25795B378)
  {
    result = MEMORY[0x24BD1ADE0](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_25795B378);
  }
  return result;
}

uint64_t sub_24A7EA230(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_24A7E9F78(a1, a2);
  return a1;
}

uint64_t sub_24A7EA244(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_24A7EA288(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_24A7EA2C0()
{
  unint64_t result;

  result = qword_25795B398;
  if (!qword_25795B398)
  {
    result = MEMORY[0x24BD1ADE0](&protocol conformance descriptor for WTSceneConnectionOptionsDefinition, &type metadata for WTSceneConnectionOptionsDefinition);
    atomic_store(result, (unint64_t *)&qword_25795B398);
  }
  return result;
}

uint64_t sub_24A7EA304()
{
  return sub_24A7EA35C(&qword_25795B3A0, (uint64_t (*)(uint64_t))type metadata accessor for WTStartupOptions, (uint64_t)&protocol conformance descriptor for WTStartupOptions);
}

uint64_t sub_24A7EA330()
{
  return sub_24A7EA35C(&qword_25795B3A8, (uint64_t (*)(uint64_t))type metadata accessor for WTStartupOptions, (uint64_t)&protocol conformance descriptor for WTStartupOptions);
}

uint64_t sub_24A7EA35C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24BD1ADE0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24A7EA39C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_prompt);
  swift_beginAccess();
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A7EA3F4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestedTool);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_24A7EA444(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestedTool);
}

uint64_t sub_24A7EA450@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_editable, a2);
}

uint64_t sub_24A7EA45C(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_4Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_editable);
}

uint64_t sub_24A7EA468@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsInlineEditing, a2);
}

uint64_t sub_24A7EA474(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_4Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsInlineEditing);
}

uint64_t sub_24A7EA480@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_allowedResultOptions);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_24A7EA4D0(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_allowedResultOptions);
}

uint64_t keypath_set_2Tm(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_QWORD *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

id sub_24A7EA524@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_24A7EA578@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForInputDashboard, a2);
}

uint64_t sub_24A7EA584(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_4Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForInputDashboard);
}

uint64_t sub_24A7EA590@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForAssistant, a2);
}

uint64_t sub_24A7EA59C(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_4Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForAssistant);
}

uint64_t sub_24A7EA5A8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sessionUUID, a2);
}

uint64_t sub_24A7EA5B4(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_24A7E8024(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sessionUUID);
}

uint64_t sub_24A7EA5D0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_suggestionUUID, a2);
}

uint64_t sub_24A7EA5DC(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_24A7E8024(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_suggestionUUID);
}

uint64_t sub_24A7EA5F8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_contextUUID, a2);
}

uint64_t keypath_get_15Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v4;

  v4 = *a1 + *a2;
  swift_beginAccess();
  return sub_24A7E9C7C(v4, a3);
}

uint64_t sub_24A7EA654(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_24A7E8024(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_contextUUID);
}

uint64_t sub_24A7EA670@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isQuestionnairePopover, a2);
}

uint64_t keypath_get_3Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _BYTE *a3@<X8>)
{
  _BYTE *v4;
  uint64_t result;

  v4 = (_BYTE *)(*a1 + *a2);
  result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_24A7EA6C8(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_4Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isQuestionnairePopover);
}

uint64_t keypath_set_4Tm(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  char v5;
  _BYTE *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_BYTE *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

uint64_t sub_24A7EA71C()
{
  return type metadata accessor for WTStartupOptions();
}

void sub_24A7EA724()
{
  unint64_t v0;

  sub_24A7EAC34();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for WTStartupOptions()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WTStartupOptions.prompt.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of WTStartupOptions.prompt.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of WTStartupOptions.prompt.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of WTStartupOptions.requestedTool.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of WTStartupOptions.requestedTool.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of WTStartupOptions.requestedTool.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of WTStartupOptions.editable.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of WTStartupOptions.editable.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of WTStartupOptions.editable.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of WTStartupOptions.wantsInlineEditing.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of WTStartupOptions.wantsInlineEditing.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of WTStartupOptions.wantsInlineEditing.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of WTStartupOptions.allowedResultOptions.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of WTStartupOptions.allowedResultOptions.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of WTStartupOptions.allowedResultOptions.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of WTStartupOptions.smartReplyConfiguration.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of WTStartupOptions.smartReplyConfiguration.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of WTStartupOptions.smartReplyConfiguration.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of WTStartupOptions.isForInputDashboard.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of WTStartupOptions.isForInputDashboard.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of WTStartupOptions.isForInputDashboard.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of WTStartupOptions.isForAssistant.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of WTStartupOptions.isForAssistant.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of WTStartupOptions.isForAssistant.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of WTStartupOptions.sessionUUID.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of WTStartupOptions.sessionUUID.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of WTStartupOptions.sessionUUID.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of WTStartupOptions.suggestionUUID.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of WTStartupOptions.suggestionUUID.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of WTStartupOptions.suggestionUUID.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of WTStartupOptions.contextUUID.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of WTStartupOptions.contextUUID.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of WTStartupOptions.contextUUID.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of WTStartupOptions.isQuestionnairePopover.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of WTStartupOptions.isQuestionnairePopover.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of WTStartupOptions.isQuestionnairePopover.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of WTStartupOptions.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of WTStartupOptions.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 472))();
}

uint64_t dispatch thunk of WTStartupOptions.asBSAction()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E0))();
}

void sub_24A7EAC34()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25795B3E8)
  {
    sub_24A7EB4E8();
    v0 = sub_24A7EB5F0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25795B3E8);
  }
}

uint64_t dispatch thunk of WritingToolsSceneDelegate.windowScene(_:didUpdateWritingToolsStartupOptions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

ValueMetadata *type metadata accessor for WTSceneConnectionOptionsDefinition()
{
  return &type metadata for WTSceneConnectionOptionsDefinition;
}

uint64_t getEnumTagSinglePayload for WTStartupOptions.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF5)
    goto LABEL_17;
  if (a2 + 11 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 11) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 11;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 11;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 11;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v8 = v6 - 12;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for WTStartupOptions.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 11 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 11) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF4)
    return ((uint64_t (*)(void))((char *)&loc_24A7EAD7C + 4 * byte_24A7EDEC1[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_24A7EADB0 + 4 * byte_24A7EDEBC[v4]))();
}

uint64_t sub_24A7EADB0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A7EADB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A7EADC0);
  return result;
}

uint64_t sub_24A7EADCC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A7EADD4);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_24A7EADD8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A7EADE0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WTStartupOptions.CodingKeys()
{
  return &type metadata for WTStartupOptions.CodingKeys;
}

unint64_t sub_24A7EAE00()
{
  unint64_t result;

  result = qword_25795B3F0;
  if (!qword_25795B3F0)
  {
    result = MEMORY[0x24BD1ADE0](&unk_24A7EE108, &type metadata for WTStartupOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25795B3F0);
  }
  return result;
}

unint64_t sub_24A7EAE48()
{
  unint64_t result;

  result = qword_25795B3F8;
  if (!qword_25795B3F8)
  {
    result = MEMORY[0x24BD1ADE0](&unk_24A7EE040, &type metadata for WTStartupOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25795B3F8);
  }
  return result;
}

unint64_t sub_24A7EAE90()
{
  unint64_t result;

  result = qword_25795B400;
  if (!qword_25795B400)
  {
    result = MEMORY[0x24BD1ADE0](&unk_24A7EE068, &type metadata for WTStartupOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25795B400);
  }
  return result;
}

uint64_t sub_24A7EAED4()
{
  unint64_t v0;

  v0 = sub_24A7EB650();
  swift_bridgeObjectRelease();
  if (v0 >= 0xC)
    return 12;
  else
    return v0;
}

uint64_t sub_24A7EAF1C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24A7EAF40(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_24A7EAF70@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v3 = (*(uint64_t (**)(void))(v1 + 16))();
  v5 = v4;
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v3;
  *(_QWORD *)(result + 24) = v5;
  *a1 = sub_24A7EAFC8;
  a1[1] = result;
  return result;
}

uint64_t sub_24A7EAFC8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, *a2);
}

uint64_t sub_24A7EAFF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24A7EB034()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_24A7EB058(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_24A7EB070(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;

  v5 = v2[5];
  v6 = v2[6];
  __swift_project_boxed_opaque_existential_1(v2 + 2, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 8))(a1, a2, v5, v6);
}

uint64_t sub_24A7EB0D8()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_24A7EB4AC()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_24A7EB4B8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_24A7EB4C4()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_24A7EB4D0()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_24A7EB4DC()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_24A7EB4E8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_24A7EB4F4()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_24A7EB500()
{
  return MEMORY[0x24BE3BFE8]();
}

uint64_t sub_24A7EB50C()
{
  return MEMORY[0x24BE3C020]();
}

uint64_t sub_24A7EB518()
{
  return MEMORY[0x24BE3C060]();
}

uint64_t sub_24A7EB524()
{
  return MEMORY[0x24BE3C068]();
}

uint64_t sub_24A7EB530()
{
  return MEMORY[0x24BE3C090]();
}

uint64_t sub_24A7EB53C()
{
  return MEMORY[0x24BE3C118]();
}

uint64_t sub_24A7EB548()
{
  return MEMORY[0x24BE3C138]();
}

uint64_t sub_24A7EB554()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24A7EB560()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24A7EB56C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24A7EB578()
{
  return MEMORY[0x24BEBC9A8]();
}

uint64_t sub_24A7EB584()
{
  return MEMORY[0x24BEBC9B0]();
}

uint64_t sub_24A7EB590()
{
  return MEMORY[0x24BEBC9B8]();
}

uint64_t sub_24A7EB59C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24A7EB5A8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24A7EB5B4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24A7EB5C0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24A7EB5CC()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_24A7EB5D8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_24A7EB5E4()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_24A7EB5F0()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_24A7EB5FC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24A7EB608()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24A7EB614()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_24A7EB620()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24A7EB62C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24A7EB638()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_24A7EB644()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24A7EB650()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_24A7EB65C()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_24A7EB668()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_24A7EB674()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_24A7EB680()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_24A7EB68C()
{
  return MEMORY[0x24BEE3378]();
}

uint64_t sub_24A7EB698()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_24A7EB6A4()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_24A7EB6B0()
{
  return MEMORY[0x24BEE34C8]();
}

uint64_t sub_24A7EB6BC()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_24A7EB6C8()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_24A7EB6D4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24A7EB6E0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24A7EB6EC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24A7EB6F8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_24A7EB704()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_24A7EB710()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_24A7EB71C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_24A7EB728()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x24BE0BD28]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGColorRef CGColorGetConstantColor(CFStringRef colorName)
{
  return (CGColorRef)MEMORY[0x24BDBDB00](colorName);
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
  MEMORY[0x24BDBEDD8](path1, m, path2);
}

void CGPathAddRoundedRect(CGMutablePathRef path, const CGAffineTransform *transform, CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight)
{
  MEMORY[0x24BDBEE00](path, transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEEA8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBEEE0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BEBD2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

uint64_t RBColorFromCGColor()
{
  return MEMORY[0x24BE7EF70]();
}

uint64_t RBDisplayListGetState()
{
  return MEMORY[0x24BE7EFB0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x24BDAD218](__x);
  return result;
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

