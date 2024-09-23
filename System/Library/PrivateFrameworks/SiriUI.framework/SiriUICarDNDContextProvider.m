@implementation SiriUICarDNDContextProvider

- (BOOL)allowContextProvider:(id)a3
{
  return 1;
}

- (id)getCurrentContext
{
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;

  if (self->_hintContext)
  {
    v3 = objc_alloc(MEMORY[0x24BDBCE30]);
    -[SADeviceCarDNDHintContext dictionary](self->_hintContext, "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithObjects:", v4, 0);

  }
  else
  {
    v5 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "contextProvided:", self);

  return v5;
}

- (SiriUICarDNDContextProviderDelegate)delegate
{
  return (SiriUICarDNDContextProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SADeviceCarDNDHintContext)hintContext
{
  return self->_hintContext;
}

- (void)_setHintContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hintContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
