@implementation VUIMediaStartTimeCollection

void __41__VUIMediaStartTimeCollection_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppleTV.playback", "VUIMediaStartTimeCollection");
  v1 = (void *)sLogObject_12;
  sLogObject_12 = (uint64_t)v0;

}

- (NSMutableArray)startTimeInfos
{
  return self->_startTimeInfos;
}

- (VUIMediaStartTimeInfo)preferredStartTimeInfo
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  VUIMediaStartTimeInfo *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  VUIMediaStartTimeInfo *v14;
  void *v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  VUIMediaStartTimeInfo *v21;
  void *v22;
  void *v23;
  VUIMediaStartTimeInfo *v24;
  NSObject *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  VUIMediaStartTimeInfo *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[VUIMediaStartTimeCollection startTimeInfos](self, "startTimeInfos", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (!v3)
  {
    v5 = 0;
    goto LABEL_24;
  }
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v28;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v28 != v6)
        objc_enumerationMutation(v2);
      v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
      if (!v5)
      {
        v5 = v8;
        continue;
      }
      -[VUIMediaStartTimeInfo timestamp](v5, "timestamp");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timestamp");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v9 && v10)
      {
        objc_msgSend((id)v10, "laterDate:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 != v11)
        {
          if (!objc_msgSend(v11, "isEqualToDate:", v9))
            goto LABEL_19;
LABEL_14:
          v13 = objc_msgSend(v8, "type");
          if (v13 == -[VUIMediaStartTimeInfo type](v5, "type") || objc_msgSend(v8, "type") != 1)
            goto LABEL_19;
        }
LABEL_18:
        v14 = v8;

        v5 = v14;
        goto LABEL_19;
      }
      if (!(v9 | v10))
        goto LABEL_14;
      if (v10)
        goto LABEL_18;
LABEL_19:

    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  }
  while (v4);
LABEL_24:

  -[VUIMediaStartTimeInfo startTime](v5, "startTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  if (v16 != 0.0)
  {

LABEL_30:
    v24 = v5;
    return v24;
  }
  v17 = -[VUIMediaStartTimeInfo type](v5, "type");

  if (v17 != 1)
    goto LABEL_30;
  +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "nowPlayingConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "convertMainContentRelativeStartTimeOfZeroToAbsoluteStartTimeOfZero");

  if (!v20)
    goto LABEL_30;
  v21 = [VUIMediaStartTimeInfo alloc];
  -[VUIMediaStartTimeInfo timestamp](v5, "timestamp");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaStartTimeInfo source](v5, "source");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[VUIMediaStartTimeInfo initWithStartTime:timestamp:type:source:](v21, "initWithStartTime:timestamp:type:source:", &unk_1EA0B9BB0, v22, 0, v23);

  v25 = sLogObject_12;
  if (os_log_type_enabled((os_log_t)sLogObject_12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v24;
    _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_DEFAULT, "By policy, converting relative start time of 0 to absolute start time of 0: %@", buf, 0xCu);
  }
  return v24;
}

+ (void)initialize
{
  if (initialize_onceToken_6 != -1)
    dispatch_once(&initialize_onceToken_6, &__block_literal_global_87);
}

- (void)addStartTimeInfo:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[VUIMediaStartTimeCollection startTimeInfos](self, "startTimeInfos");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[VUIMediaStartTimeCollection setStartTimeInfos:](self, "setStartTimeInfos:", v4);
  }
  if (v5)
    objc_msgSend(v4, "addObject:", v5);

}

- (void)removeAllStartTimeInfos
{
  id v2;

  -[VUIMediaStartTimeCollection startTimeInfos](self, "startTimeInfos");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)setStartTimeInfos:(id)a3
{
  objc_storeStrong((id *)&self->_startTimeInfos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTimeInfos, 0);
}

@end
