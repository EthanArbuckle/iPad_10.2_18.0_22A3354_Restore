@implementation WiFiSoftError

- (WiFiSoftError)initWithName:(id)a3
{
  return -[WiFiSoftError initWithName:andParams:](self, "initWithName:andParams:", a3, 0);
}

- (WiFiSoftError)initWithName:(id)a3 andParams:(id)a4
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  WiFiSoftError *v25;
  WiFiSoftError *v26;
  NSObject *v28;
  dispatch_queue_t v29;
  void *v30;
  os_log_t v31;
  void *v32;
  __objc2_class **p_superclass;
  uint64_t v34;
  void *v35;
  dispatch_source_t v36;
  void *v37;
  NSObject *v38;
  dispatch_time_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  BOOL v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  BOOL v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  BOOL v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  BOOL v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  BOOL v75;
  uint64_t v76;
  __objc2_class *v77;
  void *v78;
  double v79;
  _QWORD *p_enabled;
  void *v81;
  NSString *name;
  void *v83;
  void *v84;
  uint64_t v85;
  NSString *metricEventName;
  _BOOL8 v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  unint64_t v98;
  unint64_t v99;
  void *v100;
  unint64_t v101;
  unint64_t v102;
  int64_t enabled;
  int64_t metricsEnabled;
  int64_t maxOccurrences;
  int64_t metricSubmissionSamplingRate;
  int64_t maxNonUIActions;
  int64_t intervalForMaxNonUIActions;
  int64_t maxUIActions;
  int64_t intervalForMaxUIActions;
  int64_t maxLogMessageLength;
  NSString *v112;
  void *v113;
  id v114;
  objc_super v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint8_t buf[4];
  const char *v121;
  __int16 v122;
  NSString *v123;
  __int16 v124;
  int64_t v125;
  __int16 v126;
  int64_t v127;
  __int16 v128;
  int64_t v129;
  __int16 v130;
  int64_t v131;
  __int16 v132;
  int64_t v133;
  __int16 v134;
  int64_t v135;
  __int16 v136;
  int64_t v137;
  __int16 v138;
  int64_t v139;
  __int16 v140;
  int64_t v141;
  _BYTE v142[128];
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v17 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v17)
      -[WiFiSoftError initWithName:andParams:].cold.6(v17, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_9;
  }
  if ((os_variant_is_recovery() & 1) != 0 || (os_variant_is_darwinos() & 1) != 0 || MGGetBoolAnswer())
  {
    v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v9)
      -[WiFiSoftError initWithName:andParams:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
LABEL_9:
    v25 = 0;
    v26 = self;
    goto LABEL_10;
  }
  v113 = v8;
  v114 = v7;
  if (!queue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = dispatch_queue_create("com.apple.wifi.softerror", v28);
    v30 = (void *)queue;
    queue = (uint64_t)v29;

  }
  if (!logPtr)
  {
    v31 = os_log_create("com.apple.wifi.softerror", ");
    v32 = (void *)logPtr;
    logPtr = (uint64_t)v31;

  }
  p_superclass = TBTileFetchRequestDescriptor.superclass;
  if (!currentSoftErrors)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)currentSoftErrors;
    currentSoftErrors = v34;

  }
  if (!metricTimer)
  {
    v36 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)queue);
    v37 = (void *)metricTimer;
    metricTimer = (uint64_t)v36;

    dispatch_source_set_event_handler((dispatch_source_t)metricTimer, &__block_literal_global_10);
    v38 = metricTimer;
    v39 = dispatch_time(0, 86400000000000);
    dispatch_source_set_timer(v38, v39, 0x4E94914F0000uLL, 0);
    dispatch_activate((dispatch_object_t)metricTimer);
  }
  objc_storeStrong((id *)&self->_name, a3);
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v26 = (WiFiSoftError *)(id)objc_msgSend((id)currentSoftErrors, "copy");
  v40 = -[WiFiSoftError countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v116, v142, 16);
  if (v40)
  {
    v41 = v40;
    v42 = 0;
    v43 = *(_QWORD *)v117;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v117 != v43)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * i), "pointerValue");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "name");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "isEqualToString:", self->_name);

        v42 |= v47;
      }
      v41 = -[WiFiSoftError countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v116, v142, 16);
    }
    while (v41);

    p_superclass = (__objc2_class **)(TBTileFetchRequestDescriptor + 8);
    if ((v42 & 1) != 0)
    {
      v8 = v113;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[WiFiSoftError initWithName:andParams:].cold.5();

      v25 = 0;
      v26 = self;
      v7 = v114;
      goto LABEL_10;
    }
  }
  else
  {

  }
  v115.receiver = self;
  v115.super_class = (Class)WiFiSoftError;
  v25 = -[WiFiSoftError init](&v115, sel_init);
  v8 = v113;
  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("maxOccurrences"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "integerValue");
  v50 = v49 <= -1 || v48 == 0;
  v51 = 100;
  if (!v50)
    v51 = v49;
  v25->_maxOccurrences = v51;
  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("metricSubmissionSamplingRate"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = objc_msgSend(v52, "integerValue");
  v55 = v53 >= 101 || v53 <= -1 || v52 == 0;
  v56 = 30;
  if (!v55)
    v56 = v53;
  v25->_metricSubmissionSamplingRate = v56;
  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("maxNonUIActions"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = objc_msgSend(v57, "integerValue");
  v59 = v58 <= -1 || v57 == 0;
  v60 = 5;
  if (!v59)
    v60 = v58;
  v25->_maxNonUIActions = v60;
  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("intervalForMaxNonUIActions"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = objc_msgSend(v61, "integerValue");
  v63 = v62 <= -1 || v61 == 0;
  v64 = 120;
  if (!v63)
    v64 = v62;
  v25->_intervalForMaxNonUIActions = v64;
  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("maxUIActions"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = objc_msgSend(v65, "integerValue");
  v67 = v66 <= -1 || v65 == 0;
  v68 = 2;
  if (!v67)
    v68 = v66;
  v25->_maxUIActions = v68;
  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("intervalForMaxUIActions"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = objc_msgSend(v69, "integerValue");
  v71 = v70 <= -1 || v69 == 0;
  v72 = 86400;
  if (!v71)
    v72 = v70;
  v25->_intervalForMaxUIActions = v72;
  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("maxLogMessageLength"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  v74 = objc_msgSend(v73, "integerValue");
  v75 = v74 <= -1 || v73 == 0;
  v76 = 1000;
  if (!v75)
    v76 = v74;
  v25->_maxLogMessageLength = v76;
  v77 = p_superclass[458];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v25);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[__objc2_class addObject:](v77, "addObject:", v78);

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v25->_creationDate = v79;
  *(int64x2_t *)&v25->_enabled = vdupq_n_s64(1uLL);
  p_enabled = &v25->_enabled;
  v81 = (void *)MEMORY[0x1E0CB3940];
  name = v25->_name;
  objc_msgSend(MEMORY[0x1E0CB3500], "URLUserAllowedCharacterSet");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](name, "stringByAddingPercentEncodingWithAllowedCharacters:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.wifi.softerror"), v84);
  v85 = objc_claimAutoreleasedReturnValue();
  metricEventName = v25->_metricEventName;
  v25->_metricEventName = (NSString *)v85;

  if ((cloudAssetsQueried & 1) == 0)
  {
    v87 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v87)
      -[WiFiSoftError initWithName:andParams:].cold.4(v87, v88, v89, v90, v91, v92, v93, v94);
    +[WCAFetchWiFiBehaviorParameters fetchWiFiBehaviorWithCompletion:](WCAFetchWiFiBehaviorParameters, "fetchWiFiBehaviorWithCompletion:", &__block_literal_global_36);
    cloudAssetsQueried = 1;
  }
  v7 = v114;
  if (cloudAssets)
  {
    objc_msgSend((id)cloudAssets, "objectForKey:", v25->_name);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v95;
    if (v95)
    {
      objc_msgSend(v95, "objectForKey:", CFSTR("enabled"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend(v97, "integerValue");
      if (v97)
      {
        v99 = v98;
        if (v98 <= 1 && *p_enabled != v98)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[WiFiSoftError initWithName:andParams:].cold.3();
          *p_enabled = v99;
        }
      }
      objc_msgSend(v96, "objectForKey:", CFSTR("metricsEnabled"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();

      v101 = objc_msgSend(v100, "integerValue");
      if (v100)
      {
        v102 = v101;
        if (v101 <= 1 && v25->_metricsEnabled != v101)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[WiFiSoftError initWithName:andParams:].cold.2();
          v25->_metricsEnabled = v102;
        }
      }

    }
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    enabled = v25->_enabled;
    metricsEnabled = v25->_metricsEnabled;
    maxOccurrences = v25->_maxOccurrences;
    metricSubmissionSamplingRate = v25->_metricSubmissionSamplingRate;
    maxNonUIActions = v25->_maxNonUIActions;
    intervalForMaxNonUIActions = v25->_intervalForMaxNonUIActions;
    maxUIActions = v25->_maxUIActions;
    intervalForMaxUIActions = v25->_intervalForMaxUIActions;
    maxLogMessageLength = v25->_maxLogMessageLength;
    v112 = v25->_name;
    *(_DWORD *)buf = 136317698;
    v121 = "-[WiFiSoftError initWithName:andParams:]";
    v122 = 2112;
    v123 = v112;
    v124 = 2048;
    v125 = enabled;
    v126 = 2048;
    v127 = metricsEnabled;
    v128 = 2048;
    v129 = maxOccurrences;
    v130 = 2048;
    v131 = metricSubmissionSamplingRate;
    v132 = 2048;
    v133 = maxNonUIActions;
    v134 = 2048;
    v135 = intervalForMaxNonUIActions;
    v136 = 2048;
    v137 = maxUIActions;
    v138 = 2048;
    v139 = intervalForMaxUIActions;
    v140 = 2048;
    v141 = maxLogMessageLength;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Created SoftError <%@>, enabled <%ld>, metricsEnabled <%ld>, params <%ld, %ld, %ld, %ld, %ld, %ld, %ld>", buf, 0x70u);
  }

LABEL_10:
  return v25;
}

uint64_t __40__WiFiSoftError_initWithName_andParams___block_invoke()
{
  return +[WiFiSoftError _submitSummaryReportMetric](WiFiSoftError, "_submitSummaryReportMetric");
}

uint64_t __40__WiFiSoftError_initWithName_andParams___block_invoke_34(uint64_t a1, uint64_t a2)
{
  return +[WiFiSoftError _cloudAssetsFetchHandler:](WiFiSoftError, "_cloudAssetsFetchHandler:", a2);
}

- (void)dealloc
{
  NSString *name;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    *(_DWORD *)buf = 136315394;
    v10 = "-[WiFiSoftError dealloc]";
    v11 = 2112;
    v12 = name;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Dealloc SoftError <%@>", buf, 0x16u);
  }
  if (self->_hudTimestamps)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[WiFiSoftError dealloc]";
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Clearing HUD...", buf, 0xCu);
    }
    +[WiFiSoftError _updateHUDWithMessage:](WiFiSoftError, "_updateHUDWithMessage:", 0);
  }
  v4 = (void *)currentSoftErrors;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v5);

  if (!objc_msgSend((id)currentSoftErrors, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[WiFiSoftError dealloc]";
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Final dealloc", buf, 0xCu);
    }
    if (metricTimer)
    {
      dispatch_source_cancel((dispatch_source_t)metricTimer);
      v6 = (void *)metricTimer;
      metricTimer = 0;

    }
    if (hudTimer)
    {
      dispatch_source_cancel((dispatch_source_t)hudTimer);
      v7 = (void *)hudTimer;
      hudTimer = 0;

    }
  }
  v8.receiver = self;
  v8.super_class = (Class)WiFiSoftError;
  -[WiFiSoftError dealloc](&v8, sel_dealloc);
}

- (id)incrementCount
{
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  v13 = 0;
  if (_os_feature_enabled_impl() && !MGGetBoolAnswer())
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __31__WiFiSoftError_incrementCount__block_invoke;
    v7[3] = &unk_1E881D700;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync((dispatch_queue_t)queue, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v9[5];
    v9[5] = v3;

  }
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __31__WiFiSoftError_incrementCount__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v3 = a1 + 32;
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 72))
  {
    v4 = objc_msgSend(*(id *)(v2 + 96), "count");
    v5 = *(_QWORD **)v3;
    if (v4 >= *(_QWORD *)(*(_QWORD *)v3 + 8))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 12, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __31__WiFiSoftError_incrementCount__block_invoke_cold_1();
    }
    else
    {
      v6 = v5[12];
      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(void **)(*(_QWORD *)v3 + 96);
        *(_QWORD *)(*(_QWORD *)v3 + 96) = v7;

        v5 = *(_QWORD **)v3;
        v6 = *(_QWORD *)(*(_QWORD *)v3 + 96);
      }
      objc_msgSend(v5, "_recordCurrentTimestampIn:", v6);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 82, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

- (void)resetCount
{
  _QWORD block[5];

  if (_os_feature_enabled_impl())
  {
    if ((MGGetBoolAnswer() & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __27__WiFiSoftError_resetCount__block_invoke;
      block[3] = &unk_1E881C8E8;
      block[4] = self;
      dispatch_sync((dispatch_queue_t)queue, block);
    }
  }
}

uint64_t __27__WiFiSoftError_resetCount__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetCount");
}

- (int64_t)count
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = -1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __22__WiFiSoftError_count__block_invoke;
  v4[3] = &unk_1E881D700;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)queue, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

_QWORD *__22__WiFiSoftError_count__block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[9])
  {
    result = (_QWORD *)objc_msgSend(result, "_countOf:withinInterval:", result[12], 9.22337204e18);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (int64_t)recentCountWithinTimeInterval:(double)a3
{
  int64_t v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = -1;
  if (_os_feature_enabled_impl() && !MGGetBoolAnswer())
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__WiFiSoftError_recentCountWithinTimeInterval___block_invoke;
    block[3] = &unk_1E881E138;
    block[4] = self;
    block[5] = &v8;
    *(double *)&block[6] = a3;
    dispatch_sync((dispatch_queue_t)queue, block);
  }
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

_QWORD *__47__WiFiSoftError_recentCountWithinTimeInterval___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[9])
  {
    result = (_QWORD *)objc_msgSend(result, "_countOf:withinInterval:", result[12], *(double *)(a1 + 48));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (id)appendLogMessage:(id)a3 includeTimestamp:(BOOL)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6;
  v20 = __Block_byref_object_dispose__6;
  v21 = 0;
  if (_os_feature_enabled_impl() && !MGGetBoolAnswer())
  {
    v10 = queue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__WiFiSoftError_appendLogMessage_includeTimestamp___block_invoke;
    v12[3] = &unk_1E881E160;
    v12[4] = self;
    v15 = a4;
    v13 = v6;
    v14 = &v16;
    dispatch_sync(v10, v12);
    v9 = (id)v17[5];

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v17[5];
    v17[5] = v7;

    v9 = (id)v17[5];
  }
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __51__WiFiSoftError_appendLogMessage_includeTimestamp___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v3 = a1 + 32;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[9])
  {
    v4 = (void *)v2[14];
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("[name <%@>] "), v2[8]);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(*(_QWORD *)v3 + 112);
      *(_QWORD *)(*(_QWORD *)v3 + 112) = v5;

      v4 = *(void **)(*(_QWORD *)v3 + 112);
    }
    v7 = objc_msgSend(v4, "length");
    v8 = objc_msgSend(*(id *)(a1 + 40), "length");
    v9 = *(_QWORD *)(a1 + 32);
    if ((unint64_t)(v8 + v7) >= *(_QWORD *)(v9 + 56))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 12, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __51__WiFiSoftError_appendLogMessage_includeTimestamp___block_invoke_cold_1();
    }
    else if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "appendFormat:", CFSTR("[date <%@> logStr <%@>] "), v16, *(_QWORD *)(a1 + 40));

    }
    else
    {
      objc_msgSend(*(id *)(v9 + 112), "appendFormat:", CFSTR("[logStr <%@>] "), *(_QWORD *)(a1 + 40));
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 82, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (NSMutableString)logMessage
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  if (_os_feature_enabled_impl() && !MGGetBoolAnswer())
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __27__WiFiSoftError_logMessage__block_invoke;
    v5[3] = &unk_1E881D700;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync((dispatch_queue_t)queue, v5);
  }
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableString *)v3;
}

void __27__WiFiSoftError_logMessage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 72))
  {
    v3 = objc_msgSend(*(id *)(v1 + 112), "copy");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (void)clearLogMessage
{
  _QWORD block[5];

  if (_os_feature_enabled_impl())
  {
    if ((MGGetBoolAnswer() & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __32__WiFiSoftError_clearLogMessage__block_invoke;
      block[3] = &unk_1E881C8E8;
      block[4] = self;
      dispatch_sync((dispatch_queue_t)queue, block);
    }
  }
}

void __32__WiFiSoftError_clearLogMessage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 72))
  {
    v2 = *(void **)(v1 + 112);
    *(_QWORD *)(v1 + 112) = 0;

  }
}

- (void)writeLogMessage
{
  _QWORD block[5];

  if (_os_feature_enabled_impl())
  {
    if ((MGGetBoolAnswer() & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __32__WiFiSoftError_writeLogMessage__block_invoke;
      block[3] = &unk_1E881C8E8;
      block[4] = self;
      dispatch_sync((dispatch_queue_t)queue, block);
    }
  }
}

void __32__WiFiSoftError_writeLogMessage__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    v2 = (void *)logPtr;
    if (os_log_type_enabled((os_log_t)logPtr, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(v3 + 112);
      v5 = *(void **)(v3 + 96);
      v6 = v2;
      v7 = 138412546;
      v8 = v4;
      v9 = 2048;
      v10 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1CC44E000, v6, OS_LOG_TYPE_DEFAULT, "%@ [count <%ld>]", (uint8_t *)&v7, 0x16u);

    }
  }
}

- (id)submitMetric
{
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  v13 = 0;
  if (_os_feature_enabled_impl()
    && ((MEMORY[0x1E0D15430] != 0) & ~MGGetBoolAnswer()) != 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __29__WiFiSoftError_submitMetric__block_invoke;
    v7[3] = &unk_1E881D700;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync((dispatch_queue_t)queue, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v9[5];
    v9[5] = v3;

  }
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __29__WiFiSoftError_submitMetric__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 72) && *(_QWORD *)(v2 + 80))
  {
    if (*((_QWORD *)*v3 + 2) <= (uint64_t)arc4random_uniform(0x64u))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 35, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __29__WiFiSoftError_submitMetric__block_invoke_cold_1();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.wifi.softerror"), CFSTR("generic"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(*v3, "_addGenericMetricData:", v5);
      if (objc_msgSend(v5, "count"))
      {
        objc_msgSend(v5, "setObject:forKey:", *((_QWORD *)*v3 + 8), CFSTR("name"));
        v13 = v5;
        AnalyticsSendEventLazy();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v6 = (void *)*((_QWORD *)*v3 + 8);
          *(_DWORD *)buf = 136315650;
          v15 = "-[WiFiSoftError submitMetric]_block_invoke_2";
          v16 = 2112;
          v17 = v6;
          v18 = 2112;
          v19 = v4;
          _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: SoftError <%@> submitted metric <%@>", buf, 0x20u);
        }

      }
      if (os_log_type_enabled(MEMORY[0x1E0C81030], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[WiFiSoftError submitMetric]_block_invoke";
        v16 = 2112;
        v17 = v5;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81030], OS_LOG_TYPE_DEFAULT, "%s: SoftError metric dictionary <%@>", buf, 0x16u);
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 82, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

id __29__WiFiSoftError_submitMetric__block_invoke_57(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)submitMetricWithData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = 0;
  if (_os_feature_enabled_impl()
    && ((MEMORY[0x1E0D15430] != 0) & ~MGGetBoolAnswer()) != 0)
  {
    v8 = queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__WiFiSoftError_submitMetricWithData___block_invoke;
    block[3] = &unk_1E881E188;
    block[4] = self;
    v12 = &v13;
    v11 = v4;
    dispatch_sync(v8, block);
    v7 = (id)v14[5];

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v14[5];
    v14[5] = v5;

    v7 = (id)v14[5];
  }
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __38__WiFiSoftError_submitMetricWithData___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 4);
  v2 = a1[4];
  if (*(_QWORD *)(v2 + 72) && *(_QWORD *)(v2 + 80))
  {
    if (*((_QWORD *)*v3 + 2) <= (uint64_t)arc4random_uniform(0x64u))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 35, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1[6] + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __38__WiFiSoftError_submitMetricWithData___block_invoke_cold_1();
    }
    else
    {
      if (a1[5])
        v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", a1[5]);
      else
        v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = v4;
      objc_msgSend(*v3, "_addGenericMetricData:", v4);
      if (objc_msgSend(v11, "count"))
      {
        objc_msgSend(v11, "setObject:forKey:", *((_QWORD *)*v3 + 8), CFSTR("name"));
        v14 = v11;
        AnalyticsSendEventLazy();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v12 = (void *)*((_QWORD *)*v3 + 8);
          v13 = *((_QWORD *)*v3 + 15);
          *(_DWORD *)buf = 136315650;
          v16 = "-[WiFiSoftError submitMetricWithData:]_block_invoke_2";
          v17 = 2112;
          v18 = v12;
          v19 = 2112;
          v20 = v13;
          _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: SoftError <%@> submitted metric <%@>", buf, 0x20u);
        }

      }
      if (os_log_type_enabled(MEMORY[0x1E0C81030], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "-[WiFiSoftError submitMetricWithData:]_block_invoke";
        v17 = 2112;
        v18 = v11;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81030], OS_LOG_TYPE_DEFAULT, "%s: SoftError metric dictionary <%@>", buf, 0x16u);
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 82, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

id __38__WiFiSoftError_submitMetricWithData___block_invoke_60(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)submitABCReportWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = 0;
  if (_os_feature_enabled_impl() && (MGGetBoolAnswer() & 1) == 0 && objc_opt_class())
  {
    v5 = queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__WiFiSoftError_submitABCReportWithReason___block_invoke;
    block[3] = &unk_1E881E188;
    block[4] = self;
    v12 = &v13;
    v11 = v4;
    dispatch_sync(v5, block);
    v6 = (id)v14[5];

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v14[5];
    v14[5] = v7;

    v6 = (id)v14[5];
  }
  _Block_object_dispose(&v13, 8);

  return v6;
}

void __43__WiFiSoftError_submitABCReportWithReason___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];

  v3 = a1 + 4;
  v2 = (_QWORD *)a1[4];
  if (v2[9])
  {
    if (objc_msgSend(v2, "_maxNonUIActionsReachedFor:", v2[17]))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 35, 0);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1[6] + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __43__WiFiSoftError_submitABCReportWithReason___block_invoke_cold_1();
    }
    else
    {
      v10 = *v3;
      v11 = *(void **)(*v3 + 128);
      if (!v11)
      {
        v12 = objc_alloc_init(MEMORY[0x1E0DAFF20]);
        v13 = *(void **)(*v3 + 128);
        *(_QWORD *)(*v3 + 128) = v12;

        v10 = *v3;
        v11 = *(void **)(*v3 + 128);
      }
      v14 = *(_QWORD *)(v10 + 64);
      v15 = a1[5];
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "processName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("WiFi"), CFSTR("SoftError"), v14, v15, v17, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = a1[4];
      v20 = *(void **)(v19 + 128);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __43__WiFiSoftError_submitABCReportWithReason___block_invoke_68;
      v25[3] = &unk_1E881E1B0;
      v25[4] = v19;
      if ((objc_msgSend(v20, "snapshotWithSignature:duration:events:payload:actions:reply:", v18, 0, 0, 0, v25, 0.0) & 1) == 0&& os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        __43__WiFiSoftError_submitABCReportWithReason___block_invoke_cold_2();
      }
      v21 = (void *)*v3;
      v22 = *(_QWORD *)(*v3 + 136);
      if (!v22)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(*v3 + 136);
        *(_QWORD *)(*v3 + 136) = v23;

        v21 = (void *)*v3;
        v22 = *(_QWORD *)(*v3 + 136);
      }
      objc_msgSend(v21, "_recordCurrentTimestampIn:", v22);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 82, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

void __43__WiFiSoftError_submitABCReportWithReason___block_invoke_68(uint64_t a1)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v3 = 136315394;
    v4 = "-[WiFiSoftError submitABCReportWithReason:]_block_invoke";
    v5 = 2112;
    v6 = v2;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: SoftError <%@> submitted an ABC report", (uint8_t *)&v3, 0x16u);
  }
}

- (id)updateHUDWithMessage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t *v7;
  id v8;
  NSObject *v10;
  dispatch_source_t v11;
  void *v12;
  dispatch_time_t v13;
  const __CFString *v14;
  const __CFString *v15;
  CFTypeID v16;
  int v17;
  NSObject *v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  uint64_t *v31;
  int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__6;
  v37 = __Block_byref_object_dispose__6;
  v38 = 0;
  if (_os_feature_enabled_impl()
    && (MGGetBoolAnswer() & 1) == 0
    && MGGetBoolAnswer()
    && MGGetBoolAnswer()
    && MEMORY[0x1E0CD25C8]
    && !isDisplayOff())
  {
    if (!v4)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v40 = "-[WiFiSoftError updateHUDWithMessage:]";
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Clearing HUD and HUD timer...", buf, 0xCu);
      }
      +[WiFiSoftError _updateHUDWithMessage:](WiFiSoftError, "_updateHUDWithMessage:", 0);
      if (hudTimer)
        dispatch_source_set_timer((dispatch_source_t)hudTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      v7 = v34;
      goto LABEL_9;
    }
    v10 = hudTimer;
    if (!hudTimer)
    {
      v11 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)queue);
      v12 = (void *)hudTimer;
      hudTimer = (uint64_t)v11;

      dispatch_source_set_event_handler((dispatch_source_t)hudTimer, &__block_literal_global_74);
      dispatch_activate((dispatch_object_t)hudTimer);
      v10 = hudTimer;
    }
    v13 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(v10, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
    v14 = (const __CFString *)CFPreferencesCopyValue(CFSTR("kWiFiSoftErrorHUDPreference"), CFSTR("com.apple.settings.airport"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
    v15 = v14;
    if (v14)
    {
      v16 = CFGetTypeID(v14);
      if (v16 == CFStringGetTypeID())
        v17 = CFStringCompare(v15, CFSTR("Limited"), 0)
            ? 2 * (CFStringCompare(v15, CFSTR("Unlimited"), 0) == kCFCompareEqualTo)
            : 1;
      else
        v17 = 0;
      CFRelease(v15);
      if (v17)
      {
        v18 = queue;
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __38__WiFiSoftError_updateHUDWithMessage___block_invoke_85;
        v29[3] = &unk_1E881E1F8;
        v32 = v17;
        v29[4] = self;
        v31 = &v33;
        v30 = v4;
        dispatch_sync(v18, v29);
        v8 = (id)v34[5];

        goto LABEL_10;
      }
    }
    v19 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v19)
      -[WiFiSoftError updateHUDWithMessage:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 1, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v34[5];
    v34[5] = v27;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v34[5];
    v34[5] = v5;

  }
  v7 = v34;
LABEL_9:
  v8 = (id)v7[5];
LABEL_10:
  _Block_object_dispose(&v33, 8);

  return v8;
}

uint64_t __38__WiFiSoftError_updateHUDWithMessage___block_invoke()
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[WiFiSoftError updateHUDWithMessage:]_block_invoke";
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Clearing HUD...", (uint8_t *)&v1, 0xCu);
  }
  return +[WiFiSoftError _updateHUDWithMessage:](WiFiSoftError, "_updateHUDWithMessage:", 0);
}

void __38__WiFiSoftError_updateHUDWithMessage___block_invoke_85(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = a1 + 32;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[9])
  {
    if (objc_msgSend(v2, "_maxUIActionsReachedFor:", v2[19]) && *(_DWORD *)(a1 + 56) == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 35, 0);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __38__WiFiSoftError_updateHUDWithMessage___block_invoke_85_cold_1();
    }
    else
    {
      +[WiFiSoftError _updateHUDWithMessage:](WiFiSoftError, "_updateHUDWithMessage:", *(_QWORD *)(a1 + 40));
      v7 = *(_QWORD **)(a1 + 32);
      v8 = v7[19];
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(*(_QWORD *)v3 + 152);
        *(_QWORD *)(*(_QWORD *)v3 + 152) = v9;

        v7 = *(_QWORD **)v3;
        v8 = *(_QWORD *)(*(_QWORD *)v3 + 152);
      }
      objc_msgSend(v7, "_recordCurrentTimestampIn:", v8);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 82, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

- (BOOL)askToLaunchTapToRadarWithMessage:(id)a3 timeout:(double)a4
{
  id v6;
  int v7;
  int v8;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  double v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  if (!_os_feature_enabled_impl()
    || (MGGetBoolAnswer() & 1) != 0
    || !MGGetBoolAnswer()
    || !MGGetBoolAnswer()
    || !objc_opt_class()
    || MKBGetDeviceLockState() == 1)
  {
    goto LABEL_10;
  }
  v7 = isDisplayOff() ^ 1;
  if (!v6)
    LOBYTE(v7) = 0;
  if ((v7 & 1) != 0)
  {
    v10 = queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__WiFiSoftError_askToLaunchTapToRadarWithMessage_timeout___block_invoke;
    v11[3] = &unk_1E881D558;
    v11[4] = self;
    v14 = a4;
    v12 = v6;
    v13 = &v15;
    dispatch_sync(v10, v11);
    v8 = *((unsigned __int8 *)v16 + 24);

  }
  else
  {
LABEL_10:
    v8 = *((unsigned __int8 *)v16 + 24);
  }
  _Block_object_dispose(&v15, 8);

  return v8 != 0;
}

void __58__WiFiSoftError_askToLaunchTapToRadarWithMessage_timeout___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  CFOptionFlags v8;

  v3 = a1 + 32;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[9])
  {
    if (objc_msgSend(v2, "_maxUIActionsReachedFor:", v2[20]))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __58__WiFiSoftError_askToLaunchTapToRadarWithMessage_timeout___block_invoke_cold_1();
    }
    else
    {
      v8 = 0;
      CFUserNotificationDisplayAlert(*(CFTimeInterval *)(a1 + 56), 0, 0, 0, 0, *(CFStringRef *)(a1 + 40), CFSTR("File a radar now?"), CFSTR("No"), CFSTR("Yes"), 0, &v8);
      if (v8 == 1)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      v4 = *(void **)v3;
      v5 = *(_QWORD *)(*(_QWORD *)v3 + 160);
      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = *(void **)(*(_QWORD *)v3 + 160);
        *(_QWORD *)(*(_QWORD *)v3 + 160) = v6;

        v4 = *(void **)v3;
        v5 = *(_QWORD *)(*(_QWORD *)v3 + 160);
      }
      objc_msgSend(v4, "_recordCurrentTimestampIn:", v5);
    }
  }
}

- (BOOL)askToLaunchTapToRadarWithMessage:(id)a3
{
  return -[WiFiSoftError askToLaunchTapToRadarWithMessage:timeout:](self, "askToLaunchTapToRadarWithMessage:timeout:", a3, 30.0);
}

- (BOOL)askToLaunchTapToRadarWithMessage:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  char v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v19;
  _QWORD block[5];
  id v21;
  uint64_t *v22;
  double v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  if (MKBGetDeviceLockState() == 1)
    v10 = 1;
  else
    v10 = isDisplayOff();
  if (!_os_feature_enabled_impl() || !MGGetBoolAnswer() || !MGGetBoolAnswer())
    goto LABEL_14;
  v11 = objc_opt_class() ? v10 : 1;
  if ((v11 & 1) != 0)
    goto LABEL_14;
  v12 = MGGetBoolAnswer() ^ 1;
  if (!v8)
    LOBYTE(v12) = 0;
  if ((v12 & 1) != 0)
  {
    v19 = queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__WiFiSoftError_askToLaunchTapToRadarWithMessage_timeout_completionHandler___block_invoke;
    block[3] = &unk_1E881D558;
    block[4] = self;
    v23 = a4;
    v21 = v8;
    v22 = &v24;
    dispatch_sync(v19, block);
    if (v9)
      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
    v17 = *((unsigned __int8 *)v25 + 24);

  }
  else
  {
LABEL_14:
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v28 = CFSTR("deviceNotInteractive");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v16);
    v17 = *((unsigned __int8 *)v25 + 24);

  }
  _Block_object_dispose(&v24, 8);

  return v17 != 0;
}

void __76__WiFiSoftError_askToLaunchTapToRadarWithMessage_timeout_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  CFOptionFlags v8;

  v3 = a1 + 32;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[9])
  {
    if (objc_msgSend(v2, "_maxUIActionsReachedFor:", v2[20]))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __76__WiFiSoftError_askToLaunchTapToRadarWithMessage_timeout_completionHandler___block_invoke_cold_1();
    }
    else
    {
      v8 = 0;
      CFUserNotificationDisplayAlert(*(CFTimeInterval *)(a1 + 56), 0, 0, 0, 0, *(CFStringRef *)(a1 + 40), CFSTR("File a radar now?"), CFSTR("No"), CFSTR("Yes"), 0, &v8);
      if (v8 == 1)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      v4 = *(void **)v3;
      v5 = *(_QWORD *)(*(_QWORD *)v3 + 160);
      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = *(void **)(*(_QWORD *)v3 + 160);
        *(_QWORD *)(*(_QWORD *)v3 + 160) = v6;

        v4 = *(void **)v3;
        v5 = *(_QWORD *)(*(_QWORD *)v3 + 160);
      }
      objc_msgSend(v4, "_recordCurrentTimestampIn:", v5);
    }
  }
}

- (BOOL)askToLaunchTapToRadarWithMessage:(id)a3 completionHandler:(id)a4
{
  return -[WiFiSoftError askToLaunchTapToRadarWithMessage:timeout:completionHandler:](self, "askToLaunchTapToRadarWithMessage:timeout:completionHandler:", a3, a4, 30.0);
}

- (id)tapToRadarWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD block[5];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__6;
  v26 = __Block_byref_object_dispose__6;
  v27 = 0;
  if (MKBGetDeviceLockState() == 1)
    v8 = 1;
  else
    v8 = isDisplayOff();
  if (_os_feature_enabled_impl()
    && ((MGGetBoolAnswer() | v8) & 1) == 0
    && MGGetBoolAnswer()
    && MGGetBoolAnswer()
    && (v9 = objc_opt_class(), v6)
    && v9)
  {
    v10 = queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__WiFiSoftError_tapToRadarWithURL_completionHandler___block_invoke;
    block[3] = &unk_1E881E248;
    block[4] = self;
    v21 = &v22;
    v20 = v7;
    v19 = v6;
    dispatch_sync(v10, block);
    v11 = (id)v23[5];

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v28 = CFSTR("deviceNotInteractive");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v23[5];
    v23[5] = v15;

    if (v7)
      (*((void (**)(id, _QWORD, uint64_t))v7 + 2))(v7, 0, v23[5]);
    v11 = (id)v23[5];
  }
  _Block_object_dispose(&v22, 8);

  return v11;
}

void __53__WiFiSoftError_tapToRadarWithURL_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  uint64_t v21;
  id v22;

  v3 = a1 + 32;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[9])
  {
    if (objc_msgSend(v2, "_maxUIActionsReachedFor:", v2[21]))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 35, 0);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __53__WiFiSoftError_tapToRadarWithURL_completionHandler___block_invoke_cold_1();
      v7 = *(_QWORD *)(a1 + 48);
      if (v7)
        (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __53__WiFiSoftError_tapToRadarWithURL_completionHandler___block_invoke_97;
      v20 = &unk_1E881E220;
      v12 = *(_QWORD *)(a1 + 40);
      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(id *)(a1 + 48);
      objc_msgSend(v11, "openURL:configuration:completionHandler:", v12, 0, &v17);

      v13 = *(_QWORD **)(a1 + 32);
      v14 = v13[21];
      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array", v17, v18, v19, v20, v21);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *(void **)(*(_QWORD *)v3 + 168);
        *(_QWORD *)(*(_QWORD *)v3 + 168) = v15;

        v13 = *(_QWORD **)v3;
        v14 = *(_QWORD *)(*(_QWORD *)v3 + 168);
      }
      objc_msgSend(v13, "_recordCurrentTimestampIn:", v14, v17, v18, v19, v20, v21);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 82, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

void __53__WiFiSoftError_tapToRadarWithURL_completionHandler___block_invoke_97(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __53__WiFiSoftError_tapToRadarWithURL_completionHandler___block_invoke_97_cold_1();
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);

}

- (void)_recordCurrentTimestampIn:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "numberWithDouble:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

- (int64_t)_countOf:(id)a3 withinInterval:(double)a4
{
  id v5;
  void *v6;
  int64_t v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (a4 == 9.22337204e18)
    {
      v7 = objc_msgSend(v5, "count");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v9 = v8;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v10 = v6;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
      {
        v12 = v11;
        v7 = 0;
        v13 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "doubleValue", (_QWORD)v17);
            if (v9 - v15 < a4)
              ++v7;
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v12);
      }
      else
      {
        v7 = 0;
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_maxNonUIActionsReachedFor:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  BOOL v7;

  v4 = a3;
  v7 = 0;
  if (v4)
  {
    v5 = -[WiFiSoftError _countOf:withinInterval:](self, "_countOf:withinInterval:", v4, (double)self->_intervalForMaxNonUIActions);
    v6 = -[WiFiSoftError _countOf:withinInterval:](self, "_countOf:withinInterval:", v4, 9.22337204e18);
    if (v5 >= self->_maxNonUIActions || v6 >= self->_maxOccurrences)
      v7 = 1;
  }

  return v7;
}

- (BOOL)_maxUIActionsReachedFor:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  BOOL v7;

  v4 = a3;
  v7 = 0;
  if (v4)
  {
    v5 = -[WiFiSoftError _countOf:withinInterval:](self, "_countOf:withinInterval:", v4, (double)self->_intervalForMaxUIActions);
    v6 = -[WiFiSoftError _countOf:withinInterval:](self, "_countOf:withinInterval:", v4, 9.22337204e18);
    if (v5 >= self->_maxUIActions || v6 >= self->_maxOccurrences)
      v7 = 1;
  }

  return v7;
}

- (void)_resetCount
{
  if (self->_enabled)
    -[NSMutableArray removeAllObjects](self->_occurrenceTimestamps, "removeAllObjects");
}

- (void)_addConfigurationData:(id)a3
{
  void *v4;
  int64_t metricSubmissionSamplingRate;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  metricSubmissionSamplingRate = self->_metricSubmissionSamplingRate;
  v6 = a3;
  objc_msgSend(v4, "numberWithInteger:", metricSubmissionSamplingRate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("samplingRate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maxOccurrences);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("maxOccurrences"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSMutableArray count](self->_occurrenceTimestamps, "count") == self->_maxOccurrences);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("reachedMaxDailyOccurrences"));

}

- (void)_addGenericMetricData:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = -[WiFiSoftError _countOf:withinInterval:](self, "_countOf:withinInterval:", self->_occurrenceTimestamps, 9.22337204e18);
  v5 = v4;
  if (v4 > 1 || v4 == 1 && self->_lastTimestamp)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_occurrenceTimestamps, "objectAtIndexedSubscript:", v4 - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    if (v5 <= 1)
    {
      -[NSNumber doubleValue](self->_lastTimestamp, "doubleValue");
      v11 = v12;
    }
    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_occurrenceTimestamps, "objectAtIndexedSubscript:", v5 - 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10;

    }
    +[WiFiUsagePrivacyFilter getBinTimeInterval:As:](WiFiUsagePrivacyFilter, "getBinTimeInterval:As:", 1, v8 - v11);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v15, "setObject:forKey:", v13, CFSTR("timeSinceLastOccurrenceBin"));
      -[WiFiSoftError _addConfigurationData:](self, "_addConfigurationData:", v15);

    }
  }

}

+ (void)_submitSummaryReportMetric
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl() && (MGGetBoolAnswer() & 1) == 0 && MEMORY[0x1E0D15430])
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v3 = v2;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.wifi.softerror"), CFSTR("generic"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = (id)currentSoftErrors;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v32;
      v25 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v32 != v8)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "pointerValue");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "creationDate");
          if (v3 - v11 >= 86400.0 && objc_msgSend(v10, "metricsEnabled"))
          {
            objc_msgSend(v10, "name");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("name"));

            v29 = 0u;
            v30 = 0u;
            v27 = 0u;
            v28 = 0u;
            objc_msgSend(v10, "occurrenceTimestamps");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
            if (v14)
            {
              v15 = v14;
              v16 = 0;
              v17 = *(_QWORD *)v28;
              do
              {
                for (j = 0; j != v15; ++j)
                {
                  if (*(_QWORD *)v28 != v17)
                    objc_enumerationMutation(v13);
                  objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "doubleValue");
                  if (v3 - v19 < 86400.0)
                    ++v16;
                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
              }
              while (v15);
            }
            else
            {
              v16 = 0;
            }

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("occurrenceCountIn24hr"));

            objc_msgSend(v10, "_addConfigurationData:", v5);
            objc_msgSend(v10, "occurrenceTimestamps");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "lastObject");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setLastTimestamp:", v22);

            objc_msgSend(v10, "_resetCount");
            v23 = v5;
            AnalyticsSendEventLazy();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v10, "name");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v36 = "+[WiFiSoftError _submitSummaryReportMetric]";
              v37 = 2112;
              v38 = v24;
              v39 = 2112;
              v40 = v4;
              _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: SoftError <%@> submitted a summary in metric <%@>", buf, 0x20u);

            }
            v8 = v25;
            if (os_log_type_enabled(MEMORY[0x1E0C81030], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v36 = "+[WiFiSoftError _submitSummaryReportMetric]";
              v37 = 2112;
              v38 = v5;
              _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81030], OS_LOG_TYPE_DEFAULT, "%s: SoftError metric dictionary <%@>", buf, 0x16u);
            }
            objc_msgSend(v23, "removeAllObjects");

          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
      }
      while (v7);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

}

id __43__WiFiSoftError__submitSummaryReportMetric__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)_cloudAssetsFetchHandler:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__WiFiSoftError__cloudAssetsFetchHandler___block_invoke;
  block[3] = &unk_1E881C8E8;
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

void __42__WiFiSoftError__cloudAssetsFetchHandler___block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  BOOL v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  BOOL v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  unint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v2)
    __42__WiFiSoftError__cloudAssetsFetchHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  v10 = *(void **)(a1 + 32);
  if (v10)
  {
    objc_msgSend(v10, "softErrors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    v13 = (void *)cloudAssets;
    cloudAssets = v12;

  }
  if (cloudAssets)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v14 = (id)currentSoftErrors;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    if (v15)
    {
      v17 = v15;
      v18 = *(_QWORD *)v38;
      *(_QWORD *)&v16 = 136315906;
      v34 = v16;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v19), "pointerValue", v34);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)cloudAssets;
          objc_msgSend(v20, "name");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKey:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(v23, "objectForKey:", CFSTR("enabled"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "integerValue");
            if (v24)
              v26 = v25 > 1;
            else
              v26 = 1;
            if (!v26)
            {
              v27 = v25;
              if (objc_msgSend(v20, "enabled") != v25)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v20, "name");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_msgSend(v20, "enabled");
                  *(_DWORD *)buf = v34;
                  v42 = "+[WiFiSoftError _cloudAssetsFetchHandler:]_block_invoke";
                  v43 = 2112;
                  v44 = v35;
                  v45 = 2048;
                  v46 = v32;
                  v47 = 2048;
                  v48 = v27;
                  _os_log_error_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s: Updating SoftError <%@> property <enabled> from %ld => %ld", buf, 0x2Au);

                }
                objc_msgSend(v20, "setEnabled:", v27);
              }
            }
            objc_msgSend(v23, "objectForKey:", CFSTR("metricsEnabled"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            v29 = objc_msgSend(v28, "integerValue");
            if (v28)
              v30 = v29 > 1;
            else
              v30 = 1;
            if (!v30)
            {
              v31 = v29;
              if (objc_msgSend(v20, "metricsEnabled") != v29)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v20, "name");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = objc_msgSend(v20, "metricsEnabled");
                  *(_DWORD *)buf = v34;
                  v42 = "+[WiFiSoftError _cloudAssetsFetchHandler:]_block_invoke";
                  v43 = 2112;
                  v44 = v36;
                  v45 = 2048;
                  v46 = v33;
                  v47 = 2048;
                  v48 = v31;
                  _os_log_error_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s: Updating SoftError <%@> property <metricsEnabled> from %ld => %ld", buf, 0x2Au);

                }
                objc_msgSend(v20, "setMetricsEnabled:", v31);
              }
            }

          }
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      }
      while (v17);
    }

  }
}

+ (void)_updateHUDWithMessage:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v3;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[HUD]: HUD message info: %@", buf, 0xCu);
    }
    v4 = v3;
    if (objc_opt_class() && objc_opt_class() && objc_opt_class() && objc_opt_class())
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("content"), v4);
      v6 = objc_alloc_init(MEMORY[0x1E0CB3998]);
      objc_msgSend(v6, "setScheme:", CFSTR("wifiapp"));
      objc_msgSend(v6, "setHost:", CFSTR("banner"));
      v39 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setQueryItems:", v7);

      objc_msgSend(v6, "URL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "absoluteString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v41 = v9;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[HUD]: attempted to open url: %@", buf, 0xCu);

      }
      v10 = objc_alloc_init(MEMORY[0x1E0CA5938]);
      v11 = (void *)objc_opt_new();
      objc_msgSend(v11, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D22CF8]);
      objc_msgSend(v10, "setFrontBoardOptions:", v11);
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      v13 = (id)objc_msgSend(v12, "openURL:configuration:error:", v8, v10, &v38);
      v14 = v38;

      if (v14 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        +[WiFiSoftError _updateHUDWithMessage:].cold.3((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);

    }
    else
    {
      v22 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v22)
        +[WiFiSoftError _updateHUDWithMessage:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);
    }

  }
  else
  {
    v30 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v30)
      +[WiFiSoftError _updateHUDWithMessage:].cold.1(v30, v31, v32, v33, v34, v35, v36, v37);
  }

}

- (int64_t)maxOccurrences
{
  return self->_maxOccurrences;
}

- (int64_t)metricSubmissionSamplingRate
{
  return self->_metricSubmissionSamplingRate;
}

- (int64_t)maxNonUIActions
{
  return self->_maxNonUIActions;
}

- (int64_t)intervalForMaxNonUIActions
{
  return self->_intervalForMaxNonUIActions;
}

- (int64_t)maxUIActions
{
  return self->_maxUIActions;
}

- (int64_t)intervalForMaxUIActions
{
  return self->_intervalForMaxUIActions;
}

- (int64_t)maxLogMessageLength
{
  return self->_maxLogMessageLength;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (int64_t)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(int64_t)a3
{
  self->_enabled = a3;
}

- (int64_t)metricsEnabled
{
  return self->_metricsEnabled;
}

- (void)setMetricsEnabled:(int64_t)a3
{
  self->_metricsEnabled = a3;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(double)a3
{
  self->_creationDate = a3;
}

- (NSMutableArray)occurrenceTimestamps
{
  return self->_occurrenceTimestamps;
}

- (void)setOccurrenceTimestamps:(id)a3
{
  objc_storeStrong((id *)&self->_occurrenceTimestamps, a3);
}

- (NSNumber)lastTimestamp
{
  return self->_lastTimestamp;
}

- (void)setLastTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_lastTimestamp, a3);
}

- (void)setLogMessage:(id)a3
{
  objc_storeStrong((id *)&self->_logMessage, a3);
}

- (NSString)metricEventName
{
  return self->_metricEventName;
}

- (void)setMetricEventName:(id)a3
{
  objc_storeStrong((id *)&self->_metricEventName, a3);
}

- (SDRDiagnosticReporter)abcReporter
{
  return self->_abcReporter;
}

- (void)setAbcReporter:(id)a3
{
  objc_storeStrong((id *)&self->_abcReporter, a3);
}

- (NSMutableArray)abcSubmissionTimestamps
{
  return self->_abcSubmissionTimestamps;
}

- (void)setAbcSubmissionTimestamps:(id)a3
{
  objc_storeStrong((id *)&self->_abcSubmissionTimestamps, a3);
}

- (NSMutableArray)simulateCrashTimestamps
{
  return self->_simulateCrashTimestamps;
}

- (void)setSimulateCrashTimestamps:(id)a3
{
  objc_storeStrong((id *)&self->_simulateCrashTimestamps, a3);
}

- (NSMutableArray)hudTimestamps
{
  return self->_hudTimestamps;
}

- (void)setHudTimestamps:(id)a3
{
  objc_storeStrong((id *)&self->_hudTimestamps, a3);
}

- (NSMutableArray)askToLaunchTapToRadarTimestamps
{
  return self->_askToLaunchTapToRadarTimestamps;
}

- (void)setAskToLaunchTapToRadarTimestamps:(id)a3
{
  objc_storeStrong((id *)&self->_askToLaunchTapToRadarTimestamps, a3);
}

- (NSMutableArray)tapToRadarTimestamps
{
  return self->_tapToRadarTimestamps;
}

- (void)setTapToRadarTimestamps:(id)a3
{
  objc_storeStrong((id *)&self->_tapToRadarTimestamps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToRadarTimestamps, 0);
  objc_storeStrong((id *)&self->_askToLaunchTapToRadarTimestamps, 0);
  objc_storeStrong((id *)&self->_hudTimestamps, 0);
  objc_storeStrong((id *)&self->_simulateCrashTimestamps, 0);
  objc_storeStrong((id *)&self->_abcSubmissionTimestamps, 0);
  objc_storeStrong((id *)&self->_abcReporter, 0);
  objc_storeStrong((id *)&self->_metricEventName, 0);
  objc_storeStrong((id *)&self->_logMessage, 0);
  objc_storeStrong((id *)&self->_lastTimestamp, 0);
  objc_storeStrong((id *)&self->_occurrenceTimestamps, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithName:(uint64_t)a3 andParams:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "%s: SoftError not supported in this mode", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithName:andParams:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1CC44E000, MEMORY[0x1E0C81028], v0, "%s: Updating SoftError <%@> property <metricsEnabled> from %ld => %ld", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)initWithName:andParams:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1CC44E000, MEMORY[0x1E0C81028], v0, "%s: Updating SoftError <%@> property <enabled> from %ld => %ld", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)initWithName:(uint64_t)a3 andParams:(uint64_t)a4 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "%s: Fetching SoftError cloud assets...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithName:andParams:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8(&dword_1CC44E000, MEMORY[0x1E0C81028], v0, "%s: Error: SoftError <%@> already present, ignoring", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithName:(uint64_t)a3 andParams:(uint64_t)a4 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "%s: WiFiPolicy/SoftError feature flag disabled", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __31__WiFiSoftError_incrementCount__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_1CC44E000, MEMORY[0x1E0C81028], v0, "%s: Error: SoftError <%@> has reached its max occurrence count %ld, ignoring", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_11();
}

void __51__WiFiSoftError_appendLogMessage_includeTimestamp___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_1CC44E000, MEMORY[0x1E0C81028], v0, "%s: Error: SoftError <%@> has reached its max log length %ld, ignoring", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_11();
}

void __29__WiFiSoftError_submitMetric__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_1CC44E000, MEMORY[0x1E0C81028], v0, "%s: Error: SoftError <%@> metric submission dropped, sampling rate applied was %ld percent", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_11();
}

void __38__WiFiSoftError_submitMetricWithData___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_1CC44E000, MEMORY[0x1E0C81028], v0, "%s: Error: SoftError <%@> metric submission dropped, sampling rate applied was %ld percent", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_11();
}

void __43__WiFiSoftError_submitABCReportWithReason___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1CC44E000, MEMORY[0x1E0C81028], v0, "%s: Error: SoftError <%@> has reached its max count of submitting %ld ABC reports within the last %ld seconds, ignoring", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_9();
}

void __43__WiFiSoftError_submitABCReportWithReason___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8(&dword_1CC44E000, MEMORY[0x1E0C81028], v0, "%s: Error: SoftError <%@> ABC report parameters invalid", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)updateHUDWithMessage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "%s: HUD UI preference is set to Never", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __38__WiFiSoftError_updateHUDWithMessage___block_invoke_85_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1CC44E000, MEMORY[0x1E0C81028], v0, "%s: Error: SoftError <%@> has reached its max count of generating %ld HUD messages within the last %ld seconds, ignoring", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_9();
}

void __58__WiFiSoftError_askToLaunchTapToRadarWithMessage_timeout___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1CC44E000, MEMORY[0x1E0C81028], v0, "%s: Error: SoftError <%@> has reached its max count of %ld Tap-to-Radar alerts within the last %ld seconds, ignoring", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_9();
}

void __76__WiFiSoftError_askToLaunchTapToRadarWithMessage_timeout_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1CC44E000, MEMORY[0x1E0C81028], v0, "%s: Error: SoftError <%@> has reached its max count of %ld Tap-to-Radar alerts within the last %ld seconds, ignoring", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_9();
}

void __53__WiFiSoftError_tapToRadarWithURL_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1CC44E000, MEMORY[0x1E0C81028], v0, "%s: Error: SoftError <%@> has reached its max count of %ld Tap-to-Radar app launches within the last %ld seconds, ignoring", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_9();
}

void __53__WiFiSoftError_tapToRadarWithURL_completionHandler___block_invoke_97_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4_0(&dword_1CC44E000, MEMORY[0x1E0C81028], v0, "%s: Error: SoftError <%@> tap-to-radar returned error <%@>", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_11();
}

void __42__WiFiSoftError__cloudAssetsFetchHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "%s: Fetching SoftError cloud assets completed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)_updateHUDWithMessage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "[HUD]: ignoring empty HUD message info", a5, a6, a7, a8, 0);
}

+ (void)_updateHUDWithMessage:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "[HUD]: Missing required class symbols for posting banner, early return with no operation", a5, a6, a7, a8, 0);
}

+ (void)_updateHUDWithMessage:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "[HUD]: open url error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
