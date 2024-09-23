@implementation PLDelayedFiledSystemDeletions

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSMutableArray *obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%p %@> {"), self, objc_opt_class());
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = self->_deletionInfos;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "objectIDURI");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "fileURLs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v8, "thumbnailIndex");
        objc_msgSend(v8, "thumbnailIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\n%@: { %@ }, [%lu, %@]: %@"), v9, v11, v12, v13, v14);

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "appendString:", CFSTR("\n}"));
  return v3;
}

- (void)dealloc
{
  NSMutableArray *deletionInfos;
  objc_super v4;

  deletionInfos = self->_deletionInfos;
  self->_deletionInfos = 0;

  v4.receiver = self;
  v4.super_class = (Class)PLDelayedFiledSystemDeletions;
  -[PLDelayedFiledSystemDeletions dealloc](&v4, sel_dealloc);
}

- (void)addFilesystemDeletionInfo:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *deletionInfos;
  id v8;

  v4 = a3;
  v5 = v4;
  v8 = v4;
  if (!self->_deletionInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletionInfos = self->_deletionInfos;
    self->_deletionInfos = v6;

    v5 = v8;
    if (!v8)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    -[NSMutableArray addObject:](self->_deletionInfos, "addObject:", v8);
    v5 = v8;
  }
LABEL_4:

}

- (void)appendToXPCMessage:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  xpc_object_t v42;
  xpc_object_t v43;
  uint64_t m;
  void *v45;
  const __CFURL *v46;
  size_t v47;
  xpc_object_t v48;
  void *v49;
  xpc_object_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t n;
  id v56;
  id v57;
  uint64_t v58;
  const char *v59;
  id v60;
  uint64_t v61;
  const char *v62;
  void *v63;
  void *v64;
  size_t count;
  size_t v66;
  size_t v67;
  size_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v75;
  void *v76;
  void *v77;
  PLDelayedFiledSystemDeletions *v78;
  xpc_object_t xdict;
  uint64_t v80;
  NSMutableArray *obj;
  uint64_t v82;
  xpc_object_t v83;
  xpc_object_t v84;
  xpc_object_t v85;
  xpc_object_t xarray;
  uint64_t v87;
  NSMutableArray *v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _QWORD v106[4];
  id v107;
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  uint8_t v113[128];
  uint8_t buf[4];
  void *v115;
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  xdict = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDelayedFiledSystemDeletions.m"), 209, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message != NULL"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v78 = self;
  v9 = self->_deletionInfos;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v109, v119, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v110;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v110 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
        objc_msgSend(v14, "directory");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "filename");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "length") && objc_msgSend(v16, "length"))
        {
          objc_msgSend(v8, "objectForKey:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKey:", v17, v15);
          }
          objc_msgSend(v17, "addObject:", v16);

        }
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v109, v119, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v106[0] = MEMORY[0x1E0C809B0];
  v106[1] = 3221225472;
  v106[2] = __73__PLDelayedFiledSystemDeletions_appendToXPCMessage_managedObjectContext___block_invoke;
  v106[3] = &unk_1E366AE50;
  v75 = v7;
  v107 = v75;
  v19 = v18;
  v108 = v19;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v106);
  v77 = v19;
  v76 = v8;
  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v19, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v21 = v19;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v102, v118, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v103;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v103 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * j);
          objc_msgSend(v26, "directory");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "filename");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v27, "length") && objc_msgSend(v28, "length"))
          {
            objc_msgSend(v27, "stringByAppendingPathComponent:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v29);

          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v102, v118, 16);
      }
      while (v23);
    }

    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v30 = v78->_deletionInfos;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v98, v117, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v99;
      v88 = v30;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v99 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * k);
          objc_msgSend(v35, "directory");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "filename");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v36, "length") && objc_msgSend(v37, "length"))
          {
            objc_msgSend(v36, "stringByAppendingPathComponent:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v20, "containsObject:", v38))
            {
              v39 = v20;
              PLBackendGetLog();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v35, "fileURLs");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v115 = v41;
                _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_ERROR, "Denying attempt to delete file paths %@ since we found duplicates", buf, 0xCu);

                v30 = v88;
              }

              objc_msgSend(v35, "setFileURLs:", 0);
              objc_msgSend(v35, "setThumbnailIdentifier:", 0);
              v20 = v39;
            }

          }
        }
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v98, v117, 16);
      }
      while (v32);
    }

  }
  v42 = xpc_array_create(0, 0);
  xpc_dictionary_set_value(xdict, "fsDeletionURIs", v42);
  xarray = xpc_array_create(0, 0);
  xpc_dictionary_set_value(xdict, "fsDeletionPaths", xarray);
  v85 = xpc_array_create(0, 0);
  xpc_dictionary_set_value(xdict, "thumbnailIdentifiers", v85);
  v84 = xpc_array_create(0, 0);
  xpc_dictionary_set_value(xdict, "thumbnailIndexes", v84);
  v43 = xpc_array_create(0, 0);
  xpc_dictionary_set_value(xdict, "thumbnailUUIDs", v43);
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  obj = v78->_deletionInfos;
  v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v94, v116, 16);
  if (v87)
  {
    v80 = 0;
    v82 = *(_QWORD *)v95;
    v83 = v43;
    do
    {
      for (m = 0; m != v87; ++m)
      {
        if (*(_QWORD *)v95 != v82)
          objc_enumerationMutation(obj);
        v45 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * m);
        v89 = MEMORY[0x19AEC1554]();
        objc_msgSend(v45, "objectIDURI");
        v46 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
        v47 = CFURLGetBytes(v46, buf, 1024);
        if (!v47)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, v78, CFSTR("PLDelayedFiledSystemDeletions.m"), 296, CFSTR("Unable to encode object URI."));

        }
        v48 = v42;
        xpc_array_set_data(v42, 0xFFFFFFFFFFFFFFFFLL, buf, v47);
        objc_msgSend(v45, "fileURLs");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = xpc_array_create(0, 0);
        xpc_array_set_value(xarray, 0xFFFFFFFFFFFFFFFFLL, v50);
        v92 = 0u;
        v93 = 0u;
        v90 = 0u;
        v91 = 0u;
        v51 = v49;
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v90, v113, 16);
        if (v52)
        {
          v53 = v52;
          v54 = *(_QWORD *)v91;
          do
          {
            for (n = 0; n != v53; ++n)
            {
              if (*(_QWORD *)v91 != v54)
                objc_enumerationMutation(v51);
              objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * n), "path");
              v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              xpc_array_set_string(v50, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(v56, "fileSystemRepresentation"));

            }
            v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v90, v113, 16);
          }
          while (v53);
        }

        xpc_array_set_uint64(v84, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(v45, "thumbnailIndex"));
        objc_msgSend(v45, "thumbnailIdentifier");
        v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v58 = objc_msgSend(v57, "UTF8String");

        if (v58)
          v59 = (const char *)v58;
        else
          v59 = "";
        xpc_array_set_string(v85, 0xFFFFFFFFFFFFFFFFLL, v59);
        objc_msgSend(v45, "uuid");
        v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v61 = objc_msgSend(v60, "UTF8String");

        if (v61)
          v62 = (const char *)v61;
        else
          v62 = "";
        v43 = v83;
        xpc_array_set_string(v83, 0xFFFFFFFFFFFFFFFFLL, v62);
        if (objc_msgSend(v45, "thumbnailIndex") == -1)
        {
          v42 = v48;
          v63 = (void *)v89;
        }
        else
        {
          v63 = (void *)v89;
          if (objc_msgSend(v45, "thumbnailIndex") == 0x7FFFFFFFFFFFFFFFLL)
          {
            v42 = v48;
          }
          else
          {
            v42 = v48;
            if (objc_msgSend(v45, "timestamp") > v80)
              v80 = objc_msgSend(v45, "timestamp");
          }
        }

        objc_autoreleasePoolPop(v63);
      }
      v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v94, v116, 16);
    }
    while (v87);
  }
  else
  {
    v80 = 0;
  }

  xpc_dictionary_set_uint64(xdict, "deletionTimestamp", v80);
  count = xpc_array_get_count(v42);
  if (count != xpc_array_get_count(xarray))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", a2, v78, CFSTR("PLDelayedFiledSystemDeletions.m"), 331, CFSTR("len(assetURIs) != len(fileURLsList) ?"));

  }
  v66 = xpc_array_get_count(v42);
  if (v66 != xpc_array_get_count(v84))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, v78, CFSTR("PLDelayedFiledSystemDeletions.m"), 333, CFSTR("len(assetURIs) != len(thumbnailIndexes) ?"));

  }
  v67 = xpc_array_get_count(v42);
  if (v67 != xpc_array_get_count(v85))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a2, v78, CFSTR("PLDelayedFiledSystemDeletions.m"), 335, CFSTR("len(assetURIs) != len(thumbnailIdentifiers) ?"));

  }
  v68 = xpc_array_get_count(v42);
  if (v68 != xpc_array_get_count(v43))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", a2, v78, CFSTR("PLDelayedFiledSystemDeletions.m"), 337, CFSTR("len(assetURIs) != len(thumbnailUUIDs) ?"));

  }
}

- (void)deleteAllRemainingFilesAndThumbnailsWithPhotoLibrary:(id)a3
{
  id v5;
  NSObject *v6;
  int v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  PLDelayedFiledSystemDeletions *v22;
  _QWORD block[5];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  PLDelayedFiledSystemDeletions *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDelayedFiledSystemDeletions.m"), 356, CFSTR("deleteAllRemainingFilesAndThumbnails must only be called by assetsd"));

  }
  if (-[NSMutableArray count](self->_deletionInfos, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLDelayedFiledSystemDeletions deleteAllRemainingFilesAndThumbnailsWithPhotoLibrary:]");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[NSMutableArray count](self->_deletionInfos, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v34) = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Processing %d asset file system deletions", buf, 8u);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v22 = self;
    v8 = self->_deletionInfos;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          PLBackendGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v13, "uuid");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v34 = v15;
            _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Deleting asset file resources and thumbs for %{public}@", buf, 0xCu);

          }
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v10);
    }

    if (!v5)
    {
      +[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __86__PLDelayedFiledSystemDeletions_deleteAllRemainingFilesAndThumbnailsWithPhotoLibrary___block_invoke;
    v26[3] = &unk_1E3677C18;
    v17 = v5;
    v27 = v17;
    v28 = v22;
    objc_msgSend(v17, "performBlockAndWait:completionHandler:", v26, 0);
    +[PLDelayedFiledSystemDeletions _filesystemDeletionQueue](PLDelayedFiledSystemDeletions, "_filesystemDeletionQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = v16;
    block[1] = 3221225472;
    block[2] = __86__PLDelayedFiledSystemDeletions_deleteAllRemainingFilesAndThumbnailsWithPhotoLibrary___block_invoke_2;
    block[3] = &unk_1E3677530;
    block[4] = v22;
    v5 = v17;
    v24 = v5;
    v25 = v21;
    v19 = v21;
    dispatch_sync(v18, block);

  }
}

- (PLDelayedFiledSystemDeletions)initWithFilesystemDeletionInfos:(id)a3
{
  id v5;
  PLDelayedFiledSystemDeletions *v6;
  PLDelayedFiledSystemDeletions *v7;

  v5 = a3;
  v6 = -[PLDelayedFiledSystemDeletions init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_deletionInfos, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletionInfos, 0);
}

void __86__PLDelayedFiledSystemDeletions_deleteAllRemainingFilesAndThumbnailsWithPhotoLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "thumbnailManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v13 = a1;
  obj = *(id *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v7, "thumbnailIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v7, "thumbnailIndex");
        if ((~v10 & 0x7FFFFFFFFFFFFFFFLL) != 0)
        {
          objc_msgSend(v7, "uuid");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "deleteThumbnailsWithIdentifier:orIndex:uuid:", v9, v10, v12);

          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLThumbnailIndexes recycleThumbnailIndexes:inLibrary:timestamp:](PLThumbnailIndexes, "recycleThumbnailIndexes:inLibrary:timestamp:", v11, *(_QWORD *)(v13 + 32), objc_msgSend(v7, "timestamp"));
        }
        else
        {
          if (!objc_msgSend(v9, "length"))
            goto LABEL_11;
          objc_msgSend(v7, "uuid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "deleteThumbnailsWithIdentifier:orIndex:uuid:", v9, v10, v11);
        }

LABEL_11:
        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

void __86__PLDelayedFiledSystemDeletions_deleteAllRemainingFilesAndThumbnailsWithPhotoLibrary___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  char *v11;
  char *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int *v24;
  char *v25;
  char v26;
  char *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  os_log_type_t v32;
  const char *v33;
  uint32_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  char *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  char *v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v37 = a1;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v52;
    v43 = *MEMORY[0x1E0CB3388];
    v42 = *MEMORY[0x1E0CB2FE0];
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v52 != v39)
          objc_enumerationMutation(obj);
        v41 = v3;
        v4 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v3);
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        objc_msgSend(v4, "fileURLs", v37);
        v44 = (id)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v48;
          do
          {
            v8 = 0;
            do
            {
              if (*(_QWORD *)v48 != v7)
                objc_enumerationMutation(v44);
              v9 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v8);
              v46 = 0;
              v10 = objc_msgSend(v2, "removeItemAtURL:error:", v9, &v46);
              v11 = (char *)v46;
              v12 = v11;
              if ((v10 & 1) != 0)
              {
                PLBackendGetLog();
                v13 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v9, "path");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v56 = v14;
                  _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "Deleted %@", buf, 0xCu);

                }
LABEL_24:
                v27 = v12;
                goto LABEL_25;
              }
              objc_msgSend(v11, "userInfo");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectForKey:", v43);
              v13 = objc_claimAutoreleasedReturnValue();

              if (-[NSObject code](v13, "code") == 2)
              {
                -[NSObject domain](v13, "domain");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "isEqualToString:", v42);

                if ((v17 & 1) != 0)
                  goto LABEL_24;
              }
              PLBackendGetLog();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v9, "path");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v56 = v19;
                v57 = 2112;
                v58 = v12;
                _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Unable to unlink \"%@\": %@", buf, 0x16u);

              }
              v20 = (void *)MEMORY[0x1E0D73208];
              objc_msgSend(v9, "path");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v20) = objc_msgSend(v20, "stripImmutableFlagIfNecessaryFromFileAtPath:", v21);

              if (!(_DWORD)v20)
                goto LABEL_24;
              PLBackendGetLog();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v9, "path");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = __error();
                v25 = strerror(*v24);
                *(_DWORD *)buf = 138412546;
                v56 = v23;
                v57 = 2082;
                v58 = v25;
                _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Retrying after clearing IMMUTABLE flag from %@ after failing to unlink file (%{public}s).", buf, 0x16u);

              }
              v45 = v12;
              v26 = objc_msgSend(v2, "removeItemAtURL:error:", v9, &v45);
              v27 = v45;

              PLBackendGetLog();
              v28 = objc_claimAutoreleasedReturnValue();
              v29 = v28;
              if ((v26 & 1) != 0)
              {
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v9, "path");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v56 = v30;
                  v31 = v29;
                  v32 = OS_LOG_TYPE_DEFAULT;
                  v33 = "Successfully unlinked \"%@\" after clearing IMMUTABLE flag";
                  v34 = 12;
LABEL_29:
                  _os_log_impl(&dword_199541000, v31, v32, v33, buf, v34);

                }
              }
              else if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v9, "path");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v56 = v30;
                v57 = 2112;
                v58 = v27;
                v31 = v29;
                v32 = OS_LOG_TYPE_ERROR;
                v33 = "Unable to unlink \"%@\": after clearing IMMUTABLE flag (%@)";
                v34 = 22;
                goto LABEL_29;
              }

LABEL_25:
              ++v8;
            }
            while (v6 != v8);
            v35 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
            v6 = v35;
          }
          while (v35);
        }

        v3 = v41 + 1;
      }
      while (v41 + 1 != v40);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    }
    while (v40);
  }

  objc_msgSend(*(id *)(v37 + 40), "libraryBundle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "touch");

  objc_msgSend(*(id *)(v37 + 48), "stillAlive");
}

void __73__PLDelayedFiledSystemDeletions_appendToXPCMessage_managedObjectContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0C97B48];
  v6 = a3;
  v7 = a2;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("directory = %@ AND filename IN %@"), v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPredicate:", v9);
  objc_msgSend(*(id *)(a1 + 32), "executeFetchRequest:error:", v11, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v10);

}

+ (id)_filesystemDeletionQueue
{
  pl_dispatch_once();
  return (id)_filesystemDeletionQueue_filesystemDeletionQueue;
}

+ (void)waitForAllDelayedDeletionsToFinish
{
  NSObject *v2;

  objc_msgSend(a1, "_filesystemDeletionQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v2, &__block_literal_global_121_47357);

}

+ (void)appendDescriptionForEvent:(id)a3 toComponents:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  size_t count;
  void *v12;
  id v13;
  void *v14;
  size_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  xpc_object_t xdict;
  _QWORD applier[4];
  id v22;
  id v23;
  SEL v24;
  id v25;

  xdict = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x19AEC1554]();
  xpc_dictionary_get_value(xdict, "fsDeletionURIs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(xdict, "fsDeletionPaths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    count = xpc_array_get_count(v9);
    if (count != xpc_array_get_count(v10))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLDelayedFiledSystemDeletions appendDescriptionForEvent:toComponents:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("PLDelayedFiledSystemDeletions.m"), 430, CFSTR("len(xpcAssetURIs) != len(xpcFileURLsList) ?"));

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __72__PLDelayedFiledSystemDeletions_appendDescriptionForEvent_toComponents___block_invoke;
    applier[3] = &unk_1E366AEB8;
    v24 = a2;
    v25 = a1;
    v22 = v10;
    v23 = v12;
    v13 = v12;
    xpc_array_apply(v9, applier);
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = xpc_array_get_count(v9);
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%zu delayed deletes: {%@}"), v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v17);

  }
  objc_autoreleasePoolPop(v8);

}

+ (id)deletionsFromChangeHubEvent:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t uint64;
  uint64_t v12;
  size_t count;
  size_t v14;
  size_t v15;
  size_t v16;
  size_t v17;
  void *v18;
  uint64_t v19;
  SEL v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, size_t, void *);
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  SEL v41;
  id v42;
  uint64_t v43;

  v5 = a3;
  xpc_dictionary_get_value(v5, "fsDeletionURIs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v5, "fsDeletionPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v5, "thumbnailIndexes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v5, "thumbnailIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v5, "thumbnailUUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64 = xpc_dictionary_get_uint64(v5, "deletionTimestamp");
  if (v6)
  {
    v12 = uint64;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLDelayedFiledSystemDeletions.m"), 474, CFSTR("fileURLsList is out of sync?"));

    }
    count = xpc_array_get_count(v6);
    if (count != xpc_array_get_count(v7))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLDelayedFiledSystemDeletions.m"), 476, CFSTR("len(xpcAssetURIs) != len(xpcFileURLsList) ?"));

    }
    v14 = xpc_array_get_count(v6);
    if (v14 != xpc_array_get_count(v8))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLDelayedFiledSystemDeletions.m"), 478, CFSTR("len(xpcAssetURIs) != len(xpcThumbnailIndexes) ?"));

    }
    v15 = xpc_array_get_count(v6);
    if (v15 != xpc_array_get_count(v8))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLDelayedFiledSystemDeletions.m"), 480, CFSTR("len(xpcAssetURIs) != len(xpcThumbnailIndexes) ?"));

    }
    v16 = xpc_array_get_count(v6);
    if (v16 != xpc_array_get_count(v9))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLDelayedFiledSystemDeletions.m"), 482, CFSTR("len(xpcAssetURIs) != len(xpcThumbnailIdentifiers) ?"));

    }
    v17 = xpc_array_get_count(v6);
    if (v17 != xpc_array_get_count(v10))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLDelayedFiledSystemDeletions.m"), 484, CFSTR("len(xpcAssetURIs) != len(xpcThumbnailUUIDs) ?"));

    }
    v18 = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = a2;
    v21 = (void *)v19;
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __61__PLDelayedFiledSystemDeletions_deletionsFromChangeHubEvent___block_invoke;
    v35 = &unk_1E366AEE0;
    v41 = v20;
    v42 = a1;
    v36 = v7;
    v37 = v8;
    v38 = v9;
    v43 = v12;
    v39 = v10;
    v40 = v21;
    v22 = v21;
    xpc_array_apply(v6, &v32);
    v23 = objc_alloc((Class)a1);
    v24 = (void *)objc_msgSend(v23, "initWithFilesystemDeletionInfos:", v22, v32, v33, v34, v35);

    objc_autoreleasePoolPop(v18);
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

uint64_t __61__PLDelayedFiledSystemDeletions_deletionsFromChangeHubEvent___block_invoke(uint64_t a1, size_t a2, void *a3)
{
  id v5;
  void *v6;
  const UInt8 *bytes_ptr;
  size_t length;
  CFURLRef v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t uint64;
  void *v14;
  void *v15;
  PLFilesystemDeletionInfo *v16;
  void *v18;
  _QWORD applier[4];
  id v20;

  v5 = a3;
  v6 = (void *)MEMORY[0x19AEC1554]();
  bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(v5);
  length = xpc_data_get_length(v5);
  v9 = CFURLCreateWithBytes(0, bytes_ptr, length, 0x8000100u, 0);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), CFSTR("PLDelayedFiledSystemDeletions.m"), 492, CFSTR("Invalid asset URI."));

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_array_get_value(*(xpc_object_t *)(a1 + 32), a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = __61__PLDelayedFiledSystemDeletions_deletionsFromChangeHubEvent___block_invoke_2;
  applier[3] = &unk_1E366B370;
  v12 = v10;
  v20 = v12;
  xpc_array_apply(v11, applier);
  uint64 = xpc_array_get_uint64(*(xpc_object_t *)(a1 + 40), a2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_array_get_string(*(xpc_object_t *)(a1 + 48), a2));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_array_get_string(*(xpc_object_t *)(a1 + 56), a2));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PLFilesystemDeletionInfo initWithObjectIDURI:directory:filename:fileURLs:thumbnailIndex:thumbnailIdentifier:uuid:timestamp:]([PLFilesystemDeletionInfo alloc], "initWithObjectIDURI:directory:filename:fileURLs:thumbnailIndex:thumbnailIdentifier:uuid:timestamp:", v9, 0, 0, v12, uint64, v14, v15, *(_QWORD *)(a1 + 88));
  if (v16)
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v16);
  CFRelease(v9);

  objc_autoreleasePoolPop(v6);
  return 1;
}

uint64_t __61__PLDelayedFiledSystemDeletions_deletionsFromChangeHubEvent___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  const char *string_ptr;
  size_t length;
  CFURLRef v7;

  v4 = a3;
  string_ptr = xpc_string_get_string_ptr(v4);
  length = xpc_string_get_length(v4);

  v7 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)string_ptr, length, 0);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  CFRelease(v7);
  return 1;
}

uint64_t __72__PLDelayedFiledSystemDeletions_appendDescriptionForEvent_toComponents___block_invoke(uint64_t a1, size_t a2, void *a3)
{
  id v5;
  const UInt8 *bytes_ptr;
  size_t length;
  CFURLRef v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  uint64_t applier;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t, void *);
  void *v24;
  id v25;

  v5 = a3;
  bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(v5);
  length = xpc_data_get_length(v5);

  v8 = CFURLCreateWithBytes(0, bytes_ptr, length, 0x8000100u, 0);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), CFSTR("PLDelayedFiledSystemDeletions.m"), 435, CFSTR("Invalid asset URI."));

  }
  -[__CFURL pathComponents](v8, "pathComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "count") >= 3)
  {
    objc_msgSend(v9, "subarrayWithRange:", objc_msgSend(v9, "count") - 2, 2);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v8);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_array_get_value(*(xpc_object_t *)(a1 + 32), a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  applier = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __72__PLDelayedFiledSystemDeletions_appendDescriptionForEvent_toComponents___block_invoke_2;
  v24 = &unk_1E366B370;
  v25 = v12;
  v14 = v12;
  xpc_array_apply(v13, &applier);

  v15 = *(void **)(a1 + 40);
  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ (%zu): [%@]"), v11, a2, v17, applier, v22, v23, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v18);

  return 1;
}

uint64_t __72__PLDelayedFiledSystemDeletions_appendDescriptionForEvent_toComponents___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  const char *string_ptr;
  size_t length;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0C99D50];
  v5 = a3;
  string_ptr = xpc_string_get_string_ptr(v5);
  length = xpc_string_get_length(v5);

  objc_msgSend(v4, "dataWithBytes:length:", string_ptr, length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

  return 1;
}

void __57__PLDelayedFiledSystemDeletions__filesystemDeletionQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("PLDelayedFileSystemDeletions", v2);
  v1 = (void *)_filesystemDeletionQueue_filesystemDeletionQueue;
  _filesystemDeletionQueue_filesystemDeletionQueue = (uint64_t)v0;

}

@end
