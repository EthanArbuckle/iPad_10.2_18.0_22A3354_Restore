@implementation PLUTIAndSizeFromCSSearchableItemIdentifier

void __PLUTIAndSizeFromCSSearchableItemIdentifier_block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  char isKindOfClass;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  __CFString *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  __CFString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "firstObject");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject firstObject](v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
    }
    else
    {
      PLSyndicationGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)a1[4];
        v12 = (__CFString *)a1[5];
        *(_DWORD *)buf = 138543618;
        v43 = v11;
        v44 = 2114;
        v45 = v12;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Unable to obtain size for CSSearchableItem %{public}@ bundleID %{public}@", buf, 0x16u);
      }

      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D74498];
      v40 = *MEMORY[0x1E0CB2938];
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = a1[4];
      v17 = a1[5];
      if (v5)
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = CFSTR("(null)");
      }
      objc_msgSend(v15, "stringWithFormat:", CFSTR("Unable to obtain logical size for CSSearchableItem %@ bundleID %@ : %@"), v16, v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 49503, v21);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      v6 = 0;
      v9 = 0;
      if (v8)
        goto LABEL_30;
    }
    if (-[NSObject count](v4, "count"))
    {
      -[NSObject objectAtIndex:](v4, "objectAtIndex:", 1);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    PLSyndicationGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if ((isKindOfClass & 1) != 0)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v26 = (void *)a1[4];
        *(_DWORD *)buf = 138543618;
        v43 = v26;
        v44 = 2114;
        v45 = v22;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_INFO, "UTI for item %{public}@ is %{public}@", buf, 0x16u);
      }

      v9 = v22;
      v8 = 0;
    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v27 = (void *)a1[4];
        if (v22)
        {
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v29 = CFSTR("(null)");
        }
        *(_DWORD *)buf = 138543618;
        v43 = v27;
        v44 = 2114;
        v45 = v29;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Unexpected data type for UTI for item %{public}@ : %{public}@", buf, 0x16u);
        if (v22)

      }
      v37 = (void *)MEMORY[0x1E0CB35C8];
      v30 = *MEMORY[0x1E0D74498];
      v38 = *MEMORY[0x1E0CB2938];
      v31 = (void *)MEMORY[0x1E0CB3940];
      v32 = a1[4];
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("Unexpected data type for UTI for item %@ : %@"), v32, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", v30, 49501, v36);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = 0;
    }

LABEL_30:
    goto LABEL_31;
  }
  PLSyndicationGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = (__CFString *)a1[4];
    *(_DWORD *)buf = 138412546;
    v43 = v3;
    v44 = 2114;
    v45 = v7;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "CSSearchableIndex attributes fetch returned an unexpected value (%@) for syndication identifier: %{public}@", buf, 0x16u);
  }
  v8 = 0;
  v6 = 0;
  v9 = 0;
LABEL_31:

  (*(void (**)(void))(a1[6] + 16))();
}

@end
