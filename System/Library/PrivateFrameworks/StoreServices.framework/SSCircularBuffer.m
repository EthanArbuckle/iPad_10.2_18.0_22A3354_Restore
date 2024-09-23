@implementation SSCircularBuffer

- (SSCircularBuffer)init
{
  return -[SSCircularBuffer initWithMaxSize:](self, "initWithMaxSize:", 10);
}

- (SSCircularBuffer)initWithMaxSize:(unint64_t)a3
{
  SSCircularBuffer *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *accessQueue;
  uint64_t v7;
  NSMutableArray *buffer;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SSCircularBuffer;
  v4 = -[SSCircularBuffer init](&v10, sel_init);
  if (v4)
  {
    v5 = dispatch_queue_create("com.apple.StoreServices.SSCircularBuffer", 0);
    accessQueue = v4->_accessQueue;
    v4->_accessQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
    buffer = v4->_buffer;
    v4->_buffer = (NSMutableArray *)v7;

    v4->_currentIndex = 0;
    v4->_maxSize = a3;
  }
  return v4;
}

- (unint64_t)count
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[SSCircularBuffer accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __25__SSCircularBuffer_count__block_invoke;
  v6[3] = &unk_1E47B8680;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __25__SSCircularBuffer_count__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "buffer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (unint64_t)maxSize
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[SSCircularBuffer accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__SSCircularBuffer_maxSize__block_invoke;
  v6[3] = &unk_1E47B8680;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __27__SSCircularBuffer_maxSize__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (void)setMaxSize:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[5];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  -[SSCircularBuffer accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__SSCircularBuffer_setMaxSize___block_invoke;
  v6[3] = &unk_1E47BAB68;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  v6[4] = self;
  dispatch_async(v5, v6);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __31__SSCircularBuffer_setMaxSize___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  unint64_t i;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48) != *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v11 = WeakRetained;
    objc_msgSend(WeakRetained, "_flush");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");
    for (i = (v4 - *(_QWORD *)(a1 + 48)) & ~((v4 - *(_QWORD *)(a1 + 48)) >> 63); i < objc_msgSend(v3, "count"); ++i)
    {
      objc_msgSend(v11, "buffer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

    }
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    if (v8 > *(_QWORD *)(v9 + 8))
    {
      objc_msgSend(v11, "buffer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCurrentIndex:", objc_msgSend(v10, "count"));

      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 32);
    }
    *(_QWORD *)(v9 + 8) = v8;

    WeakRetained = v11;
  }

}

- (void)addObject:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SSCircularBuffer accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__SSCircularBuffer_addObject___block_invoke;
  v7[3] = &unk_1E47BAB90;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __30__SSCircularBuffer_addObject___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = objc_msgSend(WeakRetained, "currentIndex");
    objc_msgSend(WeakRetained, "buffer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v2 < v4)
    {
      objc_msgSend(WeakRetained, "buffer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObjectAtIndex:", v2);

    }
    objc_msgSend(WeakRetained, "buffer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertObject:atIndex:", *(_QWORD *)(a1 + 40), v2);

    if (v2 + 1 < *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
      v7 = v2 + 1;
    else
      v7 = 0;
    objc_msgSend(WeakRetained, "setCurrentIndex:", v7);
  }

}

- (id)allObjects
{
  NSObject *v3;
  void *v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__51;
  v15 = __Block_byref_object_dispose__51;
  v16 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  -[SSCircularBuffer accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SSCircularBuffer_allObjects__block_invoke;
  block[3] = &unk_1E47BD7A8;
  block[4] = self;
  block[5] = &v11;
  block[6] = &v7;
  dispatch_sync(v3, block);

  objc_msgSend((id)objc_opt_class(), "_rearrangeObjects:forCurrentIndex:", v12[5], v8[3]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

  return v4;
}

uint64_t __30__SSCircularBuffer_allObjects__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "buffer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  result = objc_msgSend(*(id *)(a1 + 32), "currentIndex");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)flush
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__51;
  v11 = __Block_byref_object_dispose__51;
  v12 = 0;
  -[SSCircularBuffer accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __25__SSCircularBuffer_flush__block_invoke;
  v6[3] = &unk_1E47B8680;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __25__SSCircularBuffer_flush__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_flush");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)description
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__51;
  v11 = __Block_byref_object_dispose__51;
  v12 = 0;
  -[SSCircularBuffer accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__SSCircularBuffer_description__block_invoke;
  v6[3] = &unk_1E47B8680;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __31__SSCircularBuffer_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "buffer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_flush
{
  NSObject *v3;
  void *v4;
  unint64_t v5;
  id v6;
  void *v7;

  -[SSCircularBuffer accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SSCircularBuffer buffer](self, "buffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SSCircularBuffer currentIndex](self, "currentIndex");
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SSCircularBuffer setBuffer:](self, "setBuffer:", v6);

  -[SSCircularBuffer setCurrentIndex:](self, "setCurrentIndex:", 0);
  objc_msgSend((id)objc_opt_class(), "_rearrangeObjects:forCurrentIndex:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_rearrangeObjects:(id)a3 forCurrentIndex:(unint64_t)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    do
    {
      if (a4 == objc_msgSend(v5, "count"))
        a4 = 0;
      objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v8);

      ++a4;
      ++v7;
    }
    while (v7 < objc_msgSend(v5, "count"));
  }

  return v6;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (unint64_t)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(unint64_t)a3
{
  self->_currentIndex = a3;
}

- (NSMutableArray)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_buffer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
