@implementation VUIRedownloadInfo

- (AMSBuyParams)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
  objc_storeStrong((id *)&self->_buyParams, a3);
}

- (int64_t)redownloadType
{
  return self->_redownloadType;
}

- (void)setRedownloadType:(int64_t)a3
{
  self->_redownloadType = a3;
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
  objc_storeStrong((id *)&self->_buyParams, 0);
}

@end
