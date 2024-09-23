@implementation PADatabaseManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_6);
  return (id)sharedManager_Manager;
}

void __34__PADatabaseManager_sharedManager__block_invoke()
{
  PADatabaseManager *v0;
  void *v1;

  v0 = objc_alloc_init(PADatabaseManager);
  v1 = (void *)sharedManager_Manager;
  sharedManager_Manager = (uint64_t)v0;

}

- (id)managedObjectModelName
{
  return CFSTR("PersonalAudioSettings");
}

- (id)cloudKitContainer
{
  return CFSTR("com.apple.personalaudio");
}

- (id)containerIdentifier
{
  return CFSTR("com.apple.accessibility.PersonalAudioTunings");
}

- (void)logMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PA DB message %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PADatabaseManager logMessage:]", 44, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v5);
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    v10 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1DE3BE000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (void)contentDidUpdate:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PADatabaseManager;
  -[HCDatabaseManager contentDidUpdate:](&v8, sel_contentDidUpdate_, a3);
  +[PASettings sharedInstance](PASettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personalMediaConfiguration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
  }
  else
  {
    -[PADatabaseManager currentConfiguration](self, "currentConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      return;
    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PADatabaseManager currentConfiguration](self, "currentConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPersonalMediaConfiguration:", v6);
  }

}

- (BOOL)saveConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  -[HCDatabaseManager setupDatabase](self, "setupDatabase");
  -[HCDatabaseManager managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = __Block_byref_object_copy_;
    v14[4] = __Block_byref_object_dispose_;
    v15 = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v6, "encodeObject:forKey:", v4, *MEMORY[0x1E0CB2CD0]);
    objc_msgSend(v6, "finishEncoding");
    objc_msgSend(v6, "encodedData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      -[HCDatabaseManager managedObjectContext](self, "managedObjectContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __39__PADatabaseManager_saveConfiguration___block_invoke;
      v11[3] = &unk_1EA902918;
      v11[4] = self;
      v13 = v14;
      v12 = v7;
      objc_msgSend(v8, "performBlockAndWait:", v11);

      v9 = -[HCDatabaseManager saveIfPossible](self, "saveIfPossible");
    }
    else
    {
      v9 = 0;
    }

    _Block_object_dispose(v14, 8);
  }
  else
  {
    -[PADatabaseManager logMessage:](self, "logMessage:", CFSTR("No context"));
    v9 = 0;
  }

  return v9;
}

void __39__PADatabaseManager_saveConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  id obj;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("PersonalAudioSettings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);

  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = (void *)MEMORY[0x1E0C97B20];
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("PersonalAudioSettings"), v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  objc_msgSend(v6, "setVersion:", &unk_1EA9060B0);
  objc_msgSend(v6, "setAudioSettings:", *(_QWORD *)(a1 + 40));
  PAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Updated config. Saving"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PADatabaseManager saveConfiguration:]_block_invoke", 97, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_retainAutorelease(v11);
    v14 = v12;
    v15 = objc_msgSend(v13, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v18 = v15;
    _os_log_impl(&dword_1DE3BE000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (id)currentConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  id obj;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  v3 = (void *)MEMORY[0x1DF0EBB6C](self, a2);
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("PersonalAudioSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  -[HCDatabaseManager managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __41__PADatabaseManager_currentConfiguration__block_invoke;
  v19[3] = &unk_1EA902940;
  v21 = &v23;
  v19[4] = self;
  v6 = v4;
  v20 = v6;
  v22 = &v29;
  objc_msgSend(v5, "performBlockAndWait:", v19);

  if (v30[5])
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend((id)v24[5], "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "audioSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9
      && (objc_msgSend(v8, "version"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isEqualToNumber:", &unk_1EA9060B0),
          v10,
          v9,
          v11))
    {
      v12 = objc_alloc(MEMORY[0x1E0CB3710]);
      objc_msgSend(v8, "audioSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id *)(v30 + 5);
      obj = (id)v30[5];
      v15 = (void *)objc_msgSend(v12, "initForReadingFromData:error:", v13, &obj);
      objc_storeStrong(v14, obj);

      if (v30[5])
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "decodeObjectOfClasses:forKey:", v16, *MEMORY[0x1E0CB2CD0]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v7 = 0;
    }

  }
  _Block_object_dispose(&v23, 8);

  objc_autoreleasePoolPop(v3);
  _Block_object_dispose(&v29, 8);

  return v7;
}

void __41__PADatabaseManager_currentConfiguration__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

@end
