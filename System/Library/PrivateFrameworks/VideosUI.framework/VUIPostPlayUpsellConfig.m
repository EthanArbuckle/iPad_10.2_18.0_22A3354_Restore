@implementation VUIPostPlayUpsellConfig

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_26 != -1)
    dispatch_once(&sharedInstance_onceToken_26, &__block_literal_global_117);
  return (id)sharedInstance_instance_3;
}

uint64_t __41__VUIPostPlayUpsellConfig_sharedInstance__block_invoke()
{
  VUIPostPlayUpsellConfig *v0;
  void *v1;

  v0 = objc_alloc_init(VUIPostPlayUpsellConfig);
  v1 = (void *)sharedInstance_instance_3;
  sharedInstance_instance_3 = (uint64_t)v0;

  objc_msgSend((id)sharedInstance_instance_3, "setChannelLevelUpsellRateOfMaxCount:inHours:", 3, 24.0);
  objc_msgSend((id)sharedInstance_instance_3, "setShowLevelUpsellRateOfMaxCount:inHours:", 2, 24.0);
  return objc_msgSend((id)sharedInstance_instance_3, "setMinPlaybackProgressPercentageForUpsellOnExit:", 0.85);
}

- (void)configureUsingDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellConfig - setting via JS %@", (uint8_t *)&v14, 0xCu);
    }

    -[VUIPostPlayUpsellConfig disableUpsellOnPlaybackExit:](self, "disableUpsellOnPlaybackExit:", objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", CFSTR("isDisabled"), 0));
    -[VUIPostPlayUpsellConfig enableUpsellOnPIPPlaybackExit:](self, "enableUpsellOnPIPPlaybackExit:", objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", CFSTR("isPIPEnabled"), 0));
    objc_msgSend(v4, "vui_numberForKey:", CFSTR("minPlaybackProgressPercentage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      -[VUIPostPlayUpsellConfig setMinPlaybackProgressPercentageForUpsellOnExit:](self, "setMinPlaybackProgressPercentageForUpsellOnExit:");
    }
    objc_msgSend(v4, "vui_numberForKey:", CFSTR("maxCountPerChannel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v4, "vui_numberForKey:", CFSTR("countDurationHrsPerChannel"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "unsignedIntegerValue");
      objc_msgSend(v9, "doubleValue");
      -[VUIPostPlayUpsellConfig setChannelLevelUpsellRateOfMaxCount:inHours:](self, "setChannelLevelUpsellRateOfMaxCount:inHours:", v10);

    }
    objc_msgSend(v4, "vui_numberForKey:", CFSTR("maxCountPerShow"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v4, "vui_numberForKey:", CFSTR("countDurationHrsPerShow"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "unsignedIntegerValue");
      objc_msgSend(v12, "doubleValue");
      -[VUIPostPlayUpsellConfig setShowLevelUpsellRateOfMaxCount:inHours:](self, "setShowLevelUpsellRateOfMaxCount:inHours:", v13);

    }
  }

}

- (void)setMinPlaybackProgressPercentageForUpsellOnExit:(double)a3
{
  NSObject *v5;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_minPlaybackProgressPercentage != a3)
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134217984;
      v7 = a3;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellConfig - set progress percentage for upsell on exit: %lf", (uint8_t *)&v6, 0xCu);
    }

    self->_minPlaybackProgressPercentage = a3;
  }
}

- (void)enableUpsellOnPIPPlaybackExit:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_isUpsellOnPIPPlaybackExitEnabled != a3)
  {
    v3 = a3;
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "disable";
      if (v3)
        v6 = "enable";
      v7 = 136315138;
      v8 = v6;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellConfig - %s upsell on pip pb exit", (uint8_t *)&v7, 0xCu);
    }

    self->_isUpsellOnPIPPlaybackExitEnabled = v3;
  }
}

- (void)disableUpsellOnPlaybackExit:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_isUpsellOnPlaybackExitDisabled != a3)
  {
    v3 = a3;
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "enable";
      if (v3)
        v6 = "disable";
      v7 = 136315138;
      v8 = v6;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellConfig - %s upsell on pb exit", (uint8_t *)&v7, 0xCu);
    }

    self->_isUpsellOnPlaybackExitDisabled = v3;
  }
}

- (void)setShowLevelUpsellRateOfMaxCount:(unint64_t)a3 inHours:(double)a4
{
  NSObject *v7;
  int v8;
  unint64_t v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3 && a4 >= 0.001 || self->_upsellMaxCountPerShow != a3 || self->_upsellCountDurationPerShow != a4)
  {
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134218240;
      v9 = a3;
      v10 = 2048;
      v11 = a4;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellConfig - set show level rate: %ld per %f hrs", (uint8_t *)&v8, 0x16u);
    }

    if (a3)
    {
      self->_isUpsellLimitedPerShow = 1;
      self->_upsellMaxCountPerShow = a3;
      self->_upsellCountDurationPerShow = a4;
    }
    else
    {
      self->_isUpsellLimitedPerShow = 0;
    }
  }
}

- (void)setChannelLevelUpsellRateOfMaxCount:(unint64_t)a3 inHours:(double)a4
{
  NSObject *v7;
  int v8;
  unint64_t v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3 && a4 >= 0.001 || self->_upsellMaxCountPerChannel != a3 || self->_upsellCountDurationPerChannel != a4)
  {
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134218240;
      v9 = a3;
      v10 = 2048;
      v11 = a4;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellConfig - set channel level rate: %ld per %f hrs", (uint8_t *)&v8, 0x16u);
    }

    if (a3)
    {
      self->_isUpsellLimitedPerChannel = 1;
      self->_upsellMaxCountPerChannel = a3;
      self->_upsellCountDurationPerChannel = a4;
    }
    else
    {
      self->_isUpsellLimitedPerChannel = 0;
    }
  }
}

- (id)appContext
{
  void *v2;
  void *v3;
  void *v4;

  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)canShowUpsellForMediaItem:(id)a3 withElapsedTime:(double)a4 completion:(id)a5
{
  void (**v8)(id, _QWORD);
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;

  v13 = a3;
  v8 = (void (**)(id, _QWORD))a5;
  if (-[VUIPostPlayUpsellConfig hasShownPostPlay](self, "hasShownPostPlay"))
  {
    v8[2](v8, 0);
  }
  else
  {
    objc_msgSend(v13, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataPlaybackExitUpsellPolicy"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A88]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    -[VUIPostPlayUpsellConfig _canShowUpsellForPolicy:duration:elapsedTime:completion:](self, "_canShowUpsellForPolicy:duration:elapsedTime:completion:", v9, v8, v12, a4);
  }

}

- (void)_canShowUpsellForPolicy:(id)a3 duration:(double)a4 elapsedTime:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  double v16;
  double v17;

  v10 = a3;
  v11 = a6;
  if ((objc_msgSend(v10, "showUpsell") & 1) != 0)
  {
    -[VUIPostPlayUpsellConfig appContext](self, "appContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __83__VUIPostPlayUpsellConfig__canShowUpsellForPolicy_duration_elapsedTime_completion___block_invoke;
    v13[3] = &unk_1E9FA1820;
    v16 = a5;
    v17 = a4;
    v14 = v10;
    v15 = v11;
    objc_msgSend(v12, "evaluate:", v13);

  }
  else
  {
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
  }

}

void __83__VUIPostPlayUpsellConfig__canShowUpsellForPolicy_duration_elapsedTime_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, char);
  void *v16;
  id v17;
  _QWORD v18[7];

  v18[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ExitUpsellInterface"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v5;
  objc_msgSend(*(id *)(a1 + 32), "playbackThreshold");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v7 = objc_msgSend(*(id *)(a1 + 32), "thresholdValueType");
  v8 = &unk_1EA0B9D78;
  if (!v7)
    v8 = &unk_1EA0B9D60;
  v18[3] = v8;
  objc_msgSend(*(id *)(a1 + 32), "rateLimitPolicies");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v9;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __83__VUIPostPlayUpsellConfig__canShowUpsellForPolicy_duration_elapsedTime_completion___block_invoke_26;
  v16 = &unk_1E9F98E18;
  v17 = *(id *)(a1 + 40);
  v10 = _Block_copy(&v13);
  v18[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 6, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "invokeMethod:withArguments:", CFSTR("showUpsell"), v11);

}

void __83__VUIPostPlayUpsellConfig__canShowUpsellForPolicy_duration_elapsedTime_completion___block_invoke_26(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__VUIPostPlayUpsellConfig__canShowUpsellForPolicy_duration_elapsedTime_completion___block_invoke_2;
  v3[3] = &unk_1E9F9BE68;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __83__VUIPostPlayUpsellConfig__canShowUpsellForPolicy_duration_elapsedTime_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_canShowUpsellForChannelId:(id)a3 showId:(id)a4 duration:(double)a5 elapsedTime:(double)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  unint64_t upsellMaxCountPerChannel;
  double upsellCountDurationPerChannel;
  const char *v19;
  unint64_t upsellMaxCountPerShow;
  double upsellCountDurationPerShow;
  double minPlaybackProgressPercentage;
  NSObject *v23;
  BOOL v24;
  double v25;
  double v27;
  int v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryForKey:", CFSTR("PostPlayUpsellConfig"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_isUpsellLimitedPerChannel)
  {
    objc_msgSend(v13, "vui_dictionaryForKey:", CFSTR("PostPlayUpsellChannelHistory"));
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject vui_arrayForKey:](v14, "vui_arrayForKey:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[VUIPostPlayUpsellConfig _isHistoryArrayFull:forMaxCount:inDurationWindow:](self, "_isHistoryArrayFull:forMaxCount:inDurationWindow:", v15, self->_upsellMaxCountPerChannel, self->_upsellCountDurationPerChannel))
    {
      VUIDefaultLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        upsellMaxCountPerChannel = self->_upsellMaxCountPerChannel;
        upsellCountDurationPerChannel = self->_upsellCountDurationPerChannel;
        v28 = 134218498;
        v29 = *(double *)&upsellMaxCountPerChannel;
        v30 = 2048;
        v31 = upsellCountDurationPerChannel;
        v32 = 2112;
        v33 = v10;
        v19 = "VUIPostPlayUpsellConfig - post play upsell reached its per channel rate(%lu/%fhrs) limit for channel %@";
LABEL_10:
        _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v28, 0x20u);
        goto LABEL_11;
      }
      goto LABEL_11;
    }

  }
  if (self->_isUpsellLimitedPerShow)
  {
    objc_msgSend(v13, "vui_dictionaryForKey:", CFSTR("PostPlayUpsellShowHistory"));
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject vui_arrayForKey:](v14, "vui_arrayForKey:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[VUIPostPlayUpsellConfig _isHistoryArrayFull:forMaxCount:inDurationWindow:](self, "_isHistoryArrayFull:forMaxCount:inDurationWindow:", v15, self->_upsellMaxCountPerShow, self->_upsellCountDurationPerShow))
    {
      VUIDefaultLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        upsellMaxCountPerShow = self->_upsellMaxCountPerShow;
        upsellCountDurationPerShow = self->_upsellCountDurationPerShow;
        v28 = 134218498;
        v29 = *(double *)&upsellMaxCountPerShow;
        v30 = 2048;
        v31 = upsellCountDurationPerShow;
        v32 = 2112;
        v33 = v11;
        v19 = "VUIPostPlayUpsellConfig - post play upsell reached its per show rate(%lu/%fhrs) limit for show %@";
        goto LABEL_10;
      }
LABEL_11:

      goto LABEL_12;
    }

  }
  minPlaybackProgressPercentage = self->_minPlaybackProgressPercentage;
  if (minPlaybackProgressPercentage <= 0.0)
    goto LABEL_21;
  if (*MEMORY[0x1E0DB1998] == a5)
  {
    VUIDefaultLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1D96EE000, v23, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellConfig - unknown content playback duration", (uint8_t *)&v28, 2u);
    }

    goto LABEL_19;
  }
  v25 = a6 / a5;
  if (v25 >= minPlaybackProgressPercentage)
  {
LABEL_21:
    -[VUIPostPlayUpsellConfig _recordUpsellHistoryForShowId:onChannelId:](self, "_recordUpsellHistoryForShowId:onChannelId:", v11, v10);
    v24 = 1;
    goto LABEL_22;
  }
  VUIDefaultLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v27 = self->_minPlaybackProgressPercentage;
    v28 = 134218240;
    v29 = v25;
    v30 = 2048;
    v31 = v27;
    _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellConfig - not enough played, playbackProgressPercentage %f < _minPlaybackProgressPercentage %f", (uint8_t *)&v28, 0x16u);
  }
LABEL_12:

LABEL_19:
  v24 = 0;
LABEL_22:

  return v24;
}

- (void)_recordUpsellHistoryForShowId:(id)a3 onChannelId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  v6 = a4;
  if (v31 && v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryForKey:", CFSTR("PostPlayUpsellConfig"));
    v9 = objc_claimAutoreleasedReturnValue();

    v30 = (void *)v9;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = (void *)objc_opt_new();
    }
    v11 = v10;
    objc_msgSend(v10, "vui_dictionaryForKey:", CFSTR("PostPlayUpsellChannelHistory"));
    v12 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v12;
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = objc_opt_new();
    }
    v14 = (void *)v13;
    objc_msgSend(v11, "vui_dictionaryForKey:", CFSTR("PostPlayUpsellShowHistory"));
    v15 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v15;
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = objc_opt_new();
    }
    v17 = (void *)v16;
    objc_msgSend(v14, "vui_arrayForKey:", v6);
    v18 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v18;
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = (void *)objc_opt_new();
    }
    v20 = v19;
    objc_msgSend(v19, "addObject:", v7);
    objc_msgSend(v14, "setValue:forKey:", v20, v6);
    objc_msgSend(v17, "vui_arrayForKey:", v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = (void *)objc_opt_new();
    }
    v23 = v22;
    objc_msgSend(v22, "addObject:", v7);
    objc_msgSend(v17, "setValue:forKey:", v23, v31);
    -[VUIPostPlayUpsellConfig _cleanupHistory:atCurrentDate:isShow:](self, "_cleanupHistory:atCurrentDate:isShow:", v17, v7, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIPostPlayUpsellConfig _cleanupHistory:atCurrentDate:isShow:](self, "_cleanupHistory:atCurrentDate:isShow:", v14, v7, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setValue:forKey:", v25, CFSTR("PostPlayUpsellChannelHistory"));
    objc_msgSend(v11, "setValue:forKey:", v24, CFSTR("PostPlayUpsellShowHistory"));
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setValue:forKey:", v11, CFSTR("PostPlayUpsellConfig"));

  }
}

- (id)_cleanupHistory:(id)a3 atCurrentDate:(id)a4 isShow:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v22 = a4;
  objc_msgSend(v8, "allKeys");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    v12 = 40;
    if (v5)
      v12 = 24;
    v21 = v12;
    if (v5)
      v13 = 32;
    else
      v13 = 48;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v8, "vui_arrayForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIPostPlayUpsellConfig _trimHistoryArray:forMaxCount:inDurationWindow:atCurrentDate:](self, "_trimHistoryArray:forMaxCount:inDurationWindow:atCurrentDate:", v17, *(Class *)((char *)&self->super.isa + v21), v22, *(double *)((char *)&self->super.isa + v13));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v18, "count"))
            objc_msgSend(v8, "setValue:forKey:", v18, v15);
          else
            objc_msgSend(v8, "removeObjectForKey:", v15);

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  return v8;
}

- (BOOL)_isHistoryArrayFull:(id)a3 forMaxCount:(unint64_t)a4 inDurationWindow:(double)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  BOOL v17;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "count");
  if (v9)
  {
    v10 = 0;
    v11 = a5 * 60.0 * 60.0;
    v12 = v9 - 1;
    do
    {
      v13 = v10;
      if (v12 + v10 < 0)
        break;
      objc_msgSend(v7, "objectAtIndexedSubscript:", v12 + v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceDate:", v14);
      v16 = v15;

      v10 = v13 - 1;
    }
    while (v16 <= v11);
    v17 = -v13 >= a4;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_trimHistoryArray:(id)a3 forMaxCount:(unint64_t)a4 inDurationWindow:(double)a5 atCurrentDate:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  double v13;
  unint64_t v14;
  void *v15;
  double v16;
  double v17;

  v9 = a3;
  v10 = a6;
  v11 = objc_msgSend(v9, "count");
  if (v11)
  {
    v12 = v11;
    v13 = a5 * 60.0 * 60.0;
    v14 = v11;
    while ((--v14 & 0x8000000000000000) == 0)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", v15);
      v17 = v16;

      if (v17 > v13)
      {
        if (v14 < v12)
          objc_msgSend(v9, "removeObjectsInRange:", 0, v14 + 1);
        break;
      }
    }
    if ((uint64_t)(objc_msgSend(v9, "count") - a4) >= 1)
      objc_msgSend(v9, "removeObjectsInRange:", 0);
  }

  return v9;
}

- (BOOL)hasShownPostPlay
{
  return self->_hasShownPostPlay;
}

- (void)setHasShownPostPlay:(BOOL)a3
{
  self->_hasShownPostPlay = a3;
}

- (BOOL)isUpsellOnPlaybackExitDisabled
{
  return self->_isUpsellOnPlaybackExitDisabled;
}

- (void)setIsUpsellOnPlaybackExitDisabled:(BOOL)a3
{
  self->_isUpsellOnPlaybackExitDisabled = a3;
}

- (BOOL)isUpsellOnPIPPlaybackExitEnabled
{
  return self->_isUpsellOnPIPPlaybackExitEnabled;
}

- (void)setIsUpsellOnPIPPlaybackExitEnabled:(BOOL)a3
{
  self->_isUpsellOnPIPPlaybackExitEnabled = a3;
}

- (double)minPlaybackProgressPercentage
{
  return self->_minPlaybackProgressPercentage;
}

- (void)setMinPlaybackProgressPercentage:(double)a3
{
  self->_minPlaybackProgressPercentage = a3;
}

- (BOOL)isUpsellLimitedPerShow
{
  return self->_isUpsellLimitedPerShow;
}

- (void)setIsUpsellLimitedPerShow:(BOOL)a3
{
  self->_isUpsellLimitedPerShow = a3;
}

- (unint64_t)upsellMaxCountPerShow
{
  return self->_upsellMaxCountPerShow;
}

- (void)setUpsellMaxCountPerShow:(unint64_t)a3
{
  self->_upsellMaxCountPerShow = a3;
}

- (double)upsellCountDurationPerShow
{
  return self->_upsellCountDurationPerShow;
}

- (void)setUpsellCountDurationPerShow:(double)a3
{
  self->_upsellCountDurationPerShow = a3;
}

- (BOOL)isUpsellLimitedPerChannel
{
  return self->_isUpsellLimitedPerChannel;
}

- (void)setIsUpsellLimitedPerChannel:(BOOL)a3
{
  self->_isUpsellLimitedPerChannel = a3;
}

- (unint64_t)upsellMaxCountPerChannel
{
  return self->_upsellMaxCountPerChannel;
}

- (void)setUpsellMaxCountPerChannel:(unint64_t)a3
{
  self->_upsellMaxCountPerChannel = a3;
}

- (double)upsellCountDurationPerChannel
{
  return self->_upsellCountDurationPerChannel;
}

- (void)setUpsellCountDurationPerChannel:(double)a3
{
  self->_upsellCountDurationPerChannel = a3;
}

@end
