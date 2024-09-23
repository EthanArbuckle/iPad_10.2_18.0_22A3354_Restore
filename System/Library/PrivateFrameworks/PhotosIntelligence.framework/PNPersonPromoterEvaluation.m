@implementation PNPersonPromoterEvaluation

+ (id)openPhotoLibraryAtURL:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  NSObject *v7;
  const char *v8;
  int v9;
  id v10;
  NSObject *v11;
  const char *v12;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE35F0]), "initWithPhotoLibraryURL:", v3);
  if (objc_msgSend(v4, "isSystemPhotoLibrary"))
  {
    v15 = 0;
    v5 = objc_msgSend(v4, "openAndWaitWithUpgrade:error:", 0, &v15);
    v6 = v15;
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v3;
        v7 = MEMORY[0x24BDACB70];
        v8 = "Using system library at %@";
LABEL_8:
        _os_log_impl(&dword_243C3E000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      v11 = MEMORY[0x24BDACB70];
      v12 = "Unable to open system photo library: %@";
LABEL_16:
      _os_log_error_impl(&dword_243C3E000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDE35F0], "enableMultiLibraryMode");
  v14 = 0;
  v9 = objc_msgSend(v4, "openAndWaitWithUpgrade:error:", 1, &v14);
  v6 = v14;
  if (!v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      v11 = MEMORY[0x24BDACB70];
      v12 = "Failed to open library. Error: %@";
      goto LABEL_16;
    }
LABEL_13:

    v10 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v3;
    v7 = MEMORY[0x24BDACB70];
    v8 = "Using library at %@";
    goto LABEL_8;
  }
LABEL_9:

  v10 = v4;
LABEL_14:

  return v10;
}

+ (void)peopleClusteringWithParameter:(id)a3 photoLibrary:(id)a4 directoryURL:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  PNPersonClusterManager *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  id v21;
  char v22;
  void *v23;
  char v24;
  id v25;
  id v26;
  char v27;
  double v28;
  double v29;
  uint64_t v30;
  double v31;
  NSObject *v32;
  PNPersonPromoterProfile *v33;
  PNPersonDeduperProfile *v34;
  NSString *v35;
  void *v36;
  void *v37;
  PNPersonPromoter *v38;
  __CFString *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  id v46;
  void *v47;
  id v48;
  double v49;
  double v50;
  void *v51;
  PNPersonPromoter *v52;
  void *v53;
  void *v54;
  __CFString *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  void *context;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint8_t buf[4];
  const __CFString *v72;
  __int16 v73;
  double v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v62 = a1;
  v63 = a6;
  if (objc_msgSend(a1, "createDirectoryIfNotExitAtURL:", v12))
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setDateFormat:", CFSTR("yyyyMMdd_HHmmss"));
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringFromDate:", v14);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x249506444]();
    v16 = -[PNPersonClusterManager initWithPhotoLibrary:]([PNPersonClusterManager alloc], "initWithPhotoLibrary:", v11);
    objc_msgSend(v12, "URLByAppendingPathComponent:", CFSTR("Baseline_FaceGroup.plist"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0;
    v18 = objc_msgSend(v17, "checkResourceIsReachableAndReturnError:", &v70);
    v19 = v70;
    v20 = v19;
    v60 = v11;
    if ((v18 & 1) != 0)
    {
      v21 = v19;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v72 = CFSTR("Baseline_FaceGroup.plist");
        _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Exporting %@...", buf, 0xCu);
      }
      v69 = v20;
      v22 = objc_msgSend(v62, "exportPhotoLibrary:toURL:forPeopleType:error:", v16, v17, 0, &v69);
      v21 = v69;

      if ((v22 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v72 = CFSTR("Baseline_FaceGroup.plist");
        _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not export: %@", buf, 0xCu);
      }
    }
    objc_msgSend(v12, "URLByAppendingPathComponent:", CFSTR("Baseline_verified.plist"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v68 = v21;
    v24 = objc_msgSend(v23, "checkResourceIsReachableAndReturnError:", &v68);
    v25 = v68;

    v59 = v13;
    if ((v24 & 1) != 0)
    {
      v26 = v25;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v72 = CFSTR("Baseline_verified.plist");
        _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Exporting %@...", buf, 0xCu);
      }
      v67 = v25;
      v27 = objc_msgSend(v62, "exportPhotoLibrary:toURL:forPeopleType:error:", v16, v23, 1, &v67);
      v26 = v67;

      if ((v27 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v72 = CFSTR("Baseline_verified.plist");
        _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not export: %@", buf, 0xCu);
      }
    }
    v11 = v60;

    objc_autoreleasePoolPop(v15);
    if (objc_msgSend(v10, "isValid"))
    {
      objc_msgSend(v10, "startValue");
      v29 = v28;
      v30 = objc_msgSend(v10, "endValue");
      if (v29 <= v31)
      {
        v32 = MEMORY[0x24BDACB70];
        do
        {
          context = (void *)MEMORY[0x249506444](v30);
          v33 = objc_alloc_init(PNPersonPromoterProfile);
          v34 = objc_alloc_init(PNPersonDeduperProfile);
          objc_msgSend(v10, "name");
          v35 = (NSString *)objc_claimAutoreleasedReturnValue();
          NSSelectorFromString(v35);

          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v29);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "name");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[PNPersonDeduperProfile setValue:forKey:](v34, "setValue:forKey:", v36, v37);

          }
          v38 = -[PNPersonPromoter initWithPhotoLibrary:andDelegate:]([PNPersonPromoter alloc], "initWithPhotoLibrary:andDelegate:", v11, v63);
          -[PNPersonPromoter setPromoterProfile:](v38, "setPromoterProfile:", v33);
          -[PNPersonPromoter setDeduperProfile:](v38, "setDeduperProfile:", v34);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v10, "name");
            v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v72 = v39;
            v73 = 2048;
            v74 = v29;
            _os_log_impl(&dword_243C3E000, v32, OS_LOG_TYPE_DEFAULT, "Running promoter with %@ = %lf...", buf, 0x16u);

          }
          v40 = -[PNPersonPromoter evaluatePersonPromoterWithUpdateBlock:](v38, "evaluatePersonPromoterWithUpdateBlock:", &__block_literal_global_757);
          -[PNPersonPromoter personClusterManager](v38, "personClusterManager");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)MEMORY[0x24BDD17C8];
          v43 = v10;
          objc_msgSend(v10, "name");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "stringWithFormat:", CFSTR("%@_%.2f/Graph_%@_verified.plist"), v44, *(_QWORD *)&v29, v61, v59);
          v45 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v72 = v45;
            _os_log_impl(&dword_243C3E000, v32, OS_LOG_TYPE_DEFAULT, "Exporting %@...", buf, 0xCu);
          }
          v46 = v12;
          objc_msgSend(v12, "URLByAppendingPathComponent:", v45);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = 0;
          objc_msgSend(v62, "exportPhotoLibrary:toURL:forPeopleType:error:", v41, v47, 1, &v66);
          v48 = v66;

          if (v48 && os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v72 = v45;
            v73 = 2112;
            v74 = *(double *)&v48;
            _os_log_impl(&dword_243C3E000, v32, OS_LOG_TYPE_DEFAULT, "Could not save people clusters to %@: %@", buf, 0x16u);
          }

          objc_autoreleasePoolPop(context);
          objc_msgSend(v43, "incrementValue");
          v29 = v29 + v49;
          v30 = objc_msgSend(v43, "endValue");
          v11 = v60;
          v12 = v46;
          v10 = v43;
        }
        while (v29 <= v50);
      }
    }
    else
    {
      v51 = (void *)MEMORY[0x249506444]();
      v52 = -[PNPersonPromoter initWithPhotoLibrary:andDelegate:]([PNPersonPromoter alloc], "initWithPhotoLibrary:andDelegate:", v60, v63);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Evaluating promoter...", buf, 2u);
      }
      -[PNPersonPromoter evaluatePersonPromoterWithUpdateBlock:](v52, "evaluatePersonPromoterWithUpdateBlock:", &__block_literal_global_179);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[PNPersonPromoter personClusterManager](v52, "personClusterManager");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Graph_%@_verified.plist"), v61);
      v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v72 = v55;
        _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Exporting %@...", buf, 0xCu);
      }
      v56 = v12;
      objc_msgSend(v12, "URLByAppendingPathComponent:", v55);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = 0;
      objc_msgSend(v62, "exportPhotoLibrary:toURL:forPeople:error:", v54, v57, v53, &v65);
      v58 = v65;

      if (v58 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v72 = v55;
        v73 = 2112;
        v74 = *(double *)&v58;
        _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not save people clusters to %@: %@", buf, 0x16u);
      }

      objc_autoreleasePoolPop(v51);
      v12 = v56;
    }

  }
}

+ (BOOL)createDirectoryIfNotExitAtURL:(id)a3
{
  id v3;
  id v4;
  void *v5;
  int v6;
  char v7;
  id v8;
  id v10;
  char v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDD1580]);
  v11 = 0;
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, &v11);

  if (v6)
  {
    if (v11)
    {
      v7 = 1;
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error output path exists and it is not a directory", buf, 2u);
      v7 = v11 != 0;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v10 = 0;
    v7 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v10);
    v8 = v10;
    if ((v7 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error occured creating output directory: %@", buf, 0xCu);
    }

  }
  return v7;
}

+ (BOOL)exportPhotoLibrary:(id)a3 toURL:(id)a4 forPeopleType:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = objc_alloc_init(MEMORY[0x24BDD1580]);
  objc_msgSend(v11, "URLByDeletingLastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "fileExistsAtPath:", v14);

  if ((v15 & 1) != 0)
  {
    v16 = 0;
  }
  else
  {
    v24 = 0;
    objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v24);
    v16 = v24;
  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF08]), "initWithURL:append:", v11, 0);
  v18 = v17;
  if (v16 || !v17)
  {
    v22 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v16);
  }
  else
  {
    objc_msgSend(v17, "open");
    objc_msgSend(v10, "pn_fetchPersonsWithType:", a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_peopleClustersDictionaryForPeople:withPhotoLibrary:", v19, v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(MEMORY[0x24BDD1770], "writePropertyList:toStream:format:options:error:", v20, v18, 100, 0, a6);
    v22 = v21 != 0;
    objc_msgSend(v18, "close");
    if (!v21)
      objc_msgSend(v12, "removeItemAtURL:error:", v11, 0);

  }
  return v22;
}

+ (id)_peopleClustersDictionaryForPeople:(id)a3 withPhotoLibrary:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  float v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id obj;
  uint64_t v52;
  id v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[2];
  _QWORD v77[2];
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  _QWORD v84[11];
  _QWORD v85[11];
  void *v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v61 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v5;
  v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
  if (v54)
  {
    v52 = *(_QWORD *)v73;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v73 != v52)
          objc_enumerationMutation(obj);
        v56 = v6;
        v7 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v6);
        v55 = (void *)MEMORY[0x249506444]();
        v57 = v7;
        objc_msgSend(v61, "pn_fetchFacesForPerson:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v58 = v8;
        v62 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v68, v87, 16);
        if (v62)
        {
          v60 = *(_QWORD *)v69;
          do
          {
            for (i = 0; i != v62; ++i)
            {
              if (*(_QWORD *)v69 != v60)
                objc_enumerationMutation(v58);
              v10 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
              objc_msgSend(v10, "localIdentifier");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = v11;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v86, 1);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "pn_fetchAssetsForFaceLocalIdentifiers:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "fetchedObjects");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "firstObject");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v15, "cloudIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v16, "length"))
                objc_msgSend(v15, "cloudIdentifier");
              else
                objc_msgSend(v15, "localIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x24BDE3488], "uuidFromLocalIdentifier:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
              {
                v19 = objc_msgSend(v15, "pixelWidth");
                v20 = objc_msgSend(v15, "pixelHeight");
                if (v19 <= v20)
                  v21 = v20;
                else
                  v21 = v19;
                v22 = (float)v21;
                v85[0] = v18;
                v84[0] = CFSTR("id");
                v84[1] = CFSTR("filename");
                objc_msgSend(v15, "filename");
                v23 = objc_claimAutoreleasedReturnValue();
                v65 = (void *)v23;
                if (v23)
                  v24 = (const __CFString *)v23;
                else
                  v24 = &stru_251481610;
                v85[1] = v24;
                v84[2] = CFSTR("originalFilename");
                objc_msgSend(v15, "originalFilename");
                v25 = objc_claimAutoreleasedReturnValue();
                v66 = v18;
                v67 = v17;
                v26 = (void *)v25;
                if (v25)
                  v27 = (const __CFString *)v25;
                else
                  v27 = &stru_251481610;
                v85[2] = v27;
                v84[3] = CFSTR("centerX_normalized");
                v28 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v10, "centerX");
                objc_msgSend(v28, "numberWithDouble:");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v85[3] = v64;
                v84[4] = CFSTR("centerY_normalized");
                v29 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v10, "centerY");
                objc_msgSend(v29, "numberWithDouble:");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                v85[4] = v63;
                v84[5] = CFSTR("size_normalized");
                v30 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v10, "size");
                objc_msgSend(v30, "numberWithDouble:");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v85[5] = v31;
                v84[6] = CFSTR("centerX");
                v32 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v10, "centerX");
                objc_msgSend(v32, "numberWithDouble:", v33 * (double)(unint64_t)objc_msgSend(v15, "pixelWidth"));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v85[6] = v34;
                v84[7] = CFSTR("centerY");
                v35 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v10, "centerY");
                objc_msgSend(v35, "numberWithDouble:", v36 * (double)(unint64_t)objc_msgSend(v15, "pixelHeight"));
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v85[7] = v37;
                v84[8] = CFSTR("size");
                v38 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v10, "size");
                objc_msgSend(v38, "numberWithDouble:", v39 * v22);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v85[8] = v40;
                v84[9] = CFSTR("pixelWidth");
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v15, "pixelWidth"));
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v85[9] = v41;
                v84[10] = CFSTR("pixelHeight");
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v15, "pixelHeight"));
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v85[10] = v42;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v85, v84, 11);
                v43 = (void *)objc_claimAutoreleasedReturnValue();

                v18 = v66;
                objc_msgSend(v59, "addObject:", v43);

                v17 = v67;
              }
              else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v10, "localIdentifier");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "localIdentifier");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v79 = v15;
                v80 = 2112;
                v81 = v44;
                v82 = 2112;
                v83 = v45;
                _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "No identifier for asset: %@, face identifier: %@, person identifier: %@", buf, 0x20u);

              }
            }
            v62 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v68, v87, 16);
          }
          while (v62);
        }

        objc_msgSend(v57, "anonymizedName");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v46, "length"))
          objc_msgSend(v57, "anonymizedName");
        else
          objc_msgSend(v57, "localIdentifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        v76[0] = CFSTR("verified");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v57, "isVerified"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v76[1] = CFSTR("assets");
        v77[0] = v48;
        v77[1] = v59;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v77, v76, 2);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v49, v47);

        objc_autoreleasePoolPop(v55);
        v6 = v56 + 1;
      }
      while (v56 + 1 != v54);
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
    }
    while (v54);
  }

  return v53;
}

+ (BOOL)exportPhotoLibrary:(id)a3 toURL:(id)a4 forPeople:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(MEMORY[0x24BDD1580]);
  objc_msgSend(v11, "URLByDeletingLastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "fileExistsAtPath:", v15);

  if ((v16 & 1) != 0)
  {
    v17 = 0;
  }
  else
  {
    v24 = 0;
    objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v14, 1, 0, &v24);
    v17 = v24;
  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF08]), "initWithURL:append:", v11, 0);
  v19 = v18;
  if (v17 || !v18)
  {
    v22 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v17);
  }
  else
  {
    objc_msgSend(v18, "open");
    objc_msgSend(a1, "_peopleClustersDictionaryForPeople:withPhotoLibrary:", v12, v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(MEMORY[0x24BDD1770], "writePropertyList:toStream:format:options:error:", v20, v19, 100, 0, a6);
    v22 = v21 != 0;
    objc_msgSend(v19, "close");
    if (!v21)
      objc_msgSend(v13, "removeItemAtURL:error:", v11, 0);

  }
  return v22;
}

@end
