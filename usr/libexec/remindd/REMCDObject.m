@implementation REMCDObject

+ (id)entity
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;
  objc_super v12;

  v3 = (objc_class *)objc_opt_class(REMCDObject, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = NSStringFromClass((Class)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDObject entity](REMCDRootEntityObject, "entity"));
  }
  else
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_METACLASS___REMCDObject;
    v10 = objc_msgSendSuper2(&v12, "entity");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }
  return v9;
}

+ (id)ic_objectsFromObjectIDs:(id)a3 propertiesToFetch:(id)a4 relationshipKeyPathsForPrefetching:(id)a5 context:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  NSString *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  id obj;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];

  v43 = a4;
  v42 = a5;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "reduceIntoDictionaryByRootEntityNamesWithManagedObjectIDs:", a3));
  if (objc_msgSend(v11, "count"))
  {
    v13 = (objc_class *)objc_opt_class(REMCDObject, v12);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = NSStringFromClass((Class)a1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_msgSend(v15, "isEqualToString:", v17);

    if (v18)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "subclassesOfREMCDObjectRepresentingRootCoreDataEntities"));
      v41 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v35 = v11;
      obj = v11;
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      if (v38)
      {
        v36 = *(_QWORD *)v49;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v49 != v36)
              objc_enumerationMutation(obj);
            v40 = v19;
            v20 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKeyedSubscript:", v20));
            v44 = 0u;
            v45 = 0u;
            v46 = 0u;
            v47 = 0u;
            v22 = v37;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v45;
              do
              {
                for (i = 0; i != v24; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v45 != v25)
                    objc_enumerationMutation(v22);
                  v27 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
                  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "cdEntityName"));
                  v29 = objc_msgSend(v28, "isEqualToString:", v20);

                  if (v29)
                  {
                    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "_ic_objectsFromObjectIDs:propertiesToFetch:relationshipKeyPathsForPrefetching:context:", v21, v43, v42, v10));
                    if (v30)
                      objc_msgSend(v41, "addObjectsFromArray:", v30);

                  }
                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
              }
              while (v24);
            }

            v19 = v40 + 1;
          }
          while ((id)(v40 + 1) != v38);
          v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        }
        while (v38);
      }

      v11 = v35;
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cdEntityName"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rootEntityNameWithEntityName:", v31));

      if (objc_msgSend(v32, "length"))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v32));
        if (objc_msgSend(v33, "count"))
          v41 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_ic_objectsFromObjectIDs:propertiesToFetch:relationshipKeyPathsForPrefetching:context:", v33, v43, v42, v10));
        else
          v41 = &__NSArray0__struct;

      }
      else
      {
        v41 = &__NSArray0__struct;
      }

    }
  }
  else
  {
    v41 = &__NSArray0__struct;
  }

  return v41;
}

+ (id)ic_resultsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 resultType:(unint64_t)a5 fetchBatchSize:(unint64_t)a6 propertiesToFetch:(id)a7 relationshipKeyPathsForPrefetching:(id)a8 context:(id)a9
{
  id v14;
  id v15;
  id v16;
  objc_class *v17;
  id v18;
  uint64_t v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  NSString *v23;
  void *v24;
  unsigned int v25;
  id v26;
  void *v27;
  id v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  id v39;
  id v40;
  id obj;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];

  v40 = a3;
  v14 = a4;
  v15 = a7;
  v16 = a8;
  v17 = (objc_class *)a1;
  v18 = a9;
  v20 = (objc_class *)objc_opt_class(REMCDObject, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = NSStringFromClass(v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = objc_msgSend(v22, "isEqualToString:", v24);

  if (v25)
  {
    v44 = v16;
    v26 = v14;
    v27 = v40;
    v43 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[objc_class subclassesOfREMCDObjectRepresentingRootCoreDataEntities](v17, "subclassesOfREMCDObjectRepresentingRootCoreDataEntities"));
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    v29 = a6;
    if (v28)
    {
      v30 = v28;
      v31 = *(_QWORD *)v46;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v46 != v31)
            objc_enumerationMutation(obj);
          v33 = v18;
          v39 = v18;
          v34 = a5;
          v35 = a5;
          v36 = v29;
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)v32), "_ic_resultsMatchingPredicate:sortDescriptors:resultType:fetchBatchSize:propertiesToFetch:relationshipKeyPathsForPrefetching:context:", v40, v26, v35, v29, v15, v44, v39));
          if (v37)
            objc_msgSend(v43, "addObjectsFromArray:", v37);

          v32 = (char *)v32 + 1;
          v29 = v36;
          a5 = v34;
          v18 = v33;
        }
        while (v30 != v32);
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v30);
    }

    v14 = v26;
    v16 = v44;
  }
  else
  {
    v27 = v40;
    v43 = (id)objc_claimAutoreleasedReturnValue(-[objc_class _ic_resultsMatchingPredicate:sortDescriptors:resultType:fetchBatchSize:propertiesToFetch:relationshipKeyPathsForPrefetching:context:](v17, "_ic_resultsMatchingPredicate:sortDescriptors:resultType:fetchBatchSize:propertiesToFetch:relationshipKeyPathsForPrefetching:context:", v40, v14, a5, a6, v15, v16, v18));
  }

  return v43;
}

+ (BOOL)isAbstract
{
  NSObject *v2;

  v2 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    sub_10067EC0C();

  return 1;
}

- (RDStoreControllerManagedObjectContext)storeControllerManagedObjectContext
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(RDStoreControllerManagedObjectContext, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject managedObjectContext](self, "managedObjectContext"));
  v5 = REMDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (RDStoreControllerManagedObjectContext *)v6;
}

- (BOOL)isConcealed
{
  if ((-[REMCDObject markedForDeletion](self, "markedForDeletion") & 1) != 0)
    return 1;
  else
    return -[REMCDObject isUnsupported](self, "isUnsupported");
}

- (BOOL)isPlaceholder
{
  unsigned int v3;

  v3 = -[REMCDObject isInICloudAccount](self, "isInICloudAccount");
  if (v3)
    LOBYTE(v3) = -[REMCDObject ckNeedsInitialFetchFromCloud](self, "ckNeedsInitialFetchFromCloud");
  return v3;
}

- (void)awakeFromInsert
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)REMCDObject;
  -[REMCDObject awakeFromInsert](&v4, "awakeFromInsert");
  if (objc_msgSend((id)objc_opt_class(self, v3), "shouldSyncToCloud"))
    -[REMCDObject insertCloudStateOnAwakeFromInsert](self, "insertCloudStateOnAwakeFromInsert");
}

- (void)awakeFromFetch
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)REMCDObject;
  -[REMCDObject awakeFromFetch](&v4, "awakeFromFetch");
  if (objc_msgSend((id)objc_opt_class(self, v3), "shouldSyncToCloud"))
    -[REMCDObject insertCloudStateIfNeededOnAwakeFromFetch](self, "insertCloudStateIfNeededOnAwakeFromFetch");
}

- (void)didTurnIntoFault
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REMCDObject;
  -[REMCDObject didTurnIntoFault](&v3, "didTurnIntoFault");
  -[REMCDObject clearTransformedCKServerValueCachesOnDidTurnIntoFault](self, "clearTransformedCKServerValueCachesOnDidTurnIntoFault");
}

- (void)willChangeValueForKey:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)REMCDObject;
  -[REMCDObject willChangeValueForKey:](&v5, "willChangeValueForKey:", v4);
  if ((objc_opt_respondsToSelector(self, "willChangeValueForKey_Swfit:") & 1) != 0)
    -[REMCDObject willChangeValueForKey_Swfit:](self, "willChangeValueForKey_Swfit:", v4);

}

- (void)didChangeValueForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMCDObject;
  -[REMCDObject didChangeValueForKey:](&v11, "didChangeValueForKey:", v4);
  if (-[REMCDObject _allowsObjectSupportedVersion](self, "_allowsObjectSupportedVersion"))
  {
    v6 = objc_msgSend((id)objc_opt_class(self, v5), "keyPathsForValuesAffectingEffectiveMinimumSupportedVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_msgSend(v7, "containsObject:", v4);

    if (v8)
    {
      v9 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
        *(_DWORD *)buf = 138543618;
        v13 = v4;
        v14 = 2114;
        v15 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "REMSupportedVersionUpdating: didChangeValueForKey:[%{public}@] calling _markObjectDirtyForSupportedVersionValidation on {remObjectID: %{public}@}", buf, 0x16u);

      }
      -[REMCDObject _markDirtyForEffectiveMinimumSupportedVersionValidation](self, "_markDirtyForEffectiveMinimumSupportedVersionValidation");
    }
  }
  if ((objc_opt_respondsToSelector(self, "didChangeValueForKey_Swfit:") & 1) != 0)
    -[REMCDObject didChangeValueForKey_Swfit:](self, "didChangeValueForKey_Swfit:", v4);

}

- (void)setResolutionTokenMap:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  if ((objc_opt_respondsToSelector(self, "shouldUseResolutionTokenMapForMergingData") & 1) != 0
    && (((uint64_t (*)(REMCDObject *, const char *))-[REMCDObject methodForSelector:](self, "methodForSelector:", "shouldUseResolutionTokenMapForMergingData"))(self, "shouldUseResolutionTokenMapForMergingData") & 1) != 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_10067EC8C(self, a2, v6);
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      sub_10067ED78(self, a2, v6);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject cached_CDResolutionMap](self, "cached_CDResolutionMap"));
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("resolutionTokenMap_v3_JSONData")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject resolutionTokenMapFromJsonData:](self, "resolutionTokenMapFromJsonData:", v8));

  }
  if ((objc_msgSend(v7, "isEqual:", v5) & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject jsonDataFromResolutionTokenMap:](self, "jsonDataFromResolutionTokenMap:", v5));
    -[REMCDObject setResolutionTokenMapData:](self, "setResolutionTokenMapData:", v9);

  }
  v10 = objc_msgSend(v5, "copy");
  -[REMCDObject setCached_CDResolutionMap:](self, "setCached_CDResolutionMap:", v10);

  -[REMCDObject setHack_resolutionTokenMapCopy:](self, "setHack_resolutionTokenMapCopy:", v5);
}

- (REMResolutionTokenMap)resolutionTokenMap
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[REMCDObject willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("resolutionTokenMap"));
  -[REMCDObject willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("resolutionTokenMap_v3_JSONData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject hack_resolutionTokenMapCopy](self, "hack_resolutionTokenMapCopy"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("resolutionTokenMap_v3_JSONData")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject resolutionTokenMapFromJsonData:](self, "resolutionTokenMapFromJsonData:", v4));
    -[REMCDObject setHack_resolutionTokenMapCopy:](self, "setHack_resolutionTokenMapCopy:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject hack_resolutionTokenMapCopy](self, "hack_resolutionTokenMapCopy"));
    v7 = objc_msgSend(v6, "copy");
    -[REMCDObject setCached_CDResolutionMap:](self, "setCached_CDResolutionMap:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject hack_resolutionTokenMapCopy](self, "hack_resolutionTokenMapCopy"));
  -[REMCDObject didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("resolutionTokenMap_v3_JSONData"));
  -[REMCDObject didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("resolutionTokenMap"));
  return (REMResolutionTokenMap *)v8;
}

- (void)setResolutionTokenMapData:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[REMCDObject primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("resolutionTokenMap_v3_JSONData")));
  if (v4 != v5 && (!v5 || (objc_msgSend(v4, "isEqualToData:", v5) & 1) == 0))
  {
    -[REMCDObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("resolutionTokenMapData"));
    -[REMCDObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("resolutionTokenMap_v3_JSONData"));
    -[REMCDObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("resolutionTokenMap_v3_JSONData"));
    -[REMCDObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("resolutionTokenMap_v3_JSONData"));
    -[REMCDObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("resolutionTokenMap"));
    -[REMCDObject setHack_resolutionTokenMapCopy:](self, "setHack_resolutionTokenMapCopy:", 0);
    -[REMCDObject setCached_CDResolutionMap:](self, "setCached_CDResolutionMap:", 0);
  }

}

- (NSData)resolutionTokenMapData
{
  void *v3;

  -[REMCDObject willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("resolutionTokenMap"));
  -[REMCDObject willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("resolutionTokenMap_v3_JSONData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("resolutionTokenMap_v3_JSONData")));
  -[REMCDObject didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("resolutionTokenMap_v3_JSONData"));
  -[REMCDObject didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("resolutionTokenMap"));
  return (NSData *)v3;
}

- (id)jsonDataFromResolutionTokenMap:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objc_toJSONString"));
  v4 = v3;
  if (v3)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataUsingEncoding:", 4));
  else
    v5 = 0;

  return v5;
}

- (id)resolutionTokenMapFromJsonData:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v3, 4);
    if (v4)
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[REMResolutionTokenMap objc_newObjectFromJSONString:](REMResolutionTokenMap, "objc_newObjectFromJSONString:", v4));
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)createResolutionTokenMapIfNecessary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = objc_autoreleasePoolPush();
  v5 = objc_opt_class(REMResolutionTokenMap, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject resolutionTokenMap](self, "resolutionTokenMap"));
  v7 = REMDynamicCast(v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue(v7);

  objc_autoreleasePoolPop(v3);
  if (!v8)
  {
    v8 = objc_alloc_init((Class)REMResolutionTokenMap);
    -[REMCDObject setResolutionTokenMap:](self, "setResolutionTokenMap:", v8);
  }
  return v8;
}

- (void)setAccount:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("account")));
  -[REMCDObject setPreviousAccount:](self, "setPreviousAccount:", v5);

  -[REMCDObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("account"));
  -[REMCDObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("account"));

  -[REMCDObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("account"));
}

- (void)willSave
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  char v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)REMCDObject;
  -[REMCDObject willSave](&v21, "willSave");
  v3 = objc_claimAutoreleasedReturnValue(-[REMCDObject hack_resolutionTokenMapCopy](self, "hack_resolutionTokenMapCopy"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[REMCDObject hack_willSaveHandled](self, "hack_willSaveHandled");

    if ((v5 & 1) == 0)
    {
      -[REMCDObject setHack_willSaveHandled:](self, "setHack_willSaveHandled:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject hack_resolutionTokenMapCopy](self, "hack_resolutionTokenMapCopy"));
      -[REMCDObject setResolutionTokenMap:](self, "setResolutionTokenMap:", v6);
      -[REMCDObject setHack_resolutionTokenMapCopy:](self, "setHack_resolutionTokenMapCopy:", 0);
      -[REMCDObject setCached_CDResolutionMap:](self, "setCached_CDResolutionMap:", 0);

    }
  }
  v7 = objc_claimAutoreleasedReturnValue(-[REMCDObject storeControllerManagedObjectContext](self, "storeControllerManagedObjectContext"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject storeControllerManagedObjectContext](self, "storeControllerManagedObjectContext"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storeController"));
    if (!v10)
    {
LABEL_9:

      goto LABEL_10;
    }
    v11 = (void *)v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject storeControllerManagedObjectContext](self, "storeControllerManagedObjectContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "storeController"));
    if (!objc_msgSend(v13, "supportsCoreSpotlightIndexing")
      || -[REMCDObject spotlightIndexCountUpdated](self, "spotlightIndexCountUpdated"))
    {

      goto LABEL_9;
    }
    v16 = objc_opt_respondsToSelector(self, "spotlightObjectToReindex");

    if ((v16 & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject changedValues](self, "changedValues"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allKeys"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v8));
      v19 = objc_msgSend((id)objc_opt_class(self, v18), "propertiesThatShouldTriggerReindexing");
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      objc_msgSend(v9, "intersectSet:", v20);

      if (objc_msgSend(v9, "count"))
      {
        objc_msgSend(-[REMCDObject performSelector:](self, "performSelector:", "spotlightObjectToReindex"), "incrementSpotlightIndexCount");
        -[REMCDObject setSpotlightIndexCountUpdated:](self, "setSpotlightIndexCountUpdated:", 1);
      }
      goto LABEL_9;
    }
  }
LABEL_10:
  if (!-[REMCDObject hack_didHandleShouldSyncUpDelete](self, "hack_didHandleShouldSyncUpDelete"))
  {
    -[REMCDObject setHack_didHandleShouldSyncUpDelete:](self, "setHack_didHandleShouldSyncUpDelete:", 1);
    -[REMCDObject setShouldSyncUpDeleteIfNeeded](self, "setShouldSyncUpDeleteIfNeeded");
  }
  if ((objc_opt_respondsToSelector(self, "willSave_Swift") & 1) != 0)
    -[REMCDObject willSave_Swift](self, "willSave_Swift");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject identifier](self, "identifier"));

  if (!v14)
  {
    v15 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      sub_10067EE5C();

  }
}

- (void)didSave
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REMCDObject;
  -[REMCDObject didSave](&v3, "didSave");
  -[REMCDObject setHack_willSaveHandled:](self, "setHack_willSaveHandled:", 0);
  -[REMCDObject setSpotlightIndexCountUpdated:](self, "setSpotlightIndexCountUpdated:", 0);
  -[REMCDObject setHack_didHandleShouldSyncUpDelete:](self, "setHack_didHandleShouldSyncUpDelete:", 0);
  if ((objc_opt_respondsToSelector(self, "didSave_Swift") & 1) != 0)
    -[REMCDObject didSave_Swift](self, "didSave_Swift");
  -[REMCDObject setValidateForInsertion_handledJournalEntries:](self, "setValidateForInsertion_handledJournalEntries:", 0);
  -[REMCDObject setValidateForUpdate_handledJournalEntries:](self, "setValidateForUpdate_handledJournalEntries:", 0);
}

- (void)prepareForDeletion
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REMCDObject;
  -[REMCDObject prepareForDeletion](&v3, "prepareForDeletion");
  if ((objc_opt_respondsToSelector(self, "prepareForDeletion_Swift") & 1) != 0)
    -[REMCDObject prepareForDeletion_Swift](self, "prepareForDeletion_Swift");
}

- (BOOL)validateForInsert:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;
  REMCDObject *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  void *v18;
  id v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)REMCDObject;
  if (!-[REMCDObject validateForInsert:](&v20, "validateForInsert:"))
  {
    v12 = 0;
    goto LABEL_7;
  }
  v6 = objc_opt_class(REMCDAccount, v5);
  v7 = REMDynamicCast(v6, self);
  v9 = objc_claimAutoreleasedReturnValue(v7);
  if (!v9)
  {
    v10 = objc_opt_class(REMCDAlarmTimeIntervalTrigger, v8);
    v11 = REMDynamicCast(v10, self);
    v9 = objc_claimAutoreleasedReturnValue(v11);
    if (!v9)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject account](self, "account"));

      if (v18)
        goto LABEL_5;
      v9 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        sub_10067EF58(self, v9);
    }
  }

LABEL_5:
  v12 = -[REMCDObject _validateZoneOwnerNamesWithLogPrefix:error:](self, "_validateZoneOwnerNamesWithLogPrefix:error:", CFSTR("Inserting"), a3);
LABEL_7:
  if (!-[REMCDObject validateForInsertion_handledJournalEntries](self, "validateForInsertion_handledJournalEntries")
    && (objc_opt_respondsToSelector(self, "validateForInsert_Swift:") & 1) != 0)
  {
    v13 = self;
    v19 = 0;
    v14 = -[REMCDObject validateForInsert_Swift:](v13, "validateForInsert_Swift:", &v19);
    v15 = v19;
    if ((v14 & 1) == 0)
    {
      v16 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        sub_10067EEF0();

    }
    -[REMCDObject setValidateForInsertion_handledJournalEntries:](v13, "setValidateForInsertion_handledJournalEntries:", 1);
    v12 &= v14;

  }
  return v12;
}

- (BOOL)validateForUpdate:(id *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  REMCDObject *v18;
  unsigned __int8 v19;
  id v20;
  NSObject *v21;
  id v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)REMCDObject;
  if (!-[REMCDObject validateForUpdate:](&v24, "validateForUpdate:"))
    goto LABEL_9;
  v5 = objc_claimAutoreleasedReturnValue(-[REMCDObject previousAccount](self, "previousAccount"));
  if (!v5)
    goto LABEL_11;
  v6 = (void *)v5;
  v7 = objc_claimAutoreleasedReturnValue(-[REMCDObject account](self, "account"));
  if (!v7)
  {

    goto LABEL_11;
  }
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject previousAccount](self, "previousAccount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject account](self, "account"));
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) != 0)
  {
LABEL_11:
    LOBYTE(a3) = -[REMCDObject _validateZoneOwnerNamesWithLogPrefix:error:](self, "_validateZoneOwnerNamesWithLogPrefix:error:", CFSTR("Updating"), a3);
    goto LABEL_12;
  }
  v12 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    sub_10067F088(self, v12);

  if (a3)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject previousAccount](self, "previousAccount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "remObjectID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject account](self, "account"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "remObjectID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[REMError validationErrorMoveFromAccount:toAccount:objectID:](REMError, "validationErrorMoveFromAccount:toAccount:objectID:", v14, v16, v17));

LABEL_9:
    LOBYTE(a3) = 0;
  }
LABEL_12:
  if (!-[REMCDObject validateForUpdate_handledJournalEntries](self, "validateForUpdate_handledJournalEntries")
    && (objc_opt_respondsToSelector(self, "validateForUpdate_Swift:") & 1) != 0)
  {
    v18 = self;
    v23 = 0;
    v19 = -[REMCDObject validateForUpdate_Swift:](v18, "validateForUpdate_Swift:", &v23);
    v20 = v23;
    if ((v19 & 1) == 0)
    {
      v21 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        sub_10067F020();

    }
    -[REMCDObject setValidateForUpdate_handledJournalEntries:](v18, "setValidateForUpdate_handledJournalEntries:", 1);
    LOBYTE(a3) = a3 & v19;

  }
  return (char)a3;
}

- (NSString)_parentZoneMismatchErrorDebugDescription
{
  return 0;
}

- (BOOL)_validateZoneOwnerNamesWithLogPrefix:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  unsigned __int8 v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  NSString *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  NSString *v37;
  __int16 v38;
  void *v39;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject parentCloudObject](self, "parentCloudObject"));
  if (v7)
  {
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckZoneOwnerName](self, "ckZoneOwnerName"));
    if (!v8)
      v8 = CKCurrentUserDefaultName;
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ckZoneOwnerName"));
    if (!v9)
      v9 = CKCurrentUserDefaultName;
    v10 = -[NSString isEqual:](v8, "isEqual:", v9);
    if ((v10 & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_parentZoneMismatchErrorDebugDescription"));
      v12 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v20 = (void *)objc_opt_class(self, v13);
        v22 = v20;
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
        v18 = (void *)objc_opt_class(v7, v17);
        v21 = v18;
        *(_DWORD *)buf = 138545154;
        v25 = v6;
        v26 = 2114;
        v27 = v20;
        v28 = 2114;
        v29 = v23;
        v30 = 2114;
        v31 = v8;
        v32 = 2114;
        v33 = v18;
        v34 = 2114;
        v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "remObjectID"));
        v19 = (void *)v35;
        v36 = 2114;
        v37 = v9;
        v38 = 2114;
        v39 = v11;
        _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Validation Failure: %{public}@ {%{public}@, %{public}@, %{public}@} and its parent {%{public}@, %{public}@, %{public}@, %{public}@} have different zones", buf, 0x52u);

      }
      if (a4)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "remObjectID"));
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[REMError validationErrorDifferentZoneObjectID:zoneOwnerName:parentObjectID:parentZoneOwnerName:](REMError, "validationErrorDifferentZoneObjectID:zoneOwnerName:parentObjectID:parentZoneOwnerName:", v14, v8, v15, v9));

      }
    }

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)shouldMarkAsDeletedInsteadOfDeletingImmediately
{
  return 0;
}

- (void)updateDeletedFlagAccordingToOrphanState:(id)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  REMCDObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;

  v4 = -[REMCDObject isConnectedToAccountObject:](self, "isConnectedToAccountObject:", a3);
  if (v4 != -[REMCDObject markedForDeletion](self, "markedForDeletion"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject changedValues](self, "changedValues"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
    v7 = objc_msgSend(v6, "containsObject:", CFSTR("markedForDeletion"));

    if (!v7)
    {
      v11 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        sub_10067F158(self, v11);
      goto LABEL_19;
    }
  }
  if ((v4 & 1) != 0)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
      v21 = 138543618;
      v22 = v9;
      v23 = 2114;
      v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Begin recursiveMarkForDeletion:%{public}@ from %{public}@", (uint8_t *)&v21, 0x16u);

    }
    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v12 = self;
    v13 = 0;
LABEL_13:
    -[REMCDObject recursiveMarkForDeletion:usingVisitedMap:](v12, "recursiveMarkForDeletion:usingVisitedMap:", v13, v11);
LABEL_19:

    return;
  }
  if (!-[REMCDObject shouldMarkAsDeletedInsteadOfDeletingImmediately](self, "shouldMarkAsDeletedInsteadOfDeletingImmediately"))
  {
    v17 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
      v21 = 138543362;
      v22 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Deleting orphan object %{public}@ permanently from local database", (uint8_t *)&v21, 0xCu);

    }
    v11 = objc_claimAutoreleasedReturnValue(-[REMCDObject managedObjectContext](self, "managedObjectContext"));
    -[NSObject deleteObject:](v11, "deleteObject:", self);
    goto LABEL_19;
  }
  if (!-[REMCDObject isSharedRootObject](self, "isSharedRootObject")
    || -[REMCDObject isOwnedByCurrentUser](self, "isOwnedByCurrentUser"))
  {
    v14 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
      v21 = 138543618;
      v22 = v15;
      v23 = 2114;
      v24 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Begin recursiveMarkForDeletion:%{public}@ from %{public}@", (uint8_t *)&v21, 0x16u);

    }
    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v12 = self;
    v13 = 1;
    goto LABEL_13;
  }
  v19 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
    v21 = 138543362;
    v22 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Mark shared-to-me root %{public}@ for deletion and recursively deleted all child objects from local database", (uint8_t *)&v21, 0xCu);

  }
  -[REMCDObject markForDeletion](self, "markForDeletion");
  -[REMCDObject deleteAllChildrenFromLocalDatabase](self, "deleteAllChildrenFromLocalDatabase");
}

- (void)traverseObjectTreeUsingVisitedMap:(id)a3 handler:(id)a4
{
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  NSObject *obj;
  void *v39;
  void *v40;
  void *v41;
  uint64_t (**v42)(id, REMCDObject *);
  id v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  uint64_t v57;
  _BYTE v58[128];
  _BYTE v59[128];

  v43 = a3;
  v42 = (uint64_t (**)(id, REMCDObject *))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
  if (!v6)
  {
    obj = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(obj, OS_LOG_TYPE_FAULT))
      sub_10067F1E0(self);
    goto LABEL_34;
  }
  if (objc_msgSend(v43, "containsObject:", v6))
  {
    obj = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(obj, OS_LOG_TYPE_FAULT))
      sub_10067F260(self);
LABEL_34:

    goto LABEL_35;
  }
  v7 = v42[2](v42, self);
  objc_msgSend(v43, "addObject:", v6);
  if (v7)
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject entity](self, "entity"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relationshipsByName"));

    obj = v9;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    if (!v10)
      goto LABEL_34;
    v11 = v10;
    v35 = v6;
    v12 = *(_QWORD *)v51;
    v36 = *(_QWORD *)v51;
    while (1)
    {
      v13 = 0;
      v37 = v11;
      do
      {
        if (*(_QWORD *)v51 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject entity](self, "entity"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relationshipsByName"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v14));

        v44 = v17;
        if (objc_msgSend(v17, "deleteRule") == (id)2)
        {
          v39 = v13;
          v41 = v14;
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", v14));
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
          if (!v19)
            goto LABEL_30;
          v20 = v19;
          v21 = *(_QWORD *)v47;
          while (1)
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(_QWORD *)v47 != v21)
                objc_enumerationMutation(v18);
              v23 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
              v24 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject managedObjectContext](self, "managedObjectContext"));
              v45 = 0;
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "existingObjectWithID:error:", v23, &v45));
              v26 = v45;

              if (v26)
              {
                v28 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
                if (!os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
                  goto LABEL_28;
                v29 = objc_claimAutoreleasedReturnValue(-[REMCDObject entity](self, "entity"));
                v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject name](v29, "name"));
                *(_DWORD *)buf = 138543618;
                v55 = v41;
                v56 = 2114;
                v57 = (uint64_t)v30;
                _os_log_fault_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "Failed to fetch objects in {relationship: %{public}@} of object {type: %{public}@}", buf, 0x16u);

              }
              else
              {
                v31 = objc_opt_class(REMCDObject, v27);
                v32 = REMDynamicCast(v31, v25);
                v28 = objc_claimAutoreleasedReturnValue(v32);
                if (v28
                  && -[REMCDObject shouldCascadeMarkAsDeleteInto:forRelationship:](self, "shouldCascadeMarkAsDeleteInto:forRelationship:", v28, v44))
                {
                  -[NSObject traverseObjectTreeUsingVisitedMap:handler:](v28, "traverseObjectTreeUsingVisitedMap:handler:", v43, v42);
                  goto LABEL_28;
                }
                v29 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                {
                  v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject remObjectID](v28, "remObjectID"));
                  v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectID"));
                  *(_DWORD *)buf = 138412546;
                  v55 = v40;
                  v56 = 2112;
                  v57 = v33;
                  v34 = (void *)v33;
                  _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Skipped traverseObjectTreeUsingVisitedMap for {remObjectID: %@, managedObjectID: %@}", buf, 0x16u);

                }
              }

LABEL_28:
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
            if (!v20)
            {
LABEL_30:

              v12 = v36;
              v11 = v37;
              v13 = v39;
              break;
            }
          }
        }

        v13 = (char *)v13 + 1;
      }
      while (v13 != v11);
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      if (!v11)
      {
        v6 = v35;
        goto LABEL_34;
      }
    }
  }
LABEL_35:

}

- (void)recursiveMarkForDeletion:(BOOL)a3 usingVisitedMap:(id)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005D3FC;
  v4[3] = &unk_1007D9910;
  v5 = a3;
  v4[4] = self;
  -[REMCDObject traverseObjectTreeUsingVisitedMap:handler:](self, "traverseObjectTreeUsingVisitedMap:handler:", a4, v4);
}

- (void)deleteAllChildrenFromLocalDatabase
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005D56C;
  v4[3] = &unk_1007D9938;
  v4[4] = self;
  -[REMCDObject traverseObjectTreeUsingVisitedMap:handler:](self, "traverseObjectTreeUsingVisitedMap:handler:", v3, v4);

}

- (id)allChildObjects
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005D6B8;
  v9[3] = &unk_1007D9960;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  -[REMCDObject traverseObjectTreeUsingVisitedMap:handler:](self, "traverseObjectTreeUsingVisitedMap:handler:", v4, v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

- (void)fixValueBeforeMarkingForDeletionForKey:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("identifier")) & 1) == 0)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("externalIdentifier")))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject externalIdentifier](self, "externalIdentifier"));
      v6 = objc_claimAutoreleasedReturnValue(+[REMExternalSyncMetadataUtils encodeExternalIdentifierForMarkedForDeletionObject:](REMExternalSyncMetadataUtils, "encodeExternalIdentifierForMarkedForDeletionObject:", v5));

      -[REMCDObject setValue:forKey:](self, "setValue:forKey:", v6, v4);
LABEL_8:

      goto LABEL_9;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject entity](self, "entity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attributesByName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v4));
    v10 = objc_msgSend(v9, "attributeType");

    if (v10 != (id)700)
    {
      v6 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        sub_10067F394((uint64_t)v4, self);
      goto LABEL_8;
    }
    -[REMCDObject setValue:forKey:](self, "setValue:forKey:", 0, v4);
  }
LABEL_9:

}

- (void)fixValueBeforeUnmarkingForDeletionForKey:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("externalIdentifier")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject externalIdentifier](self, "externalIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[REMExternalSyncMetadataUtils decodeExternalIdentifierForMarkedForDeletionObject:](REMExternalSyncMetadataUtils, "decodeExternalIdentifierForMarkedForDeletionObject:", v4));

    -[REMCDObject setValue:forKey:](self, "setValue:forKey:", v5, v6);
  }

}

- (BOOL)_allowsObjectSupportedVersion
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  if (-[REMCDObject shouldMarkAsDeletedInsteadOfDeletingImmediately](self, "shouldMarkAsDeletedInsteadOfDeletingImmediately"))
  {
    return 1;
  }
  v5 = objc_msgSend((id)objc_opt_class(self, v3), "cdEntityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDAccount cdEntityName](REMCDAccount, "cdEntityName"));
  v8 = objc_msgSend(v6, "isEqual:", v7);

  return v8;
}

- (BOOL)isUnsupported
{
  return rem_isUnsupportedVersionByRuntime(-[REMCDObject effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"));
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;

  if (-[REMCDObject _allowsObjectSupportedVersion](self, "_allowsObjectSupportedVersion"))
  {
    v5 = -[REMCDObject minimumSupportedAppVersion](self, "minimumSupportedAppVersion");
    v6 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
      v13 = 138543874;
      v14 = v7;
      v15 = 2114;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "REMSupportedVersionUpdating: setMinimumSupportedVersion {newValue: %{public}@, oldValue: %{public}@, remObjectID: %{public}@}", (uint8_t *)&v13, 0x20u);

    }
    if (v5 != (id)a3)
    {
      -[REMCDObject setMinimumSupportedAppVersion:](self, "setMinimumSupportedAppVersion:", a3);
      v10 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
        v13 = 138543362;
        v14 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "REMSupportedVersionUpdating: setMinimumSupportedVersion: calling _markObjectDirtyForSupportedVersionValidation on {remObjectID: %{public}@}", (uint8_t *)&v13, 0xCu);

      }
      -[REMCDObject _markDirtyForEffectiveMinimumSupportedVersionValidation](self, "_markDirtyForEffectiveMinimumSupportedVersionValidation");
    }
  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      sub_10067F420();

  }
}

- (int64_t)effectiveMinimumSupportedVersion
{
  return (int64_t)-[REMCDObject effectiveMinimumSupportedAppVersion](self, "effectiveMinimumSupportedAppVersion");
}

- (void)setEffectiveMinimumSupportedVersion:(int64_t)a3
{
  NSObject *v5;

  if (-[REMCDObject _allowsObjectSupportedVersion](self, "_allowsObjectSupportedVersion"))
  {
    -[REMCDObject setEffectiveMinimumSupportedAppVersion:](self, "setEffectiveMinimumSupportedAppVersion:", a3);
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      sub_10067F4B4();

  }
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    sub_10067F548((uint64_t)self, (uint64_t)v3);

  return kREMSupportedVersionUnset;
}

+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    sub_10067F5E4((uint64_t)a1, (uint64_t)v3);

  return (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
}

- (void)_markDirtyForEffectiveMinimumSupportedVersionValidation
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;

  if (!-[REMCDObject isDeleted](self, "isDeleted"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject storeControllerManagedObjectContext](self, "storeControllerManagedObjectContext"));
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion"));

    if (!v3)
    {
      v6 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        sub_10067F680(self);

    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ic_permanentObjectID](self, "ic_permanentObjectID"));
    -[NSObject addObject:](v3, "addObject:", v4);
    goto LABEL_6;
  }
  v3 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ic_loggingIdentifier](self, "ic_loggingIdentifier"));
    v7 = 138543362;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "REMSupportedVersionUpdating: Not actually adding dirty object to managedObjectIDsHavingDirtyEffectiveMinimumSupportedVersion because this CoreData object is being deleted {ic_loggingIdentifier: %{public}@}", (uint8_t *)&v7, 0xCu);
LABEL_6:

  }
}

+ (id)relationshipsEligibleForEffectiveMinimumSupportedVersionPropagationWithEntity:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relationshipsByName"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relationshipsByName"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "destinationEntity"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
        v14 = objc_msgSend(v13, "rem_hasPrefixCaseInsensitive:", CFSTR("REMCD"));

        if (v14 && objc_msgSend(v11, "deleteRule") == (id)2)
          objc_msgSend(v16, "addObject:", v11);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  return v16;
}

- (BOOL)validateEffectiveMinimumSupportedVersionApplyingChange:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  NSObject *v10;
  int64_t v11;
  void *v12;
  int v14;
  int64_t v15;
  __int16 v16;
  int64_t v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  void *v21;

  v3 = a3;
  v5 = -[REMCDObject _allowsObjectSupportedVersion](self, "_allowsObjectSupportedVersion");
  if (!v5)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_10067F70C();
    goto LABEL_13;
  }
  v6 = -[REMCDObject minimumSupportedVersion](self, "minimumSupportedVersion");
  v7 = -[REMCDObject parentEffectiveMinimumSupportedVersion](self, "parentEffectiveMinimumSupportedVersion");
  v8 = -[REMCDObject effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion");
  if (v7 <= v6)
    v9 = v6;
  else
    v9 = v7;
  if (v8 != v9)
  {
    v11 = v8;
    if (v3)
      -[REMCDObject setEffectiveMinimumSupportedVersion:](self, "setEffectiveMinimumSupportedVersion:");
    v10 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
      v14 = 134218754;
      v15 = v6;
      v16 = 2048;
      v17 = v7;
      v18 = 2048;
      v19 = v11;
      v20 = 2114;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "REMSupportedVersionUpdating: validateEffectiveMinimumSupportedVersion indicates that my descendants should also be validated since my effective version changed {myVersion: %lld, parentEffectiveVersion: %lld, oldValue: %lld, remObjectID: %{public}@}", (uint8_t *)&v14, 0x2Au);

    }
LABEL_13:

    return v5;
  }
  return 0;
}

- (REMObjectID)remObjectID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject entity](self, "entity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));

  v6 = 0;
  if (v3 && v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[REMObjectID objectIDWithUUID:entityName:](REMObjectID, "objectIDWithUUID:entityName:", v3, v5));

  return (REMObjectID *)v6;
}

- (id)remObjectIDWithError:(id *)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
  v5 = (void *)v4;
  if (a3 && !v4)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", CFSTR("Failed to create REMObjectID: REMCDObject.identifier or REMCDObject.entity.name is nil.")));
  return v5;
}

+ (id)newObjectID
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectIDWithUUID:", v3));

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cdEntityName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[REMObjectID objectIDWithUUID:entityName:](REMObjectID, "objectIDWithUUID:entityName:", v4, v5));

  return v6;
}

+ (NSString)cdEntityName
{
  NSObject *v2;

  v2 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    sub_10067F7A0();

  return (NSString *)CFSTR("REMCDObject");
}

+ (BOOL)conformsToREMChangeTrackingIdentifiable
{
  return 1;
}

- (REMCDAccount)previousAccount
{
  return self->previousAccount;
}

- (void)setPreviousAccount:(id)a3
{
  objc_storeStrong((id *)&self->previousAccount, a3);
}

- (REMResolutionTokenMap)hack_resolutionTokenMapCopy
{
  return self->hack_resolutionTokenMapCopy;
}

- (void)setHack_resolutionTokenMapCopy:(id)a3
{
  objc_storeStrong((id *)&self->hack_resolutionTokenMapCopy, a3);
}

- (BOOL)hack_willSaveHandled
{
  return self->hack_willSaveHandled;
}

- (void)setHack_willSaveHandled:(BOOL)a3
{
  self->hack_willSaveHandled = a3;
}

- (BOOL)hack_didHandleShouldSyncUpDelete
{
  return self->hack_didHandleShouldSyncUpDelete;
}

- (void)setHack_didHandleShouldSyncUpDelete:(BOOL)a3
{
  self->hack_didHandleShouldSyncUpDelete = a3;
}

- (REMResolutionTokenMap)cached_CDResolutionMap
{
  return self->cached_CDResolutionMap;
}

- (void)setCached_CDResolutionMap:(id)a3
{
  objc_storeStrong((id *)&self->cached_CDResolutionMap, a3);
}

- (BOOL)spotlightIndexCountUpdated
{
  return self->spotlightIndexCountUpdated;
}

- (void)setSpotlightIndexCountUpdated:(BOOL)a3
{
  self->spotlightIndexCountUpdated = a3;
}

- (BOOL)validateForInsertion_handledJournalEntries
{
  return self->validateForInsertion_handledJournalEntries;
}

- (void)setValidateForInsertion_handledJournalEntries:(BOOL)a3
{
  self->validateForInsertion_handledJournalEntries = a3;
}

- (BOOL)validateForUpdate_handledJournalEntries
{
  return self->validateForUpdate_handledJournalEntries;
}

- (void)setValidateForUpdate_handledJournalEntries:(BOOL)a3
{
  self->validateForUpdate_handledJournalEntries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cached_CDResolutionMap, 0);
  objc_storeStrong((id *)&self->hack_resolutionTokenMapCopy, 0);
  objc_storeStrong((id *)&self->previousAccount, 0);
  objc_storeStrong((id *)&self->_ckServerShare, 0);
  objc_storeStrong((id *)&self->_ckServerRecord, 0);
}

+ (BOOL)conformsToICCloudObject
{
  return 1;
}

+ (NSString)ckRecordKeyForMinimumSupportedVersion
{
  return (NSString *)CFSTR("MinimumSupportedAppVersion");
}

+ (id)recordTypes
{
  uint64_t v3;
  NSString *v4;
  void *v5;

  v3 = objc_opt_class(a1, a2);
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Abstract method called -[%@ %@]"), v3, v5);

  return 0;
}

- (void)clearTransformedCKServerValueCachesOnDidTurnIntoFault
{
  CKRecord *ckServerRecord;
  CKShare *ckServerShare;

  ckServerRecord = self->_ckServerRecord;
  self->_ckServerRecord = 0;

  ckServerShare = self->_ckServerShare;
  self->_ckServerShare = 0;

}

- (void)insertCloudStateOnAwakeFromInsert
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject managedObjectContext](self, "managedObjectContext"));
  if (!v4)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      sub_10067FAC4();

  }
  v5 = (objc_class *)objc_opt_class(REMCKCloudState, v3);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", v7, v4));

  -[REMCDObject setCkCloudState:](self, "setCkCloudState:", v8);
}

- (void)insertCloudStateIfNeededOnAwakeFromFetch
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckCloudState](self, "ckCloudState"));

  if (!v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject shortLoggingDescription](self, "shortLoggingDescription"));
      v13 = 138412290;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Nil cloud state for %@. Sorry. Fixing now.", (uint8_t *)&v13, 0xCu);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject managedObjectContext](self, "managedObjectContext"));
    if (!v7)
    {
      v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        sub_10067FAC4();

    }
    v8 = (objc_class *)objc_opt_class(REMCKCloudState, v6);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", v10, v7));

    -[REMCDObject setCkCloudState:](self, "setCkCloudState:", v11);
  }
}

- (id)cloudAccount
{
  void *v2;
  void *v3;
  NSObject *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject parentCloudObject](self, "parentCloudObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cloudAccount"));

  if (!v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10067FAF0();

  }
  return v3;
}

- (NSString)accountCKIdentifier
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_opt_class(REMCDAccount, a2);
  v4 = REMDynamicCast(v3, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckIdentifier](self, "ckIdentifier"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject account](self, "account"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ckIdentifier"));

  }
  return (NSString *)v6;
}

- (void)setCkNeedsToBeFetchedFromCloud:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  v5 = objc_opt_class(NSNumber, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("ckNeedsToBeFetchedFromCloud")));
  v7 = REMDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9 != v3)
  {
    if (v3)
      -[REMCDObject clearServerRecord](self, "clearServerRecord");
    -[REMCDObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("ckNeedsToBeFetchedFromCloud"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    -[REMCDObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v10, CFSTR("ckNeedsToBeFetchedFromCloud"));

    -[REMCDObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("ckNeedsToBeFetchedFromCloud"));
    v11 = -[REMCDObject ckDirtyFlags](self, "ckDirtyFlags") & 0xFFFFFFFE | v3;
    -[REMCDObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("ckDirtyFlags"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", v11));
    -[REMCDObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v12, CFSTR("ckDirtyFlags"));

    -[REMCDObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("ckDirtyFlags"));
  }
}

- (void)_setCKIdentifierIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckIdentifier](self, "ckIdentifier"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject identifier](self, "identifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

    if (!v5)
    {
      v6 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        sub_10067FC1C();

    }
    -[REMCDObject setCkIdentifier:](self, "setCkIdentifier:", v5);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckIdentifier](self, "ckIdentifier"));

  if (!v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      sub_10067FB80();

  }
}

- (BOOL)shouldSyncUpDelete
{
  return (-[REMCDObject ckDirtyFlags](self, "ckDirtyFlags") >> 2) & 1;
}

- (void)setShouldSyncUpDeleteIfNeeded
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  if (-[REMCDObject _isInICloudAccount](self, "_isInICloudAccount")
    && !-[REMCDObject supportsDeletionByTTL](self, "supportsDeletionByTTL")
    && -[REMCDObject markedForDeletion](self, "markedForDeletion"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject managedObjectContext](self, "managedObjectContext"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transactionAuthor"));
    v5 = objc_msgSend(v4, "hasPrefix:", RDStoreControllerICCloudContextAuthor);

    if ((v5 & 1) == 0)
      -[REMCDObject setCkDirtyFlags:](self, "setCkDirtyFlags:", -[REMCDObject ckDirtyFlags](self, "ckDirtyFlags") | 4);
  }
}

- (void)updateChangeCount
{
  void *v3;
  _QWORD v4[5];

  if (-[REMCDObject _isInICloudAccount](self, "_isInICloudAccount"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject managedObjectContext](self, "managedObjectContext"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100061708;
    v4[3] = &unk_1007D7A60;
    v4[4] = self;
    objc_msgSend(v3, "performBlockAndWait:", v4);

  }
}

- (void)clearChangeCount
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckCloudState](self, "ckCloudState"));
  objc_msgSend(v3, "setCurrentLocalVersion:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckCloudState](self, "ckCloudState"));
  objc_msgSend(v4, "setLatestVersionSyncedToCloud:", 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[REMCDObject ckCloudState](self, "ckCloudState"));
  objc_msgSend(v5, "setLocalVersionDate:", 0);

}

- (void)clearServerRecord
{
  -[REMCDObject setCkServerRecord:](self, "setCkServerRecord:", 0);
}

+ (id)ckIdentifierFromRecordName:(id)a3
{
  id v3;
  char *v4;
  void *v5;

  v3 = a3;
  v4 = (char *)objc_msgSend(v3, "rangeOfString:", CFSTR("/"));
  v5 = v3;
  if (v4 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", v4 + 1));

  }
  return v5;
}

- (id)ckIdentifierFromRecordName:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a3;
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "ckIdentifierFromRecordName:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

+ (REMCDObject)objectWithRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSString *v37;
  NSString *v38;
  NSObject *v39;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "ckIdentifierFromRecordName:", v11));

  if (!v12)
    goto LABEL_10;
  v14 = objc_opt_class(RDStoreControllerManagedObjectContext, v13);
  v15 = REMDynamicCast(v14, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "batchFetchHelper"));
  v18 = v17;
  if (!v17)
    goto LABEL_14;
  if (objc_msgSend(v17, "isMissingCKIdentifier:accountIdentifier:", v12, v9))
  {
    v19 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v46 = v12;
      v47 = 2114;
      v48 = v9;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "(object.ckIdentifier: %{public}@, accountID: %{public}@) is in batchFetchHelper missing cache", buf, 0x16u);
    }
    goto LABEL_9;
  }
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "cachedManagedObjectForCKIdentifier:accountIdentifier:", v12, v9));
  if (!v20)
  {
    v25 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v46 = v12;
      v47 = 2114;
      v48 = v9;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "(object.ckIdentifier: %{public}@, accountID: %{public}@) does not correspond to a batchFetchHelper cachedManagedObject", buf, 0x16u);
    }

LABEL_14:
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ckIdentifier == %@"), v12));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", v26, v10));
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100061DF4;
    v43[3] = &unk_1007D9AD8;
    v44 = v9;
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "ic_objectPassingTest:", v43));

    if (!v19)
      goto LABEL_30;
    goto LABEL_15;
  }
  v22 = (void *)v20;
  v23 = objc_opt_class(REMCDObject, v21);
  v24 = REMDynamicCast(v23, v22);
  v19 = objc_claimAutoreleasedReturnValue(v24);

  if (!v19)
    goto LABEL_14;
  if ((-[NSObject isDeleted](v19, "isDeleted") & 1) != 0)
  {
LABEL_9:

LABEL_10:
    v19 = 0;
    goto LABEL_30;
  }

LABEL_15:
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject account](v19, "account"));

  if (!v28)
  {
    v29 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v46 = v12;
      v47 = 2114;
      v48 = v9;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "objectWithRecordID: (object.ckIdentifier: %{public}@, accountID: %{public}@) with nil account", buf, 0x16u);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDAccount accountWithCKIdentifier:context:](REMCDAccount, "accountWithCKIdentifier:context:", v9, v10));
    -[NSObject setAccount:](v19, "setAccount:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject account](v19, "account"));

    if (!v31)
    {
      v32 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_10067FCB8();

    }
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "ownerName"));

  v35 = objc_claimAutoreleasedReturnValue(-[NSObject ckZoneOwnerName](v19, "ckZoneOwnerName"));
  v36 = (void *)v35;
  v37 = CKCurrentUserDefaultName;
  if (v35)
    v37 = (NSString *)v35;
  v38 = v37;

  if ((objc_msgSend(v34, "isEqualToString:", v38) & 1) == 0)
  {
    v39 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject ckZoneOwnerName](v19, "ckZoneOwnerName"));
      *(_DWORD *)buf = 138543874;
      v46 = v41;
      v47 = 2114;
      v48 = v34;
      v49 = 2114;
      v50 = v42;
      _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "objectWithCKIdentifier zone mismatched: { recordName: %{public}@, zoneOwner: %{public}@ }, but found zoneOwner: %{public}@", buf, 0x20u);

    }
  }

LABEL_30:
  return (REMCDObject *)v19;
}

+ (id)failureCountQueue
{
  if (qword_1008527A8 != -1)
    dispatch_once(&qword_1008527A8, &stru_1007D9AF8);
  return (id)qword_1008527A0;
}

+ (id)failedToSyncCountsByCKIdentifier
{
  if (qword_1008527B8 != -1)
    dispatch_once(&qword_1008527B8, &stru_1007D9B18);
  return (id)qword_1008527B0;
}

- (int64_t)failedToSyncCount
{
  id v3;
  NSObject *v4;
  int64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v3 = objc_msgSend((id)objc_opt_class(self, a2), "failureCountQueue");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100062008;
  v7[3] = &unk_1007D9B40;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)setFailedToSyncCount:(int64_t)a3
{
  id v5;
  NSObject *v6;
  _QWORD v7[6];

  v5 = objc_msgSend((id)objc_opt_class(self, a2), "failureCountQueue");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100062134;
  v7[3] = &unk_1007D9438;
  v7[4] = self;
  v7[5] = a3;
  dispatch_sync(v6, v7);

}

+ (id)numberOfPushAttemptsToWaitByCKIdentifier
{
  if (qword_1008527C8 != -1)
    dispatch_once(&qword_1008527C8, &stru_1007D9B60);
  return (id)qword_1008527C0;
}

- (int64_t)numberOfPushAttemptsToWaitCount
{
  id v3;
  NSObject *v4;
  int64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v3 = objc_msgSend((id)objc_opt_class(self, a2), "failureCountQueue");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006231C;
  v7[3] = &unk_1007D9B40;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)setNumberOfPushAttemptsToWaitCount:(int64_t)a3
{
  id v5;
  NSObject *v6;
  _QWORD v7[6];

  v5 = objc_msgSend((id)objc_opt_class(self, a2), "failureCountQueue");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100062448;
  v7[3] = &unk_1007D9438;
  v7[4] = self;
  v7[5] = a3;
  dispatch_sync(v6, v7);

}

- (void)incrementFailureCounts
{
  NSObject *v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  unsigned int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  if (!-[REMCDObject numberOfPushAttemptsToWaitCount](self, "numberOfPushAttemptsToWaitCount"))
    -[REMCDObject setNumberOfPushAttemptsToWaitCount:](self, "setNumberOfPushAttemptsToWaitCount:", 3);
  -[REMCDObject setFailedToSyncCount:](self, "setFailedToSyncCount:", (char *)-[REMCDObject failedToSyncCount](self, "failedToSyncCount") + 1);
  v3 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class(self, v4);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = -[REMCDObject failedToSyncCount](self, "failedToSyncCount");
    v9 = -[REMCDObject failedToSyncCount](self, "failedToSyncCount");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject loggingDescription](self, "loggingDescription"));
    v11 = 138413570;
    v12 = v7;
    v13 = 1024;
    v14 = v8;
    v15 = 1024;
    v16 = 3;
    v17 = 1024;
    v18 = v9;
    v19 = 1024;
    v20 = 6;
    v21 = 2112;
    v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ failed to be pushed. Incrementing failedToSyncCount, failure (%d/%d) before being temporarily ignored. (%d/%d) before deleting change tokens and full re-sync. %@", (uint8_t *)&v11, 0x2Eu);

  }
  if (-[REMCDObject failedToSyncCount](self, "failedToSyncCount") >= 6)
  {
    -[REMCDObject clearServerRecord](self, "clearServerRecord");
    -[REMCDObject deleteChangeTokensAndReSync](self, "deleteChangeTokensAndReSync");
  }
}

- (void)decrementFailureCounts
{
  NSObject *v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  unsigned int v13;
  __int16 v14;
  void *v15;

  if (-[REMCDObject numberOfPushAttemptsToWaitCount](self, "numberOfPushAttemptsToWaitCount") >= 1)
    -[REMCDObject setNumberOfPushAttemptsToWaitCount:](self, "setNumberOfPushAttemptsToWaitCount:", (char *)-[REMCDObject numberOfPushAttemptsToWaitCount](self, "numberOfPushAttemptsToWaitCount") - 1);
  v3 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class(self, v4);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = -[REMCDObject numberOfPushAttemptsToWaitCount](self, "numberOfPushAttemptsToWaitCount");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject loggingDescription](self, "loggingDescription"));
    v10 = 138412802;
    v11 = v7;
    v12 = 1024;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Decrementing failure counts for %@, %d push attempts before it is retried. %@", (uint8_t *)&v10, 0x1Cu);

  }
}

- (void)deleteChangeTokensAndReSync
{
  NSObject *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_10067FDD4();

  v5 = objc_msgSend((id)objc_opt_class(self, v4), "failureCountQueue");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006284C;
  block[3] = &unk_1007D7A60;
  block[4] = self;
  dispatch_async(v6, block);

}

- (void)resetFailureCounts
{
  -[REMCDObject setFailedToSyncCount:](self, "setFailedToSyncCount:", 0);
  -[REMCDObject setNumberOfPushAttemptsToWaitCount:](self, "setNumberOfPushAttemptsToWaitCount:", 0);
}

- (BOOL)shouldBeIgnoredForSync
{
  NSObject *v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  void *v21;

  if (-[REMCDObject failedToSyncCount](self, "failedToSyncCount") < 3
    || -[REMCDObject numberOfPushAttemptsToWaitCount](self, "numberOfPushAttemptsToWaitCount") < 1)
  {
    return 0;
  }
  v3 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class(self, v4);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = -[REMCDObject failedToSyncCount](self, "failedToSyncCount");
    v9 = -[REMCDObject numberOfPushAttemptsToWaitCount](self, "numberOfPushAttemptsToWaitCount");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject loggingDescription](self, "loggingDescription"));
    v12 = 138413314;
    v13 = v7;
    v14 = 1024;
    v15 = v8;
    v16 = 1024;
    v17 = 3;
    v18 = 1024;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ failed to be pushed %d times. Max number of retries is %d. It will now be ignored for %d push attempts. %@", (uint8_t *)&v12, 0x28u);

  }
  return 1;
}

- (id)recordName
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;

  -[REMCDObject _setCKIdentifierIfNecessary](self, "_setCKIdentifierIfNecessary");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckIdentifier](self, "ckIdentifier"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject recordType](self, "recordType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckIdentifier](self, "ckIdentifier"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v4, v5));

  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_10067FE94();

    v6 = &stru_1007FE210;
  }
  return v6;
}

- (id)recordZoneName
{
  uint64_t v3;
  NSString *v4;
  void *v5;

  v3 = objc_opt_class(self, a2);
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Abstract method called -[%@ %@]"), v3, v5);

  return CFSTR("Reminders");
}

- (NSString)ckZoneOwnerName
{
  void *v3;
  void *v4;
  void *v5;

  -[REMCDObject willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("ckZoneOwnerName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject primitiveCkZoneOwnerName](self, "primitiveCkZoneOwnerName"));
  -[REMCDObject didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("ckZoneOwnerName"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject parentCloudObject](self, "parentCloudObject"));
    v5 = v4;
    if (v4)
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ckZoneOwnerName"));
    else
      v3 = 0;

  }
  return (NSString *)v3;
}

- (id)recordID
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  void *v8;
  NSString *v9;
  int64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject managedObjectContext](self, "managedObjectContext"));

  if (!v3)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_10067FF30();
    goto LABEL_16;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject recordName](self, "recordName"));

  if (!v4)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_10067FFBC();
    goto LABEL_16;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject recordName](self, "recordName"));
  v6 = objc_msgSend(v5, "isEqualToString:", &stru_1007FE210);

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_100680048();
LABEL_16:

    v15 = 0;
    return v15;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject recordZoneName](self, "recordZoneName"));

  if (!v8)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_1006800D4();
    goto LABEL_16;
  }
  v9 = (NSString *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckZoneOwnerName](self, "ckZoneOwnerName"));
  if (!v9)
    v9 = CKCurrentUserDefaultName;
  v10 = +[CKRecordZoneID ic_defaultDatabaseScopeForOwnerName:](CKRecordZoneID, "ic_defaultDatabaseScopeForOwnerName:", v9);
  v11 = objc_alloc((Class)CKRecordZoneID);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject recordZoneName](self, "recordZoneName"));
  v13 = objc_msgSend(v11, "initWithZoneName:ownerName:databaseScope:", v12, v9, v10);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject recordName](self, "recordName"));
  v15 = objc_msgSend(objc_alloc((Class)CKRecordID), "initWithRecordName:zoneID:", v14, v13);

  return v15;
}

- (int64_t)rd_ckDatabaseScope
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject recordID](self, "recordID"));
  v3 = objc_msgSend(v2, "rd_ckDatabaseScope");

  return (int64_t)v3;
}

- (id)recordType
{
  uint64_t v3;
  NSString *v4;
  void *v5;

  v3 = objc_opt_class(self, a2);
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Abstract method called -[%@ %@]"), v3, v5);

  return 0;
}

- (BOOL)needsToBeDeletedFromCloud
{
  if (!-[REMCDObject supportsDeletionByTTL](self, "supportsDeletionByTTL")
    && -[REMCDObject isInCloud](self, "isInCloud")
    && -[REMCDObject markedForDeletion](self, "markedForDeletion"))
  {
    return -[REMCDObject shouldSyncUpDelete](self, "shouldSyncUpDelete");
  }
  else
  {
    return 0;
  }
}

- (BOOL)_isInICloudAccount
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;

  v3 = objc_opt_class(REMCDAccount, a2);
  if ((objc_opt_isKindOfClass(self, v3) & 1) != 0)
  {
    v5 = objc_opt_class(REMCDAccount, v4);
    v6 = REMDynamicCast(v5, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject account](self, "account"));
  }
  v8 = v7;
  if ((objc_msgSend(v7, "debugSyncDisabled") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accountTypeHost"));
    v9 = objc_msgSend(v10, "isCloudKit");

  }
  return v9;
}

- (BOOL)isInICloudAccount
{
  REMCDObject *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject managedObjectContext](self, "managedObjectContext"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100063098;
  v5[3] = &unk_1007D7AF8;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isValidObject
{
  REMCDObject *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject managedObjectContext](self, "managedObjectContext"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100063184;
  v5[3] = &unk_1007D7AF8;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  return 0;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDAccount cloudKitAccountWithCKIdentifier:context:](REMCDAccount, "cloudKitAccountWithCKIdentifier:context:", v9, v10));
  if (v11)
  {
    v12 = objc_msgSend(a1, "newCloudObjectForRecord:account:context:", v8, v11, v10);
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "recordName"));
      v18 = (objc_class *)objc_opt_class(a1, v17);
      v19 = NSStringFromClass(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = 138543874;
      v22 = v16;
      v23 = 2114;
      v24 = v9;
      v25 = 2114;
      v26 = v20;
      _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Cannot get CK account for newCloudObjectForRecord {record: %{public}@, accountID: %{public}@, class: %{public}@}", (uint8_t *)&v21, 0x20u);

    }
    v12 = 0;
  }

  return v12;
}

+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5
{
  return 0;
}

+ (id)newObjectWithCKRecordName:(id)a3 context:(id)a4 account:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "ckIdentifierFromRecordName:", a3));
  v11 = objc_msgSend(a1, "newObjectWithCKIdentifier:context:account:", v10, v9, v8);

  return v11;
}

+ (id)newObjectWithCKIdentifier:(id)a3 context:(id)a4 account:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  NSObject *v17;
  void *v18;
  _BOOL4 v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void *v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[6];
  _BYTE buf[24];
  uint64_t (*v50)(uint64_t, uint64_t);
  _BYTE v51[20];
  __int16 v52;
  void *v53;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(a1, "isAbstract"))
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cdEntityName"));
    if (!v11)
    {
      v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        sub_100680414();

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v50 = sub_100063A44;
      *(_QWORD *)v51 = sub_100063A54;
      *(_QWORD *)&v51[8] = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "entity"));
      v14 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (!v14)
      {
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_100063A5C;
        v48[3] = &unk_1007D9A50;
        v48[4] = buf;
        v48[5] = a1;
        objc_msgSend(v9, "performBlockAndWait:", v48);
        v14 = *(void **)(*(_QWORD *)&buf[8] + 40);
      }
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
      if (!v11)
      {
        v39 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
          sub_1006803E8();

      }
      _Block_object_dispose(buf, 8);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDAccount cdEntityName](REMCDAccount, "cdEntityName"));
    v16 = -[NSObject isEqual:](v11, "isEqual:", v15);

    if (v16)
    {
      v17 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        sub_1006801EC();
    }
    else if (v10)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ckIdentifier"));
      v19 = v18 == 0;

      if (!v19)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", v11, v9));
        if (!v12)
        {
          v40 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
          if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
          {
            v42 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ckIdentifier"));
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v11;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v8;
            *(_WORD *)&buf[22] = 2114;
            v50 = v42;
            _os_log_fault_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_FAULT, "rem_log_fault_if (!newObject) -- Unexpected error: Could not create and insert new object with {entity: %{public}@, ckIdentifier: %{public}@, account.ckID: %{public}@}", buf, 0x20u);

          }
        }
        v20 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v8);
        objc_msgSend(v12, "setIdentifier:", v20);

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        LODWORD(v20) = v21 == 0;

        if ((_DWORD)v20)
        {
          v22 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
            sub_100680384();

          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
          objc_msgSend(v12, "setIdentifier:", v23);

        }
        objc_msgSend(v12, "setCkIdentifier:", v8);
        objc_msgSend(v12, "setAccount:", v10);
        v25 = objc_opt_class(RDStoreControllerManagedObjectContext, v24);
        v26 = REMDynamicCast(v25, v9);
        v17 = objc_claimAutoreleasedReturnValue(v26);
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject batchFetchHelper](v17, "batchFetchHelper"));
        if (!v47)
        {
          v41 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
            sub_100680358();

        }
        if (v8 && v12)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountCKIdentifier"));
          objc_msgSend(v47, "setCachedManagedObject:forCKIdentifier:accountIdentifier:", v12, v8, v28);

        }
        v29 = objc_opt_class(REMCDReminder, v27);
        v30 = REMDynamicCast(v29, v12);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        v32 = v31;
        if (v31)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "identifier"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "UUIDString"));
          objc_msgSend(v32, "setDaCalendarItemUniqueIdentifier:", v34);

        }
        v35 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "shortLoggingDescription"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
          v44 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ckIdentifier"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "daCalendarItemUniqueIdentifier"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ckIdentifier"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v12, "isPlaceholder")));
          *(_DWORD *)buf = 138544642;
          *(_QWORD *)&buf[4] = v46;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v45;
          *(_WORD *)&buf[22] = 2114;
          v50 = v44;
          *(_WORD *)v51 = 2114;
          *(_QWORD *)&v51[2] = v43;
          *(_WORD *)&v51[10] = 2114;
          *(_QWORD *)&v51[12] = v36;
          v52 = 2114;
          v53 = v37;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Creating REMCDObject for CloudKit: %{public}@ .identifier=%{public}@ .ckIdentifier=%{public}@ .daCalendarItemUniqueIdentifier=%{public}@ .account.ckIdentifier=%{public}@, isPlaceholder=%{public}@", buf, 0x3Eu);

        }
        goto LABEL_36;
      }
      v17 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        sub_1006802D4((objc_class *)a1);
    }
    else
    {
      v17 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        sub_100680250((objc_class *)a1);
    }
    v12 = 0;
LABEL_36:

    goto LABEL_37;
  }
  v11 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    sub_100680160((objc_class *)a1, (uint64_t)v8, v11);
  v12 = 0;
LABEL_37:

  return v12;
}

+ (id)newPlaceholderObjectForRecordID:(id)a3 account:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "ckIdentifierFromRecordName:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));
  v14 = objc_msgSend(a1, "newObjectWithCKIdentifier:context:account:", v12, v8, v9);

  objc_msgSend(v14, "setCkNeedsInitialFetchFromCloud:", 1);
  objc_msgSend(v14, "setInCloud:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectCkZoneOwnerNameFromCKRecordZoneID:", v13));
  objc_msgSend(v14, "setCkZoneOwnerName:", v15);

  objc_msgSend(v14, "setAccount:", v9);
  return v14;
}

+ (id)allCloudObjectsPredicate
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;
  unsigned int v8;
  NSObject *v10;
  id v11;

  v3 = (objc_class *)objc_opt_class(REMCDObject, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = NSStringFromClass((Class)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_100680440(v10);

    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("MethodCalledOnAbstractClass"), CFSTR("Should not call +allCloudObjectsPredicate on the abstract 'REMCDObject'"), 0)));
    objc_exception_throw(v11);
  }
  return +[REMCDAccount predicateForCloudKitAccountsWithKeyPathPrefix:](REMCDAccount, "predicateForCloudKitAccountsWithKeyPathPrefix:", CFSTR("account"));
}

+ (id)allCloudObjectsInContext:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allCloudObjectsPredicate"));
  v6 = NSStringFromSelector("ckCloudState");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v11 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "ic_objectsMatchingPredicate:sortDescriptors:propertiesToFetch:relationshipKeyPathsForPrefetching:context:", v5, 0, 0, v8, v4));

  return v9;
}

+ (id)allCloudObjectIDsInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allCloudObjectsPredicate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "ic_objectIDsMatchingPredicate:context:", v5, v4));

  return v6;
}

+ (id)allDirtyCloudObjectsPredicate
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ckDirtyFlags > 0"));
}

+ (id)allDirtyCloudObjectIDsInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allDirtyCloudObjectsPredicate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "ic_objectIDsMatchingPredicate:context:", v5, v4));

  return v6;
}

- (void)recursivelyFixCrossZoneRelationshipWithVisitedMap:(id)a3 perObjectHandler:(id)a4
{
  id v6;
  id v7;
  REMCDObject *v8;
  _QWORD v9[4];
  REMCDObject *v10;
  id v11;

  v6 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100063EB8;
  v9[3] = &unk_1007D9B88;
  v10 = self;
  v11 = v6;
  v7 = v6;
  v8 = v10;
  -[REMCDObject traverseObjectTreeUsingVisitedMap:handler:](v8, "traverseObjectTreeUsingVisitedMap:handler:", a3, v9);

}

- (id)newlyCreatedRecord
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerRecord](self, "ckServerRecord"));
  v4 = objc_msgSend(v3, "copy");

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject recordID](self, "recordID"));
    if (v5)
    {
      v6 = objc_alloc((Class)CKRecord);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject recordType](self, "recordType"));
      v4 = objc_msgSend(v6, "initWithRecordType:recordID:", v7, v5);

    }
    else
    {
      v8 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        sub_100680528(self, v8);

      v4 = 0;
    }

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject parentCloudObject](self, "parentCloudObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordID"));
  v11 = v10;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneID"));
    v15 = objc_msgSend(v12, "isEqual:", v14);

    if (v15)
    {
      objc_msgSend(v4, "setParent:", 0);
      v16 = objc_msgSend(objc_alloc((Class)CKReference), "initWithRecordID:action:", v11, 0);
      objc_msgSend(v4, "setParent:", v16);
    }
    else
    {
      v16 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        v31 = (void *)objc_opt_class(self, v17);
        v38 = v31;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "ic_loggingDescription"));
        v35 = (void *)objc_opt_class(v9, v34);
        v37 = v35;
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ic_loggingDescription"));
        *(_DWORD *)buf = 138544130;
        v40 = v31;
        v41 = 2114;
        v42 = v33;
        v43 = 2114;
        v44 = v35;
        v45 = 2114;
        v46 = v36;
        _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "Not creating cross-zone parent record relationship from %{public}@ %{public}@ to parent %{public}@ %{public}@", buf, 0x2Au);

      }
    }

  }
  else if (objc_msgSend(v4, "ic_isOwnedByCurrentUser"))
  {
    objc_msgSend(v4, "setParent:", 0);
  }
  if (-[REMCDObject supportsDeletionByTTL](self, "supportsDeletionByTTL")
    && (-[REMCDObject isOwnedByCurrentUser](self, "isOwnedByCurrentUser")
     || !-[REMCDObject isSharedRootObject](self, "isSharedRootObject")))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[REMCDObject markedForDeletion](self, "markedForDeletion")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("Deleted"));

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDObject ckRecordKeyForMinimumSupportedVersion](REMCDObject, "ckRecordKeyForMinimumSupportedVersion"));
  v20 = -[REMCDObject minimumSupportedVersion](self, "minimumSupportedVersion");
  if (v20 == kREMSupportedVersionUnset)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v19);
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[REMCDObject minimumSupportedVersion](self, "minimumSupportedVersion")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, v19);

  }
  v22 = objc_autoreleasePoolPush();
  v24 = objc_opt_class(REMResolutionTokenMap, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject resolutionTokenMap](self, "resolutionTokenMap"));
  v26 = REMDynamicCast(v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objc_toJSONString"));
    if (v28)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("ResolutionTokenMap"));
    }
    else
    {
      v29 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_1006804C8();

    }
  }

  objc_autoreleasePoolPop(v22);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1008047A0, CFSTR("Imported"));

  return v4;
}

- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  unsigned int v16;
  unsigned int v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  NSObject *v33;
  REMCDObject *v34;
  uint64_t v35;
  NSObject *v36;
  int v37;
  void *v38;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject recordType](self, "recordType"));
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    v36 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      sub_1006806C0(v6);

  }
  v11 = -[REMCDObject hasSuccessfullyPushedLatestVersionToCloud](self, "hasSuccessfullyPushedLatestVersionToCloud");
  self->_mergeDataRefusedToMergeMarkedForDeletion = 0;
  self->_mergeDataRevertedLocallyMarkedForDeletion = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Deleted")));

  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Deleted")));
    v15 = objc_msgSend(v14, "BOOLValue");

    v16 = -[REMCDObject markedForDeletion](self, "markedForDeletion");
    if ((_DWORD)v15 != -[REMCDObject markedForDeletion](self, "markedForDeletion"))
    {
      v17 = v15 ^ 1 | v11;
      v18 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v17 == 1)
      {
        if (v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject shortLoggingDescription](self, "shortLoggingDescription"));
          v37 = 138543362;
          v38 = v20;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Setting %{public}@ marked for deletion when merging data from record", (uint8_t *)&v37, 0xCu);

        }
        -[REMCDObject setMarkedForDeletion:](self, "setMarkedForDeletion:", v15);
      }
      else
      {
        if (v19)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject shortLoggingDescription](self, "shortLoggingDescription"));
          v37 = 138543362;
          v38 = v21;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Setting mergeDataRefusedToMergeMarkedForDeletion=YES for %{public}@ when merging data from record", (uint8_t *)&v37, 0xCu);

        }
        self->_mergeDataRefusedToMergeMarkedForDeletion = 1;
      }
    }
    if (((v15 | v16 ^ 1) & 1) == 0)
    {
      -[REMCDObject unmarkForDeletion](self, "unmarkForDeletion");
      v22 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject shortLoggingDescription](self, "shortLoggingDescription"));
        v37 = 138543362;
        v38 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Setting mergeDataRevertedLocallyMarkedForDeletion=YES for %{public}@ when merging data from record", (uint8_t *)&v37, 0xCu);

      }
      self->_mergeDataRevertedLocallyMarkedForDeletion = 1;
    }
  }
  self->_shouldPerformCloudSchemaCatchUpSync = 0;
  v24 = objc_opt_class(RDStoreControllerManagedObjectContext, v13);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject managedObjectContext](self, "managedObjectContext"));
  v26 = REMDynamicCast(v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "cloudSchemaCatchUpSyncContextsByAccountIdentifier"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", v7));

  if (objc_msgSend(v29, "shouldPerformCloudSchemaCatchUpSync"))
    self->_shouldPerformCloudSchemaCatchUpSync = 1;
  v31 = objc_opt_class(self, v30);
  v32 = objc_opt_respondsToSelector(v31, "mergeSystemPropertiesIntoCDObject:fromCKRecord:");
  v33 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  v34 = (REMCDObject *)v33;
  if ((v32 & 1) != 0)
  {
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      sub_1006805A8();

    v34 = self;
    objc_msgSend((id)objc_opt_class(v34, v35), "mergeSystemPropertiesIntoCDObject:fromCKRecord:", v34, v6);
  }
  else if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
  {
    sub_100680634();
  }

}

+ (BOOL)shouldSyncToCloud
{
  return 1;
}

- (BOOL)needsToBePushedToCloud
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  int64_t v8;
  unsigned __int8 v9;
  void *v11;
  void *v12;

  if (!objc_msgSend((id)objc_opt_class(self, a2), "shouldSyncToCloud"))
    return 0;
  if ((-[REMCDObject ckNeedsToBeFetchedFromCloud](self, "ckNeedsToBeFetchedFromCloud") & 1) != 0)
    return 0;
  if ((-[REMCDObject ckNeedsInitialFetchFromCloud](self, "ckNeedsInitialFetchFromCloud") & 1) != 0)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckCloudState](self, "ckCloudState"));
  v4 = objc_msgSend(v3, "latestVersionSyncedToCloud");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckCloudState](self, "ckCloudState"));
  v6 = objc_msgSend(v5, "currentLocalVersion");

  if ((uint64_t)v4 >= (uint64_t)v6)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckCloudState](self, "ckCloudState"));
  v8 = -[REMCDObject isPushingSameOrLaterThanVersion:](self, "isPushingSameOrLaterThanVersion:", objc_msgSend(v7, "currentLocalVersion"));

  if (v8
    || -[REMCDObject markedForDeletion](self, "markedForDeletion")
    && !-[REMCDObject isInCloud](self, "isInCloud"))
  {
    return 0;
  }
  if (-[REMCDObject isSharedReadOnly](self, "isSharedReadOnly"))
    return 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject parentCloudObject](self, "parentCloudObject"));
  if (objc_msgSend(v11, "ckNeedsInitialFetchFromCloud"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject parentCloudObject](self, "parentCloudObject"));
    v9 = objc_msgSend(v12, "isInCloud");

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)forcePushToCloud
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  if (-[REMCDObject isPlaceholder](self, "isPlaceholder"))
  {
    v4 = objc_opt_class(self, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckIdentifier](self, "ckIdentifier"));
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Placeholder %@ { %@ } forcePushToCloud"), v4, v5));

    objc_msgSend((id)objc_opt_class(ICCloudContext, v6), "faultAndPromptToFileRadarWithICTap2RadarType:title:description:logMessage:", 4, CFSTR("Placeholder forcePushToCloud"), &stru_1007FE210, v7);
  }
  else
  {
    -[REMCDObject setCkNeedsToBeFetchedFromCloud:](self, "setCkNeedsToBeFetchedFromCloud:", 0);
    -[REMCDObject setCkNeedsInitialFetchFromCloud:](self, "setCkNeedsInitialFetchFromCloud:", 0);
    if (-[REMCDObject markedForDeletion](self, "markedForDeletion"))
      -[REMCDObject setInCloud:](self, "setInCloud:", 1);
    -[REMCDObject updateChangeCount](self, "updateChangeCount");
  }
}

+ (id)keyPathsForValuesAffectingNeedsToBePushedToCloud
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("ckNeedsToBeFetchedFromCloud"), CFSTR("ckNeedsInitialFetchFromCloud"), 0);
}

- (BOOL)hasSuccessfullyPushedLatestVersionToCloud
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckCloudState](self, "ckCloudState"));
  v4 = objc_msgSend(v3, "latestVersionSyncedToCloud");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckCloudState](self, "ckCloudState"));
  LOBYTE(v4) = (uint64_t)v4 >= (uint64_t)objc_msgSend(v5, "currentLocalVersion");

  return (char)v4;
}

- (BOOL)needsToFetchAfterServerRecordChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  unsigned __int8 v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i)));
        v12 = objc_msgSend((id)objc_opt_class(self, v11), "needsToReFetchServerRecordValue:", v10);

        if ((v12 & 1) != 0)
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

+ (BOOL)needsToReFetchServerRecordValue:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v6 = objc_opt_class(CKAsset, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileURL"));
    v9 = v8 == 0;

  }
  else
  {
    v10 = objc_opt_class(NSArray, v7);
    if ((objc_opt_isKindOfClass(v4, v10) & 1) != 0)
    {
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v11 = v4;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v11);
            if ((objc_msgSend(a1, "needsToReFetchServerRecordValue:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), (_QWORD)v17) & 1) != 0)
            {

              v9 = 1;
              goto LABEL_15;
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v13)
            continue;
          break;
        }
      }

    }
    v9 = 0;
  }
LABEL_15:

  return v9;
}

- (void)objectWasDeletedFromCloud
{
  -[REMCDObject setInCloud:](self, "setInCloud:", 0);
}

- (void)objectWasDeletedFromCloudByAnotherDevice
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  -[REMCDObject setInCloud:](self, "setInCloud:", 0);
  if (-[REMCDObject isSharedViaICloud](self, "isSharedViaICloud")
    && !-[REMCDObject isOwnedByCurrentUser](self, "isOwnedByCurrentUser"))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject shortLoggingDescription](self, "shortLoggingDescription"));
      v7 = 138412290;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Shared object was deleted %@", (uint8_t *)&v7, 0xCu);

    }
    -[REMCDObject setMarkedForDeletion:](self, "setMarkedForDeletion:", 1);
    goto LABEL_11;
  }
  if (-[REMCDObject hasSuccessfullyPushedLatestVersionToCloud](self, "hasSuccessfullyPushedLatestVersionToCloud"))
  {
    v3 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject shortLoggingDescription](self, "shortLoggingDescription"));
      v7 = 138412290;
      v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Marking %@ for deletion after being deleted from cloud by another device", (uint8_t *)&v7, 0xCu);

    }
    -[REMCDObject setMarkedForDeletion:](self, "setMarkedForDeletion:", 1);
    if (-[REMCDObject shouldBeDeletedFromLocalDatabase](self, "shouldBeDeletedFromLocalDatabase"))
LABEL_11:
      -[REMCDObject deleteFromLocalDatabase](self, "deleteFromLocalDatabase");
  }
}

- (void)objectWillBePushedToCloudWithOperation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[REMCDObject ckCloudState](self, "ckCloudState"));
  -[REMCDObject setVersion:forOperation:](self, "setVersion:forOperation:", objc_msgSend(v5, "currentLocalVersion"), v4);

}

- (void)objectFailedToBePushedToCloudWithOperation:(id)a3 recordID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  unsigned int v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "database"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "container"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "options"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accountOverrideInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accountID"));

  if (!objc_msgSend(v15, "length"))
  {
    v16 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      sub_100680750(v8);

  }
  v17 = (uint64_t)objc_msgSend(v10, "code");
  if (v17 > 19)
  {
    if (v17 > 25)
    {
      if (v17 != 26)
      {
        if (v17 != 31)
          goto LABEL_26;
        v26 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ic_loggingDescription"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_loggingDescription"));
          *(_DWORD *)buf = 138544130;
          v43 = v15;
          v44 = 2112;
          v45 = v36;
          v46 = 2114;
          v47 = v37;
          v48 = 2114;
          v49 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Reference violation for server record in account ID %{public}@: %@ %{public}@: %{public}@", buf, 0x2Au);

        }
        -[REMCDObject fixBrokenReferences](self, "fixBrokenReferences");
      }
    }
    else if (v17 != 20 && v17 != 22)
    {
      goto LABEL_26;
    }
  }
  else if ((unint64_t)(v17 - 6) >= 2)
  {
    if (v17 != 11)
    {
      if (v17 == 14)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CKRecordChangedErrorServerRecordKey));

        if (v20)
        {
          v21 = -[REMCDObject needsToFetchAfterServerRecordChanged:](self, "needsToFetchAfterServerRecordChanged:", v20);
          v22 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
          v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
          if (!v21)
          {
            if (v23)
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject ic_loggingDescription](v20, "ic_loggingDescription"));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_loggingDescription"));
              *(_DWORD *)buf = 138544130;
              v43 = v15;
              v44 = 2112;
              v45 = v30;
              v46 = 2114;
              v47 = v31;
              v48 = 2112;
              v49 = v10;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Server record changed in account ID %{public}@: %@ %{public}@: %@", buf, 0x2Au);

            }
            if (v15)
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerRecord](self, "ckServerRecord"));
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "recordID"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "zoneID"));
              v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject recordID](v20, "recordID"));
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "zoneID"));
              v40 = objc_msgSend(v33, "isEqual:", v35);

              if ((v40 & 1) == 0)
                -[REMCDObject setCkServerRecord:](self, "setCkServerRecord:", 0);
              -[REMCDObject objectWasFetchedFromCloudWithRecord:accountID:](self, "objectWasFetchedFromCloudWithRecord:accountID:", v20, v15);
            }
            goto LABEL_36;
          }
          if (!v23)
          {
LABEL_29:

            -[REMCDObject setCkNeedsToBeFetchedFromCloud:](self, "setCkNeedsToBeFetchedFromCloud:", 1);
LABEL_36:

            goto LABEL_37;
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject ic_loggingDescription](v20, "ic_loggingDescription"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_loggingDescription"));
          *(_DWORD *)buf = 138544130;
          v43 = v15;
          v44 = 2112;
          v45 = v24;
          v46 = 2112;
          v47 = v25;
          v48 = 2112;
          v49 = v10;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Server record changed (needs refetch) in account ID %{public}@: %@ %@: %@", buf, 0x2Au);
        }
        else
        {
          v22 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
            goto LABEL_29;
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject shortLoggingDescription](self, "shortLoggingDescription"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_loggingDescription"));
          *(_DWORD *)buf = 138544130;
          v43 = v15;
          v44 = 2114;
          v45 = v24;
          v46 = 2114;
          v47 = v25;
          v48 = 2112;
          v49 = v10;
          _os_log_fault_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "Server record changed with no server record in the error in account ID %{public}@: %{public}@ %{public}@: %@", buf, 0x2Au);
        }

        goto LABEL_29;
      }
LABEL_26:
      v20 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ic_loggingDescription"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_loggingDescription"));
        *(_DWORD *)buf = 138544130;
        v43 = v15;
        v44 = 2112;
        v45 = v28;
        v46 = 2114;
        v47 = v29;
        v48 = 2112;
        v49 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Error pushing in account ID %{public}@: %@ %{public}@: %@", buf, 0x2Au);

      }
      goto LABEL_36;
    }
    v27 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ic_loggingDescription"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_loggingDescription"));
      *(_DWORD *)buf = 138544130;
      v43 = v15;
      v44 = 2112;
      v45 = v38;
      v46 = 2114;
      v47 = v39;
      v48 = 2112;
      v49 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Invalid cached server record in account ID %{public}@: %@ %{public}@: %@", buf, 0x2Au);

    }
    -[REMCDObject setCkServerRecord:](self, "setCkServerRecord:", 0);
  }
LABEL_37:
  objc_msgSend((id)objc_opt_class(self, v18), "deleteTemporaryAssetFilesForOperation:", v8);

}

- (void)objectWasPushedToCloudWithOperation:(id)a3 serverRecord:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  NSObject *v19;

  v6 = a4;
  v7 = a3;
  v8 = -[REMCDObject versionForOperation:](self, "versionForOperation:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckCloudState](self, "ckCloudState"));
  v10 = objc_msgSend(v9, "latestVersionSyncedToCloud");

  if (v8 > (uint64_t)v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckCloudState](self, "ckCloudState"));
    objc_msgSend(v12, "setLatestVersionSyncedToCloud:", v8);

  }
  objc_msgSend((id)objc_opt_class(self, v11), "deleteTemporaryAssetFilesForOperation:", v7);

  -[REMCDObject resetFailureCounts](self, "resetFailureCounts");
  -[REMCDObject setInCloud:](self, "setInCloud:", 1);
  -[REMCDObject setCkDirtyFlags:](self, "setCkDirtyFlags:", (unint64_t)-[REMCDObject ckDirtyFlags](self, "ckDirtyFlags") & 0xFFFFFFFD);
  v13 = objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerRecord](self, "ckServerRecord"));
  if (!v13)
    goto LABEL_8;
  v14 = (void *)v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerRecord](self, "ckServerRecord"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "modificationDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "modificationDate"));
  v18 = objc_msgSend(v16, "ic_isLaterThanDate:", v17);

  if ((v18 & 1) != 0)
  {
    v19 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      sub_1006807D4(v6, v19);

  }
  else
  {
LABEL_8:
    -[REMCDObject setCkServerRecord:](self, "setCkServerRecord:", v6);
  }

}

- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  int v38;
  id v39;
  __int16 v40;
  void *v41;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Deleted")));
  if (objc_msgSend(v8, "BOOLValue"))
  {
    v9 = -[REMCDObject markedForDeletion](self, "markedForDeletion");

    if ((v9 & 1) != 0)
    {
      v11 = 0;
      goto LABEL_9;
    }
  }
  else
  {

  }
  v12 = objc_opt_class(RDStoreControllerManagedObjectContext, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject managedObjectContext](self, "managedObjectContext"));
  v14 = REMDynamicCast(v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cloudSchemaCatchUpSyncContextsByAccountIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", v7));

  if (objc_msgSend(v17, "shouldPerformCloudSchemaCatchUpSync"))
    v11 = +[ICCloudSchemaCompatibilityUtils isCloudSchemaCatchUpSyncNeededForExistingCloudObject:persistenceCloudSchemaVersion:](ICCloudSchemaCompatibilityUtils, "isCloudSchemaCatchUpSyncNeededForExistingCloudObject:persistenceCloudSchemaVersion:", self, objc_msgSend(v17, "persistenceCloudSchemaVersion"));
  else
    v11 = 0;

LABEL_9:
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordChangeTag"));
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerRecord](self, "ckServerRecord"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "recordChangeTag"));
    v21 = objc_msgSend(v20, "isEqualToString:", v18) ^ 1;

  }
  else
  {
    v21 = 0;
  }
  if ((v11 | v21) == 1)
  {
    if (v11)
    {
      v22 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
        v38 = 138543618;
        v39 = v7;
        v40 = 2114;
        v41 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Object fetched from cloud and is an entity that should perform CloudSchemaCatchUpSync, force merging data from CKRecord {accountID: %{public}@, remObjectID: %{public}@}", (uint8_t *)&v38, 0x16u);

      }
    }
    -[REMCDObject mergeDataFromRecord:accountID:](self, "mergeDataFromRecord:accountID:", v6, v7);
    v24 = objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerRecord](self, "ckServerRecord"));
    if (!v24)
      goto LABEL_25;
    v25 = (void *)v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerRecord](self, "ckServerRecord"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "modificationDate"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "modificationDate"));
    v29 = objc_msgSend(v27, "ic_isLaterThanDate:", v28);

    if ((v29 & 1) != 0)
    {
      v30 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        sub_100680868(v6, v30);

    }
    else
    {
LABEL_25:
      -[REMCDObject setCkServerRecord:](self, "setCkServerRecord:", v6);
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "share"));
    if (v33)
    {

    }
    else
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerShare](self, "ckServerShare"));

      if (v34)
      {
        v35 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerShare](self, "ckServerShare"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "ic_loggingDescription"));
          v38 = 138412290;
          v39 = v37;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Object fetched does not have a share removing our severShare: %@", (uint8_t *)&v38, 0xCu);

        }
        -[REMCDObject setCkServerShare:](self, "setCkServerShare:", 0);
      }
    }
    -[REMCDObject setCkNeedsInitialFetchFromCloud:](self, "setCkNeedsInitialFetchFromCloud:", 0);
    -[REMCDObject setInCloud:](self, "setInCloud:", 1);
    if (!-[REMCDObject supportsDeletionByTTL](self, "supportsDeletionByTTL"))
      -[REMCDObject setMarkedForDeletion:](self, "setMarkedForDeletion:", 0);
    -[REMCDObject updateParentReferenceIfNecessary](self, "updateParentReferenceIfNecessary");
  }
  else
  {
    v31 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_loggingDescription"));
      v38 = 138412290;
      v39 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Not merging fetched record with same change tag %@", (uint8_t *)&v38, 0xCu);

    }
  }
  -[REMCDObject setCkNeedsToBeFetchedFromCloud:](self, "setCkNeedsToBeFetchedFromCloud:", 0);

}

- (void)objectWasFetchedButDoesNotExistInCloud
{
  void *v3;
  unsigned int v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject recordID](self, "recordID"));
  v4 = objc_msgSend(v3, "ic_isOwnedByCurrentUser");

  if (v4)
  {
    -[REMCDObject setCkServerRecord:](self, "setCkServerRecord:", 0);
    -[REMCDObject setCkNeedsInitialFetchFromCloud:](self, "setCkNeedsInitialFetchFromCloud:", 0);
    -[REMCDObject setCkNeedsToBeFetchedFromCloud:](self, "setCkNeedsToBeFetchedFromCloud:", 0);
    -[REMCDObject setInCloud:](self, "setInCloud:", 0);
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject shortLoggingDescription](self, "shortLoggingDescription"));
      v7 = 138412290;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deleting shared %@ because it no longer exists in cloud", (uint8_t *)&v7, 0xCu);

    }
    -[REMCDObject deleteFromLocalDatabase](self, "deleteFromLocalDatabase");
  }
}

+ (id)temporaryAssets
{
  if (qword_1008527D8 != -1)
    dispatch_once(&qword_1008527D8, &stru_1007D9BA8);
  return (id)qword_1008527D0;
}

+ (id)assetForData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  id v12;
  NSObject *v13;
  id v15;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "temporaryAssets"));
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "temporaryAssetDirectoryURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v7, 0));

    if (v9)
    {
      v15 = 0;
      v10 = objc_msgSend(v4, "writeToURL:options:error:", v9, 0, &v15);
      v11 = v15;
      if (v10)
      {
        v12 = objc_msgSend(objc_alloc((Class)CKAsset), "initWithFileURL:", v9);
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "temporaryAssets"));
        -[NSObject addObject:](v13, "addObject:", v12);
LABEL_10:

        objc_sync_exit(v5);
        goto LABEL_11;
      }
    }
    else
    {
      v11 = 0;
    }
    v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1006808E8();
    v12 = 0;
    goto LABEL_10;
  }
  v12 = 0;
LABEL_11:

  return v12;
}

+ (id)temporaryAssetDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;

  v2 = (void *)qword_1008527E0;
  if (!qword_1008527E0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v5, CFSTR("TemporaryAssetFiles")));

    v18 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rem_createProtectedTemporaryDirectoryIfNeededWithError:", &v18));
    v8 = v18;
    if (v7)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v6, 1));
      v10 = (void *)qword_1008527E0;
      qword_1008527E0 = v9;

      v17 = v8;
      v11 = objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", qword_1008527E0, 1, 0, &v17);
      v12 = v17;

      if ((v11 & 1) == 0)
      {
        v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_1006809A8();

      }
      v14 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1008527E0, "absoluteString"));
        *(_DWORD *)buf = 138412290;
        v20 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "REMCDObject.temporaryAssetDirectoryURL: %@", buf, 0xCu);

      }
      v8 = v12;
    }
    else
    {
      v14 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_100680948();
    }

    v2 = (void *)qword_1008527E0;
  }
  return v2;
}

+ (void)deleteTemporaryAssetFilesForOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "temporaryAssets"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "temporaryAssets"));
  v7 = objc_msgSend(v6, "count");

  objc_sync_exit(v5);
  if (v7)
  {
    global_queue = dispatch_get_global_queue(-2, 0);
    v9 = objc_claimAutoreleasedReturnValue(global_queue);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100066320;
    v10[3] = &unk_1007D9438;
    v12 = a1;
    v11 = v4;
    dispatch_async(v9, v10);

  }
}

+ (void)deleteTemporaryFilesForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "temporaryAssets"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "temporaryAssets"));
  objc_msgSend(v6, "removeObject:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileURL"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v13 = 0;
    v10 = objc_msgSend(v9, "removeItemAtURL:error:", v8, &v13);
    v11 = v13;

    if ((v10 & 1) == 0)
    {
      v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_100680A08();

    }
  }
  objc_sync_exit(v5);

}

+ (void)deleteAllTemporaryAssetFilesForAllObjects
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  __int128 v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  _BYTE v25[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "temporaryAssetDirectoryURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, 0, 0, &stru_1007D9BE8));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v20;
    *(_QWORD *)&v8 = 138412290;
    v17 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager", v17));
        v18 = 0;
        v14 = objc_msgSend(v13, "removeItemAtURL:error:", v12, &v18);
        v15 = v18;

        if ((v14 & 1) == 0)
        {
          v16 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v24 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error deleting temporary asset file: %@", buf, 0xCu);
          }

        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v9);
  }

}

- (BOOL)isDeletable
{
  return 1;
}

- (BOOL)shouldBeDeletedFromLocalDatabase
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (!-[REMCDObject isDeletable](self, "isDeletable")
    || !-[REMCDObject markedForDeletion](self, "markedForDeletion")
    || -[REMCDObject isInICloudAccount](self, "isInICloudAccount")
    && !-[REMCDObject hasSuccessfullyPushedLatestVersionToCloud](self, "hasSuccessfullyPushedLatestVersionToCloud"))
  {
    return 0;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject objectsToBeDeletedBeforeThisObject](self, "objectsToBeDeletedBeforeThisObject", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "shouldBeDeletedFromLocalDatabase"))
        {
          v8 = 0;
          goto LABEL_17;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_17:

  return v8;
}

- (void)deleteFromLocalDatabase
{
  void *v3;
  unsigned int v4;
  NSObject *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICSyncSettings sharedSettings](ICSyncSettings, "sharedSettings"));
  v4 = objc_msgSend(v3, "hasOptions:", 64);

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100680AC8();

  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[REMCDObject managedObjectContext](self, "managedObjectContext"));
    objc_msgSend(v6, "deleteObject:", self);

  }
}

- (id)objectsToBeDeletedBeforeThisObject
{
  return &__NSArray0__struct;
}

+ (id)keyPathsForValuesAffectingNeedsToBeDeletedFromCloud
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("markedForDeletion"), 0);
}

- (void)fixValuesOfKeysWithUniqueConstraintBeforeSettingMarkedForDeletion:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *i;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *j;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject entity](self, "entity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniquenessConstraints"));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v22 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v12)
        {
          v14 = v12;
          v15 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(_QWORD *)v24 != v15)
                objc_enumerationMutation(v11);
              v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j);
              v18 = objc_opt_class(NSString, v13);
              v19 = REMDynamicCast(v18, v17);
              v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
              if (v20)
              {
                if (v3)
                  -[REMCDObject fixValueBeforeMarkingForDeletionForKey:](self, "fixValueBeforeMarkingForDeletionForKey:", v20);
                else
                  -[REMCDObject fixValueBeforeUnmarkingForDeletionForKey:](self, "fixValueBeforeUnmarkingForDeletionForKey:", v20);
              }

            }
            v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v14);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }

}

- (void)markForDeletion
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  if ((-[REMCDObject markedForDeletion](self, "markedForDeletion") & 1) == 0)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject shortLoggingDescription](self, "shortLoggingDescription"));
      v5 = 138412290;
      v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Marking %@ for deletion", (uint8_t *)&v5, 0xCu);

    }
    -[REMCDObject fixValuesOfKeysWithUniqueConstraintBeforeSettingMarkedForDeletion:](self, "fixValuesOfKeysWithUniqueConstraintBeforeSettingMarkedForDeletion:", 1);
    -[REMCDObject lowLevelMarkForDeletion](self, "lowLevelMarkForDeletion");
    -[REMCDObject markObjectDirtyAfterMarkedForDeletion](self, "markObjectDirtyAfterMarkedForDeletion");
  }
}

- (void)lowLevelMarkForDeletion
{
  -[REMCDObject setMarkedForDeletion:](self, "setMarkedForDeletion:", 1);
}

- (void)markObjectDirtyAfterMarkedForDeletion
{
  void *v3;

  if (-[REMCDObject supportsDeletionByTTL](self, "supportsDeletionByTTL"))
  {
    -[REMCDObject updateChangeCount](self, "updateChangeCount");
  }
  else if (-[REMCDObject isInCloud](self, "isInCloud")
         || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerShare](self, "ckServerShare")),
             v3,
             v3))
  {
    -[REMCDObject setCkDirtyFlags:](self, "setCkDirtyFlags:", -[REMCDObject ckDirtyFlags](self, "ckDirtyFlags") | 2);
  }
}

- (void)unmarkForDeletion
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  if (-[REMCDObject markedForDeletion](self, "markedForDeletion"))
  {
    v3 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject shortLoggingDescription](self, "shortLoggingDescription"));
      v5 = 138412290;
      v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unmarking %@ for deletion", (uint8_t *)&v5, 0xCu);

    }
    -[REMCDObject fixValuesOfKeysWithUniqueConstraintBeforeSettingMarkedForDeletion:](self, "fixValuesOfKeysWithUniqueConstraintBeforeSettingMarkedForDeletion:", 0);
    -[REMCDObject lowLevelUnmarkForDeletion](self, "lowLevelUnmarkForDeletion");
    -[REMCDObject markObjectDirtyAfterUnmarkedForDeletion](self, "markObjectDirtyAfterUnmarkedForDeletion");
  }
}

- (void)lowLevelUnmarkForDeletion
{
  -[REMCDObject setMarkedForDeletion:](self, "setMarkedForDeletion:", 0);
}

- (void)setMarkedForDeletion:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;

  v3 = a3;
  -[REMCDObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("markedForDeletion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  -[REMCDObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("markedForDeletion"));

  -[REMCDObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("markedForDeletion"));
  v6 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject identifier](self, "identifier"));
    v9 = objc_msgSend((id)objc_opt_class(self, v8), "cdEntityName");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11[0] = 67109634;
    v11[1] = v3;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting markedForDeletion %d on {identifier: %{public}@, cdEntity: %{public}@}", (uint8_t *)v11, 0x1Cu);

  }
}

- (BOOL)supportsDeletionByTTL
{
  return 0;
}

- (void)debug_lowLevelRemoveFromParent
{
  uint64_t v3;
  NSString *v4;
  id v5;

  v3 = objc_opt_class(self, a2);
  v4 = NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Abstract method called -[%@ %@]"), v3, v5);

}

- (id)parentCloudObject
{
  return 0;
}

- (void)updateParentReferenceIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerRecord](self, "ckServerRecord"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject parentCloudObject](self, "parentCloudObject"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
    v7 = objc_opt_class(REMCDAccount, v6);
    isKindOfClass = objc_opt_isKindOfClass(v4, v7);
    v9 = isKindOfClass;
    if (v4 && (isKindOfClass & 1) == 0 && !v5)
    {
      v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        sub_100680B28(self, v10);

      goto LABEL_18;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject recordID](self, "recordID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ownerName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ownerName"));
    v16 = objc_msgSend(v13, "isEqualToString:", v15);

    if (!v16)
    {
LABEL_18:

      return;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerRecord](self, "ckServerRecord"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "parent"));

    if (v18)
    {
      if ((v9 & 1) != 0)
        goto LABEL_18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerRecord](self, "ckServerRecord"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "parent"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "recordID"));
      v22 = objc_msgSend(v21, "isEqual:", v5);

      if ((v22 & 1) != 0)
        goto LABEL_18;
      v23 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject shortLoggingDescription](self, "shortLoggingDescription"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerRecord](self, "ckServerRecord"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "parent"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "recordID"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "ic_loggingDescription"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_loggingDescription"));
      v30 = 138412802;
      v31 = v24;
      v32 = 2112;
      v33 = v28;
      v34 = 2112;
      v35 = v29;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Server record for %@ parent %@ is different from expected parent %@. Re-saving record.", (uint8_t *)&v30, 0x20u);

    }
    else
    {
      v23 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
LABEL_17:

        -[REMCDObject updateChangeCount](self, "updateChangeCount");
        goto LABEL_18;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject shortLoggingDescription](self, "shortLoggingDescription"));
      v30 = 138412290;
      v31 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Server record for %@ has no parent, but expects one. Re-saving record.", (uint8_t *)&v30, 0xCu);
    }

    goto LABEL_17;
  }
}

- (BOOL)needsToDeleteShare
{
  void *v3;
  BOOL v4;

  if (!-[REMCDObject markedForDeletion](self, "markedForDeletion"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerShare](self, "ckServerShare"));
  v4 = v3 != 0;

  return v4;
}

+ (id)keyPathsForValuesAffectingCanBeSharedViaICloud
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("isSharedViaICloud"), CFSTR("cloudAccount.accountType"), 0);
}

- (BOOL)canBeSharedViaICloud
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject cloudAccount](self, "cloudAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accountTypeHost"));
  v4 = objc_msgSend(v3, "isCloudKit");

  return v4;
}

+ (id)keyPathsForValuesAffectingIsSharedViaICloud
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("ckServerShare"), CFSTR("ckZoneOwnerName"), CFSTR("ckServerRecord"), CFSTR("parentCloudObject.isSharedViaICloud"), 0);
}

- (BOOL)isSharedViaICloud
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerShare](self, "ckServerShare"));

  if (v3)
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerRecord](self, "ckServerRecord"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "share"));

  if (v5)
    return 1;
  v8 = objc_claimAutoreleasedReturnValue(-[REMCDObject ckZoneOwnerName](self, "ckZoneOwnerName"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckZoneOwnerName](self, "ckZoneOwnerName"));
    v11 = objc_msgSend(v10, "isEqualToString:", CKCurrentUserDefaultName);

    if (!v11)
      return 1;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject parentCloudObject](self, "parentCloudObject"));
  v13 = v12;
  if (v12)
    v6 = objc_msgSend(v12, "isSharedViaICloud");
  else
    v6 = 0;

  return v6;
}

- (BOOL)canBeRootShareObject
{
  return 0;
}

- (BOOL)isOwnedByCurrentUser
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject recordID](self, "recordID"));
  v3 = objc_msgSend(v2, "ic_isOwnedByCurrentUser");

  return v3;
}

- (BOOL)isSharedRootObject
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerRecord](self, "ckServerRecord"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "share"));

  if (v4)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerShare](self, "ckServerShare"));
  v5 = v6 != 0;

  return v5;
}

+ (id)keyPathsForValuesAffectingIsSharedReadOnly
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("serverShareCheckingParent"));
}

- (BOOL)isSharedReadOnly
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject serverShareCheckingParent](self, "serverShareCheckingParent"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentUserParticipant"));
    v5 = objc_msgSend(v4, "permission") == (id)2;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)keyPathsForValuesAffectingServerShareCheckingParent
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("serverShare"));
}

- (id)serverShareCheckingParent
{
  REMCDObject *v2;
  REMCDObject *v3;
  void *v4;

  v2 = self;
  if (v2)
  {
    do
    {
      v3 = v2;
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerShare](v2, "ckServerShare"));
      v2 = (REMCDObject *)objc_claimAutoreleasedReturnValue(-[REMCDObject parentCloudObject](v2, "parentCloudObject"));

    }
    while (!v4 && v2);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)currentUserShareParticipantID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject serverShareCheckingParent](self, "serverShareCheckingParent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentUserParticipant"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "participantID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uppercaseString"));

  return v5;
}

- (void)updateObjectWithShare:(id)a3
{
  NSObject *v4;

  v4 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100680C6C(self, v4);

}

- (void)setServerShareIfNewer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordChangeTag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerShare](self, "ckServerShare"));

  if (!v6)
  {
    v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject shortLoggingDescription](self, "shortLoggingDescription"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_loggingDescription"));
      v28 = 138412546;
      v29 = v23;
      v30 = 2112;
      v31 = v24;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No server share for %@, setting to %@", (uint8_t *)&v28, 0x16u);

LABEL_15:
    }
LABEL_16:

    -[REMCDObject setCkServerShare:](self, "setCkServerShare:", v4);
    goto LABEL_17;
  }
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordChangeTag"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerShare](self, "ckServerShare"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordChangeTag"));
    v11 = objc_msgSend(v10, "isEqualToString:", v5);

    if (v11)
    {
      v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject shortLoggingDescription](self, "shortLoggingDescription"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerShare](self, "ckServerShare"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ic_loggingDescription"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_loggingDescription"));
        v28 = 138412802;
        v29 = v13;
        v30 = 2112;
        v31 = v15;
        v32 = 2112;
        v33 = v16;
        v17 = "Existing server share for %@ %@ has the same change tag as %@";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v28, 0x20u);

        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerShare](self, "ckServerShare"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "modificationDate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modificationDate"));
  v21 = objc_msgSend(v19, "ic_isLaterThanDate:", v20);

  v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
  v22 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!v21)
  {
    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject shortLoggingDescription](self, "shortLoggingDescription"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerShare](self, "ckServerShare"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "ic_loggingDescription"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_loggingDescription"));
      v28 = 138412802;
      v29 = v23;
      v30 = 2112;
      v31 = v26;
      v32 = 2112;
      v33 = v27;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Replacing old server share for %@ %@ with %@", (uint8_t *)&v28, 0x20u);

      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (v22)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject shortLoggingDescription](self, "shortLoggingDescription"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerShare](self, "ckServerShare"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ic_loggingDescription"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_loggingDescription"));
    v28 = 138412802;
    v29 = v13;
    v30 = 2112;
    v31 = v15;
    v32 = 2112;
    v33 = v16;
    v17 = "Existing server share for %@ %@ is newer than %@";
    goto LABEL_9;
  }
LABEL_10:

LABEL_17:
}

- (void)didAcceptShare:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerShare](self, "ckServerShare"));

  if (!v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject shortLoggingDescription](self, "shortLoggingDescription"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_loggingDescription"));
      v11 = 138412546;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No server share for %@, setting to %@", (uint8_t *)&v11, 0x16u);

    }
    -[REMCDObject setCkServerShare:](self, "setCkServerShare:", v4);
  }
  if (-[REMCDObject markedForDeletion](self, "markedForDeletion"))
  {
    v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject shortLoggingDescription](self, "shortLoggingDescription"));
      v11 = 138412290;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Undeleting shared %@", (uint8_t *)&v11, 0xCu);

    }
    -[REMCDObject unmarkForDeletion](self, "unmarkForDeletion");
    -[REMCDObject restoreParentReferenceAfterUnmarkingForDeletion](self, "restoreParentReferenceAfterUnmarkingForDeletion");
  }

}

+ (id)versionsByOperationQueue
{
  if (qword_1008527F0 != -1)
    dispatch_once(&qword_1008527F0, &stru_1007D9C08);
  return (id)qword_1008527E8;
}

+ (id)versionsByRecordIDByOperation
{
  if (qword_100852800 != -1)
    dispatch_once(&qword_100852800, &stru_1007D9C28);
  return (id)qword_1008527F8;
}

- (int64_t)versionForOperation:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  id v8;
  int64_t v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "versionsByOperationQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006800C;
  block[3] = &unk_1007D7FB0;
  block[4] = self;
  v12 = v4;
  v13 = &v14;
  v8 = v4;
  dispatch_sync(v7, block);

  v9 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)setVersion:(int64_t)a3 forOperation:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  int64_t v13;

  v6 = a4;
  v8 = objc_msgSend((id)objc_opt_class(self, v7), "versionsByOperationQueue");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068148;
  block[3] = &unk_1007D9C50;
  block[4] = self;
  v12 = v6;
  v13 = a3;
  v10 = v6;
  dispatch_sync(v9, block);

}

- (int64_t)isPushingSameOrLaterThanVersion:(int64_t)a3
{
  id v5;
  NSObject *v6;
  int64_t v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v5 = objc_msgSend((id)objc_opt_class(self, a2), "versionsByOperationQueue");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000682D8;
  block[3] = &unk_1007D9C78;
  block[4] = self;
  block[5] = &v10;
  block[6] = a3;
  dispatch_sync(v6, block);

  v7 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)setInCloud:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[REMCDObject ckCloudState](self, "ckCloudState"));
  objc_msgSend(v4, "setInCloud:", v3);

}

- (BOOL)isInCloud
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckCloudState](self, "ckCloudState"));
  v3 = objc_msgSend(v2, "isInCloud");

  return v3;
}

+ (id)recordSystemFieldsTransformer
{
  if (qword_100852810 != -1)
    dispatch_once(&qword_100852810, &stru_1007D9C98);
  return (id)qword_100852808;
}

+ (id)shareSystemFieldsTransformer
{
  if (qword_100852820 != -1)
    dispatch_once(&qword_100852820, &stru_1007D9CB8);
  return (id)qword_100852818;
}

- (void)setCkServerRecord:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;

  v5 = a3;
  if ((-[CKRecord isEqual:](self->_ckServerRecord, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_ckServerRecord, a3);
    if (v5)
    {
      v7 = objc_msgSend((id)objc_opt_class(self, v6), "recordSystemFieldsTransformer");
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transformedValue:", v5));
      -[REMCDObject setCkServerRecordData:](self, "setCkServerRecordData:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneID"));

      v13 = objc_msgSend((id)objc_opt_class(self, v12), "objectCkZoneOwnerNameFromCKRecordZoneID:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      -[REMCDObject setCkZoneOwnerName:](self, "setCkZoneOwnerName:", v14);

    }
    else
    {
      -[REMCDObject setCkServerRecordData:](self, "setCkServerRecordData:", 0);
      v15 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject shortLoggingDescription](self, "shortLoggingDescription"));
        v17 = 138543362;
        v18 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "setCkServerRecord: Clearing serverRecord for: %{public}@", (uint8_t *)&v17, 0xCu);

      }
    }
  }

}

- (CKRecord)ckServerRecord
{
  CKRecord *ckServerRecord;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  CKRecord *v8;
  CKRecord *v9;

  ckServerRecord = self->_ckServerRecord;
  if (!ckServerRecord)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerRecordData](self, "ckServerRecordData"));
    if (v5)
    {
      v6 = objc_msgSend((id)objc_opt_class(self, v4), "recordSystemFieldsTransformer");
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v8 = (CKRecord *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reverseTransformedValue:", v5));
      v9 = self->_ckServerRecord;
      self->_ckServerRecord = v8;

    }
    ckServerRecord = self->_ckServerRecord;
  }
  return ckServerRecord;
}

- (void)updateSharedObjectOwnerName:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v39 = (id)objc_opt_class(self, v6);
    v40 = 2112;
    v41 = v4;
    v7 = v39;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Update shared object's owner names {class: %@, ownerName: %@}", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject managedObjectContext](self, "managedObjectContext"));
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[REMCDObject account](self, "account"));
    v10 = v9;
    if (v9)
    {
      v12 = objc_claimAutoreleasedReturnValue(-[NSObject ckIdentifier](v9, "ckIdentifier"));
      if (v12)
      {
        if (v4)
        {
          v13 = (objc_class *)objc_opt_class(REMCKSharedObjectOwnerName, v11);
          v14 = NSStringFromClass(v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", v15, v8));
          v18 = objc_opt_class(REMCKSharedObjectOwnerName, v17);
          v19 = REMCheckedDynamicCast(v18, v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckIdentifier](self, "ckIdentifier"));
          objc_msgSend(v20, "setObjectIdentifier:", v21);

          objc_msgSend(v20, "setOwnerName:", v4);
          objc_msgSend(v20, "setAccount:", v10);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckIdentifier](self, "ckIdentifier"));

          if (v22 && v20)
          {
            v37 = v15;
            v24 = objc_opt_class(RDStoreControllerManagedObjectContext, v23);
            v25 = REMDynamicCast(v24, v8);
            v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "batchFetchHelper"));
            if (!v27)
            {
              v36 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
              if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
                sub_100680358();

            }
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckIdentifier](self, "ckIdentifier"));
            objc_msgSend(v27, "setCachedManagedObject:forCKIdentifier:accountIdentifier:", v20, v28, v12);

            v15 = v37;
          }

        }
        else
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckIdentifier](self, "ckIdentifier"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("objectIdentifier == %@"), v30));

          v32 = objc_opt_class(REMCKSharedObjectOwnerName, v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[REMCKSharedObjectOwnerName ic_objectsMatchingPredicate:context:](REMCKSharedObjectOwnerName, "ic_objectsMatchingPredicate:context:", v15, v8));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "firstObject"));
          v35 = REMDynamicCast(v32, v34);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v35);

          if (v16)
          {
            -[NSObject removeCkSharedObjectOwnerNamesObject:](v10, "removeCkSharedObjectOwnerNamesObject:", v16);
            objc_msgSend(v8, "deleteObject:", v16);
          }
        }

        -[NSObject updateChangeCount](v10, "updateChangeCount");
      }
      else
      {
        v29 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
          sub_100680DFC();

      }
    }
    else
    {
      v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        sub_100680D74();
    }

  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_100680CEC();
  }

}

- (void)setCkServerShare:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((-[CKShare isEqual:](self->_ckServerShare, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_ckServerShare, a3);
    -[REMCDObject updateObjectWithShare:](self, "updateObjectWithShare:", v9);
    if (v9)
    {
      v6 = objc_msgSend((id)objc_opt_class(self, v5), "shareSystemFieldsTransformer");
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transformedValue:", v9));
      -[REMCDObject setCkServerShareData:](self, "setCkServerShareData:", v8);

    }
    else
    {
      -[REMCDObject setCkServerShareData:](self, "setCkServerShareData:", 0);
    }
  }

}

- (CKShare)ckServerShare
{
  CKShare *ckServerShare;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  CKShare *v8;
  CKShare *v9;

  ckServerShare = self->_ckServerShare;
  if (!ckServerShare)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckServerShareData](self, "ckServerShareData"));
    if (v5)
    {
      v6 = objc_msgSend((id)objc_opt_class(self, v4), "shareSystemFieldsTransformer");
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v8 = (CKShare *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reverseTransformedValue:", v5));
      v9 = self->_ckServerShare;
      self->_ckServerShare = v8;

    }
    ckServerShare = self->_ckServerShare;
  }
  return ckServerShare;
}

+ (id)objectCkZoneOwnerNameFromCKRecordZoneID:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "ownerName"));
  if (objc_msgSend(v3, "isEqualToString:", CKCurrentUserDefaultName))
    v4 = 0;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (BOOL)hasAllMandatoryFields
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckIdentifier](self, "ckIdentifier"));
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)shortLoggingDescription
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject ckIdentifier](self, "ckIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %@>"), v3, v4));

  return v5;
}

- (id)ic_loggingValues
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  REMCDObject *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject managedObjectContext](self, "managedObjectContext"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100068E50;
  v8[3] = &unk_1007D7C68;
  v5 = v3;
  v9 = v5;
  v10 = self;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = v5;
  return v6;
}

- (id)cloudKitReferenceWithRecordIDAndValidateAction:(id)a3
{
  id v3;
  id v4;
  id v5;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc((Class)CKReference);
    v5 = objc_msgSend(v4, "initWithRecordID:action:", v3, CKReferenceActionValidate);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)getResolutionTokenMapFromRecord:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ResolutionTokenMap")));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[REMResolutionTokenMap objc_newObjectFromJSONString:](REMResolutionTokenMap, "objc_newObjectFromJSONString:", v3));
    if (!v4)
    {
      v5 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        sub_100680E84();

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)getResolutionTokenMapFromRecord:(id)a3
{
  return +[REMCDObject getResolutionTokenMapFromRecord:](REMCDObject, "getResolutionTokenMapFromRecord:", a3);
}

- (void)generateReolutionTokenMapForTestingWithKeys:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject createResolutionTokenMapIfNecessary](self, "createResolutionTokenMapIfNecessary"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "updateForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), (_QWORD)v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

+ (BOOL)shouldAttemptLocalObjectMerge
{
  return 0;
}

- (BOOL)isMergeableWithLocalObject
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;

  if (!objc_msgSend((id)objc_opt_class(self, a2), "shouldAttemptLocalObjectMerge")
    || (-[REMCDObject isDeleted](self, "isDeleted") & 1) != 0
    || -[REMCDObject isConcealed](self, "isConcealed"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = -[REMCDObject isInCloud](self, "isInCloud");
    v5 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v6)
        sub_100680EE8();
    }
    else if (v6)
    {
      sub_100680F90();
    }

  }
  return v3;
}

- (id)existingLocalObjectToMergeWithPredicate:(id)a3
{
  return 0;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  return 0;
}

- (BOOL)mergeDataRefusedToMergeMarkedForDeletion
{
  return self->_mergeDataRefusedToMergeMarkedForDeletion;
}

- (BOOL)mergeDataRevertedLocallyMarkedForDeletion
{
  return self->_mergeDataRevertedLocallyMarkedForDeletion;
}

- (BOOL)shouldPerformCloudSchemaCatchUpSync
{
  return self->_shouldPerformCloudSchemaCatchUpSync;
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;

  v4 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject objectID](self, "objectID"));
    v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Warning: Calling super (REMCDObject's) -isConnectedToAccountObject:, make sure this model class implements proper connection to the account to avoid being auto marked as deleted {self: %@}.", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

- (BOOL)shouldCascadeMarkAsDeleteInto:(id)a3 forRelationship:(id)a4
{
  return 1;
}

+ (id)fetchRequest
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  void *v10;
  id v11;
  objc_super v13;

  v3 = (objc_class *)objc_opt_class(REMCDObject, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = NSStringFromClass((Class)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      sub_100682530(v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDRootEntityObject fetchRequest](REMCDRootEntityObject, "fetchRequest"));
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___REMCDObject;
    v11 = objc_msgSendSuper2(&v13, "fetchRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }
  return v10;
}

+ (id)subclassesOfREMCDObjectRepresentingRootCoreDataEntities
{
  if (qword_100852858 != -1)
    dispatch_once(&qword_100852858, &stru_1007DA018);
  return (id)qword_100852860;
}

+ (id)subclassNamesOfREMCDObjectRepresentingRootCoreDataEntities
{
  if (qword_100852868 != -1)
    dispatch_once(&qword_100852868, &stru_1007DA038);
  return (id)qword_100852870;
}

+ (void)mergeSystemPropertiesIntoCDObject:(id)a3 fromCKRecord:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v7 = a4;
  if (objc_msgSend(v5, "respondsToSelector:", "shouldUseResolutionTokenMapForMergingData"))
  {
    objc_msgSend(v5, "mergeDataRevertedLocallyMarkedForDeletion");
    objc_msgSend(v5, "mergeDataRefusedToMergeMarkedForDeletion");
    v6 = v5;
    v5 = v7;
    sub_10044B798(v5, v6, v6, v5);

  }
  else
  {
    sub_10044AE80(v5, v7);
  }

}

@end
