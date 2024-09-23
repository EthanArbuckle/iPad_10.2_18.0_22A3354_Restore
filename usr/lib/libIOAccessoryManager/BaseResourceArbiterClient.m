@implementation BaseResourceArbiterClient

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)synchRequestResourceAccess
{
  return 1;
}

- (BOOL)asynchRequestResourceAccess:(BOOL)a3
{
  ResourceArbiterClientDelegate *v4;
  _QWORD block[5];

  v4 = -[BaseResourceArbiterClient delegate](self, "delegate", a3);
  if (v4)
  {
    -[BaseResourceArbiterClient delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __57__BaseResourceArbiterClient_asynchRequestResourceAccess___block_invoke;
      block[3] = &unk_24C74E608;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return (char)v4;
}

uint64_t __57__BaseResourceArbiterClient_asynchRequestResourceAccess___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "resourceAccessResult:", 1);
}

- (ResourceArbiterClientDelegate)delegate
{
  return (ResourceArbiterClientDelegate *)objc_loadWeak((id *)&self->_delegate);
}

@end
