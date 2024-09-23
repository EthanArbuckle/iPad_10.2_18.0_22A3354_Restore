@implementation PICompositionSidecarData

- (PICompositionSidecarData)init
{
  PICompositionSidecarData *v2;
  NSString *sourceIdentifier;
  NSArray *maskSources;
  NSArray *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PICompositionSidecarData;
  v2 = -[PICompositionSidecarData init](&v7, sel_init);
  sourceIdentifier = v2->_sourceIdentifier;
  v2->_sourceIdentifier = (NSString *)&stru_1E501A310;

  maskSources = v2->_maskSources;
  v5 = (NSArray *)MEMORY[0x1E0C9AA60];
  v2->_version = 2;
  v2->_maskSources = v5;

  return v2;
}

- (id)contentsDictionary
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[3];
  _QWORD v26[3];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PICompositionSidecarData version](self, "version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("version"));

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[PICompositionSidecarData maskSources](self, "maskSources");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
        v25[0] = CFSTR("identifier");
        objc_msgSend(v11, "maskIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v12;
        v25[1] = CFSTR("extent");
        if (v11)
          objc_msgSend(v11, "extent");
        NSArrayFromNUPixelRect();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = v13;
        v25[2] = CFSTR("scale");
        objc_msgSend(v11, "scale");
        NUScaleToString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v26[2] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "maskIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v16);

        objc_msgSend(v11, "maskIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v17);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v8);
  }

  objc_msgSend(v19, "setObject:forKeyedSubscript:", v6, CFSTR("maskSources"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v5, CFSTR("maskIdentifiers"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("hasBrushStrokeHistory"));

  return v19;
}

- (BOOL)saveToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  char v18;
  id v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  char v35;
  BOOL v36;
  NSObject *v38;
  const void **v39;
  const void **v40;
  void *specific;
  NSObject *v42;
  _BOOL4 v43;
  void *v44;
  NSObject *v45;
  const void **v46;
  void *v47;
  int v48;
  void *v49;
  const void **v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  NSObject *v60;
  const void **v61;
  const void **v62;
  void *v63;
  NSObject *v64;
  _BOOL4 v65;
  void *v66;
  const void **v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id obj;
  uint64_t v77;
  uint64_t v78;
  PICompositionSidecarData *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  id v89;
  id v90;
  id v91;
  uint8_t v92[128];
  uint8_t buf[4];
  const void **v94;
  __int16 v95;
  void *v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_7703();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "archiveURL != nil");
      v39 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v94 = v39;
      _os_log_error_impl(&dword_1A6382000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v40 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_7703();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v43)
      {
        v51 = dispatch_get_specific(*v40);
        v52 = (void *)MEMORY[0x1E0CB3978];
        v53 = v51;
        objc_msgSend(v52, "callStackSymbols");
        v40 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v94 = (const void **)v51;
        v95 = 2114;
        v96 = v54;
        _os_log_error_impl(&dword_1A6382000, v42, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v43)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
      v40 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v94 = v40;
      _os_log_error_impl(&dword_1A6382000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v48 = _NUAssertFailHandler();
    goto LABEL_50;
  }
  if (!a4)
  {
    NUAssertLogger_7703();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v46 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v94 = v46;
      _os_log_error_impl(&dword_1A6382000, v45, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v40 = (const void **)MEMORY[0x1E0D51D48];
    v47 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_7703();
    v42 = objc_claimAutoreleasedReturnValue();
    v48 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (!v47)
    {
      if (v48)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
        v50 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v94 = v50;
        _os_log_error_impl(&dword_1A6382000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_52:

      _NUAssertFailHandler();
LABEL_53:
      NUAssertLogger_7703();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Mask sources must be backed either by a buffer or a file"));
        v61 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v94 = v61;
        _os_log_error_impl(&dword_1A6382000, v60, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v62 = (const void **)MEMORY[0x1E0D51D48];
      v63 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      NUAssertLogger_7703();
      v64 = objc_claimAutoreleasedReturnValue();
      v65 = os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);
      if (v63)
      {
        if (v65)
        {
          v68 = dispatch_get_specific(*v62);
          v69 = (void *)MEMORY[0x1E0CB3978];
          v70 = v68;
          objc_msgSend(v69, "callStackSymbols");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "componentsJoinedByString:", CFSTR("\n"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v94 = (const void **)v68;
          v95 = 2114;
          v96 = v72;
          _os_log_error_impl(&dword_1A6382000, v64, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v65)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "componentsJoinedByString:", CFSTR("\n"));
        v67 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v94 = v67;
        _os_log_error_impl(&dword_1A6382000, v64, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler();
    }
LABEL_50:
    if (v48)
    {
      v55 = dispatch_get_specific(*v40);
      v56 = (void *)MEMORY[0x1E0CB3978];
      v57 = v55;
      objc_msgSend(v56, "callStackSymbols");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "componentsJoinedByString:", CFSTR("\n"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v94 = (const void **)v55;
      v95 = 2114;
      v96 = v59;
      _os_log_error_impl(&dword_1A6382000, v42, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_52;
  }
  v7 = v6;
  objc_msgSend(v6, "URLByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0;
  v10 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v91);
  v11 = v91;

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to create archive parent directory"), v7, v11);
    v36 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75098]), "initWithArchiveURL:", v7);
  objc_msgSend(v12, "setCompression:", -1);
  v90 = v11;
  v13 = objc_msgSend(v12, "openForWriting:", &v90);
  v14 = v90;

  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to open sidecar data archive for writing"), v7, v14);
    v36 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  v79 = self;
  -[PICompositionSidecarData contentsDictionary](self, "contentsDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v15, 200, 0, &v89);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v89;

  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to serialize contents plist"), v15, v17);
    v36 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  v75 = v15;
  v88 = v17;
  v18 = objc_msgSend(v12, "encodeData:filename:error:", v16, CFSTR("contents.plist"), &v88);
  v19 = v88;

  if ((v18 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to archive contents plist data"), v16, v19);
    v36 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v19;
    goto LABEL_27;
  }
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  -[PICompositionSidecarData maskSources](v79, "maskSources");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
  if (!v77)
    goto LABEL_21;
  v78 = *(_QWORD *)v85;
  v73 = v16;
  v74 = v8;
  while (2)
  {
    for (i = 0; i != v77; ++i)
    {
      if (*(_QWORD *)v85 != v78)
        objc_enumerationMutation(obj);
      v21 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
      v83 = 0;
      objc_msgSend(v21, "sourceImage:", &v83);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v83;

      if (!v22)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to create new mask image from source"), v21, v17);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

        v36 = 0;
        v8 = v74;
        v15 = v75;
        v16 = v73;
        goto LABEL_34;
      }
      v23 = objc_msgSend(v22, "pixelBuffer");
      if (v23)
      {
        v24 = v23;
        v25 = (void *)objc_opt_class();
        v82 = 0;
        objc_msgSend(v25, "dataForImageBuffer:error:", v24, &v82);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v82;

        if (!v26)
        {
          objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to encode mask"), v22, v19);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_32;
        }
        v17 = v19;
      }
      else
      {
        objc_msgSend(v21, "definition");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_53;
        v28 = (objc_class *)MEMORY[0x1E0C99D50];
        v29 = v27;
        v30 = [v28 alloc];
        objc_msgSend(v29, "url");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = (void *)objc_msgSend(v30, "initWithContentsOfURL:", v31);
      }
      v32 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v21, "maskIdentifier");
      v33 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("masks/%@"), v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v81 = v17;
      LOBYTE(v33) = objc_msgSend(v12, "encodeData:filename:error:", v26, v34, &v81);
      v19 = v81;

      if ((v33 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to archive mask data"), v26, v19);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_32:
        v17 = v19;
        goto LABEL_33;
      }

    }
    v16 = v73;
    v8 = v74;
    v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
    if (v77)
      continue;
    break;
  }
LABEL_21:

  v80 = v19;
  v35 = objc_msgSend(v12, "close:", &v80);
  v17 = v80;

  if ((v35 & 1) != 0)
  {
    v36 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to close sidecar archive file"), v12, v17);
    v36 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_27:
  v15 = v75;
LABEL_34:

  v14 = v17;
LABEL_35:

  v11 = v14;
LABEL_36:

  return v36;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (NSArray)maskSources
{
  return self->_maskSources;
}

- (void)setMaskSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskSources, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
}

+ (id)loadFromURL:(id)a3 error:(id *)a4
{
  PICompositionSidecarData *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  PICompositionSidecarData *specific;
  const void **v13;
  char v14;
  id v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  unint64_t v20;
  void *v21;
  PICompositionSidecarData *v22;
  void *v23;
  void *v24;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  _BOOL4 v49;
  NSObject *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  uint64_t v69;
  id obj;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  unint64_t v79;
  void *v80;
  _OWORD v81[2];
  id v82;
  id v83;
  id v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  uint8_t buf[40];
  _BYTE v96[128];
  uint64_t v97;

  v9 = buf;
  v97 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!v10)
  {
    NUAssertLogger_7703();
    v47 = objc_claimAutoreleasedReturnValue();
    a4 = (id *)"archiveURL != nil";
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "archiveURL != nil");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v48;
      _os_log_error_impl(&dword_1A6382000, v47, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v13 = (const void **)MEMORY[0x1E0D51D48];
    specific = (PICompositionSidecarData *)dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_7703();
    v11 = objc_claimAutoreleasedReturnValue();
    v49 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v49)
      {
        specific = (PICompositionSidecarData *)dispatch_get_specific(*v13);
        v53 = (void *)MEMORY[0x1E0CB3978];
        v4 = specific;
        objc_msgSend(v53, "callStackSymbols");
        v13 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
        v5 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = specific;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v5;
        _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v49)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (PICompositionSidecarData *)objc_claimAutoreleasedReturnValue();
      -[PICompositionSidecarData componentsJoinedByString:](specific, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v13;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v52 = _NUAssertFailHandler();
    goto LABEL_89;
  }
  if (!a4)
  {
    NUAssertLogger_7703();
    v50 = objc_claimAutoreleasedReturnValue();
    a4 = (id *)"error != NULL";
    v4 = (PICompositionSidecarData *)&unk_1A64D6000;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v51;
      _os_log_error_impl(&dword_1A6382000, v50, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v13 = (const void **)MEMORY[0x1E0D51D48];
    specific = (PICompositionSidecarData *)dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_7703();
    v11 = objc_claimAutoreleasedReturnValue();
    v52 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v52)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        specific = (PICompositionSidecarData *)objc_claimAutoreleasedReturnValue();
        -[PICompositionSidecarData componentsJoinedByString:](specific, "componentsJoinedByString:", CFSTR("\n"));
        v13 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v13;
        _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_91;
    }
LABEL_89:
    if (v52)
    {
      specific = (PICompositionSidecarData *)dispatch_get_specific(*v13);
      v54 = (void *)MEMORY[0x1E0CB3978];
      v4 = specific;
      objc_msgSend(v54, "callStackSymbols");
      v13 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
      v5 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = specific;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v5;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_91:

    v58 = a4;
    _NUAssertFailHandler();
LABEL_92:
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid mask identifier"), v6, v58);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_101:
    v26 = v77;
    v46 = v72;

    v22 = 0;
    goto LABEL_106;
  }
  v11 = v10;
  specific = objc_alloc_init(PICompositionSidecarData);
  v13 = (const void **)objc_msgSend(objc_alloc(MEMORY[0x1E0D75098]), "initWithArchiveURL:", v11);
  objc_msgSend(v13, "setCompression:", -1);
  v94 = 0;
  v14 = objc_msgSend(v13, "openForReading:", &v94);
  v15 = v94;
  v16 = v15;
  if ((v14 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to open sidecar data archive for reading"), v11, v15);
    v22 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  v92 = 0;
  v93 = 0;
  v91 = v15;
  v17 = objc_msgSend(v13, "decodeData:filename:error:", &v93, &v92, &v91);
  v4 = (PICompositionSidecarData *)v93;
  v5 = v92;
  v18 = v91;

  if ((v17 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to decode contents plist data"), v13, v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
    v22 = 0;
    *a4 = v23;
    goto LABEL_24;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("contents.plist")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Expected contents.plist data"), v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v90 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, &v90);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v90;

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to deserialize contents plist"), v4, v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
    v22 = 0;
    *a4 = v24;
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid contents plist"), v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("version"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing version info"), v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid version info"), v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  v20 = objc_msgSend(v19, "unsignedIntegerValue");
  if (v20 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "unsupportedError:object:", CFSTR("Unsupported version"), v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
    v22 = 0;
    *a4 = v21;
    goto LABEL_22;
  }
  v79 = v20;
  v80 = v19;
  -[PICompositionSidecarData setVersion:](specific, "setVersion:", v20);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("maskIdentifiers"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing mask source identifiers"), v9);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_72:
    v22 = 0;
    *a4 = v44;
    goto LABEL_108;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid mask source identifiers"), v26);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_72;
  }
  v77 = v26;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("maskSources"));
  v27 = objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing mask source metadata"), v9);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_75:
    v22 = 0;
    *a4 = v45;
    v46 = (void *)v27;
    v26 = v77;
    goto LABEL_107;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid mask source metadata"), v27);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_75;
  }
  v72 = (void *)v27;
  v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  obj = v77;
  v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
  if (!v69)
    goto LABEL_65;
  v71 = *(_QWORD *)v87;
  while (2)
  {
    v28 = 0;
    do
    {
      if (*(_QWORD *)v87 != v71)
        objc_enumerationMutation(obj);
      v75 = v28;
      v6 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v28);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_92;
      v76 = v6;
      objc_msgSend(v72, "objectForKeyedSubscript:", v6);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing mask source metadata for '%@'"), v76);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", v55, v72);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_99:
        *a4 = v56;

        goto LABEL_100;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid mask source metadata"), v29);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_100:

        goto LABEL_101;
      }
      v78 = v29;
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("identifier"));
      v30 = objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing mask source identifier"), v29);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 0;
        goto LABEL_99;
      }
      v31 = (void *)v30;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid mask source identifier"), v31);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v31;
LABEL_98:
        v29 = v78;
        goto LABEL_99;
      }
      v74 = v31;
      if ((objc_msgSend(v31, "isEqualToString:", v76) & 1) == 0)
      {
        v55 = v31;
        objc_msgSend(MEMORY[0x1E0D520A0], "mismatchError:object:", CFSTR("Encoded mask identifier does not match expected value"), v31);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_98;
      }
      objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("extent"));
      v32 = objc_claimAutoreleasedReturnValue();
      v73 = (void *)v32;
      if (!v32)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing mask source extent"), v78);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_51:
        *a4 = v41;
        v40 = 1;
        goto LABEL_62;
      }
      v33 = v32;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid mask source extent"), v33);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_51;
      }
      memset(buf, 0, 32);
      NUPixelRectFromArray();
      objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("scale"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (v68)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v34 = NUScaleFromString();
          v60 = v35;
          v61 = v34;
          v84 = 0;
          v85 = 0;
          v83 = v7;
          v62 = objc_msgSend(v13, "decodeData:filename:error:", &v85, &v84, &v83);
          v64 = v85;
          v66 = v84;
          v65 = v83;

          if ((v62 & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("masks/%@"), v76);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v66, "isEqualToString:") & 1) != 0)
            {
              v36 = (void *)objc_opt_class();
              v82 = 0;
              objc_msgSend(v36, "imageBufferFromData:error:", v64, &v82);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = v82;

              if (v37)
              {
                v38 = objc_alloc(MEMORY[0x1E0D521B0]);
                v81[0] = *(_OWORD *)buf;
                v81[1] = *(_OWORD *)&buf[16];
                v39 = (void *)objc_msgSend(v38, "initWithImageBuffer:identifier:extent:scale:", v37, v76, v81, v61, v60);
                objc_msgSend(v67, "addObject:", v39);

                v40 = 0;
              }
              else
              {
                v40 = 1;
                objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to read mask image data"), v64, v59);
                *a4 = (id)objc_claimAutoreleasedReturnValue();
              }
              v65 = v59;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected %@ data"), v63);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", v37, v66);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              v40 = 1;
            }

            v7 = v65;
          }
          else
          {
            v40 = 1;
            v7 = v65;
            objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to decode mask image data"), v13, v65);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_61;
        }
        objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid mask source scale"), v68);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing mask source scale"), 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *a4 = v42;
      v40 = 1;
LABEL_61:

LABEL_62:
      if (v40)
        goto LABEL_101;
      v28 = v75 + 1;
    }
    while (v69 != v75 + 1);
    v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
    if (v69)
      continue;
    break;
  }
LABEL_65:

  -[PICompositionSidecarData setMaskSources:](specific, "setMaskSources:", v67);
  if (v79 < 2)
  {
LABEL_69:
    v22 = specific;
  }
  else
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("hasBrushStrokeHistory"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {

        goto LABEL_69;
      }
      objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid brush stroke history value"), v43);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing brush stroke history value"), v9);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *a4 = v57;

    v22 = 0;
  }
  v26 = v77;
  v46 = v72;
LABEL_106:

LABEL_107:
LABEL_108:

  v19 = v80;
LABEL_22:

LABEL_23:
  v18 = v7;
LABEL_24:

  v16 = v18;
LABEL_25:

  return v22;
}

+ (id)dataForImageBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v12;
  const void **v13;
  const void **v14;
  void *specific;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  const void **v20;
  void *v21;
  int v22;
  void *v23;
  const void **v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  const void **v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_7703();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "buffer != nil");
      v13 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v13;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v14 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_7703();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v25 = dispatch_get_specific(*v14);
        v26 = (void *)MEMORY[0x1E0CB3978];
        v27 = v25;
        objc_msgSend(v26, "callStackSymbols");
        v14 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = (const void **)v25;
        v36 = 2114;
        v37 = v28;
        _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v14;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v22 = _NUAssertFailHandler();
    goto LABEL_20;
  }
  if (!a4)
  {
    NUAssertLogger_7703();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v20 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v20;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v14 = (const void **)MEMORY[0x1E0D51D48];
    v21 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_7703();
    v16 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (!v21)
    {
      if (v22)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v24;
        _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_22;
    }
LABEL_20:
    if (v22)
    {
      v29 = dispatch_get_specific(*v14);
      v30 = (void *)MEMORY[0x1E0CB3978];
      v31 = v29;
      objc_msgSend(v30, "callStackSymbols");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = (const void **)v29;
      v36 = 2114;
      v37 = v33;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_22:

    _NUAssertFailHandler();
  }
  v5 = PFFigEncodeCVPixelBufferToData();
  v6 = 0;
  v7 = v6;
  if ((_DWORD)v5)
  {
    v8 = (void *)MEMORY[0x1E0D520A0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "failureError:object:", CFSTR("Failed to encode pixel buffer"), v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v10 = 0;
  }
  else
  {
    v10 = v6;
  }

  return v10;
}

+ (id)imageBufferFromData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t CVPixelBufferFromImageData;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v12;
  void *v13;
  const void **v14;
  void *specific;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _BYTE texture[12];
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_7703();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "imageData != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)texture = 138543362;
      *(_QWORD *)&texture[4] = v13;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", texture, 0xCu);

    }
    v14 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_7703();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v25 = dispatch_get_specific(*v14);
        v26 = (void *)MEMORY[0x1E0CB3978];
        v27 = v25;
        objc_msgSend(v26, "callStackSymbols");
        v14 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)texture = 138543618;
        *(_QWORD *)&texture[4] = v25;
        v35 = 2114;
        v36 = v28;
        _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", texture, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)texture = 138543362;
      *(_QWORD *)&texture[4] = v14;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", texture, 0xCu);

    }
    v22 = _NUAssertFailHandler();
    goto LABEL_20;
  }
  if (!a4)
  {
    NUAssertLogger_7703();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)texture = 138543362;
      *(_QWORD *)&texture[4] = v20;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", texture, 0xCu);

    }
    v14 = (const void **)MEMORY[0x1E0D51D48];
    v21 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_7703();
    v16 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (!v21)
    {
      if (v22)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)texture = 138543362;
        *(_QWORD *)&texture[4] = v24;
        _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", texture, 0xCu);

      }
      goto LABEL_22;
    }
LABEL_20:
    if (v22)
    {
      v29 = dispatch_get_specific(*v14);
      v30 = (void *)MEMORY[0x1E0CB3978];
      v31 = v29;
      objc_msgSend(v30, "callStackSymbols");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)texture = 138543618;
      *(_QWORD *)&texture[4] = v29;
      v35 = 2114;
      v36 = v33;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", texture, 0x16u);

    }
LABEL_22:

    _NUAssertFailHandler();
  }
  v6 = v5;
  *(_QWORD *)texture = 0;
  CVPixelBufferFromImageData = PFFigCreateCVPixelBufferFromImageData();
  if ((_DWORD)CVPixelBufferFromImageData)
  {
    v8 = (void *)MEMORY[0x1E0D520A0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CVPixelBufferFromImageData);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "failureError:object:", CFSTR("Failed to decode pixel buffer"), v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v10 = 0;
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52040]), "initWithCVPixelBuffer:", *(_QWORD *)texture);
    CVPixelBufferRelease(*(CVPixelBufferRef *)texture);
  }

  return v10;
}

@end
