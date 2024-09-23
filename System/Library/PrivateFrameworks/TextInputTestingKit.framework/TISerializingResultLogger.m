@implementation TISerializingResultLogger

- (TISerializingResultLogger)initWithOutputURL:(id)a3 flushThreshold:(id)a4
{
  id v6;
  id v7;
  TISerializingResultLogger *v8;
  TISerializingResultLogger *v9;
  uint64_t v10;
  uint64_t v11;
  NSURL *partfileURL;
  NSMutableArray *v13;
  NSMutableArray *resultsBuffer;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *logSerializationQueue;
  NSMutableArray *v18;
  NSMutableArray *partfileArchivePathsMutable;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *partfileArchivePathsQueue;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)TISerializingResultLogger;
  v8 = -[TISerializingResultLogger init](&v24, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_partfileCount = 0;
    if (v7)
      v10 = objc_msgSend(v7, "unsignedIntegerValue");
    else
      v10 = 500;
    v9->_flushThreshold = v10;
    objc_msgSend(v6, "URLByAppendingPathExtension:", CFSTR("part"));
    v11 = objc_claimAutoreleasedReturnValue();
    partfileURL = v9->_partfileURL;
    v9->_partfileURL = (NSURL *)v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    resultsBuffer = v9->_resultsBuffer;
    v9->_resultsBuffer = v13;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.autocorrection_tester.LogSerializationQueue", v15);
    logSerializationQueue = v9->_logSerializationQueue;
    v9->_logSerializationQueue = (OS_dispatch_queue *)v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    partfileArchivePathsMutable = v9->_partfileArchivePathsMutable;
    v9->_partfileArchivePathsMutable = v18;

    dispatch_queue_attr_make_with_qos_class(MEMORY[0x24BDAC9C0], QOS_CLASS_DEFAULT, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("com.apple.autocorrection_tester.partfileArchivePathsQueue", v20);
    partfileArchivePathsQueue = v9->_partfileArchivePathsQueue;
    v9->_partfileArchivePathsQueue = (OS_dispatch_queue *)v21;

  }
  return v9;
}

- (NSArray)partfileArchivePaths
{
  void *v2;
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1073;
  v9 = __Block_byref_object_dispose__1074;
  v10 = 0;
  -[TISerializingResultLogger partfileArchivePathsQueue](self, "partfileArchivePathsQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIDispatchSync();

  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v3;
}

- (id)currentPartfileArchivePath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v13;

  -[TISerializingResultLogger partfileURL](self, "partfileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), -[TISerializingResultLogger partfileCount](self, "partfileCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  ++self->_partfileCount;
  -[TISerializingResultLogger partfileArchivePathsQueue](self, "partfileArchivePathsQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__TISerializingResultLogger_currentPartfileArchivePath__block_invoke;
  block[3] = &unk_24FD48890;
  block[4] = self;
  v8 = v6;
  v13 = v8;
  dispatch_barrier_sync(v7, block);

  v9 = v13;
  v10 = v8;

  return v10;
}

- (void)addResult:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TISerializingResultLogger resultsBuffer](self, "resultsBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  if (-[TISerializingResultLogger bufferFull](self, "bufferFull"))
    -[TISerializingResultLogger flushBufferWithCompletionHandler:](self, "flushBufferWithCompletionHandler:", 0);
}

- (BOOL)bufferFull
{
  TISerializingResultLogger *v2;
  void *v3;
  unint64_t v4;

  v2 = self;
  -[TISerializingResultLogger resultsBuffer](self, "resultsBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  LOBYTE(v2) = v4 >= -[TISerializingResultLogger flushThreshold](v2, "flushThreshold");

  return (char)v2;
}

- (BOOL)bufferEmpty
{
  void *v2;
  BOOL v3;

  -[TISerializingResultLogger resultsBuffer](self, "resultsBuffer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (void)flushBufferWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *resultsBuffer;
  void *v8;
  id v9;
  id v10;
  void *v11;

  v4 = a3;
  -[TISerializingResultLogger resultsBuffer](self, "resultsBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  resultsBuffer = self->_resultsBuffer;
  self->_resultsBuffer = v6;

  -[TISerializingResultLogger logSerializationQueue](self, "logSerializationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4;
  v9 = v4;
  v10 = v5;
  TIDispatchAsync();

}

- (void)serializeResultsArray:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  v6 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TISerializingResultLogger currentPartfileArchivePath](self, "currentPartfileArchivePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeToFile:atomically:", v5, 1);

  }
}

- (id)allResults
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  dispatch_semaphore_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (!-[TISerializingResultLogger bufferEmpty](self, "bufferEmpty"))
  {
    v3 = dispatch_semaphore_create(0);
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __39__TISerializingResultLogger_allResults__block_invoke;
    v26[3] = &unk_24FD488E0;
    v27 = v3;
    v4 = v3;
    -[TISerializingResultLogger flushBufferWithCompletionHandler:](self, "flushBufferWithCompletionHandler:", v26);
    dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  }
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[TISerializingResultLogger partfileArchivePaths](self, "partfileArchivePaths");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x2348A8D30]();
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x24BDBCF20];
        v14 = objc_opt_class();
        v15 = objc_opt_class();
        v16 = objc_opt_class();
        objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v17, v12, &v21);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v18);

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v7);
  }

  return v5;
}

- (unint64_t)partfileCount
{
  return self->_partfileCount;
}

- (unint64_t)flushThreshold
{
  return self->_flushThreshold;
}

- (NSMutableArray)partfileArchivePathsMutable
{
  return self->_partfileArchivePathsMutable;
}

- (OS_dispatch_queue)partfileArchivePathsQueue
{
  return self->_partfileArchivePathsQueue;
}

- (NSMutableArray)resultsBuffer
{
  return self->_resultsBuffer;
}

- (OS_dispatch_queue)logSerializationQueue
{
  return self->_logSerializationQueue;
}

- (NSURL)partfileURL
{
  return self->_partfileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partfileURL, 0);
  objc_storeStrong((id *)&self->_logSerializationQueue, 0);
  objc_storeStrong((id *)&self->_resultsBuffer, 0);
  objc_storeStrong((id *)&self->_partfileArchivePathsQueue, 0);
  objc_storeStrong((id *)&self->_partfileArchivePathsMutable, 0);
}

intptr_t __39__TISerializingResultLogger_allResults__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __62__TISerializingResultLogger_flushBufferWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "serializeResultsArray:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __55__TISerializingResultLogger_currentPartfileArchivePath__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "partfileArchivePathsMutable");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

void __49__TISerializingResultLogger_partfileArchivePaths__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
