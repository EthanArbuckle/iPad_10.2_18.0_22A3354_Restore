@implementation _TUITransactionInstance

- (_TUITransactionInstance)initWithTransaction:(id)a3
{
  id v5;
  _TUITransactionInstance *v6;
  _TUITransactionInstance *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUITransactionInstance;
  v6 = -[_TUITransactionInstance init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transaction, a3);
    -[_TUITransaction addCompletionDeferral](v7->_transaction, "addCompletionDeferral");
    -[_TUITransaction addSubTransactionCompletionDeferral](v7->_transaction, "addSubTransactionCompletionDeferral");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[_TUITransaction removeCompletionDeferral](self->_transaction, "removeCompletionDeferral");
  v3.receiver = self;
  v3.super_class = (Class)_TUITransactionInstance;
  -[_TUITransactionInstance dealloc](&v3, "dealloc");
}

- (void)_aq_appendLayoutBlock:(id)a3
{
  id v4;
  NSMutableArray *layoutBlocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  id v10;

  v4 = a3;
  layoutBlocks = self->_layoutBlocks;
  v10 = v4;
  if (!layoutBlocks)
  {
    v6 = objc_opt_new(NSMutableArray);
    v7 = self->_layoutBlocks;
    self->_layoutBlocks = v6;

    v4 = v10;
    layoutBlocks = self->_layoutBlocks;
  }
  v8 = objc_msgSend(v4, "copy");
  v9 = objc_retainBlock(v8);
  -[NSMutableArray addObject:](layoutBlocks, "addObject:", v9);

}

- (id)_aq_layoutBlocksToApply
{
  NSMutableArray *v3;
  NSMutableArray *layoutBlocks;

  v3 = self->_layoutBlocks;
  layoutBlocks = self->_layoutBlocks;
  self->_layoutBlocks = 0;

  return v3;
}

- (_TUITransaction)transaction
{
  return self->_transaction;
}

- (NSMutableArray)layoutBlocks
{
  return self->_layoutBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutBlocks, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
