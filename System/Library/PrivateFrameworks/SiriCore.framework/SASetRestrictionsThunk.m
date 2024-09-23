@implementation SASetRestrictionsThunk

- (SASetRestrictionsThunk)initWithThunk:(id)a3
{
  id v4;
  SASetRestrictionsThunk *v5;
  uint64_t v6;
  id thunk;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SASetRestrictionsThunk;
  v5 = -[SASetRestrictionsThunk init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x212BE6580](v4);
    thunk = v5->_thunk;
    v5->_thunk = (id)v6;

  }
  return v5;
}

- (void)siriCore_invokeThunk
{
  void (**thunk)(id, SASetRestrictionsThunk *);
  id v4;

  thunk = (void (**)(id, SASetRestrictionsThunk *))self->_thunk;
  if (thunk)
  {
    thunk[2](thunk, self);
    v4 = self->_thunk;
    self->_thunk = 0;

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithThunk:", self->_thunk);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_thunk, 0);
}

@end
