@implementation _BKShowAssetInvocation

- (BKTransactionProviding)transactionProvider
{
  return (BKTransactionProviding *)objc_loadWeakRetained((id *)&self->_transactionProvider);
}

- (void)setTransactionProvider:(id)a3
{
  objc_storeWeak((id *)&self->_transactionProvider, a3);
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_assetID, a3);
}

- (BKLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_destroyWeak((id *)&self->_transactionProvider);
}

@end
