@implementation PLRelationshipOrderKeyManager

- (PLRelationshipOrderKeyManager)init
{
  PLRelationshipOrderKeyManager *v2;
  id v3;

  v2 = self;
  PLMethodNotImplementedException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (PLRelationshipOrderKeyManager)initWithGenerateContextBlock:(id)a3
{
  id v5;
  PLRelationshipOrderKeyManager *v6;
  PLRelationshipOrderKeyManager *v7;
  uint64_t v8;
  id generateContextBlock;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLRelationshipOrderKeyManager.m"), 220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("generateContextBlock"));

  }
  v12.receiver = self;
  v12.super_class = (Class)PLRelationshipOrderKeyManager;
  v6 = -[PLRelationshipOrderKeyManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_inWriteStashedLocationMode = 0;
    v8 = MEMORY[0x19AEC174C](v5);
    generateContextBlock = v7->_generateContextBlock;
    v7->_generateContextBlock = (id)v8;

  }
  return v7;
}

- (id)_locked_locationsCache
{
  NSMutableDictionary *locationsCache;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  os_unfair_lock_assert_owner(&self->_lock);
  locationsCache = self->_locationsCache;
  if (!locationsCache)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = self->_locationsCache;
    self->_locationsCache = v4;

    locationsCache = self->_locationsCache;
  }
  return locationsCache;
}

- (id)_locked_enqueuedFolderAlbumsOrderValueUpdates
{
  NSMutableDictionary *enqueuedFolderAlbumsOrderValueUpdates;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  os_unfair_lock_assert_owner(&self->_lock);
  enqueuedFolderAlbumsOrderValueUpdates = self->_enqueuedFolderAlbumsOrderValueUpdates;
  if (!enqueuedFolderAlbumsOrderValueUpdates)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = self->_enqueuedFolderAlbumsOrderValueUpdates;
    self->_enqueuedFolderAlbumsOrderValueUpdates = v4;

    enqueuedFolderAlbumsOrderValueUpdates = self->_enqueuedFolderAlbumsOrderValueUpdates;
  }
  return enqueuedFolderAlbumsOrderValueUpdates;
}

- (id)_locked_enqueuedAlbumAssetsOrderValueUpdates
{
  NSMutableDictionary *enqueuedAlbumAssetsOrderValueUpdates;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  os_unfair_lock_assert_owner(&self->_lock);
  enqueuedAlbumAssetsOrderValueUpdates = self->_enqueuedAlbumAssetsOrderValueUpdates;
  if (!enqueuedAlbumAssetsOrderValueUpdates)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = self->_enqueuedAlbumAssetsOrderValueUpdates;
    self->_enqueuedAlbumAssetsOrderValueUpdates = v4;

    enqueuedAlbumAssetsOrderValueUpdates = self->_enqueuedAlbumAssetsOrderValueUpdates;
  }
  return enqueuedAlbumAssetsOrderValueUpdates;
}

- (void)_updateOrderOfChildrenInParent:(id)a3 usingTransientOrders:(id)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  int v40;
  NSObject *v41;
  void *v42;
  void *v43;
  _BOOL8 v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  const char *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  const char *v69;
  NSObject *v70;
  void *v71;
  unint64_t v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  __int128 v79;
  id v80;
  PLRelationshipOrderKeyManager *v81;
  void *v82;
  id obj;
  unint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  unint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[5];
  uint8_t v109[128];
  uint8_t buf[4];
  void *v111;
  __int16 v112;
  void *v113;
  __int16 v114;
  id v115;
  __int16 v116;
  unint64_t v117;
  __int16 v118;
  uint64_t v119;
  _BYTE v120[128];
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v80 = a3;
  v108[0] = MEMORY[0x1E0C809B0];
  v108[1] = 3221225472;
  v108[2] = __85__PLRelationshipOrderKeyManager__updateOrderOfChildrenInParent_usingTransientOrders___block_invoke;
  v108[3] = &unk_1E366C6C0;
  v108[4] = self;
  objc_msgSend(a4, "sortedArrayUsingComparator:", v108);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v111 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "Final orders array %@", buf, 0xCu);
    }

  }
  objc_msgSend(v80, "managedObjectContext");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "objectID");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "mutableAssets");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v104, v121, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v105;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v105 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * i), "objectID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v104, v121, 16);
    }
    while (v11);
  }
  v82 = v8;

  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  obj = v9;
  v15 = v85;
  v16 = v86;
  v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v120, 16);
  if (v88)
  {
    v87 = *(_QWORD *)v101;
    *(_QWORD *)&v17 = 138412802;
    v79 = v17;
    v81 = self;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v101 != v87)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v18);
        objc_msgSend(v19, "objectID", v79);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectWithID:", v20);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = objc_msgSend(v16, "indexOfObject:");
        v21 = objc_msgSend(v19, "orderValue");
        if (v21)
        {
          v22 = v21;
          v99 = 0;
          v23 = -[PLRelationshipOrderKeyManager findIndexForAssetWithID:newOrderValue:inAlbumWithID:hasOrderValueConflictWithAssetID:inContext:](self, "findIndexForAssetWithID:newOrderValue:inAlbumWithID:hasOrderValueConflictWithAssetID:inContext:", v20, v21, v89, &v99, v15);
          v24 = v99;
          v25 = objc_msgSend(v16, "count");
          v26 = v23;
          v90 = v23;
          if (v23 > v25)
          {
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v22);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v86, "count");
                *(_DWORD *)buf = 138413314;
                v111 = v28;
                v112 = 2112;
                v113 = v20;
                v114 = 2112;
                v115 = v89;
                v116 = 2048;
                v117 = v90;
                v118 = 2048;
                v119 = v29;
                _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "Asset index based on order value is too large for mutableAssets: order value %@ for %@ on %@ target index = %ld, count = %ld", buf, 0x34u);

                v16 = v86;
              }

            }
            v26 = objc_msgSend(v16, "count") - (v91 != 0x7FFFFFFFFFFFFFFFLL);
            v15 = v85;
          }
          if (!v24)
          {
            v40 = 1;
            goto LABEL_104;
          }
          v84 = v26;
          if ((objc_msgSend(v82, "containsObject:", v24) & 1) != 0)
          {
            v97 = 0u;
            v98 = 0u;
            v95 = 0u;
            v96 = 0u;
            v30 = obj;
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
            if (v31)
            {
              v32 = v31;
              v33 = *(_QWORD *)v96;
LABEL_28:
              v34 = 0;
              while (1)
              {
                if (*(_QWORD *)v96 != v33)
                  objc_enumerationMutation(v30);
                v35 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v34);
                objc_msgSend(v35, "objectID");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v36, "isEqual:", v24))
                {
                  v37 = objc_msgSend(v35, "orderValue");

                  if (v37 == v22)
                  {
                    v15 = v85;
                    objc_msgSend(v85, "existingObjectWithID:error:", v24, 0);
                    v61 = objc_claimAutoreleasedReturnValue();
                    self = v81;
                    -[PLRelationshipOrderKeyManager _setConflictDetected:](v81, "_setConflictDetected:", 1);
                    if (!*MEMORY[0x1E0D115D0])
                    {
                      __CPLAssetsdOSLogDomain();
                      v62 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v22);
                        v63 = v61;
                        v64 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138413058;
                        v111 = v64;
                        v112 = 2112;
                        v113 = v20;
                        v114 = 2112;
                        v115 = v89;
                        v116 = 2112;
                        v117 = (unint64_t)v24;
                        _os_log_impl(&dword_199541000, v62, OS_LOG_TYPE_DEFAULT, "Asset album order value %@ for %@ on %@ conflicts with %@, adjusting, since it's conflicting with the incoming order", buf, 0x2Au);

                        v61 = v63;
                      }

                    }
                    v16 = v86;
                    if (v61)
                      goto LABEL_49;
LABEL_69:
                    v40 = 1;
LABEL_103:
                    v26 = v84;
LABEL_104:
                    if (v91 == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      objc_msgSend(v16, "insertObject:atIndex:", v92, v26);
                      if (!v40)
                        goto LABEL_110;
                    }
                    else if ((v40 & 1) == 0)
                    {
                      v46 = v26;
LABEL_107:
                      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v91, v26);
                      v77 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v16, "moveObjectsAtIndexes:toIndex:", v77, v46);

                      goto LABEL_110;
                    }
                    -[PLRelationshipOrderKeyManager stashAlbumAssetsLocationValue:forAssetWithID:inAlbumWithID:atIndex:](self, "stashAlbumAssetsLocationValue:forAssetWithID:inAlbumWithID:atIndex:", v22, v20, v89, v90);
                    goto LABEL_110;
                  }
                }
                else
                {

                }
                if (v32 == ++v34)
                {
                  v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
                  if (v32)
                    goto LABEL_28;
                  break;
                }
              }
            }

            v16 = v86;
            if (*MEMORY[0x1E0D115D0])
            {
              v40 = 1;
              self = v81;
              v15 = v85;
              goto LABEL_103;
            }
            __CPLAssetsdOSLogDomain();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v22);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v111 = v39;
              v112 = 2112;
              v113 = v20;
              v114 = 2112;
              v115 = v89;
              v116 = 2112;
              v117 = (unint64_t)v24;
              _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_DEFAULT, "Asset album order value %@ for %@ on %@ conflicts with %@, ignoring, since it will be reordered", buf, 0x2Au);

            }
            v40 = 1;
            self = v81;
            v15 = v85;
LABEL_102:

            goto LABEL_103;
          }
          objc_msgSend(v15, "existingObjectWithID:error:", v24, 0);
          v61 = objc_claimAutoreleasedReturnValue();
          -[PLRelationshipOrderKeyManager _setConflictDetected:](self, "_setConflictDetected:", 1);
          if (!v61)
            goto LABEL_69;
LABEL_49:
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v22);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v111 = v48;
              v112 = 2112;
              v113 = v20;
              v114 = 2112;
              v115 = v89;
              v116 = 2112;
              v117 = (unint64_t)v24;
              _os_log_impl(&dword_199541000, v47, OS_LOG_TYPE_DEFAULT, "Asset album order value %@ for %@ on %@ conflicts with %@, adjusting", buf, 0x2Au);

            }
          }
          v49 = v61;
          -[NSObject dateCreated](v61, "dateCreated");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "dateCreated");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v50, "compare:", v51);

          if (!v52)
          {
            -[NSObject originalFilename](v49, "originalFilename");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "originalFilename");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v53, "compare:", v54);

          }
          v93 = 0;
          v94 = 0;
          +[PLManagedAlbum childKeyForOrdering](PLManagedAlbum, "childKeyForOrdering");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLRelationshipOrderKeyManager getConflictResolutionOrderValuesForRelationship:onObjectWithID:atIndex:intoLower:higher:inContext:](self, "getConflictResolutionOrderValuesForRelationship:onObjectWithID:atIndex:intoLower:higher:inContext:", v55, v89, v90, &v94, &v93, v15);

          v38 = v49;
          if (v52 == -1)
          {
            v16 = v86;
            if (v94)
            {
              -[PLRelationshipOrderKeyManager stashAlbumAssetsLocationValue:forAssetWithID:inAlbumWithID:atIndex:](self, "stashAlbumAssetsLocationValue:forAssetWithID:inAlbumWithID:atIndex:", v94, v24, v89, v90);
              if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v65 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v22);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v94);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v79;
                  v111 = v66;
                  v112 = 2112;
                  v113 = v67;
                  v114 = 2112;
                  v115 = v24;
                  v68 = v65;
                  v69 = "Conflicting existing asset album order value (ascending) updated from %@ to %@ for %@";
                  goto LABEL_78;
                }
LABEL_79:

              }
LABEL_80:
              ++v90;
              v40 = 1;
              goto LABEL_102;
            }
            if (v93)
            {
              if (*MEMORY[0x1E0D115D0])
              {
                v22 = v93;
              }
              else
              {
                __CPLAssetsdOSLogDomain();
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v22);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v93);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v79;
                  v111 = v57;
                  v112 = 2112;
                  v113 = v58;
                  v114 = 2112;
                  v115 = v20;
                  v59 = v56;
                  v60 = "Conflicting incoming asset album order value (ascending) updated from %@ to %@ for %@";
LABEL_60:
                  _os_log_impl(&dword_199541000, v59, OS_LOG_TYPE_DEFAULT, v60, buf, 0x20u);

                  v16 = v86;
                }
LABEL_61:

                v22 = v93;
              }
              goto LABEL_62;
            }
            if (v91 != 0x7FFFFFFFFFFFFFFFLL)
            {
              if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v74 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v90);
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v79;
                  v111 = v20;
                  v112 = 2112;
                  v113 = v75;
                  v114 = 2112;
                  v115 = v89;
                  _os_log_impl(&dword_199541000, v74, OS_LOG_TYPE_DEFAULT, "Conflicting asset album order value (ascending) could not be stashed, moving %@ to %@ for %@", buf, 0x20u);

                  v16 = v86;
                }

              }
              objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v91);
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "moveObjectsAtIndexes:toIndex:", v76, v84);

            }
          }
          else
          {
            v16 = v86;
            if (v93)
            {
              if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v22);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v93);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v79;
                  v111 = v57;
                  v112 = 2112;
                  v113 = v58;
                  v114 = 2112;
                  v115 = v20;
                  v59 = v56;
                  v60 = "Conflicting incoming asset album order value (descending) updated from %@ to %@ for %@";
                  goto LABEL_60;
                }
                goto LABEL_61;
              }
              v22 = v93;
LABEL_62:
              ++v90;
              v40 = 1;
              goto LABEL_102;
            }
            if (v94)
            {
              -[PLRelationshipOrderKeyManager stashAlbumAssetsLocationValue:forAssetWithID:inAlbumWithID:atIndex:](self, "stashAlbumAssetsLocationValue:forAssetWithID:inAlbumWithID:atIndex:", v94, v24, v89, v90);
              if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v65 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v22);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v94);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v79;
                  v111 = v66;
                  v112 = 2112;
                  v113 = v67;
                  v114 = 2112;
                  v115 = v24;
                  v68 = v65;
                  v69 = "Conflicting existing asset album order value (descending) updated from %@ to %@ for %@";
LABEL_78:
                  _os_log_impl(&dword_199541000, v68, OS_LOG_TYPE_DEFAULT, v69, buf, 0x20u);

                  v38 = v49;
                  v16 = v86;
                }
                goto LABEL_79;
              }
              goto LABEL_80;
            }
            if (v91 != 0x7FFFFFFFFFFFFFFFLL)
            {
              if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v70 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v90 + 1);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v79;
                  v111 = v20;
                  v112 = 2112;
                  v113 = v71;
                  v114 = 2112;
                  v115 = v89;
                  _os_log_impl(&dword_199541000, v70, OS_LOG_TYPE_DEFAULT, "Conflicting asset album order value (ascending) could not be stashed, moving %@ to %@ for %@", buf, 0x20u);

                  v16 = v86;
                }

              }
              if (v84 >= objc_msgSend(v16, "count"))
                v72 = v84;
              else
                v72 = v84 + 1;
              objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v91);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "moveObjectsAtIndexes:toIndex:", v73, v72);

              v16 = v86;
            }
          }
          v40 = 0;
          goto LABEL_102;
        }
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v92, "uuid");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "uuid");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v111 = v42;
            v112 = 2112;
            v113 = v43;
            _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_ERROR, "Ignoring unsupported order value (0), appending %@ to the end of %@", buf, 0x16u);

            v16 = v86;
          }

        }
        v44 = v91 != 0x7FFFFFFFFFFFFFFFLL;
        v45 = objc_msgSend(v16, "count");
        v26 = v45 - v44;
        if (v91 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v46 = v45 - v44;
          v24 = 0;
          v15 = v85;
          goto LABEL_107;
        }
        objc_msgSend(v16, "insertObject:atIndex:", v92, v26);
        v24 = 0;
        v15 = v85;
LABEL_110:

        ++v18;
      }
      while (v18 != v88);
      v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v120, 16);
      v88 = v78;
    }
    while (v78);
  }

}

- (void)updateAlbumAssetsUsingTransientOrdersByAlbumOID:(id)a3 inLibrary:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  PLRelationshipOrderKeyManager *v15;

  v11 = a3;
  v7 = a4;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLRelationshipOrderKeyManager.m"), 423, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PLIsAssetsd()"));

  }
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v7, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __91__PLRelationshipOrderKeyManager_updateAlbumAssetsUsingTransientOrdersByAlbumOID_inLibrary___block_invoke;
    v12[3] = &unk_1E3677530;
    v13 = v11;
    v14 = v8;
    v15 = self;
    v9 = v8;
    objc_msgSend(v7, "performTransactionAndWait:", v12);

  }
}

- (id)_orderingStateForRelationship:(id)a3 onObjectWithID:(id)a4 usingSPISafeContext:(id)a5
{
  return -[PLRelationshipOrderKeyManager _orderingStateForRelationship:onObjectWithID:invalidateCache:usingSPISafeContext:](self, "_orderingStateForRelationship:onObjectWithID:invalidateCache:usingSPISafeContext:", a3, a4, 0, a5);
}

- (id)_orderingStateForRelationship:(id)a3 onObjectWithID:(id)a4 invalidateCache:(BOOL)a5 usingSPISafeContext:(id)a6
{
  _BOOL4 v7;
  __CFString *v10;
  __CFString *v11;
  id v12;
  os_unfair_lock_s *p_lock;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  PLRelationshipOrderingState *v18;
  _BYTE *v19;
  NSObject *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  PLRelationshipOrderingState *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  const __CFString *v28;
  uint64_t v29;
  PLRelationshipOrderingState *v30;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  __CFString *v37;
  __CFString *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint8_t buf[4];
  const __CFString *v47;
  __int16 v48;
  __CFString *v49;
  __int16 v50;
  __CFString *v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v7 = a5;
  v54 = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a3;
  v11 = (__CFString *)a4;
  v12 = a6;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PLRelationshipOrderKeyManager _locked_locationsCache](self, "_locked_locationsCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15 || v7)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);

    -[PLRelationshipOrderKeyManager _locked_locationsCache](self, "_locked_locationsCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v16, v11);

    v15 = v16;
  }
  objc_msgSend(v15, "objectForKey:", v10);
  v18 = (PLRelationshipOrderingState *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__20735;
    v44 = __Block_byref_object_dispose__20736;
    v45 = 0;
    v19 = (_BYTE *)MEMORY[0x1E0D115D0];
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v47 = v10;
        v48 = 2112;
        v49 = v11;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEBUG, "Retrieving locations for relationship '%@' on '%@'", buf, 0x16u);
      }

    }
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __114__PLRelationshipOrderKeyManager__orderingStateForRelationship_onObjectWithID_invalidateCache_usingSPISafeContext___block_invoke;
    v35 = &unk_1E3676EC8;
    v39 = &v40;
    v36 = v12;
    v21 = v10;
    v37 = v21;
    v22 = v11;
    v38 = v22;
    objc_msgSend(v36, "performBlockAndWait:", &v32);
    v23 = (void *)v41[5];
    if (v23 && objc_msgSend(v23, "count", v32, v33, v34, v35, v36, v37) == 2)
    {
      v24 = [PLRelationshipOrderingState alloc];
      objc_msgSend((id)v41[5], "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v41[5], "objectAtIndexedSubscript:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[PLRelationshipOrderingState initWithObjectIDs:orderValues:](v24, "initWithObjectIDs:orderValues:", v25, v26);

    }
    else
    {
      if (!*v19)
      {
        __CPLAssetsdOSLogDomain();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          v28 = CFSTR("invalid");
          v29 = v41[5];
          if (!v29)
            v28 = CFSTR("nil");
          *(_DWORD *)buf = 138413058;
          v47 = v28;
          v48 = 2112;
          v49 = v21;
          v50 = 2112;
          v51 = v22;
          v52 = 2112;
          v53 = v29;
          _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEBUG, "Ignoring %@ locations returned for relationship '%@' on '%@': %@", buf, 0x2Au);
        }

      }
      v30 = [PLRelationshipOrderingState alloc];
      v18 = -[PLRelationshipOrderingState initWithObjectIDs:orderValues:](v30, "initWithObjectIDs:orderValues:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
    }
    objc_msgSend(v15, "setObject:forKey:", v18, v21, v32, v33, v34, v35);

    _Block_object_dispose(&v40, 8);
  }
  os_unfair_lock_unlock(p_lock);

  return v18;
}

- (void)getConflictResolutionOrderValuesForRelationship:(id)a3 onObjectWithID:(id)a4 atIndex:(unint64_t)a5 intoLower:(int64_t *)a6 higher:(int64_t *)a7 inContext:(id)a8
{
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  void *context;
  id v32;

  v32 = a3;
  v13 = a4;
  v14 = a8;
  context = (void *)MEMORY[0x19AEC1554]();
  if ((objc_msgSend(v14, "hasChanges") & 1) != 0)
  {
    -[PLRelationshipOrderKeyManager generateContextBlock](self, "generateContextBlock");
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const char *))v15)[2](v15, "-[PLRelationshipOrderKeyManager getConflictResolutionOrderValuesForRelationship:onObjectWithID:atIndex:intoLower:higher:inContext:]");
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = v14;
  }
  -[PLRelationshipOrderKeyManager _orderingStateForRelationship:onObjectWithID:usingSPISafeContext:](self, "_orderingStateForRelationship:onObjectWithID:usingSPISafeContext:", v32, v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "orderKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "longLongValue");

  if (a5)
  {
    objc_msgSend(v18, "objectAtIndexedSubscript:", a5 - 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "longLongValue");

  }
  else
  {
    v22 = 1024;
  }
  if (objc_msgSend(v18, "count") - 1 <= a5)
  {
    v24 = 0x7FFFFFFFFFFFFBFFLL;
  }
  else
  {
    objc_msgSend(v18, "objectAtIndexedSubscript:", a5 + 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "longLongValue");

  }
  v25 = v20 - v22;
  if (v20 < v22)
    ++v25;
  v26 = v22 + (v25 >> 1);
  if (v20 - 1024 > v26)
    v26 = v20 - 1024;
  if (v20 <= v22)
    v26 = 0;
  *a6 = v26;
  v27 = v24 - v20;
  if (v24 < v20)
    ++v27;
  v28 = v20 + (v27 >> 1);
  if (v20 + 1024 >= v28 + 1)
    v29 = v28 + 1;
  else
    v29 = v20 + 1024;
  if (v24 <= v20)
    v29 = 0;
  *a7 = v29;

  objc_autoreleasePoolPop(context);
}

- (unint64_t)findIndexForAlbumWithID:(id)a3 newOrderValue:(int64_t)a4 inFolderWithID:(id)a5 hasOrderValueConflictWithAlbumID:(id *)a6 inContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  id v17;
  void *v18;
  void *v19;
  unint64_t v20;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v15 = (void *)MEMORY[0x19AEC1554]();
  if ((objc_msgSend(v14, "hasChanges") & 1) != 0)
  {
    -[PLRelationshipOrderKeyManager generateContextBlock](self, "generateContextBlock");
    v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const char *))v16)[2](v16, "-[PLRelationshipOrderKeyManager findIndexForAlbumWithID:newOrderValue:inFolderWithID:hasOrderValueConflictWithAlbumID:inContext:]");
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = v14;
  }
  +[PLManagedFolder childKeyForOrdering](PLManagedFolder, "childKeyForOrdering");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLRelationshipOrderKeyManager _orderingStateForRelationship:onObjectWithID:usingSPISafeContext:](self, "_orderingStateForRelationship:onObjectWithID:usingSPISafeContext:", v18, v13, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v15);
  v20 = objc_msgSend(v19, "findIndexForObjectID:newOrderValue:hasOrderValueConflictWithObjectID:", v12, a4, a6);

  return v20;
}

- (unint64_t)findIndexForAssetWithID:(id)a3 newOrderValue:(int64_t)a4 inAlbumWithID:(id)a5 hasOrderValueConflictWithAssetID:(id *)a6 inContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  id v17;
  void *v18;
  void *v19;
  unint64_t v20;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v15 = (void *)MEMORY[0x19AEC1554]();
  if ((objc_msgSend(v14, "hasChanges") & 1) != 0)
  {
    -[PLRelationshipOrderKeyManager generateContextBlock](self, "generateContextBlock");
    v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const char *))v16)[2](v16, "-[PLRelationshipOrderKeyManager findIndexForAssetWithID:newOrderValue:inAlbumWithID:hasOrderValueConflictWithAssetID:inContext:]");
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = v14;
  }
  +[PLManagedAlbum childKeyForOrdering](PLManagedAlbum, "childKeyForOrdering");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLRelationshipOrderKeyManager _orderingStateForRelationship:onObjectWithID:usingSPISafeContext:](self, "_orderingStateForRelationship:onObjectWithID:usingSPISafeContext:", v18, v13, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v15);
  v20 = objc_msgSend(v19, "findIndexForObjectID:newOrderValue:hasOrderValueConflictWithObjectID:", v12, a4, a6);

  return v20;
}

- (id)objectIDsAndOrderValuesForRelationship:(id)a3 onObjectWithID:(id)a4 invalidateCache:(BOOL)a5 inContext:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *context;
  _QWORD v23[3];

  v7 = a5;
  v23[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  context = (void *)MEMORY[0x19AEC1554]();
  if ((objc_msgSend(v12, "hasChanges") & 1) != 0)
  {
    -[PLRelationshipOrderKeyManager generateContextBlock](self, "generateContextBlock");
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const char *))v13)[2](v13, "-[PLRelationshipOrderKeyManager objectIDsAndOrderValuesForRelationship:onObjectWithID:invalidateCache:inContext:]");
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = v12;
  }
  -[PLRelationshipOrderKeyManager _orderingStateForRelationship:onObjectWithID:invalidateCache:usingSPISafeContext:](self, "_orderingStateForRelationship:onObjectWithID:invalidateCache:usingSPISafeContext:", v10, v11, v7, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");
  v23[0] = v17;
  objc_msgSend(v15, "orderKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");
  v23[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  return v20;
}

- (void)_stashLocationValue:(int64_t)a3 forOrderedObjectWithID:(id)a4 inSourceObjectID:(id)a5 relationship:(id)a6 atIndex:(unint64_t)a7 usingStashDictionary:(id)a8 usingSPISafeContext:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint8_t buf[4];
  int64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  -[PLRelationshipOrderKeyManager _orderingStateForRelationship:onObjectWithID:usingSPISafeContext:](self, "_orderingStateForRelationship:onObjectWithID:usingSPISafeContext:", v17, v16, a9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      v28 = a3;
      v29 = 2112;
      v30 = v15;
      v31 = 2112;
      v32 = v17;
      v33 = 2112;
      v34 = v16;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEBUG, "Stash order value %lld for %@ in %@ on %@", buf, 0x2Au);
    }

  }
  if (objc_msgSend(v19, "setOrderValue:forObjectID:atIndex:", a3, v15, a7))
  {
    objc_msgSend(v18, "objectForKey:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = v21;
      objc_msgSend(v21, "objectForKey:", v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v17;
      v26 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v22, v16);
    }
    if (a3 >= 1)
    {
      objc_msgSend(v23, "addObject:", v15);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v24);

      self->_hasStashedLocationValues = 1;
    }

  }
}

- (void)stashFolderAlbumsLocationValue:(int64_t)a3 forAlbumWithID:(id)a4 inFolderWithID:(id)a5 atIndex:(unint64_t)a6
{
  id v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x19AEC1554]();
  -[PLRelationshipOrderKeyManager generateContextBlock](self, "generateContextBlock");
  v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const char *))v12)[2](v12, "-[PLRelationshipOrderKeyManager stashFolderAlbumsLocationValue:forAlbumWithID:inFolderWithID:atIndex:]");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_lock);
  -[PLRelationshipOrderKeyManager _locked_enqueuedFolderAlbumsOrderValueUpdates](self, "_locked_enqueuedFolderAlbumsOrderValueUpdates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  +[PLManagedFolder childKeyForOrdering](PLManagedFolder, "childKeyForOrdering");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLRelationshipOrderKeyManager _stashLocationValue:forOrderedObjectWithID:inSourceObjectID:relationship:atIndex:usingStashDictionary:usingSPISafeContext:](self, "_stashLocationValue:forOrderedObjectWithID:inSourceObjectID:relationship:atIndex:usingStashDictionary:usingSPISafeContext:", a3, v16, v10, v15, a6, v14, v13);

  objc_autoreleasePoolPop(v11);
}

- (void)stashAlbumAssetsLocationValue:(int64_t)a3 forAssetWithID:(id)a4 inAlbumWithID:(id)a5 atIndex:(unint64_t)a6
{
  id v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x19AEC1554]();
  -[PLRelationshipOrderKeyManager generateContextBlock](self, "generateContextBlock");
  v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const char *))v12)[2](v12, "-[PLRelationshipOrderKeyManager stashAlbumAssetsLocationValue:forAssetWithID:inAlbumWithID:atIndex:]");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_lock);
  -[PLRelationshipOrderKeyManager _locked_enqueuedAlbumAssetsOrderValueUpdates](self, "_locked_enqueuedAlbumAssetsOrderValueUpdates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  +[PLManagedAlbum childKeyForOrdering](PLManagedAlbum, "childKeyForOrdering");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLRelationshipOrderKeyManager _stashLocationValue:forOrderedObjectWithID:inSourceObjectID:relationship:atIndex:usingStashDictionary:usingSPISafeContext:](self, "_stashLocationValue:forOrderedObjectWithID:inSourceObjectID:relationship:atIndex:usingStashDictionary:usingSPISafeContext:", a3, v16, v10, v15, a6, v14, v13);

  objc_autoreleasePoolPop(v11);
}

- (void)_setConflictDetected:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_conflictDetected = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)_getAndResetEnqueuedOrderValueUpdatesForFolders:(id *)a3 albums:(id *)a4 conflictDetected:(BOOL *)a5
{
  os_unfair_lock_s *p_lock;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *enqueuedFolderAlbumsOrderValueUpdates;
  NSMutableDictionary *v13;
  NSMutableDictionary *enqueuedAlbumAssetsOrderValueUpdates;
  void *v15;
  id v16;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (a3)
  {
    v16 = (id)-[NSMutableDictionary copy](self->_enqueuedFolderAlbumsOrderValueUpdates, "copy");
    if (a4)
    {
LABEL_3:
      v10 = (void *)-[NSMutableDictionary copy](self->_enqueuedAlbumAssetsOrderValueUpdates, "copy");
      goto LABEL_6;
    }
  }
  else
  {
    v16 = 0;
    if (a4)
      goto LABEL_3;
  }
  v10 = 0;
LABEL_6:
  *a5 = self->_conflictDetected;
  v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  enqueuedFolderAlbumsOrderValueUpdates = self->_enqueuedFolderAlbumsOrderValueUpdates;
  self->_enqueuedFolderAlbumsOrderValueUpdates = v11;

  v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  enqueuedAlbumAssetsOrderValueUpdates = self->_enqueuedAlbumAssetsOrderValueUpdates;
  self->_enqueuedAlbumAssetsOrderValueUpdates = v13;

  -[PLRelationshipOrderKeyManager _locked_locationsCache](self, "_locked_locationsCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAllObjects");

  self->_hasStashedLocationValues = 0;
  self->_conflictDetected = 0;
  os_unfair_lock_unlock(p_lock);
  if (a3)
    *a3 = objc_retainAutorelease(v16);
  if (a4)
    *a4 = objc_retainAutorelease(v10);

}

- (BOOL)writeStashedLocationValuesInContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  id v13;
  void *v14;
  char v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  id v26;
  id v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v6 = a3;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 1;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__20735;
  v33 = __Block_byref_object_dispose__20736;
  v34 = 0;
  v7 = (void *)MEMORY[0x19AEC1554]();
  v8 = v6;
  v28 = 0;
  v26 = 0;
  v27 = 0;
  -[PLRelationshipOrderKeyManager _getAndResetEnqueuedOrderValueUpdatesForFolders:albums:conflictDetected:](self, "_getAndResetEnqueuedOrderValueUpdatesForFolders:albums:conflictDetected:", &v27, &v26, &v28);
  v9 = v27;
  v10 = v26;
  if (!v8
    || (objc_msgSend(v8, "hasChanges") & 1) != 0
    || (v11 = v8, v28) && (v11 = v8, objc_msgSend(v8, "changeSource") == 1))
  {
    -[PLRelationshipOrderKeyManager generateContextBlock](self, "generateContextBlock");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const char *))v12)[2](v12, "-[PLRelationshipOrderKeyManager writeStashedLocationValuesInContext:error:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v9, "count") || objc_msgSend(v10, "count"))
  {
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __75__PLRelationshipOrderKeyManager_writeStashedLocationValuesInContext_error___block_invoke;
    v20 = &unk_1E366F518;
    v24 = &v35;
    v21 = v10;
    v13 = v11;
    v22 = v13;
    v25 = &v29;
    v23 = v9;
    v14 = (void *)MEMORY[0x19AEC174C](&v17);
    -[PLRelationshipOrderKeyManager setInWriteStashedLocationMode:](self, "setInWriteStashedLocationMode:", 1, v17, v18, v19, v20);
    objc_msgSend(v13, "performBlockAndWait:", v14);
    -[PLRelationshipOrderKeyManager setInWriteStashedLocationMode:](self, "setInWriteStashedLocationMode:", 0);

  }
  objc_autoreleasePoolPop(v7);
  if (a4)
    *a4 = objc_retainAutorelease((id)v30[5]);
  v15 = *((_BYTE *)v36 + 24);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v15;
}

- (id)albumsAndOrderValuesForAsset:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__20735;
  v25 = __Block_byref_object_dispose__20736;
  v26 = 0;
  v8 = (void *)MEMORY[0x19AEC1554]();
  if (!v7 || objc_msgSend(v7, "hasChanges"))
  {
    -[PLRelationshipOrderKeyManager generateContextBlock](self, "generateContextBlock");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const char *))v9)[2](v9, "-[PLRelationshipOrderKeyManager albumsAndOrderValuesForAsset:inManagedObjectContext:]");
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v10;
  }
  objc_msgSend(v6, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __85__PLRelationshipOrderKeyManager_albumsAndOrderValuesForAsset_inManagedObjectContext___block_invoke;
  v17[3] = &unk_1E3676EA0;
  v12 = v7;
  v18 = v12;
  v13 = v11;
  v19 = v13;
  v20 = &v21;
  v14 = (void *)MEMORY[0x19AEC174C](v17);
  objc_msgSend(v12, "performBlockAndWait:", v14);

  objc_autoreleasePoolPop(v8);
  v15 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v15;
}

- (id)parentFolderOrderValueForAlbum:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__20735;
  v25 = __Block_byref_object_dispose__20736;
  v26 = 0;
  v8 = (void *)MEMORY[0x19AEC1554]();
  if (objc_msgSend(v7, "hasChanges"))
  {
    -[PLRelationshipOrderKeyManager generateContextBlock](self, "generateContextBlock");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const char *))v9)[2](v9, "-[PLRelationshipOrderKeyManager parentFolderOrderValueForAlbum:inManagedObjectContext:]");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v7;
  }
  objc_msgSend(v6, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __87__PLRelationshipOrderKeyManager_parentFolderOrderValueForAlbum_inManagedObjectContext___block_invoke;
  v17[3] = &unk_1E3676EA0;
  v12 = v10;
  v18 = v12;
  v13 = v11;
  v19 = v13;
  v20 = &v21;
  v14 = (void *)MEMORY[0x19AEC174C](v17);
  objc_msgSend(v12, "performBlockAndWait:", v14);

  objc_autoreleasePoolPop(v8);
  v15 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v15;
}

- (BOOL)hasStashedLocationValues
{
  return self->_hasStashedLocationValues;
}

- (BOOL)conflictDetected
{
  return self->_conflictDetected;
}

- (BOOL)inWriteStashedLocationMode
{
  return self->_inWriteStashedLocationMode;
}

- (void)setInWriteStashedLocationMode:(BOOL)a3
{
  self->_inWriteStashedLocationMode = a3;
}

- (id)generateContextBlock
{
  return self->_generateContextBlock;
}

- (void)setGenerateContextBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_generateContextBlock, 0);
  objc_storeStrong((id *)&self->_enqueuedAlbumAssetsOrderValueUpdates, 0);
  objc_storeStrong((id *)&self->_enqueuedFolderAlbumsOrderValueUpdates, 0);
  objc_storeStrong((id *)&self->_locationsCache, 0);
}

void __87__PLRelationshipOrderKeyManager_parentFolderOrderValueForAlbum_inManagedObjectContext___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  +[PLManagedObject entityInManagedObjectContext:](PLManagedFolder, "entityInManagedObjectContext:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relationshipsByName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedFolder childKeyForOrdering](PLManagedFolder, "childKeyForOrdering");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)a1[4];
  v7 = a1[5];
  v18 = 0;
  objc_msgSend(v6, "_allOrderKeysForDestination:inRelationship:error:", v7, v5, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;
  if (v8)
  {
    if (objc_msgSend(v8, "count") == 2)
    {
      objc_msgSend(v8, "objectAtIndex:", 1);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1[6] + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "copy");
      v14 = *(_QWORD *)(a1[6] + 8);
      v15 = *(NSObject **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;
LABEL_7:

    }
  }
  else if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = a1[5];
      objc_msgSend(v5, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v20 = v16;
      v21 = 2112;
      v22 = v17;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Failed to fetch order keys for destination album %@ in %@: %@", buf, 0x20u);

    }
    goto LABEL_7;
  }

}

void __85__PLRelationshipOrderKeyManager_albumsAndOrderValuesForAsset_inManagedObjectContext___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[PLManagedObject entityInManagedObjectContext:](PLManagedAlbum, "entityInManagedObjectContext:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relationshipsByName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAlbum childKeyForOrdering](PLManagedAlbum, "childKeyForOrdering");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)a1[4];
  v7 = a1[5];
  v15 = 0;
  objc_msgSend(v6, "_allOrderKeysForDestination:inRelationship:error:", v7, v5, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  if (v8)
  {
    v10 = objc_msgSend(v8, "copy");
    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(NSObject **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
LABEL_6:

    goto LABEL_7;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = a1[5];
      objc_msgSend(v5, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch order keys for destination asset %@ in %@: %@", buf, 0x20u);

    }
    goto LABEL_6;
  }
LABEL_7:

}

void __75__PLRelationshipOrderKeyManager_writeStashedLocationValuesInContext_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  _BYTE *v4;
  uint64_t v5;
  _UNKNOWN **v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  _UNKNOWN **v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  _UNKNOWN **v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  int v35;
  void *v36;
  _UNKNOWN **v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  char v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  id obj;
  id obja;
  uint64_t v51;
  uint64_t v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[128];
  uint8_t buf[4];
  _BYTE v67[28];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = *(id *)(a1 + 32);
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    v4 = (_BYTE *)MEMORY[0x1E0D115D0];
    if (v2)
    {
      v5 = v2;
      v51 = *(_QWORD *)v62;
      v6 = &off_1E3659000;
      *(_QWORD *)&v3 = 138412802;
      v47 = v3;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v62 != v51)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v8, v47);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6[474], "childKeyForOrdering");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!*v4)
          {
            __CPLAssetsdOSLogDomain();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              v13 = objc_msgSend(v11, "count");
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)v67 = v13;
              *(_WORD *)&v67[4] = 2112;
              *(_QWORD *)&v67[6] = v8;
              *(_WORD *)&v67[14] = 2112;
              *(_QWORD *)&v67[16] = v11;
              _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "Writing %d asset order keys in album %@: %@", buf, 0x1Cu);
            }

          }
          v14 = *(void **)(a1 + 40);
          v15 = v6;
          objc_msgSend(v6[474], "childKeyForOrdering");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v60 = *(id *)(v17 + 40);
          LOBYTE(v14) = objc_msgSend(v14, "_updateLocationsOfObjectsToLocationByOrderKey:inRelationshipWithName:onObjectWithID:error:", v11, v16, v8, &v60);
          objc_storeStrong((id *)(v17 + 40), v60);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (_BYTE)v14;

          if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
          {
            v4 = (_BYTE *)MEMORY[0x1E0D115D0];
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
                *(_DWORD *)buf = v47;
                *(_QWORD *)v67 = v11;
                *(_WORD *)&v67[8] = 2112;
                *(_QWORD *)&v67[10] = v8;
                *(_WORD *)&v67[18] = 2112;
                *(_QWORD *)&v67[20] = v24;
                _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Failed to update assets order keys %@ in album %@ -- %@", buf, 0x20u);
              }

            }
            goto LABEL_24;
          }
          v18 = *(void **)(a1 + 40);
          v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v59 = *(id *)(v19 + 40);
          v20 = objc_msgSend(v18, "save:", &v59);
          objc_storeStrong((id *)(v19 + 40), v59);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v20;
          v4 = (_BYTE *)MEMORY[0x1E0D115D0];
          v6 = v15;
          if (!(*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) | *MEMORY[0x1E0D115D0]))
          {
            __CPLAssetsdOSLogDomain();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
              *(_DWORD *)buf = v47;
              *(_QWORD *)v67 = v11;
              *(_WORD *)&v67[8] = 2112;
              *(_QWORD *)&v67[10] = v8;
              *(_WORD *)&v67[18] = 2112;
              *(_QWORD *)&v67[20] = v22;
              _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Failed to save changes to order keys %@ in album %@ -- %@", buf, 0x20u);
            }

          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_24:

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      obja = *(id *)(a1 + 48);
      v25 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      if (v25)
      {
        v27 = v25;
        v52 = *(_QWORD *)v56;
        v28 = &off_1E3659000;
        *(_QWORD *)&v26 = 138412802;
        v48 = v26;
        while (2)
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v56 != v52)
              objc_enumerationMutation(obja);
            v30 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j);
            objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v30, v48);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28[480], "childKeyForOrdering");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectForKey:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (!*v4)
            {
              __CPLAssetsdOSLogDomain();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                v35 = objc_msgSend(v33, "count");
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)v67 = v35;
                *(_WORD *)&v67[4] = 2112;
                *(_QWORD *)&v67[6] = v30;
                *(_WORD *)&v67[14] = 2112;
                *(_QWORD *)&v67[16] = v33;
                _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_DEBUG, "Writing %d albums order keys in folder %@: %@", buf, 0x1Cu);
              }

            }
            v36 = *(void **)(a1 + 40);
            v37 = v28;
            objc_msgSend(v28[480], "childKeyForOrdering");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v54 = *(id *)(v39 + 40);
            LOBYTE(v36) = objc_msgSend(v36, "_updateLocationsOfObjectsToLocationByOrderKey:inRelationshipWithName:onObjectWithID:error:", v33, v38, v30, &v54);
            objc_storeStrong((id *)(v39 + 40), v54);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (_BYTE)v36;

            if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
            {
              if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  v46 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
                  *(_DWORD *)buf = v48;
                  *(_QWORD *)v67 = v33;
                  *(_WORD *)&v67[8] = 2112;
                  *(_QWORD *)&v67[10] = v30;
                  *(_WORD *)&v67[18] = 2112;
                  *(_QWORD *)&v67[20] = v46;
                  _os_log_impl(&dword_199541000, v45, OS_LOG_TYPE_ERROR, "Failed to update albums order keys %@ in folder %@ -- %@", buf, 0x20u);
                }

              }
              goto LABEL_47;
            }
            v40 = *(void **)(a1 + 40);
            v41 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v53 = *(id *)(v41 + 40);
            v42 = objc_msgSend(v40, "save:", &v53);
            objc_storeStrong((id *)(v41 + 40), v53);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v42;
            v4 = (_BYTE *)MEMORY[0x1E0D115D0];
            v28 = v37;
            if (!(*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) | *MEMORY[0x1E0D115D0]))
            {
              __CPLAssetsdOSLogDomain();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                v44 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
                *(_DWORD *)buf = v48;
                *(_QWORD *)v67 = v33;
                *(_WORD *)&v67[8] = 2112;
                *(_QWORD *)&v67[10] = v30;
                *(_WORD *)&v67[18] = 2112;
                *(_QWORD *)&v67[20] = v44;
                _os_log_impl(&dword_199541000, v43, OS_LOG_TYPE_ERROR, "Failed to save changes to order keys %@ in folder %@ -- %@", buf, 0x20u);
              }

            }
          }
          v27 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
          if (v27)
            continue;
          break;
        }
      }
LABEL_47:

    }
  }
}

void __114__PLRelationshipOrderKeyManager__orderingStateForRelationship_onObjectWithID_invalidateCache_usingSPISafeContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_orderKeysForRelationshipWithName__:onObjectWithID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __91__PLRelationshipOrderKeyManager_updateAlbumAssetsUsingTransientOrdersByAlbumOID_inLibrary___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAlbum entityName](PLManagedAlbum, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a1[4], "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("self IN %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  objc_msgSend(a1[5], "executeFetchRequest:error:", v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isDeleted") & 1) == 0 && objc_msgSend(v13, "supportsAssetOrderKeys"))
        {
          v14 = a1[4];
          objc_msgSend(v13, "objectID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(a1[6], "_updateOrderOfChildrenInParent:usingTransientOrders:", v13, v16);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

uint64_t __85__PLRelationshipOrderKeyManager__updateOrderOfChildrenInParent_usingTransientOrders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend((id)objc_opt_class(), "compareOrderKeyObject:withObject:", v5, v4);

  return v6;
}

+ (id)new
{
  id v2;
  id v3;

  v2 = a1;
  PLMethodNotImplementedException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (int64_t)compareOrderKeyObject:(id)a3 withObject:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "orderValue");
  v8 = objc_msgSend(v6, "orderValue");
  if (v7 >= v8)
  {
    if (v8 >= v7)
    {
      objc_msgSend(v5, "secondaryOrderSortKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "secondaryOrderSortKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "compare:", v11);

    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (void)migration_ensureValidOrderKey:(id)a3 usingOrderValuePropertyKey:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = a4;
  objc_msgSend(v8, "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longLongValue");

  if (v7 < 0)
    objc_msgSend(v8, "setValue:forKey:", &unk_1E375E730, v5);

}

- (void)migration_fixupOrderKeys:(id)a3 usingOrderValuePropertyKey:(id)a4 enforceSingletonAlbumReservedKeySpace:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  _BOOL4 v33;
  void *v34;
  id v35;

  v5 = a5;
  v35 = a3;
  v7 = a4;
  v8 = objc_msgSend(v35, "count");
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v33 = v5;
    v32 = v8;
    do
    {
      objc_msgSend(v35, "objectAtIndex:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "valueForKey:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "longLongValue");

      if (v5)
      {
        if (!v11)
          v11 = 1023;
        v16 = v13;
        objc_msgSend(v13, "valueForKey:", CFSTR("kind"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "shortValue");

        if (+[PLManagedAlbumList albumKindHasFixedOrder:](PLManagedAlbumList, "albumKindHasFixedOrder:", v18))
        {
          v19 = +[PLManagedAlbumList priorityForAlbumKind:](PLManagedAlbumList, "priorityForAlbumKind:", v18);
          if (v19 == -1)
          {
            v15 = v11;
            v13 = v16;
            goto LABEL_31;
          }
          v13 = v16;
          if (v15 != v19)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setValue:forKey:", v20, v7);
            goto LABEL_29;
          }
          goto LABEL_30;
        }
        v13 = v16;
        if (v15 <= 1023)
          objc_msgSend(v16, "setValue:forKey:", &unk_1E375E748, v7);
      }
      if (v11 >= v15)
      {
        v34 = v13;
        v21 = v12 + 1;
        v22 = v35;
        if (v12 + 1 >= v9)
          goto LABEL_34;
        v20 = 0;
        while (1)
        {
          v23 = v20;
          objc_msgSend(v22, "objectAtIndex:", v21);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "valueForKey:", v7);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "longLongValue");

          v26 = v25 - v11;
          if (v25 > v11 && v26 >= v10 + v21 + 1)
            break;
          ++v21;
          v22 = v35;
          if (v9 == v21)
          {
            v21 = v9;
            break;
          }
        }
        if (!v20)
        {
LABEL_34:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11 + 1024);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setValue:forKey:", v31, v7);

          break;
        }
        if (v21 == v9)
          v27 = 1024;
        else
          v27 = v26 / (v10 + 1 + v21);
        if (v12 >= v21)
        {
          v12 = v21;
          v11 = v25;
          v5 = v33;
        }
        else
        {
          v28 = v11 + v27 + v27 * (v10 + v12);
          do
          {
            objc_msgSend(v35, "objectAtIndex:", v12);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setValue:forKey:", v30, v7);

            ++v12;
            v28 += v27;
          }
          while (v21 != v12);
          v12 = v21;
          v11 = v25;
          v5 = v33;
          v9 = v32;
        }
        v13 = v34;
LABEL_29:

LABEL_30:
        v15 = v11;
      }
LABEL_31:

      v10 = ~v12;
      v11 = v15;
      ++v12;
    }
    while (v12 < v9);
  }

}

- (id)migration_sortedOrderKeysForAssetsInAlbum:(id)a3 usingMap:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "valueForKey:", CFSTR("assets"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v15, (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)CFSTR("AssetToAlbumOrder"), (uint64_t)v8, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17)
            goto LABEL_11;
          v16 = v17;
          objc_msgSend(v17, "setValue:forKey:", v15, CFSTR("asset"));
          objc_msgSend(v16, "setValue:forKey:", v5, CFSTR("album"));
          objc_msgSend(v6, "setObject:forKey:", v16, v15);
        }
        objc_msgSend(v9, "addObject:", v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }
LABEL_11:

  return v9;
}

- (void)_migration_updateOrderKeysForAssetsInParentAlbum:(id)a3 childToOrderKeyMap:(id)a4
{
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
  -[PLRelationshipOrderKeyManager migration_sortedOrderKeysForAssetsInAlbum:usingMap:](self, "migration_sortedOrderKeysForAssetsInAlbum:usingMap:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
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
        -[PLRelationshipOrderKeyManager migration_ensureValidOrderKey:usingOrderValuePropertyKey:](self, "migration_ensureValidOrderKey:usingOrderValuePropertyKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), CFSTR("orderValue"));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  -[PLRelationshipOrderKeyManager migration_fixupOrderKeys:usingOrderValuePropertyKey:enforceSingletonAlbumReservedKeySpace:](self, "migration_fixupOrderKeys:usingOrderValuePropertyKey:enforceSingletonAlbumReservedKeySpace:", v5, CFSTR("orderValue"), 0);

}

- (void)_migration_updateOrderValuesForAssetsInAlbum:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  PLRelationshipOrderKeyManager *v22;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isDeleted") & 1) == 0)
  {
    v22 = self;
    objc_msgSend(v6, "valueForKey:", CFSTR("assets"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v23 = v6;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v6, "valueForKey:", CFSTR("assetOrders"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v15, "valueForKey:", CFSTR("asset"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16 && objc_msgSend(v8, "containsObject:", v16))
            objc_msgSend(v24, "setObject:forKey:", v15, v16);
          else
            objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v12);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v17 = v9;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(v7, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v19);
    }

    v6 = v23;
    -[PLRelationshipOrderKeyManager _migration_updateOrderKeysForAssetsInParentAlbum:childToOrderKeyMap:](v22, "_migration_updateOrderKeysForAssetsInParentAlbum:childToOrderKeyMap:", v23, v24);

  }
}

- (void)migration_updateLegacyOrderValuesForAssetsInAlbums:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v6);
        -[PLRelationshipOrderKeyManager _migration_updateOrderValuesForAssetsInAlbum:managedObjectContext:](self, "_migration_updateOrderValuesForAssetsInAlbum:managedObjectContext:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v7);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)migration_updateLegacyChildCollectionOrderKeysInFolder:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "valueForKey:", CFSTR("childCollections"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[PLRelationshipOrderKeyManager migration_ensureValidOrderKey:usingOrderValuePropertyKey:](self, "migration_ensureValidOrderKey:usingOrderValuePropertyKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), CFSTR("albumToFolderOrderKey"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  objc_msgSend(v4, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLRelationshipOrderKeyManager migration_fixupOrderKeys:usingOrderValuePropertyKey:enforceSingletonAlbumReservedKeySpace:](self, "migration_fixupOrderKeys:usingOrderValuePropertyKey:enforceSingletonAlbumReservedKeySpace:", v9, CFSTR("albumToFolderOrderKey"), 1);

}

@end
