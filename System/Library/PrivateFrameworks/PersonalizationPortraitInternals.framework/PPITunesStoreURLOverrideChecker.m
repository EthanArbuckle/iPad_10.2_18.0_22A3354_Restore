@implementation PPITunesStoreURLOverrideChecker

- (PPITunesStoreURLOverrideChecker)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PPITunesStoreURLOverrideChecker *v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MobileCoreServices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("iTunesStoreURLPatterns"), CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(&unk_1E7E5B2F0, "arrayByAddingObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v6 = &unk_1E7E5B2F0;
  }
  v7 = -[PPITunesStoreURLOverrideChecker initWithPlistPaths:isAppAvailableToOpenURLBlock:](self, "initWithPlistPaths:isAppAvailableToOpenURLBlock:", v6, &__block_literal_global_10346);

  return v7;
}

- (PPITunesStoreURLOverrideChecker)initWithPropertyList:(id)a3 isAppAvailableToOpenURLBlock:(id)a4
{
  id v7;
  id v8;
  PPITunesStoreURLOverrideChecker *v9;
  PPITunesStoreURLOverrideChecker *v10;
  uint64_t v11;
  id isAppAvailableToOpenURLBlock;
  uint64_t v13;
  NSMutableDictionary *compiledPatterns;
  uint64_t v15;
  NSMutableSet *supportedSchemes;
  uint64_t v17;
  NSMutableSet *failedSchemes;
  uint64_t v19;
  NSMutableSet *failedHosts;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PPITunesStoreURLOverrideChecker;
  v9 = -[PPITunesStoreURLOverrideChecker init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_propertyList, a3);
    v11 = objc_msgSend(v8, "copy");
    isAppAvailableToOpenURLBlock = v10->_isAppAvailableToOpenURLBlock;
    v10->_isAppAvailableToOpenURLBlock = (id)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 16);
    compiledPatterns = v10->_compiledPatterns;
    v10->_compiledPatterns = (NSMutableDictionary *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 4);
    supportedSchemes = v10->_supportedSchemes;
    v10->_supportedSchemes = (NSMutableSet *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 4);
    failedSchemes = v10->_failedSchemes;
    v10->_failedSchemes = (NSMutableSet *)v17;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 64);
    failedHosts = v10->_failedHosts;
    v10->_failedHosts = (NSMutableSet *)v19;

  }
  return v10;
}

- (PPITunesStoreURLOverrideChecker)initWithPlistPaths:(id)a3 isAppAvailableToOpenURLBlock:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  PPITunesStoreURLOverrideChecker *v23;
  id v25;
  uint64_t v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25 = a4;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    v9 = 0x1E0D81000uLL;
LABEL_3:
    v10 = 0;
    v27 = v7;
    while (1)
    {
      if (*(_QWORD *)v31 != v8)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
      v12 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(v11, "stringByExpandingTildeInPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(v9 + 1496);
      v29 = 0;
      objc_msgSend(v14, "dictionaryWithPath:error:", v13, &v29);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v29;
      if (!v15)
      {
        v17 = v8;
        v18 = v9;
        v19 = (void *)MEMORY[0x1C3BD6630]();
        pp_default_log_handle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v35 = v16;
          v36 = 2112;
          v37 = v13;
          _os_log_error_impl(&dword_1C392E000, v20, OS_LOG_TYPE_ERROR, "got error %@ while creating lazy plist context for path %@", buf, 0x16u);
        }

        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v13);
        if (!v15)
        {
          v21 = (void *)MEMORY[0x1C3BD6630]();
          pp_default_log_handle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v13;
            _os_log_error_impl(&dword_1C392E000, v22, OS_LOG_TYPE_ERROR, "failed to load plist at path %@ using Foundation fallback", buf, 0xCu);
          }

          objc_autoreleasePoolPop(v21);
        }
        objc_autoreleasePoolPop(v19);
        v9 = v18;
        v8 = v17;
        v7 = v27;
      }

      objc_autoreleasePoolPop(v12);
      if (v15)
        break;
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:
    v15 = (void *)MEMORY[0x1E0C9AA70];
  }

  v23 = -[PPITunesStoreURLOverrideChecker initWithPropertyList:isAppAvailableToOpenURLBlock:](self, "initWithPropertyList:isAppAvailableToOpenURLBlock:", v15, v25);
  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedHosts, 0);
  objc_storeStrong((id *)&self->_failedSchemes, 0);
  objc_storeStrong((id *)&self->_supportedSchemes, 0);
  objc_storeStrong((id *)&self->_compiledPatterns, 0);
  objc_storeStrong((id *)&self->_propertyList, 0);
  objc_storeStrong(&self->_isAppAvailableToOpenURLBlock, 0);
}

- (id)overrideForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSMutableSet *failedHosts;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  id v19;
  uint64_t location;
  NSUInteger v21;
  NSUInteger length;
  NSUInteger v23;
  NSUInteger v24;
  NSRange v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  BOOL v32;
  __CFString *v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  unint64_t v37;
  NSObject *v38;
  int v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  uint64_t (**isAppAvailableToOpenURLBlock)(id, void *);
  void *v57;
  void *v58;
  PPITunesStoreURLOverrideChecker *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  char v66;
  unint64_t v67;
  void *v68;
  id v69;
  uint64_t v70;
  void *context;
  void *v72;
  __CFString *v73;
  char v74;
  void *v75;
  void *v76;
  __CFString *v77;
  void *v78;
  __CFString *v79;
  PPITunesStoreURLOverrideChecker *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  uint8_t buf[4];
  NSObject *v86;
  uint64_t v87;
  NSRange v88;
  NSRange v89;
  NSRange v90;

  v87 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v4, 1);
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_opt_new();
  v8 = v7;

  failedHosts = self->_failedHosts;
  objc_msgSend(v8, "host");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(failedHosts) = -[NSMutableSet containsObject:](failedHosts, "containsObject:", v10);

  if ((failedHosts & 1) == 0)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_propertyList, "objectForKeyedSubscript:", CFSTR("p2-url-resolution"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_106;
    context = (void *)MEMORY[0x1C3BD6630]();
    v78 = (void *)objc_opt_new();
    v83 = (void *)objc_opt_new();
    v75 = (void *)objc_opt_new();
    v76 = (void *)objc_opt_new();
    objc_msgSend(v8, "scheme");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (__CFString *)v13;
    else
      v15 = &stru_1E7E221D0;
    v77 = v15;

    objc_msgSend(v8, "host");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = (__CFString *)v16;
    else
      v18 = &stru_1E7E221D0;
    v79 = v18;

    v19 = v8;
    location = objc_msgSend(v19, "rangeOfPath");
    length = v21;
    v72 = v8;
    v81 = v12;
    if (location == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v60 = self;
      v61 = v19;
      v62 = v4;
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v89.location = 0x7FFFFFFFFFFFFFFFLL;
      v89.length = length;
      NSStringFromRange(v89);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", sel__pathAndQueryForURLComponents_, v60, CFSTR("PPITunesStoreURLOverrideChecker.m"), 122, CFSTR("-[NSURLComponents pathRange] should never return an NSNotFound range, but got %@"), v64);

      v4 = v62;
      v19 = v61;
      self = v60;
      v12 = v81;
    }
    v23 = objc_msgSend(v19, "rangeOfQuery");
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v90.location = v23;
      v90.length = v24;
      v88.location = location;
      v88.length = length;
      v25 = NSUnionRange(v88, v90);
      location = v25.location;
      length = v25.length;
    }
    objc_msgSend(v19, "string");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "substringWithRange:", location, length);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v27)
      v28 = v27;
    else
      v28 = &stru_1E7E221D0;
    v73 = v28;

    v29 = objc_msgSend(v12, "count");
    if (v29)
    {
      v30 = v29;
      v68 = v19;
      v80 = self;
      v31 = 0;
      v32 = 1;
      v74 = 1;
      v33 = v77;
      while (1)
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", v31);
        v34 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          pp_default_log_handle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v86 = v34;
            _os_log_fault_impl(&dword_1C392E000, v35, OS_LOG_TYPE_FAULT, "expected NSDictionary, got %@", buf, 0xCu);
          }
          goto LABEL_32;
        }
        -[NSObject objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", CFSTR("scheme-mapping"));
        v35 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v37 = v30;
          pp_default_log_handle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v86 = v35;
            _os_log_fault_impl(&dword_1C392E000, v38, OS_LOG_TYPE_FAULT, "expected NSDictionary, got %@", buf, 0xCu);
          }

          v30 = v37;
LABEL_32:

          goto LABEL_95;
        }
        -[NSObject objectForKeyedSubscript:](v35, "objectForKeyedSubscript:", v33);
        v36 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v84 = (void *)v36;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v36)
          {
            pp_default_log_handle();
            v82 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v86 = v36;
              _os_log_fault_impl(&dword_1C392E000, v82, OS_LOG_TYPE_FAULT, "expected NSString, got %@", buf, 0xCu);
            }
LABEL_36:
            v39 = 4;
            goto LABEL_93;
          }
LABEL_37:
          v39 = 4;
          goto LABEL_94;
        }
        if ((-[NSMutableSet containsObject:](v80->_failedSchemes, "containsObject:", v36) & 1) != 0)
        {
          v74 = 0;
          goto LABEL_37;
        }
        -[NSObject objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", CFSTR("host-patterns"));
        v40 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v82 = v40;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          pp_default_log_handle();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v86 = v40;
            _os_log_fault_impl(&dword_1C392E000, v47, OS_LOG_TYPE_FAULT, "expected NSArray, got %@", buf, 0xCu);
          }
          v39 = 4;
          goto LABEL_92;
        }
        v41 = -[NSObject count](v40, "count");
        if (!v41)
          goto LABEL_36;
        v42 = v41;
        v67 = v30;
        v43 = 0;
        v69 = v4;
        while (1)
        {
          -[NSObject objectAtIndexedSubscript:](v40, "objectAtIndexedSubscript:", v43);
          v44 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            pp_default_log_handle();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v86 = v44;
              _os_log_fault_impl(&dword_1C392E000, v45, OS_LOG_TYPE_FAULT, "expected NSString, got %@", buf, 0xCu);
            }
            goto LABEL_54;
          }
          if (!-[NSObject length](v44, "length"))
            goto LABEL_60;
          if ((objc_msgSend(v83, "containsObject:", v44) & 1) == 0)
            break;
LABEL_55:

          if (v42 == ++v43)
          {
            v39 = 4;
            v33 = v77;
            v30 = v67;
            goto LABEL_93;
          }
        }
        if ((objc_msgSend(v78, "containsObject:", v44) & 1) != 0)
          goto LABEL_60;
        -[PPITunesStoreURLOverrideChecker _compiledPattern:]((uint64_t)v80, v44);
        v45 = objc_claimAutoreleasedReturnValue();
        if (!v45)
        {
          pp_default_log_handle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v86 = v44;
            _os_log_fault_impl(&dword_1C392E000, v46, OS_LOG_TYPE_FAULT, "failed to compile pattern: %@", buf, 0xCu);
          }

          v4 = v69;
LABEL_53:
          objc_msgSend(v83, "addObject:", v44);
LABEL_54:

          v12 = v81;
          goto LABEL_55;
        }
        v40 = v82;
        if (-[NSObject rangeOfFirstMatchInString:options:range:](v45, "rangeOfFirstMatchInString:options:range:", v79, 0, 0, -[__CFString length](v79, "length")) == 0x7FFFFFFFFFFFFFFFLL)goto LABEL_53;
        objc_msgSend(v78, "addObject:", v44);

        v74 = 0;
        v12 = v81;
LABEL_60:

        -[NSObject objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", CFSTR("path-patterns"));
        v48 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v33 = v77;
        v47 = v48;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          pp_default_log_handle();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v86 = v48;
            _os_log_fault_impl(&dword_1C392E000, v54, OS_LOG_TYPE_FAULT, "expected NSArray, got %@", buf, 0xCu);
          }
          v39 = 4;
          goto LABEL_83;
        }
        v65 = -[NSObject count](v48, "count");
        if (!v65)
        {
          v39 = 4;
          goto LABEL_91;
        }
        v49 = 0;
        v66 = 0;
        v50 = v65;
        while (2)
        {
          -[NSObject objectAtIndexedSubscript:](v48, "objectAtIndexedSubscript:", v49);
          v51 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            pp_default_log_handle();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v86 = v51;
              _os_log_fault_impl(&dword_1C392E000, v52, OS_LOG_TYPE_FAULT, "expected NSString, got %@", buf, 0xCu);
            }
            goto LABEL_70;
          }
          if (!-[NSObject length](v51, "length"))
            goto LABEL_67;
          if ((objc_msgSend(v76, "containsObject:", v51) & 1) == 0)
          {
            if ((objc_msgSend(v75, "containsObject:", v51) & 1) != 0)
            {
LABEL_67:
              v66 = 1;
              goto LABEL_71;
            }
            -[PPITunesStoreURLOverrideChecker _compiledPattern:]((uint64_t)v80, v51);
            v52 = objc_claimAutoreleasedReturnValue();
            if (v52)
            {
              v50 = v65;
              if (-[NSObject rangeOfFirstMatchInString:options:range:](v52, "rangeOfFirstMatchInString:options:range:", v73, 0, 0, -[__CFString length](v73, "length")) != 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v75, "addObject:", v51);
                v66 = 1;
                goto LABEL_70;
              }
            }
            else
            {
              pp_default_log_handle();
              v53 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v86 = v51;
                _os_log_fault_impl(&dword_1C392E000, v53, OS_LOG_TYPE_FAULT, "failed to compile pattern: %@", buf, 0xCu);
              }

              v4 = v69;
            }
            objc_msgSend(v76, "addObject:", v51);
LABEL_70:

            v33 = v77;
          }
LABEL_71:

          ++v49;
          v48 = v47;
          if (v50 != v49)
            continue;
          break;
        }
        if ((v66 & 1) != 0)
        {
          v55 = v84;
          if ((-[NSMutableSet containsObject:](v80->_supportedSchemes, "containsObject:", v84) & 1) != 0)
            goto LABEL_88;
          v54 = objc_opt_new();
          -[NSObject setScheme:](v54, "setScheme:", v84);
          isAppAvailableToOpenURLBlock = (uint64_t (**)(id, void *))v80->_isAppAvailableToOpenURLBlock;
          -[NSObject URL](v54, "URL");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(isAppAvailableToOpenURLBlock) = isAppAvailableToOpenURLBlock[2](isAppAvailableToOpenURLBlock, v57);

          if ((_DWORD)isAppAvailableToOpenURLBlock)
          {
            v55 = v84;
            -[NSMutableSet addObject:](v80->_supportedSchemes, "addObject:", v84);

            v33 = v77;
LABEL_88:
            v54 = objc_msgSend(v68, "copy");
            v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v55);
            -[NSObject setScheme:](v54, "setScheme:", v58);

            -[NSObject URL](v54, "URL");
            v70 = objc_claimAutoreleasedReturnValue();
            v39 = 1;
            v12 = v81;
          }
          else
          {
            -[NSMutableSet addObject:](v80->_failedSchemes, "addObject:", v84);
            v39 = 4;
            v12 = v81;
            v33 = v77;
          }
LABEL_83:

        }
        else
        {
          v39 = 4;
          v12 = v81;
        }
LABEL_91:
        v30 = v67;
LABEL_92:

LABEL_93:
LABEL_94:

        if (v39 != 4)
          goto LABEL_105;
LABEL_95:
        v32 = ++v31 < v30;
        if (v31 == v30)
        {
          if ((v74 & 1) != 0)
          {
            self = v80;
            goto LABEL_101;
          }
          goto LABEL_104;
        }
      }
    }
    v33 = v77;
LABEL_101:
    if ((unint64_t)-[NSMutableSet count](self->_failedHosts, "count") >= 0x40)
      -[NSMutableSet removeAllObjects](self->_failedHosts, "removeAllObjects");
    -[NSMutableSet addObject:](self->_failedHosts, "addObject:", v79);
LABEL_104:
    v32 = 0;
LABEL_105:

    objc_autoreleasePoolPop(context);
    v8 = v72;
    v11 = (void *)v70;
    if (!v32)
LABEL_106:
      v11 = 0;

    goto LABEL_108;
  }
  v11 = 0;
LABEL_108:

  return v11;
}

- (id)_compiledPattern:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v8 = 0;
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v3, 1, &v8);
      v5 = v8;
      if (v4)
      {
        if ((unint64_t)objc_msgSend(*(id *)(a1 + 24), "count") >= 0x10)
          objc_msgSend(*(id *)(a1 + 24), "removeAllObjects");
        objc_msgSend(*(id *)(a1 + 24), "setObject:forKeyedSubscript:", v4, v3);
      }
      else
      {
        pp_default_log_handle();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          v10 = v3;
          v11 = 2112;
          v12 = v5;
          _os_log_fault_impl(&dword_1C392E000, v6, OS_LOG_TYPE_FAULT, "failed to compile pattern %@: %@", buf, 0x16u);
        }

        v4 = 0;
      }

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __39__PPITunesStoreURLOverrideChecker_init__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0CA5878];
  v3 = a2;
  objc_msgSend(v2, "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isApplicationAvailableToOpenURL:error:", v3, 0);

  return v5;
}

@end
