@implementation PGSearchComputationCache

- (PGSearchComputationCache)initWithPersistentStoreURL:(id)a3 photoLibrary:(id)a4
{
  id v7;
  id v8;
  PGSearchComputationCache *v9;
  PGSearchComputationCache *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSMutableDictionary *v27;
  NSMutableDictionary *momentAssetPairsByNodeUUID;
  void *v29;
  void *v30;
  NSMutableDictionary *v31;
  NSMutableDictionary *curationInformationByNodeUUID;
  void *v33;
  void *v34;
  NSMutableDictionary *v35;
  NSMutableDictionary *locationInformationByNodeUUID;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  objc_super v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v43.receiver = self;
  v43.super_class = (Class)PGSearchComputationCache;
  v9 = -[PGSearchComputationCache init](&v43, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a4);
    objc_storeStrong((id *)&v10->_persistentStoreURL, a3);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v10->_persistentStoreURL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0x1E0C99000uLL;
    if (v11)
    {
      v40 = v8;
      v41 = v7;
      v39 = (void *)MEMORY[0x1E0CB3710];
      v13 = (void *)MEMORY[0x1E0C99E60];
      v14 = objc_opt_class();
      v15 = objc_opt_class();
      v16 = objc_opt_class();
      v17 = objc_opt_class();
      v18 = objc_opt_class();
      v19 = objc_opt_class();
      v38 = objc_opt_class();
      objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, v18, v19, v38, objc_opt_class(), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      objc_msgSend(v39, "unarchivedObjectOfClasses:fromData:error:", v20, v11, &v42);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v42;

      if (v22)
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "loggingConnection");
        v24 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v22;
          _os_log_error_impl(&dword_1CA237000, v24, OS_LOG_TYPE_ERROR, "Error loading the search computation cache error: %@", buf, 0xCu);
        }

      }
      v8 = v40;
      v7 = v41;
      v12 = 0x1E0C99000;
    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("thumbnails"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v27 = v25;
    }
    else
    {
      objc_msgSend(*(id *)(v12 + 3592), "dictionary");
      v27 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }
    momentAssetPairsByNodeUUID = v10->_momentAssetPairsByNodeUUID;
    v10->_momentAssetPairsByNodeUUID = v27;

    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("curations"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      v31 = v29;
    }
    else
    {
      objc_msgSend(*(id *)(v12 + 3592), "dictionary");
      v31 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }
    curationInformationByNodeUUID = v10->_curationInformationByNodeUUID;
    v10->_curationInformationByNodeUUID = v31;

    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("locations"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
    {
      v35 = v33;
    }
    else
    {
      objc_msgSend(*(id *)(v12 + 3592), "dictionary");
      v35 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }
    locationInformationByNodeUUID = v10->_locationInformationByNodeUUID;
    v10->_locationInformationByNodeUUID = v35;

  }
  return v10;
}

- (void)save
{
  __int128 v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  _QWORD v12[3];
  __int128 v13;
  NSMutableDictionary *locationInformationByNodeUUID;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)&self->_momentAssetPairsByNodeUUID;
  v12[0] = CFSTR("thumbnails");
  v12[1] = CFSTR("curations");
  v13 = v3;
  v12[2] = CFSTR("locations");
  locationInformationByNodeUUID = self->_locationInformationByNodeUUID;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, v12, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v5)
  {
    objc_msgSend(v5, "writeToURL:atomically:", self->_persistentStoreURL, 1);
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "Error writing zero keyword cache error: %@", buf, 0xCu);
    }

  }
}

- (void)invalidateCache
{
  -[NSMutableDictionary removeAllObjects](self->_momentAssetPairsByNodeUUID, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_curationInformationByNodeUUID, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_locationInformationByNodeUUID, "removeAllObjects");
}

- (void)setKeyAssetLocalIdentifier:(id)a3 forNodeIdentifier:(id)a4 withAssociatedMomentUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  PGSearchThumbnailMomentAssetPairUUID *v13;
  uint8_t v14[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_momentAssetPairsByNodeUUID, "objectForKeyedSubscript:", v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_momentAssetPairsByNodeUUID, "setObject:forKeyedSubscript:", v11, v9);
    }
    objc_msgSend(MEMORY[0x1E0CD1390], "uuidFromLocalIdentifier:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PGSearchThumbnailMomentAssetPairUUID initWithAssetUUID:momentUUID:]([PGSearchThumbnailMomentAssetPairUUID alloc], "initWithAssetUUID:momentUUID:", v12, v10);
    objc_msgSend(v11, "addObject:", v13);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v14 = 0;
    _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Got nil uniqueNodeUUID to register key asset", v14, 2u);
  }

}

- (id)keyAssetLocalIdentifierForNodeIdentifier:(id)a3 withAssociatedMomentUUIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v13[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_momentAssetPairsByNodeUUID, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (-[PGSearchComputationCache momentAssetPairs:areValidWithAssociatedMomentUUIDs:](self, "momentAssetPairs:areValidWithAssociatedMomentUUIDs:", v8, v7))
      {
        objc_msgSend(v8, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "assetUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CD1390], "localIdentifierWithUUID:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
        goto LABEL_11;
      }
      -[NSMutableDictionary removeObjectForKey:](self->_momentAssetPairsByNodeUUID, "removeObjectForKey:", v6);
    }
    v11 = 0;
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v13 = 0;
    _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Got nil uniqueNodeUUID to register key asset", v13, 2u);
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)momentAssetPairs:(id)a3 areValidWithAssociatedMomentUUIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  PGSearchComputationCache *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") && objc_msgSend(v7, "count"))
  {
    v25 = self;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v14, "momentUUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v7, "containsObject:", v15);

          if (v16)
          {
            objc_msgSend(v14, "assetUUID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v17);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHPhotoLibrary librarySpecificFetchOptions](v25->_photoLibrary, "librarySpecificFetchOptions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setInternalPredicate:", v18);
      v30 = *MEMORY[0x1E0CD19C0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setFetchPropertySets:", v20);

      objc_msgSend(v19, "setShouldPrefetchCount:", 1);
      objc_msgSend(v19, "setIncludeAssetSourceTypes:", 5);
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");
      v23 = v22 == objc_msgSend(v8, "count");

    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)setCurationInformation:(id)a3 forNode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (objc_msgSend(v7, "name"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_curationInformationByNodeUUID, "setObject:forKeyedSubscript:", v6, v8);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = v7;
    _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot get unique UUID for node %@", (uint8_t *)&v9, 0xCu);
  }

}

- (id)curationInformationForNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v4, "name");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_curationInformationByNodeUUID, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setLocationInformation:(id)a3 forLocationNode:(id)a4 locationMask:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 || (objc_msgSend(v9, "name"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_locationInformationByNodeUUID, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_locationInformationByNodeUUID, "setObject:forKeyedSubscript:", v11, v10);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v12);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = 138412290;
    v14 = v9;
    _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot get unique UUID for node %@", (uint8_t *)&v13, 0xCu);
  }

}

- (id)locationInformationForLocationNode:(id)a3 locationMask:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_msgSend(v6, "name"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_locationInformationByNodeUUID, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot get unique UUID for node %@", (uint8_t *)&v12, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

- (NSURL)persistentStoreURL
{
  return self->_persistentStoreURL;
}

- (NSMutableDictionary)momentAssetPairsByNodeUUID
{
  return self->_momentAssetPairsByNodeUUID;
}

- (NSMutableDictionary)curationInformationByNodeUUID
{
  return self->_curationInformationByNodeUUID;
}

- (NSMutableDictionary)locationInformationByNodeUUID
{
  return self->_locationInformationByNodeUUID;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_locationInformationByNodeUUID, 0);
  objc_storeStrong((id *)&self->_curationInformationByNodeUUID, 0);
  objc_storeStrong((id *)&self->_momentAssetPairsByNodeUUID, 0);
  objc_storeStrong((id *)&self->_persistentStoreURL, 0);
}

+ (id)persistentStoreURLWithManager:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "graphPersistenceParentDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("PGSearchComputationCache.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
