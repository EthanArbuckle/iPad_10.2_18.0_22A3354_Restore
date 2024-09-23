@implementation PowerUIPagedArray

- (PowerUIPagedArray)initWithChunkSize:(int64_t)a3 chunkGetter:(id)a4
{
  id v6;
  PowerUIPagedArray *v7;
  PowerUIPagedArray *v8;
  uint64_t v9;
  id getChunkHandler;
  os_log_t v11;
  OS_os_log *log;
  uint64_t v13;
  NSMutableDictionary *chunks;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PowerUIPagedArray;
  v7 = -[PowerUIPagedArray init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_chunkSize = a3;
    v9 = MEMORY[0x2199EC2D0](v6);
    getChunkHandler = v8->_getChunkHandler;
    v8->_getChunkHandler = (id)v9;

    v11 = os_log_create("com.apple.powerui.smartcharging", "utilities.pagedarray");
    log = v8->_log;
    v8->_log = (OS_os_log *)v11;

    *(_OWORD *)&v8->_endChunkIndex = xmmword_215B39250;
    *(_OWORD *)&v8->_highestIndexInMemory = xmmword_215B39260;
    v13 = objc_opt_new();
    chunks = v8->_chunks;
    v8->_chunks = (NSMutableDictionary *)v13;

    -[PowerUIPagedArray loadChunk:](v8, "loadChunk:", 0);
  }

  return v8;
}

- (id)objectAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  int64_t endChunkIndex;
  void *v10;

  v5 = (void *)MEMORY[0x2199EC15C](self, a2);
  if (-[PowerUIPagedArray isIndexInMemory:](self, "isIndexInMemory:", a3))
  {
    -[PowerUIPagedArray retrieveElementFromMemoryAtIndex:](self, "retrieveElementFromMemoryAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a3 / self->_chunkSize;
    self->_currentChunkIndex = v7;
    v8 = v7 + 1;
    endChunkIndex = self->_endChunkIndex;
    -[PowerUIPagedArray chunkArrayForIndex:](self, "chunkArrayForIndex:", v7 + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 < endChunkIndex && v10 == 0)
      -[PowerUIPagedArray loadChunk:](self, "loadChunk:", v8);
  }
  else
  {
    v6 = 0;
  }
  objc_autoreleasePoolPop(v5);
  return v6;
}

- (void)loadChunk:(int64_t)a3
{
  void *v5;
  NSMutableDictionary *chunks;
  void *v7;
  NSObject *log;
  int64_t chunkSize;
  int64_t numberOfQueries;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  int64_t v18;
  int64_t v19;
  NSObject *v20;
  void *v21;
  int64_t endChunkIndex;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  int64_t v27;
  __int16 v28;
  int64_t v29;
  __int16 v30;
  int64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x2199EC15C](self, a2);
  chunks = self->_chunks;
  -[PowerUIPagedArray keyForChunkIndex:](self, "keyForChunkIndex:", a3 - 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](chunks, "removeObjectForKey:", v7);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    chunkSize = self->_chunkSize;
    numberOfQueries = self->_numberOfQueries;
    v26 = 134218496;
    v27 = a3;
    v28 = 2048;
    v29 = chunkSize;
    v30 = 2048;
    v31 = numberOfQueries;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Querying for chunk at %lu of size %lu, total queries so far %lu", (uint8_t *)&v26, 0x20u);
  }
  (*((void (**)(void))self->_getChunkHandler + 2))();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)MEMORY[0x24BDD16E0];
    v14 = v12;
    objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138412290;
    v27 = (int64_t)v15;
    _os_log_impl(&dword_215A71000, v14, OS_LOG_TYPE_DEFAULT, "Received chunk of size %@", (uint8_t *)&v26, 0xCu);

  }
  if (objc_msgSend(v11, "count"))
  {
    ++self->_numberOfQueries;
    v16 = self->_chunks;
    -[PowerUIPagedArray keyForChunkIndex:](self, "keyForChunkIndex:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v11, v17);

    v18 = self->_chunkSize;
    v19 = objc_msgSend(v11, "count") + v18 * a3 - 1;
    if (self->_highestIndexInMemory < v19)
      self->_highestIndexInMemory = v19;
  }
  if (objc_msgSend(v11, "count") != self->_chunkSize)
  {
    self->_endChunkIndex = a3;
    v20 = self->_log;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)MEMORY[0x24BDD16E0];
      endChunkIndex = self->_endChunkIndex;
      v23 = v20;
      objc_msgSend(v21, "numberWithLong:", endChunkIndex);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -[PowerUIPagedArray countDynamic](self, "countDynamic"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412546;
      v27 = (int64_t)v24;
      v28 = 2112;
      v29 = (int64_t)v25;
      _os_log_impl(&dword_215A71000, v23, OS_LOG_TYPE_DEFAULT, "Marking chunk as end of stream, chunk: %@, countDynamic: %@", (uint8_t *)&v26, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v5);
}

- (BOOL)isIndexInMemory:(int64_t)a3
{
  return a3 >= 0 && self->_highestIndexInMemory >= a3;
}

- (int64_t)countDynamic
{
  return self->_highestIndexInMemory + 1;
}

- (id)keyForChunkIndex:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), a3);
}

- (id)chunkArrayForIndex:(int64_t)a3
{
  NSMutableDictionary *chunks;
  void *v4;
  void *v5;

  chunks = self->_chunks;
  -[PowerUIPagedArray keyForChunkIndex:](self, "keyForChunkIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](chunks, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)retrieveElementFromMemoryAtIndex:(int64_t)a3
{
  int64_t chunkSize;
  int64_t v4;
  void *v5;
  void *v6;

  chunkSize = self->_chunkSize;
  v4 = a3 % chunkSize;
  -[PowerUIPagedArray chunkArrayForIndex:](self, "chunkArrayForIndex:", a3 / chunkSize);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\nCache Index: %lu\nHighest Index: %lu\nQueries: %lu\nCache: %@"), self->_currentChunkIndex, self->_highestIndexInMemory, self->_numberOfQueries, self->_chunks);
}

- (NSMutableDictionary)chunks
{
  return self->_chunks;
}

- (id)getChunkHandler
{
  return self->_getChunkHandler;
}

- (int64_t)chunkSize
{
  return self->_chunkSize;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (int64_t)endChunkIndex
{
  return self->_endChunkIndex;
}

- (void)setEndChunkIndex:(int64_t)a3
{
  self->_endChunkIndex = a3;
}

- (int64_t)currentChunkIndex
{
  return self->_currentChunkIndex;
}

- (void)setCurrentChunkIndex:(int64_t)a3
{
  self->_currentChunkIndex = a3;
}

- (int64_t)highestIndexInMemory
{
  return self->_highestIndexInMemory;
}

- (void)setHighestIndexInMemory:(int64_t)a3
{
  self->_highestIndexInMemory = a3;
}

- (int64_t)numberOfQueries
{
  return self->_numberOfQueries;
}

- (void)setNumberOfQueries:(int64_t)a3
{
  self->_numberOfQueries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong(&self->_getChunkHandler, 0);
  objc_storeStrong((id *)&self->_chunks, 0);
}

@end
