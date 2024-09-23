@implementation _TUITransactionGroupCompletionToken

- (_TUITransactionGroupCompletionToken)initWithGroup:(id)a3
{
  id v5;
  _TUITransactionGroupCompletionToken *v6;
  _TUITransactionGroupCompletionToken *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUITransactionGroupCompletionToken;
  v6 = -[_TUITransactionGroupCompletionToken init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_group, a3);
    dispatch_group_enter((dispatch_group_t)v7->_group);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_group_leave((dispatch_group_t)self->_group);
  v3.receiver = self;
  v3.super_class = (Class)_TUITransactionGroupCompletionToken;
  -[_TUITransactionGroupCompletionToken dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
}

@end
