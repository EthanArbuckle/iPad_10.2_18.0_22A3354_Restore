@implementation SASharedCache

uint64_t __47__SASharedCache__findLoadInfosForSharedCaches___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3, void *a4, uint64_t a5, uint64_t a6)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v12 = (void *)MEMORY[0x1BCCCC288]();
  if (!SAShouldIgnoreSegmentWithCName((char *)a4))
  {
    uuidForBytes(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SAFilepathForCString(a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isAbsolutePath"))
      v15 = v14;
    else
      v15 = 0;
    +[SABinary binaryWithUUID:absolutePath:](SABinary, "binaryWithUUID:absolutePath:", v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    SANSStringForCString(a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v22 = *__error();
      _sa_logt();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v31 = a4;
        _os_log_error_impl(&dword_1B9BE0000, v23, OS_LOG_TYPE_ERROR, "No nsstring for %s", buf, 0xCu);
      }

      *__error() = v22;
      _SASetCrashLogMessage(3899, "No nsstring for %s", v24, v25, v26, v27, v28, v29, (char)a4);
      _os_crash();
      __break(1u);
    }
    v18 = v17;
    -[SABinary segmentWithCleanName:](v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      +[SASegment segmentWithBinary:name:length:]((uint64_t)SASegment, v16, v18, a6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SABinary addSegment:](v16, v19);
    }
    +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:](SABinaryLoadInfo, v19, *(_QWORD *)(a1 + 40) + a5, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v20);

  }
  objc_autoreleasePoolPop(v12);
  return 0;
}

- (unint64_t)startAddress
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSArray firstObject](self->_binaryLoadInfos, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "loadAddress");
  else
    v4 = -1;

  return v4;
}

- (NSArray)binaryLoadInfos
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

+ (id)sharedCacheWithUUID:(uint64_t)a3 slide:(uint64_t)a4 slidBaseAddress:(char)a5 findMappingsIfUnknown:
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id result;
  int v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a2;
  v9 = objc_opt_self();
  if ((a4 & a3) == 0xFFFFFFFFFFFFFFFFLL)
  {
    v14 = *__error();
    _sa_logt();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_ERROR, "Trying to find shared cache with unknown slide and unknown slidBaseAddress", buf, 2u);
    }

    *__error() = v14;
    _SASetCrashLogMessage(3633, "Trying to find shared cache with unknown slide and unknown slidBaseAddress", v16, v17, v18, v19, v20, v21, v22[0]);
    result = (id)_os_crash();
    __break(1u);
  }
  else
  {
    v10 = v9;
    *(_QWORD *)buf = 0;
    v30 = buf;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__2;
    v33 = __Block_byref_object_dispose__2;
    v34 = 0;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __81__SASharedCache_sharedCacheWithUUID_slide_slidBaseAddress_findMappingsIfUnknown___block_invoke;
    v22[3] = &unk_1E71485F0;
    v11 = v8;
    v25 = a3;
    v26 = a4;
    v23 = v11;
    v24 = buf;
    v27 = v10;
    v28 = a5;
    +[SASharedCache _doSharedCachesWork:](v10, v22);
    v12 = *((id *)v30 + 5);

    _Block_object_dispose(buf, 8);
    return v12;
  }
  return result;
}

- (unint64_t)endAddress
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  -[NSArray lastObject](self->_binaryLoadInfos, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "length");
    if (v4)
      v5 = v4;
    else
      v5 = 0x10000000;
    v6 = v5 + objc_msgSend(v3, "loadAddress");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)slide
{
  return self->_slide;
}

+ (void)_findLoadInfosForSharedCaches:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  int v20;
  NSObject *v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  _QWORD v33[5];
  unsigned __int8 v34[128];
  unsigned __int8 uu[8];
  uint64_t v36;
  _BYTE buf[32];
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_opt_self();
  objc_msgSend(v2, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "binaryLoadInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    *(_QWORD *)uu = 0;
    v36 = 0;
    objc_msgSend(v4, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getUUIDBytes:", uu);

    if (!uuid_is_null(uu))
    {
      v8 = objc_msgSend(v4, "slide");
      if (v8 == -1)
        v9 = 0;
      else
        v9 = v8;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2560);
      v11 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __47__SASharedCache__findLoadInfosForSharedCaches___block_invoke;
      v30[3] = &unk_1E71486F8;
      v32 = v9;
      v12 = v10;
      v31 = v12;
      v13 = (void *)MEMORY[0x1BCCCC450](v30);
      v29 = -1;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v14 = objc_opt_self();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      *(_QWORD *)&buf[24] = __Block_byref_object_copy__2;
      v38 = __Block_byref_object_dispose__2;
      v39 = 0;
      v33[0] = v11;
      v33[1] = 3221225472;
      v33[2] = __27__SASharedCache_dscSymDirs__block_invoke;
      v33[3] = &unk_1E71481D0;
      v33[4] = buf;
      +[SASharedCache _doDscSymDirsWork:](v14, v33);
      v15 = *(id *)(*(_QWORD *)&buf[8] + 40);
      _Block_object_dispose(buf, 8);

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v26;
        while (2)
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v26 != v17)
              objc_enumerationMutation(v15);
            v19 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v18));
            objc_msgSend(v19, "UTF8String", (_QWORD)v25);
            if (!dscsym_iterate())
            {

              goto LABEL_19;
            }
            objc_msgSend(v12, "removeAllObjects");
            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
          if (v16)
            continue;
          break;
        }
      }

      if (dscsym_iterate())
      {
        v20 = *__error();
        _sa_logt();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          *(_DWORD *)&buf[4] = 16;
          *(_WORD *)&buf[8] = 2096;
          *(_QWORD *)&buf[10] = uu;
          _os_log_impl(&dword_1B9BE0000, v21, OS_LOG_TYPE_DEFAULT, "WARNING: Unable to find shared cache mapping for %{uuid_t}.16P", buf, 0x12u);
        }

        *__error() = v20;
      }
      else
      {
LABEL_19:
        +[SABinaryLoadInfo sortBinaryLoadInfos:]((uint64_t)SABinaryLoadInfo, v12);
        v22 = *__error();
        _sa_logt();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v24 = objc_msgSend(v12, "count");
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = v24;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          *(_WORD *)&buf[18] = 2096;
          *(_QWORD *)&buf[20] = uu;
          _os_log_debug_impl(&dword_1B9BE0000, v23, OS_LOG_TYPE_DEBUG, "%lu binaries in shared cache %{uuid_t}.16P", buf, 0x1Cu);
        }

        *__error() = v22;
        +[SASharedCache _applyLoadInfos:withSlide:andSlidBaseAddress:toSharedCaches:](v3, v12, v9, v29 + v9, v2);
      }

    }
  }

}

void __81__SASharedCache_sharedCacheWithUUID_slide_slidBaseAddress_findMappingsIfUnknown___block_invoke(id a1, void *a2)
{
  id v3;
  void *v4;
  uint8_t *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *i;
  void *v55;
  uint64_t v56;
  int v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  id v76;
  void *v77;
  int v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t buf[4];
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  uint64_t v100;
  _BYTE v101[128];
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *((_QWORD *)a1 + 4));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *((_QWORD *)a1 + 4));
  }
  v5 = buf;
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v84;
LABEL_5:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v84 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD **)(*((_QWORD *)&v83 + 1) + 8 * v10);
      if (*((_QWORD *)a1 + 6) != -1
        && objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * v10), "slide") == *((_QWORD *)a1 + 6))
      {
        break;
      }
      v12 = *((_QWORD *)a1 + 7);
      if (v12 != -1 && v11[2] == v12)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
        if (v8)
          goto LABEL_5;
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:

    v13 = -[SASharedCache initWithUUID:slide:slidBaseAddress:]([SASharedCache alloc], *((void **)a1 + 4), *((_QWORD *)a1 + 6), *((_QWORD *)a1 + 7));
    v14 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    objc_msgSend(v6, "firstObject");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40));
    if (!v16)
    {
LABEL_32:
      if (*((_BYTE *)a1 + 72))
        +[SASharedCache _findLoadInfosForSharedCaches:](*((_QWORD *)a1 + 8), v6);
      v16 = 0;
      goto LABEL_58;
    }
    if (objc_msgSend(v16, "slide") == -1 || objc_msgSend(v16, "slidBaseAddress") == -1)
      goto LABEL_55;
    v17 = objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slide");
    v18 = objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slidBaseAddress");
    v11 = (_QWORD *)v18;
    if (v17 == -1)
      goto LABEL_52;
    if (v18 == -1)
    {
      v72 = objc_msgSend(v16, "slidBaseAddress");
      v73 = v72 - objc_msgSend(v16, "slide");
      v70 = v73 + objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slide");
      v71 = 16;
      goto LABEL_54;
    }
    v19 = objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slidBaseAddress");
    v20 = v19 - objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slide");
    v21 = objc_msgSend(v16, "slidBaseAddress");
    if (v20 == v21 - objc_msgSend(v16, "slide"))
    {
LABEL_55:
      objc_msgSend(v16, "binaryLoadInfos");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v74, "count"))
        -[SASharedCache _applyLoadInfos:withSlide:andSlidBaseAddress:](*(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), v74, objc_msgSend(v16, "slide"), objc_msgSend(v16, "slidBaseAddress"));

      goto LABEL_58;
    }
    v78 = *__error();
    _sa_logt();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "uuid");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "UUIDString");
      v76 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v75 = objc_msgSend(v76, "UTF8String");
      v23 = objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slide");
      v24 = objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slidBaseAddress");
      v25 = objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slidBaseAddress");
      v26 = v25 - objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slide");
      v27 = objc_msgSend(v16, "slide");
      v28 = objc_msgSend(v16, "slidBaseAddress");
      v29 = objc_msgSend(v16, "slidBaseAddress");
      v30 = objc_msgSend(v16, "slide");
      *(_DWORD *)buf = 136316674;
      v88 = v75;
      v89 = 2048;
      v90 = v23;
      v91 = 2048;
      v92 = v24;
      v93 = 2048;
      v94 = v26;
      v95 = 2048;
      v96 = v27;
      v97 = 2048;
      v98 = v28;
      v99 = 2048;
      v100 = v29 - v30;
      _os_log_error_impl(&dword_1B9BE0000, v22, OS_LOG_TYPE_ERROR, "Mismatch shared cache %s info: requested slide 0x%llx, slidBaseAddress 0x%llx (base address 0x%llx) vs existing shared cache with slide 0x%llx, slidBaseAddress 0x%llx (base address 0x%llx)", buf, 0x48u);

    }
    *__error() = v78;
    objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "uuid");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (_QWORD *)objc_msgSend(v6, "UTF8String");
    objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slide");
    v5 = (uint8_t *)objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slidBaseAddress");
    objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slidBaseAddress");
    objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slide");
    a1 = (id)objc_msgSend(v16, "slide");
    objc_msgSend(v16, "slidBaseAddress");
    objc_msgSend(v16, "slidBaseAddress");
    objc_msgSend(v16, "slide");
    _SASetCrashLogMessage(3684, "Mismatch shared cache %s info: requested slide 0x%llx, slidBaseAddress 0x%llx (base address 0x%llx) vs existing shared cache with slide 0x%llx, slidBaseAddress 0x%llx (base address 0x%llx)", v31, v32, v33, v34, v35, v36, (char)v11);

    _os_crash();
    __break(1u);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), v11);
  v16 = v6;
  if (*((_QWORD *)a1 + 6) == -1)
    goto LABEL_58;
  v16 = v6;
  if (*((_QWORD *)a1 + 7) == -1)
    goto LABEL_58;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slide") != -1
    && objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slidBaseAddress") != -1)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slide") == *((_QWORD *)a1 + 6))
    {
      v16 = v6;
      if (objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slidBaseAddress") == *((_QWORD *)a1 + 7))
        goto LABEL_58;
    }
    v37 = *__error();
    _sa_logt();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slide");
      v40 = objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slidBaseAddress");
      v41 = *((_QWORD *)a1 + 6);
      v42 = *((_QWORD *)a1 + 7);
      objc_msgSend(*((id *)a1 + 4), "UUIDString");
      v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v44 = objc_msgSend(v43, "UTF8String");
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)(v5 + 4) = v39;
      v89 = 2048;
      *(_QWORD *)(v5 + 14) = v40;
      v91 = 2048;
      v92 = v41;
      v93 = 2048;
      *(_QWORD *)(v5 + 34) = v42;
      v95 = 2080;
      *(_QWORD *)(v5 + 44) = v44;
      _os_log_error_impl(&dword_1B9BE0000, v38, OS_LOG_TYPE_ERROR, "Mismatch shared cache info: existing slide 0x%llx, slidBaseAddress 0x%llx vs requested slide 0x%llx, slidBaseAddress 0x%llx for %s", buf, 0x34u);

    }
    *__error() = v37;
    v3 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slide");
    v6 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slidBaseAddress");
    objc_msgSend(*((id *)a1 + 4), "UUIDString");
    a1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(a1, "UTF8String");
    _SASetCrashLogMessage(3661, "Mismatch shared cache info: existing slide 0x%llx, slidBaseAddress 0x%llx vs requested slide 0x%llx, slidBaseAddress 0x%llx for %s", v45, v46, v47, v48, v49, v50, (char)v3);

    _os_crash();
    __break(1u);
    goto LABEL_32;
  }
  +[SASharedCache _applyBaseAddress:toSharedCaches:](*((_QWORD *)a1 + 8), *((_QWORD *)a1 + 7) - *((_QWORD *)a1 + 6), v6);
  v51 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40);
  v16 = v6;
  if (v51)
  {
    v16 = v6;
    if ((*(_BYTE *)(v51 + 24) & 1) != 0)
    {
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v16 = v6;
      v52 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v79, v101, 16);
      if (v52)
      {
        v11 = (_QWORD *)v52;
        v53 = *(_QWORD *)v80;
        while (2)
        {
          for (i = 0; i != v11; i = (_QWORD *)((char *)i + 1))
          {
            if (*(_QWORD *)v80 != v53)
              objc_enumerationMutation(v16);
            v55 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v55, "slide") == *((_QWORD *)a1 + 6))
            {
              objc_storeStrong((id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), v55);
              goto LABEL_47;
            }
          }
          v11 = (_QWORD *)objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v79, v101, 16);
          if (v11)
            continue;
          break;
        }
      }
LABEL_47:

      v56 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40);
      if (v56)
      {
        if ((*(_BYTE *)(v56 + 24) & 1) != 0)
        {
          v57 = *__error();
          _sa_logt();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            v59 = objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slide");
            v60 = objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slidBaseAddress");
            objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "uuid");
            v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "UUIDString");
            v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v62 = objc_msgSend(v61, "UTF8String");
            *(_DWORD *)buf = 134218498;
            *(_QWORD *)(v5 + 4) = v59;
            v89 = 2048;
            *(_QWORD *)(v5 + 14) = v60;
            v91 = 2080;
            v92 = v62;
            _os_log_error_impl(&dword_1B9BE0000, v58, OS_LOG_TYPE_ERROR, "No matching shared cache for defunct 0x%llx 0x%llx %s", buf, 0x20u);

          }
          *__error() = v57;
          v3 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slide");
          v6 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "slidBaseAddress");
          objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40), "uuid");
          a1 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "UUIDString");
          v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v16, "UTF8String");
          _SASetCrashLogMessage(3658, "No matching shared cache for defunct 0x%llx 0x%llx %s", v63, v64, v65, v66, v67, v68, (char)v3);

          _os_crash();
          __break(1u);
LABEL_52:
          v69 = objc_msgSend(v16, "slidBaseAddress");
          v70 = (uint64_t)v11 + objc_msgSend(v16, "slide") - v69;
          v71 = 8;
LABEL_54:
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40) + v71) = v70;
          goto LABEL_55;
        }
      }
    }
  }
LABEL_58:

}

void __37__SASharedCache__doSharedCachesWork___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  v1 = (void *)qword_1ED1DD888;
  qword_1ED1DD888 = v0;

}

- (unint64_t)slidBaseAddress
{
  return self->_slidBaseAddress;
}

+ (SASharedCache)sharedCacheWithUUID:(id)a3 slide:(unint64_t)a4 slidBaseAddress:(unint64_t)a5
{
  return (SASharedCache *)+[SASharedCache sharedCacheWithUUID:slide:slidBaseAddress:findMappingsIfUnknown:]((uint64_t)a1, a3, a4, a5, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

+ (void)_applyLoadInfos:(uint64_t)a3 withSlide:(uint64_t)a4 andSlidBaseAddress:(void *)a5 toSharedCaches:
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a5;
  v10 = objc_opt_self();
  if (a3 != -1 && a4 != -1)
    +[SASharedCache _applyBaseAddress:toSharedCaches:](v10, a4 - a3, v9);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[SASharedCache _applyLoadInfos:withSlide:andSlidBaseAddress:](*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), v8, a3, a4);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (_QWORD)initWithUUID:(uint64_t)a3 slide:(uint64_t)a4 slidBaseAddress:
{
  id v8;
  id v9;
  objc_super v11;

  v8 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)SASharedCache;
    v9 = objc_msgSendSuper2(&v11, sel_init);
    a1 = v9;
    if (v9)
    {
      objc_storeStrong((id *)v9 + 5, a2);
      a1[1] = a3;
      a1[2] = a4;
    }
  }

  return a1;
}

+ (void)_doDscSymDirsWork:(uint64_t)a1
{
  id v2;
  void (**v3)(id, uint64_t);

  v3 = a2;
  objc_opt_self();
  if (qword_1ED1DD880 != -1)
    dispatch_once(&qword_1ED1DD880, &__block_literal_global_400);
  v2 = (id)qword_1ED1DD878;
  objc_sync_enter(v2);
  v3[2](v3, qword_1ED1DD878);
  objc_sync_exit(v2);

}

void __35__SASharedCache__doDscSymDirsWork___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  v1 = (void *)qword_1ED1DD878;
  qword_1ED1DD878 = v0;

}

+ (void)_doSharedCachesWork:(uint64_t)a1
{
  id v2;
  void (**v3)(id, uint64_t);

  v3 = a2;
  objc_opt_self();
  if (qword_1ED1DD890 != -1)
    dispatch_once(&qword_1ED1DD890, &__block_literal_global_401);
  v2 = (id)qword_1ED1DD888;
  objc_sync_enter(v2);
  v3[2](v3, qword_1ED1DD888);
  objc_sync_exit(v2);

}

+ (void)clearCaches
{
  +[SASharedCache _doSharedCachesWork:]((uint64_t)a1, &__block_literal_global_402);
}

uint64_t __28__SASharedCache_clearCaches__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

+ (void)addDscSymDir:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __30__SASharedCache_addDscSymDir___block_invoke;
  v8[3] = &unk_1E7148518;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  +[SASharedCache _doDscSymDirsWork:]((uint64_t)a1, v8);
  if (*((_BYTE *)v12 + 24))
  {
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __30__SASharedCache_addDscSymDir___block_invoke_2;
    v7[3] = &__block_descriptor_40_e29_v16__0__NSMutableDictionary_8l;
    v7[4] = a1;
    +[SASharedCache _doSharedCachesWork:]((uint64_t)a1, v7);
  }

  _Block_object_dispose(&v11, 8);
}

void __30__SASharedCache_addDscSymDir___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

uint64_t __30__SASharedCache_addDscSymDir___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__SASharedCache_addDscSymDir___block_invoke_3;
  v3[3] = &__block_descriptor_40_e39_v32__0__NSUUID_8__NSMutableArray_16_B24l;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __30__SASharedCache_addDscSymDir___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  +[SASharedCache _findLoadInfosForSharedCaches:](*(_QWORD *)(a1 + 32), a3);
}

void __27__SASharedCache_dscSymDirs__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (id)currentSharedCache
{
  void *v2;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SASharedCache_currentSharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED1DD8B0 != -1)
    dispatch_once(&qword_1ED1DD8B0, block);
  if (qword_1ED1DD898)
  {
    +[SASharedCache sharedCacheWithUUID:slide:slidBaseAddress:](SASharedCache, "sharedCacheWithUUID:slide:slidBaseAddress:", qword_1ED1DD898, qword_1ED1DD8A8, qword_1ED1DD8A0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __35__SASharedCache_currentSharedCache__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t shared_cache;
  uint64_t v4;
  void *v5;
  int v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  unsigned int v10;
  unsigned int v11;
  BOOL v12;
  int v13;
  int v14;
  int v15;
  char *v16;
  id v17;
  uint8_t buf[4];
  char *v19;
  __int16 v20;
  uint64_t v21;
  unsigned __int8 uu[8];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = getpid();
  if (CopyDyldSnapshotForPid(v2))
  {
    shared_cache = dyld_process_snapshot_get_shared_cache();
    if (shared_cache)
    {
      +[SASharedCache sharedCacheWithDyldSharedCache:](*(_QWORD *)(a1 + 32), shared_cache);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        dyld_process_snapshot_dispose();
        objc_msgSend(v17, "uuid");
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = (void *)qword_1ED1DD898;
        qword_1ED1DD898 = v4;

        qword_1ED1DD8A8 = objc_msgSend(v17, "slide");
        qword_1ED1DD8A0 = objc_msgSend(v17, "slidBaseAddress");

        return;
      }
      *(_QWORD *)uu = 0;
      v23 = 0;
      dyld_shared_cache_copy_uuid();
      v8 = *__error();
      _sa_logt();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        do
        {
          v10 = __ldxr(&uuid_string_index);
          v11 = v10 + 1;
        }
        while (__stxr(v11, &uuid_string_index));
        v12 = (-v11 & 0x80000000) != 0;
        v13 = -v11 & 3;
        v14 = v11 & 3;
        if (v12)
          v15 = v14;
        else
          v15 = -v13;
        v16 = &uuid_string_string[37 * v15];
        uuid_unparse(uu, v16);
        *(_DWORD *)buf = 136446466;
        v19 = v16;
        v20 = 2082;
        v21 = dyld_shared_cache_file_path();
        _os_log_error_impl(&dword_1B9BE0000, v9, OS_LOG_TYPE_ERROR, "Unable to find current processes' shared cache (%{public}s: %{public}s) (via dyld introspection)", buf, 0x16u);
      }

      *__error() = v8;
    }
    else
    {
      v6 = *__error();
      _sa_logt();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B9BE0000, v7, OS_LOG_TYPE_ERROR, "No shared cache for current process", buf, 2u);
      }

      *__error() = v6;
    }
    dyld_process_snapshot_dispose();
  }
}

+ (_QWORD)sharedCacheWithDyldSharedCache:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  int v7;
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  unsigned __int8 uu[16];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  memset(uu, 0, sizeof(uu));
  dyld_shared_cache_copy_uuid();
  if (uuid_is_null(uu))
    return 0;
  uuidForBytes((uint64_t)uu);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1BCCCBD9C](a2);
  +[SASharedCache sharedCacheWithUUID:slide:slidBaseAddress:findMappingsIfUnknown:]((uint64_t)SASharedCache, v4, -1, v5, 0);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "slide") == -1)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    dyld_for_each_installed_shared_cache();
    if (*((_BYTE *)v24 + 24))
    {
      -[SASharedCache setSlide:](v6, v5 - v20[3]);
    }
    else
    {
      dscsym_iterate();
      v7 = *__error();
      _sa_logt();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "debugDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v29 = v15;
        _os_log_error_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_ERROR, "Unable to find shared cache %@ in live system nor via dscsym", buf, 0xCu);

      }
      *__error() = v7;
    }
    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);
  }
  objc_msgSend(v6, "binaryLoadInfos");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") == 0;

  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v16 = MEMORY[0x1E0C809B0];
    v12 = v11;
    v17 = v12;
    v13 = v6;
    v18 = v13;
    dyld_shared_cache_for_each_image();
    if (!*((_BYTE *)v24 + 24))
    {
      if (objc_msgSend(v12, "count", v16, 3221225472, __48__SASharedCache_sharedCacheWithDyldSharedCache___block_invoke_425, &unk_1E7148680, v12, v13, &v23))
      {
        +[SABinaryLoadInfo sortBinaryLoadInfos:]((uint64_t)SABinaryLoadInfo, v12);
        objc_msgSend(v13, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[SASharedCache applyBinaryLoadInfos:sharedCacheUUID:slide:slidBaseAddress:]((uint64_t)SASharedCache, v12, v14, objc_msgSend(v13, "slide"), objc_msgSend(v13, "slidBaseAddress"));

      }
    }

    _Block_object_dispose(&v23, 8);
  }

  return v6;
}

+ (id)sharedCacheWithCSSymbolicator:
{
  void *v0;
  const unsigned __int8 *SharedCacheUUID;
  uint64_t v2;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v0 = (void *)objc_opt_self();
  SharedCacheUUID = (const unsigned __int8 *)CSSymbolicatorGetSharedCacheUUID();
  if (!SharedCacheUUID)
    return 0;
  v2 = (uint64_t)SharedCacheUUID;
  if (uuid_is_null(SharedCacheUUID))
    return 0;
  uuidForBytes(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dscsym_iterate();
  if (*((_BYTE *)v11 + 24))
  {
    objc_msgSend(v0, "sharedCacheWithUUID:slide:slidBaseAddress:", v4, v7[3], v7[3] - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);

  return v5;
}

uint64_t __47__SASharedCache_sharedCacheWithCSSymbolicator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  uint64_t SymbolOwnerWithCFUUIDBytesAtTime;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v8 = (void *)MEMORY[0x1BCCCC288]();
  SymbolOwnerWithCFUUIDBytesAtTime = CSSymbolicatorGetSymbolOwnerWithCFUUIDBytesAtTime();
  v11 = v10;
  if ((CSIsNull() & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __47__SASharedCache_sharedCacheWithCSSymbolicator___block_invoke_2;
    v14[3] = &unk_1E7148580;
    v15 = *(_OWORD *)(a1 + 32);
    v16 = a4;
    v17 = a5;
    SASymbolOwnerForeachSegment(SymbolOwnerWithCFUUIDBytesAtTime, v11, v14);
    v12 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  objc_autoreleasePoolPop(v8);
  return v12;
}

uint64_t __47__SASharedCache_sharedCacheWithCSSymbolicator___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  const char *v2;
  size_t v3;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v1 = result;
    result = CSRegionGetName();
    if (result)
    {
      v2 = (const char *)result;
      v3 = strlen(*(const char **)(v1 + 48));
      result = strncmp(v2, *(const char **)(v1 + 48), v3);
      if (!(_DWORD)result)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = 1;
        result = CSRegionGetRange();
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = result - *(_QWORD *)(v1 + 56);
      }
    }
  }
  return result;
}

+ (void)_applyBaseAddress:(void *)a3 toSharedCaches:
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  NSObject *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  char v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v39 = v4;
  v6 = (void *)objc_msgSend(v4, "copy");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_BYTE **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "slide");
        v13 = objc_msgSend(v11, "slidBaseAddress");
        if (v12 == -1)
        {
          v15 = v13 - a2;
          v16 = 8;
LABEL_12:
          *(_QWORD *)&v11[v16] = v15;
          goto LABEL_13;
        }
        if (v13 == -1)
        {
          v15 = objc_msgSend(v11, "slide") + a2;
          v16 = 16;
          goto LABEL_12;
        }
        v14 = objc_msgSend(v11, "slidBaseAddress");
        if (v14 - objc_msgSend(v11, "slide") != a2)
        {
          v20 = *__error();
          _sa_logt();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v23 = objc_msgSend(v11, "slide");
            v24 = objc_msgSend(v11, "slidBaseAddress");
            v25 = objc_msgSend(v11, "slidBaseAddress");
            v26 = v25 - objc_msgSend(v11, "slide");
            objc_msgSend(v11, "uuid");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "UUIDString");
            v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v29 = objc_msgSend(v28, "UTF8String");
            *(_DWORD *)buf = 134219010;
            v45 = v23;
            v46 = 2048;
            v47 = v24;
            v48 = 2048;
            v49 = v26;
            v50 = 2048;
            v51 = a2;
            v52 = 2080;
            v53 = v29;
            _os_log_error_impl(&dword_1B9BE0000, v21, OS_LOG_TYPE_ERROR, "Mismatch shared cache info: existing slide 0x%llx, slidBaseAddress 0x%llx (base address 0x%llx) vs applied base address 0x%llx for %s", buf, 0x34u);

          }
          *__error() = v20;
          v30 = objc_msgSend(v11, "slide");
          objc_msgSend(v11, "slidBaseAddress");
          objc_msgSend(v11, "slidBaseAddress");
          objc_msgSend(v11, "slide");
          objc_msgSend(v11, "uuid");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "UUIDString");
          v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v32, "UTF8String");
          _SASetCrashLogMessage(3533, "Mismatch shared cache info: existing slide 0x%llx, slidBaseAddress 0x%llx (base address 0x%llx) vs applied base address 0x%llx for %s", v33, v34, v35, v36, v37, v38, v30);

          _os_crash();
          __break(1u);
        }
LABEL_13:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v11, "slide"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v5, "containsObject:", v17);

        if (v18)
        {
          if (v11)
            v11[24] = 1;
          objc_msgSend(v39, "removeObject:", v11);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v11, "slide"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v19);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    }
    while (v8);
  }

}

- (void)_applyLoadInfos:(uint64_t)a3 withSlide:(uint64_t)a4 andSlidBaseAddress:
{
  void *v4;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  int v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  _QWORD *v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  int v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  int v45;
  void *v46;
  int v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  int v54;
  NSObject *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  id v67;
  id v68;
  uint64_t v69;
  void *v70;
  id obj;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t v80[128];
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  if (a1)
  {
    if ((a4 & a3) == 0xFFFFFFFFFFFFFFFFLL)
    {
      v8 = *__error();
      _sa_logt();
      a4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a4, OS_LOG_TYPE_ERROR, "applying load infos with unknown slide and unknown slidBaseAddress", buf, 2u);
      }

      *__error() = v8;
      _SASetCrashLogMessage(3547, "applying load infos with unknown slide and unknown slidBaseAddress", v60, v61, v62, v63, v64, v65, v66);
      _os_crash();
      __break(1u);
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 48), "count"))
      {
        objc_msgSend(*(id *)(a1 + 48), "count");
        objc_msgSend((id)v8, "count");
        goto LABEL_63;
      }
      if (qword_1ED1DD8B8 == -1)
      {
LABEL_6:
        v69 = a1;
        v70 = (void *)v8;
        if (a3 == -1 || !_MergedGlobals_5)
        {
LABEL_39:
          if (a3 == -1 || (v33 = *(_QWORD *)(a1 + 8), v33 == -1))
          {
            if (a4 == -1 || (v35 = *(_QWORD *)(a1 + 16), v35 == -1))
            {
              v52 = a4;
              v53 = (void *)a1;
              v54 = *__error();
              _sa_logt();
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v53, "debugDescription");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = objc_msgSend(v70, "count");
                *(_DWORD *)buf = 138413058;
                v82 = v56;
                v83 = 2048;
                v84 = v57;
                v85 = 2048;
                v86 = a3;
                v87 = 2048;
                v88 = v52;
                _os_log_impl(&dword_1B9BE0000, v55, OS_LOG_TYPE_DEFAULT, "WARNING: Unable to calculate appropriate load addresses for shared cache %@ when applying %lu load infos with slide #%llx and slidbaseAddress 0x%llx", buf, 0x2Au);

              }
              *__error() = v54;
              goto LABEL_62;
            }
            v34 = v35 - a4;
          }
          else
          {
            v34 = v33 - a3;
          }
          v68 = (id)a1;
          objc_sync_enter(v68);
          if (v34)
          {
            v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend((id)v8, "count"));
            v74 = 0u;
            v75 = 0u;
            v72 = 0u;
            v73 = 0u;
            obj = (id)v8;
            v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
            if (v37)
            {
              v38 = *(_QWORD *)v73;
              do
              {
                for (i = 0; i != v37; ++i)
                {
                  if (*(_QWORD *)v73 != v38)
                    objc_enumerationMutation(obj);
                  v40 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
                  v41 = objc_msgSend(v40, "loadAddress");
                  objc_msgSend(v40, "segment");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();

                  v43 = v41 + v34;
                  if (v42)
                  {
                    objc_msgSend(v40, "segment");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v45 = objc_msgSend(v40, "isInKernelAddressSpace");
                    objc_msgSend(v40, "exclave");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:](SABinaryLoadInfo, v44, v43, v45, v46);
                  }
                  else
                  {
                    objc_msgSend(v40, "binary");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v47 = objc_msgSend(v40, "isInKernelAddressSpace");
                    objc_msgSend(v40, "exclave");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    +[SABinaryLoadInfo binaryLoadInfoWithBinary:loadAddress:isInKernelAddressSpace:exclave:]((uint64_t)SABinaryLoadInfo, v44, v43, v47, v46);
                  }
                  v48 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v36, "addObject:", v48);
                }
                v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
              }
              while (v37);
            }

            v49 = objc_msgSend(v36, "copy");
            v50 = *(void **)(v69 + 48);
            *(_QWORD *)(v69 + 48) = v49;

          }
          else
          {
            v51 = objc_msgSend((id)v8, "copy");
            v36 = *(void **)(a1 + 48);
            *(_QWORD *)(a1 + 48) = v51;
          }

          objc_sync_exit(v68);
LABEL_62:
          v8 = (unint64_t)v70;
          goto LABEL_63;
        }
        v67 = (id)a4;
        objc_msgSend((id)v8, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "loadAddress");
        if (v10 >= 0x300000001)
        {
          objc_msgSend((id)v8, "firstObject");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          if (!((unint64_t)objc_msgSend(v4, "loadAddress") >> 34))
          {

LABEL_11:
            v11 = *__error();
            _sa_logt();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v70, "firstObject");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "debugDescription");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v82 = v59;
              _os_log_error_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_ERROR, "Detected bad shared cache load infos (%@) see rdar://93325284", buf, 0xCu);

            }
            *__error() = v11;
            v78 = 0u;
            v79 = 0u;
            v76 = 0u;
            v77 = 0u;
            v13 = v70;
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
            if (v14)
            {
              v15 = *(_QWORD *)v77;
              do
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v77 != v15)
                    objc_enumerationMutation(v13);
                  v17 = *(_QWORD **)(*((_QWORD *)&v76 + 1) + 8 * j);
                  v18 = objc_msgSend(v17, "loadAddress");
                  v19 = *__error();
                  _sa_logt();
                  v20 = objc_claimAutoreleasedReturnValue();
                  v21 = (void *)(a3 + ((unint64_t)(v18 - a3) >> 1));
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v17, "debugDescription");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 134218242;
                    v82 = v21;
                    v83 = 2112;
                    v84 = (uint64_t)v22;
                    _os_log_debug_impl(&dword_1B9BE0000, v20, OS_LOG_TYPE_DEBUG, "0x%llx <- %@", buf, 0x16u);

                  }
                  *__error() = v19;
                  if (v17)
                    v17[3] = v21;
                }
                v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
              }
              while (v14);
            }

LABEL_38:
            a1 = v69;
            v8 = (unint64_t)v70;
            a4 = (uint64_t)v67;
            goto LABEL_39;
          }
        }
        objc_msgSend((id)v8, "firstObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v23, "loadAddress") >> 32 || *(_QWORD *)(v69 + 16) == -1)
        {

          if (v10 < 0x300000001)
            goto LABEL_34;
        }
        else
        {
          objc_msgSend((id)v8, "firstObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "loadAddress") > (unint64_t)(*(_QWORD *)(v69 + 16) + 436207616))
          {
            v25 = v10 > 0x300000000;
            objc_msgSend((id)v8, "firstObject");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "loadAddress");
            v28 = *(_QWORD *)(v69 + 16) + 2315255808;

            if (v25)
            if (v27 < v28)
              goto LABEL_11;
LABEL_35:
            v29 = *__error();
            _sa_logt();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v70, "firstObject");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "debugDescription");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v82 = v32;
              _os_log_impl(&dword_1B9BE0000, v30, OS_LOG_TYPE_INFO, "Detected ok shared cache load infos (%@) see rdar://93325284", buf, 0xCu);

            }
            *__error() = v29;
            goto LABEL_38;
          }

          if (v10 <= 0x300000000)
          {
LABEL_34:

            goto LABEL_35;
          }
        }

        goto LABEL_34;
      }
    }
    dispatch_once(&qword_1ED1DD8B8, &__block_literal_global_413);
    goto LABEL_6;
  }
LABEL_63:

}

const char *__62__SASharedCache__applyLoadInfos_withSlide_andSlidBaseAddress___block_invoke()
{
  const char *result;

  result = getenv("SA_WORKAROUND_93250769");
  if (result)
  {
    result = (const char *)strcmp(result, "0");
    _MergedGlobals_5 = (_DWORD)result != 0;
  }
  return result;
}

+ (SASharedCache)sharedCacheWithUUID:(id)a3 slide:(unint64_t)a4
{
  return (SASharedCache *)+[SASharedCache sharedCacheWithUUID:slide:slidBaseAddress:findMappingsIfUnknown:]((uint64_t)a1, a3, a4, -1, 1);
}

uint64_t __48__SASharedCache_sharedCacheWithDyldSharedCache___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  unsigned __int8 uu2[8];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v3 = result;
    *(_QWORD *)uu2 = 0;
    v5 = 0;
    dyld_shared_cache_copy_uuid();
    result = uuid_compare((const unsigned __int8 *)(v3 + 48), uu2);
    if (!(_DWORD)result)
    {
      result = MEMORY[0x1BCCCBD9C](a2);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 24) = result;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = 1;
    }
  }
  return result;
}

- (void)setSlide:(_QWORD *)a1
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  id v9;
  id v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[6];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a2 == -1 || ((v4 = a1[1], v4 != a2) ? (v5 = v4 == -1) : (v5 = 1), !v5 || (v6 = a1[2], v6 == -1)))
    {
      v7 = *__error();
      _sa_logt();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(a1, "debugDescription");
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136315394;
        v20 = objc_msgSend(v9, "UTF8String");
        v21 = 2048;
        v22 = a2;
        _os_log_error_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_ERROR, "Changing %s slide to 0x%llx", buf, 0x16u);

      }
      *__error() = v7;
      objc_msgSend(a1, "debugDescription");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = objc_msgSend(v10, "UTF8String");
      _SASetCrashLogMessage(3828, "Changing %s slide to 0x%llx", v12, v13, v14, v15, v16, v17, v11);

      _os_crash();
      __break(1u);
    }
    if (v4 != a2)
    {
      a1[1] = a2;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __26__SASharedCache_setSlide___block_invoke;
      v18[3] = &unk_1E71486D0;
      v18[4] = a1;
      v18[5] = v6 - a2;
      +[SASharedCache _doSharedCachesWork:]((uint64_t)SASharedCache, v18);
    }
  }
}

uint64_t __48__SASharedCache_sharedCacheWithDyldSharedCache___block_invoke_2()
{
  return 1;
}

void __48__SASharedCache_sharedCacheWithDyldSharedCache___block_invoke_425(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    +[SABinaryLoadInfo addBinaryLoadInfoForDyldImage:toLoadInfos:isKernel:dataGatheringOptions:]((uint64_t)SABinaryLoadInfo, a2, *(void **)(a1 + 32), 0, 0);

  }
}

+ (void)applyBinaryLoadInfos:(void *)a3 sharedCacheUUID:(uint64_t)a4 slide:(uint64_t)a5 slidBaseAddress:
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v8 = a2;
  v9 = a3;
  v10 = objc_opt_self();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__SASharedCache_applyBinaryLoadInfos_sharedCacheUUID_slide_slidBaseAddress___block_invoke;
  v13[3] = &unk_1E7148798;
  v16 = a4;
  v17 = a5;
  v14 = v9;
  v15 = v8;
  v18 = v10;
  v11 = v8;
  v12 = v9;
  +[SASharedCache _doSharedCachesWork:]((uint64_t)SASharedCache, v13);

}

- (BOOL)matchesUUID:(unsigned __int8)a3[16] slide:(unint64_t)a4 slidBaseAddress:(unint64_t)a5
{
  unint64_t slide;
  BOOL v10;
  unint64_t slidBaseAddress;
  int v13;
  unint64_t v14;
  unint64_t v15;
  int v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  _QWORD v26[7];
  unsigned __int8 uu1[8];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((a5 & a4) == 0xFFFFFFFFFFFFFFFFLL)
  {
    v17 = *__error();
    _sa_logt();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uu1 = 0;
      _os_log_error_impl(&dword_1B9BE0000, v18, OS_LOG_TYPE_ERROR, "matching shared cache with both slide and slidBaseAddress unknown", uu1, 2u);
    }

    *__error() = v17;
    _SASetCrashLogMessage(3780, "matching shared cache with both slide and slidBaseAddress unknown", v19, v20, v21, v22, v23, v24, v25);
    _os_crash();
    __break(1u);
  }
  if (a4 == -1 || (slide = self->_slide, slide == -1))
  {
    v10 = 0;
    if (a5 == -1)
      return v10;
    slidBaseAddress = self->_slidBaseAddress;
    if (slidBaseAddress == -1 || slidBaseAddress != a5)
      return v10;
  }
  else if (slide != a4)
  {
    return 0;
  }
  *(_QWORD *)uu1 = 0;
  v28 = 0;
  -[NSUUID getUUIDBytes:](self->_uuid, "getUUIDBytes:", uu1);
  v13 = uuid_compare(uu1, a3);
  v10 = v13 == 0;
  if (a4 != -1 && a5 != -1 && !v13 && (self->_slide == -1 || self->_slidBaseAddress == -1))
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __51__SASharedCache_matchesUUID_slide_slidBaseAddress___block_invoke;
    v26[3] = &unk_1E71486A8;
    v26[4] = self;
    v26[5] = a5;
    v26[6] = a4;
    +[SASharedCache _doSharedCachesWork:]((uint64_t)SASharedCache, v26);
    v14 = self->_slide;
    v15 = self->_slidBaseAddress;
    if (v14 == -1)
    {
      self->_slide = a4 - a5 + v15;
    }
    else if (v15 == -1)
    {
      self->_slidBaseAddress = a5 - a4 + v14;
    }
  }
  return v10;
}

void __51__SASharedCache_matchesUUID_slide_slidBaseAddress___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  +[SASharedCache _applyBaseAddress:toSharedCaches:]((uint64_t)SASharedCache, a1[5] - a1[6], v6);
}

- (BOOL)matchesUUID:(unsigned __int8)a3[16] slide:(unint64_t)a4
{
  return -[SASharedCache matchesUUID:slide:slidBaseAddress:](self, "matchesUUID:slide:slidBaseAddress:", a3, a4, -1);
}

void __26__SASharedCache_setSlide___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  +[SASharedCache _applyBaseAddress:toSharedCaches:]((uint64_t)SASharedCache, *(_QWORD *)(a1 + 40), v6);
}

- (void)setSlidBaseAddress:(_QWORD *)a1
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  id v9;
  id v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[6];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a2 == -1 || ((v4 = a1[2], v4 != a2) ? (v5 = v4 == -1) : (v5 = 1), !v5 || (v6 = a1[1], v6 == -1)))
    {
      v7 = *__error();
      _sa_logt();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(a1, "debugDescription");
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136315394;
        v20 = objc_msgSend(v9, "UTF8String");
        v21 = 2048;
        v22 = a2;
        _os_log_error_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_ERROR, "Changing %s slidBaseAddress to 0x%llx", buf, 0x16u);

      }
      *__error() = v7;
      objc_msgSend(a1, "debugDescription");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = objc_msgSend(v10, "UTF8String");
      _SASetCrashLogMessage(3845, "Changing %s slidBaseAddress to 0x%llx", v12, v13, v14, v15, v16, v17, v11);

      _os_crash();
      __break(1u);
    }
    if (v4 != a2)
    {
      a1[2] = a2;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __36__SASharedCache_setSlidBaseAddress___block_invoke;
      v18[3] = &unk_1E71486D0;
      v18[4] = a1;
      v18[5] = a2 - v6;
      +[SASharedCache _doSharedCachesWork:]((uint64_t)SASharedCache, v18);
    }
  }
}

void __36__SASharedCache_setSlidBaseAddress___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  +[SASharedCache _applyBaseAddress:toSharedCaches:]((uint64_t)SASharedCache, *(_QWORD *)(a1 + 40), v6);
}

+ (void)addDSCSymData:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  int v7;
  int v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, _BYTE *, char *, uint64_t, uint64_t);
  void *v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  _QWORD v26[4];
  uint64_t v27;
  uint8_t buf[4];
  int v29;
  unsigned __int8 uu[8];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)uu = 0;
  v31 = 0;
  v27 = -1;
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "bytes");
  objc_msgSend(v4, "length");
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v5 = MEMORY[0x1E0C809B0];
  v26[3] = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __31__SASharedCache_addDSCSymData___block_invoke;
  v25[3] = &unk_1E71480A8;
  v25[4] = v26;
  +[SASharedCache _doSharedCachesWork:]((uint64_t)a1, v25);
  v19 = v5;
  v20 = 3221225472;
  v21 = __31__SASharedCache_addDSCSymData___block_invoke_3;
  v22 = &unk_1E7148748;
  v24 = v26;
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2560);
  v23 = v6;
  v7 = dscsym_iterate_buffer();
  if (v7)
  {
    v8 = *__error();
    _sa_logt();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v29 = v7;
      _os_log_impl(&dword_1B9BE0000, v9, OS_LOG_TYPE_DEFAULT, "WARNING: Error parsing dsc buffer: %d", buf, 8u);
    }

    *__error() = v8;
  }
  else if (uuid_is_null(uu))
  {
    v10 = *__error();
    _sa_logt();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9BE0000, v11, OS_LOG_TYPE_DEFAULT, "WARNING: NULL UUID for dscsym", buf, 2u);
    }

    *__error() = v10;
  }
  else
  {
    +[SABinaryLoadInfo sortBinaryLoadInfos:]((uint64_t)SABinaryLoadInfo, v6);
    uuidForBytes((uint64_t)uu);
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __31__SASharedCache_addDSCSymData___block_invoke_434;
    v13[3] = &unk_1E7148770;
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v12;
    v16 = v26;
    v17 = v27;
    v15 = v6;
    v18 = a1;
    +[SASharedCache _doSharedCachesWork:]((uint64_t)SASharedCache, v13);

  }
  _Block_object_dispose(v26, 8);

}

uint64_t __31__SASharedCache_addDSCSymData___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__SASharedCache_addDSCSymData___block_invoke_2;
  v3[3] = &unk_1E7148720;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __31__SASharedCache_addDSCSymData___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "slide", (_QWORD)v12) != -1)
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v11, "slide");
          *a4 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

}

uint64_t __31__SASharedCache_addDSCSymData___block_invoke_3(uint64_t a1, uint64_t a2, _BYTE *a3, char *a4, uint64_t a5, uint64_t a6)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v12 = (void *)MEMORY[0x1BCCCC288]();
  if (SAShouldIgnoreSegmentWithCName(a4))
    goto LABEL_15;
  uuidForBytes(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SAFilepathForCString(a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isAbsolutePath"))
    v15 = v14;
  else
    v15 = 0;
  +[SABinary binaryWithUUID:absolutePath:](SABinary, "binaryWithUUID:absolutePath:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "path");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (!a3 || v17)
    goto LABEL_10;
  if (*a3)
  {
    SANSStringForCString(a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_setProperty_atomic_copy(v16, v19, v18, 80);
LABEL_10:

  }
  SANSStringForCString(a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    v25 = *__error();
    _sa_logt();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v34 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v26, OS_LOG_TYPE_ERROR, "No nsstring for %s", buf, 0xCu);
    }

    *__error() = v25;
    _SASetCrashLogMessage(3982, "No nsstring for %s", v27, v28, v29, v30, v31, v32, (char)a4);
    _os_crash();
    __break(1u);
  }
  v21 = v20;
  -[SABinary segmentWithCleanName:](v16, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    +[SASegment segmentWithBinary:name:length:]((uint64_t)SASegment, v16, v21, a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SABinary addSegment:](v16, v22);
  }
  +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:](SABinaryLoadInfo, v22, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + a5, 0, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v23);

LABEL_15:
  objc_autoreleasePoolPop(v12);
  return 0;
}

void __31__SASharedCache_addDSCSymData___block_invoke_434(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  SASharedCache *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "binaryLoadInfos");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      +[SASharedCache _applyLoadInfos:withSlide:andSlidBaseAddress:toSharedCaches:](*(_QWORD *)(a1 + 64), *(void **)(a1 + 40), v8, *(_QWORD *)(a1 + 56) + v8, v4);
    }
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));
    v9 = [SASharedCache alloc];
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v11 = -[SASharedCache initWithUUID:slide:slidBaseAddress:](v9, *(void **)(a1 + 32), v10, *(_QWORD *)(a1 + 56) + v10);
    objc_msgSend(v4, "addObject:", v11);
    v12 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(v11, "setBinaryLoadInfos:", v12);

  }
}

+ (id)sharedCacheWithUUID:(uint64_t)a3 slide:(void *)a4 binaryLoadInfos:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  v7 = a2;
  v8 = objc_opt_self();
  +[SASharedCache applyBinaryLoadInfos:sharedCacheUUID:slide:slidBaseAddress:](v8, v6, v7, a3, -1);

  +[SASharedCache sharedCacheWithUUID:slide:](SASharedCache, "sharedCacheWithUUID:slide:", v7, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __76__SASharedCache_applyBinaryLoadInfos_sharedCacheUUID_slide_slidBaseAddress___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    +[SASharedCache _applyLoadInfos:withSlide:andSlidBaseAddress:toSharedCaches:](*(_QWORD *)(a1 + 64), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v3);
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));
    v5 = -[SASharedCache initWithUUID:slide:slidBaseAddress:]([SASharedCache alloc], *(void **)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(v4, "addObject:", v5);
    v6 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(v5, "setBinaryLoadInfos:", v6);

  }
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%llx (slide 0x%llx slidBaseAddress 0x%llx) Shared cache <%@> (%lu binaries)"), -[SASharedCache startAddress](self, "startAddress"), self->_slide, self->_slidBaseAddress, self->_uuid, -[NSArray count](self->_binaryLoadInfos, "count"));
}

- (void)setBinaryLoadInfos:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binaryLoadInfos, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  NSUUID *uuid;
  id v5;
  void *v6;
  void *v7;
  id v8;

  uuid = self->_uuid;
  v5 = a3;
  -[NSUUID UUIDString](uuid, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryFirstEntry(v5, (uint64_t)CFSTR("uuid"), v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_slide);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v5, CFSTR("slide"), v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_slidBaseAddress);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v5, CFSTR("slidBaseAddress"), v8);

}

+ (id)classDictionaryKey
{
  return CFSTR("SASharedCache");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 8 * -[NSArray count](self->_binaryLoadInfos, "count") + 44;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  NSObject *v5;
  int v6;
  id v10;
  unsigned __int16 v11;
  uint64_t var3;
  NSObject *v13;
  void *v14;
  NSUInteger v15;
  int *v16;
  unint64_t *v17;
  int v19;
  NSObject *v20;
  id v21;
  id v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  unint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  *(_WORD *)&a3->var0 = 769;
  *(_QWORD *)(&a3->var3 + 1) = self->_slide;
  -[NSUUID getUUIDBytes:](self->_uuid, "getUUIDBytes:", a3->var2);
  if (-[SASharedCache sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") == a4)
  {
    if (-[NSArray count](self->_binaryLoadInfos, "count") < 0xFFFF)
    {
      v11 = -[NSArray count](self->_binaryLoadInfos, "count");
      a3->var3 = v11;
      SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)&a3->var4 + 4, v11, self->_binaryLoadInfos, v10);
      var3 = a3->var3;
      goto LABEL_8;
    }
    v19 = *__error();
    _sa_logt();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      -[SASharedCache debugDescription](self, "debugDescription");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315394;
      v37 = objc_msgSend(v21, "UTF8String");
      v38 = 1024;
      LODWORD(v39) = 0xFFFF;
      _os_log_error_impl(&dword_1B9BE0000, v20, OS_LOG_TYPE_ERROR, "%s: more than %d binaries", buf, 0x12u);

    }
    *__error() = v19;
    -[SASharedCache debugDescription](self, "debugDescription");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = objc_msgSend(v22, "UTF8String");
    _SASetCrashLogMessage(5230, "%s: more than %d binaries", v24, v25, v26, v27, v28, v29, v23);

    v13 = _os_crash();
    __break(1u);
LABEL_12:
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v37 = a4;
      v38 = 2048;
      v39 = 28;
      _os_log_error_impl(&dword_1B9BE0000, v5, OS_LOG_TYPE_ERROR, "bufferLength %lu != serialized SASharedCache struct %lu", buf, 0x16u);
    }

    *__error() = v6;
    _SASetCrashLogMessage(5235, "bufferLength %lu != serialized SASharedCache struct %lu", v30, v31, v32, v33, v34, v35, a4);
    _os_crash();
    __break(1u);
  }
  v6 = *__error();
  _sa_logt();
  v13 = objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (a4 <= 0x2B)
    goto LABEL_12;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[SASharedCache debugDescription](self, "debugDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[NSArray count](self->_binaryLoadInfos, "count");
    *(_DWORD *)buf = 138412546;
    v37 = (unint64_t)v14;
    v38 = 2048;
    v39 = v15;
    _os_log_impl(&dword_1B9BE0000, v5, OS_LOG_TYPE_DEFAULT, "WARNING: SASharedCache %@ got its %lu binaries after starting serialization!", buf, 0x16u);

  }
  v16 = __error();
  var3 = 0;
  *v16 = v6;
  a3->var3 = 0;
LABEL_8:
  v17 = (unint64_t *)((char *)&a3->var4 + 8 * var3 + 4);
  *v17 = self->_slidBaseAddress;
  v17[1] = self->_flags;

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  NSArray *v7;
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
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_binaryLoadInfos;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint8_t buf[4];
  unint64_t v54;
  __int16 v55;
  _WORD v56[17];

  *(_QWORD *)&v56[13] = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)a3 >= 4u)
    goto LABEL_27;
  if (a4 <= 0x1B)
  {
    v18 = *__error();
    _sa_logt();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v54 = a4;
      v55 = 2048;
      *(_QWORD *)v56 = 28;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SASharedCache struct %lu", buf, 0x16u);
    }

    *__error() = v18;
    _SASetCrashLogMessage(5262, "bufferLength %lu < serialized SASharedCache struct %lu", v19, v20, v21, v22, v23, v24, a4);
    _os_crash();
    __break(1u);
    goto LABEL_18;
  }
  v5 = (uint64_t)a3;
  if (8 * (unint64_t)*((unsigned __int16 *)a3 + 9) + 28 > a4)
  {
LABEL_18:
    v25 = *__error();
    _sa_logt();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = *(unsigned __int16 *)(v5 + 18);
      *(_DWORD *)buf = 134218496;
      v54 = a4;
      v55 = 1024;
      *(_DWORD *)v56 = v27;
      v56[2] = 2048;
      *(_QWORD *)&v56[3] = 8 * v27 + 28;
      _os_log_error_impl(&dword_1B9BE0000, v26, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SASharedCache struct plus %u load infos %lu", buf, 0x1Cu);
    }

    *__error() = v25;
    _SASetCrashLogMessage(5263, "bufferLength %lu < serialized SASharedCache struct plus %u load infos %lu", v28, v29, v30, v31, v32, v33, a4);
    _os_crash();
    __break(1u);
LABEL_21:
    v34 = *__error();
    _sa_logt();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = *(unsigned __int16 *)(v5 + 18);
      *(_DWORD *)buf = 134218496;
      v54 = a4;
      v55 = 1024;
      *(_DWORD *)v56 = v36;
      v56[2] = 2048;
      *(_QWORD *)&v56[3] = 9 * v36 + 28;
      _os_log_error_impl(&dword_1B9BE0000, v35, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SASharedCache struct plus %u load infos %lu", buf, 0x1Cu);
    }

    *__error() = v34;
    _SASetCrashLogMessage(5270, "bufferLength %lu < serialized SASharedCache struct plus %u load infos %lu", v37, v38, v39, v40, v41, v42, a4);
    _os_crash();
    __break(1u);
LABEL_24:
    v43 = *__error();
    _sa_logt();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = *(unsigned __int16 *)(v5 + 18);
      *(_DWORD *)buf = 134218496;
      v54 = a4;
      v55 = 1024;
      *(_DWORD *)v56 = v45;
      v56[2] = 2048;
      *(_QWORD *)&v56[3] = 9 * v45 + 28;
      _os_log_error_impl(&dword_1B9BE0000, v44, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SASharedCache struct plus %u load infos %lu", buf, 0x1Cu);
    }

    *__error() = v43;
    _SASetCrashLogMessage(5277, "bufferLength %lu < serialized SASharedCache struct plus %u load infos %lu", v46, v47, v48, v49, v50, v51, a4);
    _os_crash();
    __break(1u);
LABEL_27:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SASharedCache version"), 0);
    v52 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v52);
  }
  uuidForBytes((uint64_t)a3 + 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(unsigned __int8 *)(v5 + 1);
  if (v7 < 2)
  {
    v14 = 0;
    v11 = -1;
    goto LABEL_11;
  }
  v8 = *(unsigned __int16 *)(v5 + 18);
  v9 = 8 * v8;
  if (8 * v8 + 36 > a4)
    goto LABEL_21;
  v10 = v5 + 8 * v8;
  v13 = *(_QWORD *)(v10 + 28);
  v12 = v10 + 28;
  v11 = v13;
  if (v7 < 3)
  {
    v14 = 0;
    goto LABEL_11;
  }
  if (v9 + 44 > a4)
    goto LABEL_24;
  v14 = *(_QWORD *)(v12 + 8);
LABEL_11:
  +[SASharedCache sharedCacheWithUUID:slide:slidBaseAddress:findMappingsIfUnknown:]((uint64_t)SASharedCache, v6, *(_QWORD *)(v5 + 20), v11, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v14 && v15)
    *(_DWORD *)(v15 + 28) = v14;

  return v16;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  _QWORD v34[5];
  id v35;
  uint8_t buf[4];
  unint64_t v37;
  __int16 v38;
  _WORD v39[17];

  *(_QWORD *)&v39[13] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  if (*(unsigned __int8 *)a3 >= 4u)
    goto LABEL_14;
  if (a4 <= 0x1B)
  {
    v17 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v37 = a4;
      v38 = 2048;
      *(_QWORD *)v39 = 28;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SASharedCache struct %lu", buf, 0x16u);
    }

    *__error() = v17;
    _SASetCrashLogMessage(5298, "bufferLength %lu < serialized SASharedCache struct %lu", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
    goto LABEL_11;
  }
  if (8 * (unint64_t)*((unsigned __int16 *)a3 + 9) + 28 > a4)
  {
LABEL_11:
    v24 = *__error();
    _sa_logt();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = *((unsigned __int16 *)a3 + 9);
      *(_DWORD *)buf = 134218496;
      v37 = a4;
      v38 = 1024;
      *(_DWORD *)v39 = v26;
      v39[2] = 2048;
      *(_QWORD *)&v39[3] = 8 * v26 + 28;
      _os_log_error_impl(&dword_1B9BE0000, v25, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SASharedCache struct plus %u load infos %lu", buf, 0x1Cu);
    }

    *__error() = v24;
    _SASetCrashLogMessage(5299, "bufferLength %lu < serialized SASharedCache struct plus %u load infos %lu", v27, v28, v29, v30, v31, v32, a4);
    _os_crash();
    __break(1u);
LABEL_14:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAInstruction version"), 0);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v33);
  }
  v12 = v11;
  if (!-[NSArray count](self->_binaryLoadInfos, "count"))
  {
    v13 = *((unsigned __int16 *)a3 + 9);
    if (*((_WORD *)a3 + 9))
    {
      v14 = (void *)objc_opt_class();
      SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 28, v13, v10, v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __128__SASharedCache_Serialization__populateReferencesUsingBuffer_bufferLength_andDeserializationDictionary_andDataBufferDictionary___block_invoke;
      v34[3] = &unk_1E7148850;
      v34[4] = self;
      v35 = v15;
      v16 = v15;
      +[SASharedCache _doSharedCachesWork:]((uint64_t)SASharedCache, v34);

    }
  }

}

void __128__SASharedCache_Serialization__populateReferencesUsingBuffer_bufferLength_andDeserializationDictionary_andDataBufferDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  id v7;
  id v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16 = a2;
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "count"))
  {
    v5 = *__error();
    _sa_logt();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "debugDescription");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315138;
      v18 = objc_msgSend(v7, "UTF8String");
      _os_log_error_impl(&dword_1B9BE0000, v6, OS_LOG_TYPE_ERROR, "In deserialization, no shared caches in cache for shared cache %s", buf, 0xCu);

    }
    *__error() = v5;
    objc_msgSend(*(id *)(a1 + 32), "debugDescription");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "UTF8String");
    _SASetCrashLogMessage(5308, "In deserialization, no shared caches in cache for shared cache %s", v10, v11, v12, v13, v14, v15, v9);

    _os_crash();
    __break(1u);
  }
  +[SASharedCache _applyLoadInfos:withSlide:andSlidBaseAddress:toSharedCaches:]((uint64_t)SASharedCache, *(void **)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "slide"), objc_msgSend(*(id *)(a1 + 32), "slidBaseAddress"), v4);

}

@end
