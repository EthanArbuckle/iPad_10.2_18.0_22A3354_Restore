@implementation _PLServerTransaction

- (_PLServerTransaction)initWithPathManager:(id)a3 identifier:(const char *)a4
{
  _PLServerTransaction *v4;
  uint64_t v5;
  NSCountedSet *enqueuedChangeScopes;
  dispatch_queue_t v7;
  OS_dispatch_queue *changeScopeQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_PLServerTransaction;
  v4 = -[_PLClientTransaction initWithPathManager:identifier:](&v10, sel_initWithPathManager_identifier_, a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3550]), "initWithCapacity:", 8);
    enqueuedChangeScopes = v4->_enqueuedChangeScopes;
    v4->_enqueuedChangeScopes = (NSCountedSet *)v5;

    v7 = dispatch_queue_create("PLClientServerTransactionChangeScope", 0);
    changeScopeQueue = v4->_changeScopeQueue;
    v4->_changeScopeQueue = (OS_dispatch_queue *)v7;

  }
  return v4;
}

- (void)_enqueueChangeScopes:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  pl_dispatch_sync();

}

- (void)dealloc
{
  id v3;
  NSCountedSet *enqueuedChangeScopes;
  objc_super v5;

  if ((-[_PLClientTransaction fileDescriptor](self, "fileDescriptor") & 0x80000000) == 0)
  {
    -[_PLClientTransaction path](self, "path");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    unlink((const char *)objc_msgSend(v3, "fileSystemRepresentation"));

  }
  enqueuedChangeScopes = self->_enqueuedChangeScopes;
  self->_enqueuedChangeScopes = 0;

  v5.receiver = self;
  v5.super_class = (Class)_PLServerTransaction;
  -[_PLClientTransaction dealloc](&v5, sel_dealloc);
}

- (BOOL)isClientTransaction
{
  return 0;
}

- (id)generateChangeScopesDescription
{
  return (id)-[NSCountedSet description](self->_enqueuedChangeScopes, "description");
}

- (id)changeScopes
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__87150;
  v8 = __Block_byref_object_dispose__87151;
  v9 = 0;
  pl_dispatch_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (void)completeTransactionScope:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  pl_dispatch_sync();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeScopeQueue, 0);
  objc_storeStrong((id *)&self->_enqueuedChangeScopes, 0);
}

@end
