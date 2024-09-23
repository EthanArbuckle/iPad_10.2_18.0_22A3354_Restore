@implementation BKUbiquityExtractOperationAttributes

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_assetID, a3);
}

- (NSURL)destURL
{
  return self->_destURL;
}

- (void)setDestURL:(id)a3
{
  objc_storeStrong((id *)&self->_destURL, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_destURL, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
