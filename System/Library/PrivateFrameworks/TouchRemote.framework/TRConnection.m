@implementation TRConnection

- (void)sendEvent:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("You must override %@ in a subclass"), v5);

}

- (void)sendRequest:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("You must override %@ in a subclass"), v5);

}

- (void)sendResponse:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("You must override %@ in a subclass"), v5);

}

- (void)invalidate
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  NSStringFromSelector(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("You must override %@ in a subclass"), v4);

}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)eventMessageHandler
{
  return self->_eventMessageHandler;
}

- (void)setEventMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)requestMessageHandler
{
  return self->_requestMessageHandler;
}

- (void)setRequestMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestMessageHandler, 0);
  objc_storeStrong(&self->_eventMessageHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
}

@end
