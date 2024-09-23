@implementation RCCloudRecording

- (double)length
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[RCCloudRecording localDuration](self, "localDuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "doubleValue");
  else
    -[RCCloudRecording syncedDuration](self, "syncedDuration");
  v6 = v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avAsset, 0);
}

- (BOOL)manuallyRenamed
{
  return -[RCCloudRecording _getFlag:](self, "_getFlag:", 8);
}

- (BOOL)playable
{
  return -[RCCloudRecording _getFlag:](self, "_getFlag:", 4);
}

- (BOOL)enhanced
{
  return (-[RCCloudRecording syncedSharedFlags](self, "syncedSharedFlags") >> 1) & 1;
}

- (BOOL)favorite
{
  return -[RCCloudRecording syncedSharedFlags](self, "syncedSharedFlags") & 1;
}

- (unint64_t)syncedSharedFlags
{
  void *v2;
  unint64_t v3;

  -[RCCloudRecording sharedFlags](self, "sharedFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (NSString)localTitle
{
  return (NSString *)-[RCCloudRecording valueForKey:](self, "valueForKey:", CFSTR("customLabelForSorting"));
}

- (BOOL)_localAssetIsReachable
{
  void *v2;
  void *v3;
  char v4;

  -[RCCloudRecording url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "checkResourceIsReachableAndReturnError:", 0);
  else
    v4 = 0;

  return v4;
}

- (BOOL)_composedURLIsCloneOfAudioFuture
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[RCCloudRecording syncedAudioFuture](self, "syncedAudioFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[RCCloudRecording url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0;
  if (v4 && v5)
    v7 = identicalClones(v4, v5);

  return v7;
}

- (NSURL)url
{
  void *v2;
  void *v3;
  void *v4;

  -[RCCloudRecording fileName](self, "fileName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    RCRecordingsDirectoryURL();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLByAppendingPathComponent:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return (NSURL *)v4;
}

- (NSString)fileName
{
  return (NSString *)-[RCCloudRecording valueForKey:](self, "valueForKey:", CFSTR("path"));
}

- (BOOL)_audioFutureIsCurrent
{
  return -[RCCloudRecording _audioFutureUUIDIsCurrent](self, "_audioFutureUUIDIsCurrent")
      || -[RCCloudRecording _composedURLIsCloneOfAudioFuture](self, "_composedURLIsCloneOfAudioFuture");
}

- (RCCloudRecording)initWithContext:(id)a3 andCreationDate:(id)a4
{
  id v6;
  RCCloudRecording *v7;
  RCCloudRecording *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)RCCloudRecording;
  v7 = -[RCCloudRecording initWithContext:](&v10, sel_initWithContext_, a3);
  v8 = v7;
  if (v7)
    -[RCCloudRecording setValue:forKey:](v7, "setValue:forKey:", v6, CFSTR("date"));

  return v8;
}

- (void)migrateLocalProperties
{
  void *v3;
  void *v4;

  -[RCCloudRecording encryptedTitle](self, "encryptedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[RCCloudRecording setLocalTitle:](self, "setLocalTitle:", v3);
  }
  else
  {
    -[RCCloudRecording valueForKey:](self, "valueForKey:", CFSTR("customLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCCloudRecording setLocalTitle:](self, "setLocalTitle:", v4);

  }
  -[RCCloudRecording _updateLocalDurationWithAssetDuration](self, "_updateLocalDurationWithAssetDuration");
}

- (void)_updateLocalDurationWithAssetDuration
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;

  -[RCCloudRecording url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v9 = v3;
    v5 = objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", 0);
    v4 = v9;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rc_durationInSeconds");
      if (v7 > 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[RCCloudRecording setLocalDuration:](self, "setLocalDuration:", v8);

      }
      v4 = v9;
    }
  }

}

- (id)_localTitleForWillSave
{
  RCCloudRecording *v3;
  RCCloudRecording *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[RCCloudRecording isInserted](self, "isInserted"))
  {
    v3 = self;
  }
  else
  {
    if (!-[RCCloudRecording hasChanges](self, "hasChanges"))
    {
LABEL_12:
      v5 = 0;
      return v5;
    }
    -[RCCloudRecording changedValues](self, "changedValues");
    v3 = (RCCloudRecording *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  if (!v3)
    goto LABEL_12;
  -[RCCloudRecording valueForKey:](v3, "valueForKey:", CFSTR("encryptedTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isNotNullAndNotNSNull(v5) & 1) == 0)
  {
    -[RCCloudRecording valueForKey:](v4, "valueForKey:", CFSTR("customLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!isNotNullAndNotNSNull(v6)
      || (-[RCCloudRecording valueForKey:](self, "valueForKey:", CFSTR("encryptedTitle")),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {

      v6 = 0;
    }

    v5 = v6;
  }

  return v5;
}

- (void)willSave
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "uuid");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_1BD830000, v2, v3, "%s -- no path for recording when saving - uniqueID = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7_0();
}

- (BOOL)validateForInsert:(id *)a3
{
  void *v3;
  BOOL v4;

  -[RCCloudRecording creationDate](self, "creationDate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)validateForUpdate:(id *)a3
{
  void *v3;
  BOOL v4;

  -[RCCloudRecording creationDate](self, "creationDate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)synchronizeRecordingMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  const char *v11;
  NSObject *v12;
  const char *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[RCCloudRecording url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", 0)
    && -[RCCloudRecording playable](self, "playable"))
  {
    objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rc_recordingMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    -[RCCloudRecording title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("title"));

    v14 = 0;
    v8 = objc_msgSend(MEMORY[0x1E0C8AF90], "rc_updateMetadataInFile:withRecordingMetadata:error:", v3, v6, &v14);
    v9 = v14;
    if (v8)
    {
      v10 = objc_retainAutorelease(v3);
      v11 = (const char *)objc_msgSend(v10, "fileSystemRepresentation");
      if (audioDigestAttribute_onceToken != -1)
      {
        v13 = v11;
        dispatch_once(&audioDigestAttribute_onceToken, &__block_literal_global_9);
        v11 = v13;
      }
      removexattr(v11, (const char *)audioDigestAttribute__audioDigestAttribute, 0);
      -[RCCloudRecording _updateAudioFuture:isRecovery:](self, "_updateAudioFuture:isRecovery:", v10, 0);
    }
    else
    {
      OSLogForCategory(CFSTR("Service"));
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "-[RCCloudRecording synchronizeRecordingMetadata]";
        v17 = 2112;
        v18 = v9;
        _os_log_impl(&dword_1BD830000, v12, OS_LOG_TYPE_DEFAULT, "%s -- ERROR:  synchronizing file metadata (error = %@)", buf, 0x16u);
      }

    }
  }

}

- (void)_updateAudioFuture:(id)a3 isRecovery:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
  {
    -[RCCloudRecording url](self, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    computeAudioDigest((uint64_t)v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;

    if (!v8)
    {
      OSLogForCategory(CFSTR("Service"));
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[RCCloudRecording _updateAudioFuture:isRecovery:].cold.2();

    }
    -[RCCloudRecording audioDigest](self, "audioDigest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCCloudRecording syncedAudioFuture](self, "syncedAudioFuture");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12 || !v11 || !objc_msgSend(v11, "isEqualToData:", v8) || v4)
    {
      v13 = (void *)objc_msgSend(MEMORY[0x1E0C97B88], "createFutureForFileAtURL:", v6);
      OSLogForCategory(CFSTR("Service"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          -[RCCloudRecording uuid](self, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v19 = "-[RCCloudRecording _updateAudioFuture:isRecovery:]";
          v20 = 2112;
          v21 = v16;
          v22 = 2112;
          v23 = v11;
          v24 = 2112;
          v25 = v8;
          _os_log_impl(&dword_1BD830000, v15, OS_LOG_TYPE_DEFAULT, "%s -- uniqueID = %@, oldDigest = %@, newDigest = %@", buf, 0x2Au);

        }
        -[RCCloudRecording setSyncedAudioFuture:](self, "setSyncedAudioFuture:", v13);
        -[RCCloudRecording setAudioDigest:](self, "setAudioDigest:", v8);
        objc_msgSend(v13, "UUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[RCCloudRecording _enqueueAudioFutureUUID:](self, "_enqueueAudioFutureUUID:", v17);

        -[RCCloudRecording setFlags:](self, "setFlags:", -[RCCloudRecording flags](self, "flags") & 0xFFFFFFFFFFFFFFF9 | 4);
        -[RCCloudRecording _updateTranscriptionAvailabilityFlags:](self, "_updateTranscriptionAvailabilityFlags:", v6);
      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[RCCloudRecording _updateAudioFuture:isRecovery:].cold.1();

      }
    }
    -[RCCloudRecording setAvAsset:](self, "setAvAsset:", 0);

  }
  else
  {
    OSLogForCategory(CFSTR("Service"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[RCCloudRecording _updateAudioFuture:isRecovery:].cold.3();
  }

}

- (void)_updateTranscriptionAvailabilityFlags:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _BOOL8 v8;
  _BOOL8 v9;
  NSObject *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rc_transcriptionData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v11 = 0;
    +[TranscriptionDecoder decodeTransciptionData:error:](TranscriptionDecoder, "decodeTransciptionData:error:", v5, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    v8 = v6 != 0;
    if (v6)
    {
      v9 = objc_msgSend(v6, "length") != 0;
    }
    else
    {
      OSLogForCategory(CFSTR("Service"));
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[RCCloudRecording _updateTranscriptionAvailabilityFlags:].cold.1();

      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  -[RCCloudRecording setHasBeenTranscribed:](self, "setHasBeenTranscribed:", v8);
  -[RCCloudRecording setTranscriptionContentExists:](self, "setTranscriptionContentExists:", v9);

}

- (void)migrateSyncedUUIDs
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- failed to evict audio future - error = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)_enqueueAudioFutureUUID:(id)a3
{
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  if (v11)
  {
    -[RCCloudRecording audioFutureUUIDs](self, "audioFutureUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", v11);

    if ((v5 & 1) == 0)
    {
      -[RCCloudRecording audioFutureUUIDs](self, "audioFutureUUIDs");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = (void *)MEMORY[0x1E0C9AA60];
      if (v6)
        v8 = (void *)v6;
      v9 = v8;

      objc_msgSend(v9, "arrayByAddingObject:", v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[RCCloudRecording setAudioFutureUUIDs:](self, "setAudioFutureUUIDs:", v10);
    }
  }

}

- (void)copySharedFlagsFromOriginalRecording:(id)a3
{
  -[RCCloudRecording setSyncedSharedFlags:](self, "setSyncedSharedFlags:", objc_msgSend(a3, "syncedSharedFlags"));
}

- (BOOL)recreateAudioFutureIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[RCCloudRecording syncedAudioFuture](self, "syncedAudioFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCCloudRecording url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4
    && objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", 0)
    && (!v3 || -[RCCloudRecording _audioFutureIsOutdated:](self, "_audioFutureIsOutdated:", v3)))
  {
    OSLogForCategory(CFSTR("Service"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[RCCloudRecording uuid](self, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[RCCloudRecording recreateAudioFutureIfNecessary]";
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1BD830000, v6, OS_LOG_TYPE_DEFAULT, "%s -- Recreating audio future - recording uuid = %@", (uint8_t *)&v10, 0x16u);

    }
    -[RCCloudRecording updateAudioFutureWithLocalAsset](self, "updateAudioFutureWithLocalAsset");
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)updateAudioFutureWithLocalAsset
{
  id v3;

  -[RCCloudRecording url](self, "url");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[RCCloudRecording _updateAudioFuture:isRecovery:](self, "_updateAudioFuture:isRecovery:", v3, 1);

}

- (BOOL)_audioFutureIsOutdated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  objc_msgSend(a3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[RCCloudRecording audioFutureUUIDs](self, "audioFutureUUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsObject:", v4))
    {
      -[RCCloudRecording audioFutureUUIDs](self, "audioFutureUUIDs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "isEqual:", v7) ^ 1;

    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)_audioFutureUUIDIsCurrent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[RCCloudRecording audioFutureUUIDs](self, "audioFutureUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCCloudRecording syncedAudioFuture](self, "syncedAudioFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  return v7;
}

- (BOOL)localAssetIsCurrent
{
  _BOOL4 v3;

  v3 = -[RCCloudRecording _localAssetIsReachable](self, "_localAssetIsReachable");
  if (v3)
    LOBYTE(v3) = -[RCCloudRecording _audioFutureIsCurrent](self, "_audioFutureIsCurrent");
  return v3;
}

- (BOOL)synchronizeWithExistingAudioFuture:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  const char *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  void *v26;
  void *v27;
  id v28[2];
  stat v29;
  stat v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[RCCloudRecording syncedAudioFuture](self, "syncedAudioFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCCloudRecording url](self, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (identicalClones(v11, v7)
        || (memset(&v30, 0, sizeof(v30)),
            memset(&v29, 0, sizeof(v29)),
            v10 = objc_retainAutorelease(v10),
            !stat((const char *)objc_msgSend(v10, "fileSystemRepresentation"), &v30))
        && !stat((const char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation"), &v29)
        && !(v30.st_size | v29.st_size))
      {
LABEL_31:
        v12 = 1;
        goto LABEL_32;
      }
    }
    else
    {
      +[RCSavedRecordingsModel standardPathForRecording:](RCSavedRecordingsModel, "standardPathForRecording:", self);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[RCComposition deleteFromFilesystem:](RCComposition, "deleteFromFilesystem:", v11);
    v13 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation");
    v10 = objc_retainAutorelease(v10);
    if (clonefile(v13, (const char *)objc_msgSend(v10, "fileSystemRepresentation"), 0))
    {
      if (a3)
      {
LABEL_13:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
        v12 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

        goto LABEL_33;
      }
    }
    else
    {
      v10 = objc_retainAutorelease(v10);
      if (!chmod((const char *)objc_msgSend(v10, "fileSystemRepresentation"), 0x1A4u))
      {
        v28[1] = 0;
        computeAudioDigest((uint64_t)v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        if (!v14)
        {
          OSLogForCategory(CFSTR("Service"));
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v30.st_dev = 136315394;
            *(_QWORD *)&v30.st_mode = "-[RCCloudRecording synchronizeWithExistingAudioFuture:]";
            WORD2(v30.st_ino) = 2112;
            *(__darwin_ino64_t *)((char *)&v30.st_ino + 6) = (__darwin_ino64_t)v15;
            _os_log_impl(&dword_1BD830000, v16, OS_LOG_TYPE_DEFAULT, "%s -- digestError = %@", (uint8_t *)&v30, 0x16u);
          }

        }
        v27 = v15;
        -[RCCloudRecording setAudioDigest:](self, "setAudioDigest:", v14);
        objc_msgSend(v10, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[RCCloudRecording setFileName:](self, "setFileName:", v17);

        -[RCCloudRecording setFlags:](self, "setFlags:", -[RCCloudRecording flags](self, "flags") & 0xFFFFFFFFFFFFFFF9 | 4);
        OSLogForCategory(CFSTR("Service"));
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          -[RCCloudRecording uuid](self, "uuid");
          v26 = v14;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "lastPathComponent");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v30.st_dev = 136315650;
          *(_QWORD *)&v30.st_mode = "-[RCCloudRecording synchronizeWithExistingAudioFuture:]";
          WORD2(v30.st_ino) = 2112;
          *(__darwin_ino64_t *)((char *)&v30.st_ino + 6) = (__darwin_ino64_t)v19;
          HIWORD(v30.st_gid) = 2112;
          *(_QWORD *)&v30.st_rdev = v20;
          _os_log_impl(&dword_1BD830000, v18, OS_LOG_TYPE_DEFAULT, "%s -- synchronized recording uuid = %@ audioFuture to %@", (uint8_t *)&v30, 0x20u);

          v14 = v26;
        }

        OSLogForCategory(CFSTR("Service"));
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[RCCloudRecording synchronizeWithExistingAudioFuture:].cold.2((uint64_t)v10, v21);

        -[RCCloudRecording _updateLocalDurationWithAssetDuration](self, "_updateLocalDurationWithAssetDuration");
        objc_msgSend(v5, "UUID");
        v22 = objc_claimAutoreleasedReturnValue();
        -[RCCloudRecording _enqueueAudioFutureUUID:](self, "_enqueueAudioFutureUUID:", v22);

        -[RCCloudRecording _updateTranscriptionAvailabilityFlags:](self, "_updateTranscriptionAvailabilityFlags:", v11);
        v28[0] = 0;
        LOBYTE(v22) = -[RCCloudRecording markRecordingAsExported:error:](self, "markRecordingAsExported:error:", v11, v28);
        v23 = v28[0];
        if ((v22 & 1) == 0)
        {
          OSLogForCategory(CFSTR("Service"));
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[RCCloudRecording synchronizeWithExistingAudioFuture:].cold.1();

        }
        goto LABEL_31;
      }
      if (a3)
        goto LABEL_13;
    }
    v12 = 0;
    goto LABEL_32;
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, 0);
    v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_33:

  return v12;
}

+ (BOOL)isRecordingExported:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  id v6;
  id v7;
  char v8;
  NSObject *v9;
  id v11;
  id v12;

  v3 = a3;
  if (isAudioFilePurgeable(v3))
  {
    v4 = *MEMORY[0x1E0C9AC90];
    v11 = 0;
    v12 = 0;
    v5 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v12, v4, &v11);
    v6 = v12;
    v7 = v11;
    if (v5)
    {
      v8 = objc_msgSend(v6, "BOOLValue");
    }
    else
    {
      OSLogForCategory(CFSTR("Default"));
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[RCCloudRecording isRecordingExported:].cold.1();

      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)markRecordingAsExported:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  int v8;
  BOOL v9;
  uint64_t value;

  value = 1;
  v6 = objc_retainAutorelease(a3);
  v7 = (const char *)objc_msgSend(v6, "fileSystemRepresentation");
  if (audioFileFlagsAttribute_onceToken != -1)
    dispatch_once(&audioFileFlagsAttribute_onceToken, &__block_literal_global_182);
  v8 = setxattr(v7, (const char *)audioFileFlagsAttribute__audioFileFlagsAttribute, &value, 8uLL, 0, 0);
  if (a4 && v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v8
         || !+[RCComposition excludeFromBackup:error:](RCComposition, "excludeFromBackup:error:", v6, a4))
  {
    v9 = 0;
  }
  else
  {
    -[RCCloudRecording _evictAudioFuture](self, "_evictAudioFuture");
    v9 = 1;
  }

  return v9;
}

- (void)_evictAudioFuture
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a1, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "audioFutureUUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1BD830000, v4, v5, "%s -- Audio future is not current, UUID = %@ audioFutureUUIDs %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_9();
}

- (NSNumber)purgeableAudioFileSize
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  id v7;

  -[RCCloudRecording url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!isAudioFilePurgeable(v2))
    goto LABEL_4;
  v7 = 0;
  v3 = objc_msgSend(v2, "getResourceValue:forKey:error:", &v7, *MEMORY[0x1E0C99998], 0);
  v4 = v7;
  v5 = v4;
  if ((v3 & 1) == 0)
  {

LABEL_4:
    v5 = 0;
  }

  return (NSNumber *)v5;
}

- (id)purgeAudioFileWithModel:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[RCCloudRecording url](self, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (isAudioFilePurgeable(v7))
  {
    v22 = 0;
    v8 = objc_msgSend(v7, "getResourceValue:forKey:error:", &v22, *MEMORY[0x1E0C99998], a4);
    v9 = v22;
    v10 = 0;
    if (v8)
    {
      -[RCCloudRecording setFileName:](self, "setFileName:", 0);
      -[RCCloudRecording setPlayable:](self, "setPlayable:", 0);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v12 = objc_msgSend(v11, "removeItemAtURL:error:", v7, &v21);
      v13 = v21;

      if ((v12 & 1) != 0)
      {
        -[RCCloudRecording syncedAudioFuture](self, "syncedAudioFuture");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v6, "context");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0;
          v16 = objc_msgSend(v15, "evictFuture:withError:", v14, &v20);
          v17 = v20;
          if ((v16 & 1) == 0)
          {
            OSLogForCategory(CFSTR("Service"));
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v24 = "-[RCCloudRecording purgeAudioFileWithModel:error:]";
              v25 = 2112;
              v26 = v17;
              _os_log_impl(&dword_1BD830000, v18, OS_LOG_TYPE_DEFAULT, "%s -- evictError = %@", buf, 0x16u);
            }

          }
        }
        v10 = v9;

      }
      else
      {
        v10 = 0;
        if (a4)
          *a4 = objc_retainAutorelease(v13);
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)audioFutureNeedsDownload
{
  return -[RCCloudRecording _getFlag:](self, "_getFlag:", 2);
}

- (void)setAudioFutureNeedsDownload:(BOOL)a3
{
  -[RCCloudRecording _setFlag:value:](self, "_setFlag:value:", 2, a3);
}

- (BOOL)audioFutureNeedsExport
{
  return -[RCCloudRecording _getFlag:](self, "_getFlag:", 256);
}

- (void)setAudioFutureNeedsExport:(BOOL)a3
{
  -[RCCloudRecording _setFlag:value:](self, "_setFlag:value:", 256, a3);
}

- (BOOL)hasBeenTranscribed
{
  return -[RCCloudRecording _getFlag:](self, "_getFlag:", 512);
}

- (void)setHasBeenTranscribed:(BOOL)a3
{
  -[RCCloudRecording _setFlag:value:](self, "_setFlag:value:", 512, a3);
}

- (BOOL)transcriptionContentExists
{
  return -[RCCloudRecording _getFlag:](self, "_getFlag:", 1024);
}

- (void)setTranscriptionContentExists:(BOOL)a3
{
  -[RCCloudRecording _setFlag:value:](self, "_setFlag:value:", 1024, a3);
}

- (void)_setFlag:(unint64_t)a3 value:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  unint64_t v8;

  v4 = a4;
  v7 = -[RCCloudRecording flags](self, "flags");
  if (v4)
    v8 = v7 | a3;
  else
    v8 = v7 & ~a3;
  -[RCCloudRecording setFlags:](self, "setFlags:", v8);
}

- (BOOL)_getFlag:(unint64_t)a3
{
  return (a3 & ~-[RCCloudRecording flags](self, "flags")) == 0;
}

- (void)setPlayable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  id v17;

  v3 = a3;
  -[RCCloudRecording _setFlag:value:](self, "_setFlag:value:", 4, a3);
  if (v3)
  {
    -[RCCloudRecording url](self, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, 0);

    if (v8)
    {
      -[RCCloudRecording title](self, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "rc_recordingMetadata");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend((id)v11, "mutableCopy");

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("title"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v11) = objc_msgSend(v9, "isEqualToString:", v13);

      if ((v11 & 1) == 0)
      {
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("title"));
        v17 = 0;
        v14 = objc_msgSend(MEMORY[0x1E0C8AF90], "rc_updateMetadataInFile:withRecordingMetadata:error:", v5, v12, &v17);
        v15 = v17;
        if ((v14 & 1) == 0)
        {
          OSLogForCategory(CFSTR("Service"));
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[RCCloudRecording setPlayable:].cold.1();

        }
      }
      -[RCCloudRecording _updateAudioFuture:isRecovery:](self, "_updateAudioFuture:isRecovery:", v5, 0);

    }
  }
}

- (void)setManuallyRenamed:(BOOL)a3
{
  -[RCCloudRecording _setFlag:value:](self, "_setFlag:value:", 8, a3);
}

- (BOOL)recordedOnWatch
{
  return -[RCCloudRecording _getFlag:](self, "_getFlag:", 64);
}

- (void)setRecordedOnWatch:(BOOL)a3
{
  -[RCCloudRecording _setFlag:value:](self, "_setFlag:value:", 64, a3);
}

- (BOOL)watchOS
{
  return (-[RCCloudRecording syncedSharedFlags](self, "syncedSharedFlags") >> 6) & 1;
}

- (void)setWatchOS:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[RCCloudRecording syncedSharedFlags](self, "syncedSharedFlags") & 0xFFFFFFFFFFFFFFBFLL;
  v6 = 64;
  if (!v3)
    v6 = 0;
  -[RCCloudRecording setSyncedSharedFlags:](self, "setSyncedSharedFlags:", v5 | v6);
}

- (BOOL)musicMemo
{
  return (-[RCCloudRecording syncedSharedFlags](self, "syncedSharedFlags") >> 2) & 1;
}

- (void)setMusicMemo:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[RCCloudRecording syncedSharedFlags](self, "syncedSharedFlags") & 0xFFFFFFFFFFFFFFFBLL;
  v6 = 4;
  if (!v3)
    v6 = 0;
  -[RCCloudRecording setSyncedSharedFlags:](self, "setSyncedSharedFlags:", v5 | v6);
}

- (void)setFavorite:(BOOL)a3
{
  -[RCCloudRecording setSyncedSharedFlags:](self, "setSyncedSharedFlags:", -[RCCloudRecording syncedSharedFlags](self, "syncedSharedFlags") & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (void)setEnhanced:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[RCCloudRecording syncedSharedFlags](self, "syncedSharedFlags") & 0xFFFFFFFFFFFFFFFDLL;
  v6 = 2;
  if (!v3)
    v6 = 0;
  -[RCCloudRecording setSyncedSharedFlags:](self, "setSyncedSharedFlags:", v5 | v6);
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___RCCloudRecording;
  v3 = a3;
  objc_msgSendSuper2(&v9, sel_keyPathsForValuesAffectingValueForKey_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("enhanced"), v9.receiver, v9.super_class);

  if (v5)
  {
    v10[0] = CFSTR("sharedFlags");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setByAddingObjectsFromArray:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  return v4;
}

- (void)setFileName:(id)a3
{
  -[RCCloudRecording setValue:forKey:](self, "setValue:forKey:", a3, CFSTR("path"));
}

- (NSURL)URIRepresentation
{
  void *v2;
  void *v3;

  -[RCCloudRecording objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URIRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)setTitle:(id)a3
{
  id v4;

  v4 = a3;
  -[RCCloudRecording setLocalTitle:](self, "setLocalTitle:", v4);
  -[RCCloudRecording setEncryptedTitle:](self, "setEncryptedTitle:", v4);

}

- (BOOL)isContentBeingModified
{
  void *v2;
  BOOL v3;

  -[RCCloudRecording url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[RCComposition _isSessionWithModificationAccessActiveForComposedAVURL:](RCComposition, "_isSessionWithModificationAccessActiveForComposedAVURL:", v2);

  return v3;
}

- (id)_labelAllowingEmptyString:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  -[RCCloudRecording title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    if (v4)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    return v8;
  }
  if (a3)
  {
    v8 = 0;
    goto LABEL_6;
  }
  RCLocalizedFrameworkString(CFSTR("UNNAMED_RECORDING_LABEL"));
  v9 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)v9;
  if (!v9)
    goto LABEL_8;
LABEL_3:
  RCDisplayStringForString(v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v8;
}

- (id)_detailLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[RCCloudRecording _labelAllowingEmptyString:](self, "_labelAllowingEmptyString:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = (void *)_detailLabel___timeFormatter;
    if (!_detailLabel___timeFormatter)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      v6 = (void *)_detailLabel___timeFormatter;
      _detailLabel___timeFormatter = (uint64_t)v5;

      objc_msgSend((id)_detailLabel___timeFormatter, "setTimeStyle:", 1);
      objc_msgSend((id)_detailLabel___timeFormatter, "setDateStyle:", 0);
      v4 = (void *)_detailLabel___timeFormatter;
    }
    -[RCCloudRecording creationDate](self, "creationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate:", v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (AVAsset)avAsset
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
    -[RCCloudRecording url](self, "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "fileExistsAtPath:", v5);

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0C8B3C0];
      -[RCCloudRecording url](self, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rc_preciseTimingAssetWithURL:", v8);
      v9 = (AVAsset *)objc_claimAutoreleasedReturnValue();
      avAsset = self->_avAsset;
      self->_avAsset = v9;

    }
  }
  return self->_avAsset;
}

- (id)_fileNameForSharing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v15;

  -[RCCloudRecording title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v7, "stringWithUTF8String:", objc_msgSend(v8, "fileSystemRepresentation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
    goto LABEL_4;
  -[RCCloudRecording url](self, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByDeletingPathExtension");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length"))
  {
    v9 = v12;
LABEL_4:
    v12 = v9;
    v13 = v12;
    goto LABEL_5;
  }
  OSLogForCategory(CFSTR("Default"));
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[RCCloudRecording _fileNameForSharing].cold.1(v15);

  v13 = 0;
LABEL_5:

  return v13;
}

- (id)copyResourcesForSharingIntoDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v22;
  void *v23;
  id v24;
  id v25;

  v4 = a3;
  -[RCCloudRecording url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCCloudRecording _fileNameForSharing](self, "_fileNameForSharing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v8, "URLByAppendingPathExtension:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0;
    LOBYTE(v8) = objc_msgSend(v7, "copyItemAtURL:toURL:error:", v5, v10, &v25);
    v11 = v25;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v5, "URLByDeletingPathExtension");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URLByAppendingPathExtension:", CFSTR("waveform"));
      v13 = objc_claimAutoreleasedReturnValue();

      -[NSObject lastPathComponent](v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "URLByAppendingPathComponent:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)v15;
      objc_msgSend(v7, "copyItemAtURL:toURL:error:", v13, v15, 0);
      objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "rc_recordingMetadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "mutableCopy");

      objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, CFSTR("title"));
      v24 = v11;
      LOBYTE(v15) = objc_msgSend(MEMORY[0x1E0C8AF90], "rc_updateMetadataInFile:withRecordingMetadata:error:", v10, v17, &v24);
      v18 = v24;

      if ((v15 & 1) != 0)
      {
        v19 = v10;
      }
      else
      {
        OSLogForCategory(CFSTR("Default"));
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[RCCloudRecording copyResourcesForSharingIntoDirectory:].cold.1();

        v19 = 0;
      }

    }
    else
    {
      OSLogForCategory(CFSTR("Default"));
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[RCCloudRecording copyResourcesForSharingIntoDirectory:].cold.2();
      v19 = 0;
      v18 = v11;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)subjectForActivityType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.UIKit.activity.AirDrop")))
  {
    v11[0] = CFSTR("SFAirDropActivitySubjectMain");
    -[RCCloudRecording _detailLabel](self, "_detailLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = CFSTR("SFAirDropActivitySubjectDuration");
    v12[0] = v4;
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[RCCloudRecording length](self, "length");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);

    return v9;
  }
  else
  {
    -[RCCloudRecording _detailLabel](self, "_detailLabel");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)setLength:(double)a3
{
  void *v5;
  AVAsset *avAsset;

  -[RCCloudRecording setSyncedDuration:](self, "setSyncedDuration:");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCCloudRecording setLocalDuration:](self, "setLocalDuration:", v5);

  avAsset = self->_avAsset;
  self->_avAsset = 0;

}

- (NSString)userFolderUUID
{
  void *v2;
  void *v3;

  -[RCCloudRecording folder](self, "folder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLocalTitle:(id)a3
{
  -[RCCloudRecording setValue:forKey:](self, "setValue:forKey:", a3, CFSTR("customLabelForSorting"));
}

- (void)setAvAsset:(id)a3
{
  objc_storeStrong((id *)&self->_avAsset, a3);
}

- (double)syncedDuration
{
  void *v2;
  double v3;
  double v4;

  -[RCCloudRecording duration](self, "duration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (void)setSyncedDuration:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RCCloudRecording setDuration:](self, "setDuration:", v4);

}

- (void)setSyncedSharedFlags:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RCCloudRecording setSharedFlags:](self, "setSharedFlags:", v4);

}

- (id)recordingsModel
{
  void *v2;
  void *v3;

  -[RCCloudRecording managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordingsModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_copyCustomLabelToEncryptedTitleIfNeeded
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v7;
  void *v8;

  -[RCCloudRecording customLabel](self, "customLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (-[RCCloudRecording _migratedTitleDateString](self, "_migratedTitleDateString"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v3, "isEqualToString:", v4),
        v4,
        (v5 & 1) == 0))
  {
    -[RCCloudRecording customLabel](self, "customLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCCloudRecording setEncryptedTitle:](self, "setEncryptedTitle:", v7);

    -[RCCloudRecording customLabel](self, "customLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCCloudRecording setLocalTitle:](self, "setLocalTitle:", v8);

    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_copyEncryptedTitleToCustomLabelIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[RCCloudRecording localTitle](self, "localTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[RCCloudRecording encryptedTitle](self, "encryptedTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return 0;
  }
  -[RCCloudRecording encryptedTitle](self, "encryptedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[RCCloudRecording setCustomLabel:](self, "setCustomLabel:", v5);
  }
  else
  {
    -[RCCloudRecording localTitle](self, "localTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCCloudRecording setCustomLabel:](self, "setCustomLabel:", v6);

  }
  return 1;
}

- (void)updateForRemoteTitleChange:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  const char *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (-[RCCloudRecording _isReadyToMigrate](self, "_isReadyToMigrate"))
  {
    if (v3)
    {
      if (!-[RCCloudRecording _migrateCustomLabelIfNeeded:](self, "_migrateCustomLabelIfNeeded:", 1))
        return;
      OSLogForCategory(CFSTR("Service"));
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
      -[RCCloudRecording uuid](self, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315394;
      v9 = "-[RCCloudRecording(SyncedProperties) updateForRemoteTitleChange:]";
      v10 = 2112;
      v11 = v6;
      v7 = "%s -- Migrated customLabel to encryptedTitle for recording %@";
    }
    else
    {
      if (!-[RCCloudRecording _copyCustomLabelToEncryptedTitleIfNeeded](self, "_copyCustomLabelToEncryptedTitleIfNeeded"))return;
      OSLogForCategory(CFSTR("Service"));
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
      -[RCCloudRecording uuid](self, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315394;
      v9 = "-[RCCloudRecording(SyncedProperties) updateForRemoteTitleChange:]";
      v10 = 2112;
      v11 = v6;
      v7 = "%s -- Copied customLabel to encryptedTitle for recording %@";
    }
    _os_log_impl(&dword_1BD830000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v8, 0x16u);

LABEL_10:
  }
}

- (void)updateForLocalTitleChange:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (!-[RCCloudRecording _migrateCustomLabelIfNeeded:](self, "_migrateCustomLabelIfNeeded:", 0))
      return;
    OSLogForCategory(CFSTR("Service"));
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    -[RCCloudRecording uuid](self, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[RCCloudRecording(SyncedProperties) updateForLocalTitleChange:]";
    v9 = 2112;
    v10 = v5;
    v6 = "%s -- Migrated customLabel to encryptedTitle for recording %@";
    goto LABEL_8;
  }
  if (!-[RCCloudRecording _copyEncryptedTitleToCustomLabelIfNeeded](self, "_copyEncryptedTitleToCustomLabelIfNeeded"))
    return;
  OSLogForCategory(CFSTR("Service"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[RCCloudRecording uuid](self, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[RCCloudRecording(SyncedProperties) updateForLocalTitleChange:]";
    v9 = 2112;
    v10 = v5;
    v6 = "%s -- Copied encryptedTitle to customLabel for recording %@";
LABEL_8:
    _os_log_impl(&dword_1BD830000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 0x16u);

  }
LABEL_9:

}

- (void)updateNilTitleFields:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (-[RCCloudRecording _isReadyToMigrate](self, "_isReadyToMigrate"))
  {
    -[RCCloudRecording encryptedTitle](self, "encryptedTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[RCCloudRecording localTitle](self, "localTitle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCCloudRecording setEncryptedTitle:](self, "setEncryptedTitle:", v6);

    }
    -[RCCloudRecording customLabel](self, "customLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      if (v3)
      {
        -[RCCloudRecording _migratedTitleDateString](self, "_migratedTitleDateString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[RCCloudRecording setCustomLabel:](self, "setCustomLabel:", v8);

        OSLogForCategory(CFSTR("Service"));
        v9 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
LABEL_12:

          return;
        }
        -[RCCloudRecording uuid](self, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 136315394;
        v13 = "-[RCCloudRecording(SyncedProperties) updateNilTitleFields:]";
        v14 = 2112;
        v15 = v10;
        v11 = "%s -- Updated nil customLabel to date string for recording %@";
      }
      else
      {
        if (!-[RCCloudRecording _copyEncryptedTitleToCustomLabelIfNeeded](self, "_copyEncryptedTitleToCustomLabelIfNeeded"))return;
        OSLogForCategory(CFSTR("Service"));
        v9 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          goto LABEL_12;
        -[RCCloudRecording uuid](self, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 136315394;
        v13 = "-[RCCloudRecording(SyncedProperties) updateNilTitleFields:]";
        v14 = 2112;
        v15 = v10;
        v11 = "%s -- Copied encryptedTitle to customLabel for recording %@";
      }
      _os_log_impl(&dword_1BD830000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0x16u);

      goto LABEL_12;
    }
  }
}

- (id)_migratedTitleDateString
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  RCCloudRecording *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  -[RCCloudRecording managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordingsModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  v17 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__RCCloudRecording_SyncedProperties___migratedTitleDateString__block_invoke;
  v8[3] = &unk_1E769BF58;
  v11 = &v12;
  v5 = v4;
  v9 = v5;
  v10 = self;
  objc_msgSend(v5, "performBlockAndWait:", v8);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __62__RCCloudRecording_SyncedProperties___migratedTitleDateString__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "syncedDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unencryptedTitleDateStringFromDate:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)migrateCustomLabelIfNeeded
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[RCCloudRecording _isReadyToMigrate](self, "_isReadyToMigrate")
    && -[RCCloudRecording _migrateCustomLabelIfNeeded:](self, "_migrateCustomLabelIfNeeded:", 0))
  {
    OSLogForCategory(CFSTR("Service"));
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[RCCloudRecording uuid](self, "uuid");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 136315394;
      v6 = "-[RCCloudRecording(SyncedProperties) migrateCustomLabelIfNeeded]";
      v7 = 2112;
      v8 = v4;
      _os_log_impl(&dword_1BD830000, v3, OS_LOG_TYPE_DEFAULT, "%s -- Migrated customLabel to encryptedTitle for recording %@", (uint8_t *)&v5, 0x16u);

    }
  }
}

- (BOOL)_migrateCustomLabelIfNeeded:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  BOOL v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;

  -[RCCloudRecording _migratedTitleDateString](self, "_migratedTitleDateString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E769F848;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  -[RCCloudRecording customLabel](self, "customLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (-[__CFString isEqualToString:](v8, "isEqualToString:", v9) & 1) == 0)
  {
    -[RCCloudRecording encryptedTitle](self, "encryptedTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", v9);

    if ((v12 & 1) == 0)
    {
      if (a3)
      {
        -[RCCloudRecording _uniqueMigratedTitleWithTitleBase:](self, "_uniqueMigratedTitleWithTitleBase:", v9);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = v9;
      }
      v14 = v13;
      -[RCCloudRecording setEncryptedTitle:](self, "setEncryptedTitle:", v13);

    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  -[RCCloudRecording customLabel](self, "customLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", v8);

  if ((v16 & 1) == 0)
    -[RCCloudRecording setCustomLabel:](self, "setCustomLabel:", v8);
  -[RCCloudRecording encryptedTitle](self, "encryptedTitle");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[RCCloudRecording localTitle](self, "localTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCCloudRecording encryptedTitle](self, "encryptedTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqualToString:", v20);

    if (v21)
    {
      -[RCCloudRecording encryptedTitle](self, "encryptedTitle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCCloudRecording setLocalTitle:](self, "setLocalTitle:", v22);

    }
  }

  return v10;
}

- (id)_uniqueMigratedTitleWithTitleBase:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;

  v4 = a3;
  -[RCCloudRecording managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordingsModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "recordingsWithTitle:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") != 1)
    goto LABEL_4;
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCCloudRecording uuid](self, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    v12 = v4;
  }
  else
  {
LABEL_4:
    objc_msgSend(v6, "nextRecordingDefaultLabelWithCustomTitleBase:", v4);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return v13;
}

- (BOOL)_isReadyToMigrate
{
  void *v3;
  BOOL v4;

  -[RCCloudRecording audioFuture](self, "audioFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 1;
  else
    v4 = -[RCCloudRecording _isOlderThanMandatoryMigrationAge](self, "_isOlderThanMandatoryMigrationAge");

  return v4;
}

- (BOOL)_isOlderThanMandatoryMigrationAge
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[RCCloudRecording date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = v4;

  v6 = 3600.0;
  if (RCIsInternalInstall())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "voiceMemosUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerForKey:", CFSTR("com.apple.VoiceMemos.mandatoryMigrationAgeOverride"));

    if (v8 >= 1)
    {
      OSLogForCategory(CFSTR("Default"));
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[RCCloudRecording uuid](self, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 136315650;
        v13 = "-[RCCloudRecording(SyncedProperties) _isOlderThanMandatoryMigrationAge]";
        v14 = 2048;
        v15 = v8;
        v16 = 2112;
        v17 = v10;
        _os_log_impl(&dword_1BD830000, v9, OS_LOG_TYPE_DEFAULT, "%s -- com.apple.VoiceMemos.mandatoryMigrationAgeOverride was used with value of %li for recording with uuid %@", (uint8_t *)&v12, 0x20u);

      }
      v6 = (double)v8;

    }
  }
  return v6 < -v5;
}

+ (id)savedRecordingURIForSearchableItemIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a3);
}

+ (id)searchableItemIdentifierForSavedRecordingURI:(id)a3
{
  return (id)objc_msgSend(a3, "absoluteString");
}

- (void)_updateAudioFuture:isRecovery:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- Failed to create audio future for file at = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)_updateAudioFuture:isRecovery:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- Could not create audio digest - error = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)_updateAudioFuture:isRecovery:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- File does not exist at = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)_updateTranscriptionAvailabilityFlags:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- Failed to decode transcription, error = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)synchronizeWithExistingAudioFuture:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- failed to mark as exported = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)synchronizeWithExistingAudioFuture:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6[6];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributesOfItemAtPath:error:", a1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1BD830000, a2, OS_LOG_TYPE_DEBUG, "%s -- attributes = %@", (uint8_t *)v6, 0x16u);

}

+ (void)isRecordingExported:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- ERROR reading exclusion flag: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)setPlayable:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- Faied to update audio file metadata: error = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)_fileNameForSharing
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[RCCloudRecording _fileNameForSharing]";
  _os_log_error_impl(&dword_1BD830000, log, OS_LOG_TYPE_ERROR, "%s -- No filename exists for sharing", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)copyResourcesForSharingIntoDirectory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- Failed to remove title metadata - error = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)copyResourcesForSharingIntoDirectory:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- Failed to copy asset for sharing - error = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

@end
