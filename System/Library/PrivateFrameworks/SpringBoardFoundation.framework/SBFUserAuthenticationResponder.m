@implementation SBFUserAuthenticationResponder

+ (id)responderWithSuccessHandler:(id)a3 failureHandler:(id)a4 invalidHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSuccessHandler:failureHandler:invalidHandler:", v10, v9, v8);

  return v11;
}

- (SBFUserAuthenticationResponder)initWithSuccessHandler:(id)a3 failureHandler:(id)a4 invalidHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBFUserAuthenticationResponder *v11;
  uint64_t v12;
  id successHandler;
  uint64_t v14;
  id failureHandler;
  uint64_t v16;
  id invalidHandler;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SBFUserAuthenticationResponder;
  v11 = -[SBFUserAuthenticationResponder init](&v19, sel_init);
  if (v11)
  {
    v12 = MEMORY[0x18D774178](v8);
    successHandler = v11->_successHandler;
    v11->_successHandler = (id)v12;

    v14 = MEMORY[0x18D774178](v9);
    failureHandler = v11->_failureHandler;
    v11->_failureHandler = (id)v14;

    v16 = MEMORY[0x18D774178](v10);
    invalidHandler = v11->_invalidHandler;
    v11->_invalidHandler = (id)v16;

  }
  return v11;
}

- (void)handleSuccessfulAuthenticationRequest:(id)a3
{
  void (**successHandler)(void);

  successHandler = (void (**)(void))self->_successHandler;
  if (successHandler)
    successHandler[2]();
}

- (void)handleFailedAuthenticationRequest:(id)a3 error:(id)a4
{
  void (**failureHandler)(id, id);

  failureHandler = (void (**)(id, id))self->_failureHandler;
  if (failureHandler)
    failureHandler[2](failureHandler, a4);
}

- (void)handleInvalidAuthenticationRequest:(id)a3
{
  void (**invalidHandler)(void);

  invalidHandler = (void (**)(void))self->_invalidHandler;
  if (invalidHandler)
    invalidHandler[2]();
}

- (id)successHandler
{
  return self->_successHandler;
}

- (void)setSuccessHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)failureHandler
{
  return self->_failureHandler;
}

- (void)setFailureHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)invalidHandler
{
  return self->_invalidHandler;
}

- (void)setInvalidHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidHandler, 0);
  objc_storeStrong(&self->_failureHandler, 0);
  objc_storeStrong(&self->_successHandler, 0);
}

@end
