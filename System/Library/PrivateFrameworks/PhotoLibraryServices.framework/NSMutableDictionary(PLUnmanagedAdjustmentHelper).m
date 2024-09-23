@implementation NSMutableDictionary(PLUnmanagedAdjustmentHelper)

- (void)pl_applyOrientation:()PLUnmanagedAdjustmentHelper toNormalizedPointWithXKey:yKey:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(a1, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKeyedSubscript:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9 && v10)
  {
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(v11, "doubleValue");
    PLOrientationTransformImagePoint();
    v13 = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v14, v7);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v15, v8);

  }
  else
  {
    PLMigrationGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412546;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Could not find matching x and y keys: %@, %@", (uint8_t *)&v17, 0x16u);
    }

  }
}

- (void)pl_enforceCorrectValuesForMinKey:()PLUnmanagedAdjustmentHelper maxKey:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKeyedSubscript:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8 && v9)
  {
    objc_msgSend(v8, "doubleValue");
    v12 = v11;
    objc_msgSend(v10, "doubleValue");
    if (v13 < v12)
    {
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v10, v6);
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v8, v7);
    }
  }
  else
  {
    PLMigrationGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Could not find matching min and max keys: %@, %@", (uint8_t *)&v15, 0x16u);
    }

  }
}

@end
