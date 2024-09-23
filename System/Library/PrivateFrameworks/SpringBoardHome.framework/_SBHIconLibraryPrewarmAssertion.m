@implementation _SBHIconLibraryPrewarmAssertion

- (_SBHIconLibraryPrewarmAssertion)initWithReason:(id)a3 iconLibraryTableViewController:(id)a4
{
  id v6;
  id v7;
  _SBHIconLibraryPrewarmAssertion *v8;
  uint64_t v9;
  NSString *reason;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_SBHIconLibraryPrewarmAssertion;
  v8 = -[_SBHIconLibraryPrewarmAssertion init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    reason = v8->_reason;
    v8->_reason = (NSString *)v9;

    objc_storeWeak((id *)&v8->_iconLibraryTableViewController, v7);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_invalidated)
    -[_SBHIconLibraryPrewarmAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_SBHIconLibraryPrewarmAssertion;
  -[_SBHIconLibraryPrewarmAssertion dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  id WeakRetained;

  if (self->_invalidated)
    NSLog(CFSTR("This assertion has already been invalidated! Please check what's up."), a2, 0);
  self->_invalidated = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_iconLibraryTableViewController);
  objc_msgSend(WeakRetained, "_invalidatePrewarmAssertion:", self);

}

- (unint64_t)hash
{
  return -[NSString hash](self->_reason, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _SBHIconLibraryPrewarmAssertion *v4;
  _SBHIconLibraryPrewarmAssertion *v5;
  _SBHIconLibraryPrewarmAssertion *v6;
  id *v7;
  id *v8;
  id WeakRetained;
  id v10;
  char v11;

  v4 = (_SBHIconLibraryPrewarmAssertion *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
    v8 = v7;
    if (v7)
    {
      WeakRetained = objc_loadWeakRetained(v7 + 3);
      v10 = objc_loadWeakRetained((id *)&self->_iconLibraryTableViewController);
      if (WeakRetained == v10)
        v11 = objc_msgSend(v8[2], "isEqual:", self->_reason);
      else
        v11 = 0;

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

  return v11;
}

- (NSString)reason
{
  return self->_reason;
}

- (SBHIconLibraryTableViewController)iconLibraryTableViewController
{
  return (SBHIconLibraryTableViewController *)objc_loadWeakRetained((id *)&self->_iconLibraryTableViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconLibraryTableViewController);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
