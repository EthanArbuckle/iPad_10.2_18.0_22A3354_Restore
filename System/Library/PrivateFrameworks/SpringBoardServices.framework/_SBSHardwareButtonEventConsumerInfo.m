@implementation _SBSHardwareButtonEventConsumerInfo

- (int64_t)eventPriority
{
  return self->_eventPriority;
}

- (unint64_t)eventMask
{
  return self->_eventMask;
}

- (int64_t)buttonKind
{
  return self->_buttonKind;
}

- (void)setService:(id)a3
{
  objc_storeWeak((id *)&self->_service, a3);
}

- (void)setEventPriority:(int64_t)a3
{
  self->_eventPriority = a3;
}

- (void)setButtonKind:(int64_t)a3
{
  self->_buttonKind = a3;
}

+ (id)infoWithConsumer:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 64;
  else
    v6 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 |= 2uLL;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 |= 4uLL;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 |= 8uLL;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 |= 0x10uLL;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 |= 0x20uLL;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 |= 0x10000uLL;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = v6 | 0x180;
  else
    v7 = v6;
  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = 138543618;
      v13 = (id)objc_opt_class();
      v14 = 2048;
      v15 = v7;
      v10 = v13;
      _os_log_impl(&dword_18EB52000, v9, OS_LOG_TYPE_INFO, "%{public}@ buttonEventMask is %lx", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(v5, "setConsumer:", v4);
    objc_msgSend(v5, "setEventMask:", v7);
    objc_msgSend(v5, "setValid:", 1);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[_SBSHardwareButtonEventConsumerInfo infoWithConsumer:].cold.1((uint64_t)v4, v9);

  }
  return v5;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)setEventMask:(unint64_t)a3
{
  self->_eventMask = a3;
}

- (void)setConsumer:(id)a3
{
  objc_storeStrong((id *)&self->_consumer, a3);
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->_valid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBSHardwareButtonEventConsumerInfo.m"), 22, CFSTR("must invalidate consumer token %p when finished"), self);

  }
  v5.receiver = self;
  v5.super_class = (Class)_SBSHardwareButtonEventConsumerInfo;
  -[_SBSHardwareButtonEventConsumerInfo dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUInt64:withName:", self->_eventMask, CFSTR("eventMask"));
  NSStringFromSBSHardwareButtonEventPriority(self->_eventPriority);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("eventPriority"));

  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_consumer, CFSTR("consumer"), 0);
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)invalidate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  objc_msgSend(WeakRetained, "consumerInfoWillInvalidate:", self);

  self->_valid = 0;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (SBSHardwareButtonService)service
{
  return (SBSHardwareButtonService *)objc_loadWeakRetained((id *)&self->_service);
}

- (SBSHardwareButtonEventConsuming)consumer
{
  return self->_consumer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumer, 0);
  objc_destroyWeak((id *)&self->_service);
}

+ (void)infoWithConsumer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 138543362;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_error_impl(&dword_18EB52000, a2, OS_LOG_TYPE_ERROR, "no valid SBSHardwareButtonEventConsuming protocol methods implemented on %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
