@implementation STUIStatusBarAction

+ (id)actionWithBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setBlock:", v4);

  objc_msgSend(v5, "setEnabled:", 1);
  return v5;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

- (void)performWithStatusBar:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, uint64_t);
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  if (-[STUIStatusBarAction isEnabled](self, "isEnabled"))
  {
    v7 = (*((uint64_t (**)(void))self->_block + 2))();
    if (!v6)
      goto LABEL_6;
    goto LABEL_5;
  }
  v7 = 0;
  if (v6)
LABEL_5:
    v6[2](v6, v7);
LABEL_6:

}

- (id)block
{
  return self->_block;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

@end
