@implementation _TUISyncLayoutAssertion

- (_TUISyncLayoutAssertion)initWithController:(id)a3 timeout:(double)a4 transaction:(id)a5 feedId:(id)a6
{
  id v10;
  id v11;
  _TUISyncLayoutAssertion *v12;
  _TUISyncLayoutAssertion *v13;
  objc_super v15;

  v10 = a3;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_TUISyncLayoutAssertion;
  v12 = -[_TUISyncLayoutAssertion init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_controller, v10);
    v13->_timeout = a4;
    objc_storeStrong((id *)&v13->_transaction, a5);
    v13->_feedId.uniqueIdentifier = a6.var0;
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[_TUISyncLayoutAssertion _invalidate:](self, "_invalidate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_TUISyncLayoutAssertion;
  -[_TUISyncLayoutAssertion dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  -[_TUISyncLayoutAssertion _invalidate:](self, "_invalidate:", self);
}

- (void)_invalidate:(id)a3
{
  TUISyncLayoutController **p_controller;
  id v4;
  id WeakRetained;

  p_controller = &self->_controller;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_controller);
  objc_storeWeak((id *)p_controller, 0);
  objc_msgSend(WeakRetained, "removeAssertion:", v4);

}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p timeout=%f tx=%@ feedId=%lu>"), v5, self, *(_QWORD *)&self->_timeout, self->_transaction, self->_feedId.uniqueIdentifier));

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_destroyWeak((id *)&self->_controller);
}

@end
