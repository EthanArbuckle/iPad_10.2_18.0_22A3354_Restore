@implementation SABinary

- (id)createFakeEntireBinarySegment
{
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v2 = (void *)v1[6];
    if (!v2)
    {
      +[SASegment segmentWithBinary:name:length:offsetIntoBinary:]((uint64_t)SASegment, v1, CFSTR("ENTIRE_BINARY"), v1[5], 0);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v1[6];
      v1[6] = v3;

      v2 = (void *)v1[6];
    }
    v5 = v2;
    objc_sync_exit(v1);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)getCodeSignInfoWithBundleUrl:(_QWORD *)a1
{
  id v3;
  _BYTE *v4;
  id v5;

  v3 = a2;
  if (a1 && !a1[15] && !a1[16] && (v3 || a1[10]))
  {
    v5 = v3;
    v4 = a1;
    objc_sync_enter(v4);
    if ((v4[64] & 2) == 0)
      v4[64] |= 2u;
    objc_sync_exit(v4);

    v3 = v5;
  }

}

- (void)gatherBundleInfo
{
  void *v1;
  __CFBundle *v2;
  id *obj;

  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    if (!obj[11]
      && !obj[12]
      && !obj[13]
      && ((_BYTE)obj[8] & 1) == 0
      && (objc_msgSend(obj[10], "isAbsolutePath") & 1) != 0)
    {
      *((_BYTE *)obj + 64) |= 1u;
      v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", obj[10], 0);
      if (v1)
      {
        v2 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();

        if (v2)
        {
          -[SABinary saveInfoFromBundle:](obj, v2);
          CFRelease(v2);
        }
        else
        {
          -[SABinary getCodeSignInfoWithBundleUrl:](obj, 0);
        }
      }
    }
    objc_sync_exit(obj);

  }
}

+ (void)_doCachedBinariesWork:(uint64_t)a1
{
  id v2;
  void *v3;
  void (**v4)(void);

  v4 = a2;
  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ED1DD830);
  if (!qword_1ED1DD840)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = (void *)qword_1ED1DD840;
    qword_1ED1DD840 = (uint64_t)v2;

  }
  v4[2]();
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ED1DD830);

}

void __27__SABinary_binaryWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    {
      v9 = *__error();
      _sa_logt();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v18 = v11;
        v19 = 2112;
        v20 = v12;
        _os_log_impl(&dword_1B9BE0000, v10, OS_LOG_TYPE_DEFAULT, "WARNING: Multiple binaries with UUID %@ exist, using %@", buf, 0x16u);

      }
      *__error() = v9;
    }
  }
  else
  {
    v13 = objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "initWithUUID:path:", *(_QWORD *)(a1 + 32), 0);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, *(_QWORD *)(a1 + 32));

  }
}

- (void)findPathViaBinaryLocator
{
  void **v1;
  unint64_t v2;
  _BYTE *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    if ((objc_msgSend(v1[10], "isAbsolutePath") & 1) == 0)
    {
      v2 = (unint64_t)v1[2];
      if ((v2 & 4) == 0)
      {
        v1[2] = (void *)(v2 | 4);
        v3 = +[SABinaryLocator sharedBinaryLocator](SABinaryLocator, "sharedBinaryLocator");
        -[SABinaryLocator urlForUUID:](v3, v1[9]);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        if (v4)
        {
          objc_msgSend(v4, "path");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6)
          {
            v13 = 0;
            if (SAFilepathMatches(v1[10], v6, &v13))
            {
              if (v13)
              {
                SACachedNSString(v6);
                v7 = objc_claimAutoreleasedReturnValue();
                v8 = v1[10];
                v1[10] = (void *)v7;

                *((_BYTE *)v1 + 66) = 1;
              }
            }
            else
            {
              v9 = *__error();
              _sa_logt();
              v10 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v1[9], "UUIDString");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                v12 = v1[10];
                *(_DWORD *)buf = 138543874;
                v15 = v11;
                v16 = 2112;
                v17 = v6;
                v18 = 2112;
                v19 = v12;
                _os_log_debug_impl(&dword_1B9BE0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: found path %@ via binary locator, but doesn't match existing partial path %@", buf, 0x20u);

              }
              *__error() = v9;
            }
          }

        }
        objc_msgSend(v3, "done");

      }
    }
    objc_sync_exit(v1);

  }
}

- (void)saveInfoFromBundle:(void *)a1
{
  void **v3;
  uint64_t v4;
  void *v5;
  CFTypeRef v6;
  void *v7;
  CFTypeRef v8;
  void *v9;
  CFURLRef v10;
  CFURLRef v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  CFURLRef v17;
  char v18;

  if (a1)
  {
    v3 = a1;
    objc_sync_enter(v3);
    if (!v3[11] && !v3[12] && !v3[13])
    {
      *((_BYTE *)v3 + 64) |= 1u;
      CFBundleGetIdentifier(a2);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = v3[11];
      v3[11] = (void *)v4;

      v6 = SACFBundleCopyStringForKey(a2, (const __CFString *)*MEMORY[0x1E0C9AAF0]);
      v7 = v3[13];
      v3[13] = (void *)v6;

      v8 = SACFBundleCopyStringForKey(a2, (const __CFString *)*MEMORY[0x1E0C9AE90]);
      v9 = v3[12];
      v3[12] = (void *)v8;

      if (!v3[10])
      {
        v10 = CFBundleCopyExecutableURL(a2);
        v11 = v10;
        if (v10)
        {
          -[__CFURL path](v10, "path");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            v18 = 0;
            v13 = SAFilepathMatches(v3[10], v12, &v18);
            if (v18)
              v14 = v13;
            else
              v14 = 0;
            if (v14 == 1)
            {
              SACachedNSString(v12);
              v15 = objc_claimAutoreleasedReturnValue();
              v16 = v3[10];
              v3[10] = (void *)v15;

            }
          }

        }
      }
      v17 = CFBundleCopyBundleURL(a2);
      -[SABinary getCodeSignInfoWithBundleUrl:](v3, v17);

    }
    objc_sync_exit(v3);

  }
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)bundleVersion
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

void __40__SABinary_clearCoreSymbolicationCaches__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __40__SABinary_clearCoreSymbolicationCaches__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "clearCoreSymbolicationCache");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (NSString)name
{
  SABinary *v2;
  NSString *name;
  NSString *Path;
  NSString *v5;

  v2 = self;
  objc_sync_enter(v2);
  name = v2->_name;
  if (name)
    Path = name;
  else
    Path = (NSString *)-[NSString copyLastPathComponent](v2->_path);
  v5 = Path;
  objc_sync_exit(v2);

  return v5;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (id)segmentAtOffsetIntoBinary:(int)a3 createFakeSegmentIfNeeded:
{
  _QWORD *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a1 || (a2 & 0x8000000000000000) == 0 && a1[5] - 1 < (unint64_t)a2)
    return 0;
  v6 = a1;
  objc_sync_enter(v6);
  v7 = (void *)v6[7];
  if (v7)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = 0;
      v11 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v13, "hasOffsetIntoBinary", (_QWORD)v17)
            && objc_msgSend(v13, "offsetIntoBinary") <= a2)
          {
            if (objc_msgSend(v13, "length"))
            {
              v14 = objc_msgSend(v13, "offsetIntoBinary");
              if (objc_msgSend(v13, "length") + v14 > a2)
              {
                v16 = v13;

                goto LABEL_23;
              }
              v15 = 0;
            }
            else
            {
              v15 = v13;
            }

            v10 = v15;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          continue;
        break;
      }

      if (v10)
      {
        v10 = v10;
        v16 = v10;
LABEL_23:

        goto LABEL_28;
      }
    }
    else
    {

    }
  }
  v16 = 0;
  if ((a2 & 0x8000000000000000) == 0)
  {
    if (a3)
    {
      -[SABinary createFakeEntireBinarySegment](v6);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_28:
  objc_sync_exit(v6);

  return v16;
}

- (NSArray)segments
{
  SABinary *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_segments, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

+ (void)clearCaches
{
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  id v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3032000000;
  v6 = __Block_byref_object_copy__2;
  v7 = __Block_byref_object_dispose__2;
  v8 = 0;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __23__SABinary_clearCaches__block_invoke;
  v2[3] = &unk_1E71480A8;
  v2[4] = &v3;
  +[SABinary _doCachedBinariesWork:]((uint64_t)a1, v2);
  objc_msgSend((id)v4[5], "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_3);
  _Block_object_dispose(&v3, 8);

}

void __23__SABinary_clearCaches__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  id v15;
  uint8_t buf[16];

  v15 = a2;
  v3 = objc_msgSend(v15, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if ((id)qword_1ED1DD840 == v15)
  {
    qword_1ED1DD840 = 0;

  }
  else
  {
    v6 = *__error();
    _sa_logt();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B9BE0000, v7, OS_LOG_TYPE_ERROR, "global doesn't match local", buf, 2u);
    }

    *__error() = v6;
    _SASetCrashLogMessage(1087, "global doesn't match local", v8, v9, v10, v11, v12, v13, v14);
    _os_crash();
    __break(1u);
  }
}

void __23__SABinary_clearCaches__block_invoke_93(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "clearSymbolCache");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

+ (void)clearSymbolCaches
{
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  id v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3032000000;
  v6 = __Block_byref_object_copy__2;
  v7 = __Block_byref_object_dispose__2;
  v8 = 0;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __29__SABinary_clearSymbolCaches__block_invoke;
  v2[3] = &unk_1E71480A8;
  v2[4] = &v3;
  +[SABinary _doCachedBinariesWork:]((uint64_t)a1, v2);
  objc_msgSend((id)v4[5], "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_95);
  _Block_object_dispose(&v3, 8);

}

void __29__SABinary_clearSymbolCaches__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __29__SABinary_clearSymbolCaches__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "clearSymbolCache");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

+ (void)clearCoreSymbolicationCaches
{
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  id v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3032000000;
  v6 = __Block_byref_object_copy__2;
  v7 = __Block_byref_object_dispose__2;
  v8 = 0;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__SABinary_clearCoreSymbolicationCaches__block_invoke;
  v2[3] = &unk_1E71480A8;
  v2[4] = &v3;
  +[SABinary _doCachedBinariesWork:]((uint64_t)a1, v2);
  objc_msgSend((id)v4[5], "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_96);
  _Block_object_dispose(&v3, 8);

}

+ (uint64_t)haveMultipleBinariesWithUUID:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v2 = a2;
  v3 = objc_opt_self();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__SABinary_haveMultipleBinariesWithUUID___block_invoke;
  v7[3] = &unk_1E7148130;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  +[SABinary _doCachedBinariesWork:](v3, v7);
  v5 = *((unsigned __int8 *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __41__SABinary_haveMultipleBinariesWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (unint64_t)objc_msgSend(v3, "count") > 1;

}

+ (SABinary)binaryWithUUID:(id)a3 absolutePath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  int v11;
  NSObject *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  __int128 *p_buf;
  id v24;
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if ((objc_msgSend(v7, "isAbsolutePath") & 1) == 0)
    {
      v11 = *__error();
      _sa_logt();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
        _os_log_error_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_ERROR, "path %s is not absolute", (uint8_t *)&buf, 0xCu);
      }

      *__error() = v11;
      v13 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      _SASetCrashLogMessage(1141, "path %s is not absolute", v14, v15, v16, v17, v18, v19, v13);
      _os_crash();
      __break(1u);
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__2;
    v28 = __Block_byref_object_dispose__2;
    v29 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __40__SABinary_binaryWithUUID_absolutePath___block_invoke;
    v20[3] = &unk_1E7148158;
    v21 = v6;
    v22 = v8;
    p_buf = &buf;
    v24 = a1;
    +[SABinary _doCachedBinariesWork:]((uint64_t)a1, v20);
    v9 = *(id *)(*((_QWORD *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    objc_msgSend(a1, "binaryWithUUID:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (SABinary *)v9;
}

void __40__SABinary_binaryWithUUID_absolutePath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  id v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v34 = 0;
        objc_msgSend(v9, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = SAFilepathMatches(v10, *(void **)(a1 + 40), &v34);

        if (v11)
        {
          objc_msgSend(v9, "path");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {

          }
          else if (objc_msgSend(v4, "count") != 1)
          {
            v22 = *__error();
            _sa_logt();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(*(id *)(a1 + 32), "UUIDString");
              v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v25 = objc_msgSend(v24, "UTF8String");
              *(_DWORD *)buf = 136315138;
              v40 = v25;
              _os_log_error_impl(&dword_1B9BE0000, v23, OS_LOG_TYPE_ERROR, "Multiple binaries for %s, but no path", buf, 0xCu);

            }
            *__error() = v22;
            objc_msgSend(*(id *)(a1 + 32), "UUIDString");
            v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v27 = objc_msgSend(v26, "UTF8String");
            _SASetCrashLogMessage(1150, "Multiple binaries for %s, but no path", v28, v29, v30, v31, v32, v33, v27);

            _os_crash();
            __break(1u);
          }
          if (v34)
          {
            SACachedNSString(*(void **)(a1 + 40));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9)
              objc_setProperty_atomic_copy(v9, v13, v14, 80);

          }
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v9);
          goto LABEL_18;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_18:

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v15 = objc_alloc(*(Class *)(a1 + 56));
    v16 = *(_QWORD *)(a1 + 32);
    SACachedNSString(*(void **)(a1 + 40));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "initWithUUID:path:", v16, v17);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    if (v4)
    {
      objc_msgSend(v4, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    }
    else
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, *(_QWORD *)(a1 + 32));

    }
  }

}

+ (SABinary)binaryWithUUID:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __27__SABinary_binaryWithUUID___block_invoke;
  v8[3] = &unk_1E7148180;
  v5 = v4;
  v9 = v5;
  v10 = &v12;
  v11 = a1;
  +[SABinary _doCachedBinariesWork:]((uint64_t)a1, v8);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return (SABinary *)v6;
}

+ (id)binaryWithPath:(uint64_t)a1 architecture:(void *)a2 additionalCSSymbolicatorFlags:(uint64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t SymbolOwnerForArchitectureAtPath;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = a2;
  v5 = objc_opt_self();
  SymbolOwnerForArchitectureAtPath = CreateSymbolOwnerForArchitectureAtPath(a3, v4);
  v8 = v7;

  if ((CSIsNull() & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    +[SABinary binaryWithSymbolOwner:fromDisk:](v5, SymbolOwnerForArchitectureAtPath, v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CSRelease();
  }
  return v9;
}

+ (id)binaryWithSymbolOwner:(uint64_t)a3 fromDisk:(char)a4
{
  void *v7;
  uint64_t CFUUIDBytes;
  uint64_t v9;
  _BYTE *Path;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;

  v7 = (void *)objc_opt_self();
  CFUUIDBytes = CSSymbolOwnerGetCFUUIDBytes();
  if ((CSSymbolOwnerIsDsym() & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    Path = (_BYTE *)CSSymbolOwnerGetPath();
    SAFilepathForCString(Path);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  if (CFUUIDBytes | v9)
  {
    if (CFUUIDBytes)
      v11 = (void *)CFUUIDBytes;
    else
      v11 = &UUID_NULL;
    uuidForBytes((uint64_t)v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v9, "isAbsolutePath"))
      v13 = v9;
    else
      v13 = 0;
    objc_msgSend(v7, "binaryWithUUID:absolutePath:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 || !v9)
    {
      if (v14)
        goto LABEL_17;
    }
    else if (v14)
    {
      objc_setProperty_atomic_copy(v14, v16, (id)v9, 80);
LABEL_17:
      -[SABinary addInfoFromSymbolOwner:fromDisk:includeExpensiveInfo:]((uint64_t)v14, a2, a3, a4, 0);
    }

    goto LABEL_19;
  }
  v14 = 0;
LABEL_19:

  return v14;
}

+ (void)_doDsymPathsWork:(uint64_t)a1
{
  id v2;
  void (**v3)(id, uint64_t);

  v3 = a2;
  objc_opt_self();
  if (qword_1ED1DD850 != -1)
    dispatch_once(&qword_1ED1DD850, &__block_literal_global_102);
  v2 = (id)qword_1ED1DD848;
  objc_sync_enter(v2);
  v3[2](v3, qword_1ED1DD848);
  objc_sync_exit(v2);

}

void __29__SABinary__doDsymPathsWork___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  v1 = (void *)qword_1ED1DD848;
  qword_1ED1DD848 = v0;

}

+ (void)_addDsymPath:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  v3 = objc_opt_self();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__SABinary__addDsymPath___block_invoke;
  v5[3] = &unk_1E71481A8;
  v6 = v2;
  v4 = v2;
  +[SABinary _doDsymPathsWork:](v3, v5);

}

void __25__SABinary__addDsymPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));

}

void __22__SABinary__dsymPaths__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (void)addDsymPaths:(id)a3
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  int v14;
  NSObject *v15;
  __int128 v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  __CFString *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v19;
    *(_QWORD *)&v5 = 138412546;
    v16 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "rangeOfString:", CFSTR(".dSYM"), v16);
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          +[SABinary _addDsymPath:]((uint64_t)a1, v9);
        }
        else
        {
          objc_msgSend(v9, "substringWithRange:", 0, v10 + v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringByDeletingLastPathComponent");
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (!-[__CFString length](v13, "length"))
          {

            v13 = CFSTR("./");
          }
          v14 = *__error();
          _sa_logt();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v16;
            v23 = v9;
            v24 = 2112;
            v25 = v13;
            _os_log_debug_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_DEBUG, "Replaced %@ with %@", buf, 0x16u);
          }

          *__error() = v14;
          +[SABinary _addDsymPath:]((uint64_t)a1, v13);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v6);
  }

}

+ (void)addPath:(id)a3 forBinaryWithUUID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (objc_msgSend(v8, "isAbsolutePath"))
  {
    v6 = +[SABinary binaryWithUUID:absolutePath:](SABinary, "binaryWithUUID:absolutePath:", v5, v8);
  }
  else
  {
    +[SABinary binaryWithUUID:](SABinary, "binaryWithUUID:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addPath:", v8);

  }
}

+ (void)addSymbolsFromTailspin:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *Path;
  char v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  void *v33;
  id v34;
  id *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  __CFString *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id newValue;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[5];
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  DictGetString(v3, CFSTR("Name"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  DictGetString(v3, CFSTR("Path"));
  newValue = (id)objc_claimAutoreleasedReturnValue();
  DictGetNumber(v3, CFSTR("Size"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongLongValue");

  DictGetString(v3, CFSTR("UUID_String"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DictGetString(v3, CFSTR("BundleID"));
  v47 = (id)objc_claimAutoreleasedReturnValue();
  DictGetString(v3, CFSTR("BundleVersion"));
  v46 = (id)objc_claimAutoreleasedReturnValue();
  DictGetString(v3, CFSTR("BundleShortVersion"));
  v45 = (id)objc_claimAutoreleasedReturnValue();
  DictGetString(v3, CFSTR("BinaryVersion"));
  v44 = (id)objc_claimAutoreleasedReturnValue();
  DictGetNumber(v3, CFSTR("TEXT_EXEC"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v6)
  {
    uuidForString(v6);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      if (objc_msgSend(newValue, "isAbsolutePath"))
        v9 = newValue;
      else
        v9 = 0;
      +[SABinary binaryWithUUID:absolutePath:](SABinary, "binaryWithUUID:absolutePath:", v43, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("__TEXT");
      if (v8)
        v11 = CFSTR("__TEXT_EXEC");
      v41 = v11;
      -[SABinary segmentWithCleanName:](v10, v41);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        +[SASegment segmentWithBinary:name:length:]((uint64_t)SASegment, v10, v41, v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SABinary addSegment:](v10, v12);
      }
      objc_msgSend(v10, "path", v41, v43);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {

      }
      else if (objc_msgSend(newValue, "length") && v10)
      {
        objc_setProperty_atomic_copy(v10, v18, newValue, 80);
      }
      objc_msgSend(v10, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {

      }
      else if (objc_msgSend(v48, "length"))
      {
        objc_msgSend(v10, "path");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20
          || (objc_msgSend(v10, "path"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              Path = -[NSString copyLastPathComponent](v21),
              v23 = objc_msgSend(Path, "hasPrefix:", v48),
              Path,
              v21,
              v20,
              (v23 & 1) == 0))
        {
          -[SABinary setName:](v10, v48);
        }
      }
      objc_msgSend(v10, "bundleIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {

      }
      else if (objc_msgSend(v47, "length") && v10)
      {
        objc_setProperty_atomic_copy(v10, v25, v47, 88);
      }
      objc_msgSend(v10, "bundleVersion");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {

      }
      else if (objc_msgSend(v46, "length") && v10)
      {
        objc_setProperty_atomic_copy(v10, v27, v46, 96);
      }
      objc_msgSend(v10, "bundleShortVersion");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {

      }
      else if (objc_msgSend(v45, "length") && v10)
      {
        objc_setProperty_atomic_copy(v10, v29, v45, 104);
      }
      objc_msgSend(v10, "binaryVersion");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {

      }
      else if (objc_msgSend(v44, "length") && v10)
      {
        objc_setProperty_atomic_copy(v10, v31, v44, 112);
      }
      DictGetDict(v3, CFSTR("Symbols"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v32)
      {
        v34 = v32;
        if (v12)
        {
          v35 = v12;
          objc_sync_enter(v35);
          v54[0] = MEMORY[0x1E0C809B0];
          v54[1] = 3221225472;
          v54[2] = __32__SASegment_addTailspinSymbols___block_invoke;
          v54[3] = &unk_1E7147F28;
          v54[4] = v35;
          objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v54);
          objc_msgSend(v35[7], "allValues");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_sync_exit(v35);

          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          v37 = v36;
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v50, buf, 16);
          if (v38)
          {
            v39 = *(_QWORD *)v51;
            do
            {
              for (i = 0; i != v38; ++i)
              {
                if (*(_QWORD *)v51 != v39)
                  objc_enumerationMutation(v37);
                -[SAInstruction checkForNewSymbol](*(unint64_t **)(*((_QWORD *)&v50 + 1) + 8 * i));
              }
              v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v50, buf, 16);
            }
            while (v38);
          }

        }
      }

    }
    else
    {
      v16 = *__error();
      _sa_logt();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v6;
        _os_log_error_impl(&dword_1B9BE0000, v17, OS_LOG_TYPE_ERROR, "Unable to convert %@ into uuid", buf, 0xCu);
      }

      *__error() = v16;
    }

  }
  else
  {
    v14 = *__error();
    _sa_logt();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v48;
      _os_log_error_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_ERROR, "No uuid in tailspin symbol chunk for %@", buf, 0xCu);
    }

    *__error() = v14;
  }

}

- (id)segmentWithCleanName:(void *)a1
{
  id v3;
  _QWORD *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = a1;
    objc_sync_enter(v4);
    v5 = (void *)v4[7];
    if (v5)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v6 = v5;
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v16 != v8)
              objc_enumerationMutation(v6);
            v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v10, "name", (_QWORD)v15);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "isEqualToString:", v3);

            if (v12)
            {
              v7 = v10;
              v13 = 1;
              goto LABEL_13;
            }
          }
          v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v7)
            continue;
          break;
        }
      }
      v13 = 0;
LABEL_13:

    }
    else
    {
      v7 = 0;
      v13 = 1;
    }
    objc_sync_exit(v4);

    if (v13)
      a1 = v7;
    else
      a1 = 0;
  }

  return a1;
}

- (void)addSegment:(void *)a1
{
  void **v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;

  v9 = a2;
  if (a1)
  {
    v3 = a1;
    objc_sync_enter(v3);
    v4 = v3[7];
    if (!v4)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      v6 = v3[7];
      v3[7] = (void *)v5;

      v4 = v3[7];
    }
    objc_msgSend(v4, "addObject:", v9);
    objc_msgSend(v3[7], "sortUsingComparator:", &__block_literal_global_114);
    v7 = v3[6];
    if (v7)
    {
      -[SASegment grabInstructionsFromOtherSegment:](v9, v7);
      if (-[SASegment isEmpty](v3[6]))
      {
        v8 = v3[6];
        v3[6] = 0;

      }
    }
    objc_sync_exit(v3);

  }
}

- (void)setName:(void *)a1
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    v3 = a1;
    objc_sync_enter(v3);
    v4 = objc_msgSend(v6, "copy");
    v5 = (void *)v3[3];
    v3[3] = v4;

    objc_sync_exit(v3);
  }

}

- (SABinary)initWithUUID:(id)a3 path:(id)a4
{
  id v7;
  id v8;
  SABinary *v9;
  SABinary *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SABinary;
  v9 = -[SABinary init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeStrong((id *)&v10->_path, a4);
  }

  return v10;
}

- (void)addPath:(id)a3
{
  id v4;
  SABinary *v5;
  uint64_t v6;
  NSString *path;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v12 = 0;
  if (!SAFilepathMatches(v5->_path, v4, &v12))
  {
    v8 = *__error();
    _sa_logt();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[SABinary debugDescription](v5, "debugDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v4;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1B9BE0000, v9, OS_LOG_TYPE_DEFAULT, "WARNING: Tried to set mismatched path %@ on binary %@", buf, 0x16u);

    }
    goto LABEL_9;
  }
  if (v12)
  {
    SACachedNSString(v4);
    v6 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v6;

    if ((objc_msgSend(v4, "isAbsolutePath") & 1) == 0)
    {
      v8 = *__error();
      _sa_logt();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        -[SABinary debugDescription](v5, "debugDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v11;
        _os_log_debug_impl(&dword_1B9BE0000, v9, OS_LOG_TYPE_DEBUG, "%@ set relative path", buf, 0xCu);

      }
LABEL_9:

      *__error() = v8;
    }
  }
  objc_sync_exit(v5);

}

- (_QWORD)segmentAtOffsetIntoBinary:(_QWORD *)a1
{
  if (a1)
  {
    -[SABinary segmentAtOffsetIntoBinary:createFakeSegmentIfNeeded:](a1, a2, 0);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)segmentWithName:(id)a3
{
  void *v4;
  void *v5;

  CopyCleanSegmentName(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SABinary segmentWithCleanName:](self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)cacheSymbolOwnerWithOptions:(unint64_t)a3 pid:(int)a4
{
  return -[SABinary cacheSymbolOwnerWithOptions:pid:additionalCSSymbolicatorFlags:](self, "cacheSymbolOwnerWithOptions:pid:additionalCSSymbolicatorFlags:", a3, *(_QWORD *)&a4, 0);
}

- (BOOL)cacheSymbolOwnerWithOptions:(unint64_t)a3 pid:(int)a4 additionalCSSymbolicatorFlags:(unsigned int)a5
{
  void *v5;
  BOOL v6;

  -[SABinary symbolOwnerWrapperWithOptions:pid:checkExclave:additionalCSSymbolicatorFlags:](self, a3, a4, 1, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (id)symbolOwnerWrapperWithOptions:(int)a3 pid:(int)a4 checkExclave:(int)a5 additionalCSSymbolicatorFlags:
{
  id *v8;
  uint64_t v9;
  int v10;
  void **v11;
  char v12;
  char v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  id v22;
  int v23;
  unint64_t v24;
  int v25;
  char v26;
  uint64_t SymbolOwnerForExclaveUUID;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  _BYTE *Path;
  void *v33;
  void *v34;
  _BYTE *v35;
  void *v36;
  int v37;
  char v38;
  int v39;
  void *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  _BYTE *v46;
  void *v47;
  void *v48;
  _BYTE *v49;
  void *v50;
  int v51;
  NSObject *v52;
  void *v53;
  uint64_t SymbolicatorForLiveProcess;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  NSObject *v59;
  uint64_t v60;
  int v61;
  NSObject *v62;
  int v63;
  _BYTE *v64;
  void *v65;
  int v66;
  int v67;
  int v68;
  _BYTE *v69;
  char v70;
  NSObject *v71;
  id v72;
  id v73;
  void *v74;
  NSObject *v75;
  uint64_t *v76;
  SACSSymbolOwnerWrapper *v77;
  unint64_t v78;
  void *v79;
  _BYTE *v80;
  uint64_t v81;
  void *v82;
  int v83;
  unint64_t v84;
  id v85;
  int v87;
  NSObject *v88;
  uint64_t v89;
  void *v90;
  NSObject *v91;
  void *v92;
  uint64_t v93;
  int v94;
  NSObject *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  NSObject *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  int v110;
  NSObject *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  int v119;
  int v120;
  unsigned int v122;
  int v123;
  int v124;
  _QWORD block[6];
  char v126;
  _QWORD v127[6];
  unsigned int v128;
  uint64_t v129;
  uint64_t v130;
  void (*v131)(uint64_t, uint64_t);
  void *v132;
  id *v133;
  _BYTE *v134;
  unsigned int v135;
  uint8_t buf[8];
  __int128 v137;
  void *v138;
  _BYTE *v139;
  _BYTE dest[24];
  uint64_t (*v141)(uint64_t, uint64_t);
  void (*v142)(uint64_t);
  id v143;
  uint64_t v144;

  v144 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
LABEL_143:
    v85 = 0;
    return v85;
  }
  v8 = a1;
  objc_sync_enter(v8);
  v9 = (a2 >> 10) & 1;
  if (!a3)
    LODWORD(v9) = 1;
  if (a3 < 0)
    LODWORD(v9) = 0;
  if ((~(_BYTE)a2 & 0x22) != 0)
    v10 = 0;
  else
    v10 = v9;
  v122 = a3;
  v123 = v10;
  v11 = v8 + 10;
  v12 = objc_msgSend(v8[10], "isAbsolutePath");
  if ((a2 & 4) != 0)
    v13 = v12;
  else
    v13 = 1;
  if ((v13 & 1) == 0 && ((_BYTE)v8[2] & 4) == 0)
    -[SABinary findPathViaBinaryLocator](v8);
  if (!CSIsNull())
    goto LABEL_32;
  v14 = (char *)v8[1];
  if (v14)
  {
    objc_copyStruct(dest, v14 + 16, 16, 1, 0);
    if ((CSSymbolOwnerIsDsym() & 1) != 0)
      goto LABEL_32;
  }
  if ((a2 & 0x40) == 0 || (v15 = (unint64_t)v8[2], (v15 & 0x40) != 0))
  {
    if ((a2 & 8) != 0)
    {
      v15 = (unint64_t)v8[2];
      if ((v15 & 8) == 0)
      {
        v17 = 0;
        v16 = 1;
        goto LABEL_24;
      }
    }
LABEL_32:
    v120 = 0;
    goto LABEL_33;
  }
  v16 = a2 & 8;
  v17 = (unint64_t)v8[2] & 8;
LABEL_24:
  v18 = 64;
  if ((((v15 & 0x200) == 0) & (a2 >> 9)) != 0)
    v18 = 576;
  v19 = v18 | v15;
  if (v17)
    v20 = 1;
  else
    v20 = v16 == 0;
  if (!v20)
    v19 |= 8uLL;
  v8[2] = (id)v19;
  v21 = objc_opt_self();
  *(_QWORD *)dest = 0;
  *(_QWORD *)&dest[8] = dest;
  *(_QWORD *)&dest[16] = 0x3032000000;
  v141 = __Block_byref_object_copy__2;
  v142 = __Block_byref_object_dispose__2;
  v143 = 0;
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v137 = 3221225472;
  *((_QWORD *)&v137 + 1) = __22__SABinary__dsymPaths__block_invoke;
  v138 = &unk_1E71481D0;
  v139 = dest;
  +[SABinary _doDsymPathsWork:](v21, buf);
  v22 = *(id *)(*(_QWORD *)&dest[8] + 40);
  _Block_object_dispose(dest, 8);

  v120 = CSIsNull() ^ 1;
LABEL_33:
  if (!CSIsNull() || !v8[1])
  {
    v25 = a2 & a4;
    if (!CSIsNull())
      goto LABEL_52;
    v26 = v25 ^ 1;
    if (*v11)
      v26 = 1;
    if ((v26 & 1) != 0)
    {
LABEL_52:
      v37 = 0;
      v29 = 0;
      SymbolOwnerForExclaveUUID = 0;
    }
    else
    {
      SymbolOwnerForExclaveUUID = CreateSymbolOwnerForExclaveUUID(v8[9]);
      v29 = v28;
      v30 = CSIsNull();
      if ((~(_BYTE)a2 & 5) != 0)
        v31 = 1;
      else
        v31 = v30;
      if ((v31 & 1) == 0)
      {
        Path = (_BYTE *)CSSymbolOwnerGetPath();
        SAFilepathForCString(Path);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (v33 && objc_msgSend(v33, "isAbsolutePath"))
        {
          v35 = +[SABinaryLocator sharedBinaryLocator](SABinaryLocator, "sharedBinaryLocator");
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v34, 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[SABinaryLocator addURL:ForUUID:](v35, v36, v8[9]);

          objc_msgSend(v35, "done");
        }

      }
      v37 = 1;
    }
    if (!CSIsNull())
      goto LABEL_58;
    v38 = v123 ^ 1;
    if (*v11)
      v38 = 1;
    if ((v38 & 1) != 0 || kill(v122, 0) || (v60 = CopyDyldSnapshotForPid(v122)) == 0)
    {
LABEL_58:
      v39 = 0;
    }
    else
    {
      *(_QWORD *)dest = 0;
      *(_QWORD *)&dest[8] = dest;
      *(_QWORD *)&dest[16] = 0x2020000000;
      LOBYTE(v141) = 0;
      v129 = MEMORY[0x1E0C809B0];
      v130 = 3221225472;
      v131 = __89__SABinary_symbolOwnerWrapperWithOptions_pid_checkExclave_additionalCSSymbolicatorFlags___block_invoke;
      v132 = &unk_1E7148290;
      v133 = v8;
      v134 = dest;
      v135 = v122;
      dyld_process_snapshot_for_each_image();
      if (*v11)
      {
        v61 = *__error();
        _sa_logt();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v8, "debugDescription");
          v93 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v122;
          LOWORD(v137) = 2112;
          *(_QWORD *)((char *)&v137 + 2) = v93;
          v118 = (void *)v93;
          _os_log_debug_impl(&dword_1B9BE0000, v62, OS_LOG_TYPE_DEBUG, "Found path via dyld inspection of [%d] for %@", buf, 0x12u);

        }
        v63 = v61;
        v39 = 0;
        *__error() = v63;
      }
      else if (*(_BYTE *)(*(_QWORD *)&dest[8] + 24))
      {
        v39 = 0;
      }
      else
      {
        v87 = *__error();
        _sa_logt();
        v88 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        {
          v119 = v87;
          objc_msgSend(v8, "debugDescription");
          v89 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v122;
          LOWORD(v137) = 2112;
          *(_QWORD *)((char *)&v137 + 2) = v89;
          v90 = (void *)v89;
          _os_log_impl(&dword_1B9BE0000, v88, OS_LOG_TYPE_DEFAULT, "WARNING: Unable to find binary via dyld inspection of [%d] for %@", buf, 0x12u);

          v87 = v119;
        }

        *__error() = v87;
        v39 = 1;
      }
      +[SABinary dataFillingQueue]();
      v91 = objc_claimAutoreleasedReturnValue();
      v127[0] = MEMORY[0x1E0C809B0];
      v127[1] = 3221225472;
      v127[2] = __89__SABinary_symbolOwnerWrapperWithOptions_pid_checkExclave_additionalCSSymbolicatorFlags___block_invoke_126;
      v127[3] = &__block_descriptor_52_e5_v8__0l;
      v128 = v122;
      v127[4] = v60;
      v127[5] = a2 & 0x26D;
      dispatch_async(v91, v127);

      _Block_object_dispose(dest, 8);
    }
    if (!CSIsNull())
      goto LABEL_64;
    LODWORD(v118) = 1;
    if ((a2 & 0x20) == 0)
      goto LABEL_65;
    v40 = *v11;
    if (!*v11)
      goto LABEL_65;
    v41 = (unint64_t)v8[2];
    if ((v41 & 0x20) != 0)
    {
LABEL_64:
      LODWORD(v118) = 1;
    }
    else
    {
      v8[2] = (id)(v41 | 0x20);
      SymbolOwnerForExclaveUUID = CreateSymbolOwnerForUUIDAtPath(v8[9], v40, a5);
      v29 = v42;
      LODWORD(v118) = 0;
      v120 |= CSIsNull() ^ 1;
    }
LABEL_65:
    if (((v37 | v25 & CSIsNull() ^ 1) & 1) == 0)
    {
      SymbolOwnerForExclaveUUID = CreateSymbolOwnerForExclaveUUID(v8[9]);
      v29 = v43;
      v44 = CSIsNull();
      v45 = (~(_BYTE)a2 & 5) != 0 ? 1 : v44;
      if ((v45 & 1) == 0)
      {
        v46 = (_BYTE *)CSSymbolOwnerGetPath();
        SAFilepathForCString(v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v47;
        if (v47 && objc_msgSend(v47, "isAbsolutePath"))
        {
          v49 = +[SABinaryLocator sharedBinaryLocator](SABinaryLocator, "sharedBinaryLocator");
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v48, 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[SABinaryLocator addURL:ForUUID:](v49, v50, v8[9]);

          objc_msgSend(v49, "done");
        }

      }
    }
    if (((v39 | v123 & CSIsNull() ^ 1) & 1) == 0 && !kill(v122, 0))
    {
      if (v122)
      {
        v51 = *__error();
        _sa_logt();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "debugDescription");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)dest = 67109378;
          *(_DWORD *)&dest[4] = v122;
          *(_WORD *)&dest[8] = 2112;
          *(_QWORD *)&dest[10] = v53;
          _os_log_impl(&dword_1B9BE0000, v52, OS_LOG_TYPE_DEFAULT, "WARNING: Inspecting live process [%d] to get symbol owner for %@", dest, 0x12u);

        }
        *__error() = v51;
      }
      SymbolicatorForLiveProcess = CreateSymbolicatorForLiveProcess(v122, a5);
      v56 = v55;
      if ((CSIsNull() & 1) == 0)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&v137 = 0;
        objc_msgSend(v8[9], "getUUIDBytes:", buf);
        SymbolOwnerForExclaveUUID = CSSymbolicatorGetSymbolOwnerWithCFUUIDBytesAtTime();
        v29 = v57;
        if ((CSIsNull() & 1) != 0)
        {
          v58 = *__error();
          _sa_logt();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v8, "debugDescription");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)dest = 67109378;
            *(_DWORD *)&dest[4] = v122;
            *(_WORD *)&dest[8] = 2112;
            *(_QWORD *)&dest[10] = v92;
            _os_log_debug_impl(&dword_1B9BE0000, v59, OS_LOG_TYPE_DEBUG, "Process [%d] didn't have symbol owner for %@", dest, 0x12u);

          }
          *__error() = v58;
        }
        else
        {
          v64 = (_BYTE *)CSSymbolOwnerGetPath();
          SAFilepathForCString(v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          if (v65)
          {
            v126 = 0;
            if (((*((_BYTE *)v8 + 66) != 0) & ~(_DWORD)v118) != 0
              || ((v66 = SAFilepathMatches(*v11, v65, &v126), v126) ? (v67 = v66) : (v67 = 0), v67 == 1))
            {
              objc_storeStrong(v8 + 10, v65);
              *((_BYTE *)v8 + 66) = 0;
            }
            v68 = objc_msgSend(v65, "isAbsolutePath", v118) ^ 1;
            if ((~(_DWORD)a2 & 5) != 0)
              LOBYTE(v68) = 1;
            if ((v68 & 1) == 0)
            {
              v69 = +[SABinaryLocator sharedBinaryLocator](SABinaryLocator, "sharedBinaryLocator");
              v70 = (char)v118;
              if (!*((_BYTE *)v8 + 66))
                v70 = 1;
              if ((v70 & 1) == 0)
              {
                v124 = *__error();
                _sa_logt();
                v71 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
                {
                  v72 = v8[9];
                  v73 = v8[10];
                  *(_DWORD *)dest = 138543874;
                  *(_QWORD *)&dest[4] = v72;
                  *(_WORD *)&dest[12] = 2112;
                  *(_QWORD *)&dest[14] = v73;
                  *(_WORD *)&dest[22] = 2112;
                  v141 = (uint64_t (*)(uint64_t, uint64_t))v65;
                  _os_log_impl(&dword_1B9BE0000, v71, OS_LOG_TYPE_INFO, "%{public}@ moved: replacing %@ with %@", dest, 0x20u);
                }

                *__error() = v124;
                -[SABinaryLocator removeURLForUUID:](v69, v8[9]);
              }
              objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v65, 0);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              -[SABinaryLocator addURL:ForUUID:](v69, v74, v8[9]);

              objc_msgSend(v69, "done");
            }
          }
          CSRetain();

        }
        +[SABinary dataFillingQueue]();
        v75 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __89__SABinary_symbolOwnerWrapperWithOptions_pid_checkExclave_additionalCSSymbolicatorFlags___block_invoke_128;
        block[3] = &__block_descriptor_48_e5_v8__0l;
        block[4] = SymbolicatorForLiveProcess;
        block[5] = v56;
        dispatch_async(v75, block);

      }
    }
    if ((CSIsNull() & 1) != 0)
      goto LABEL_122;
    if (CSIsNull())
    {
      v94 = *__error();
      _sa_logt();
      v95 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)dest = 0;
        _os_log_error_impl(&dword_1B9BE0000, v95, OS_LOG_TYPE_ERROR, "CSSymbolOwner is NULL", dest, 2u);
      }

      *__error() = v94;
      _SASetCrashLogMessage(1935, "CSSymbolOwner is NULL", v96, v97, v98, v99, v100, v101, (char)v118);
      _os_crash();
      __break(1u);
LABEL_137:
      v102 = *__error();
      _sa_logt();
      v103 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)dest = 0;
        _os_log_error_impl(&dword_1B9BE0000, v103, OS_LOG_TYPE_ERROR, "_symbolOwnerWrapper is nil after setting CSSymbolOwner", dest, 2u);
      }

      *__error() = v102;
      _SASetCrashLogMessage(2244, "_symbolOwnerWrapper is nil after setting CSSymbolOwner", v104, v105, v106, v107, v108, v109, (char)v118);
      _os_crash();
      __break(1u);
      goto LABEL_140;
    }
    v76 = v8;
    objc_sync_enter(v76);
    if (!v76[1])
      goto LABEL_114;
    if ((CSSymbolOwnerIsDsym() & 1) != 0)
    {
      -[SACSSymbolOwnerWrapper symbolOwner](v76[1]);
      if ((CSSymbolOwnerIsDsym() & 1) == 0)
      {
LABEL_114:
        v77 = [SACSSymbolOwnerWrapper alloc];
        if (v77)
        {
          if (CSIsNull())
          {
LABEL_140:
            v110 = *__error();
            _sa_logt();
            v111 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)dest = 0;
              _os_log_error_impl(&dword_1B9BE0000, v111, OS_LOG_TYPE_ERROR, "CSSymbolOwner is NULL", dest, 2u);
            }

            *__error() = v110;
            _SASetCrashLogMessage(47, "CSSymbolOwner is NULL", v112, v113, v114, v115, v116, v117, (char)v118);
            _os_crash();
            __break(1u);
            goto LABEL_143;
          }
          *(_QWORD *)dest = v77;
          *(_QWORD *)&dest[8] = SACSSymbolOwnerWrapper;
          v77 = (SACSSymbolOwnerWrapper *)objc_msgSendSuper2((objc_super *)dest, sel_init);
          if (v77)
          {
            v77->_symbolOwner._opaque_1 = CSRetain();
            v77->_symbolOwner._opaque_2 = v78;
            v77->_isDiskLayout = v120;
          }
        }
        v79 = (void *)v76[1];
        v76[1] = (uint64_t)v77;

        -[SABinary addInfoFromSymbolOwner:fromDisk:includeExpensiveInfo:]((uint64_t)v76, SymbolOwnerForExclaveUUID, v29, v120, 0);
      }
    }
    else if (!*v11)
    {
      v80 = (_BYTE *)CSSymbolOwnerGetPath();
      SAFilepathForCString(v80);
      v81 = objc_claimAutoreleasedReturnValue();
      v82 = *v11;
      *v11 = (void *)v81;

    }
    objc_sync_exit(v76);

    CSRelease();
    if (v76[1])
    {
LABEL_122:
      v83 = objc_msgSend(*v11, "isAbsolutePath", v118);
      if ((a2 & 1) != 0 && ((v83 ^ 1) & 1) == 0)
      {
        v84 = (unint64_t)v8[2];
        if ((v84 & 1) == 0)
        {
          v8[2] = (id)(v84 | 1);
          -[SABinary gatherBundleInfo](v8);
        }
      }
      goto LABEL_126;
    }
    goto LABEL_137;
  }
  v23 = objc_msgSend(*v11, "isAbsolutePath");
  if ((a2 & 1) != 0 && ((v23 ^ 1) & 1) == 0)
  {
    v24 = (unint64_t)v8[2];
    if ((v24 & 1) == 0)
    {
      v8[2] = (id)(v24 | 1);
      -[SABinary gatherBundleInfo](v8);
    }
  }
LABEL_126:
  v85 = v8[1];
  objc_sync_exit(v8);

  return v85;
}

uint64_t __23__SABinary_addSegment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "offsetIntoBinary");
  v6 = objc_msgSend(v4, "offsetIntoBinary");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

- (id)instructionAtOffsetIntoBinary:(int64_t)a3
{
  SABinary *v4;
  SASegment *v5;
  SASegment *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  int v11;
  NSObject *v12;
  id v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  -[SABinary segmentAtOffsetIntoBinary:createFakeSegmentIfNeeded:](v4, a3, 1);
  v5 = (SASegment *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_4;
  if (!-[SASegment hasOffsetIntoBinary](v5, "hasOffsetIntoBinary"))
  {
    v11 = *__error();
    _sa_logt();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[SASegment debugDescription](v6, "debugDescription");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315138;
      v23 = objc_msgSend(v13, "UTF8String");
      _os_log_error_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_ERROR, "%s: no offset into binary", buf, 0xCu);

    }
    *__error() = v11;
    -[SASegment debugDescription](v6, "debugDescription");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "UTF8String");
    _SASetCrashLogMessage(1700, "%s: no offset into binary", v16, v17, v18, v19, v20, v21, v15);

    _os_crash();
    __break(1u);
  }
  v7 = -[SASegment offsetIntoBinary](v6, "offsetIntoBinary");
  if (-[SASegment length](v6, "length") - 1 >= a3 - v7)
  {
    -[SASegment instructionAtOffsetIntoSegment:](v6, "instructionAtOffsetIntoSegment:");
    v10 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v10;
    if (v6 == v4->_fakeEntireBinarySegment && v10)
      objc_storeWeak((id *)(v10 + 32), 0);
  }
  else
  {
LABEL_4:
    v8 = 0;
  }

  objc_sync_exit(v4);
  return v8;
}

- (_QWORD)segmentWithCSSegment:(uint64_t)a3 symbolOwnerLayoutMatchesDisk:(int)a4 symbolOwnerBaseAddress:(uint64_t)a5
{
  uint64_t Range;
  unint64_t v9;
  unint64_t v10;
  void *Name;
  void *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;

  if (!a1)
    goto LABEL_11;
  Range = CSRegionGetRange();
  v10 = v9;
  Name = (void *)CSRegionGetName();
  if (!Name)
    goto LABEL_11;
  SANSStringForCString(Name);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CopyCleanSegmentName(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = a1;
    objc_sync_enter(v14);
    -[SABinary segmentWithCleanName:](v14, v13);
    v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      if (a4 && (objc_msgSend(v15, "hasOffsetIntoBinary") & 1) == 0)
        v16[5] = Range - a5;
      if (!objc_msgSend(v16, "length") && v10)
        -[SASegment setLength:](v16, v10);
    }
    else
    {
      if (a4)
        +[SASegment segmentWithBinary:name:length:offsetIntoBinary:]((uint64_t)SASegment, v14, v13, v10, Range - a5);
      else
        +[SASegment segmentWithBinary:name:length:]((uint64_t)SASegment, v14, v13, v10);
      v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      -[SABinary addSegment:](v14, v16);
    }
    objc_sync_exit(v14);

  }
  else
  {
LABEL_11:
    v16 = 0;
  }
  return v16;
}

void __33__SABinary_addInfoFromDyldImage___block_invoke(uint64_t a1, void *a2, unint64_t a3, unint64_t a4)
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  SANSStringForCString(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CopyCleanSegmentName(v8);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[SABinary segmentWithCleanName:](*(void **)(a1 + 32), v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v9;
    v11 = objc_msgSend(v9, "length");
    if (a4 && !v11)
      -[SASegment setLength:](v10, a4);
  }
  else
  {
    +[SASegment segmentWithBinary:name:length:]((uint64_t)SASegment, *(void **)(a1 + 32), v14, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SABinary addSegment:](*(void **)(a1 + 32), v10);
  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_QWORD *)(v12 + 24) < a4 + a3)
    *(_QWORD *)(v12 + 24) = a4 + a3;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_QWORD *)(v13 + 24) > a3)
    *(_QWORD *)(v13 + 24) = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += a4;
  if (!strcmp((const char *)a2, "__TEXT"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a3;

}

- (void)setLength:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  id v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v3 = a1;
  objc_sync_enter(v3);
  if (!a2)
  {
    v6 = *__error();
    _sa_logt();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "debugDescription");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315138;
      v34 = objc_msgSend(v8, "UTF8String");
      _os_log_error_impl(&dword_1B9BE0000, v7, OS_LOG_TYPE_ERROR, "%s: setting length 0", buf, 0xCu);

    }
    *__error() = v6;
    objc_msgSend(v3, "debugDescription");
    a2 = (unint64_t)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend((id)a2, "UTF8String");
    _SASetCrashLogMessage(2589, "%s: setting length 0", v10, v11, v12, v13, v14, v15, v9);

    _os_crash();
    __break(1u);
    goto LABEL_13;
  }
  if (*((_QWORD *)v3 + 5))
  {
LABEL_13:
    v16 = *__error();
    _sa_logt();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "debugDescription");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v19 = objc_msgSend(v18, "UTF8String");
      v20 = *((_QWORD *)v3 + 5);
      *(_DWORD *)buf = 136315650;
      v34 = v19;
      v35 = 2048;
      v36 = a2;
      v37 = 2048;
      v38 = v20;
      _os_log_error_impl(&dword_1B9BE0000, v17, OS_LOG_TYPE_ERROR, "%s: setting length to %llu when it was already %llu", buf, 0x20u);

    }
    *__error() = v16;
    objc_msgSend(v3, "debugDescription");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = objc_msgSend(v21, "UTF8String");
    _SASetCrashLogMessage(2590, "%s: setting length to %llu when it was already %llu", v23, v24, v25, v26, v27, v28, v22);

    _os_crash();
    __break(1u);
    goto LABEL_16;
  }
  *((_QWORD *)v3 + 5) = a2;
  if (a2 >> 28)
  {
LABEL_16:
    v29 = *__error();
    _sa_logt();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v3, "debugDescription");
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v32 = objc_msgSend(v31, "UTF8String");
      *(_DWORD *)buf = 136315394;
      v34 = v32;
      v35 = 2048;
      v36 = a2;
      _os_log_fault_impl(&dword_1B9BE0000, v30, OS_LOG_TYPE_FAULT, "%s has length above max: 0x%llx", buf, 0x16u);

    }
    *__error() = v29;
  }
  v4 = (void *)*((_QWORD *)v3 + 6);
  if (v4)
  {
    -[SASegment setLength:](v4, *((_QWORD *)v3 + 5));
    if (-[SASegment isEmpty](*((void **)v3 + 6)))
    {
      v5 = (void *)*((_QWORD *)v3 + 6);
      *((_QWORD *)v3 + 6) = 0;

    }
  }
  objc_sync_exit(v3);

}

void __33__SABinary_addInfoFromDyldImage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  SANSStringForCString(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CopyCleanSegmentName(v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[SABinary segmentWithCleanName:](*(void **)(a1 + 32), v8);
  v6 = objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)v6, "hasOffsetIntoBinary") & 1) == 0)
  {
    if (v6)
      *(_QWORD *)(v6 + 40) = a3 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    if (v7)
      -[SASegment grabInstructionsFromOtherSegment:]((id *)v6, v7);
  }

}

+ (_QWORD)binaryForDyldImage:(int)a3 options:
{
  uint64_t v5;
  void *v6;
  int v7;
  NSObject *v8;
  _QWORD *v9;
  void *v11;
  char *v12;
  void *v13;
  int v14;
  _BYTE *v15;
  _BYTE *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  char *v34;
  uint64_t v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  _QWORD v40[6];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  unsigned __int8 uu[8];
  uint64_t v58;
  _BYTE buf[24];
  void *v60;
  _QWORD *v61;
  uint64_t *v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = objc_opt_self();
  v6 = (void *)MEMORY[0x1BCCCC288](v5);
  *(_QWORD *)uu = 0;
  v58 = 0;
  if (!dyld_image_copy_uuid() || uuid_is_null(uu))
  {
    v7 = *__error();
    _sa_logt();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v21 = DyldImagePath(a2);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v21;
      _os_log_error_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_ERROR, "No UUID for dyld_image %s", buf, 0xCu);
    }

    v9 = 0;
    *__error() = v7;
    goto LABEL_6;
  }
  uuidForBytes((uint64_t)uu);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (char *)DyldImagePath(a2);
  if (v12 && *v12)
  {
    SANSStringForCString(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v14 = objc_msgSend(v13, "isAbsolutePath") ^ 1;
  if ((~a3 & 5) != 0)
    LOBYTE(v14) = 1;
  if ((v14 & 1) == 0)
  {
    v15 = +[SABinaryLocator sharedBinaryLocator](SABinaryLocator, "sharedBinaryLocator");
    v16 = v15;
    if (!v15)
    {
LABEL_27:

      goto LABEL_28;
    }
    -[SABinaryLocator urlForUUID:](v15, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(v18, "path");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "isEqualToString:", v13))
        {

LABEL_26:
          objc_msgSend(v16, "done");

          goto LABEL_27;
        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "path");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v39, "fileExistsAtPath:", v38) & 1) != 0)
        {

          goto LABEL_26;
        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v22, "fileExistsAtPath:", v13);

        if (!v37)
          goto LABEL_26;
      }
      v23 = *__error();
      _sa_logt();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v18, "path");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v25;
        *(_WORD *)&buf[22] = 2112;
        v60 = v13;
        _os_log_impl(&dword_1B9BE0000, v24, OS_LOG_TYPE_INFO, "%{public}@ moved: replacing %@ with %@", buf, 0x20u);

      }
      *__error() = v23;
      -[SABinaryLocator removeURLForUUID:](v16, v11);
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[SABinaryLocator addURL:ForUUID:](v16, v26, v11);
    v18 = v26;
    goto LABEL_26;
  }
LABEL_28:
  if (objc_msgSend(v13, "isAbsolutePath"))
    v27 = v13;
  else
    v27 = 0;
  +[SABinary binaryWithUUID:absolutePath:](SABinary, "binaryWithUUID:absolutePath:", v11, v27);
  v28 = objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)v28;
  if (v28 && (!*(_QWORD *)(v28 + 80) || !*(_QWORD *)(v28 + 40) || !objc_msgSend(*(id *)(v28 + 56), "count")))
  {
    v29 = v9;
    objc_sync_enter(v29);
    if (!v9[10])
    {
      v34 = (char *)DyldImagePath(a2);
      if (v34)
      {
        if (*v34)
        {
          SANSStringForCString(v34);
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = (void *)v9[10];
          v9[10] = v35;

        }
      }
    }
    v53 = 0;
    v54 = &v53;
    v55 = 0x2020000000;
    v56 = -1;
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = 0;
    v45 = 0;
    v46 = &v45;
    v47 = 0x2020000000;
    v48 = 0;
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    v30 = MEMORY[0x1E0C809B0];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __33__SABinary_addInfoFromDyldImage___block_invoke;
    v60 = &unk_1E7148218;
    v61 = v29;
    v62 = &v49;
    v63 = &v53;
    v64 = &v45;
    v65 = &v41;
    DyldImageEnumerateSegments(a2, buf);
    v31 = v42[3];
    if (v31 == v54[3])
    {
      v32 = v50[3] - v31;
      if (v32 == v46[3])
      {
        if (!v29[5])
          -[SABinary setLength:](v29, v32);
        v40[0] = v30;
        v40[1] = 3221225472;
        v40[2] = __33__SABinary_addInfoFromDyldImage___block_invoke_2;
        v40[3] = &unk_1E7148240;
        v40[4] = v29;
        v40[5] = &v41;
        DyldImageEnumerateSegments(a2, v40);
      }
    }
    if (-[SASegment isEmpty]((void *)v29[6]))
    {
      v33 = (void *)v29[6];
      v29[6] = 0;

    }
    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v49, 8);
    _Block_object_dispose(&v53, 8);
    objc_sync_exit(v29);

  }
LABEL_6:
  objc_autoreleasePoolPop(v6);
  return v9;
}

- (void)addInfoFromSymbolOwner:(uint64_t)a3 fromDisk:(char)a4 includeExpensiveInfo:(int)a5
{
  void **v10;
  void **v11;
  _BYTE *Path;
  void *v13;
  int v14;
  int v15;
  _BYTE *Name;
  uint64_t v17;
  void *v18;
  _BOOL4 IsContiguous;
  unint64_t v20;
  void *v21;
  _BOOL4 v22;
  void *Version;
  uint64_t v24;
  void *v25;
  _QWORD v26[7];
  char v27;
  char v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;

  if (a1 && ((a5 & 1) != 0 || !objc_msgSend(*(id *)(a1 + 80), "isAbsolutePath") || !*(_QWORD *)(a1 + 40)))
  {
    v10 = (void **)(id)a1;
    objc_sync_enter(v10);
    v11 = v10 + 10;
    if ((objc_msgSend(v10[10], "isAbsolutePath") & 1) == 0 && (CSSymbolOwnerIsDsym() & 1) == 0)
    {
      Path = (_BYTE *)CSSymbolOwnerGetPath();
      SAFilepathForCString(Path);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v30) = 0;
      if (v13)
      {
        v14 = SAFilepathMatches(*v11, v13, &v30);
        v15 = (_BYTE)v30 ? v14 : 0;
        if (v15 == 1)
          objc_storeStrong(v10 + 10, v13);
      }

    }
    if (!v10[3] && !*v11)
    {
      Name = (_BYTE *)CSSymbolOwnerGetName();
      SAFilepathForCString(Name);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v10[3];
      v10[3] = (void *)v17;

    }
    v30 = 0;
    v31 = 0;
    v29 = 0;
    IsContiguous = SASymbolOwnerIsContiguous(a2, a3, &v30, &v29);
    v20 = v29;
    if (v20 > objc_msgSend(v10[7], "count"))
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __65__SABinary_addInfoFromSymbolOwner_fromDisk_includeExpensiveInfo___block_invoke;
      v26[3] = &unk_1E7148268;
      v27 = IsContiguous | a4;
      v26[4] = v10;
      v26[5] = a2;
      v26[6] = a3;
      v28 = a5;
      SASymbolOwnerForeachSegment(a2, a3, v26);
    }
    if (-[SASegment isEmpty](v10[6]))
    {
      v21 = v10[6];
      v10[6] = 0;

    }
    if (v10[5])
      v22 = 0;
    else
      v22 = IsContiguous;
    if (v22)
      -[SABinary setLength:](v10, v31);
    if (a5 && !v10[14])
    {
      Version = (void *)CSSymbolOwnerGetVersion();
      if (Version)
      {
        SANSStringForCString(Version);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = v10[14];
        v10[14] = (void *)v24;

      }
    }
    objc_sync_exit(v10);

  }
}

void __65__SABinary_addInfoFromSymbolOwner_fromDisk_includeExpensiveInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;
  void *v7;
  uint64_t BaseAddress;
  id *v9;
  uint64_t Range;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[7];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = *(unsigned __int8 *)(a1 + 56);
  v7 = *(void **)(a1 + 32);
  BaseAddress = CSSymbolOwnerGetBaseAddress();
  -[SABinary segmentWithCSSegment:symbolOwnerLayoutMatchesDisk:symbolOwnerBaseAddress:](v7, a2, a3, v6, BaseAddress);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v17 && *(_BYTE *)(a1 + 57))
  {
    v9 = (id *)v17;
    objc_sync_enter(v9);
    Range = CSRegionGetRange();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __34__SASegment_addInfoFromCSSegment___block_invoke;
    v27[3] = &unk_1E7147FB8;
    v27[5] = Range;
    v27[6] = v11;
    v27[4] = v9;
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __34__SASegment_addInfoFromCSSegment___block_invoke_2;
    v25 = &unk_1E7148008;
    v26 = (id)MEMORY[0x1BCCCC450](v27);
    CSRegionForeachSymbol();
    objc_msgSend(v9[7], "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v9);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v13);
          -[SAInstruction checkForNewSymbol](*(unint64_t **)(*((_QWORD *)&v18 + 1) + 8 * v16++));
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      }
      while (v14);
    }

  }
}

void __89__SABinary_symbolOwnerWrapperWithOptions_pid_checkExclave_additionalCSSymbolicatorFlags___block_invoke(uint64_t a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  NSObject *v9;
  int v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  void *v14;
  unsigned __int8 uu1[8];
  uint64_t v16;
  unsigned __int8 uu2[8];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
  {
    *(_QWORD *)uu2 = 0;
    v18 = 0;
    dyld_image_copy_uuid();
    *(_QWORD *)uu1 = 0;
    v16 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "getUUIDBytes:", uu1);
    if (!uuid_compare(uu1, uu2))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      v4 = (char *)DyldImagePath(a2);
      if (v4)
      {
        SANSStringForCString(v4);
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(void **)(v6 + 80);
        *(_QWORD *)(v6 + 80) = v5;

      }
      else
      {
        v8 = *__error();
        _sa_logt();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = *(_DWORD *)(a1 + 48);
          objc_msgSend(*(id *)(a1 + 32), "debugDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12[0] = 67109378;
          v12[1] = v10;
          v13 = 2112;
          v14 = v11;
          _os_log_error_impl(&dword_1B9BE0000, v9, OS_LOG_TYPE_ERROR, "dyld image has no installname in [%d] for %@", (uint8_t *)v12, 0x12u);

        }
        *__error() = v8;
      }
    }
  }
}

+ (id)dataFillingQueue
{
  objc_opt_self();
  if (qword_1ED1DD860 != -1)
    dispatch_once(&qword_1ED1DD860, &__block_literal_global_135);
  return (id)qword_1ED1DD858;
}

uint64_t __89__SABinary_symbolOwnerWrapperWithOptions_pid_checkExclave_additionalCSSymbolicatorFlags___block_invoke_126(uint64_t a1)
{
  _CopyLoadInfosForDyldSnapshot(*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 40), 0, 0, 0, 0);
  return dyld_process_snapshot_dispose();
}

uint64_t __89__SABinary_symbolOwnerWrapperWithOptions_pid_checkExclave_additionalCSSymbolicatorFlags___block_invoke_128()
{
  CSSymbolicatorForeachSymbolOwnerAtTime();
  return CSRelease();
}

id __89__SABinary_symbolOwnerWrapperWithOptions_pid_checkExclave_additionalCSSymbolicatorFlags___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[SABinary binaryWithSymbolOwner:fromDisk:]((uint64_t)SABinary, a2, a3, 0);
}

- (void)gatherInfoWithDataGatheringOptions:(unint64_t)a3 pid:(int)a4
{
  char v4;
  char v5;
  char v6;
  int v7;
  unint64_t alreadyAttempted;
  SABinary *obj;

  v4 = a3;
  obj = self;
  objc_sync_enter(obj);
  v5 = -[NSString isAbsolutePath](obj->_path, "isAbsolutePath");
  if ((v4 & 4) != 0)
    v6 = v5;
  else
    v6 = 1;
  if ((v6 & 1) == 0 && (obj->_alreadyAttempted & 4) == 0)
    -[SABinary findPathViaBinaryLocator](obj);
  v7 = !-[NSString isAbsolutePath](obj->_path, "isAbsolutePath");
  if ((v4 & 1) == 0)
    LOBYTE(v7) = 1;
  if ((v7 & 1) == 0)
  {
    alreadyAttempted = obj->_alreadyAttempted;
    if ((alreadyAttempted & 1) == 0)
    {
      obj->_alreadyAttempted = alreadyAttempted | 1;
      -[SABinary gatherBundleInfo](obj);
    }
  }
  objc_sync_exit(obj);

}

- (id)addSymbolWithOffsetIntoBinary:(unint64_t)a3 length:(void *)a4 name:
{
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;

  v7 = a4;
  if (a1)
  {
    v8 = a1;
    objc_sync_enter(v8);
    -[SABinary segmentAtOffsetIntoBinary:createFakeSegmentIfNeeded:](v8, a2, 1);
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v10 = a2 - objc_msgSend(v9, "offsetIntoBinary");
    -[SASegment nonInlineSymbolAtOffsetIntoSegment:](v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if (objc_msgSend(v11, "offsetIntoSegment") == v10)
      {
        if (v7)
        {
          objc_msgSend(v12, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
            objc_setProperty_atomic_copy(v12, v14, v7, 24);
        }
      }
      else
      {
        -[SASegment addNonInlineSymbolWithOffsetIntoSegment:length:name:](v9, v10, a3, v7);
        v15 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v15;
      }
    }
    else
    {
      -[SASegment addNonInlineSymbolWithOffsetIntoSegment:length:name:](v9, v10, a3, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_sync_exit(v8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)symbolicateAllInstructionsWithOptions:(unint64_t)a3 pid:(int)a4
{
  -[SABinary symbolicateAllInstructionsWithOptions:pid:checkExclave:onlyDsym:additionalCSSymbolicatorFlags:](self, a3, a4, 1, 0, 0);
}

- (void)symbolicateAllInstructionsWithOptions:(int)a3 pid:(int)a4 checkExclave:(int)a5 onlyDsym:(int)a6 additionalCSSymbolicatorFlags:
{
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _QWORD *v12;
  const char *v13;
  id Property;
  id v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  char v44;
  void *Version;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  int v52;
  NSObject *v53;
  id v54;
  uint64_t v55;
  id v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  int v65;
  unint64_t v66;
  int v67;
  unint64_t v68;
  void **v72;
  void **obj;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[2];
  uint64_t (*v79)(uint64_t, uint64_t, char *);
  void *v80;
  uint64_t *v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  char v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  char v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  char v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  int dest;
  uint64_t dest_4;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v8 = a1;
    objc_sync_enter(v8);
    if ((a2 & 0x48) == 0 && (a5 & 1) != 0)
      goto LABEL_72;
    v68 = a2 & 0x66F;
    v9 = (unsigned __int16)v68 & ~*((_QWORD *)v8 + 4);
    if (*((_BYTE *)v8 + 65))
      goto LABEL_5;
    if ((*((_BYTE *)v8 + 64) & 8) != 0 || !v9)
      goto LABEL_72;
    if ((*((_BYTE *)v8 + 64) & 4) == 0)
    {
LABEL_5:
      v64 = a2 & 0x66F & ~*((_QWORD *)v8 + 4);
      v66 = a2;
      v65 = a5;
      v67 = 0;
    }
    else
    {
      if ((v9 & 0x48) == 0)
      {
LABEL_72:
        objc_sync_exit(v8);

        return;
      }
      v64 = a2 & 0x66F & ~*((_QWORD *)v8 + 4);
      v66 = a2;
      v65 = a5;
      v67 = 1;
    }
    v87 = 0;
    v88 = &v87;
    v89 = 0x2020000000;
    v90 = 1;
    v83 = 0;
    v84 = &v83;
    v85 = 0x2020000000;
    v86 = 1;
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v79 = __106__SABinary_symbolicateAllInstructionsWithOptions_pid_checkExclave_onlyDsym_additionalCSSymbolicatorFlags___block_invoke;
    v80 = &unk_1E7148338;
    v81 = &v87;
    v82 = &v83;
    v10 = v78;
    v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v12 = v8;
    objc_sync_enter(v12);
    obj = (void **)v12;
    Property = (id)v12[6];
    if (Property)
      Property = objc_getProperty(Property, v13, 56, 1);
    v15 = Property;
    v16 = objc_msgSend(v15, "count");

    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v17 = obj[7];
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v101, &dest, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v102;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v102 != v20)
            objc_enumerationMutation(v17);
          v22 = *(id *)(*((_QWORD *)&v101 + 1) + 8 * i);
          if (v22)
            v22 = objc_getProperty(v22, v18, 56, 1);
          v23 = v22;
          v24 = objc_msgSend(v23, "count");

          v16 += v24;
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v101, &dest, 16);
      }
      while (v19);
    }

    objc_sync_exit(obj);
    v25 = (void *)objc_msgSend(v11, "initWithCapacity:", v16);
    v72 = obj;
    objc_sync_enter(v72);
    v27 = obj[6];
    if (v27)
      v27 = objc_getProperty(v27, v26, 56, 1);
    v28 = v27;
    objc_msgSend(v28, "allValues");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
      objc_msgSend(v25, "addObjectsFromArray:", v29);
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v30 = obj[7];
    v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v96, &dest, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v97;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v97 != v33)
            objc_enumerationMutation(v30);
          v35 = *(id *)(*((_QWORD *)&v96 + 1) + 8 * j);
          if (v35)
            v35 = objc_getProperty(v35, v31, 56, 1);
          v36 = v35;
          objc_msgSend(v36, "allValues");
          v37 = objc_claimAutoreleasedReturnValue();

          v29 = (void *)v37;
          if (v37)
            objc_msgSend(v25, "addObjectsFromArray:", v37);
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v96, &dest, 16);
      }
      while (v32);
    }

    objc_sync_exit(v72);
    v95 = 0;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v38 = v25;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v91, &v101, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v92;
LABEL_34:
      v41 = 0;
      while (1)
      {
        if (*(_QWORD *)v92 != v40)
          objc_enumerationMutation(v38);
        v79((uint64_t)v10, *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * v41), &v95);
        if (v95)
          break;
        if (v39 == ++v41)
        {
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v91, &v101, 16);
          if (v39)
            goto LABEL_34;
          break;
        }
      }
    }

    if (*((_BYTE *)v84 + 24))
    {
      if (*((_BYTE *)v88 + 24) || (v67 = 1, ((_BYTE)v72[8] & 8) == 0) && (v64 & 0x48) == 0)
      {
        *((_BYTE *)v8 + 65) = 0;
LABEL_71:
        _Block_object_dispose(&v83, 8);
        _Block_object_dispose(&v87, 8);
        goto LABEL_72;
      }
    }
    *((_QWORD *)v8 + 4) = v68;
    -[SABinary symbolOwnerWrapperWithOptions:pid:checkExclave:additionalCSSymbolicatorFlags:](v72, v66, a3, a4, a6);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)v42;
    if (v42)
    {
      objc_copyStruct(&dest, (const void *)(v42 + 16), 16, 1, 0);
      if (CSIsNull())
      {
        v52 = *__error();
        _sa_logt();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v72, "debugDescription");
          v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v55 = objc_msgSend(v54, "UTF8String");
          dest = 136315138;
          dest_4 = v55;
          _os_log_error_impl(&dword_1B9BE0000, v53, OS_LOG_TYPE_ERROR, "%s: null symbol owner in symbol owner wrapper", (uint8_t *)&dest, 0xCu);

        }
        *__error() = v52;
        objc_msgSend(v72, "debugDescription");
        v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v57 = objc_msgSend(v56, "UTF8String");
        _SASetCrashLogMessage(2550, "%s: null symbol owner in symbol owner wrapper", v58, v59, v60, v61, v62, v63, v57);

        _os_crash();
        __break(1u);
      }
      *((_BYTE *)v72 + 64) |= 4u;
      if (CSSymbolOwnerIsDsym())
        v44 = 8;
      else
        v44 = 0;
      *((_BYTE *)v72 + 64) = (_BYTE)v72[8] & 0xF7 | v44;
      if ((v67 | v65) != 1 || (CSSymbolOwnerIsDsym() & 1) != 0)
      {
        *((_BYTE *)v8 + 65) = 0;
        if (!v72[14])
        {
          Version = (void *)CSSymbolOwnerGetVersion();
          if (Version)
          {
            SANSStringForCString(Version);
            v46 = objc_claimAutoreleasedReturnValue();
            v47 = v72[14];
            v72[14] = (void *)v46;

          }
        }
        -[SASegment symbolicateWithSymbolOwnerWrapper:](obj[6], v43);
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v48 = obj[7];
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v74, v100, 16);
        if (v49)
        {
          v50 = *(_QWORD *)v75;
          do
          {
            for (k = 0; k != v49; ++k)
            {
              if (*(_QWORD *)v75 != v50)
                objc_enumerationMutation(v48);
              -[SASegment symbolicateWithSymbolOwnerWrapper:](*(void **)(*((_QWORD *)&v74 + 1) + 8 * k), v43);
            }
            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v74, v100, 16);
          }
          while (v49);
        }

        goto LABEL_70;
      }
      if ((v67 | v65 ^ 1) != 1)
      {
LABEL_70:

        goto LABEL_71;
      }
    }
    else
    {
      *((_BYTE *)v72 + 64) &= 0xF3u;
    }
    *((_BYTE *)v8 + 65) = 0;
    goto LABEL_70;
  }
}

uint64_t __106__SABinary_symbolicateAllInstructionsWithOptions_pid_checkExclave_onlyDsym_additionalCSSymbolicatorFlags___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if (!a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
LABEL_7:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 0;
    *a3 = 1;
    return result;
  }
  if (!*(_QWORD *)(a2 + 16))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  if (!*(_QWORD *)(a2 + 8))
    goto LABEL_7;
  return result;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)clearCoreSymbolicationCache
{
  SACSSymbolOwnerWrapper *symbolOwnerWrapper;
  unint64_t v3;
  SABinary *obj;

  obj = self;
  objc_sync_enter(obj);
  symbolOwnerWrapper = obj->_symbolOwnerWrapper;
  v3 = obj->_alreadyAttempted & 0xFFFFFFFFFFFFFF9FLL;
  obj->_symbolOwnerWrapper = 0;
  obj->_alreadyAttempted = v3;

  objc_sync_exit(obj);
}

- (void)clearSymbolCache
{
  SABinary *v2;
  SASegment *fakeEntireBinarySegment;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  fakeEntireBinarySegment = v2->_fakeEntireBinarySegment;
  v2->_fakeEntireBinarySegment = 0;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2->_segments;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        if (v8)
        {
          v9 = v8;
          objc_sync_enter(v9);
          v10 = (void *)v9[1];
          v9[1] = 0;

          v11 = (void *)v9[2];
          v9[2] = 0;

          v12 = (void *)v9[7];
          v9[7] = 0;

          objc_sync_exit(v9);
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  v2->_haveMoreInstructionsToSymbolicate = 0;
  v2->_optionsWhenLastSymbolicated = 0;
  *((_BYTE *)v2 + 64) &= 0xF3u;
  -[SABinary clearCoreSymbolicationCache](v2, "clearCoreSymbolicationCache", (_QWORD)v13);
  objc_sync_exit(v2);

}

void __28__SABinary_dataFillingQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.SampleAnalysis.binaryDataFilling", v0);
  v2 = (void *)qword_1ED1DD858;
  qword_1ED1DD858 = (uint64_t)v1;

}

- (NSString)debugDescription
{
  NSString *path;
  NSUUID *uuid;
  unint64_t length;
  NSString *bundleIdentifier;
  NSString *bundleVersion;
  NSString *bundleShortVersion;
  NSString *binaryVersion;
  NSString *teamID;
  NSString *codesigningID;
  uint64_t v12;
  const char *v13;
  const __CFString *v14;
  id v16;

  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  path = self->_path;
  if (!path)
    path = self->_name;
  uuid = self->_uuid;
  length = self->_length;
  bundleIdentifier = self->_bundleIdentifier;
  bundleVersion = self->_bundleVersion;
  bundleShortVersion = self->_bundleShortVersion;
  binaryVersion = self->_binaryVersion;
  codesigningID = self->_codesigningID;
  teamID = self->_teamID;
  v12 = -[NSMutableArray count](self->_segments, "count");
  v13 = "has";
  if (!self->_fakeEntireBinarySegment)
    v13 = "no";
  if (self->_symbolOwnerWrapper)
    v14 = CFSTR("has");
  else
    v14 = CFSTR("no");
  return (NSString *)(id)objc_msgSend(v16, "initWithFormat:", CFSTR("%@ <%@> length 0x%llx %@ %@ %@ %@ %@ %@: %lu segments (%s fake segment), (%@ symbol owner)"), path, uuid, length, bundleIdentifier, bundleVersion, bundleShortVersion, binaryVersion, codesigningID, teamID, v12, v13, v14);
}

- (unint64_t)textSegmentLength
{
  void *v3;
  unint64_t v4;

  -[SABinary segmentWithCleanName:](self, CFSTR("__TEXT_EXEC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SABinary segmentWithCleanName:](self, CFSTR("__TEXT"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      return -[SABinary length](self, "length");
  }
  v4 = objc_msgSend(v3, "length");

  return v4;
}

- (BOOL)hasTextExecSegment
{
  void *v2;
  BOOL v3;

  -[SABinary segmentWithCleanName:](self, CFSTR("__TEXT_EXEC"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)instructionAtOffsetIntoTextSegment:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[SABinary segmentWithCleanName:](self, CFSTR("__TEXT_EXEC"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (-[SABinary segmentWithCleanName:](self, CFSTR("__TEXT")),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v5, "instructionAtOffsetIntoSegment:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SABinary instructionAtOffsetIntoBinary:](self, "instructionAtOffsetIntoBinary:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (NSString)bundleShortVersion
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)binaryVersion
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)codesigningID
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)teamID
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_codesigningID, 0);
  objc_storeStrong((id *)&self->_binaryVersion, 0);
  objc_storeStrong((id *)&self->_bundleShortVersion, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_fakeEntireBinarySegment, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_symbolOwnerWrapper, 0);
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v4;
  NSString *name;
  void *v6;
  NSString *path;
  NSString *bundleIdentifier;
  NSString *bundleVersion;
  NSString *bundleShortVersion;
  NSString *binaryVersion;
  NSString *codesigningID;
  NSString *teamID;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = a3;
  name = self->_name;
  v16 = v4;
  if (name)
    SAJSONWriteDictionaryFirstEntry(v4, (uint64_t)CFSTR("name"), name);
  if (-[SABinary length](self, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SABinary length](self, "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v16, CFSTR("length"), v6);

  }
  path = self->_path;
  if (path)
    SAJSONWriteDictionaryEntry(v16, CFSTR("path"), path);
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    SAJSONWriteDictionaryEntry(v16, CFSTR("bundleID"), bundleIdentifier);
  bundleVersion = self->_bundleVersion;
  if (bundleVersion)
    SAJSONWriteDictionaryEntry(v16, CFSTR("bundleVersion"), bundleVersion);
  bundleShortVersion = self->_bundleShortVersion;
  if (bundleShortVersion)
    SAJSONWriteDictionaryEntry(v16, CFSTR("bundleShortVersion"), bundleShortVersion);
  binaryVersion = self->_binaryVersion;
  if (binaryVersion)
    SAJSONWriteDictionaryEntry(v16, CFSTR("binaryVersion"), binaryVersion);
  codesigningID = self->_codesigningID;
  if (codesigningID)
    SAJSONWriteDictionaryEntry(v16, CFSTR("codesigningID"), codesigningID);
  teamID = self->_teamID;
  if (teamID)
    SAJSONWriteDictionaryEntry(v16, CFSTR("teamID"), teamID);
  v14 = -[NSMutableArray count](self->_segments, "count");
  v15 = v16;
  if (v14)
  {
    objc_msgSend(v16, "appendString:", CFSTR(",\"segments\":"));
    SAJSONWriteArray(v16, self->_segments);
    v15 = v16;
  }

}

+ (id)classDictionaryKey
{
  return CFSTR("SABinary");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 8 * -[NSMutableArray count](self->_segments, "count") + 93;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v5;
  id v9;
  void *v10;
  unsigned __int16 v11;
  uint64_t *v12;
  int v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  id v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  NSObject *v38;
  id v39;
  uint64_t v40;
  int v41;
  unint64_t v42;
  id v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  _BYTE v54[28];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (-[SABinary sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") > a4)
  {
    v14 = *__error();
    _sa_logt();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[SABinary debugDescription](self, "debugDescription");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = objc_msgSend(v16, "UTF8String");
      v5 = -[SABinary sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v18 = -[NSMutableArray count](self->_segments, "count");
      *(_DWORD *)buf = 136315906;
      v52 = v17;
      v53 = 2048;
      *(_QWORD *)v54 = v5;
      *(_WORD *)&v54[8] = 2048;
      *(_QWORD *)&v54[10] = v18;
      *(_WORD *)&v54[18] = 2048;
      *(_QWORD *)&v54[20] = a4;
      _os_log_error_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_ERROR, "%s: size %lu (%lu segments) > buffer length %lu", buf, 0x2Au);

    }
    *__error() = v14;
    -[SABinary debugDescription](self, "debugDescription");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = objc_msgSend(v19, "UTF8String");
    -[SABinary sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    -[NSMutableArray count](self->_segments, "count");
    _SASetCrashLogMessage(4700, "%s: size %lu (%lu segments) > buffer length %lu", v21, v22, v23, v24, v25, v26, v20);

    _os_crash();
    __break(1u);
    goto LABEL_11;
  }
  *(_WORD *)&a3->var0 = 769;
  *(_QWORD *)&a3->var2[16] = -[SABinary length](self, "length");
  if (-[NSMutableArray count](self->_segments, "count") == 1)
  {
    -[SABinary segmentWithCleanName:](self, CFSTR("__TEXT_EXEC"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      BYTE2(a3->var9) |= 1u;
  }
  -[NSUUID getUUIDBytes:](self->_uuid, "getUUIDBytes:", a3->var2);
  *(unint64_t *)((char *)&a3->var3 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_name, v9);
  *(unint64_t *)((char *)&a3->var4 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_path, v9);
  *(unint64_t *)((char *)&a3->var5 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_bundleIdentifier, v9);
  *(unint64_t *)((char *)&a3->var6 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_bundleVersion, v9);
  *(unint64_t *)((char *)&a3->var7 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_bundleShortVersion, v9);
  *(unint64_t *)((char *)&a3->var8 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_binaryVersion, v9);
  if ((unint64_t)-[NSMutableArray count](self->_segments, "count") >= 0xFFFF)
  {
LABEL_11:
    v27 = *__error();
    _sa_logt();
    a3 = ($AA4C3D0BC6B134C2DB58CAEA44E8AB07 *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      -[SABinary debugDescription](self, "debugDescription");
      v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v29 = objc_msgSend(v28, "UTF8String");
      *(_DWORD *)buf = 136315394;
      v52 = v29;
      v53 = 1024;
      *(_DWORD *)v54 = 0xFFFF;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "%s: more than %d segments", buf, 0x12u);

    }
    *__error() = v27;
    -[SABinary debugDescription](self, "debugDescription");
    self = (SABinary *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = -[SABinary UTF8String](self, "UTF8String");
    _SASetCrashLogMessage(4720, "%s: more than %d segments", v31, v32, v33, v34, v35, v36, v30);

    _os_crash();
    __break(1u);
LABEL_14:
    v37 = *__error();
    _sa_logt();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      -[SABinary debugDescription](self, "debugDescription");
      v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v40 = objc_msgSend(v39, "UTF8String");
      v41 = *(unsigned __int16 *)((char *)&a3->var9 + 3);
      v42 = -[SABinary sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_DWORD *)buf = 136315906;
      v52 = v40;
      v53 = 1024;
      *(_DWORD *)v54 = v41;
      *(_WORD *)&v54[4] = 2048;
      *(_QWORD *)&v54[6] = v5;
      *(_WORD *)&v54[14] = 2048;
      *(_QWORD *)&v54[16] = v42;
      _os_log_error_impl(&dword_1B9BE0000, v38, OS_LOG_TYPE_ERROR, "%s: after serializing with %u segments, ended with length %ld, should be %lu", buf, 0x26u);

    }
    *__error() = v37;
    -[SABinary debugDescription](self, "debugDescription");
    v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v44 = objc_msgSend(v43, "UTF8String");
    -[SABinary sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(4727, "%s: after serializing with %u segments, ended with length %ld, should be %lu", v45, v46, v47, v48, v49, v50, v44);

    _os_crash();
    __break(1u);
  }
  v11 = -[NSMutableArray count](self->_segments, "count");
  *(_WORD *)((char *)&a3->var9 + 3) = v11;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)&a3->var9 + 5, v11, self->_segments, v9);
  v12 = (uint64_t *)((char *)&a3->var9 + 8 * *(unsigned __int16 *)((char *)&a3->var9 + 3) + 5);
  v5 = 8 * *(unsigned __int16 *)((char *)&a3->var9 + 3) + 93;
  if (v5 != -[SABinary sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion"))
    goto LABEL_14;
  *v12 = SASerializableIndexForPointerFromSerializationDictionary(self->_codesigningID, v9);
  v12[1] = SASerializableIndexForPointerFromSerializationDictionary(self->_teamID, v9);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  NSMutableArray *v7;
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
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "classDictionaryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    -[NSString addSelfToSerializationDictionary:](self->_name, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_path, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_bundleIdentifier, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_bundleVersion, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_bundleShortVersion, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_binaryVersion, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_codesigningID, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_teamID, "addSelfToSerializationDictionary:", v4);
    -[SASegment addSelfToSerializationDictionary:](self->_fakeEntireBinarySegment, "addSelfToSerializationDictionary:", v4);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_segments;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "addSelfToSerializationDictionary:", v4, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id result;
  uint8_t v13[16];

  v4 = *__error();
  _sa_logt();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v13 = 0;
    _os_log_error_impl(&dword_1B9BE0000, v5, OS_LOG_TYPE_ERROR, "Called without dict/buff though it's defined", v13, 2u);
  }

  *__error() = v4;
  _SASetCrashLogMessage(4755, "Called without dict/buff though it's defined", v6, v7, v8, v9, v10, v11, v13[0]);
  result = (id)_os_crash();
  __break(1u);
  return result;
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  int v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint8_t buf[4];
  unint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 4u)
    goto LABEL_28;
  if (a4 <= 0x4A)
  {
    v27 = *__error();
    _sa_logt();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v37 = a4;
      v38 = 2048;
      v39 = 75;
      _os_log_error_impl(&dword_1B9BE0000, v28, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SABinary struct %lu", buf, 0x16u);
    }

    *__error() = v27;
    _SASetCrashLogMessage(4763, "bufferLength %lu < serialized SABinary struct %lu", v29, v30, v31, v32, v33, v34, a4);
    _os_crash();
    __break(1u);
LABEL_28:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SABinary version"), 0);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v35);
  }
  v11 = v10;
  uuidForBytes((uint64_t)a3 + 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)((char *)a3 + 34);
  v14 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v13, v9, v11, v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(uint64_t *)gSASerializationEncodedVersionBeingDecoded() < 31)
  {
    +[SABinary binaryWithUUID:absolutePath:](SABinary, "binaryWithUUID:absolutePath:", v12, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v18;
    if (v15)
    {
      objc_msgSend(v18, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
        objc_msgSend(v17, "addPath:", v15);
    }
  }
  else
  {
    if (objc_msgSend(v15, "isAbsolutePath"))
      v16 = v15;
    else
      v16 = 0;
    +[SABinary binaryWithUUID:absolutePath:](SABinary, "binaryWithUUID:absolutePath:", v12, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (*((unsigned __int8 *)a3 + 1) < 2u)
  {
    if ((*((_BYTE *)a3 + 74) & 1) != 0)
      v21 = CFSTR("__TEXT_EXEC");
    else
      v21 = CFSTR("__TEXT");
    v22 = v21;
    -[SABinary segmentWithCleanName:](v17, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = v23;
      if (!objc_msgSend(v23, "length"))
      {
        v25 = *(_QWORD *)((char *)a3 + 18);
        if (v25)
          -[SASegment setLength:](v24, v25);
      }
    }
    else
    {
      +[SASegment segmentWithBinary:name:length:]((uint64_t)SASegment, v17, v22, *(_QWORD *)((char *)a3 + 18));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SABinary addSegment:](v17, v24);
    }

  }
  else if (!objc_msgSend(v17, "length"))
  {
    v20 = *(_QWORD *)((char *)a3 + 18);
    if (v20)
      -[SABinary setLength:](v17, v20);
  }

  return v17;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  unint64_t p_path;
  unint64_t v7;
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  NSString *path;
  uint64_t v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  NSString *v27;
  NSString *name;
  void *v29;
  NSString *v30;
  NSString *bundleIdentifier;
  void *v32;
  NSString *v33;
  NSString *bundleVersion;
  void *v35;
  NSString *v36;
  NSString *bundleShortVersion;
  void *v38;
  NSString *v39;
  NSString *binaryVersion;
  uint64_t v41;
  uint64_t *v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t *v46;
  unint64_t v47;
  void *v48;
  NSString *v49;
  NSString *codesigningID;
  unint64_t v51;
  void *v52;
  NSString *v53;
  NSString *teamID;
  int v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  id v80;
  uint64_t v81;
  id v82;
  id v83;
  uint64_t v84;
  id v85;
  char v86;
  id v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  NSObject *v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  unint64_t v105;
  uint8_t buf[4];
  unint64_t v107;
  __int16 v108;
  _BYTE v109[18];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  if (*(unsigned __int8 *)a3 >= 4u)
    goto LABEL_58;
  if (a4 <= 0x4A)
  {
    v55 = *__error();
    _sa_logt();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v107 = a4;
      v108 = 2048;
      *(_QWORD *)v109 = 75;
      _os_log_error_impl(&dword_1B9BE0000, v56, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SABinary struct %lu", buf, 0x16u);
    }

    *__error() = v55;
    _SASetCrashLogMessage(4809, "bufferLength %lu < serialized SABinary struct %lu", v57, v58, v59, v60, v61, v62, a4);
    _os_crash();
    __break(1u);
    goto LABEL_46;
  }
  v14 = v13;
  v15 = *(_QWORD *)((char *)a3 + 34);
  v16 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v15, v12, v14, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  p_path = (unint64_t)&self->_path;
  path = self->_path;
  if (path)
  {
    if (v17 && !-[NSString isEqualToString:](path, "isEqualToString:", v17))
    {
      v19 = *(_QWORD *)gSASerializationEncodedVersionBeingDecoded();
      v20 = *__error();
      _sa_logt();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v19 < 31)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          -[SABinary debugDescription](self, "debugDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v107 = (unint64_t)v17;
          v108 = 2112;
          *(_QWORD *)v109 = v23;
          _os_log_error_impl(&dword_1B9BE0000, v22, OS_LOG_TYPE_ERROR, "Decoded SABinary path %@ doesn't match %@, not filling in bundle/codesign info", buf, 0x16u);
          goto LABEL_42;
        }
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        -[SABinary debugDescription](self, "debugDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v107 = (unint64_t)v17;
        v108 = 2112;
        *(_QWORD *)v109 = v23;
        _os_log_fault_impl(&dword_1B9BE0000, v22, OS_LOG_TYPE_FAULT, "Decoded SABinary path %@ doesn't match %@", buf, 0x16u);
LABEL_42:

      }
      *__error() = v20;
      goto LABEL_40;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_path, v17);
  }
  if (!self->_name && !*(_QWORD *)p_path)
  {
    v24 = *(_QWORD *)((char *)a3 + 26);
    v25 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v24, v12, v14, v25, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    p_path = (unint64_t)v26;
    if (v26)
    {
      v27 = (NSString *)objc_msgSend(v26, "copy");
      name = self->_name;
      self->_name = v27;

    }
  }
  if (!self->_bundleIdentifier)
  {
    p_path = *(_QWORD *)((char *)a3 + 42);
    v29 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(p_path, v12, v14, v29, 0);
    v30 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v30;

  }
  if (!self->_bundleVersion)
  {
    p_path = *(_QWORD *)((char *)a3 + 50);
    v32 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(p_path, v12, v14, v32, 0);
    v33 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleVersion = self->_bundleVersion;
    self->_bundleVersion = v33;

  }
  if (!self->_bundleShortVersion)
  {
    p_path = *(_QWORD *)((char *)a3 + 58);
    v35 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(p_path, v12, v14, v35, 0);
    v36 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleShortVersion = self->_bundleShortVersion;
    self->_bundleShortVersion = v36;

  }
  if (!self->_binaryVersion)
  {
    p_path = *(_QWORD *)((char *)a3 + 66);
    v38 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(p_path, v12, v14, v38, 0);
    v39 = (NSString *)objc_claimAutoreleasedReturnValue();
    binaryVersion = self->_binaryVersion;
    self->_binaryVersion = v39;

  }
  if (*((unsigned __int8 *)a3 + 1) >= 2u)
  {
    if (a4 > 0x4C)
    {
      p_path = *(unsigned __int16 *)((char *)a3 + 75);
      v41 = 8 * p_path;
      v7 = 8 * p_path + 77;
      if (v7 <= a4)
      {
        v105 = a4;
        v42 = (uint64_t *)gSASerializationEncodedVersionBeingDecoded();
        if (*v42 <= 30)
          *(_QWORD *)gBinaryBeingDecoded(&gBinaryBeingDecoded) = self;
        v43 = (void *)objc_opt_class();
        SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 77, p_path, v12, v14, v43);
        p_path = objc_claimAutoreleasedReturnValue();
        if (*v42 <= 30)
          *(_QWORD *)gBinaryBeingDecoded(&gBinaryBeingDecoded) = 0;
        v44 = -[NSMutableArray count](self->_segments, "count");
        if (v44 >= objc_msgSend((id)p_path, "count"))
        {
          if (*((unsigned __int8 *)a3 + 1) < 3u)
          {
LABEL_37:

            goto LABEL_40;
          }
          v45 = v105;
          if (v41 + 93 <= v105)
          {
            v46 = (unint64_t *)((char *)a3 + 8 * *(unsigned __int16 *)((char *)a3 + 75) + 77);
            if (!self->_codesigningID)
            {
              v47 = *v46;
              v48 = (void *)objc_opt_class();
              _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v47, v12, v14, v48, 0);
              v49 = (NSString *)objc_claimAutoreleasedReturnValue();
              codesigningID = self->_codesigningID;
              self->_codesigningID = v49;

            }
            if (!self->_teamID)
            {
              v51 = v46[1];
              v52 = (void *)objc_opt_class();
              _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v51, v12, v14, v52, 0);
              v53 = (NSString *)objc_claimAutoreleasedReturnValue();
              teamID = self->_teamID;
              self->_teamID = v53;

            }
            goto LABEL_37;
          }
          goto LABEL_55;
        }
LABEL_52:
        v45 = *__error();
        _sa_logt();
        v79 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          -[SABinary debugDescription](self, "debugDescription");
          v80 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v81 = objc_msgSend(v80, "UTF8String");
          -[NSMutableArray debugDescription](self->_segments, "debugDescription");
          v82 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          a3 = (const void *)objc_msgSend(v82, "UTF8String");
          objc_msgSend((id)p_path, "debugDescription");
          v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v84 = objc_msgSend(v83, "UTF8String");
          *(_DWORD *)buf = 136315650;
          v107 = v81;
          v108 = 2080;
          *(_QWORD *)v109 = a3;
          *(_WORD *)&v109[8] = 2080;
          *(_QWORD *)&v109[10] = v84;
          _os_log_error_impl(&dword_1B9BE0000, v79, OS_LOG_TYPE_ERROR, "Binary %s segments not added after deserializing segments: %s vs\n%s", buf, 0x20u);

        }
        *__error() = v45;
        -[SABinary debugDescription](self, "debugDescription");
        v85 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v86 = objc_msgSend(v85, "UTF8String");
        -[NSMutableArray debugDescription](self->_segments, "debugDescription");
        v87 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v87, "UTF8String");
        objc_msgSend((id)p_path, "debugDescription");
        v88 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v88, "UTF8String");
        _SASetCrashLogMessage(4861, "Binary %s segments not added after deserializing segments: %s vs\n%s", v89, v90, v91, v92, v93, v94, v86);

        _os_crash();
        __break(1u);
LABEL_55:
        v95 = *__error();
        _sa_logt();
        v96 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
        {
          v97 = *(unsigned __int16 *)((char *)a3 + 75);
          *(_DWORD *)buf = 134218240;
          v107 = v45;
          v108 = 1024;
          *(_DWORD *)v109 = v97;
          _os_log_error_impl(&dword_1B9BE0000, v96, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SABinary struct v3 with %u segments", buf, 0x12u);
        }

        *__error() = v95;
        _SASetCrashLogMessage(4866, "bufferLength %lu < serialized SABinary struct v3 with %u segments", v98, v99, v100, v101, v102, v103, v45);
        _os_crash();
        __break(1u);
LABEL_58:
        +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SABinary version"), 0);
        v104 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v104);
      }
LABEL_49:
      v71 = *__error();
      _sa_logt();
      self = (SABinary *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&self->super, OS_LOG_TYPE_ERROR))
      {
        v72 = *(unsigned __int16 *)((char *)a3 + 75);
        *(_DWORD *)buf = 134218496;
        v107 = a4;
        v108 = 1024;
        *(_DWORD *)v109 = v72;
        *(_WORD *)&v109[4] = 2048;
        *(_QWORD *)&v109[6] = v7;
        _os_log_error_impl(&dword_1B9BE0000, &self->super, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SABinary struct plus %u segments %llu", buf, 0x1Cu);
      }

      *__error() = v71;
      _SASetCrashLogMessage(4851, "bufferLength %lu < serialized SABinary struct plus %u segments %llu", v73, v74, v75, v76, v77, v78, a4);
      _os_crash();
      __break(1u);
      goto LABEL_52;
    }
LABEL_46:
    v63 = *__error();
    _sa_logt();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v107 = a4;
      v108 = 2048;
      *(_QWORD *)v109 = 77;
      _os_log_error_impl(&dword_1B9BE0000, v64, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SABinary struct %lu", buf, 0x16u);
    }

    *__error() = v63;
    _SASetCrashLogMessage(4848, "bufferLength %lu < serialized SABinary struct %lu", v65, v66, v67, v68, v69, v70, a4);
    _os_crash();
    __break(1u);
    goto LABEL_49;
  }
LABEL_40:

}

@end
