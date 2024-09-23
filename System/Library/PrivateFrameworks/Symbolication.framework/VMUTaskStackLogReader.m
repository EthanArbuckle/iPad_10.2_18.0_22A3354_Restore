@implementation VMUTaskStackLogReader

- (VMUTaskStackLogReader)initWithTask:(unsigned int)a3 symbolicator:(_CSTypeRef)a4
{
  VMUTaskStackLogReader *v4;
  uint64_t v5;
  VMUTaskStackLogReader *v6;
  unint64_t v7;
  VMUProcInfo *v8;
  id v9;
  const char *v10;
  mach_vm_address_t Range;
  VMUTaskStackLogReader *v12;
  objc_super v14;
  char __str[8];
  uint64_t v16;

  v4 = self;
  v16 = *MEMORY[0x1E0C80C00];
  if (!MEMORY[0x1E0D46E70])
    goto LABEL_21;
  v5 = *(_QWORD *)&a3;
  v14.receiver = self;
  v14.super_class = (Class)VMUTaskStackLogReader;
  v6 = -[VMUTaskStackLogReader init](&v14, sel_init);
  v4 = v6;
  if (!v6)
  {
LABEL_23:
    v4 = v4;
    v12 = v4;
    goto LABEL_24;
  }
  v6->super._task = v5;
  v6->super._usesLiteMode = 0;
  v6->super._symbolicator._opaque_1 = CSRetain();
  v4->super._symbolicator._opaque_2 = v7;
  if (CSIsNull())
  {
    CSSymbolicatorGetFlagsForNListOnlyData();
    CSSymbolicatorCreateWithTaskFlagsAndNotification();
  }
  else
  {
    CSRetain();
  }
  if (CSIsNull())
  {
    NSLog(CFSTR("*** getStackLoggingSharedMemoryAddressFromTask: can't get target task symbolicator\n"));
    goto LABEL_20;
  }
  CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  if (CSIsNull())
  {
    v8 = -[VMUProcInfo initWithTask:]([VMUProcInfo alloc], "initWithTask:", v5);
    -[VMUProcInfo valueForEnvVar:](v8, "valueForEnvVar:", CFSTR("DYLD_IMAGE_SUFFIX"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");

    if (v10)
    {
      snprintf(__str, 0x7FuLL, "libsystem_malloc%s.dylib", v10);
      CSSymbolicatorGetSymbolOwnerWithNameAtTime();
    }
    if (CSIsNull())
    {
      NSLog(CFSTR("*** getStackLoggingSharedMemoryAddressFromTask: couldn't find libsystem_malloc dylib in target task\n"));
      CSRelease();

      goto LABEL_20;
    }

  }
  CSSymbolOwnerGetSymbolWithMangledName();
  Range = CSSymbolGetRange();
  if (Range)
  {
    task_start_peeking();
    *(_QWORD *)__str = 0;
    if (task_peek(v5, Range, 8uLL, (mach_vm_address_t *)__str))
      NSLog(CFSTR("*** getStackLoggingSharedMemoryAddressFromTask: task_peek failed for shared_memory_address_address\n"));
    task_stop_peeking();
  }
  else
  {
    NSLog(CFSTR("*** getStackLoggingSharedMemoryAddressFromTask: couldn't find ___mach_stack_logging_shared_memory_address in target task\n"));
  }
  CSRelease();
LABEL_20:
  *(_DWORD *)__str = 0;
  if (!msl_start_reading())
  {
    v4->super._usesLiteMode = *(_DWORD *)__str != 0;
    v4->_msl_payload_version = msl_payload_version_from_task();
    v4->super._coldestFrameIsNotThreadId = msl_coldest_frame_is_threadid() == 0;
    goto LABEL_23;
  }
LABEL_21:
  v12 = 0;
LABEL_24:

  return v12;
}

- (VMUTaskStackLogReader)initWithTask:(unsigned int)a3
{
  return -[VMUTaskStackLogReader initWithTask:symbolicator:](self, "initWithTask:symbolicator:", *(_QWORD *)&a3, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  if (MEMORY[0x1E0D46E78])
    msl_stop_reading();
  CSRelease();
  v3.receiver = self;
  v3.super_class = (Class)VMUTaskStackLogReader;
  -[VMUTaskStackLogReader dealloc](&v3, sel_dealloc);
}

- (BOOL)is64bit
{
  return 1;
}

- (BOOL)inspectingLiveProcess
{
  return 1;
}

- (VMUVMRegionTracker)regionTracker
{
  VMUVMRegionTracker *regionTracker;
  VMUVMRegionTracker *v4;
  VMUVMRegionTracker *v5;

  regionTracker = self->super._regionTracker;
  if (!regionTracker)
  {
    v4 = -[VMUVMRegionTracker initWithStackLogReader:]([VMUVMRegionTracker alloc], "initWithStackLogReader:", self);
    v5 = self->super._regionTracker;
    self->super._regionTracker = v4;

    regionTracker = self->super._regionTracker;
  }
  return regionTracker;
}

- ($61A80719B04F7407D3E47539F1B23CAA)liteMSLPayloadforMallocAddress:(unint64_t)a3 size:(unint64_t)a4
{
  uint64_t v4;
  mach_vm_address_t v6;

  if (a3 && a4)
  {
    v6 = 0;
    v4 = task_peek(self->super._task, a3, a4, &v6);
    if ((_DWORD)v4)
    {
      NSLog(CFSTR("*** -[VMUTaskStackLogReader liteMSLPayloadforMallocAddress:size:] error %d from task_peek\n"), v4);
      return ($61A80719B04F7407D3E47539F1B23CAA)msl_payload_get_invalid();
    }
    else
    {
      return ($61A80719B04F7407D3E47539F1B23CAA)msl_payload_from_lite_zone_ptr();
    }
  }
  else
  {
    return ($61A80719B04F7407D3E47539F1B23CAA)msl_payload_get_invalid();
  }
}

- ($61A80719B04F7407D3E47539F1B23CAA)liteMSLPayloadforVMregionAddress:(unint64_t)a3
{
  if (a3)
    return ($61A80719B04F7407D3E47539F1B23CAA)msl_payload_for_vm_region_in_task();
  else
    return ($61A80719B04F7407D3E47539F1B23CAA)msl_payload_get_invalid();
}

- (int64_t)getFramesForNode:(unsigned int)a3 inLiteZone:(BOOL)a4 stackFramesBuffer:(unint64_t *)a5
{
  _BOOL8 v6;
  uint64_t v7;
  id WeakRetained;
  void *v10;

  v6 = a4;
  v7 = *(_QWORD *)&a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
  v10 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "nodeDetails:", v7);

  if (!VMUGraphNodeType_IsVMRegion(0))
    return 0;
  if (!self->super._usesLiteMode || !VMUGraphNodeType_IsVMRegion(0))
    return -[VMUTaskStackLogReader getFramesForAddress:size:inLiteZone:stackFramesBuffer:](self, "getFramesForAddress:size:inLiteZone:stackFramesBuffer:", 0, 0, v6, a5);
  -[VMUTaskStackLogReader liteMSLPayloadforVMregionAddress:](self, "liteMSLPayloadforVMregionAddress:", 0);
  if (msl_payload_get_uniquing_table_index() == -1)
    return 0;
  if (msl_uniquing_table_get_frames_from_task())
    return 0;
  else
    return 0;
}

- (int64_t)getFramesForAddress:(unint64_t)a3 size:(unint64_t)a4 inLiteZone:(BOOL)a5 stackFramesBuffer:(unint64_t *)a6
{
  if (!a5)
  {
    msl_get_frames_for_address();
    return 0;
  }
  -[VMUTaskStackLogReader liteMSLPayloadforMallocAddress:size:](self, "liteMSLPayloadforMallocAddress:size:", a3, a4, a5, a6);
  if (msl_payload_get_uniquing_table_index() != -1)
  {
    msl_uniquing_table_get_frames_from_task();
    return 0;
  }
  return 0;
}

- (int64_t)getFramesForStackID:(unint64_t)a3 stackFramesBuffer:(unint64_t *)a4
{
  msl_uniquing_table_get_frames_from_task();
  return 0;
}

- (int)enumerateMSLRecordsAndPayloads:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t task;
  id v10;
  $61A80719B04F7407D3E47539F1B23CAA v11;
  int v12;
  id v14;
  mach_vm_size_t size;
  natural_t nesting_depth;
  mach_msg_type_number_t infoCnt;
  int info[4];
  __int128 v19;
  __int128 v20;
  mach_vm_address_t address;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v4 = a3;
  v5 = v4;
  if (self->super._usesLiteMode)
  {
    task_start_peeking();
    v6 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __56__VMUTaskStackLogReader_enumerateMSLRecordsAndPayloads___block_invoke;
    v24[3] = &unk_1E4E01CC8;
    v24[4] = self;
    v7 = v5;
    v25 = v7;
    v8 = (void *)MEMORY[0x1A85A995C](v24);
    task = self->super._task;
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __56__VMUTaskStackLogReader_enumerateMSLRecordsAndPayloads___block_invoke_2;
    v22[3] = &unk_1E4E01CF0;
    v22[4] = self;
    v10 = v8;
    v23 = v10;
    task_foreach_malloc_zone(task, v22);
    address = 0;
    v19 = 0u;
    v20 = 0u;
    *(_OWORD *)info = 0u;
    nesting_depth = 0;
    infoCnt = 12;
    for (size = 0;
          !mach_vm_region_recurse(self->super._task, &address, &size, &nesting_depth, info, &infoCnt);
          size = 0)
    {
      if (!(_DWORD)v20)
      {
        v11.var0 = (unint64_t)-[VMUTaskStackLogReader liteMSLPayloadforVMregionAddress:](self, "liteMSLPayloadforVMregionAddress:", address);
        if (!msl_payload_is_invalid())
          (*((void (**)(id, _QWORD, mach_vm_address_t, mach_vm_size_t, $61A80719B04F7407D3E47539F1B23CAA))v7
           + 2))(v7, (DWORD1(v19) << 24) | 0x10u, address, size, v11);
      }
      address += size;
      v19 = 0u;
      v20 = 0u;
      *(_OWORD *)info = 0u;
      nesting_depth = 0;
      infoCnt = 12;
    }
    task_stop_peeking();

    v12 = 0;
  }
  else
  {
    v14 = v4;
    v12 = msl_disk_stack_logs_enumerate_from_task_with_block();

  }
  return v12;
}

uint64_t __56__VMUTaskStackLogReader_enumerateMSLRecordsAndPayloads___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  if (a4)
  {
    v4 = result;
    v5 = a4;
    v6 = (_QWORD *)(a3 + 8);
    do
    {
      objc_msgSend(*(id *)(v4 + 32), "liteMSLPayloadforMallocAddress:size:", *(v6 - 1), *v6);
      result = (*(uint64_t (**)(void))(*(_QWORD *)(v4 + 40) + 16))();
      v6 += 2;
      --v5;
    }
    while (v5);
  }
  return result;
}

uint64_t __56__VMUTaskStackLogReader_enumerateMSLRecordsAndPayloads___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t (**a3)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t (*)(vm_map_read_t a1, mach_vm_address_t a2, mach_vm_size_t a3, mach_vm_address_t *a4), uint64_t (*)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)), void *a4)
{
  id v7;
  uint64_t v8;

  v7 = a4;
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("MallocStackLoggingLiteZone"))
    && (objc_msgSend(v7, "hasPrefix:", CFSTR("MallocStackLoggingLiteZone_Wrapper")) & 1) == 0)
  {
    v8 = (*a3)(*(unsigned int *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 40), 1, a2, task_peek_natural_size, zoneEnumeratorBlockAdapter);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __56__VMUTaskStackLogReader_enumerateMSLRecordsAndPayloads___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)vmuVMRegionForAddress:(unint64_t)a3
{
  return 0;
}

- (unint64_t)nodesInUniquingTable
{
  unint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = msl_uniquing_table_copy_from_task();
  if (v2)
  {
    v4 = 0;
    v5 = &v4;
    v6 = 0x2020000000;
    v7 = 0;
    msl_uniquing_table_enumerate();
    MEMORY[0x1A85A9710](v2);
    v2 = v5[3];
    _Block_object_dispose(&v4, 8);
  }
  return v2;
}

uint64_t __45__VMUTaskStackLogReader_nodesInUniquingTable__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (VMUTaskMemoryScanner)scanner
{
  return (VMUTaskMemoryScanner *)objc_loadWeakRetained((id *)&self->_scanner);
}

- (void)setScanner:(id)a3
{
  objc_storeWeak((id *)&self->_scanner, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scanner);
}

@end
