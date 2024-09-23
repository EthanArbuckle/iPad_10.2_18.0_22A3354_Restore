@implementation BRCPersistedState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)loadFromClientStateInSession:(id)a3 options:(id)a4
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[BRCPersistedState loadFromClientStateInSession:options:]", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Implement %@ in a subclass."), v6);

  return 0;
}

+ (id)loadFromClientStateInSession:(id)a3
{
  return (id)objc_msgSend(a1, "loadFromClientStateInSession:options:", a3, 0);
}

- (void)assertQueue
{
  NSObject *WeakRetained;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_assertionQueue);
  if (WeakRetained)
  {
    v3 = WeakRetained;
    dispatch_assert_queue_V2(WeakRetained);
    WeakRetained = v3;
  }

}

- (OS_dispatch_queue)assertionQueue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_assertionQueue);
}

- (void)setAssertionQueue:(id)a3
{
  objc_storeWeak((id *)&self->_assertionQueue, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_assertionQueue);
}

@end
