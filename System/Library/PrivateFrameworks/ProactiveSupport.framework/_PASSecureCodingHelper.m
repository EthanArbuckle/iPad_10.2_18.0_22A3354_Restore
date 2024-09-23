@implementation _PASSecureCodingHelper

+ (id)robustDecodeObjectOfClass:(Class)a3 forKey:(id)a4 withCoder:(id)a5 expectNonNull:(BOOL)a6 errorDomain:(id)a7 errorCode:(int64_t)a8 logHandle:(id)a9
{
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  v11 = a6;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a9;
  v19 = (void *)MEMORY[0x1A1AFDC98]();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", a3, 0);
  objc_autoreleasePoolPop(v19);
  objc_msgSend(a1, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v20, v15, v16, v11, v17, a8, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)robustDecodeObjectOfClasses:(id)a3 forKey:(id)a4 withCoder:(id)a5 expectNonNull:(BOOL)a6 errorDomain:(id)a7 errorCode:(int64_t)a8 logHandle:(id)a9
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void **v38;
  uint64_t *v39;
  void *v40;
  void *v41;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  int64_t v47;
  void *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v11 = a6;
  v65 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a9;
  v19 = (void *)MEMORY[0x1A1AFDC98]();
  if (!v18)
  {
    v18 = MEMORY[0x1E0C81028];
    v20 = MEMORY[0x1E0C81028];
  }
  objc_msgSend(v16, "decodeObjectOfClasses:forKey:", v14, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v47 = a8;
    v48 = v19;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v22 = v14;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v51;
      while (2)
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v51 != v25)
            objc_enumerationMutation(v22);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v31 = v21;

            goto LABEL_16;
          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        if (v24)
          continue;
        break;
      }
    }

    v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v54 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key \"%@\" maps to unexpected class"), v15);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v27, "initWithDomain:code:userInfo:", v17, v47, v29);
    objc_msgSend(v16, "failWithError:", v30);

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v43 = v18;
      objc_msgSend(v16, "error");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v62 = v15;
      v63 = 2112;
      v64 = v44;
      _os_log_error_impl(&dword_1A0957000, v43, OS_LOG_TYPE_ERROR, "error decoding for key %@ - %@", buf, 0x16u);

    }
    v31 = 0;
LABEL_16:
    v19 = v48;
  }
  else
  {
    objc_msgSend(v16, "error");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v33 = v18;
        objc_msgSend(v16, "error");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v62 = v15;
        v63 = 2112;
        v64 = v34;
        _os_log_error_impl(&dword_1A0957000, v33, OS_LOG_TYPE_ERROR, "error decoding for key %@ - %@", buf, 0x16u);

      }
    }
    else if (v11)
    {
      v35 = objc_msgSend(v16, "containsValueForKey:", v15);
      v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
      if (v35)
      {
        v59 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("archive contains illegal nil value for key \"%@\"), v15);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v36;
        v37 = (void *)MEMORY[0x1E0C99D80];
        v38 = &v60;
        v39 = &v59;
      }
      else
      {
        v57 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key \"%@\" not present"), v15);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v36;
        v37 = (void *)MEMORY[0x1E0C99D80];
        v38 = &v58;
        v39 = &v57;
      }
      objc_msgSend(v37, "dictionaryWithObjects:forKeys:count:", v38, v39, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend(v49, "initWithDomain:code:userInfo:", v17, a8, v40);

      objc_msgSend(v16, "failWithError:", v41);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v45 = v18;
        objc_msgSend(v16, "error");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v62 = v15;
        v63 = 2112;
        v64 = v46;
        _os_log_error_impl(&dword_1A0957000, v45, OS_LOG_TYPE_ERROR, "error decoding for key %@ - %@", buf, 0x16u);

      }
    }
    v31 = 0;
  }

  objc_autoreleasePoolPop(v19);
  return v31;
}

@end
