@implementation TRIXPCHandlerWrapper

- (id)methodSignatureForSelector:(SEL)a3
{
  objc_method_description MethodDescription;
  void *v4;

  MethodDescription = protocol_getMethodDescription(self->_protocol, a3, 1, 1);
  if (MethodDescription.types)
  {
    objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", MethodDescription.types);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (TRIXPCHandlerWrapper)initWithUnderlyingHandler:(id)a3 forProtocol:(id)a4
{
  id v8;
  id v9;
  TRIXPCHandlerWrapper *v10;
  TRIXPCHandlerWrapper *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "conformsToProtocol:", v9) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCHandlerWrapper.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[handler conformsToProtocol:protocol]"));

  }
  v14.receiver = self;
  v14.super_class = (Class)TRIXPCHandlerWrapper;
  v10 = -[TRIXPCHandlerWrapper init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_underlying, a3);
    objc_storeStrong((id *)&v11->_protocol, a4);
  }

  return v11;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)protocol_getMethodDescription((Protocol *)self[16], (SEL)objc_msgSend(v4, "selector"), 1, 1).types)
  {
    objc_msgSend(v4, "invokeWithTarget:", self->_underlying);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TRIXPCHandlerWrapper;
    -[TRIXPCHandlerWrapper forwardInvocation:](&v5, sel_forwardInvocation_, v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_underlying, 0);
}

+ (id)_symbolicatedBacktraceWithAddresses:(id)a3 unresolvedSymbols:(id)a4
{
  return a4;
}

@end
