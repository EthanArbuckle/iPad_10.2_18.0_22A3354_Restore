@implementation _BCTransactionProxy

- (_BCTransactionProxy)initWithTransaction:(id)a3
{
  id v5;
  _BCTransactionProxy *v6;
  _BCTransactionProxy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_BCTransactionProxy;
  v6 = -[_BCTransactionProxy init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_transaction, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[_BCTransactionProxy finalize](self, "finalize");
  v3.receiver = self;
  v3.super_class = (Class)_BCTransactionProxy;
  -[_BCTransactionProxy dealloc](&v3, "dealloc");
}

- (void)commit:(id)a3 rollback:(id)a4
{
  -[_BCTransaction commit:rollback:](self->_transaction, "commit:rollback:", a3, a4);
}

- (void)commit:(id)a3
{
  -[_BCTransaction commit:](self->_transaction, "commit:", a3);
}

- (void)whenCancelled:(id)a3
{
  -[_BCTransaction whenCancelled:](self->_transaction, "whenCancelled:", a3);
}

- (void)whenCompleted:(id)a3
{
  -[_BCTransaction whenCompleted:](self->_transaction, "whenCompleted:", a3);
}

- (void)finalize
{
  -[_BCTransaction finalize](self->_transaction, "finalize");
}

- (id)synchronizer
{
  return -[_BCTransaction synchronizer](self->_transaction, "synchronizer");
}

- (BCTransactionContext)context
{
  return -[_BCTransaction context](self->_transaction, "context");
}

- (void)setContext:(id)a3
{
  -[_BCTransaction setContext:](self->_transaction, "setContext:", a3);
}

- (BCSceneControlling)originatingSceneController
{
  return -[_BCTransaction originatingSceneController](self->_transaction, "originatingSceneController");
}

- (void)setOriginatingSceneController:(id)a3
{
  -[_BCTransaction setOriginatingSceneController:](self->_transaction, "setOriginatingSceneController:", a3);
}

- (BCSceneControlling)targetSceneController
{
  return -[_BCTransaction targetSceneController](self->_transaction, "targetSceneController");
}

- (BCSceneDescriptor)targetSceneDescriptor
{
  return -[_BCTransaction targetSceneDescriptor](self->_transaction, "targetSceneDescriptor");
}

- (void)setTargetSceneController:(id)a3
{
  -[_BCTransaction setTargetSceneController:](self->_transaction, "setTargetSceneController:", a3);
}

- (void)requireTargetSceneController:(id)a3
{
  -[_BCTransaction requireTargetSceneController:](self->_transaction, "requireTargetSceneController:", a3);
}

- (BCSceneControlling)destinationSceneController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_BCTransactionProxy targetSceneController](self, "targetSceneController"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[_BCTransactionProxy originatingSceneController](self, "originatingSceneController"));
  v6 = v5;

  return (BCSceneControlling *)v6;
}

- (_BCTransaction)transaction
{
  return self->_transaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
