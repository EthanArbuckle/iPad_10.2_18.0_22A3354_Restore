@implementation PXGFocusableViewConfiguration

- (PXGFocusableViewConfiguration)init
{
  return -[PXGFocusableViewConfiguration initWithConfiguration:](self, "initWithConfiguration:", 0);
}

- (PXGFocusableViewConfiguration)initWithConfiguration:(id)a3
{
  id v4;
  PXGFocusableViewConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSString *debugName;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGFocusableViewConfiguration;
  v5 = -[PXGFocusableViewConfiguration init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_delegate, v6);

    v5->_focusability = objc_msgSend(v4, "focusability");
    objc_msgSend(v4, "debugName");
    v7 = objc_claimAutoreleasedReturnValue();
    debugName = v5->_debugName;
    v5->_debugName = (NSString *)v7;

  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  int64_t v4;
  void *v5;
  unint64_t v6;

  -[PXGFocusableViewConfiguration delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = v3 ^ (2 * -[PXGFocusableViewConfiguration focusability](self, "focusability"));
  -[PXGFocusableViewConfiguration debugName](self, "debugName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ (4 * objc_msgSend(v5, "hash"));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PXGFocusableViewConfiguration *v4;
  PXGFocusableViewConfiguration *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (PXGFocusableViewConfiguration *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXGFocusableViewConfiguration delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGFocusableViewConfiguration delegate](v5, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7
        && (v8 = -[PXGFocusableViewConfiguration focusability](self, "focusability"),
            v8 == -[PXGFocusableViewConfiguration focusability](v5, "focusability")))
      {
        -[PXGFocusableViewConfiguration debugName](self, "debugName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXGFocusableViewConfiguration debugName](v5, "debugName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 == v10)
          v11 = 1;
        else
          v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConfiguration:", self);
}

- (PXGFocusableViewDelegate)delegate
{
  return (PXGFocusableViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)focusability
{
  return self->_focusability;
}

- (void)setFocusability:(int64_t)a3
{
  self->_focusability = a3;
}

- (NSString)debugName
{
  return self->_debugName;
}

- (void)setDebugName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
