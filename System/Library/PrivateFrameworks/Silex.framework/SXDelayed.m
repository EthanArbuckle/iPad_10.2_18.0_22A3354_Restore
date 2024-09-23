@implementation SXDelayed

+ (id)execute:(id)a3 delay:(double)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = v5;
  if (!v5)
    goto LABEL_5;
  if (a4 <= 0.0)
  {
    (*((void (**)(id))v5 + 2))(v5);
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBlock:delay:", v5, a4);
LABEL_6:

  return v7;
}

- (SXDelayed)initWithBlock:(id)a3 delay:(double)a4
{
  id v6;
  SXDelayed *v7;
  uint64_t v8;
  id block;
  dispatch_time_t v10;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SXDelayed;
  v7 = -[SXDelayed init](&v15, sel_init);
  if (v7)
  {
    v8 = MEMORY[0x219A070A8](v6);
    block = v7->_block;
    v7->_block = (id)v8;

    objc_storeStrong((id *)&v7->_strongReference, v7);
    objc_initWeak(&location, v7);
    v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __33__SXDelayed_initWithBlock_delay___block_invoke;
    v12[3] = &unk_24D6873B8;
    objc_copyWeak(&v13, &location);
    dispatch_after(v10, MEMORY[0x24BDAC9B8], v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __33__SXDelayed_initWithBlock_delay___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "strongReference");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "invoke");

    WeakRetained = v3;
  }

}

- (void)invoke
{
  void *v3;
  void (**v4)(void);

  -[SXDelayed block](self, "block");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SXDelayed block](self, "block");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
  -[SXDelayed setStrongReference:](self, "setStrongReference:", 0);
}

- (void)cancel
{
  -[SXDelayed setBlock:](self, "setBlock:", 0);
  -[SXDelayed setStrongReference:](self, "setStrongReference:", 0);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (SXDelayed)strongReference
{
  return self->_strongReference;
}

- (void)setStrongReference:(id)a3
{
  objc_storeStrong((id *)&self->_strongReference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongReference, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
