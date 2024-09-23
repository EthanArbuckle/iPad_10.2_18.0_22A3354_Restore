@implementation PXFileNameUniquifier

- (PXFileNameUniquifier)initWithExistingFileSources:(id)a3
{
  id v5;
  PXFileNameUniquifier *v6;
  uint64_t v7;
  NSArray *existingFileSources;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFileNameUniquifier.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sources.count"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXFileNameUniquifier;
  v6 = -[PXFileNameUniquifier init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    existingFileSources = v6->_existingFileSources;
    v6->_existingFileSources = (NSArray *)v7;

  }
  return v6;
}

- (id)uniqueFileSystemName:(id)a3 inDirectory:(id)a4
{
  return -[PXFileNameUniquifier _uniqueFileSystemName:inDirectory:rememberResult:](self, "_uniqueFileSystemName:inDirectory:rememberResult:", a3, a4, 1);
}

- (id)_uniqueFileSystemName:(id)a3 inDirectory:(id)a4 rememberResult:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  _BOOL4 v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  unint64_t v49;
  unint64_t v50;
  _BOOL4 v51;
  void *context;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  PXFileNameUniquifier *v58;
  uint8_t buf[4];
  unint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  unint64_t v64;
  uint64_t v65;

  v5 = a5;
  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8 || !v9)
    goto LABEL_25;
  v11 = MEMORY[0x1A85CE17C]();
  objc_msgSend(v8, "pathExtension");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v55, "length");
  v13 = v8;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", CFSTR("1"));
  objc_msgSend(v10, "stringByAppendingPathComponent:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v13, "stringByDeletingPathExtension");
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v54 = (void *)v16;

    goto LABEL_6;
  }
  v54 = v13;
  if (objc_msgSend(v13, "length"))
  {
    v54 = v13;
    if (objc_msgSend(v13, "characterAtIndex:", objc_msgSend(v13, "length") - 1) == 46)
    {
      objc_msgSend(v13, "substringToIndex:", objc_msgSend(v13, "length") - 1);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
  }
LABEL_6:
  v53 = v13;
  v58 = self;
  context = (void *)v11;
  v51 = v5;
  if (-[PXFileNameUniquifier _fileExistsAtPath:](self, "_fileExistsAtPath:", v15))
  {
    v17 = objc_msgSend(v54, "length");
    v18 = objc_msgSend(CFSTR(")"), "characterAtIndex:", 0);
    v56 = v17;
    v19 = v17 - 1;
    if (v18 == objc_msgSend(v54, "characterAtIndex:", v19))
    {
      v20 = objc_msgSend(v54, "rangeOfString:options:", CFSTR(" ("), 4);
      v22 = v21;
      v23 = objc_msgSend(v54, "rangeOfString:options:", CFSTR(")"), 4);
      if (v23 != 0x7FFFFFFFFFFFFFFFLL && v20 && v20 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v42 = v19;
        v43 = v20 + v22;
        v49 = v43;
        v50 = v23;
        if (v23 <= v43)
          v44 = v43;
        else
          v44 = v23;
        while (v44 != v43)
        {
          v45 = objc_msgSend(v54, "characterAtIndex:", v43);
          objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v45) = objc_msgSend(v46, "characterIsMember:", v45);

          ++v43;
          if ((v45 & 1) == 0)
            goto LABEL_40;
        }
        if (v50 >= v49 && v44 == v42)
        {
          objc_msgSend(v53, "substringToIndex:", v20);
          v47 = objc_claimAutoreleasedReturnValue();

          v54 = (void *)v47;
        }
        else
        {
          PLUIGetLog();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218496;
            v60 = v44;
            v61 = 2048;
            v62 = v56;
            v63 = 2048;
            v64 = v50;
            _os_log_impl(&dword_1A6789000, v48, OS_LOG_TYPE_ERROR, "File name uniquifier unexpected index for end of string: %lu, length: %lu; right index: %lu",
              buf,
              0x20u);
          }

        }
LABEL_40:
        self = v58;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR(" (%lu)"), 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[PXFileNameUniquifier _fileExistsAtPath:](self, "_fileExistsAtPath:", v15);
  v57 = v10;
  if (v12)
  {
    if (v25)
    {
      v26 = 1;
      do
      {
        objc_msgSend(v54, "stringByAppendingString:", v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringByAppendingPathExtension:", v55);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "stringByAppendingPathComponent:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = objc_msgSend(v24, "rangeOfString:", v14);
        v32 = v31;
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lu"), v26);

        v34 = v32;
        self = v58;
        objc_msgSend(v24, "replaceCharactersInRange:withString:", v30, v34, v33);

        ++v26;
        v10 = v57;
        v14 = v33;
        v15 = v29;
      }
      while (-[PXFileNameUniquifier _fileExistsAtPath:](v58, "_fileExistsAtPath:", v29));
      goto LABEL_22;
    }
  }
  else if (v25)
  {
    v35 = 1;
    do
    {
      objc_msgSend(v54, "stringByAppendingString:", v24);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingPathComponent:", v36);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = objc_msgSend(v24, "rangeOfString:", v14);
      v39 = v38;
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lu"), v35);

      v40 = v37;
      self = v58;
      objc_msgSend(v24, "replaceCharactersInRange:withString:", v40, v39, v33);

      ++v35;
      v10 = v57;
      v14 = v33;
      v15 = v29;
    }
    while (-[PXFileNameUniquifier _fileExistsAtPath:](v58, "_fileExistsAtPath:", v29));
    goto LABEL_22;
  }
  v33 = v14;
  v29 = v15;
LABEL_22:

  if (v51)
    -[PXFileNameUniquifier _rememberUniquifiedPath:](self, "_rememberUniquifiedPath:", v29);
  objc_msgSend(v29, "lastPathComponent");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
LABEL_25:

  return v8;
}

- (id)uniqueFileSystemNameForPath:(id)a3 withAlternateExtension:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a3;
  objc_msgSend(v6, "setWithObject:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFileNameUniquifier uniqueFileSystemNameForPath:withAlternateExtensions:](self, "uniqueFileSystemNameForPath:withAlternateExtensions:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)uniqueFileSystemNameForPath:(id)a3 withAlternateExtensions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v58;
  void *v59;
  void *context;
  void *v61;
  void *v62;
  id i;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id obj;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  context = (void *)MEMORY[0x1A85CE17C]();
  objc_msgSend(v6, "lastPathComponent");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "stringByDeletingPathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v6;
  objc_msgSend(v6, "stringByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = v7;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v86;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v86 != v14)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * v15), "lowercaseString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
    }
    while (v13);
  }

  objc_msgSend(v9, "lowercaseString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v11, "containsObject:", v17);

  if ((v18 & 1) == 0)
  {
    objc_msgSend(v9, "lowercaseString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v19);

  }
  v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v21 = v11;
  v22 = v20;
  v23 = v21;
  v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v82;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v82 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(v8, "stringByAppendingPathExtension:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * v27));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v28);

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
    }
    while (v25);
  }
  v62 = v9;
  v59 = v8;
  v65 = v23;

  v29 = 0;
  for (i = v22; ; v22 = i)
  {
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v30 = v22;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
    if (v31)
      break;
    v33 = 0;
LABEL_29:

    -[PXFileNameUniquifier _uniqueFileSystemName:inDirectory:rememberResult:](self, "_uniqueFileSystemName:inDirectory:rememberResult:", v33, v10, 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "stringByDeletingPathExtension");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "removeAllObjects");
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v40 = v65;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v74;
      do
      {
        v44 = 0;
        do
        {
          if (*(_QWORD *)v74 != v43)
            objc_enumerationMutation(v40);
          objc_msgSend(v39, "stringByAppendingPathExtension:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v44));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v45);

          ++v44;
        }
        while (v42 != v44);
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
      }
      while (v42);
    }

    v29 = v39;
  }
  v32 = v31;
  v66 = v29;
  v33 = 0;
  v34 = *(_QWORD *)v78;
  do
  {
    v35 = 0;
    v36 = v33;
    do
    {
      if (*(_QWORD *)v78 != v34)
        objc_enumerationMutation(v30);
      v33 = *(id *)(*((_QWORD *)&v77 + 1) + 8 * v35);

      objc_msgSend(v10, "stringByAppendingPathComponent:", v33);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[PXFileNameUniquifier _fileExistsAtPath:](self, "_fileExistsAtPath:", v37);

      if (v38)
      {
        v29 = v66;
        goto LABEL_29;
      }
      ++v35;
      v36 = v33;
    }
    while (v32 != v35);
    v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
  }
  while (v32);

  objc_msgSend(v30, "anyObject");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "stringByDeletingPathExtension");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "stringByAppendingPathExtension:", v62);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = v48;
  objc_msgSend(v48, "stringByDeletingPathExtension");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v50 = v65;
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v69, v89, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v70;
    do
    {
      v54 = 0;
      do
      {
        if (*(_QWORD *)v70 != v53)
          objc_enumerationMutation(v50);
        objc_msgSend(v49, "stringByAppendingPathExtension:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * v54));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByAppendingPathComponent:", v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        -[PXFileNameUniquifier _rememberUniquifiedPath:](self, "_rememberUniquifiedPath:", v56);
        ++v54;
      }
      while (v52 != v54);
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v69, v89, 16);
    }
    while (v52);
  }

  objc_autoreleasePoolPop(context);
  return v64;
}

- (id)ensureUniquePath:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "stringByExpandingTildeInPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXFileNameUniquifier _fileExistsAtPath:](self, "_fileExistsAtPath:", v5);

  v7 = v4;
  if (v6)
  {
    objc_msgSend(v4, "stringByExpandingTildeInPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByDeletingLastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFileNameUniquifier _uniqueFileSystemName:inDirectory:rememberResult:](self, "_uniqueFileSystemName:inDirectory:rememberResult:", v10, v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "stringByAppendingPathComponent:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PXFileNameUniquifier _rememberUniquifiedPath:](self, "_rememberUniquifiedPath:", v7);

  return v7;
}

- (id)ensureUniquePath:(id)a3 andAlternateExtension:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = (void *)MEMORY[0x1A85CE17C]();
  v8 = a3;
  objc_msgSend(v8, "stringByExpandingTildeInPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXFileNameUniquifier uniqueFileSystemNameForPath:withAlternateExtension:](self, "uniqueFileSystemNameForPath:withAlternateExtension:", v8, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
  return v12;
}

- (id)ensureUniquePath:(id)a3 alternateExtensions:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = (void *)MEMORY[0x1A85CE17C]();
  v8 = a3;
  objc_msgSend(v8, "stringByExpandingTildeInPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXFileNameUniquifier uniqueFileSystemNameForPath:withAlternateExtensions:](self, "uniqueFileSystemNameForPath:withAlternateExtensions:", v8, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
  return v12;
}

- (id)ensureUniqueFileURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFileNameUniquifier ensureUniquePath:](self, "ensureUniquePath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_fileExistsAtPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PXFileNameUniquifier existingFileSources](self, "existingFileSources", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "fileExistsAtPath:", v4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_rememberUniquifiedPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PXFileNameUniquifier existingFileSources](self, "existingFileSources", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "rememberUniquifiedFilePath:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSArray)existingFileSources
{
  return self->_existingFileSources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingFileSources, 0);
}

@end
