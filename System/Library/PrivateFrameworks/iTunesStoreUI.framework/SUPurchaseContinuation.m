@implementation SUPurchaseContinuation

- (SUPurchaseContinuation)initWithPurchase:(id)a3
{
  SUPurchaseContinuation *v4;

  v4 = -[SUPurchaseContinuation init](self, "init");
  if (v4)
    v4->_purchase = a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUPurchaseContinuation;
  -[SUPurchaseContinuation dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  objc_super v3;

  -[SUPurchaseManager cancelFuturePurchase:](-[SUPurchaseContinuation purchaseManager](self, "purchaseManager"), "cancelFuturePurchase:", self->_purchase);
  v3.receiver = self;
  v3.super_class = (Class)SUPurchaseContinuation;
  -[SUContinuation cancel](&v3, sel_cancel);
}

- (void)start
{
  -[SUPurchaseManager addFuturePurchase:](-[SUPurchaseContinuation purchaseManager](self, "purchaseManager"), "addFuturePurchase:", self->_purchase);
}

- (id)purchase
{
  return self->_purchase;
}

- (SUPurchaseManager)purchaseManager
{
  return self->_purchaseManager;
}

- (void)setPurchaseManager:(id)a3
{
  self->_purchaseManager = (SUPurchaseManager *)a3;
}

@end
