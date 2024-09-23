@implementation PETAggregateStateStorageInMemory

- (PETAggregateStateStorageInMemory)init
{
  PETAggregateStateStorageInMemory *v2;
  uint64_t v3;
  NSMutableData *data;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PETAggregateStateStorageInMemory;
  v2 = -[PETAggregateStateStorageInMemory init](&v6, sel_init);
  if (v2)
  {
    createBlankStorage();
    v3 = objc_claimAutoreleasedReturnValue();
    data = v2->_data;
    v2->_data = (NSMutableData *)v3;

    pthread_mutex_init(&v2->_lock, 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)PETAggregateStateStorageInMemory;
  -[PETAggregateStateStorageInMemory dealloc](&v3, sel_dealloc);
}

- (void)expand:(unint64_t)a3 andRunWithLock:(id)a4
{
  uint64_t (**v7)(id, void *, NSUInteger, NSUInteger, _BYTE *);
  NSUInteger v8;
  char v9;
  NSMutableData *v10;
  NSMutableData *data;
  void *v12;
  char v13;

  v7 = (uint64_t (**)(id, void *, NSUInteger, NSUInteger, _BYTE *))a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PETAggregateStateStorage.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  pthread_mutex_lock(&self->_lock);
  if (a3)
  {
    v8 = -[NSMutableData length](self->_data, "length");
    -[NSMutableData increaseLengthBy:](self->_data, "increaseLengthBy:", a3);
  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v13 = 0;
  v9 = v7[2](v7, -[NSMutableData mutableBytes](self->_data, "mutableBytes"), -[NSMutableData length](self->_data, "length"), v8, &v13);
  if (a3 && (v9 & 1) == 0)
    -[NSMutableData replaceBytesInRange:withBytes:length:](self->_data, "replaceBytesInRange:withBytes:length:", -[NSMutableData length](self->_data, "length") - a3, a3, 0, 0);
  if (v13)
  {
    createBlankStorage();
    v10 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
    data = self->_data;
    self->_data = v10;

  }
  pthread_mutex_unlock(&self->_lock);

}

- (BOOL)resetLocked
{
  NSMutableData *v3;
  NSMutableData *data;

  createBlankStorage();
  v3 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
  data = self->_data;
  self->_data = v3;

  return 1;
}

- (void)reset
{
  _opaque_pthread_mutex_t *p_lock;
  NSMutableData *v4;
  NSMutableData *data;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  createBlankStorage();
  v4 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
  data = self->_data;
  self->_data = v4;

  pthread_mutex_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
