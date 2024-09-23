@implementation SREMusicFeatureExtraction

- (SREMusicFeatureExtraction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SREMusicFeatureExtraction;
  return -[SREMusicFeatureExtraction init](&v3, sel_init);
}

- (id)retrieveNowPlayingHistoryWithLength:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  id v21[2];
  id location;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE584D0]), "initAndReturnError:", a4);
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDD1508]);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -2419200.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithStartDate:endDate:", v9, v10);

    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy_;
    v27 = __Block_byref_object_dispose_;
    v28 = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    location = 0;
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __71__SREMusicFeatureExtraction_retrieveNowPlayingHistoryWithLength_error___block_invoke;
    v18[3] = &unk_2519053B8;
    objc_copyWeak(v21, &location);
    v12 = v7;
    v21[1] = (id)a3;
    v19 = v12;
    v20 = &v23;
    if ((objc_msgSend(v12, "enumerateSongEventsThatOverlapWithDateInterval:ascending:error:usingBlock:", v11, 0, a4, v18) & 1) != 0)
    {
      v13 = (id)v24[5];
    }
    else
    {
      logForCSLogCategoryRecs();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[SREMusicFeatureExtraction retrieveNowPlayingHistoryWithLength:error:].cold.2((uint64_t *)a4, v15, v16);

      v13 = 0;
    }

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v23, 8);

  }
  else
  {
    logForCSLogCategoryRecs();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SREMusicFeatureExtraction retrieveNowPlayingHistoryWithLength:error:].cold.1((uint64_t *)a4, v11, v14);
    v13 = 0;
  }

  return v13;
}

void __71__SREMusicFeatureExtraction_retrieveNowPlayingHistoryWithLength_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  _QWORD *v4;
  id *v5;
  id v6;
  id WeakRetained;

  v4 = (_QWORD *)a1;
  v5 = (id *)(a1 + 48);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  LOBYTE(v4) = objc_msgSend(WeakRetained, "_handleSongEvent:context:numMusic:outputSequence:", v6, v4[4], v4[7], *(_QWORD *)(*(_QWORD *)(v4[5] + 8) + 40));

  *a3 = v4 ^ 1;
}

- (BOOL)_handleSongEvent:(id)a3 context:(id)a4 numMusic:(unint64_t)a5 outputSequence:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SREMusicMetadata *v22;
  void *v23;
  void *v24;
  BOOL v25;
  NSObject *v26;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (objc_msgSend(v11, "count") >= a5)
  {
    v25 = 0;
  }
  else
  {
    objc_msgSend(v9, "playbackState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Playing"));

    if (v13)
    {
      objc_msgSend(v9, "song");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "songId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "graphSongFromContext:error:", v10, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        logForCSLogCategoryRecs();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v16, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "date");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "startDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "songAdamId");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 138412802;
          v29 = v18;
          v30 = 2112;
          v31 = v20;
          v32 = 2112;
          v33 = v21;
          _os_log_impl(&dword_247974000, v17, OS_LOG_TYPE_DEFAULT, "Now playing sequence: Song name: %@ Song event start date: %@ Adam ID: %@", (uint8_t *)&v28, 0x20u);

        }
        v22 = objc_alloc_init(SREMusicMetadata);
        objc_msgSend(v16, "songAdamId");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[SREMusicMetadata setAdamID:](v22, "setAdamID:", objc_msgSend(v23, "integerValue"));

        if (-[SREMusicMetadata adamID](v22, "adamID") <= 0)
        {
          logForCSLogCategoryRecs();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[SREMusicFeatureExtraction _handleSongEvent:context:numMusic:outputSequence:].cold.1(v16, v26);

          v25 = 1;
        }
        else
        {
          objc_msgSend(v16, "genre");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[SREMusicMetadata setGenreID:](v22, "setGenreID:", v24);

          objc_msgSend(v11, "addObject:", v22);
          v25 = objc_msgSend(v11, "count") < a5;
        }

      }
      else
      {
        v25 = 1;
      }

    }
    else
    {
      v25 = 1;
    }
  }

  return v25;
}

- (void)retrieveNowPlayingHistoryWithLength:(uint64_t)a3 error:.cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_0(&dword_247974000, a2, a3, "GDGraphAppleMusicEventContext creation failed. error=%@", (uint8_t *)&v4);
}

- (void)retrieveNowPlayingHistoryWithLength:(uint64_t)a3 error:.cold.2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_0(&dword_247974000, a2, a3, "Enumerate apple music events failed. Error: %@", (uint8_t *)&v4);
}

- (void)_handleSongEvent:(void *)a1 context:(NSObject *)a2 numMusic:outputSequence:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "songAdamId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_247974000, a2, v4, "Invalid adamID from now playing stream: %@", (uint8_t *)&v5);

}

@end
