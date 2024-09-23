@implementation PXCNRecipientSearchResult

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  PXCNRecipientSearchResult *v6;

  -[PXCNComposeRecipient recipient](self, "recipient", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = -[PXCNComposeRecipient initWithRecipient:]([PXCNRecipientSearchResult alloc], "initWithRecipient:", v5);
  v6->_validationType = self->_validationType;

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PXCNRecipientSearchResult;
  -[PXCNComposeRecipient description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ validationType: %ld>"), v4, self->_validationType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (int64_t)validationType
{
  return self->_validationType;
}

- (void)setValidationType:(int64_t)a3
{
  self->_validationType = a3;
}

@end
