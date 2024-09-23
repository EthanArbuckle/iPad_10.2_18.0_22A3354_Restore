@implementation PXVideoProcessingOperation

- (PXVideoProcessingOperation)initWithSpec:(id)a3
{
  id v4;
  PXVideoProcessingOperation *v5;
  uint64_t v6;
  PXVideoProcessingOperationSpec *spec;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXVideoProcessingOperation;
  v5 = -[PXVideoProcessingOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    spec = v5->_spec;
    v5->_spec = (PXVideoProcessingOperationSpec *)v6;

  }
  return v5;
}

- (PXVideoProcessingOperation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoProcessingOperation.m"), 24, CFSTR("%s is not available as initializer"), "-[PXVideoProcessingOperation init]");

  abort();
}

- (void)main
{
  PXVideoProcessingOperationResult *v3;
  PXVideoProcessingOperationResult *result;

  -[PXVideoProcessingOperation performProcessing](self, "performProcessing");
  v3 = (PXVideoProcessingOperationResult *)objc_claimAutoreleasedReturnValue();
  result = self->_result;
  self->_result = v3;

}

- (id)performProcessing
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoProcessingOperation.m"), 37, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXVideoProcessingOperation performProcessing]", v6);

  abort();
}

- (PXVideoProcessingOperationSpec)spec
{
  return self->_spec;
}

- (PXVideoProcessingOperationResult)result
{
  return self->_result;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXVideoProcessingOperation.m"), 28, CFSTR("%s is not available as initializer"), "+[PXVideoProcessingOperation new]");

  abort();
}

@end
