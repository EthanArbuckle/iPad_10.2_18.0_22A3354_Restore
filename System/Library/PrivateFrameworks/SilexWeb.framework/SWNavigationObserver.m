@implementation SWNavigationObserver

- (SWNavigationObserver)initWithBlock:(id)a3
{
  id v4;
  SWNavigationObserver *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWNavigationObserver;
  v5 = -[SWNavigationObserver init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x219A22DDC](v4);
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (void)handledNavigationWithURL:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[SWNavigationObserver block](self, "block");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SWNavigationObserver block](self, "block");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
