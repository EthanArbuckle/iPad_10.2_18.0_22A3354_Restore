@implementation UAFileChunkInputStream

- (UAFileChunkInputStream)initWithFileHandle:(id)a3 offsetInFile:(id)a4 size:(int64_t)a5
{
  id v8;
  id v9;
  UAFileChunkInputStream *v10;
  UAFileChunkInputStream *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UAFileChunkInputStream;
  v10 = -[UAFileChunkInputStream init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[UAFileChunkInputStream setFile:](v10, "setFile:", v8);
    -[UAFileChunkInputStream setChunkOffset:](v11, "setChunkOffset:", v9);
    -[UAFileChunkInputStream setChunkSize:](v11, "setChunkSize:", a5);
    -[UAFileChunkInputStream setCurrentOffset:](v11, "setCurrentOffset:", v9);
    -[UAFileChunkInputStream setReadSize:](v11, "setReadSize:", 0);
    -[UAFileChunkInputStream setStatus:](v11, "setStatus:", 0);
  }

  return v11;
}

- (BOOL)hasBytesAvailable
{
  unint64_t v3;
  int64_t v5;

  v3 = -[UAFileChunkInputStream status](self, "status");
  if (v3 > 3 || v3 == 1)
    return 0;
  v5 = -[UAFileChunkInputStream readSize](self, "readSize");
  return v5 < -[UAFileChunkInputStream chunkSize](self, "chunkSize");
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  int64_t v7;
  int64_t v8;
  int64_t v9;
  size_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  ssize_t v19;
  void *v20;

  if (-[UAFileChunkInputStream status](self, "status") == 5
    || -[UAFileChunkInputStream status](self, "status") == 6
    || -[UAFileChunkInputStream status](self, "status") == 7)
  {
    return 0;
  }
  v7 = -[UAFileChunkInputStream readSize](self, "readSize");
  if (v7 >= -[UAFileChunkInputStream chunkSize](self, "chunkSize"))
  {
    -[UAFileChunkInputStream setStatus:](self, "setStatus:", 5);
    return 0;
  }
  -[UAFileChunkInputStream setStatus:](self, "setStatus:", 3);
  v8 = -[UAFileChunkInputStream chunkSize](self, "chunkSize");
  v9 = -[UAFileChunkInputStream readSize](self, "readSize");
  if (v8 - v9 >= a4)
    v10 = a4;
  else
    v10 = v8 - v9;
  -[UAFileChunkInputStream file](self, "file");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v11);
  -[UAFileChunkInputStream currentOffset](self, "currentOffset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedLongLongValue");

  -[UAFileChunkInputStream file](self, "file");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "offsetInFile");

  if (v13 != v15)
  {
    -[UAFileChunkInputStream file](self, "file");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "seekToFileOffset:", v13);

  }
  -[UAFileChunkInputStream file](self, "file");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "fileDescriptor");

  v19 = read(v18, a3, v10);
  -[UAFileChunkInputStream setReadSize:](self, "setReadSize:", -[UAFileChunkInputStream readSize](self, "readSize") + v19);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v19 + v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFileChunkInputStream setCurrentOffset:](self, "setCurrentOffset:", v20);

  if (a4 && !v19)
  {
    -[UAFileChunkInputStream setStatus:](self, "setStatus:", 5);
    -[UAFileChunkInputStream setReadSize:](self, "setReadSize:", -[UAFileChunkInputStream chunkSize](self, "chunkSize"));
    v19 = 0;
  }
  objc_sync_exit(v11);

  return v19;
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (id)propertyForKey:(id)a3
{
  return 0;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return 0;
}

- (void)open
{
  if (-[UAFileChunkInputStream status](self, "status") != 6)
    -[UAFileChunkInputStream setStatus:](self, "setStatus:", 2);
}

- (void)close
{
  -[UAFileChunkInputStream setStatus:](self, "setStatus:", 6);
}

- (id)streamError
{
  return 0;
}

- (NSFileHandle)file
{
  return (NSFileHandle *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSNumber)chunkOffset
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setChunkOffset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (int64_t)chunkSize
{
  return self->_chunkSize;
}

- (void)setChunkSize:(int64_t)a3
{
  self->_chunkSize = a3;
}

- (NSNumber)currentOffset
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCurrentOffset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (int64_t)readSize
{
  return self->_readSize;
}

- (void)setReadSize:(int64_t)a3
{
  self->_readSize = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentOffset, 0);
  objc_storeStrong((id *)&self->_chunkOffset, 0);
  objc_storeStrong((id *)&self->_file, 0);
}

@end
