@implementation IMFileWatcherEntry

- (IMFileWatcherEntry)initWithQueue:(id)a3 andBlock:(id)a4
{
  id v7;
  id v8;
  IMFileWatcherEntry *v9;
  IMFileWatcherEntry *v10;
  id v11;
  id block;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMFileWatcherEntry;
  v9 = -[IMFileWatcherEntry init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    v11 = objc_msgSend(v8, "copy");
    block = v10->_block;
    v10->_block = v11;

  }
  return v10;
}

- (void)invalidate
{
  id block;

  block = self->_block;
  self->_block = 0;

}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_filePath, "hash");
  v4 = (unint64_t)-[NSOperationQueue hash](self->_queue, "hash") ^ v3;
  return v4 ^ (unint64_t)objc_msgSend(self->_block, "hash");
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
