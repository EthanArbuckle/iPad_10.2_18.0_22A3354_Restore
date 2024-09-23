@implementation _UITextCursorAssertion

- (id)_initWithReason:(id)a3 options:(unint64_t)a4 controller:(id)a5 userInfo:(id)a6
{
  id v11;
  id v12;
  id v13;
  _UITextCursorAssertion *v14;
  _UITextCursorAssertion *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_UITextCursorAssertion;
  v14 = -[_UITextCursorAssertion init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_reason, a3);
    v15->_options = a4;
    objc_storeWeak((id *)&v15->_controller, v12);
    objc_storeStrong((id *)&v15->_userInfo, a6);
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[_UITextCursorAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_UITextCursorAssertion;
  -[_UITextCursorAssertion dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "_endTrackingAssertion:", self);

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %lux %@>"), v5, self, self->_options, self->_reason);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (UITextCursorAssertionController)controller
{
  return (UITextCursorAssertionController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
