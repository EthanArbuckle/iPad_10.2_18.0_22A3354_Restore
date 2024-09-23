@implementation VMUTask

- (BOOL)rangeIsInSharedCache:(_VMURange)a3
{
  return VMURangeContainsRange(self->_taskDyldSharedCacheRange.location, self->_taskDyldSharedCacheRange.length, a3.location, a3.length);
}

- (id)memoryCache
{
  return self->_taskMemory;
}

- (BOOL)isExclave
{
  return self->_exclaveType - 1 < 2;
}

- (unsigned)taskPort
{
  if (self->_taskType)
    return 0;
  else
    return self->_liveTask;
}

- (BOOL)isCore
{
  return self->_coreFilePath != 0;
}

- (VMUTask)initWithTask:(unsigned int)a3
{
  VMUTask *v4;
  VMUTask *v5;
  VMUTask *v6;
  VMUTaskMemoryCache *v7;
  VMUTaskMemoryCache *taskMemory;
  uint64_t v9;
  uint64_t v10;
  uint64_t shared_cache;
  uint64_t v12;
  objc_super v14;
  int v15;

  v14.receiver = self;
  v14.super_class = (Class)VMUTask;
  v4 = -[VMUTask init](&v14, sel_init);
  v5 = v4;
  if (!v4)
    goto LABEL_17;
  v4->_taskType = 0;
  v4->_liveTask = a3;
  if (a3 + 1 >= 2)
  {
    if (mach_port_mod_refs(*MEMORY[0x1E0C83DA0], a3, 0, 1))
    {

      v5 = 0;
      goto LABEL_5;
    }
    v7 = -[VMUTaskMemoryCache initWithTask:]([VMUTaskMemoryCache alloc], "initWithTask:", v5->_liveTask);
    taskMemory = v5->_taskMemory;
    v5->_taskMemory = v7;

    v15 = 0;
    v9 = dyld_process_create_for_task();
    if (v9)
    {
      v15 = 0;
      v10 = dyld_process_snapshot_create_for_process();
      dyld_process_dispose();
      if (v10)
      {
        shared_cache = dyld_process_snapshot_get_shared_cache();
        v12 = shared_cache;
        if (shared_cache)
        {
          if ((MEMORY[0x1A85A9014](shared_cache) & 1) != 0)
          {
            v9 = 0;
            v12 = 0;
          }
          else
          {
            v9 = MEMORY[0x1A85A8FFC](v12);
            v12 = MEMORY[0x1A85A9008](v12);
          }
        }
        else
        {
          v9 = 0;
        }
        dyld_process_snapshot_dispose();
        goto LABEL_16;
      }
      v9 = 0;
    }
    v12 = 0;
LABEL_16:
    v5->_taskDyldSharedCacheRange.location = v9;
    v5->_taskDyldSharedCacheRange.length = v12;
    v5->_taskIsSelf = mach_task_is_self(v5->_liveTask) != 0;
LABEL_17:
    v5 = v5;
    v6 = v5;
    goto LABEL_18;
  }
LABEL_5:
  v6 = 0;
LABEL_18:

  return v6;
}

- (void)dealloc
{
  int v2;
  _DWORD v3[2];
  __int16 v4;
  char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109378;
  v3[1] = v2;
  v4 = 2080;
  v5 = mach_error_string(error_value);
  _os_log_error_impl(&dword_1A4D79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to deallocate target task port: %d (%s)\n", (uint8_t *)v3, 0x12u);
}

- (_CSTypeRef)createSymbolicatorWithFlags:(unsigned int)a3 andNotification:(id)a4
{
  unint64_t v4;
  unint64_t v5;
  _CSTypeRef result;

  v4 = -[VMUTaskMemoryCache createSymbolicatorWithFlags:andNotification:]((uint64_t)self->_taskMemory, *(uint64_t *)&a3, a4);
  result._opaque_2 = v5;
  result._opaque_1 = v4;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processDescription, 0);
  objc_storeStrong((id *)&self->_taskMemory, 0);
  objc_storeStrong((id *)&self->_coreFilePath, 0);
}

- (VMUTask)initWithCorePath:(id)a3 originalBinaryPaths:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  VMUTaskMemoryCache *v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  id v18;
  uint64_t FlagsForNListOnlyData;
  uint64_t Range;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v27;
  uint64_t v28;
  objc_super v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)VMUTask;
  v10 = -[VMUTask init](&v29, sel_init);
  if (v10)
  {
    v28 = 0;
    if (!a5)
      a5 = (id *)&v28;
    v11 = objc_msgSend(v8, "copy");
    v12 = (void *)*((_QWORD *)v10 + 2);
    *((_QWORD *)v10 + 2) = v11;

    v13 = -[VMUTaskMemoryCache initWithCorePath:originalBinaryPaths:error:]([VMUTaskMemoryCache alloc], "initWithCorePath:originalBinaryPaths:error:", v8, v9, a5);
    v14 = (void *)*((_QWORD *)v10 + 6);
    *((_QWORD *)v10 + 6) = v13;

    v15 = *((_QWORD *)v10 + 6);
    if (!v15)
      goto LABEL_23;
    if (-[VMUTaskMemoryCache isExclave](v15) || objc_msgSend(*((id *)v10 + 6), "isKernel"))
    {
      *((_QWORD *)v10 + 4) = 0;
      *((_QWORD *)v10 + 5) = 0;
    }
    else if (-[VMUTaskMemoryCache getCoreDyldSharedCacheRange:](*((_QWORD *)v10 + 6), (_OWORD *)v10 + 2))
    {
      goto LABEL_23;
    }
    v16 = objc_msgSend(*((id *)v10 + 6), "isKernel");
    v17 = 1;
    if (v16)
      v17 = 2;
    *((_QWORD *)v10 + 11) = v17;
    *((_BYTE *)v10 + 24) = 0;
    *((_QWORD *)v10 + 9) = -[VMUTaskMemoryCache exclaveType](*((_QWORD *)v10 + 6));
    if (*((_QWORD *)v10 + 11) == 2)
    {
      v18 = *((id *)v10 + 6);
      FlagsForNListOnlyData = CSSymbolicatorGetFlagsForNListOnlyData();
      -[VMUTaskMemoryCache createSymbolicatorWithFlags:andNotification:]((uint64_t)v18, FlagsForNListOnlyData, 0);
      CSSymbolicatorGetAOutSymbolOwner();
      CSSymbolOwnerGetSymbolWithMangledName();
      Range = CSSymbolGetRange();
      CSRelease();
      if (Range)
      {
        v30 = 0;
        if (!objc_msgSend(v18, "peekAtAddress:size:returnsBuf:", Range, 8, &v30))
        {
          if (v30)
          {
            v27 = 64 - *v30;
            if (!(-((*v30 > 0x40uLL) + 64) & 1 | HIDWORD(v27)))
            {
              v22 = ~(-1 << v27);

              goto LABEL_18;
            }
          }
        }
      }

    }
    if (!-[VMUTaskMemoryCache getCoreFileAddressingMask:](*((_QWORD *)v10 + 6)))
    {
      v22 = 0;
LABEL_18:
      *((_QWORD *)v10 + 10) = v22;
      goto LABEL_24;
    }
    if (*((_QWORD *)v10 + 11) == 2)
    {
      v21 = CFSTR("kernel");
    }
    else
    {
      if (!*((_QWORD *)v10 + 9))
        goto LABEL_24;
      v21 = CFSTR("exclave");
    }
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to get addressing mask for %@ core file."), v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("VMUTask initialization"), 0, v25);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:
    v10 = 0;
  }
LABEL_24:

  return (VMUTask *)v10;
}

- (int)pid
{
  void *v2;
  int v3;

  -[VMUTask processDescription](self, "processDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pid");

  return v3;
}

- (BOOL)isTranslated
{
  void *v2;
  char v3;

  -[VMUTask processDescription](self, "processDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTranslated");

  return v3;
}

- (_VMURange)taskDyldSharedCacheRange
{
  unint64_t length;
  unint64_t location;
  _VMURange result;

  length = self->_taskDyldSharedCacheRange.length;
  location = self->_taskDyldSharedCacheRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (BOOL)addressIsInSharedCache:(unint64_t)a3
{
  return a3 - self->_taskDyldSharedCacheRange.location < self->_taskDyldSharedCacheRange.length;
}

- (BOOL)hasStartedWithErrorString:(const char *)a3
{
  if (self->_taskType)
    return 1;
  else
    return CSTaskHasStarted();
}

- (BOOL)taskIsSelf
{
  return self->_taskIsSelf;
}

- (id)ioSurfaceDescriptions
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  if (self->_taskType || !objc_opt_class())
    return 0;
  objc_msgSend(MEMORY[0x1E0CBBEA8], "surfaceDescriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__VMUTask_ioSurfaceDescriptions__block_invoke;
  v6[3] = &unk_1E4E02378;
  v5 = v4;
  v7 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

  return v5;
}

void __32__VMUTask_ioSurfaceDescriptions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t i;
  void *v6;
  VMUIOSurfaceDebugDescription *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  VMUIOSurfaceDebugDescription *v16;
  id v18;
  id obj;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v18 = a2;
  v4 = a3;
  v21 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v22)
  {
    v20 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v24 = objc_msgSend(v6, "width");
        v23 = objc_msgSend(v6, "height");
        v7 = [VMUIOSurfaceDebugDescription alloc];
        v8 = objc_msgSend(v6, "virtualAddress");
        v9 = objc_msgSend(v6, "allocationSize");
        v10 = objc_msgSend(v6, "surfaceID");
        v11 = objc_msgSend(v6, "pixelFormat");
        objc_msgSend(v6, "pixelFormatString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v6, "dirtySize");
        v14 = objc_msgSend(v6, "residentSize");
        objc_msgSend(v6, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[VMUIOSurfaceDebugDescription initWithVirtualAddress:allocationSize:surfaceID:pixelFormat:pixelFormatString:width:height:dirtySize:residentSize:name:](v7, "initWithVirtualAddress:allocationSize:surfaceID:pixelFormat:pixelFormatString:width:height:dirtySize:residentSize:name:", v8, v9, v10, v11, v12, v24, v23, v13, v14, v15);

        objc_msgSend(v21, "addObject:", v16);
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v22);
  }

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v21, v18);
}

- (id)processDescription
{
  VMUProcessDescription *v3;
  void *v4;
  VMUProcessDescription *v5;
  VMUProcessDescription *processDescription;

  if (!self->_processDescriptionInitialized)
  {
    self->_processDescriptionInitialized = 1;
    v3 = [VMUProcessDescription alloc];
    -[VMUTask memoryCache](self, "memoryCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[VMUProcessDescription initWithVMUTaskMemoryCache:getBinariesList:](v3, "initWithVMUTaskMemoryCache:getBinariesList:", v4, 1);
    processDescription = self->_processDescription;
    self->_processDescription = v5;

  }
  return self->_processDescription;
}

- (BOOL)isKernel
{
  return -[VMUTaskMemoryCache isKernel](self->_taskMemory, "isKernel");
}

- (BOOL)isExclaveCore
{
  return self->_exclaveType == 1;
}

- (BOOL)isExclaveKit
{
  return self->_exclaveType == 2;
}

- (unint64_t)exclaveType
{
  return self->_exclaveType;
}

- (uint64_t)ptrauthStripDataPointer:(uint64_t)result
{
  uint64_t v2;

  if (result)
  {
    if (*(_QWORD *)(result + 72))
      v2 = *(_QWORD *)(result + 80);
    else
      v2 = -1;
    return v2 & a2;
  }
  return result;
}

- (unint64_t)taskType
{
  return self->_taskType;
}

- (NSString)coreFilePath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

void __VMUTask_enumerate_malloc_blocks_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __VMUTask_enumerate_malloc_blocks_block_invoke_2;
  v8[3] = &unk_1E4E03488;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v9 = v5;
  v10 = v6;
  v13 = *(_DWORD *)(a1 + 56);
  v11 = a2;
  v12 = v7;
  VMUTask_foreach_malloc_zone(v5, v8);

}

uint64_t __VMUTask_enumerate_malloc_blocks_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t (**a3)(uint64_t, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD))
{
  return (*a3)(objc_msgSend(*(id *)(a1 + 32), "taskPort"), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 64), a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

@end
