@implementation PLAssetTransactionReason

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

+ (id)transactionReason:(id)a3
{
  id v3;
  PLAssetTransactionReason *v4;

  v3 = a3;
  v4 = objc_alloc_init(PLAssetTransactionReason);
  -[PLAssetTransactionReason setReason:](v4, "setReason:", v3);

  return v4;
}

@end
