@implementation NSManagedObjectModel(NewObjectModel)

+ (id)rc_currentObjectModel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("VoiceMemos"), CFSTR("momd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v3);
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(a1, "updateAudioFutureAttribute:", v5);
  objc_msgSend(a1, "updateAllowsCloudEncryptionAttributes:", v5);

  return v5;
}

+ (void)updateAudioFutureAttribute:()NewObjectModel
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v3 = objc_msgSend(MEMORY[0x1E0C97A80], "instancesRespondToSelector:", sel_isFileBackedFuture);
  v4 = v13;
  if (v3)
  {
    objc_msgSend(v13, "entitiesByName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CloudRecording"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributesByName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("audioFuture"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "isFileBackedFuture") & 1) == 0)
    {
      objc_msgSend(v13, "entitiesByName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CloudRecording"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "attributesByName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("audioFuture"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setIsFileBackedFuture:", 1);
    }

    v4 = v13;
  }

}

+ (void)updateAllowsCloudEncryptionAttributes:()NewObjectModel
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[9];

  v19[7] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v19[0] = CFSTR("encryptedAudioFuture");
  v19[1] = CFSTR("encryptedCustomLabel");
  v19[2] = CFSTR("encryptedDate");
  v19[3] = CFSTR("encryptedDuration");
  v19[4] = CFSTR("encryptedEvictionDate");
  v19[5] = CFSTR("encryptedSharedFlags");
  v19[6] = CFSTR("encryptedUniqueID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 7);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_msgSend(v3, "entitiesByName", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", CFSTR("CloudRecording"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "attributesByName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAllowsCloudEncryption:", 1);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

+ (id)rc_newObjectModel
{
  void *v1;
  NSObject *v2;

  objc_msgSend(a1, "rc_currentObjectModel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
  {
    OSLogForCategory(CFSTR("Default"));
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      +[NSManagedObjectModel(NewObjectModel) rc_newObjectModel].cold.1(v2);

  }
  return v1;
}

+ (id)rc_v12ObjectModel
{
  void *v2;

  objc_msgSend(a1, "mutableModelForModelFileName:", CFSTR("VoiceMemos12.mom"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "updateAudioFutureAttribute:", v2);
  objc_msgSend(a1, "updateAllowsCloudEncryptionAttributes:", v2);
  return v2;
}

+ (id)rc_v11ObjectModel
{
  void *v2;

  objc_msgSend(a1, "mutableModelForModelFileName:", CFSTR("VoiceMemos11.mom"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "updateAudioFutureAttribute:", v2);
  objc_msgSend(a1, "updateAllowsCloudEncryptionAttributes:", v2);
  return v2;
}

+ (id)rc_v10ObjectModel
{
  void *v2;

  objc_msgSend(a1, "mutableModelForModelFileName:", CFSTR("VoiceMemos10.mom"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "updateAudioFutureAttribute:", v2);
  objc_msgSend(a1, "updateAllowsCloudEncryptionAttributes:", v2);
  return v2;
}

+ (id)rc_v9ObjectModel
{
  void *v2;

  objc_msgSend(a1, "mutableModelForModelFileName:", CFSTR("VoiceMemos9.mom"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "updateAudioFutureAttribute:", v2);
  objc_msgSend(a1, "updateAllowsCloudEncryptionAttributes:", v2);
  return v2;
}

+ (id)rc_v8ObjectModel
{
  void *v2;

  objc_msgSend(a1, "mutableModelForModelFileName:", CFSTR("VoiceMemos8.mom"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "updateAudioFutureAttribute:", v2);
  objc_msgSend(a1, "updateAllowsCloudEncryptionAttributes:", v2);
  return v2;
}

+ (id)rc_v7bObjectModel
{
  void *v2;

  objc_msgSend(a1, "mutableModelForModelFileName:", CFSTR("VoiceMemos7b.mom"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "updateAudioFutureAttribute:", v2);
  return v2;
}

+ (id)rc_v7ObjectModel
{
  void *v2;

  objc_msgSend(a1, "mutableModelForModelFileName:", CFSTR("VoiceMemos7.mom"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "updateAudioFutureAttribute:", v2);
  return v2;
}

+ (id)rc_v6ObjectModel
{
  void *v2;

  objc_msgSend(a1, "mutableModelForModelFileName:", CFSTR("VoiceMemos6.mom"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "updateAudioFutureAttribute:", v2);
  return v2;
}

+ (id)modelCompatibleWithStoreMetadata:()NewObjectModel forStoreURL:
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  const __CFString *v26;
  id obj;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "modelCandidatesForCloudRecordings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C979F0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v7)
  {
    v8 = v7;
    v29 = *(_QWORD *)v35;
    v26 = CFSTR("Cloud");
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v29)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v10, "entityVersionHashesByName", v26);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CloudRecording"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CloudRecording"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Folder"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Folder"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 == v16)
          v17 = 1;
        else
          v17 = objc_msgSend(v15, "isEqual:", v16);
        if ((v14 & v17) == 1 && (objc_msgSend(v10, "isConfiguration:compatibleWithStoreMetadata:", v26, v28) & 1) != 0)
        {
          v24 = v10;

          goto LABEL_25;
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v8)
        continue;
      break;
    }
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v18 = obj;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v31;
    while (2)
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        if ((objc_msgSend(v23, "isConfiguration:compatibleWithStoreMetadata:", CFSTR("Cloud"), v28) & 1) != 0)
        {
          v24 = v23;
          goto LABEL_25;
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      v24 = 0;
      if (v20)
        continue;
      break;
    }
  }
  else
  {
    v24 = 0;
  }
LABEL_25:

  return v24;
}

+ (id)mutableModelForModelFileName:()NewObjectModel
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", CFSTR("VoiceMemos"), CFSTR("momd"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "URLByAppendingPathComponent:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v7);
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  return v9;
}

+ (id)modelCandidatesForCloudRecordings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "rc_v11ObjectModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rc_v10ObjectModel", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  objc_msgSend(a1, "rc_v9ObjectModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  objc_msgSend(a1, "rc_v8ObjectModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  objc_msgSend(a1, "rc_v7bObjectModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v6;
  objc_msgSend(a1, "rc_v7ObjectModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v7;
  objc_msgSend(a1, "rc_v6ObjectModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)rc_newObjectModel
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "+[NSManagedObjectModel(NewObjectModel) rc_newObjectModel]";
  _os_log_fault_impl(&dword_1BD830000, log, OS_LOG_TYPE_FAULT, "%s -- ERROR: Attempt to load model into NSManagedObjectModel failed, possibly due to file handle exhaustion...", (uint8_t *)&v1, 0xCu);
}

@end
