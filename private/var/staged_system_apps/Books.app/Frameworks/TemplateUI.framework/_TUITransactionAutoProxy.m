@implementation _TUITransactionAutoProxy

- (_TUITransactionAutoProxy)initWithTransaction:(id)a3
{
  id v5;
  _TUITransactionAutoProxy *v6;
  _TUITransactionAutoProxy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUITransactionAutoProxy;
  v6 = -[_TUITransactionAutoProxy init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tx, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[_TUITransaction commit](self->_tx, "commit");
  v3.receiver = self;
  v3.super_class = (Class)_TUITransactionAutoProxy;
  -[_TUITransactionAutoProxy dealloc](&v3, "dealloc");
}

- (NSDate)creationDate
{
  return -[_TUITransaction creationDate](self->_tx, "creationDate");
}

- (TUITransactionOptions)options
{
  return -[_TUITransaction options](self->_tx, "options");
}

- (unint64_t)flags
{
  return -[_TUITransaction flags](self->_tx, "flags");
}

- (void)addCategory:(id)a3
{
  -[_TUITransaction addCategory:](self->_tx, "addCategory:", a3);
}

- (void)addCompletion:(id)a3 queue:(id)a4
{
  -[_TUITransaction addCompletion:queue:](self->_tx, "addCompletion:queue:", a3, a4);
}

- (void)addCompletionDeferral
{
  -[_TUITransaction addCompletionDeferral](self->_tx, "addCompletionDeferral");
}

- (void)addSubTransaction:(id)a3 completionQueue:(id)a4
{
  -[_TUITransaction addSubTransaction:completionQueue:](self->_tx, "addSubTransaction:completionQueue:", a3, a4);
}

- (void)addSubTransactionCompletion:(id)a3 queue:(id)a4
{
  -[_TUITransaction addSubTransactionCompletion:queue:](self->_tx, "addSubTransactionCompletion:queue:", a3, a4);
}

- (void)commit
{
  -[_TUITransaction commit](self->_tx, "commit");
}

- (TUITransactionDependencyToken)dependencyToken
{
  return -[_TUITransaction dependencyToken](self->_tx, "dependencyToken");
}

- (void)dependentOn:(id)a3
{
  -[_TUITransaction dependentOn:](self->_tx, "dependentOn:", a3);
}

- (void)removeCompletionDeferral
{
  -[_TUITransaction removeCompletionDeferral](self->_tx, "removeCompletionDeferral");
}

- (void)addSubTransactionCompletionDeferral
{
  -[_TUITransaction addSubTransactionCompletionDeferral](self->_tx, "addSubTransactionCompletionDeferral");
}

- (void)removeSubTransactionCompletionDeferral
{
  -[_TUITransaction removeSubTransactionCompletionDeferral](self->_tx, "removeSubTransactionCompletionDeferral");
}

- (BOOL)isCommittedAndIfNotNotifyWithBlock:(id)a3
{
  return -[_TUITransaction isCommittedAndIfNotNotifyWithBlock:](self->_tx, "isCommittedAndIfNotNotifyWithBlock:", a3);
}

- (_TUITransaction)tx
{
  return self->_tx;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tx, 0);
}

@end
