@implementation RCComposition

+ (BOOL)_markCompositionAVURLsBeingModified:(id)a3
{
  id v3;
  id v4;
  char v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__RCComposition__markCompositionAVURLsBeingModified___block_invoke;
  v7[3] = &unk_1E769C5D0;
  v8 = v3;
  v9 = &v10;
  v4 = v3;
  _accessActiveCaptureCompositionAVURLs(v7);
  v5 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __53__RCComposition__markCompositionAVURLsBeingModified___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(v3, "removeAllObjects");
    objc_msgSend(v3, "unionSet:", *(_QWORD *)(a1 + 32));
    OSLogForCategory(CFSTR("Default"));
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __53__RCComposition__markCompositionAVURLsBeingModified___block_invoke_cold_1(v3);

  }
}

- (id)_initWithComposedAVURL:(id)a3 savedRecordingUUID:(id)a4 creationDate:(id)a5 title:(id)a6 musicMemoMetadata:(id)a7 decomposedFragments:(id)a8 composedFragments:(id)a9
{
  id v16;
  id v17;
  id v18;
  RCComposition *v19;
  RCComposition *v20;
  uint64_t v21;
  NSURL *composedWaveformURL;
  NSArray *v23;
  NSArray *decomposedFragments;
  NSArray *v25;
  NSArray *composedFragments;
  uint64_t v27;
  NSObject *composedFragmentsMutex;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v16 = a3;
  v33 = a4;
  v32 = a5;
  v31 = a6;
  v30 = a7;
  v17 = a8;
  v18 = a9;
  v34.receiver = self;
  v34.super_class = (Class)RCComposition;
  v19 = -[RCComposition init](&v34, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_composedAVURL, a3);
    +[RCWaveform waveformURLForAVURL:](RCWaveform, "waveformURLForAVURL:", v16, v30, v31, v32, v33);
    v21 = objc_claimAutoreleasedReturnValue();
    composedWaveformURL = v20->_composedWaveformURL;
    v20->_composedWaveformURL = (NSURL *)v21;

    objc_storeStrong((id *)&v20->_savedRecordingUUID, a4);
    objc_storeStrong((id *)&v20->_creationDate, a5);
    objc_storeStrong((id *)&v20->_title, a6);
    objc_storeStrong((id *)&v20->_musicMemoMetadata, a7);
    if (v17)
    {
      v23 = (NSArray *)v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    decomposedFragments = v20->_decomposedFragments;
    v20->_decomposedFragments = v23;

    if (v18)
    {
      v25 = (NSArray *)v18;
    }
    else
    {
      -[RCComposition _calculateComposedFragments](v20, "_calculateComposedFragments");
      v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    composedFragments = v20->_composedFragments;
    v20->_composedFragments = v25;

    v27 = objc_opt_new();
    composedFragmentsMutex = v20->_composedFragmentsMutex;
    v20->_composedFragmentsMutex = v27;

  }
  return v20;
}

- (id)_initWithSavedRecording:(id)a3 decomposedFragments:(id)a4 composedFragments:(id)a5
{
  id v8;
  id v9;
  id v10;
  RCComposition *v11;
  void *v12;
  uint64_t v13;
  NSURL *composedWaveformURL;
  uint64_t v15;
  NSString *savedRecordingUUID;
  uint64_t v17;
  NSDate *creationDate;
  uint64_t v19;
  NSString *title;
  NSArray *v21;
  NSArray *decomposedFragments;
  NSArray *v23;
  NSArray *composedFragments;
  uint64_t v25;
  NSObject *composedFragmentsMutex;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)RCComposition;
  v11 = -[RCComposition init](&v28, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v11->_composedAVURL, v12);
    +[RCWaveform waveformURLForAVURL:](RCWaveform, "waveformURLForAVURL:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    composedWaveformURL = v11->_composedWaveformURL;
    v11->_composedWaveformURL = (NSURL *)v13;

    objc_msgSend(v8, "uuid");
    v15 = objc_claimAutoreleasedReturnValue();
    savedRecordingUUID = v11->_savedRecordingUUID;
    v11->_savedRecordingUUID = (NSString *)v15;

    objc_msgSend(v8, "creationDate");
    v17 = objc_claimAutoreleasedReturnValue();
    creationDate = v11->_creationDate;
    v11->_creationDate = (NSDate *)v17;

    objc_msgSend(v8, "title");
    v19 = objc_claimAutoreleasedReturnValue();
    title = v11->_title;
    v11->_title = (NSString *)v19;

    if (objc_msgSend(v8, "musicMemo"))
      -[RCComposition _loadMusicMemoMetadata](v11, "_loadMusicMemoMetadata");
    if (v9)
    {
      v21 = (NSArray *)v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    decomposedFragments = v11->_decomposedFragments;
    v11->_decomposedFragments = v21;

    if (v10)
    {
      v23 = (NSArray *)v10;
    }
    else
    {
      -[RCComposition _calculateComposedFragments](v11, "_calculateComposedFragments");
      v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    composedFragments = v11->_composedFragments;
    v11->_composedFragments = v23;

    v25 = objc_opt_new();
    composedFragmentsMutex = v11->_composedFragmentsMutex;
    v11->_composedFragmentsMutex = v25;

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[RCComposition _initWithComposedAVURL:savedRecordingUUID:creationDate:title:musicMemoMetadata:decomposedFragments:composedFragments:]([RCComposition alloc], "_initWithComposedAVURL:savedRecordingUUID:creationDate:title:musicMemoMetadata:decomposedFragments:composedFragments:", self->_composedAVURL, self->_savedRecordingUUID, self->_creationDate, self->_title, self->_musicMemoMetadata, self->_decomposedFragments, self->_composedFragments);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[RCComposition _initWithComposedAVURL:savedRecordingUUID:creationDate:title:musicMemoMetadata:decomposedFragments:composedFragments:]([RCMutableComposition alloc], "_initWithComposedAVURL:savedRecordingUUID:creationDate:title:musicMemoMetadata:decomposedFragments:composedFragments:", self->_composedAVURL, self->_savedRecordingUUID, self->_creationDate, self->_title, self->_musicMemoMetadata, self->_decomposedFragments, self->_composedFragments);
}

- (NSString)description
{
  void *v3;
  void *v4;
  NSString *savedRecordingUUID;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)RCComposition;
  -[RCComposition description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  savedRecordingUUID = self->_savedRecordingUUID;
  -[NSURL path](self->_composedAVURL, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_composedWaveformURL, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[RCComposition composedDuration](self, "composedDuration");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ savedRecordingUUID = %@, AVURL = %@ (waveformURL = %@), composedDuration = %@, _decomposedFragments = %@"), v4, savedRecordingUUID, v6, v7, v9, self->_decomposedFragments);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (RCComposition)initWithDictionaryPListRepresentation:(id)a3
{
  id v4;
  RCComposition *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSURL *composedAVURL;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSURL *composedWaveformURL;
  uint64_t v16;
  NSString *savedRecordingUUID;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDate *creationDate;
  uint64_t v22;
  NSString *title;
  uint64_t v24;
  NSDictionary *musicMemoMetadata;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  RCCompositionFragment *v32;
  uint64_t v33;
  NSArray *composedFragments;
  uint64_t v35;
  NSObject *composedFragmentsMutex;
  void *v37;
  int v38;
  NSObject *v39;
  RCComposition *v40;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)RCComposition;
  v5 = -[RCComposition init](&v47, sel_init);
  if (!v5)
    goto LABEL_17;
  v6 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v4, "objectForKey:", CFSTR("RCComposedAVURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rc_URLByFixingUpPersistentMediaRecordingsDirectory");
  v9 = objc_claimAutoreleasedReturnValue();
  composedAVURL = v5->_composedAVURL;
  v5->_composedAVURL = (NSURL *)v9;

  v11 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v4, "objectForKey:", CFSTR("RCComposedWaveformURL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLWithString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rc_URLByFixingUpPersistentMediaRecordingsDirectory");
  v14 = objc_claimAutoreleasedReturnValue();
  composedWaveformURL = v5->_composedWaveformURL;
  v5->_composedWaveformURL = (NSURL *)v14;

  objc_msgSend(v4, "objectForKey:", CFSTR("RCSavedRecordingUUID"));
  v16 = objc_claimAutoreleasedReturnValue();
  savedRecordingUUID = v5->_savedRecordingUUID;
  v5->_savedRecordingUUID = (NSString *)v16;

  objc_msgSend(v4, "objectForKey:", CFSTR("RCSavedRecordingCreationTime"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v18;
  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v18, "doubleValue");
    objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("RCSavedRecordingCreationDate"));
  }
  v20 = objc_claimAutoreleasedReturnValue();
  creationDate = v5->_creationDate;
  v5->_creationDate = (NSDate *)v20;

  objc_msgSend(v4, "objectForKey:", CFSTR("RCSavedRecordingTitle"));
  v22 = objc_claimAutoreleasedReturnValue();
  title = v5->_title;
  v5->_title = (NSString *)v22;

  objc_msgSend(v4, "objectForKey:", CFSTR("RCSavedRecordingMusicMemoMetadata"));
  v24 = objc_claimAutoreleasedReturnValue();
  musicMemoMetadata = v5->_musicMemoMetadata;
  v5->_musicMemoMetadata = (NSDictionary *)v24;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v4, "objectForKey:", CFSTR("RCDecomposedFragments"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v44 != v30)
          objc_enumerationMutation(v27);
        v32 = -[RCCompositionFragment initWithDictionaryPListRepresentation:]([RCCompositionFragment alloc], "initWithDictionaryPListRepresentation:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
        objc_msgSend(v26, "addObject:", v32);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v29);
  }

  objc_storeStrong((id *)&v5->_decomposedFragments, v26);
  -[RCComposition _calculateComposedFragments](v5, "_calculateComposedFragments");
  v33 = objc_claimAutoreleasedReturnValue();
  composedFragments = v5->_composedFragments;
  v5->_composedFragments = (NSArray *)v33;

  v35 = objc_opt_new();
  composedFragmentsMutex = v5->_composedFragmentsMutex;
  v5->_composedFragmentsMutex = v35;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "rc_fileExistsAndIsInValidRecordingURL:", v5->_composedAVURL);

  if (!v38)
  {

LABEL_17:
    v40 = v5;
    goto LABEL_18;
  }
  OSLogForCategory(CFSTR("Default"));
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    -[RCComposition initWithDictionaryPListRepresentation:].cold.1((id *)&v5->_composedAVURL);

  v40 = 0;
LABEL_18:

  return v40;
}

- (id)dictionaryPListRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSDate *creationDate;
  void *v8;
  void *v9;
  void *v10;
  NSDictionary *musicMemoMetadata;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL absoluteString](self->_composedAVURL, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("RCComposedAVURL"));
  -[NSURL absoluteString](self->_composedWaveformURL, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("RCComposedWaveformURL"));
  v6 = self->_savedRecordingUUID;

  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("RCSavedRecordingUUID"));
  creationDate = self->_creationDate;
  if (creationDate)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSinceReferenceDate](creationDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("RCSavedRecordingCreationTime"));

    objc_msgSend(v3, "setObject:forKey:", self->_creationDate, CFSTR("RCSavedRecordingCreationDate"));
  }
  -[RCComposition title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("RCSavedRecordingTitle"));
  musicMemoMetadata = self->_musicMemoMetadata;
  if (musicMemoMetadata)
    objc_msgSend(v3, "setObject:forKey:", musicMemoMetadata, CFSTR("RCSavedRecordingMusicMemoMetadata"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = self->_decomposedFragments;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "dictionaryPListRepresentation", (_QWORD)v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("RCDecomposedFragments"));
  return v3;
}

+ (id)_unitTestingCompositionWithDecomposedFragments:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = a3;
  objc_msgSend(v3, "URLWithString:", CFSTR("*composedAVURL*"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithComposedAVURL:savedRecordingUUID:creationDate:title:musicMemoMetadata:decomposedFragments:composedFragments:", v5, 0, 0, 0, 0, v4, 0);

  return v6;
}

+ (id)_compositionLoadedFromMetadataURL:(id)a3 composedAVURL:(id)a4 savedRecordingUUID:(id)a5 creationDate:(id)a6 createIfNeeded:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v22;

  v7 = a7;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v14, 0, 0, &v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v22;
    if (v16)
    {
      v17 = v16;
      OSLogForCategory(CFSTR("Default"));
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        +[RCComposition _compositionLoadedFromMetadataURL:composedAVURL:savedRecordingUUID:creationDate:createIfNeeded:].cold.1();

      v19 = 0;
    }
    else
    {
      v20 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDictionaryPListRepresentation:", v15);
      v19 = v20;
      if (v12)
        objc_msgSend(v20, "setSavedRecordingUUID:", v12);

    }
  }
  else
  {
    v19 = 0;
    if (v11 && v7)
      v19 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithComposedAVURL:savedRecordingUUID:creationDate:title:musicMemoMetadata:decomposedFragments:composedFragments:", v11, v12, v13, 0, 0, 0, 0);
  }

  return v19;
}

+ (id)_compositionLoadedFromMetadataURL:(id)a3 savedRecording:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, &v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v16;
    if (v8)
    {
      v9 = v8;
      OSLogForCategory(CFSTR("Default"));
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[RCComposition _compositionLoadedFromMetadataURL:savedRecording:].cold.1();

      goto LABEL_8;
    }
    v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDictionaryPListRepresentation:", v7);
    if (v5)
    {
      objc_msgSend(v5, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSavedRecordingUUID:", v12);

      objc_msgSend(v5, "creationDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCreationDate:", v13);

      objc_msgSend(v5, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTitle:", v14);

      if (objc_msgSend(v5, "musicMemo"))
        objc_msgSend(v11, "_loadMusicMemoMetadata");
    }

  }
  else
  {
    if (!v5)
    {
LABEL_8:
      v11 = 0;
      goto LABEL_13;
    }
    v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithSavedRecording:decomposedFragments:composedFragments:", v5, 0, 0);
  }
LABEL_13:

  return v11;
}

+ (id)compositionLoadedFromCompositionBundleURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_compositionMetadataURLForCompositionBundleURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_compositionLoadedFromMetadataURL:composedAVURL:savedRecordingUUID:creationDate:createIfNeeded:", v4, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)compositionLoadedForComposedAVURL:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  +[RCComposition compositionMetadataURLForComposedAVURL:](RCComposition, "compositionMetadataURLForComposedAVURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_compositionLoadedFromMetadataURL:composedAVURL:savedRecordingUUID:creationDate:createIfNeeded:", v7, v6, 0, 0, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)uriRepresentationForLegacyComposedAVURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[RCComposition compositionMetadataURLForComposedAVURL:](RCComposition, "compositionMetadataURLForComposedAVURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RCSavedRecordingURI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)compositionLoadedForSavedRecording:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RCComposition compositionMetadataURLForComposedAVURL:](RCComposition, "compositionMetadataURLForComposedAVURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_compositionLoadedFromMetadataURL:savedRecording:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)compositionLoadedForEditingSavedRecording:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  __n128 v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "compositionLoadedForSavedRecording:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "composedFragments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    objc_msgSend(v6, "length");
    v11 = v10;
    v12.n128_u64[0] = 0;
    v13 = RCTimeRangeMake(v12, v11);
    v15 = v14;
    v16 = (void *)objc_msgSend(v7, "newRandomFragmentWithInsertionTimeRangeInComposition:pathExtension:", CFSTR("m4a"));
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    objc_msgSend(v17, "setContentDuration:", v11);
    objc_msgSend(v17, "setTimeRangeInContentToUse:", v13, v15);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "url");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "AVOutputURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v18, "moveItemAtURL:toURL:error:", v19, v20, a4);

    if (!v21)
    {

      v23 = 0;
      goto LABEL_5;
    }
    v25[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDecomposedFragments:", v22);

    objc_msgSend(v7, "saveMetadataToDefaultLocation");
  }
  v23 = v7;
LABEL_5:

  return v23;
}

- (BOOL)isContentBeingModified
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_class();
  -[RCComposition composedAVURL](self, "composedAVURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "_isSessionWithModificationAccessActiveForComposedAVURL:", v4);

  return (char)v3;
}

- (void)setSavedRecordingUUIDFromRecoveredRecordingUUID:(id)a3
{
  objc_storeStrong((id *)&self->_savedRecordingUUID, a3);
}

- (void)setDecomposedFragments:(id)a3
{
  NSArray *v5;
  void *v6;
  NSArray *v7;

  v5 = (NSArray *)a3;
  if (self->_decomposedFragments != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_decomposedFragments, a3);
    -[RCComposition _calculateComposedFragments](self, "_calculateComposedFragments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCComposition setComposedFragments:](self, "setComposedFragments:", v6);

    -[RCComposition recacheComposedDuration](self, "recacheComposedDuration");
    v5 = v7;
  }

}

- (NSArray)composedFragments
{
  NSObject *v3;
  void *v4;

  v3 = self->_composedFragmentsMutex;
  objc_sync_enter(v3);
  v4 = (void *)-[NSArray copy](self->_composedFragments, "copy");
  objc_sync_exit(v3);

  return (NSArray *)v4;
}

- (void)setComposedFragments:(id)a3
{
  NSArray *v4;
  NSObject *v5;
  NSArray *composedFragments;
  NSArray *v7;

  v4 = (NSArray *)a3;
  v5 = self->_composedFragmentsMutex;
  objc_sync_enter(v5);
  composedFragments = self->_composedFragments;
  self->_composedFragments = v4;
  v7 = v4;

  objc_sync_exit(v5);
}

- (unint64_t)fileSizeOfAssets
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[RCComposition decomposedFragments](self, "decomposedFragments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__RCComposition_fileSizeOfAssets__block_invoke;
  v7[3] = &unk_1E769C580;
  v7[4] = &v8;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  v4 = v9[3];
  v5 = -[RCComposition _fileSizeOfComposedAssets](self, "_fileSizeOfComposedAssets") + v4;
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __33__RCComposition_fileSizeOfAssets__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "fileSizeOfAssets");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (unint64_t)_fileSizeOfComposedAssets
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_composedAVURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
  {
    -[NSURL path](self->_composedAVURL, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attributesOfItemAtPath:error:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "longLongValue");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)composedFragmentsIntersectingTimeRange:(id)a3
{
  double var1;
  double var0;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  uint64_t v15;

  var1 = a3.var1;
  var0 = a3.var0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCComposition composedFragments](self, "composedFragments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  while (1)
  {
    v10 = v9;
    objc_msgSend(v8, "nextObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      break;
    objc_msgSend(v9, "timeRangeInComposition");
    if (RCTimeRangeIntersectsRange(v11, v12, var0, var1))
    {
      objc_msgSend(v6, "addObject:", v9);
      objc_msgSend(v8, "nextObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        do
        {
          objc_msgSend(v13, "timeRangeInComposition");
          if (v14 >= var1)
            break;
          objc_msgSend(v6, "addObject:", v13);
          objc_msgSend(v8, "nextObject");
          v15 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v15;
        }
        while (v15);

      }
      break;
    }
  }

  return v6;
}

- (id)compositionByDeletingAndSplittingAtComposedTimeRange:(id)a3
{
  double var1;
  double var0;
  void *v6;
  __n128 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  var1 = a3.var1;
  var0 = a3.var0;
  v46 = *MEMORY[0x1E0C80C00];
  a3.var0 = -3.40282347e38;
  -[RCComposition compositionByClippingToComposedTimeRange:](self, "compositionByClippingToComposedTimeRange:", RCTimeRangeMake((__n128)a3, var0));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7.n128_f64[0] = var1;
  -[RCComposition compositionByClippingToComposedTimeRange:](self, "compositionByClippingToComposedTimeRange:", RCTimeRangeMake(v7, 3.40282347e38));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    v10 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v9, "decomposedFragments");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      v33 = v9;
      v34 = v6;
      objc_msgSend(v10, "decomposedFragments");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");

      v32 = v10;
      objc_msgSend(v10, "composedFragments");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeRangeInComposition");
      v18 = v17;

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v19 = v12;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v36;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v36 != v22)
              objc_enumerationMutation(v19);
            v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v23), "mutableCopy");
            objc_msgSend(v24, "timeRangeInComposition");
            v27 = RCTimeRangeShift(v25, v26, v18);
            if (var0 >= v27)
              v28 = var0;
            else
              v28 = v27;
            objc_msgSend(v24, "setTimeRangeInComposition:", v28);
            objc_msgSend(v14, "addObject:", v24);
            if (v28 < var0)
            {
              OSLogForCategory(CFSTR("Default"));
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                NSStringFromRCTimeRange(var0, var1);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v40 = "-[RCComposition compositionByDeletingAndSplittingAtComposedTimeRange:]";
                v41 = 2112;
                v42 = v24;
                v43 = 2112;
                v44 = v30;
                _os_log_error_impl(&dword_1BD830000, v29, OS_LOG_TYPE_ERROR, "%s -- Invalid fragment times:  %@, composedTimeRange = %@", buf, 0x20u);

              }
            }

            ++v23;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
        }
        while (v21);
      }

      v10 = v32;
      objc_msgSend(v32, "setDecomposedFragments:", v14);

      v9 = v33;
      v6 = v34;
    }
  }
  else
  {
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
  }

  return v10;
}

- (id)compositionByClippingToComposedTimeRange:(id)a3
{
  double var1;
  double var0;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  double v21;
  __n128 v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  var1 = a3.var1;
  var0 = a3.var0;
  v29 = *MEMORY[0x1E0C80C00];
  -[RCComposition composedFragmentsIntersectingTimeRange:](self, "composedFragmentsIntersectingTimeRange:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    v9 = 0;
    if (v7)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(v6, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8 != 0;
    if (v7)
      goto LABEL_7;
  }
  if (!v9)
  {
    v10 = 0;
    goto LABEL_19;
  }
LABEL_7:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    v16 = 0.0;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "mutableCopy", (_QWORD)v24);
        if (objc_msgSend(v18, "intersectWithTimeRange:", var0, var1))
        {
          objc_msgSend(v18, "timeRangeInComposition");
          v21 = v16 + RCTimeRangeDeltaWithExactPrecision(v19, v20);
          v22.n128_f64[0] = v16;
          objc_msgSend(v18, "setTimeRangeInComposition:", RCTimeRangeMake(v22, v21));
          objc_msgSend(v11, "addObject:", v18);
          v16 = v21;
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v14);
  }
  else
  {
    v16 = 0.0;
  }

  v10 = (void *)-[RCComposition mutableCopy](self, "mutableCopy");
  objc_msgSend(v10, "setDecomposedFragments:", v11);
  objc_msgSend(v10, "setCachedComposedAVURLDuration:", v16);

LABEL_19:
  return v10;
}

- (id)compositionByOverdubbingWithFragment:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  __n128 v11;
  double v12;
  double v13;
  __n128 v14;
  void *v15;
  void *v16;
  __n128 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  NSObject *v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  id v61;
  _QWORD v62[3];

  v62[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "timeRangeInComposition");
  v6 = v5;
  v8 = v7;
  -[RCComposition composedDuration](self, "composedDuration");
  v10 = v9;
  v11.n128_u64[0] = 0;
  v12 = RCTimeRangeMake(v11, v10);
  if (RCTimeRangeContainsRange(v6, v8, v12, v13))
  {
    v15 = (void *)-[RCComposition mutableCopy](self, "mutableCopy");
    v62[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDecomposedFragments:", v16);
  }
  else
  {
    v14.n128_u64[0] = 0xC7EFFFFFE0000000;
    -[RCComposition compositionByClippingToComposedTimeRange:](self, "compositionByClippingToComposedTimeRange:", RCTimeRangeMake(v14, v6));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17.n128_f64[0] = v8;
    -[RCComposition compositionByClippingToComposedTimeRange:](self, "compositionByClippingToComposedTimeRange:", RCTimeRangeMake(v17, 3.40282347e38));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v16)
    {
      v15 = (void *)objc_msgSend(v16, "mutableCopy");
      objc_msgSend(v16, "decomposedFragments");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeRangeInComposition");
      if (v22 != v6)
      {
        OSLogForCategory(CFSTR("Default"));
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[RCComposition compositionByOverdubbingWithFragment:].cold.1(v6, v8);

      }
      objc_msgSend(v20, "arrayByAddingObject:", v4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDecomposedFragments:", v24);

    }
    else
    {
      v15 = (void *)objc_msgSend(v18, "mutableCopy");
      v61 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDecomposedFragments:", v20);
    }

    objc_msgSend(v19, "decomposedFragments");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v46 = v19;
      v48 = v16;
      v49 = v4;
      objc_msgSend(v15, "decomposedFragments");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v26, "mutableCopy");

      v47 = v15;
      objc_msgSend(v15, "composedFragments");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "lastObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "timeRangeInComposition");
      v31 = v30;

      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v45 = v25;
      v32 = v25;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v51;
        do
        {
          v36 = 0;
          do
          {
            if (*(_QWORD *)v51 != v35)
              objc_enumerationMutation(v32);
            v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v36), "mutableCopy");
            objc_msgSend(v37, "timeRangeInComposition");
            v40 = RCTimeRangeShift(v38, v39, v31);
            if (v8 >= v40)
              v41 = v8;
            else
              v41 = v40;
            objc_msgSend(v37, "setTimeRangeInComposition:", v41);
            objc_msgSend(v27, "addObject:", v37);
            if (v41 < v8)
            {
              OSLogForCategory(CFSTR("Default"));
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                NSStringFromRCTimeRange(v6, v8);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v55 = "-[RCComposition compositionByOverdubbingWithFragment:]";
                v56 = 2112;
                v57 = v37;
                v58 = 2112;
                v59 = v43;
                _os_log_error_impl(&dword_1BD830000, v42, OS_LOG_TYPE_ERROR, "%s -- Invalid fragment times:  %@, composedTimeRange = %@", buf, 0x20u);

              }
            }

            ++v36;
          }
          while (v34 != v36);
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
        }
        while (v34);
      }

      v15 = v47;
      objc_msgSend(v47, "setDecomposedFragments:", v27);

      v16 = v48;
      v4 = v49;
      v25 = v45;
      v19 = v46;
    }

  }
  return v15;
}

- (id)newRandomFragmentWithInsertionTimeRangeInComposition:(id)a3 pathExtension:(id)a4
{
  double var1;
  double var0;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  double v20;
  double v21;
  RCCompositionFragment *v22;
  id v24;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = (void *)MEMORY[0x1E0CB3A28];
  v8 = a4;
  objc_msgSend(v7, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_compositionFragmentsFolderForComposedAVURL:", self->_composedAVURL);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:", v10);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "URLByAppendingPathExtension:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[RCComposition composedDuration](self, "composedDuration");
  v15 = v14;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLByDeletingLastPathComponent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  LOBYTE(v12) = objc_msgSend(v16, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v17, 1, 0, &v24);
  v18 = v24;

  if ((v12 & 1) == 0)
  {
    OSLogForCategory(CFSTR("Default"));
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[RCComposition newRandomFragmentWithInsertionTimeRangeInComposition:pathExtension:].cold.1(v13);

  }
  if (var1 >= v15)
    v20 = var1;
  else
    v20 = v15;
  if (var0 < v15 && var0 + 0.0500000007 < v15)
    v20 = var1;
  else
    var0 = v15;
  if (v15 >= v20)
    v21 = v20;
  else
    v21 = v15;
  v22 = -[RCCompositionFragment initWithAVOutputURL:contentDuration:timeRangeInContentToUse:timeRangeInComposition:]([RCCompositionFragment alloc], "initWithAVOutputURL:contentDuration:timeRangeInContentToUse:timeRangeInComposition:", v13, 0.0, -1.79769313e308, 1.79769313e308, var0, v21);

  return v22;
}

- (void)enumerateOrphanedFragmentsWithBlock:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  RCCompositionFragment *v28;
  int v29;
  void *v30;
  void (**v31)(id, RCCompositionFragment *, _BYTE *);
  unsigned __int8 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _QWORD v43[4];

  v43[1] = *MEMORY[0x1E0C80C00];
  v31 = (void (**)(id, RCCompositionFragment *, _BYTE *))a3;
  +[RCCaptureFormat fileExtensionForAssetExport](RCCaptureFormat, "fileExtensionForAssetExport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_decomposedFragments, "count"))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v7 = self->_decomposedFragments;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v38 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "AVOutputURL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "lastPathComponent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v9);
    }

  }
  -[NSURL lastPathComponent](self->_composedAVURL, "lastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v14);

  objc_msgSend((id)objc_opt_class(), "_compositionFragmentsFolderForComposedAVURL:", self->_composedAVURL);
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v15;
  objc_msgSend(v16, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v15, v17, 5, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        objc_msgSend(v24, "lastPathComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "containsObject:", v25))
        {

        }
        else
        {
          objc_msgSend(v24, "pathExtension");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v5, "containsObject:", v26);

          if (v27)
          {
            v32 = 0;
            v28 = -[RCCompositionFragment initWithAVOutputURL:contentDuration:timeRangeInContentToUse:timeRangeInComposition:]([RCCompositionFragment alloc], "initWithAVOutputURL:contentDuration:timeRangeInContentToUse:timeRangeInComposition:", v24, 0.0, -1.79769313e308, 1.79769313e308, -1.79769313e308, 1.79769313e308);
            v31[2](v31, v28, &v32);
            v29 = v32;

            if (v29)
              goto LABEL_21;
          }
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v21);
  }
LABEL_21:

}

- (void)deleteFromFilesystem
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  RCComposition *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OSLogForCategory(CFSTR("Default"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[RCComposition deleteFromFilesystem]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_1BD830000, v3, OS_LOG_TYPE_INFO, "%s -- deleting all composition assets for %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtURL:error:", self->_composedAVURL, 0);
  objc_msgSend(v4, "removeItemAtURL:error:", self->_composedWaveformURL, 0);
  -[NSURL rc_URLByReplacingPathExtensionWithExtension:](self->_composedAVURL, "rc_URLByReplacingPathExtensionWithExtension:", CFSTR("composition"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtURL:error:", v5, 0);

}

+ (void)deleteFromFilesystem:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  OSLogForCategory(CFSTR("Default"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "+[RCComposition deleteFromFilesystem:]";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1BD830000, v4, OS_LOG_TYPE_INFO, "%s -- deleting all composition assets for %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RCWaveform waveformURLForAVURL:](RCWaveform, "waveformURLForAVURL:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtURL:error:", v6, 0);
  objc_msgSend(v3, "rc_URLByReplacingPathExtensionWithExtension:", CFSTR("composition"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtURL:error:", v3, 0);
  objc_msgSend(v5, "removeItemAtURL:error:", v7, 0);

}

+ (BOOL)excludeFromBackup:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  id v7;
  int v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  OSLogForCategory(CFSTR("Default"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "+[RCComposition excludeFromBackup:error:]";
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1BD830000, v6, OS_LOG_TYPE_DEFAULT, "%s -- excluding from backup %@", (uint8_t *)&v15, 0x16u);
  }

  objc_msgSend(v5, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = chmod((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 0x1A4u);

  if (v8)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v10 = *MEMORY[0x1E0C9AC90];
    v11 = MEMORY[0x1E0C9AAB0];
    v9 = objc_msgSend(v5, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C9AC90], a4);
    +[RCWaveform waveformURLForAVURL:](RCWaveform, "waveformURLForAVURL:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setResourceValue:forKey:error:", v11, v10, 0);
    objc_msgSend(v5, "rc_URLByReplacingPathExtensionWithExtension:", CFSTR("composition"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setResourceValue:forKey:error:", v11, v10, 0);

  }
  return v9;
}

+ (BOOL)migrateBackupExclusionFlag:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  OSLogForCategory(CFSTR("Default"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "+[RCComposition migrateBackupExclusionFlag:]";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1BD830000, v4, OS_LOG_TYPE_DEFAULT, "%s -- migrating backup exclusion flag %@", (uint8_t *)&v8, 0x16u);
  }

  migrateBackupExclusionFlag(v3);
  +[RCWaveform waveformURLForAVURL:](RCWaveform, "waveformURLForAVURL:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  migrateBackupExclusionFlag(v5);

  objc_msgSend(v3, "rc_URLByReplacingPathExtensionWithExtension:", CFSTR("composition"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  migrateBackupExclusionFlag(v6);

  return 1;
}

- (BOOL)saveMetadataToDefaultLocation
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  char v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  id v16;
  id v17;

  -[RCComposition dictionaryPListRepresentation](self, "dictionaryPListRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 100, 0, &v17);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v17;
    if (v5)
    {
      OSLogForCategory(CFSTR("Default"));
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[RCComposition saveMetadataToDefaultLocation].cold.4();
      v7 = 0;
      goto LABEL_21;
    }
    -[RCComposition composedAVURL](self, "composedAVURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[RCComposition compositionMetadataURLForComposedAVURL:](RCComposition, "compositionMetadataURLForComposedAVURL:", v8);
    v6 = objc_claimAutoreleasedReturnValue();

    OSLogForCategory(CFSTR("Default"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[RCComposition saveMetadataToDefaultLocation].cold.3(v6);

      if (!objc_msgSend(v4, "length"))
      {
        v7 = 1;
        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject URLByDeletingLastPathComponent](v6, "URLByDeletingLastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v13 = objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v16);
      v10 = v16;

      if ((v13 & 1) == 0)
      {
        OSLogForCategory(CFSTR("Default"));
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[RCComposition saveMetadataToDefaultLocation].cold.2(v6);

      }
      v7 = objc_msgSend(v4, "writeToURL:atomically:", v6, 1);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[RCComposition saveMetadataToDefaultLocation].cold.1(v10);
      v7 = 0;
    }

LABEL_21:
    goto LABEL_22;
  }
  v7 = 0;
LABEL_22:

  return v7;
}

- (void)setCachedComposedAVURLDuration:(double)a3
{
  self->_cachedComposedAVURLDuration = a3;
  self->_cachedComposedAVURLDurationIsValid = 1;
}

- (void)recacheComposedDuration
{
  self->_cachedComposedAVURLDuration = -1.0;
  self->_cachedComposedAVURLDurationIsValid = 0;
  -[RCComposition _composedDuration](self, "_composedDuration");
}

- (void)_loadMusicMemoMetadata
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  id v8;
  NSDictionary *v9;
  NSDictionary *musicMemoMetadata;
  id v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_composedAVURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, 0);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", self->_composedAVURL);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (RCMusicMemosKeys_onceToken != -1)
      dispatch_once(&RCMusicMemosKeys_onceToken, &__block_literal_global_2);
    v6 = (id)RCMusicMemosKeys_musicMemosKeys;
    objc_msgSend(v11, "rc_recordingMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __39__RCComposition__loadMusicMemoMetadata__block_invoke;
    v12[3] = &unk_1E769C5A8;
    v13 = v6;
    v8 = v6;
    objc_msgSend(v7, "na_filter:", v12);
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    musicMemoMetadata = self->_musicMemoMetadata;
    self->_musicMemoMetadata = v9;

  }
}

uint64_t __39__RCComposition__loadMusicMemoMetadata__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

+ (id)compositionBundleURLForComposedAVURL:(id)a3
{
  return (id)objc_msgSend(a3, "rc_URLByReplacingPathExtensionWithExtension:", CFSTR("composition"));
}

+ (id)_compositionMetadataURLForCompositionBundleURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("manifest.plist"));
}

+ (id)compositionMetadataURLForComposedAVURL:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "compositionBundleURLForComposedAVURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("manifest.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_compositionFragmentsFolderForComposedAVURL:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "compositionBundleURLForComposedAVURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("fragments"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_composedDuration
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  double v14;
  double v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!self->_cachedComposedAVURLDurationIsValid)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](self->_composedAVURL, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, 0);

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C8B3C0], "rc_preciseTimingAssetWithURL:", self->_composedAVURL);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (!v6)
      {
        OSLogForCategory(CFSTR("Default"));
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[RCComposition _composedDuration].cold.1((id *)&self->_composedAVURL);

        self->_cachedComposedAVURLDuration = -1.0;
        goto LABEL_20;
      }
      objc_msgSend(v6, "rc_durationInSeconds");
      self->_cachedComposedAVURLDuration = v8;
    }
    else
    {
      -[RCComposition composedFragments](self, "composedFragments");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "count"))
      {
LABEL_20:

        return self->_cachedComposedAVURLDuration;
      }
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v7 = v7;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        v12 = 0.0;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "timeRangeInContentToUse", (_QWORD)v18);
            v12 = v12 + RCTimeRangeDeltaWithExactPrecision(v14, v15);
          }
          v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v10);
      }
      else
      {
        v12 = 0.0;
      }

      self->_cachedComposedAVURLDuration = v12;
    }
    self->_cachedComposedAVURLDurationIsValid = 1;
    goto LABEL_20;
  }
  return self->_cachedComposedAVURLDuration;
}

- (id)_calculateComposedFragments
{
  uint64_t i;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  unint64_t v37;
  unint64_t v38;
  double v39;
  double v40;
  double v41;
  __n128 v42;
  double v43;
  double v44;
  void *v46;
  void *v47;
  unint64_t v48;
  double v49;
  BOOL v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  double v57;
  double v58;
  double v59;
  unint64_t v60;
  unint64_t v61;
  double v62;
  double v63;
  __n128 v64;
  __n128 v65;
  void *v66;
  double v67;
  double v68;
  __n128 v69;
  double v70;
  __n128 v71;
  double v72;
  double v73;
  __n128 v74;
  double v75;
  __n128 v76;
  double v77;
  unint64_t v78;
  unint64_t v79;
  double v80;
  __n128 v81;
  uint64_t v82;
  unint64_t k;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  __n128 v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  unint64_t v97;
  double v98;
  void *v99;
  double v100;
  double v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t m;
  void *v107;
  double v108;
  double v109;
  double v110;
  unint64_t v111;
  unint64_t v112;
  double v113;
  double v114;
  __n128 v115;
  NSArray *obj;
  uint64_t v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  id v125;
  void *v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _BYTE v143[128];
  _QWORD v144[16];
  _BYTE v145[128];
  _BYTE v146[128];
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v119 = (id)objc_claimAutoreleasedReturnValue();
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  obj = self->_decomposedFragments;
  v120 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v127, v143, 16);
  if (v120)
  {
    v118 = *(_QWORD *)v128;
    do
    {
      for (i = 0; i != v120; ++i)
      {
        if (*(_QWORD *)v128 != v118)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * i);
        v5 = v119;
        v6 = v4;
        v7 = v5;
        v8 = v6;
        if (objc_msgSend(v7, "count") && (v9 = objc_msgSend(v7, "count")) != 0)
        {
          v10 = v9;
          v11 = 0;
          v12 = 0x7FFFFFFFFFFFFFFFLL;
          while (1)
          {
            while (1)
            {
              objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "timeRangeInComposition");
              v15 = v14;
              if (v12 != 0x7FFFFFFFFFFFFFFFLL)
                break;
              objc_msgSend(v8, "timeRangeInComposition");
              if (v11 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v12 = v11;
                if (v16 <= v15)
                  break;
              }

              ++v11;
              v12 = 0x7FFFFFFFFFFFFFFFLL;
              if (v11 == v10)
              {
                v19 = 0;
                goto LABEL_25;
              }
            }
            objc_msgSend(v8, "timeRangeInComposition");
            if (v17 == v15)
              break;
            objc_msgSend(v8, "timeRangeInComposition");
            if (v18 < v15)
              goto LABEL_22;

            if (++v11 == v10)
              goto LABEL_23;
          }
          v20 = objc_msgSend(v7, "count");
          if (v11 + 1 < (unint64_t)(v20 - 1))
            ++v11;
          else
            v11 = v20 - 1;
LABEL_22:

          if (v11 == 0x7FFFFFFFFFFFFFFFLL)
LABEL_23:
            v11 = objc_msgSend(v7, "count") - 1;
          v19 = v11 - v12 + 1;
        }
        else
        {
          v19 = 0;
          v12 = 0x7FFFFFFFFFFFFFFFLL;
        }
LABEL_25:

        if (!v19)
          goto LABEL_59;
        v126 = v8;
        v124 = i;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = v12;
        v123 = v7;
        v121 = v19;
        objc_msgSend(v7, "subarrayWithRange:", v12, v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v139 = 0u;
        v140 = 0u;
        v141 = 0u;
        v142 = 0u;
        v125 = v22;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v139, v146, 16);
        if (!v23)
          goto LABEL_58;
        v24 = v23;
        v25 = *(_QWORD *)v140;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v140 != v25)
              objc_enumerationMutation(v125);
            v27 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * v26);
            objc_msgSend(v126, "timeRangeInComposition");
            v29 = v28;
            v31 = v30;
            v32 = v27;
            objc_msgSend(v32, "timeRangeInComposition");
            v34 = v33;
            v36 = v35;
            objc_msgSend(v32, "timeRangeInComposition");
            v38 = v37;
            objc_msgSend(v32, "timeRangeInContentToUse");
            v41 = RCTimeRangeDeltaWithExactPrecision(v39, v40);
            v42.n128_u64[0] = v38;
            v43 = RCTimeRangeMake(v42, v41);
            if (v29 >= v36 || v31 <= v34)
            {
              v46 = (void *)objc_msgSend(v32, "mutableCopy", v43);
              v144[0] = v46;
              goto LABEL_36;
            }
            v48 = *(_QWORD *)&v43;
            v49 = v44;
            v50 = RCTimeRangeContainsRange(v29, v31, v34, v36);
            v47 = (void *)MEMORY[0x1E0C9AA60];
            if (!v50)
            {
              if (RCTimeRangeContainsRange(v34, v36, v29, v31))
              {
                v59 = v36 - v31;
                v46 = (void *)objc_msgSend(v32, "mutableCopy");
                objc_msgSend(v32, "timeRangeInContentToUse");
                v61 = v60;
                objc_msgSend(v32, "timeRangeInContentToUse");
                v63 = v29 - v34 + v62;
                v64.n128_u64[0] = v61;
                objc_msgSend(v46, "setTimeRangeInContentToUse:", RCTimeRangeMake(v64, v63));
                v65.n128_u64[0] = v48;
                objc_msgSend(v46, "setTimeRangeInComposition:", RCTimeRangeMake(v65, v29));
                v66 = (void *)objc_msgSend(v32, "mutableCopy");
                objc_msgSend(v32, "timeRangeInContentToUse");
                v68 = v67 - v59;
                objc_msgSend(v32, "timeRangeInContentToUse");
                v69.n128_f64[0] = v68;
                objc_msgSend(v66, "setTimeRangeInContentToUse:", RCTimeRangeMake(v69, v70));
                v71.n128_f64[0] = v31;
                objc_msgSend(v66, "setTimeRangeInComposition:", RCTimeRangeMake(v71, v49));
                v144[0] = v46;
                v144[1] = v66;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v144, 2);
                v47 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_37;
              }
              if (v31 < v36)
              {
                v46 = (void *)objc_msgSend(v32, "mutableCopy");
                objc_msgSend(v32, "timeRangeInContentToUse");
                v73 = v31 - v34 + v72;
                objc_msgSend(v32, "timeRangeInContentToUse");
                v74.n128_f64[0] = v73;
                objc_msgSend(v46, "setTimeRangeInContentToUse:", RCTimeRangeMake(v74, v75));
                v76.n128_f64[0] = v31;
                v77 = v49;
LABEL_56:
                objc_msgSend(v46, "setTimeRangeInComposition:", RCTimeRangeMake(v76, v77));
                v144[0] = v46;
LABEL_36:
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v144, 1);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_37:

                goto LABEL_39;
              }
              if (v29 > v34)
              {
                v46 = (void *)objc_msgSend(v32, "mutableCopy");
                objc_msgSend(v32, "timeRangeInContentToUse");
                v79 = v78;
                objc_msgSend(v32, "timeRangeInContentToUse");
                v81.n128_u64[0] = v79;
                objc_msgSend(v46, "setTimeRangeInContentToUse:", RCTimeRangeMake(v81, v80 - (v36 - v29)));
                v76.n128_u64[0] = v48;
                v77 = v29;
                goto LABEL_56;
              }
            }
LABEL_39:

            v135 = 0u;
            v136 = 0u;
            v137 = 0u;
            v138 = 0u;
            v51 = v47;
            v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v135, v145, 16);
            if (v52)
            {
              v53 = v52;
              v54 = *(_QWORD *)v136;
              do
              {
                for (j = 0; j != v53; ++j)
                {
                  if (*(_QWORD *)v136 != v54)
                    objc_enumerationMutation(v51);
                  v56 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * j);
                  objc_msgSend(v56, "timeRangeInContentToUse");
                  if (RCTimeRangeDeltaWithExactPrecision(v57, v58) > 2.22044605e-16)
                    objc_msgSend(v21, "addObject:", v56);
                }
                v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v135, v145, 16);
              }
              while (v53);
            }

            ++v26;
          }
          while (v26 != v24);
          v82 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v139, v146, 16);
          v24 = v82;
        }
        while (v82);
LABEL_58:
        v7 = v123;
        objc_msgSend(v123, "replaceObjectsInRange:withObjectsFromArray:", v122, v121, v21);

        i = v124;
        v8 = v126;
LABEL_59:
        for (k = 0; k < objc_msgSend(v7, "count"); ++k)
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", k);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "timeRangeInComposition");
          v86 = v85;
          objc_msgSend(v84, "timeRangeInComposition");
          v88 = v87;

          if (v86 <= v88)
            break;
        }
        v89 = (void *)objc_msgSend(v8, "mutableCopy");
        objc_msgSend(v8, "timeRangeInComposition");
        objc_msgSend(v89, "setTimeRangeInComposition:", RCTimeRangeMake(v90, 0.0));
        objc_msgSend(v7, "insertObject:atIndex:", v89, k);
        objc_msgSend(v8, "timeRangeInContentToUse");
        v93 = RCTimeRangeDeltaWithExactPrecision(v91, v92);
        objc_msgSend(v8, "timeRangeInComposition");
        v96 = RCTimeRangeDeltaWithExactPrecision(v94, v95);
        v97 = k + 1;
        if (v97 < objc_msgSend(v7, "count"))
        {
          v98 = v93 - v96;
          do
          {
            objc_msgSend(v7, "objectAtIndexedSubscript:", v97);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "timeRangeInComposition");
            objc_msgSend(v99, "setTimeRangeInComposition:", RCTimeRangeShift(v100, v101, v98));

            ++v97;
          }
          while (v97 < objc_msgSend(v7, "count"));
        }
        v133 = 0u;
        v134 = 0u;
        v131 = 0u;
        v132 = 0u;
        v102 = v7;
        v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v131, v144, 16);
        if (v103)
        {
          v104 = v103;
          v105 = *(_QWORD *)v132;
          do
          {
            for (m = 0; m != v104; ++m)
            {
              if (*(_QWORD *)v132 != v105)
                objc_enumerationMutation(v102);
              v107 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * m);
              objc_msgSend(v107, "timeRangeInContentToUse");
              v110 = RCTimeRangeDeltaWithExactPrecision(v108, v109);
              objc_msgSend(v107, "timeRangeInComposition");
              v112 = v111;
              objc_msgSend(v107, "timeRangeInComposition");
              v114 = v110 + v113;
              v115.n128_u64[0] = v112;
              objc_msgSend(v107, "setTimeRangeInComposition:", RCTimeRangeMake(v115, v114));
            }
            v104 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v131, v144, 16);
          }
          while (v104);
        }

      }
      v120 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v127, v143, 16);
    }
    while (v120);
  }

  return v119;
}

+ (BOOL)_isSessionWithModificationAccessActiveForComposedAVURL:(id)a3
{
  id v3;
  id v4;
  char v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__RCComposition__isSessionWithModificationAccessActiveForComposedAVURL___block_invoke;
  v7[3] = &unk_1E769C5D0;
  v8 = v3;
  v9 = &v10;
  v4 = v3;
  _accessActiveCaptureCompositionAVURLs(v7);
  v5 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __72__RCComposition__isSessionWithModificationAccessActiveForComposedAVURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsObject:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_compositionByReplacingDecomposedFragments:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[RCComposition mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "setDecomposedFragments:", v4);

  return v5;
}

- (void)_eaccess_repairDecomposedFragmentMetadataIfNecessary:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[RCComposition decomposedFragments](self, "decomposedFragments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCComposition decomposedFragments](self, "decomposedFragments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__RCComposition__eaccess_repairDecomposedFragmentMetadataIfNecessary___block_invoke;
  v11[3] = &unk_1E769C5F8;
  v13 = &v15;
  v14 = v6;
  v9 = v7;
  v12 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

  if (v4)
  {
    -[RCComposition _compositionByReplacingDecomposedFragments:](self, "_compositionByReplacingDecomposedFragments:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v10, *((unsigned __int8 *)v16 + 24));

  }
  _Block_object_dispose(&v15, 8);

}

void __70__RCComposition__eaccess_repairDecomposedFragmentMetadataIfNecessary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __n128 v18;
  double v19;
  double v20;
  __n128 v21;
  NSObject *v22;
  double v23;

  v5 = a2;
  v6 = v5;
  v7 = v5;
  if (*(_QWORD *)(a1 + 48) - 1 == a3)
  {
    objc_msgSend(v5, "contentDuration");
    v7 = v6;
    if (v8 < 0.00000011920929)
    {
      v9 = (void *)MEMORY[0x1E0C8B3C0];
      objc_msgSend(v6, "AVOutputURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "rc_preciseTimingAssetWithURL:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v7 = (void *)objc_msgSend(v6, "mutableCopy");
        objc_msgSend(v11, "rc_durationInSeconds");
        objc_msgSend(v7, "setContentDuration:");
        objc_msgSend(v6, "timeRangeInComposition");
        v13 = v12;
        objc_msgSend(v6, "timeRangeInComposition");
        v15 = v14;
        objc_msgSend(v6, "contentDuration");
        v17 = v15 + v16;
        v18.n128_u64[0] = v13;
        objc_msgSend(v7, "setTimeRangeInComposition:", RCTimeRangeMake(v18, v17));
        objc_msgSend(v7, "contentDuration");
        v20 = v19;
        v21.n128_u64[0] = 0;
        objc_msgSend(v7, "setTimeRangeInContentToUse:", RCTimeRangeMake(v21, v20));
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

      }
      else
      {
        OSLogForCategory(CFSTR("Default"));
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          __70__RCComposition__eaccess_repairDecomposedFragmentMetadataIfNecessary___block_invoke_cold_1(v6, v22);

        v7 = v6;
      }

    }
  }
  objc_msgSend(v7, "contentDuration");
  if (v23 <= 0.0)
    objc_msgSend(v6, "deleteFromFilesystem");
  else
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

- (void)rcs_composeToFinalDestinationWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  RCCompositionComposedAssetWriter *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  RCCompositionComposedAssetWriter *v19;
  id v20;
  void *v21;
  void *v22;
  RCComposition *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  RCComposition *v27;
  id v28;
  int v29;
  _QWORD v30[4];
  RCCompositionComposedAssetWriter *v31;
  id v32;
  int v33;
  int out_token;

  v4 = a3;
  -[RCComposition _eaccess_repairDecomposedFragmentMetadataIfNecessary:](self, "_eaccess_repairDecomposedFragmentMetadataIfNecessary:", 0);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCComposition composedAVURL](self, "composedAVURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v7, 0);

  -[RCComposition decomposedFragments](self, "decomposedFragments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = -[RCCompositionComposedAssetWriter initWithComposition:]([RCCompositionComposedAssetWriter alloc], "initWithComposition:", self);
    if (RCTestSlowMessageExportSeconds() > 0.0)
      objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:");
    out_token = 0;
    v12 = RCRunningInSavedRecordingDaemon();
    v13 = MEMORY[0x1E0C809B0];
    if (v12)
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      -[RCComposition savedRecordingUUID](self, "savedRecordingUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("RCFinalizationProgressNotificationName"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_retainAutorelease(v16);
      notify_register_check((const char *)objc_msgSend(v17, "UTF8String"), &out_token);
      v18 = (void *)MEMORY[0x1E0C99E88];
      v30[0] = v13;
      v30[1] = 3221225472;
      v30[2] = __66__RCComposition_rcs_composeToFinalDestinationWithCompletionBlock___block_invoke;
      v30[3] = &unk_1E769C620;
      v19 = v11;
      v33 = out_token;
      v31 = v19;
      v32 = v17;
      v20 = v17;
      objc_msgSend(v18, "timerWithTimeInterval:repeats:block:", 1, v30, 0.1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addTimer:forMode:", v21, *MEMORY[0x1E0C99748]);

    }
    else
    {
      v21 = 0;
    }
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = __66__RCComposition_rcs_composeToFinalDestinationWithCompletionBlock___block_invoke_2;
    v25[3] = &unk_1E769C648;
    v29 = out_token;
    v26 = v21;
    v27 = self;
    v28 = v4;
    v24 = v21;
    -[RCCompositionComposedAssetWriter writeCompositionWithCompletionBlock:](v11, "writeCompositionWithCompletionBlock:", v25);

  }
  else
  {
    if (v8)
      v23 = self;
    else
      v23 = 0;
    (*((void (**)(id, RCComposition *, _QWORD, _QWORD))v4 + 2))(v4, v23, 0, 0);
  }

}

uint64_t __66__RCComposition_rcs_composeToFinalDestinationWithCompletionBlock___block_invoke(uint64_t a1)
{
  unsigned int v2;

  objc_msgSend(*(id *)(a1 + 32), "progress");
  notify_set_state(*(_DWORD *)(a1 + 48), v2);
  return notify_post((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"));
}

void __66__RCComposition_rcs_composeToFinalDestinationWithCompletionBlock___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v5, "invalidate");
    notify_cancel(*(_DWORD *)(a1 + 56));
  }
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_compositionByReplacingDecomposedFragments:", MEMORY[0x1E0C9AA60]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "saveMetadataToDefaultLocation");
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)rcs_repairDecomposedFragmentMetadataIfNecessary:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__RCComposition_rcs_repairDecomposedFragmentMetadataIfNecessary___block_invoke;
  v6[3] = &unk_1E769C670;
  v7 = v4;
  v5 = v4;
  -[RCComposition _eaccess_repairDecomposedFragmentMetadataIfNecessary:](self, "_eaccess_repairDecomposedFragmentMetadataIfNecessary:", v6);

}

void __65__RCComposition_rcs_repairDecomposedFragmentMetadataIfNecessary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "saveMetadataToDefaultLocation");
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id, uint64_t))(v5 + 16))(v5, v6, a3);

}

- (BOOL)rcs_allAssetsAreMissing
{
  void *v3;
  char v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[RCComposition composedAVURL](self, "composedAVURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", 0);

  if ((v4 & 1) != 0)
    return 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[RCComposition decomposedFragments](self, "decomposedFragments", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "AVOutputURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "checkResourceIsReachableAndReturnError:", 0);

        if ((v12 & 1) != 0)
        {
          v5 = 0;
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v5 = 1;
LABEL_13:

  return v5;
}

- (id)moveTo:(id)a3 recordingID:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id *v28;
  void *v30;
  id *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCComposition composedAVURL](self, "composedAVURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[RCComposition compositionBundleURLForComposedAVURL:](RCComposition, "compositionBundleURLForComposedAVURL:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[RCComposition compositionBundleURLForComposedAVURL:](RCComposition, "compositionBundleURLForComposedAVURL:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "moveItemAtURL:toURL:error:", v13, v14, a5))
  {
    v30 = v14;
    v32 = v13;
    v33 = v11;
    v34 = v10;
    v15 = (id *)-[RCComposition mutableCopy](self, "mutableCopy");
    objc_storeStrong(v15 + 7, a3);
    objc_storeStrong(v15 + 3, a4);
    v35 = v9;
    objc_msgSend((id)objc_opt_class(), "_compositionFragmentsFolderForComposedAVURL:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_opt_new();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v31 = v15;
    objc_msgSend(v15, "decomposedFragments");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v37 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v24 = (void *)objc_msgSend(v23, "mutableCopy");
          objc_msgSend(v23, "AVOutputURL");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "lastPathComponent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "URLByAppendingPathComponent:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setAVOutputURL:", v27);

          objc_msgSend(v17, "addObject:", v24);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v20);
    }

    v28 = v31;
    objc_msgSend(v31, "setDecomposedFragments:", v17);
    objc_msgSend(v31, "saveMetadataToDefaultLocation");

    v10 = v34;
    v9 = v35;
    v13 = v32;
    v11 = v33;
    v14 = v30;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (NSString)savedRecordingUUID
{
  return self->_savedRecordingUUID;
}

- (void)setSavedRecordingUUID:(id)a3
{
  objc_storeStrong((id *)&self->_savedRecordingUUID, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSDictionary)musicMemoMetadata
{
  return self->_musicMemoMetadata;
}

- (void)setMusicMemoMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_musicMemoMetadata, a3);
}

- (NSURL)composedAVURL
{
  return self->_composedAVURL;
}

- (NSURL)composedWaveformURL
{
  return self->_composedWaveformURL;
}

- (NSArray)decomposedFragments
{
  return self->_decomposedFragments;
}

- (BOOL)cachedComposedAVURLDurationIsValid
{
  return self->_cachedComposedAVURLDurationIsValid;
}

- (void)setCachedComposedAVURLDurationIsValid:(BOOL)a3
{
  self->_cachedComposedAVURLDurationIsValid = a3;
}

- (double)cachedComposedAVURLDuration
{
  return self->_cachedComposedAVURLDuration;
}

- (NSObject)composedFragmentsMutex
{
  return self->_composedFragmentsMutex;
}

- (void)setComposedFragmentsMutex:(id)a3
{
  objc_storeStrong((id *)&self->_composedFragmentsMutex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedFragmentsMutex, 0);
  objc_storeStrong((id *)&self->_decomposedFragments, 0);
  objc_storeStrong((id *)&self->_composedWaveformURL, 0);
  objc_storeStrong((id *)&self->_composedAVURL, 0);
  objc_storeStrong((id *)&self->_musicMemoMetadata, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_savedRecordingUUID, 0);
  objc_storeStrong((id *)&self->_composedFragments, 0);
}

- (id)playableAsset:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCComposition composedAVURL](self, "composedAVURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v7, 0);

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C8B3C0];
    -[RCComposition composedAVURL](self, "composedAVURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetWithURL:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[RCComposition _compositionAsset:error:](self, "_compositionAsset:error:", 1, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)compositionAssetForExport:(id *)a3
{
  return -[RCComposition _compositionAsset:error:](self, "_compositionAsset:error:", 0, a3);
}

- (id)_compositionAsset:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  id v12;
  _BOOL4 v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v5 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8B268], "composition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCComposition composedAVURL](self, "composedAVURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rc_setComposedAVURL:", v8);

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__8;
  v27 = __Block_byref_object_dispose__8;
  v28 = 0;
  if (v5)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __57__RCComposition_RCAVFoundation___compositionAsset_error___block_invoke;
    v20[3] = &unk_1E769CD58;
    v21 = v7;
    v22 = &v23;
    v9 = -[RCComposition _enumerateFragmentsForInsertion:](self, "_enumerateFragmentsForInsertion:", v20);

    if (v9)
    {
LABEL_3:
      v10 = v7;
      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(v7, "addMutableTrackWithMediaType:preferredTrackID:", *MEMORY[0x1E0C8A7A0], 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __57__RCComposition_RCAVFoundation___compositionAsset_error___block_invoke_2;
    v17[3] = &unk_1E769CD58;
    v12 = v11;
    v18 = v12;
    v19 = &v23;
    v13 = -[RCComposition _enumerateFragmentsForInsertion:](self, "_enumerateFragmentsForInsertion:", v17);

    if (v13)
      goto LABEL_3;
  }
  OSLogForCategory(CFSTR("Default"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v24[5];
    *(_DWORD *)buf = 136315394;
    v30 = "-[RCComposition(RCAVFoundation) _compositionAsset:error:]";
    v31 = 2112;
    v32 = v15;
    _os_log_impl(&dword_1BD830000, v14, OS_LOG_TYPE_DEFAULT, "%s -- insertError = %@", buf, 0x16u);
  }

  v10 = 0;
  if (a4)
    *a4 = objc_retainAutorelease((id)v24[5]);
LABEL_9:
  _Block_object_dispose(&v23, 8);

  return v10;
}

uint64_t __57__RCComposition_RCAVFoundation___compositionAsset_error___block_invoke(uint64_t a1, uint64_t a2, _OWORD *a3, __int128 *a4)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;
  _OWORD v12[3];
  id v13;

  v5 = a1 + 32;
  v4 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(v5 + 8) + 8);
  v13 = *(id *)(v6 + 40);
  v7 = a3[1];
  v12[0] = *a3;
  v12[1] = v7;
  v12[2] = a3[2];
  v10 = *a4;
  v11 = *((_QWORD *)a4 + 2);
  v8 = objc_msgSend(v4, "insertTimeRange:ofAsset:atTime:error:", v12, a2, &v10, &v13);
  objc_storeStrong((id *)(v6 + 40), v13);
  return v8;
}

uint64_t __57__RCComposition_RCAVFoundation___compositionAsset_error___block_invoke_2(uint64_t a1, void *a2, _OWORD *a3, __int128 *a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v13;
  uint64_t v14;
  _OWORD v15[3];
  id v16;

  v7 = *(void **)(a1 + 32);
  objc_msgSend(a2, "rc_audioTrack");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(id *)(v9 + 40);
  v10 = a3[1];
  v15[0] = *a3;
  v15[1] = v10;
  v15[2] = a3[2];
  v13 = *a4;
  v14 = *((_QWORD *)a4 + 2);
  v11 = objc_msgSend(v7, "insertTimeRange:ofTrack:atTime:error:", v15, v8, &v13, &v16);
  objc_storeStrong((id *)(v9 + 40), v16);

  return v11;
}

- (BOOL)_enumerateFragmentsForInsertion:(id)a3
{
  _QWORD *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  Float64 v16;
  double v17;
  uint64_t (*v18)(_QWORD *, void *, CMTimeRange *, CMTime *);
  double v19;
  double v20;
  BOOL v21;
  void *v23;
  CMTime v24;
  CMTimeRange v25;
  CMTime v26;
  CMTimeRange v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[RCComposition composedFragments](self, "composedFragments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v7)
    {
      v8 = v7;
      v23 = v5;
      v9 = *(_QWORD *)v29;
      v10 = 0.0;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x1E0C8B3C0];
          objc_msgSend(v12, "AVOutputURL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "rc_preciseTimingAssetWithURL:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          memset(&v27, 0, sizeof(v27));
          objc_msgSend(v12, "timeRangeInContentToUse");
          CMTimeRangeFromRCTimeRange(&v27, v16, v17);
          memset(&v26, 0, sizeof(v26));
          CMTimeMakeWithSeconds(&v26, v10, kCMDefaultTimeScale);
          v18 = (uint64_t (*)(_QWORD *, void *, CMTimeRange *, CMTime *))v4[2];
          v25 = v27;
          v24 = v26;
          if ((v18(v4, v15, &v25, &v24) & 1) == 0)
          {

            v21 = 0;
            goto LABEL_12;
          }
          objc_msgSend(v12, "timeRangeInContentToUse");
          v10 = v10 + RCTimeRangeDeltaWithExactPrecision(v19, v20);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v8)
          continue;
        break;
      }
      v21 = 1;
LABEL_12:
      v5 = v23;
    }
    else
    {
      v21 = 1;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)initWithDictionaryPListRepresentation:(id *)a1 .cold.1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1BD830000, v2, v3, "%s -- WARNING: bogus path (%@) detected for composition %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_9();
}

+ (void)_compositionLoadedFromMetadataURL:composedAVURL:savedRecordingUUID:creationDate:createIfNeeded:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1BD830000, v0, v1, "%s -- ERROR: unable to load composition.  Encountered error = %@ while loading.", (uint8_t *)v2);
  OUTLINED_FUNCTION_0();
}

+ (void)_compositionLoadedFromMetadataURL:savedRecording:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1BD830000, v0, v1, "%s -- ERROR: unable to load composition.  Encountered error = %@ while loading.", (uint8_t *)v2);
  OUTLINED_FUNCTION_0();
}

- (void)compositionByOverdubbingWithFragment:(double)a1 .cold.1(double a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromRCTimeRange(a1, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1BD830000, v2, v3, "%s -- Invalid fragment times:  %@, composedTimeRange = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_9();
}

- (void)newRandomFragmentWithInsertionTimeRangeInComposition:(void *)a1 pathExtension:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "URLByDeletingLastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1BD830000, v2, v3, "%s -- ERROR: couldn't createDirectoryAtURL %@, error = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_9();
}

- (void)saveMetadataToDefaultLocation
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1BD830000, v0, v1, "%s -- ERROR: unable to convert property list to data, error = %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_0();
}

- (void)_composedDuration
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*a1, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1BD830000, v1, v2, "%s -- could not open audio file path = %@, error = %@", v3, v4, v5, v6, 2u);

}

void __53__RCComposition__markCompositionAVURLsBeingModified___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "valueForKeyPath:", CFSTR("path.lastPathComponent"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_1BD830000, v4, v5, "%s -- current compositionAVURLs being modified: [ %@ ]", v6, v7, v8, v9, 2u);

}

void __70__RCComposition__eaccess_repairDecomposedFragmentMetadataIfNecessary___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "AVOutputURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1BD830000, a2, v4, "%s -- ERROR:  could not open fragment URL = %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_7_0();
}

@end
