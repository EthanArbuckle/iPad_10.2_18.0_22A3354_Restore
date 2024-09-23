@implementation WTAnalyticsDelegate

- (WTAnalyticsDelegate)init
{
  WTAnalyticsDelegate *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  NSUUID *analyticsSessionId;
  id IASignalAnalyticsClass;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _Unwind_Exception *v14;
  objc_super v15;
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;

  v15.receiver = self;
  v15.super_class = (Class)WTAnalyticsDelegate;
  v2 = -[WTAnalyticsDelegate init](&v15, sel_init);
  if (v2)
  {
    WTIATextAssistantLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24A7CB000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WTPanelBringup", ", buf, 2u);
    }

    WTIATextAssistantLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[WTAnalyticsDelegate init].cold.2(v4);

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = objc_claimAutoreleasedReturnValue();
    analyticsSessionId = v2->_analyticsSessionId;
    v2->_analyticsSessionId = (NSUUID *)v5;

    IASignalAnalyticsClass = getIASignalAnalyticsClass();
    *(_QWORD *)buf = 0;
    v17 = buf;
    v18 = 0x2020000000;
    v8 = (id *)getIASignalWritingToolsPanelAppearedSymbolLoc_ptr;
    v19 = getIASignalWritingToolsPanelAppearedSymbolLoc_ptr;
    if (!getIASignalWritingToolsPanelAppearedSymbolLoc_ptr)
    {
      v9 = (void *)InputAnalyticsLibrary();
      v8 = (id *)dlsym(v9, "IASignalWritingToolsPanelAppeared");
      *((_QWORD *)v17 + 3) = v8;
      getIASignalWritingToolsPanelAppearedSymbolLoc_ptr = (uint64_t)v8;
    }
    _Block_object_dispose(buf, 8);
    if (!v8)
    {
      v14 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
      _Block_object_dispose(buf, 8);
      _Unwind_Resume(v14);
    }
    v10 = *v8;
    getIAChannelWritingTools();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(IASignalAnalyticsClass, "sendSignal:toChannel:withSessionID:withPayload:", v10, v11, v2->_analyticsSessionId, 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel_applicationDidEnterBackground, *MEMORY[0x24BEBDF98], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel_applicationDidBecomeActive, *MEMORY[0x24BEBDF88], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel_applicationWillTerminate, *MEMORY[0x24BEBE018], 0);

  }
  return v2;
}

- (id)getWritingToolsFeature:(int64_t)a3
{
  void *v3;

  switch(a3)
  {
    case 1:
      getIAPayloadValueWritingToolsFeatureRewrite();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
    case 3:
    case 4:
      getIAPayloadValueWritingToolsFeatureAdjust();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
    case 7:
    case 8:
    case 9:
      getIAPayloadValueWritingToolsFeatureTransform();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      getIAPayloadValueWritingToolsFeatureUnspecified();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

- (id)getWritingToolsFeatureDetail:(int64_t)a3
{
  __CFString *v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _Unwind_Exception *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = CFSTR("Summarize");
  switch(a3)
  {
    case 1:
      v14 = 0;
      v15 = &v14;
      v16 = 0x2020000000;
      v4 = (id *)getIAPayloadValueWritingToolsFeatureDetailsMagicRewriteSymbolLoc_ptr;
      v17 = getIAPayloadValueWritingToolsFeatureDetailsMagicRewriteSymbolLoc_ptr;
      if (!getIAPayloadValueWritingToolsFeatureDetailsMagicRewriteSymbolLoc_ptr)
      {
        v5 = (void *)InputAnalyticsLibrary();
        v4 = (id *)dlsym(v5, "IAPayloadValueWritingToolsFeatureDetailsMagicRewrite");
        v15[3] = (uint64_t)v4;
        getIAPayloadValueWritingToolsFeatureDetailsMagicRewriteSymbolLoc_ptr = (uint64_t)v4;
      }
      _Block_object_dispose(&v14, 8);
      if (v4)
        goto LABEL_30;
      -[WTAnalyticsDelegate init].cold.1();
      goto LABEL_6;
    case 2:
LABEL_6:
      v14 = 0;
      v15 = &v14;
      v16 = 0x2020000000;
      v4 = (id *)getIAPayloadValueWritingToolsFeatureDetailsFriendlyToneSymbolLoc_ptr;
      v17 = getIAPayloadValueWritingToolsFeatureDetailsFriendlyToneSymbolLoc_ptr;
      if (!getIAPayloadValueWritingToolsFeatureDetailsFriendlyToneSymbolLoc_ptr)
      {
        v6 = (void *)InputAnalyticsLibrary();
        v4 = (id *)dlsym(v6, "IAPayloadValueWritingToolsFeatureDetailsFriendlyTone");
        v15[3] = (uint64_t)v4;
        getIAPayloadValueWritingToolsFeatureDetailsFriendlyToneSymbolLoc_ptr = (uint64_t)v4;
      }
      _Block_object_dispose(&v14, 8);
      if (v4)
        goto LABEL_30;
      -[WTAnalyticsDelegate init].cold.1();
LABEL_10:
      v14 = 0;
      v15 = &v14;
      v16 = 0x2020000000;
      v4 = (id *)getIAPayloadValueWritingToolsFeatureDetailsProfessionalToneSymbolLoc_ptr;
      v17 = getIAPayloadValueWritingToolsFeatureDetailsProfessionalToneSymbolLoc_ptr;
      if (!getIAPayloadValueWritingToolsFeatureDetailsProfessionalToneSymbolLoc_ptr)
      {
        v7 = (void *)InputAnalyticsLibrary();
        v4 = (id *)dlsym(v7, "IAPayloadValueWritingToolsFeatureDetailsProfessionalTone");
        v15[3] = (uint64_t)v4;
        getIAPayloadValueWritingToolsFeatureDetailsProfessionalToneSymbolLoc_ptr = (uint64_t)v4;
      }
      _Block_object_dispose(&v14, 8);
      if (v4)
        goto LABEL_30;
      -[WTAnalyticsDelegate init].cold.1();
LABEL_14:
      getIAPayloadValueWritingToolsFeatureUnspecified();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      goto LABEL_10;
    case 4:
      goto LABEL_27;
    case 6:
      return v3;
    case 7:
      v14 = 0;
      v15 = &v14;
      v16 = 0x2020000000;
      v4 = (id *)getIAPayloadValueWritingToolsFeatureDetailsTakeawaysTransformSymbolLoc_ptr;
      v17 = getIAPayloadValueWritingToolsFeatureDetailsTakeawaysTransformSymbolLoc_ptr;
      if (!getIAPayloadValueWritingToolsFeatureDetailsTakeawaysTransformSymbolLoc_ptr)
      {
        v8 = (void *)InputAnalyticsLibrary();
        v4 = (id *)dlsym(v8, "IAPayloadValueWritingToolsFeatureDetailsTakeawaysTransform");
        v15[3] = (uint64_t)v4;
        getIAPayloadValueWritingToolsFeatureDetailsTakeawaysTransformSymbolLoc_ptr = (uint64_t)v4;
      }
      _Block_object_dispose(&v14, 8);
      if (v4)
        goto LABEL_30;
      -[WTAnalyticsDelegate init].cold.1();
LABEL_19:
      v14 = 0;
      v15 = &v14;
      v16 = 0x2020000000;
      v4 = (id *)getIAPayloadValueWritingToolsFeatureDetailsBulletsTransformSymbolLoc_ptr;
      v17 = getIAPayloadValueWritingToolsFeatureDetailsBulletsTransformSymbolLoc_ptr;
      if (!getIAPayloadValueWritingToolsFeatureDetailsBulletsTransformSymbolLoc_ptr)
      {
        v9 = (void *)InputAnalyticsLibrary();
        v4 = (id *)dlsym(v9, "IAPayloadValueWritingToolsFeatureDetailsBulletsTransform");
        v15[3] = (uint64_t)v4;
        getIAPayloadValueWritingToolsFeatureDetailsBulletsTransformSymbolLoc_ptr = (uint64_t)v4;
      }
      _Block_object_dispose(&v14, 8);
      if (!v4)
      {
        -[WTAnalyticsDelegate init].cold.1();
LABEL_23:
        v14 = 0;
        v15 = &v14;
        v16 = 0x2020000000;
        v4 = (id *)getIAPayloadValueWritingToolsFeatureDetailsTablesTransformSymbolLoc_ptr;
        v17 = getIAPayloadValueWritingToolsFeatureDetailsTablesTransformSymbolLoc_ptr;
        if (!getIAPayloadValueWritingToolsFeatureDetailsTablesTransformSymbolLoc_ptr)
        {
          v10 = (void *)InputAnalyticsLibrary();
          v4 = (id *)dlsym(v10, "IAPayloadValueWritingToolsFeatureDetailsTablesTransform");
          v15[3] = (uint64_t)v4;
          getIAPayloadValueWritingToolsFeatureDetailsTablesTransformSymbolLoc_ptr = (uint64_t)v4;
        }
        _Block_object_dispose(&v14, 8);
        if (!v4)
        {
          -[WTAnalyticsDelegate init].cold.1();
LABEL_27:
          v14 = 0;
          v15 = &v14;
          v16 = 0x2020000000;
          v4 = (id *)getIAPayloadValueWritingToolsFeatureDetailsConciseToneSymbolLoc_ptr;
          v17 = getIAPayloadValueWritingToolsFeatureDetailsConciseToneSymbolLoc_ptr;
          if (!getIAPayloadValueWritingToolsFeatureDetailsConciseToneSymbolLoc_ptr)
          {
            v11 = (void *)InputAnalyticsLibrary();
            v4 = (id *)dlsym(v11, "IAPayloadValueWritingToolsFeatureDetailsConciseTone");
            v15[3] = (uint64_t)v4;
            getIAPayloadValueWritingToolsFeatureDetailsConciseToneSymbolLoc_ptr = (uint64_t)v4;
          }
          _Block_object_dispose(&v14, 8);
          if (!v4)
          {
            v13 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
            _Block_object_dispose(&v14, 8);
            _Unwind_Resume(v13);
          }
        }
      }
LABEL_30:
      v3 = (__CFString *)*v4;
      break;
    case 8:
      goto LABEL_19;
    case 9:
      goto LABEL_23;
    default:
      goto LABEL_14;
  }
  return v3;
}

- (void)applicationDidEnterBackground
{
  id IASignalAnalyticsClass;
  id *v4;
  void *v5;
  id v6;
  void *v7;
  _Unwind_Exception *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  IASignalAnalyticsClass = getIASignalAnalyticsClass();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v4 = (id *)getIASignalWritingToolsUISuspendedSymbolLoc_ptr;
  v12 = getIASignalWritingToolsUISuspendedSymbolLoc_ptr;
  if (!getIASignalWritingToolsUISuspendedSymbolLoc_ptr)
  {
    v5 = (void *)InputAnalyticsLibrary();
    v4 = (id *)dlsym(v5, "IASignalWritingToolsUISuspended");
    v10[3] = (uint64_t)v4;
    getIASignalWritingToolsUISuspendedSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v9, 8);
  if (!v4)
  {
    v8 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v8);
  }
  v6 = *v4;
  getIAChannelWritingTools();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(IASignalAnalyticsClass, "sendSignal:toChannel:withSessionID:withPayload:", v6, v7, self->_analyticsSessionId, 0, v9);

}

- (void)applicationDidBecomeActive
{
  id *IASignalWritingToolsUIResumedSymbolLoc;
  __CFString *v4;
  id IASignalAnalyticsClass;
  void *v6;

  if (!InputAnalyticsLibraryCore_frameworkLibrary)
    InputAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  if (InputAnalyticsLibraryCore_frameworkLibrary && getIASignalWritingToolsUIResumedSymbolLoc())
  {
    IASignalWritingToolsUIResumedSymbolLoc = (id *)getIASignalWritingToolsUIResumedSymbolLoc();
    if (!IASignalWritingToolsUIResumedSymbolLoc)
      -[WTAnalyticsDelegate init].cold.1();
    v4 = (__CFString *)*IASignalWritingToolsUIResumedSymbolLoc;
  }
  else
  {
    v4 = CFSTR("UIResumed");
  }
  IASignalAnalyticsClass = getIASignalAnalyticsClass();
  getIAChannelWritingTools();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(IASignalAnalyticsClass, "sendSignal:toChannel:withSessionID:withPayload:", v4, v6, self->_analyticsSessionId, 0);

}

- (void)applicationWillTerminate
{
  id IASignalAnalyticsClass;
  id *v4;
  void *v5;
  id v6;
  void *v7;
  _Unwind_Exception *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  IASignalAnalyticsClass = getIASignalAnalyticsClass();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v4 = (id *)getIASignalWritingToolsUITerminatedSymbolLoc_ptr;
  v12 = getIASignalWritingToolsUITerminatedSymbolLoc_ptr;
  if (!getIASignalWritingToolsUITerminatedSymbolLoc_ptr)
  {
    v5 = (void *)InputAnalyticsLibrary();
    v4 = (id *)dlsym(v5, "IASignalWritingToolsUITerminated");
    v10[3] = (uint64_t)v4;
    getIASignalWritingToolsUITerminatedSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v9, 8);
  if (!v4)
  {
    v8 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v8);
  }
  v6 = *v4;
  getIAChannelWritingTools();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(IASignalAnalyticsClass, "sendSignal:toChannel:withSessionID:withPayload:", v6, v7, self->_analyticsSessionId, 0, v9);

}

- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4
{
  id v5;
  id v6;

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[WTAnalyticsDelegate setProofreadingSuggestions:](self, "setProofreadingSuggestions:", v5);

  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[WTAnalyticsDelegate setUuidSuggestionMapping:](self, "setUuidSuggestionMapping:", v6);

  -[WTAnalyticsDelegate setRefreshIndex:](self, "setRefreshIndex:", 0);
}

- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSUUID *v34;
  void *v35;
  void *v36;
  id *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  NSUUID *analyticsSessionId;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  id v55;
  id IASignalAnalyticsClass;
  id v58;
  id obj;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[3];
  id v67;
  id v68;
  __CFString *v69;
  uint8_t v70[128];
  _BYTE buf[24];
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v53 = v5;
  v54 = objc_msgSend(v5, "type");
  v52 = objc_msgSend(v5, "compositionSessionType");
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v61;
    v9 = &stru_251C07D50;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v61 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "range", v52);
        objc_msgSend(v11, "range");
        v14 = v13;
        objc_msgSend(v11, "attributedText");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "string");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = v14 + v12 < (unint64_t)objc_msgSend(v16, "length");

        objc_msgSend(v11, "attributedText");
        v17 = objc_claimAutoreleasedReturnValue();
        -[NSObject string](v17, "string");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_DWORD)v12)
        {
          v19 = objc_msgSend(v11, "range");
          objc_msgSend(v18, "substringWithRange:", v19, v20);
          v21 = objc_claimAutoreleasedReturnValue();

          v18 = (void *)v21;
        }
        else
        {

          WTIAWritingToolsLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v23 = objc_msgSend(v11, "range");
            objc_msgSend(v11, "range");
            v25 = v24;
            objc_msgSend(v11, "attributedText");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "string");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "length");
            *(_DWORD *)buf = 134218496;
            *(_QWORD *)&buf[4] = v23;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v25;
            *(_WORD *)&buf[22] = 2048;
            v72 = v28;
            _os_log_error_impl(&dword_24A7CB000, v17, OS_LOG_TYPE_ERROR, "context.range (%lu, %lu) out of bounds (%lu)!", buf, 0x20u);

          }
        }

        if (v18)
        {
          -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v18);
          v22 = objc_claimAutoreleasedReturnValue();

          v9 = (__CFString *)v22;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    }
    while (v7);
  }
  else
  {
    v9 = &stru_251C07D50;
  }

  if (-[WTAnalyticsDelegate fromCandidateBar](self, "fromCandidateBar"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v29 = (id *)getIAPayloadValueWritingToolsUICandidateBarSymbolLoc_ptr;
    v72 = getIAPayloadValueWritingToolsUICandidateBarSymbolLoc_ptr;
    if (!getIAPayloadValueWritingToolsUICandidateBarSymbolLoc_ptr)
    {
      v30 = (void *)InputAnalyticsLibrary();
      v29 = (id *)dlsym(v30, "IAPayloadValueWritingToolsUICandidateBar");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v29;
      getIAPayloadValueWritingToolsUICandidateBarSymbolLoc_ptr = (uint64_t)v29;
    }
    _Block_object_dispose(buf, 8);
    if (!v29)
      goto LABEL_42;
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v29 = (id *)getIAPayloadValueWritingToolsUIPanelSymbolLoc_ptr;
    v72 = getIAPayloadValueWritingToolsUIPanelSymbolLoc_ptr;
    if (!getIAPayloadValueWritingToolsUIPanelSymbolLoc_ptr)
    {
      v31 = (void *)InputAnalyticsLibrary();
      v29 = (id *)dlsym(v31, "IAPayloadValueWritingToolsUIPanel");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v29;
      getIAPayloadValueWritingToolsUIPanelSymbolLoc_ptr = (uint64_t)v29;
    }
    _Block_object_dispose(buf, 8);
    if (!v29)
    {
LABEL_42:
      -[WTAnalyticsDelegate init].cold.1();
      __break(1u);
    }
  }
  v58 = *v29;
  if (v54 == 2)
  {
    getIAPayloadValueWritingToolsFeatureUnspecified();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)v42;
    if ((unint64_t)(v52 - 6) < 4)
    {
      getIAPayloadValueWritingToolsFeatureTransform();
      v44 = objc_claimAutoreleasedReturnValue();
    }
    else if ((unint64_t)(v52 - 2) >= 3)
    {
      if (v52 != 1)
      {
        v32 = v42;
        goto LABEL_37;
      }
      getIAPayloadValueWritingToolsFeatureRewrite();
      v44 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      getIAPayloadValueWritingToolsFeatureAdjust();
      v44 = objc_claimAutoreleasedReturnValue();
    }
    v32 = v44;

LABEL_37:
    IASignalAnalyticsClass = getIASignalAnalyticsClass();
    getIASignalWritingToolsActionSelected();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    getIAChannelWritingTools();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    analyticsSessionId = self->_analyticsSessionId;
    getIAPayloadKeyWritingToolsUI();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v48;
    v65[0] = v58;
    getIAPayloadKeyWritingToolsFeature();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v64[1] = v49;
    v65[1] = v32;
    getIAPayloadKeyWritingToolsInputText();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v64[2] = v50;
    v65[2] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 3);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(IASignalAnalyticsClass, "sendSignal:toChannel:withSessionID:withPayload:", v45, v46, analyticsSessionId, v51);

    goto LABEL_38;
  }
  if (v54 == 1)
  {
    v55 = getIASignalAnalyticsClass();
    getIASignalWritingToolsActionSelected();
    v32 = objc_claimAutoreleasedReturnValue();
    getIAChannelWritingTools();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = self->_analyticsSessionId;
    getIAPayloadKeyWritingToolsUI();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v35;
    v67 = v58;
    getIAPayloadKeyWritingToolsFeature();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v36;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v37 = (id *)getIAPayloadValueWritingToolsFeatureProofreadSymbolLoc_ptr;
    v72 = getIAPayloadValueWritingToolsFeatureProofreadSymbolLoc_ptr;
    if (!getIAPayloadValueWritingToolsFeatureProofreadSymbolLoc_ptr)
    {
      v38 = (void *)InputAnalyticsLibrary();
      v37 = (id *)dlsym(v38, "IAPayloadValueWritingToolsFeatureProofread");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v37;
      getIAPayloadValueWritingToolsFeatureProofreadSymbolLoc_ptr = (uint64_t)v37;
    }
    _Block_object_dispose(buf, 8);
    if (!v37)
      goto LABEL_42;
    v68 = *v37;
    v39 = v68;
    getIAPayloadKeyWritingToolsInputText();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v66[2] = v40;
    v69 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, v66, 3);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "sendSignal:toChannel:withSessionID:withPayload:", v32, v33, v34, v41);

  }
  else
  {
    WTIAWritingToolsLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[WTAnalyticsDelegate didBeginWritingToolsSession:contexts:].cold.2();
  }
LABEL_38:

}

- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4
{
  id v6;
  id v7;
  id *v8;
  void *v9;
  void *v10;
  id *IAPayloadValueWritingToolsInteractionTypeShowRewrittenSymbolLoc;
  id *IAPayloadValueWritingToolsInteractionTypeRetrySymbolLoc;
  __CFString *v13;
  NSObject *v14;
  void *v15;
  NSUUID *v16;
  void *v17;
  id *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  NSUUID *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  id IASignalAnalyticsClass;
  void *v32;
  NSUUID *analyticsSessionId;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  __CFString *v38;
  _QWORD v39[2];
  _QWORD v40[2];
  void *v41;
  __CFString *v42;
  void *v43;
  id v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(v6, "type") == 2)
  {
    getIAPayloadValueWritingToolsUIRewritingView();
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    *(_QWORD *)&v45 = 0;
    *((_QWORD *)&v45 + 1) = &v45;
    v46 = 0x2020000000;
    v8 = (id *)getIAPayloadValueWritingToolsUIProofreadingViewSymbolLoc_ptr;
    v47 = getIAPayloadValueWritingToolsUIProofreadingViewSymbolLoc_ptr;
    if (!getIAPayloadValueWritingToolsUIProofreadingViewSymbolLoc_ptr)
    {
      v9 = (void *)InputAnalyticsLibrary();
      v8 = (id *)dlsym(v9, "IAPayloadValueWritingToolsUIProofreadingView");
      *(_QWORD *)(*((_QWORD *)&v45 + 1) + 24) = v8;
      getIAPayloadValueWritingToolsUIProofreadingViewSymbolLoc_ptr = (uint64_t)v8;
    }
    _Block_object_dispose(&v45, 8);
    if (!v8)
      goto LABEL_37;
    v7 = *v8;
  }
  v10 = v7;
  if (!InputAnalyticsLibraryCore_frameworkLibrary)
  {
    v45 = xmmword_251C07130;
    v46 = 0;
    InputAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (InputAnalyticsLibraryCore_frameworkLibrary
    && getIAPayloadValueWritingToolsInteractionTypeShowRewrittenSymbolLoc())
  {
    IAPayloadValueWritingToolsInteractionTypeShowRewrittenSymbolLoc = (id *)getIAPayloadValueWritingToolsInteractionTypeShowRewrittenSymbolLoc();
    if (!IAPayloadValueWritingToolsInteractionTypeShowRewrittenSymbolLoc)
      goto LABEL_37;
    v38 = (__CFString *)*IAPayloadValueWritingToolsInteractionTypeShowRewrittenSymbolLoc;
  }
  else
  {
    v38 = CFSTR("ShowRewritten");
  }
  if (!InputAnalyticsLibraryCore_frameworkLibrary)
  {
    v45 = xmmword_251C07130;
    v46 = 0;
    InputAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (InputAnalyticsLibraryCore_frameworkLibrary && getIAPayloadValueWritingToolsInteractionTypeRetrySymbolLoc())
  {
    IAPayloadValueWritingToolsInteractionTypeRetrySymbolLoc = (id *)getIAPayloadValueWritingToolsInteractionTypeRetrySymbolLoc();
    if (!IAPayloadValueWritingToolsInteractionTypeRetrySymbolLoc)
      goto LABEL_37;
    v13 = (__CFString *)*IAPayloadValueWritingToolsInteractionTypeRetrySymbolLoc;
  }
  else
  {
    v13 = CFSTR("Retry");
  }
  if (a4 == 3)
  {
    -[WTAnalyticsDelegate setRefreshIndex:](self, "setRefreshIndex:", -[WTAnalyticsDelegate refreshIndex](self, "refreshIndex") + 1);
    getIAPayloadValueWritingToolsUIRewritingView();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v10 == v28;

    if (!v29)
    {
      WTIAWritingToolsLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[WTAnalyticsDelegate writingToolsSession:didReceiveAction:].cold.3((uint64_t)v10, v30);

    }
    IASignalAnalyticsClass = getIASignalAnalyticsClass();
    getIASignalWritingToolsButtonTapped();
    v14 = objc_claimAutoreleasedReturnValue();
    getIAChannelWritingTools();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    analyticsSessionId = self->_analyticsSessionId;
    getIAPayloadKeyWritingToolsUI();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v34;
    v40[0] = v10;
    getIAPayloadKeyWritingToolsInteractionType();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v35;
    v40[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(IASignalAnalyticsClass, "sendSignal:toChannel:withSessionID:withPayload:", v14, v32, analyticsSessionId, v36);

  }
  else
  {
    if (a4 == 2)
    {
      v23 = getIASignalAnalyticsClass();
      getIASignalWritingToolsButtonTapped();
      v14 = objc_claimAutoreleasedReturnValue();
      getIAChannelWritingTools();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = self->_analyticsSessionId;
      getIAPayloadKeyWritingToolsInteractionType();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v26;
      v42 = v38;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sendSignal:toChannel:withSessionID:withPayload:", v14, v24, v25, v27);

      goto LABEL_36;
    }
    if (a4 == 1)
    {
      v37 = getIASignalAnalyticsClass();
      getIASignalWritingToolsButtonTapped();
      v14 = objc_claimAutoreleasedReturnValue();
      getIAChannelWritingTools();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = self->_analyticsSessionId;
      getIAPayloadKeyWritingToolsInteractionType();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v17;
      *(_QWORD *)&v45 = 0;
      *((_QWORD *)&v45 + 1) = &v45;
      v46 = 0x2020000000;
      v18 = (id *)getIAPayloadValueWritingToolsInteractionTypeShowOriginalSymbolLoc_ptr;
      v47 = getIAPayloadValueWritingToolsInteractionTypeShowOriginalSymbolLoc_ptr;
      if (!getIAPayloadValueWritingToolsInteractionTypeShowOriginalSymbolLoc_ptr)
      {
        v19 = (void *)InputAnalyticsLibrary();
        v18 = (id *)dlsym(v19, "IAPayloadValueWritingToolsInteractionTypeShowOriginal");
        *(_QWORD *)(*((_QWORD *)&v45 + 1) + 24) = v18;
        getIAPayloadValueWritingToolsInteractionTypeShowOriginalSymbolLoc_ptr = (uint64_t)v18;
      }
      _Block_object_dispose(&v45, 8);
      if (v18)
      {
        v44 = *v18;
        v20 = (void *)MEMORY[0x24BDBCE70];
        v21 = v44;
        objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "sendSignal:toChannel:withSessionID:withPayload:", v14, v15, v16, v22);

        goto LABEL_36;
      }
LABEL_37:
      -[WTAnalyticsDelegate init].cold.1();
      __break(1u);
    }
    WTIAWritingToolsLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[WTAnalyticsDelegate writingToolsSession:didReceiveAction:].cold.1();
  }
LABEL_36:

}

- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  NSUUID *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSUUID *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSUUID *analyticsSessionId;
  id IASignalAnalyticsClass;
  void *v58;
  __CFString *v59;
  NSUUID *v60;
  id v61;
  NSObject *v62;
  id v63;
  id v64;
  void *v65;
  _QWORD v66[2];
  _QWORD v67[2];
  void *v68;
  _QWORD v69[3];
  _QWORD v70[3];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[3];
  _QWORD v74[3];
  _BYTE buf[24];
  uint64_t v76;

  v4 = a4;
  v76 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(v6, "type") == 1)
  {
    v61 = v6;
    v62 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[WTAnalyticsDelegate proofreadingSuggestions](self, "proofreadingSuggestions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    v10 = 0;
    if (v9)
    {
      v11 = 0;
      do
      {
        if (v4)
        {
          -[WTAnalyticsDelegate proofreadingSuggestions](self, "proofreadingSuggestions");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "state");

          if (v14 == 3)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
            v15 = objc_claimAutoreleasedReturnValue();
            v17 = v7;
            goto LABEL_13;
          }
          if (v14 == 1)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
            v15 = objc_claimAutoreleasedReturnValue();
            v17 = v62;
LABEL_13:
            -[NSObject addObject:](v17, "addObject:", v15);
            v10 = 1;
            goto LABEL_16;
          }
          if (v14)
          {
            WTIAWritingToolsLog();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              -[WTAnalyticsDelegate proofreadingSuggestions](self, "proofreadingSuggestions");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectAtIndexedSubscript:", v11);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "state");
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)&buf[4] = v22;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v11;
              _os_log_error_impl(&dword_24A7CB000, v15, OS_LOG_TYPE_ERROR, "didEndWritingToolsSession: Unexpected proofreading suggestion state %lu for index %lu", buf, 0x16u);

            }
            goto LABEL_16;
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v62;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v7;
        }
        -[NSObject addObject:](v16, "addObject:", v15);
LABEL_16:

        ++v11;
        -[WTAnalyticsDelegate proofreadingSuggestions](self, "proofreadingSuggestions");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

      }
      while (v11 < v19);
    }
    v24 = v62;
    if (-[NSObject count](v62, "count"))
    {
      if (!InputAnalyticsLibraryCore_frameworkLibrary)
      {
        *(_OWORD *)buf = xmmword_251C07130;
        *(_QWORD *)&buf[16] = 0;
        InputAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
      }
      if (InputAnalyticsLibraryCore_frameworkLibrary
        && getIAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc())
      {
        getIAPayloadValueWritingToolsInteractionTypeUnspecified();
        v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v59 = CFSTR("Unspecified");
      }
      IASignalAnalyticsClass = getIASignalAnalyticsClass();
      getIASignalWritingToolsResultsAccepted();
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      getIAChannelWritingTools();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      analyticsSessionId = self->_analyticsSessionId;
      getIAPayloadKeyWritingToolsAcceptedAll();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v73[0] = v26;
      v27 = (void *)MEMORY[0x24BDD16E0];
      if ((v10 & 1) != 0)
      {
        v28 = 0;
      }
      else
      {
        v29 = -[NSObject count](v62, "count");
        -[WTAnalyticsDelegate proofreadingSuggestions](self, "proofreadingSuggestions");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v29 == objc_msgSend(v55, "count");
      }
      objc_msgSend(v27, "numberWithInt:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = v30;
      getIAPayloadKeyWritingToolsResultIndices();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v73[1] = v31;
      v74[1] = v62;
      getIAPayloadKeyWritingToolsInteractionType();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v73[2] = v32;
      v74[2] = v59;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, v73, 3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(IASignalAnalyticsClass, "sendSignal:toChannel:withSessionID:withPayload:", v58, v25, analyticsSessionId, v33);

      if ((v10 & 1) == 0)
      v24 = v62;
    }
    if (-[NSObject count](v7, "count"))
    {
      v34 = getIASignalAnalyticsClass();
      getIASignalWritingToolsResultsRejected();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      getIAChannelWritingTools();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = self->_analyticsSessionId;
      getIAPayloadKeyWritingToolsRejectedAll();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = v38;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", !v4);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v72[0] = v39;
      getIAPayloadKeyWritingToolsResultIndices();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v71[1] = v40;
      v72[1] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "sendSignal:toChannel:withSessionID:withPayload:", v35, v36, v37, v41);

      v24 = v62;
    }
    goto LABEL_46;
  }
  if (objc_msgSend(v6, "type") == 2)
  {
    v61 = v6;
    if (v4)
    {
      if (!InputAnalyticsLibraryCore_frameworkLibrary)
      {
        *(_OWORD *)buf = xmmword_251C07130;
        *(_QWORD *)&buf[16] = 0;
        InputAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
      }
      if (InputAnalyticsLibraryCore_frameworkLibrary
        && getIAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc())
      {
        getIAPayloadValueWritingToolsInteractionTypeUnspecified();
        v23 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = CFSTR("Unspecified");
      }
      v64 = getIASignalAnalyticsClass();
      getIASignalWritingToolsResultsAccepted();
      v7 = objc_claimAutoreleasedReturnValue();
      getIAChannelWritingTools();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = self->_analyticsSessionId;
      getIAPayloadKeyWritingToolsAcceptedAll();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v69[0] = v49;
      v70[0] = MEMORY[0x24BDBD1C0];
      getIAPayloadKeyWritingToolsResultIndices();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v69[1] = v50;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[WTAnalyticsDelegate refreshIndex](self, "refreshIndex"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v51;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v68, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v70[1] = v52;
      getIAPayloadKeyWritingToolsInteractionType();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v69[2] = v53;
      v70[2] = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, v69, 3);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "sendSignal:toChannel:withSessionID:withPayload:", v7, v43, v60, v54);

      v24 = v23;
    }
    else
    {
      v63 = getIASignalAnalyticsClass();
      getIASignalWritingToolsResultsRejected();
      v24 = objc_claimAutoreleasedReturnValue();
      getIAChannelWritingTools();
      v7 = objc_claimAutoreleasedReturnValue();
      v42 = self->_analyticsSessionId;
      getIAPayloadKeyWritingToolsRejectedAll();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = v43;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v44;
      getIAPayloadKeyWritingToolsResultIndices();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v66[1] = v45;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[WTAnalyticsDelegate refreshIndex](self, "refreshIndex"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v46;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v65, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v67[1] = v47;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "sendSignal:toChannel:withSessionID:withPayload:", v24, v7, v42, v48);

    }
LABEL_46:

    v6 = v61;
    goto LABEL_47;
  }
  WTIAWritingToolsLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    -[WTAnalyticsDelegate didEndWritingToolsSession:accepted:].cold.1(v6, v24);
LABEL_47:

  -[WTAnalyticsDelegate setProofreadingSuggestions:](self, "setProofreadingSuggestions:", 0);
  -[WTAnalyticsDelegate setUuidSuggestionMapping:](self, "setUuidSuggestionMapping:", 0);

}

- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  _BOOL4 v7;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id IASignalAnalyticsClass;
  void *v14;
  void *v15;
  NSUUID *analyticsSessionId;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  void *v33;
  _QWORD v34[2];

  v7 = a7;
  v34[1] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  -[WTAnalyticsDelegate proofreadingSuggestions](self, "proofreadingSuggestions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v9);

  if (v7)
  {
    -[WTAnalyticsDelegate proofreadingSuggestions](self, "proofreadingSuggestions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    IASignalAnalyticsClass = getIASignalAnalyticsClass();
    getIASignalWritingToolsResultsOffered();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    getIAChannelWritingTools();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    analyticsSessionId = self->_analyticsSessionId;
    getIAPayloadKeyWritingToolsNumResultsOffered();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v17;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(IASignalAnalyticsClass, "sendSignal:toChannel:withSessionID:withPayload:", v14, v15, analyticsSessionId, v19);

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v20 = v9;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v29;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v24);
        -[WTAnalyticsDelegate uuidSuggestionMapping](self, "uuidSuggestionMapping", (_QWORD)v28);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "uuid");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, v27);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v22);
  }

}

- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6
{
  id v8;
  void *v9;
  id v10;

  v8 = a5;
  -[WTAnalyticsDelegate uuidSuggestionMapping](self, "uuidSuggestionMapping");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setState:", a4);
}

- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  unint64_t v13;
  id *IAPayloadKeyWritingToolsResultTextSymbolLoc;
  void *v15;
  void *v16;
  NSUUID *analyticsSessionId;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id IASignalAnalyticsClass;
  id v28;
  __CFString *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  __CFString *v34;
  _QWORD v35[3];
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v7 = a7;
  v39 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  v11 = a4;
  v12 = a6;
  if (v7)
  {
    v28 = v12;
    v30 = v11;
    v13 = -[WTAnalyticsDelegate refreshIndex](self, "refreshIndex");
    if (!InputAnalyticsLibraryCore_frameworkLibrary)
    {
      v36 = xmmword_251C07130;
      v37 = 0;
      InputAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (InputAnalyticsLibraryCore_frameworkLibrary && getIAPayloadKeyWritingToolsResultTextSymbolLoc())
    {
      IAPayloadKeyWritingToolsResultTextSymbolLoc = (id *)getIAPayloadKeyWritingToolsResultTextSymbolLoc();
      if (!IAPayloadKeyWritingToolsResultTextSymbolLoc)
      {
        -[WTAnalyticsDelegate init].cold.1();
        goto LABEL_16;
      }
      v29 = (__CFString *)*IAPayloadKeyWritingToolsResultTextSymbolLoc;
    }
    else
    {
      v29 = CFSTR("ResultText");
    }
    IASignalAnalyticsClass = getIASignalAnalyticsClass();
    getIASignalWritingToolsResultsOffered();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    getIAChannelWritingTools();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    analyticsSessionId = self->_analyticsSessionId;
    getIAPayloadKeyWritingToolsNumResultsOffered();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v18;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v19;
    *(_QWORD *)&v36 = 0;
    *((_QWORD *)&v36 + 1) = &v36;
    v37 = 0x2020000000;
    v20 = (id *)getIAPayloadKeyWritingToolsResultIndexSymbolLoc_ptr;
    v38 = getIAPayloadKeyWritingToolsResultIndexSymbolLoc_ptr;
    if (!getIAPayloadKeyWritingToolsResultIndexSymbolLoc_ptr)
    {
      v21 = (void *)InputAnalyticsLibrary();
      v20 = (id *)dlsym(v21, "IAPayloadKeyWritingToolsResultIndex");
      *(_QWORD *)(*((_QWORD *)&v36 + 1) + 24) = v20;
      getIAPayloadKeyWritingToolsResultIndexSymbolLoc_ptr = (uint64_t)v20;
    }
    _Block_object_dispose(&v36, 8);
    if (v20)
    {
      v33 = *v20;
      v22 = (void *)MEMORY[0x24BDD16E0];
      v23 = v33;
      objc_msgSend(v22, "numberWithUnsignedInteger:", v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v24;
      v34 = v29;
      objc_msgSend(v30, "string");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2] = v25;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v32, 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(IASignalAnalyticsClass, "sendSignal:toChannel:withSessionID:withPayload:", v15, v16, analyticsSessionId, v26);

      v12 = v28;
      goto LABEL_13;
    }
    -[WTAnalyticsDelegate init].cold.1();
LABEL_16:
    __break(1u);
  }
LABEL_13:

}

- (void)endWritingTools
{
  id IASignalAnalyticsClass;
  id *v4;
  void *v5;
  id v6;
  void *v7;
  _Unwind_Exception *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  IASignalAnalyticsClass = getIASignalAnalyticsClass();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v4 = (id *)getIASignalWritingToolsPanelDismissedSymbolLoc_ptr;
  v12 = getIASignalWritingToolsPanelDismissedSymbolLoc_ptr;
  if (!getIASignalWritingToolsPanelDismissedSymbolLoc_ptr)
  {
    v5 = (void *)InputAnalyticsLibrary();
    v4 = (id *)dlsym(v5, "IASignalWritingToolsPanelDismissed");
    v10[3] = (uint64_t)v4;
    getIASignalWritingToolsPanelDismissedSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v9, 8);
  if (!v4)
  {
    v8 = (_Unwind_Exception *)-[WTAnalyticsDelegate init].cold.1();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v8);
  }
  v6 = *v4;
  getIAChannelWritingTools();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(IASignalAnalyticsClass, "sendSignal:toChannel:withSessionID:withPayload:", v6, v7, self->_analyticsSessionId, 0, v9);

}

- (BOOL)fromCandidateBar
{
  return self->_fromCandidateBar;
}

- (void)setFromCandidateBar:(BOOL)a3
{
  self->_fromCandidateBar = a3;
}

- (NSUUID)analyticsSessionId
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAnalyticsSessionId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)proofreadingSuggestions
{
  return self->_proofreadingSuggestions;
}

- (void)setProofreadingSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_proofreadingSuggestions, a3);
}

- (NSMutableDictionary)uuidSuggestionMapping
{
  return self->_uuidSuggestionMapping;
}

- (void)setUuidSuggestionMapping:(id)a3
{
  objc_storeStrong((id *)&self->_uuidSuggestionMapping, a3);
}

- (unint64_t)refreshIndex
{
  return self->_refreshIndex;
}

- (void)setRefreshIndex:(unint64_t)a3
{
  self->_refreshIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidSuggestionMapping, 0);
  objc_storeStrong((id *)&self->_proofreadingSuggestions, 0);
  objc_storeStrong((id *)&self->_analyticsSessionId, 0);
}

- (uint64_t)init
{
  NSObject *v0;

  dlerror();
  v0 = abort_report_np();
  return -[WTAnalyticsDelegate init].cold.2(v0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24A7CB000, log, OS_LOG_TYPE_DEBUG, "Begin - WTPanelBringup", v1, 2u);
}

- (void)didBeginWritingToolsSession:contexts:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24A7CB000, v0, v1, "Unsupported session type: %lu", v2);
}

- (void)writingToolsSession:didReceiveAction:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_24A7CB000, v0, OS_LOG_TYPE_DEBUG, "didReceiveAction: %lu ignored", v1, 0xCu);
}

- (void)writingToolsSession:(uint64_t)a1 didReceiveAction:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  void *v4;
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  getIAPayloadValueWritingToolsUIRewritingView();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  v6 = 2048;
  v7 = a1;
  _os_log_error_impl(&dword_24A7CB000, a2, OS_LOG_TYPE_ERROR, "WTActionShowRewritten action performed, expected UI to be rewriting view (%lu) but got %lu", v5, 0x16u);

}

- (void)didEndWritingToolsSession:(void *)a1 accepted:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "type");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24A7CB000, a2, v3, "didEndWritingToolsSession: Unsupported session type: %lu", v4);
}

@end
