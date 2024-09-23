@implementation FPFootprint

- (void)dealloc
{
  __CFDictionary *memoryObjects;
  NSMutableDictionary *sharedCacheMemoryObjectsTable;
  __CFDictionary *textMemoryObjects;
  __CFDictionary *linkeditMemoryObjects;
  objc_super v7;

  memoryObjects = self->_memoryObjects;
  if (memoryObjects)
    CFRelease(memoryObjects);
  sharedCacheMemoryObjectsTable = self->_sharedCacheMemoryObjectsTable;
  self->_sharedCacheMemoryObjectsTable = 0;

  textMemoryObjects = self->_textMemoryObjects;
  if (textMemoryObjects)
    CFRelease(textMemoryObjects);
  linkeditMemoryObjects = self->_linkeditMemoryObjects;
  if (linkeditMemoryObjects)
    CFRelease(linkeditMemoryObjects);
  v7.receiver = self;
  v7.super_class = (Class)FPFootprint;
  -[FPFootprint dealloc](&v7, "dealloc");
}

- (id)ioSurfaceExtendedInfoDetailsAtAddress:(unint64_t)a3 for:(int)a4
{
  uint64_t v4;
  os_unfair_lock_s *p_allPIDsIOSurfaceDescriptionsLock;
  NSDictionary *allPIDsIOSurfaceDescriptions;
  NSDictionary *v9;
  NSDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  _QWORD v26[4];
  _QWORD v27[4];

  v4 = *(_QWORD *)&a4;
  p_allPIDsIOSurfaceDescriptionsLock = &self->_allPIDsIOSurfaceDescriptionsLock;
  os_unfair_lock_lock(&self->_allPIDsIOSurfaceDescriptionsLock);
  allPIDsIOSurfaceDescriptions = self->_allPIDsIOSurfaceDescriptions;
  if (!allPIDsIOSurfaceDescriptions)
  {
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[IOSurfaceDebugDescription surfaceDescriptions](IOSurfaceDebugDescription, "surfaceDescriptions"));
    v10 = self->_allPIDsIOSurfaceDescriptions;
    self->_allPIDsIOSurfaceDescriptions = v9;

    allPIDsIOSurfaceDescriptions = self->_allPIDsIOSurfaceDescriptions;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](allPIDsIOSurfaceDescriptions, "objectForKey:", v11));

  os_unfair_lock_unlock(p_allPIDsIOSurfaceDescriptionsLock);
  if (v12)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000152E8;
    v25[3] = &unk_100029D18;
    v25[4] = a3;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v25));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filteredArrayUsingPredicate:", v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));

    if (v15)
    {
      v26[0] = CFSTR("surfaceID");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v15, "surfaceID")));
      v27[0] = v16;
      v26[1] = CFSTR("PixelFormat");
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v15, "pixelFormat")));
      v27[1] = v17;
      v26[2] = CFSTR("Width");
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v15, "width")));
      v27[2] = v18;
      v26[3] = CFSTR("Height");
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v15, "height")));
      v27[3] = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 4));
      v21 = objc_msgSend(v20, "mutableCopy");

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
        objc_msgSend(v21, "setObject:forKey:", v23, CFSTR("Name"));

      }
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)ioAccelMemoryInfoDetailsAtAddress:(unint64_t)a3 for:(int)a4 error:(id *)a5
{
  uint64_t v6;
  dispatch_semaphore_t v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  NSObject *v13;
  dispatch_time_t v14;
  void *v15;
  NSDictionary *v16;
  NSDictionary *allPIDsIOAccelMemoryInfos;
  NSDictionary *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  NSObject *v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  _BYTE v65[128];
  _BYTE v66[128];
  NSErrorUserInfoKey v67;
  const __CFString *v68;

  v6 = *(_QWORD *)&a4;
  objc_opt_self(FPFootprint);
  if (!objc_opt_class(IOAccelMemoryInfo))
    return 0;
  os_unfair_lock_lock(&self->_allPIDsIOAccelMemoryInfosLock);
  if (!self->_allPIDsIOAccelMemoryInfos)
  {
    v59 = 0;
    v60 = &v59;
    v61 = 0x3032000000;
    v62 = sub_1000159A0;
    v63 = sub_1000159B0;
    v64 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v55 = 0;
    v56 = &v55;
    v57 = 0x2020000000;
    v58 = 0;
    v9 = dispatch_semaphore_create(0);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create("com.apple.footprint.ioaccelmemoryinfo", v11);

    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1000159B8;
    v51[3] = &unk_100029D78;
    v53 = &v55;
    v54 = &v59;
    v13 = v9;
    v52 = v13;
    +[IOAccelMemoryInfo collectDataWithCompletionQueue:completionBlock:](IOAccelMemoryInfo, "collectDataWithCompletionQueue:completionBlock:", v12, v51);
    v14 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v13, v14);
    if (a5 && !*((_BYTE *)v56 + 24) && !*a5)
    {
      v67 = NSLocalizedDescriptionKey;
      v68 = CFSTR("Timed out waiting to fetch IOAccelMemory region infos");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FootprintErrorDomain"), 1, v15));

    }
    v16 = (NSDictionary *)objc_msgSend((id)v60[5], "copy");
    allPIDsIOAccelMemoryInfos = self->_allPIDsIOAccelMemoryInfos;
    self->_allPIDsIOAccelMemoryInfos = v16;

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(&v59, 8);

  }
  os_unfair_lock_unlock(&self->_allPIDsIOAccelMemoryInfosLock);
  v18 = self->_allPIDsIOAccelMemoryInfos;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v19));

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v66, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v48;
    while (2)
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v48 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "mappings"));
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v27 = v26;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v65, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v44;
LABEL_15:
          v30 = 0;
          while (1)
          {
            if (*(_QWORD *)v44 != v29)
              objc_enumerationMutation(v27);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v30), "address") == (id)a3)
              break;
            if (v28 == (id)++v30)
            {
              v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v65, 16);
              if (v28)
                goto LABEL_15;
              goto LABEL_21;
            }
          }
          v31 = v25;

          if (!v31)
            continue;

          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v31, "surfaceID")));
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v34, CFSTR("SurfaceID"));

          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v31, "length")));
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v35, CFSTR("Size"));

          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v31, "dirtyLength")));
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v36, CFSTR("DirtySize"));

          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v31, "residentLength")));
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v37, CFSTR("ResidentSize"));

          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v31, "wired")));
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v38, CFSTR("IsWired"));

          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v31, "purgeable")));
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v39, CFSTR("IsPurgeable"));

          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v31, "cachedCopy")));
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v40, CFSTR("CachedCopy"));

          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v31, "memoryPool")));
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v41, CFSTR("MemoryPool"));

          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "formattedDescriptions"));
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v42, CFSTR("Descriptions"));

          goto LABEL_28;
        }
LABEL_21:

      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v66, 16);
      if (v22)
        continue;
      break;
    }
  }
  v32 = 0;
  v31 = v21;
LABEL_28:

  return v32;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatherEndTime, 0);
  objc_storeStrong((id *)&self->_gatherStartTime, 0);
  objc_storeStrong((id *)&self->_outputFormatters, 0);
  objc_storeStrong((id *)&self->_sharedCacheMemoryObjectsTable, 0);
  objc_storeStrong((id *)&self->_allPIDsIOAccelMemoryInfos, 0);
  objc_storeStrong((id *)&self->_allPIDsIOSurfaceDescriptions, 0);
  objc_storeStrong((id *)&self->_pidToFootprint, 0);
  objc_storeStrong((id *)&self->_processes, 0);
}

@end
