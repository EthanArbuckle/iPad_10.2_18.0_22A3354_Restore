@implementation SignpostSupportObjectFilter

- (SignpostSupportObjectFilter)initWithFilterBlock:(id)a3
{
  id v4;
  void *v5;
  SignpostSupportObjectFilter *v6;
  uint64_t v7;
  id filterBlock;
  objc_super v10;

  v4 = a3;
  if (!v4)
    -[SignpostSupportObjectFilter initWithFilterBlock:].cold.1();
  v5 = v4;
  v10.receiver = self;
  v10.super_class = (Class)SignpostSupportObjectFilter;
  v6 = -[SignpostSupportObjectFilter init](&v10, sel_init);
  if (v6)
  {
    v7 = MEMORY[0x1A1B10AD8](v5);
    filterBlock = v6->_filterBlock;
    v6->_filterBlock = (id)v7;

  }
  return v6;
}

- (BOOL)passesObject:(id)a3
{
  id v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  char v6;

  v4 = a3;
  -[SignpostSupportObjectFilter filterBlock](self, "filterBlock");
  v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6 = ((uint64_t (**)(_QWORD, id))v5)[2](v5, v4);

  return v6;
}

- (id)filterBlock
{
  return self->_filterBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filterBlock, 0);
}

- (void)initWithFilterBlock:.cold.1()
{
  __assert_rtn("-[SignpostSupportObjectFilter initWithFilterBlock:]", "SignpostFilter.m", 343, "filterBlock");
}

@end
