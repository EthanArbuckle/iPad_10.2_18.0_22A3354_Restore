@implementation SSNFCAssertion

- (SSNFCAssertion)init
{
  SSNFCAssertion *v2;
  SSNFCAssertion *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSNFCAssertion;
  v2 = -[SSNFCAssertion init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SSNFCAssertion _assert](v2, "_assert");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SSNFCAssertion _deassert](self, "_deassert");
  v3.receiver = self;
  v3.super_class = (Class)SSNFCAssertion;
  -[SSNFCAssertion dealloc](&v3, sel_dealloc);
}

- (void)_assert
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138543618;
  v3 = a1;
  v4 = 2080;
  v5 = "-[SSNFCAssertion _assert]";
  _os_log_error_impl(&dword_21B647000, a2, OS_LOG_TYPE_ERROR, "[E]assertion fail with error: %{public}@ @%s", (uint8_t *)&v2, 0x16u);
}

- (void)_deassert
{
  void *v3;
  id v4;
  NFAssertion *preventConnectionHandoverAssertion;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (self->_preventConnectionHandoverAssertion)
  {
    objc_msgSend(getNFHardwareManagerClass(), "sharedHardwareManagerWithNoUI");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "releaseAssertion:", self->_preventConnectionHandoverAssertion);

    preventConnectionHandoverAssertion = self->_preventConnectionHandoverAssertion;
    self->_preventConnectionHandoverAssertion = 0;

    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[SSNFCAssertion _deassert]";
      _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "assertion released @%s", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (NFAssertion)preventConnectionHandoverAssertion
{
  return (NFAssertion *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPreventConnectionHandoverAssertion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preventConnectionHandoverAssertion, 0);
}

@end
