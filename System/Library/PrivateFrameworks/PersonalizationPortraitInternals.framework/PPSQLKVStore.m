@implementation PPSQLKVStore

uint64_t __43__PPSQLKVStore_loadBlobForKey_transaction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":key", *(_QWORD *)(a1 + 32));
}

+ (id)numberForKey:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "loadBlobForKey:transaction:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3710];
    v10 = (void *)MEMORY[0x1C3BD6630]();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_autoreleasePoolPop(v10);
    v17 = 0;
    objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v11, v8, &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v17;

    if (v12)
    {
      v14 = v12;
    }
    else
    {
      pp_default_log_handle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v13;
        _os_log_error_impl(&dword_1C392E000, v15, OS_LOG_TYPE_ERROR, "PPSQLDatabase: unable to unarchive number: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)loadBlobForKey:(id)a3 transaction:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9082;
  v19 = __Block_byref_object_dispose__9083;
  v20 = 0;
  objc_msgSend(v6, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43__PPSQLKVStore_loadBlobForKey_transaction___block_invoke;
  v13[3] = &unk_1E7E1F040;
  v9 = v5;
  v14 = v9;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __43__PPSQLKVStore_loadBlobForKey_transaction___block_invoke_2;
  v12[3] = &unk_1E7E1BB80;
  v12[4] = &v15;
  objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT value FROM kv_blobs WHERE key = :key"), v13, v12, 0);

  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

+ (void)storeBlob:(id)a3 forKey:(id)a4 transaction:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  objc_msgSend(a5, "db");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__PPSQLKVStore_storeBlob_forKey_transaction___block_invoke;
  v12[3] = &unk_1E7E189A0;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR REPLACE INTO kv_blobs (key, value) VALUES (:key, :value)"), v12, 0, 0);

}

+ (void)removeBlobForKey:(id)a3 transaction:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  objc_msgSend(a4, "db");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__PPSQLKVStore_removeBlobForKey_transaction___block_invoke;
  v8[3] = &unk_1E7E1F040;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM kv_blobs WHERE key = :key"), v8, 0, 0);

}

+ (void)setNumber:(id)a3 forKey:(id)a4 transaction:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v12;
  if (v9)
  {
    +[PPSQLKVStore storeBlob:forKey:transaction:](PPSQLKVStore, "storeBlob:forKey:transaction:", v9, v7, v8);
  }
  else
  {
    pp_default_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_error_impl(&dword_1C392E000, v11, OS_LOG_TYPE_ERROR, "PPSQLDatabase: unable to archive number: %@", buf, 0xCu);
    }

  }
}

+ (void)setString:(id)a3 forKey:(id)a4 transaction:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v12;
  if (v9)
  {
    +[PPSQLKVStore storeBlob:forKey:transaction:](PPSQLKVStore, "storeBlob:forKey:transaction:", v9, v7, v8);
  }
  else
  {
    pp_default_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_error_impl(&dword_1C392E000, v11, OS_LOG_TYPE_ERROR, "PPSQLDatabase: unable to archive string: %@", buf, 0xCu);
    }

  }
}

+ (id)stringForKey:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "loadBlobForKey:transaction:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3710];
    v10 = (void *)MEMORY[0x1C3BD6630]();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_autoreleasePoolPop(v10);
    v17 = 0;
    objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v11, v8, &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v17;

    if (v12)
    {
      v14 = v12;
    }
    else
    {
      pp_default_log_handle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v13;
        _os_log_error_impl(&dword_1C392E000, v15, OS_LOG_TYPE_ERROR, "PPSQLDatabase: unable to unarchive string: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __45__PPSQLKVStore_removeBlobForKey_transaction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":key", *(_QWORD *)(a1 + 32));
}

void __45__PPSQLKVStore_storeBlob_forKey_transaction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":key", v3);
  objc_msgSend(v4, "bindNamedParam:toNSData:", ":value", *(_QWORD *)(a1 + 40));

}

uint64_t __43__PPSQLKVStore_loadBlobForKey_transaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "getNSDataForColumn:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81788];
}

@end
