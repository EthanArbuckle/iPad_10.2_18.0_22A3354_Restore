@implementation TRIFetchDateManager

- (TRIFetchDateManager)initWithKeyValueStore:(id)a3
{
  id v5;
  TRIFetchDateManager *v6;
  TRIFetchDateManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFetchDateManager;
  v6 = -[TRIFetchDateManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_keyValueStore, a3);

  return v7;
}

+ (id)kvstoreKeyForType:(unsigned __int8)a3 container:(int)a4 teamId:(id)a5
{
  uint64_t v5;
  int v6;
  id v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;

  v5 = *(_QWORD *)&a4;
  v6 = a3;
  v9 = a5;
  v10 = v9;
  if ((_DWORD)v5 != 2 || v9)
  {
    if (v6)
      goto LABEL_4;
LABEL_7:
    v11 = (id *)MEMORY[0x1E0DC0BD8];
LABEL_8:
    v13 = *v11;
    if (v13)
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIFetchDateManager.m"), 39, CFSTR("teamId required for 3P date lookup"));

  if (!v6)
    goto LABEL_7;
LABEL_4:
  if (v6 == 1)
  {
    v11 = (id *)MEMORY[0x1E0DC0BE0];
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIFetchDateManager.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("baseKey"));

  v13 = 0;
LABEL_10:
  if ((_DWORD)v5 == 1)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%d.%@"), v13, v5, v10);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  return v16;
}

+ (id)managerWithKeyValueStore:(id)a3
{
  id v3;
  TRIFetchDateManager *v4;

  v3 = a3;
  v4 = -[TRIFetchDateManager initWithKeyValueStore:]([TRIFetchDateManager alloc], "initWithKeyValueStore:", v3);

  return v4;
}

- (id)lastFetchDateWithType:(unsigned __int8)a3 container:(int)a4 teamId:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  objc_class *v9;
  id v10;
  void *v11;
  TRIKVStore *keyValueStore;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v26;
  uint8_t buf[8];
  id v28;

  v5 = *(_QWORD *)&a4;
  v6 = a3;
  v9 = (objc_class *)MEMORY[0x1E0C99D68];
  v10 = a5;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithTimeIntervalSince1970:", 1581321600.0);
  keyValueStore = self->_keyValueStore;
  +[TRIFetchDateManager kvstoreKeyForType:container:teamId:](TRIFetchDateManager, "kvstoreKeyForType:container:teamId:", v6, v5, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRIKVStore blobForKey:usingTransaction:](keyValueStore, "blobForKey:usingTransaction:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v28 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v14, &v28);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v28;
    if (v15)
      goto LABEL_14;
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC0B90], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "populationType");

  if (v18 == 3)
  {
    v15 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Aug  3 2024");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchDateManager.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("compilationDateString"));

    }
    v20 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v20, "setDateFormat:", CFSTR("MMM d yyyy"));
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
    objc_msgSend(v20, "setLocale:", v21);

    objc_msgSend(v20, "dateFromString:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (!v22)
    {
      TRILogCategory_Server();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D207F000, v24, OS_LOG_TYPE_ERROR, "unable to parse compilation date, lastDateFetch is nil", buf, 2u);
      }

      v23 = v11;
    }
    v15 = v23;

  }
LABEL_14:

  return v15;
}

- (void)setLastFetchDate:(id)a3 type:(unsigned __int8)a4 container:(int)a5 teamId:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  id v11;
  void *v12;
  id v13;
  TRIKVStore *keyValueStore;
  void *v15;
  void *v16;
  id v17;

  v6 = *(_QWORD *)&a5;
  v7 = a4;
  v11 = a6;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v17;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchDateManager.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  keyValueStore = self->_keyValueStore;
  +[TRIFetchDateManager kvstoreKeyForType:container:teamId:](TRIFetchDateManager, "kvstoreKeyForType:container:teamId:", v7, v6, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIKVStore setBlob:forKey:usingTransaction:](keyValueStore, "setBlob:forKey:usingTransaction:", v12, v15, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueStore, 0);
}

@end
