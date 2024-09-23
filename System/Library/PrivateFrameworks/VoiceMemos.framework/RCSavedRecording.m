@implementation RCSavedRecording

- (void)awakeFromInsert
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCSavedRecording;
  -[RCSavedRecording awakeFromInsert](&v4, sel_awakeFromInsert);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCSavedRecording setDate:](self, "setDate:", v3);

}

- (void)awakeFromFetch
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RCSavedRecording;
  -[RCSavedRecording awakeFromFetch](&v3, sel_awakeFromFetch);
  -[RCSavedRecording _validatePath](self, "_validatePath");
}

- (void)willSave
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RCSavedRecording;
  -[RCSavedRecording willSave](&v8, sel_willSave);
  if ((-[RCSavedRecording isDeleted](self, "isDeleted") & 1) == 0)
  {
    if (!self->_pathWasInvalid)
    {
      -[RCSavedRecording path](self, "path");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCSavedRecording.m"), 52, CFSTR("no path for recording when saving"));

      }
    }
    -[RCSavedRecording primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("duration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCSavedRecording.m"), 53, CFSTR("no duration for recording when saving"));

    }
  }
}

- (BOOL)isContentBeingModified
{
  void *v2;
  BOOL v3;

  -[RCSavedRecording url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[RCComposition _isSessionWithModificationAccessActiveForComposedAVURL:](RCComposition, "_isSessionWithModificationAccessActiveForComposedAVURL:", v2);

  return v3;
}

- (double)duration
{
  void *v3;
  double v4;
  double Seconds;
  void *v6;
  void *v7;
  double result;
  CMTime time;

  -[RCSavedRecording willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("duration"));
  -[RCSavedRecording primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("duration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  Seconds = v4;

  -[RCSavedRecording didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("duration"));
  if (Seconds < 0.0 && !-[RCSavedRecording isContentBeingModified](self, "isContentBeingModified"))
  {
    -[RCSavedRecording avAsset](self, "avAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "duration");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);

    if (Seconds > 0.0)
      -[RCSavedRecording setDuration:](self, "setDuration:", Seconds);
  }
  result = 0.0;
  if (Seconds >= 0.0)
    return Seconds;
  return result;
}

- (void)setDuration:(double)a3
{
  void *v5;
  AVAsset *avAsset;

  -[RCSavedRecording willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("duration"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCSavedRecording setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("duration"));

  avAsset = self->_avAsset;
  self->_avAsset = 0;

  -[RCSavedRecording didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("duration"));
}

- (NSString)customLabel
{
  void *v3;

  -[RCSavedRecording willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("customLabel"));
  -[RCSavedRecording primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("customLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCSavedRecording didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("customLabel"));
  return (NSString *)v3;
}

- (void)setCustomLabel:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB3500];
  v5 = a3;
  objc_msgSend(v4, "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    -[RCSavedRecording willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("customLabel"));
    -[RCSavedRecording setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, CFSTR("customLabel"));
    -[RCSavedRecording didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("customLabel"));
  }

}

- (int64_t)recordingID
{
  void *v3;
  int64_t v4;

  -[RCSavedRecording willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("recordingID"));
  -[RCSavedRecording primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("recordingID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  -[RCSavedRecording didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("recordingID"));
  return v4;
}

- (void)setRecordingID:(int64_t)a3
{
  void *v5;

  -[RCSavedRecording willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("recordingID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCSavedRecording setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("recordingID"));

  -[RCSavedRecording didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("recordingID"));
}

- (NSString)path
{
  void *v3;

  -[RCSavedRecording willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("path"));
  -[RCSavedRecording primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("path"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCSavedRecording didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("path"));
  return (NSString *)v3;
}

- (void)setPath:(id)a3
{
  id v4;

  v4 = a3;
  -[RCSavedRecording willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("path"));
  -[RCSavedRecording setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("path"));

  -[RCSavedRecording _validatePath](self, "_validatePath");
  -[RCSavedRecording didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("path"));
}

- (NSURL)url
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[RCSavedRecording path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    -[RCSavedRecording path](self, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSURL *)v6;
}

- (id)URIRepresentation
{
  void *v2;
  void *v3;

  -[RCSavedRecording objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URIRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)avAsset
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  AVAsset *v9;
  AVAsset *avAsset;

  if (!self->_avAsset)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCSavedRecording url](self, "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "fileExistsAtPath:", v5);

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0C8B3C0];
      -[RCSavedRecording url](self, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rc_preciseTimingAssetWithURL:", v8);
      v9 = (AVAsset *)objc_claimAutoreleasedReturnValue();
      avAsset = self->_avAsset;
      self->_avAsset = v9;

    }
  }
  return self->_avAsset;
}

- (void)_validatePath
{
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136315650;
  v7 = "-[RCSavedRecording _validatePath]";
  v8 = 2112;
  v9 = v5;
  v10 = 2112;
  v11 = a2;
  _os_log_error_impl(&dword_1BD830000, a3, OS_LOG_TYPE_ERROR, "%s -- WARNING: bogus path (%@) detected for recording %@", (uint8_t *)&v6, 0x20u);

}

+ (void)deleteOrphanedEntityRevisionsWithContext:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Recording"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEntity:", v5);

  objc_msgSend(v4, "setPropertiesToFetch:", &unk_1E76A94B8);
  objc_msgSend(v3, "executeFetchRequest:error:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("recordingID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("EntityRevision"), v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEntity:", v9);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (recording_id IN %@)"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v10);

  objc_msgSend(v3, "executeFetchRequest:error:", v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v3, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

+ (id)fetchLegacyRecordingsForMigrationWithContext:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("EntityRevision"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEntity:", v5);

  objc_msgSend(v4, "setPropertiesToFetch:", &unk_1E76A94D0);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("revision_id"), 1);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v6);

  v7 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v29 = v4;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v13, "revisionID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v13, "recordingID"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v10);
  }

  v16 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Recording"), v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEntity:", v17);

  objc_msgSend(v16, "setPropertiesToFetch:", &unk_1E76A94E8);
  v30 = v3;
  objc_msgSend(v3, "executeFetchRequest:error:", v16, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v23, "recordingID"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setRevisionID:", objc_msgSend(v25, "longLongValue"));

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v20);
  }
  objc_msgSend(v18, "sortedArrayUsingComparator:", &__block_literal_global_3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

uint64_t __65__RCSavedRecording_fetchLegacyRecordingsForMigrationWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "revisionID");
  v6 = objc_msgSend(v4, "revisionID");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

+ (id)legacyRecordingWithUniqueIDFetchRequest:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C97B48];
  v4 = a3;
  objc_msgSend(v3, "fetchRequestWithEntityName:", CFSTR("Recording"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("uniqueID"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v6);
  return v5;
}

- (int64_t)revisionID
{
  return self->revisionID;
}

- (void)setRevisionID:(int64_t)a3
{
  self->revisionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avAsset, 0);
}

@end
