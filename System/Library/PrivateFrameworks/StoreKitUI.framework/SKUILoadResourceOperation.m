@implementation SKUILoadResourceOperation

- (id)_initSKUILoadResourceOperation
{
  SKUILoadResourceOperation *v3;
  NSLock *v4;
  NSLock *lock;
  objc_super v7;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUILoadResourceOperation _initSKUILoadResourceOperation].cold.1();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUILoadResourceOperation;
  v3 = -[SKUILoadResourceOperation init](&v7, sel_init);
  if (v3)
  {
    v4 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v3->_lock;
    v3->_lock = v4;

  }
  return v3;
}

- (SKUILoadResourceOperation)initWithResourceRequest:(id)a3
{
  id v4;
  SKUILoadResourceOperation *v5;
  uint64_t v6;
  SKUIResourceRequest *request;

  v4 = a3;
  v5 = -[SKUILoadResourceOperation _initSKUILoadResourceOperation](self, "_initSKUILoadResourceOperation");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    request = v5->_request;
    v5->_request = (SKUIResourceRequest *)v6;

  }
  return v5;
}

- (SKUIClientContext)clientContext
{
  SKUIClientContext *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = self->_clientContext;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (id)outputBlock
{
  void *v3;
  void *v4;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)objc_msgSend(self->_outputBlock, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  v4 = _Block_copy(v3);

  return v4;
}

- (SKUIResourceRequest)resourceRequest
{
  return self->_request;
}

- (void)setClientContext:(id)a3
{
  SKUIClientContext *v5;

  v5 = (SKUIClientContext *)a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_clientContext != v5)
    objc_storeStrong((id *)&self->_clientContext, a3);
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)setOutputBlock:(id)a3
{
  void *v4;
  id outputBlock;
  id v6;

  v6 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_outputBlock != v6)
  {
    v4 = (void *)objc_msgSend(v6, "copy");
    outputBlock = self->_outputBlock;
    self->_outputBlock = v4;

  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)main
{
  void (**v2)(_QWORD, _QWORD, _QWORD);
  id v3;

  -[SKUILoadResourceOperation outputBlock](self, "outputBlock");
  v2 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2](v2, 0, 0);
    v2 = (void (**)(_QWORD, _QWORD, _QWORD))v3;
  }

}

- (void)cancel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SKUILoadResourceOperation;
  -[SKUILoadResourceOperation cancel](&v2, sel_cancel);
}

- (int64_t)_loadReason
{
  return self->__loadReason;
}

- (void)_setLoadReason:(int64_t)a3
{
  self->__loadReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)_initSKUILoadResourceOperation
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUILoadResourceOperation _initSKUILoadResourceOperation]";
}

@end
