@implementation HVQueueGuardedData

- (BOOL)diskStorageIsKnownToBeEmpty
{
  return self->_diskStorageIsKnownToBeEmpty;
}

- (NSMutableArray)memoryStorage
{
  return self->_memoryStorage;
}

- (_PASBloomFilterForWriting)diskContentBloomFilter
{
  return self->_diskContentBloomFilter;
}

- (NSMutableSet)dequeuedContentIdentifiers
{
  return self->_dequeuedContentIdentifiers;
}

- (void)setDequeuedCount:(unsigned int)a3
{
  self->_dequeuedCount = a3;
}

- (unsigned)dequeuedCount
{
  return self->_dequeuedCount;
}

- (void)setEnqueuedCount:(unsigned int)a3
{
  self->_enqueuedCount = a3;
}

- (BOOL)isMemoryStorageFull
{
  return (self->_memoryStorageLimit & 0x80000000) == 0
      && -[NSMutableArray count](self->_memoryStorage, "count") >= (unint64_t)self->_memoryStorageLimit;
}

- (unsigned)enqueuedCount
{
  return self->_enqueuedCount;
}

- (BMContentStream)diskStorage
{
  return self->_diskStorage;
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *memoryStorageSigtermSource;
  NSObject *memoryStorageIdleSource;
  uint64_t v6;
  NSMutableArray *memoryStorage;
  objc_super v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  NSMutableArray *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableArray count](self->_memoryStorage, "count"))
  {
    hv_default_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      v6 = -[NSMutableArray count](self->_memoryStorage, "count");
      memoryStorage = self->_memoryStorage;
      *(_DWORD *)buf = 134218243;
      v10 = v6;
      v11 = 2113;
      v12 = memoryStorage;
      _os_log_fault_impl(&dword_21AA1D000, v3, OS_LOG_TYPE_FAULT, "deallocating HVQueueGuardedData with %tu enqueued items (%{private}@) in memory!", buf, 0x16u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria())
      abort();
  }
  if (!self->_memoryStorageTransaction)
  {
    memoryStorageSigtermSource = self->_memoryStorageSigtermSource;
    if (memoryStorageSigtermSource)
      dispatch_resume(memoryStorageSigtermSource);
    memoryStorageIdleSource = self->_memoryStorageIdleSource;
    if (memoryStorageIdleSource)
      dispatch_resume(memoryStorageIdleSource);
  }
  v8.receiver = self;
  v8.super_class = (Class)HVQueueGuardedData;
  -[HVQueueGuardedData dealloc](&v8, sel_dealloc);
}

- (signed)memoryStorageLimit
{
  return self->_memoryStorageLimit;
}

- (OS_os_transaction)memoryStorageTransaction
{
  return self->_memoryStorageTransaction;
}

- (void)setMemoryStorageTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_memoryStorageTransaction, a3);
}

- (OS_dispatch_source)memoryStorageSigtermSource
{
  return self->_memoryStorageSigtermSource;
}

- (OS_dispatch_source)memoryStorageIdleSource
{
  return self->_memoryStorageIdleSource;
}

- (BMSource)diskStorageSource
{
  return self->_diskStorageSource;
}

- (void)setDiskStorageSource:(id)a3
{
  objc_storeStrong((id *)&self->_diskStorageSource, a3);
}

- (HVQueueBookmark)bookmark
{
  return self->_bookmark;
}

- (void)setDiskContentBloomFilter:(id)a3
{
  objc_storeStrong((id *)&self->_diskContentBloomFilter, a3);
}

- (unsigned)diskStorageEventCount
{
  return self->_diskStorageEventCount;
}

- (void)setDiskStorageEventCount:(unsigned int)a3
{
  self->_diskStorageEventCount = a3;
}

- (void)setDiskStorageIsKnownToBeEmpty:(BOOL)a3
{
  self->_diskStorageIsKnownToBeEmpty = a3;
}

- (unsigned)bloomFilterHits
{
  return self->_bloomFilterHits;
}

- (void)setBloomFilterHits:(unsigned int)a3
{
  self->_bloomFilterHits = a3;
}

- (unsigned)bloomFilterMisses
{
  return self->_bloomFilterMisses;
}

- (void)setBloomFilterMisses:(unsigned int)a3
{
  self->_bloomFilterMisses = a3;
}

- (unsigned)bloomFilterFalsePositives
{
  return self->_bloomFilterFalsePositives;
}

- (void)setBloomFilterFalsePositives:(unsigned int)a3
{
  self->_bloomFilterFalsePositives = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskContentBloomFilter, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_diskStorageSource, 0);
  objc_storeStrong((id *)&self->_diskStorage, 0);
  objc_storeStrong((id *)&self->_memoryStorageIdleSource, 0);
  objc_storeStrong((id *)&self->_memoryStorageSigtermSource, 0);
  objc_storeStrong((id *)&self->_memoryStorageTransaction, 0);
  objc_storeStrong((id *)&self->_memoryStorage, 0);
  objc_storeStrong((id *)&self->_dequeuedContentIdentifiers, 0);
}

- (char)initWithBiomeStream:(__int16)a3 memoryLimit:(void *)a4 memoryStorageFlushCallback:
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  dispatch_source_t v17;
  void *v18;
  dispatch_source_t v19;
  void *v20;
  void *v21;
  void *v23;
  objc_super v24;

  v8 = a2;
  v9 = a4;
  if (a1)
  {
    v24.receiver = a1;
    v24.super_class = (Class)HVQueueGuardedData;
    a1 = (char *)objc_msgSendSuper2(&v24, sel_init);
    if (a1)
    {
      v10 = objc_opt_new();
      v11 = (void *)*((_QWORD *)a1 + 5);
      *((_QWORD *)a1 + 5) = v10;

      v12 = objc_opt_new();
      v13 = (void *)*((_QWORD *)a1 + 6);
      *((_QWORD *)a1 + 6) = v12;

      *((_WORD *)a1 + 5) = a3;
      objc_storeStrong((id *)a1 + 10, a2);
      v14 = objc_opt_new();
      v15 = (void *)*((_QWORD *)a1 + 12);
      *((_QWORD *)a1 + 12) = v14;

      a1[8] = 0;
      *(_QWORD *)(a1 + 12) = 0;
      *(_QWORD *)(a1 + 28) = 0;
      *(_QWORD *)(a1 + 20) = 0;
      if (v8)
      {
        if (!v9)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithBiomeStream_memoryLimit_memoryStorageFlushCallback_, a1, CFSTR("HVQueue.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("memoryStorageFlushCallback != nil"));

        }
        if (initWithBiomeStream_memoryLimit_memoryStorageFlushCallback___pasOnceToken2 != -1)
          dispatch_once(&initWithBiomeStream_memoryLimit_memoryStorageFlushCallback___pasOnceToken2, &__block_literal_global_965);
        v16 = (id)initWithBiomeStream_memoryLimit_memoryStorageFlushCallback___pasExprOnceResult;
        v17 = dispatch_source_create(MEMORY[0x24BDACA08], 0xFuLL, 0, v16);
        v18 = (void *)*((_QWORD *)a1 + 8);
        *((_QWORD *)a1 + 8) = v17;

        v19 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v16);
        v20 = (void *)*((_QWORD *)a1 + 9);
        *((_QWORD *)a1 + 9) = v19;

        v21 = (void *)objc_msgSend(v9, "copy");
        dispatch_source_set_event_handler(*((dispatch_source_t *)a1 + 8), v21);
        dispatch_source_set_event_handler(*((dispatch_source_t *)a1 + 9), v21);
        dispatch_activate(*((dispatch_object_t *)a1 + 8));
        dispatch_activate(*((dispatch_object_t *)a1 + 9));
        dispatch_suspend(*((dispatch_object_t *)a1 + 8));
        dispatch_suspend(*((dispatch_object_t *)a1 + 9));

        v9 = v21;
      }
    }
  }

  return a1;
}

void __81__HVQueueGuardedData_initWithBiomeStream_memoryLimit_memoryStorageFlushCallback___block_invoke()
{
  void *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x22074FDF0]();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("HVQueueNotify", v1);

  v3 = (void *)initWithBiomeStream_memoryLimit_memoryStorageFlushCallback___pasExprOnceResult;
  initWithBiomeStream_memoryLimit_memoryStorageFlushCallback___pasExprOnceResult = (uint64_t)v2;

  objc_autoreleasePoolPop(v0);
}

@end
