@implementation VUIMetricsMediaEvent

+ (void)recordPlay:(id)a3 isLaunchingExtras:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  uint8_t v12[16];

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAdultContent");

  if (v8)
  {
    VUIDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_INFO, "ignore media event for adult content", v12, 2u);
    }
  }
  else
  {
    if (v4)
      v10 = CFSTR("extras");
    else
      v10 = CFSTR("play");
    objc_msgSend(a1, "_metricsDataFromPlayable:actionType:canonicalIdOverride:durationOverride:contentType:", v6, v10, 0, 0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recordMedia:", v9);

  }
}

+ (void)recordStop:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAdultContent");

  if (v6)
  {
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_INFO, "ignore media event for adult content", v9, 2u);
    }
  }
  else
  {
    objc_msgSend(a1, "_metricsDataFromPlayable:actionType:canonicalIdOverride:durationOverride:contentType:", v4, CFSTR("stop"), 0, 0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordMedia:", v7);

  }
}

+ (void)recordClipPlay:(id)a3 canonicalId:(id)a4 duration:(double)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAdultContent");

  VUIDefaultLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v13)
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_INFO, "ignore media event for adult content", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    if (v13)
    {
      v16 = 138412546;
      v17 = v9;
      v18 = 2048;
      v19 = a5;
      _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_INFO, "record clip play %@ - %1.2f", (uint8_t *)&v16, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_metricsDataFromPlayable:actionType:canonicalIdOverride:durationOverride:contentType:", v8, CFSTR("play"), v9, v14, CFSTR("KeyPlay"));
    v12 = objc_claimAutoreleasedReturnValue();

    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "recordMedia:", v12);

  }
}

+ (void)recordClipStop:(id)a3 canonicalId:(id)a4 duration:(double)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAdultContent");

  VUIDefaultLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v13)
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_INFO, "ignore media event for adult content", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    if (v13)
    {
      v16 = 138412546;
      v17 = v9;
      v18 = 2048;
      v19 = a5;
      _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_INFO, "record clip stop %@ - %1.2f", (uint8_t *)&v16, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_metricsDataFromPlayable:actionType:canonicalIdOverride:durationOverride:contentType:", v8, CFSTR("stop"), v9, v14, CFSTR("KeyPlay"));
    v12 = objc_claimAutoreleasedReturnValue();

    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "recordMedia:", v12);

  }
}

+ (id)_metricsDataFromPlayable:(id)a3 actionType:(id)a4 canonicalIdOverride:(id)a5
{
  return (id)objc_msgSend(a1, "_metricsDataFromPlayable:actionType:canonicalIdOverride:durationOverride:contentType:", a3, a4, a5, 0, 0);
}

+ (id)_metricsDataFromPlayable:(id)a3 actionType:(id)a4 canonicalIdOverride:(id)a5 durationOverride:(id)a6 contentType:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a4;
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setObject:forKey:", v16, CFSTR("actionType"));

  if (objc_msgSend(v12, "isRental"))
    objc_msgSend(v17, "setObject:forKey:", CFSTR("rental"), CFSTR("entitlementReason"));
  if (v13)
  {
    objc_msgSend(v17, "setObject:forKey:", v13, CFSTR("id"));
    goto LABEL_12;
  }
  objc_msgSend(v12, "canonicalID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v12, "canonicalID");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v12, "liveStreamServiceID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v12, "liveStreamServiceID");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v12, "referenceID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
        goto LABEL_12;
      objc_msgSend(v12, "referenceID");
      v19 = objc_claimAutoreleasedReturnValue();
    }
  }
  v22 = (void *)v19;
  objc_msgSend(v17, "setObject:forKey:", v19, CFSTR("id"));

LABEL_12:
  objc_msgSend(v12, "externalID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v12, "externalID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v24, CFSTR("externalId"));

  }
  objc_msgSend(v12, "referenceID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v12, "referenceID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v26, CFSTR("referenceId"));

  }
  objc_msgSend(v12, "mediaType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    if (v15)
    {
      v28 = v15;
    }
    else
    {
      objc_msgSend(v12, "utsEntityType");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
      {
        v31 = v29;
      }
      else
      {
        objc_msgSend(v12, "mediaType");
        v31 = (id)objc_claimAutoreleasedReturnValue();
      }
      v28 = v31;

    }
    objc_msgSend(v17, "setObject:forKey:", v28, CFSTR("contentType"));
    objc_msgSend(v17, "objectForKey:", CFSTR("id"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {

    }
    else
    {
      objc_msgSend(v12, "mediaType");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("Trailer"));

      if (v34)
        objc_msgSend(v17, "setObject:forKey:", CFSTR("trailer"), CFSTR("id"));
    }

  }
  objc_msgSend(v12, "channelID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v12, "channelID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v36, CFSTR("brandId"));

  }
  objc_msgSend(v12, "tvAppDeeplinkURL");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v12, "tvAppDeeplinkURL");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "absoluteString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setObject:forKey:", v39, CFSTR("url"));
  }
  objc_msgSend(v12, "liveStreamServiceID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
    objc_msgSend(v17, "setObject:forKey:", v40, CFSTR("serviceId"));
  if (v14)
  {
    v41 = v14;
LABEL_37:
    objc_msgSend(a1, "_convertToMs:", v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setObject:forKey:", v43, CFSTR("duration"));
    goto LABEL_38;
  }
  objc_msgSend(v12, "metadata");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "duration");
  v41 = (id)objc_claimAutoreleasedReturnValue();

  if (v41)
    goto LABEL_37;
LABEL_38:
  v44 = (void *)objc_msgSend(v17, "copy");

  return v44;
}

+ (void)recordPunchout:(id)a3 isUrlForPlay:(BOOL)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t v27[8];
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isAdultContent"))
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_INFO, "ignore media event for adult content", v27, 2u);
    }
  }
  else
  {
    v5 = objc_opt_new();
    -[NSObject setObject:forKey:](v5, "setObject:forKey:", CFSTR("punchout"), CFSTR("actionType"));
    v28 = CFSTR("isEntitledToPlay");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isEntitledToPlay"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject setObject:forKey:](v5, "setObject:forKey:", v7, CFSTR("actionDetails"));
    objc_msgSend(v4, "canonicalID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "canonicalID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v5, "setObject:forKey:", v9, CFSTR("id"));

    }
    objc_msgSend(v4, "externalID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "externalID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v5, "setObject:forKey:", v11, CFSTR("externalId"));

    }
    objc_msgSend(v4, "referenceID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "referenceID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v5, "setObject:forKey:", v13, CFSTR("referenceId"));

    }
    objc_msgSend(v4, "mediaType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "mediaType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v5, "setObject:forKey:", v15, CFSTR("contentType"));

    }
    objc_msgSend(v4, "channelDetails");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "channelID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v4, "channelDetails");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "channelID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v5, "setObject:forKey:", v19, CFSTR("brandId"));

      -[NSObject objectForKey:](v5, "objectForKey:", CFSTR("id"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        objc_msgSend(v4, "channelDetails");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "channelID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKey:](v5, "setObject:forKey:", v22, CFSTR("id"));

      }
    }
    objc_msgSend(v4, "punchoutURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v4, "punchoutURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "absoluteString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject setObject:forKey:](v5, "setObject:forKey:", v25, CFSTR("url"));
    }
    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "recordMedia:", v5);

  }
}

+ (void)recordBGVideoPlayOfTVPMediaItem:(id)a3 contentPosition:(id)a4 isAmbient:(BOOL)a5 actionType:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  uint8_t v16[16];

  v7 = a5;
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v9, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B48]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (v13)
  {
    VUIDefaultLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_INFO, "ignore media event for adult content", v16, 2u);
    }
  }
  else
  {
    +[VUIMetricsMediaEvent _metricsDataFromTVPMediaItem:contentPosition:isBackground:isAmbient:actionType:](VUIMetricsMediaEvent, "_metricsDataFromTVPMediaItem:contentPosition:isBackground:isAmbient:actionType:", v9, v10, 1, v7, v11);
    v14 = objc_claimAutoreleasedReturnValue();
    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "recordMedia:", v14);

  }
}

+ (void)recordBGVideoPlayOfTVPMediaItem:(id)a3 isAmbient:(BOOL)a4
{
  objc_msgSend(a1, "recordBGVideoPlayOfTVPMediaItem:contentPosition:isAmbient:actionType:", a3, 0, a4, 0);
}

+ (void)recordPlayOfTVPMediaItem:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v3 = a3;
  objc_msgSend(v3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B48]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_INFO, "ignore media event for adult content", v8, 2u);
    }
  }
  else
  {
    +[VUIMetricsMediaEvent _metricsDataFromTVPMediaItem:contentPosition:isBackground:isAmbient:actionType:](VUIMetricsMediaEvent, "_metricsDataFromTVPMediaItem:contentPosition:isBackground:isAmbient:actionType:", v3, 0, 0, 0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordMedia:", v6);

  }
}

+ (id)clickMetricsDataFromTVPMediaItem:(id)a3
{
  return +[VUIMetricsMediaEvent clickMetricsDataFromTVPMediaItem:targetType:](VUIMetricsMediaEvent, "clickMetricsDataFromTVPMediaItem:targetType:", a3, CFSTR("button"));
}

+ (id)clickMetricsDataFromTVPMediaItem:(id)a3 targetType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  uint8_t v17[8];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  +[VUIMetricsMediaEvent _metricsDataFromTVPMediaItem:contentPosition:isBackground:isAmbient:actionType:](VUIMetricsMediaEvent, "_metricsDataFromTVPMediaItem:contentPosition:isBackground:isAmbient:actionType:", v6, 0, 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addEntriesFromDictionary:", v8);
  objc_msgSend(v7, "valueForKey:", CFSTR("id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("contentType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("trailer");
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("trailer"));

    if ((v13 & 1) == 0)
    {
      VUIDefaultLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_INFO, "VUIMetricsMediaEvent: No media ID found for non-trailer TVPMediaItem", v17, 2u);
      }

      v11 = &stru_1E9FF3598;
    }
  }
  v18[0] = CFSTR("targetId");
  v18[1] = CFSTR("targetType");
  v19[0] = v11;
  v19[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v15);

  objc_msgSend(v7, "removeObjectForKey:", CFSTR("startType"));
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("url"));
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("id"));

  return v7;
}

+ (id)impressionsMetricsDataFromTVPMediaItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  +[VUIMetricsMediaEvent _metricsDataFromTVPMediaItem:contentPosition:isBackground:isAmbient:actionType:](VUIMetricsMediaEvent, "_metricsDataFromTVPMediaItem:contentPosition:isBackground:isAmbient:actionType:", v3, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("startType"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("url"));
  objc_msgSend(v3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CC8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
    v7 = v6;
  else
    v7 = 0;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("name"));

  return v4;
}

+ (void)recordClickOfSkipInfo:(id)a3 onMediaItem:(id)a4 impressionData:(id)a5
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];
  _QWORD v36[3];
  const __CFString *v37;
  const __CFString *v38;
  _QWORD v39[4];
  _QWORD v40[6];

  v40[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "promoInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "promoInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "canonicalId");
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (__CFString *)v11;
  }
  if (!v8)
  {
    objc_msgSend(v7, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "localizedTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  +[VUIMetricsMediaEvent clickMetricsDataFromTVPMediaItem:](VUIMetricsMediaEvent, "clickMetricsDataFromTVPMediaItem:", v7);
  v13 = objc_claimAutoreleasedReturnValue();
  v30 = v6;
  if (v8)
    v14 = v8;
  else
    v14 = &stru_1E9FF3598;
  v39[0] = CFSTR("targetId");
  v39[1] = CFSTR("actionType");
  v40[0] = v14;
  v40[1] = CFSTR("skip");
  v29 = v7;
  v40[2] = CFSTR("preRoll");
  v39[2] = CFSTR("actionContext");
  v39[3] = CFSTR("actionDetails");
  v28 = (void *)v12;
  if (v12)
    v15 = (const __CFString *)v12;
  else
    v15 = &stru_1E9FF3598;
  v37 = CFSTR("name");
  v38 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addEntriesFromDictionary:", v17);
  +[VUIMetricsJetEngine convertClickDataToImpressionsData:index:ignoreHosted:](VUIMetricsJetEngine, "convertClickDataToImpressionsData:index:ignoreHosted:", v18, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMetricsJetEngine convertClickDataToLocationData:index:](VUIMetricsJetEngine, "convertClickDataToLocationData:index:", v18, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = CFSTR("pageId");
  v35[1] = CFSTR("pageType");
  v36[0] = v14;
  v36[1] = CFSTR("PreRoll");
  v35[2] = CFSTR("pageContext");
  v36[2] = CFSTR("preRoll");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v19;
  v33[0] = CFSTR("impressions");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v23;
  v33[1] = CFSTR("location");
  v31 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addEntriesFromDictionary:", v25);

  objc_msgSend(v22, "addEntriesFromDictionary:", v21);
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "recordClick:", v22);

}

+ (void)recordImpressionsOfSkipButton:(id)a3 onMediaItem:(id)a4 skipInfo:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[3];
  _QWORD v24[3];
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = *MEMORY[0x1E0DB1A08];
  v10 = a3;
  objc_msgSend(v7, "mediaItemMetadataForProperty:", v9);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "promoInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v8, "promoInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "canonicalId");
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (__CFString *)v14;
  }
  if (!v11)
  {
    objc_msgSend(v7, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  +[VUIMetricsMediaEvent impressionsMetricsDataFromTVPMediaItem:](VUIMetricsMediaEvent, "impressionsMetricsDataFromTVPMediaItem:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addEntriesFromDictionary:", v10);

  v25 = CFSTR("actionType");
  v26[0] = CFSTR("skip");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addEntriesFromDictionary:", v17);

  v18 = &stru_1E9FF3598;
  if (v11)
    v18 = v11;
  v23[0] = CFSTR("pageId");
  v23[1] = CFSTR("pageType");
  v24[0] = v18;
  v24[1] = CFSTR("player");
  v23[2] = CFSTR("impressions");
  v22 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "recordImpressions:", v20);

}

+ (id)generateSkipImpressionsFromSkipInfo:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[7];
  _QWORD v21[8];

  v21[7] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithLong:", (uint64_t)(v7 * 1000.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = CFSTR("id");
  objc_msgSend(v4, "promoInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "canonicalId");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(v4, "skipIntroReportingType");
    v12 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v12;
    v11 = CFSTR("intro");
    if (v12)
      v11 = (const __CFString *)v12;
  }
  v21[0] = v11;
  v21[1] = CFSTR("button");
  v20[1] = CFSTR("impressionType");
  v20[2] = CFSTR("actionType");
  v21[2] = CFSTR("skip");
  v20[3] = CFSTR("name");
  objc_msgSend(v4, "localizedTitle");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = &stru_1E9FF3598;
  if (v13)
    v15 = (const __CFString *)v13;
  v21[3] = v15;
  v20[4] = CFSTR("impressionTimes");
  v19 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v16;
  v21[5] = &unk_1EA0B91C0;
  v20[5] = CFSTR("impressionId");
  v20[6] = CFSTR("impressionIndex");
  v21[6] = &unk_1EA0B91D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  return v17;
}

+ (id)generateUpNextButtonImpressionsFromPromoInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  objc_msgSend(v4, "numberWithLong:", (uint64_t)(v6 * 1000.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isAddedToUpNext") & 1) != 0)
    objc_msgSend(v3, "addedToUpNextLabelString");
  else
    objc_msgSend(v3, "addToUpNextLabelString");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("id");
  objc_msgSend(v3, "canonicalId");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = &stru_1E9FF3598;
  if (v9)
    v12 = (const __CFString *)v9;
  else
    v12 = &stru_1E9FF3598;
  if (v8)
    v11 = v8;
  v18[0] = v12;
  v18[1] = v11;
  v17[1] = CFSTR("name");
  v17[2] = CFSTR("impressionTimes");
  v16 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v13;
  v18[3] = &unk_1EA0B91D8;
  v17[3] = CFSTR("impressionId");
  v17[4] = CFSTR("impressionIndex");
  v18[4] = &unk_1EA0B91F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (void)recordImpressionsOfUpNextButton:(id)a3 onMediaItem:(id)a4 promoInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  __CFString **v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "canonicalId");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  +[VUIMetricsMediaEvent impressionsMetricsDataFromTVPMediaItem:](VUIMetricsMediaEvent, "impressionsMetricsDataFromTVPMediaItem:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addEntriesFromDictionary:", v9);

  v23[0] = CFSTR("upNextButton");
  v22[0] = CFSTR("impressionType");
  v22[1] = CFSTR("actionType");
  LODWORD(v9) = objc_msgSend(v7, "isAddedToUpNext");

  v13 = VUIMetricsActionTypeRemove;
  if (!(_DWORD)v9)
    v13 = VUIMetricsActionTypeAdd;
  v23[1] = *v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addEntriesFromDictionary:", v14);

  v15 = &stru_1E9FF3598;
  if (v10)
    v15 = v10;
  v20[0] = CFSTR("pageId");
  v20[1] = CFSTR("pageType");
  v21[0] = v15;
  v21[1] = CFSTR("player");
  v20[2] = CFSTR("impressions");
  v19 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "recordImpressions:", v17);

}

+ (void)recordClickOfUpNextButtonWithPromoInfo:(id)a3 onMediaItem:(id)a4 impressionData:(id)a5
{
  id v6;
  id v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  __CFString **v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];
  _QWORD v33[3];
  const __CFString *v34;
  const __CFString *v35;
  _QWORD v36[4];
  _QWORD v37[6];

  v37[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "canonicalId");
  v8 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isAddedToUpNext") & 1) != 0)
    objc_msgSend(v6, "addedToUpNextLabelString");
  else
    objc_msgSend(v6, "addToUpNextLabelString");
  v9 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v9;
  +[VUIMetricsMediaEvent clickMetricsDataFromTVPMediaItem:targetType:](VUIMetricsMediaEvent, "clickMetricsDataFromTVPMediaItem:targetType:", v7, CFSTR("upNextButton"));
  v10 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v10;

  v27 = (__CFString *)v8;
  if (!v8)
    v8 = &stru_1E9FF3598;
  v37[0] = v8;
  v36[0] = CFSTR("targetId");
  v36[1] = CFSTR("actionType");
  v11 = objc_msgSend(v6, "isAddedToUpNext");
  v12 = VUIMetricsActionTypeRemove;
  if (!v11)
    v12 = VUIMetricsActionTypeAdd;
  v37[1] = *v12;
  v37[2] = CFSTR("preRoll");
  v36[2] = CFSTR("actionContext");
  v36[3] = CFSTR("actionDetails");
  if (v9)
    v13 = (const __CFString *)v9;
  else
    v13 = &stru_1E9FF3598;
  v34 = CFSTR("name");
  v35 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addEntriesFromDictionary:", v15);
  +[VUIMetricsJetEngine convertClickDataToImpressionsData:index:ignoreHosted:](VUIMetricsJetEngine, "convertClickDataToImpressionsData:index:ignoreHosted:", v16, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMetricsJetEngine convertClickDataToLocationData:index:](VUIMetricsJetEngine, "convertClickDataToLocationData:index:", v16, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = CFSTR("pageId");
  v32[1] = CFSTR("pageType");
  v33[0] = v8;
  v33[1] = CFSTR("PreRoll");
  v32[2] = CFSTR("pageContext");
  v33[2] = CFSTR("preRoll");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v17;
  v30[0] = CFSTR("impressions");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v21;
  v30[1] = CFSTR("location");
  v28 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addEntriesFromDictionary:", v23);

  objc_msgSend(v20, "addEntriesFromDictionary:", v19);
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "recordClick:", v20);

}

+ (id)_metricsDataFromTVPMediaItem:(id)a3 contentPosition:(id)a4 isBackground:(BOOL)a5 isAmbient:(BOOL)a6 actionType:(id)a7
{
  id v10;
  id v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  __CFString *v36;
  uint64_t v37;
  void *v38;
  __CFString *v39;
  void *v40;
  const __CFString *v41;
  __CFString *v42;
  NSObject *v44;
  __CFString *v46;
  _BOOL4 v47;
  void *v48;

  v47 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (const __CFString *)a7;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v10, "mediaItemURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v10, "mediaItemURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setObject:forKey:", v16, CFSTR("url"));
  }
  v46 = (__CFString *)v12;
  if (v12)
    v17 = v12;
  else
    v17 = CFSTR("play");
  objc_msgSend(v13, "setObject:forKey:", v17, CFSTR("actionType"));
  objc_msgSend(v10, "mediaItemMetadataForProperty:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    objc_msgSend(v10, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;

  objc_msgSend(v10, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  v24 = v21;
  if (v21 || (v24 = (void *)v22) != 0)
    objc_msgSend(v13, "setObject:forKey:", v24, CFSTR("id"));
  objc_msgSend(v10, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AB0]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_msgSend(v13, "setObject:forKey:", v25, CFSTR("externalId"));
  objc_msgSend(v10, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BE8]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    objc_msgSend(v13, "setObject:forKey:", v26, CFSTR("referenceId"));
  v48 = v23;
  objc_msgSend(v10, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19F0]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    objc_msgSend(v13, "setObject:forKey:", v27, CFSTR("brandId"));
  objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataClipDuration"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28
    || (objc_msgSend(v10, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A88]),
        (v28 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(a1, "_convertToMs:", v28);
    v29 = v21;
    v30 = a1;
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setObject:forKey:", v31, CFSTR("duration"));
    a1 = v30;
    v21 = v29;
  }
  objc_msgSend(v10, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B60]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
    objc_msgSend(v13, "setObject:forKey:", v32, CFSTR("serviceId"));
  if (v11)
  {
    objc_msgSend(a1, "_convertToMs:", v11);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setObject:forKey:", v33, CFSTR("position"));
  }
  if (v47)
  {
    objc_msgSend(v13, "setObject:forKey:", CFSTR("automatic"), CFSTR("startType"));
    objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataClipId"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "length");

    if (v35)
      v36 = CFSTR("KeyPlay");
    else
      v36 = CFSTR("ambient");
    if (!v35 && !a6)
    {
      objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("utsEntityType"));
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v37;
      v39 = CFSTR("trailer");
      if (v37)
        v39 = (__CFString *)v37;
      v36 = v39;

    }
    v40 = v13;
    v41 = v36;
    goto LABEL_41;
  }
  objc_msgSend(v10, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
  v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v36 = v42;
  if (v42)
  {
    if ((-[__CFString isEqualToString:](v42, "isEqualToString:", *MEMORY[0x1E0DB1DC0]) & 1) != 0)
    {
LABEL_39:
      v41 = CFSTR("movie");
LABEL_40:
      v40 = v13;
LABEL_41:
      objc_msgSend(v40, "setObject:forKey:", v41, CFSTR("contentType"));
      goto LABEL_42;
    }
    if (-[__CFString isEqualToString:](v36, "isEqualToString:", *MEMORY[0x1E0DB1DD0]))
    {
      objc_msgSend(v13, "setObject:forKey:", CFSTR("rental"), CFSTR("entitlementReason"));
      goto LABEL_39;
    }
    if ((-[__CFString isEqualToString:](v36, "isEqualToString:", *MEMORY[0x1E0DB1DD8]) & 1) != 0)
    {
      v41 = CFSTR("episode");
      goto LABEL_40;
    }
    VUIDefaultLogObject();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      +[VUIMetricsMediaEvent _metricsDataFromTVPMediaItem:contentPosition:isBackground:isAmbient:actionType:].cold.1(v44);

  }
LABEL_42:

  return v13;
}

+ (id)_convertToMs:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "longValue");
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1000 * v3);
}

+ (void)_metricsDataFromTVPMediaItem:(os_log_t)log contentPosition:isBackground:isAmbient:actionType:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "unrecognized mediaItem TVPMediaItemMetadataMediaType for contentType", v1, 2u);
}

@end
