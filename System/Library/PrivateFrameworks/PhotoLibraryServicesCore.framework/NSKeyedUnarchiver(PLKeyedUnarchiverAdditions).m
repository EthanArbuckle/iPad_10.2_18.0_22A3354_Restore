@implementation NSKeyedUnarchiver(PLKeyedUnarchiverAdditions)

- (id)pl_safeInitForReadingFromData:()PLKeyedUnarchiverAdditions
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v3 = (void *)objc_msgSend(a1, "initForReadingFromData:error:", a3, &v8);
  v4 = v8;
  v5 = v3;
  if (!v5)
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_ERROR, "Data was corrupt; forcing -[NSKeyedUnarchiver initForReadingFromData:error:] to return nil, error: %@",
        buf,
        0xCu);
    }

  }
  return v5;
}

+ (id)pl_safeUnarchiveObjectFromData:()PLKeyedUnarchiverAdditions class:
{
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:", a4, a3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (!v4)
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_ERROR, "Data was corrupt; forcing +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:] to return nil, error: %@",
        buf,
        0xCu);
    }

  }
  return v4;
}

+ (id)pl_safeUnarchiveObjectFromData:()PLKeyedUnarchiverAdditions classes:
{
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:", a4, a3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (!v4)
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_ERROR, "Data was corrupt; forcing +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:] to return nil, error: %@",
        buf,
        0xCu);
    }

  }
  return v4;
}

+ (id)pl_safeUnarchiveObjectFromFile:()PLKeyedUnarchiverAdditions class:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:", a4, v7, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;

  if (!v8)
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_ERROR, "Data at path %@ was corrupt; forcing +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:] to return nil, error: %@",
        buf,
        0x16u);
    }

  }
  return v8;
}

+ (id)pl_safeUnarchiveObjectFromFile:()PLKeyedUnarchiverAdditions classes:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99D50];
  v8 = a4;
  objc_msgSend(v7, "dataWithContentsOfFile:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:", v8, v9, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v14;
  if (!v10)
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_199DF7000, v12, OS_LOG_TYPE_ERROR, "Data at path %@ was corrupt; forcing +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:] to return nil, error: %@",
        buf,
        0x16u);
    }

  }
  return v10;
}

@end
