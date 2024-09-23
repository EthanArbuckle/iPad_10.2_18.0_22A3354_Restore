@implementation PLAutoBindingBlackholeProxy

- (PLAutoBindingBlackholeProxy)initWithTargetObject:(id)a3
{
  objc_storeStrong(&self->_targetObject, a3);
  return self;
}

- (void)forwardInvocation:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector((SEL)objc_msgSend(v3, "selector"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Swallowing proxy invocation: %@ %@", (uint8_t *)&v6, 0x16u);

  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)objc_msgSend(self->_targetObject, "methodSignatureForSelector:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_targetObject, 0);
}

@end
