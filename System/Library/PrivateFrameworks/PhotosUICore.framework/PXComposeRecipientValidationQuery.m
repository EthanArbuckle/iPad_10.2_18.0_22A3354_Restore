@implementation PXComposeRecipientValidationQuery

- (PXComposeRecipientValidationQuery)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientValidationManager.m"), 44, CFSTR("%s is not available as initializer"), "-[PXComposeRecipientValidationQuery init]");

  abort();
}

- (PXComposeRecipientValidationQuery)initWithComposeRecipient:(id)a3 address:(id)a4 addressKind:(int64_t)a5
{
  id v10;
  id v11;
  PXComposeRecipientValidationQuery *v12;
  PXComposeRecipientValidationQuery *v13;
  uint64_t v14;
  NSString *address;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  if (v11)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientValidationManager.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("address"));

    if (a5)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientValidationManager.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("addressKind != PXRecipientKindUnknown"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)PXComposeRecipientValidationQuery;
  v12 = -[PXComposeRecipientValidationQuery init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_composeRecipient, a3);
    v14 = objc_msgSend(v11, "copy");
    address = v13->_address;
    v13->_address = (NSString *)v14;

    v13->_addressKind = a5;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXComposeRecipientValidationQuery address](self, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
      v8 = 1;
    else
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXComposeRecipientValidationQuery address](self, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PXComposeRecipientValidationQuery address](self, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("address %@ addressKind %ld"), v4, -[PXComposeRecipientValidationQuery addressKind](self, "addressKind"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PXComposeRecipient)composeRecipient
{
  return self->_composeRecipient;
}

- (NSString)address
{
  return self->_address;
}

- (int64_t)addressKind
{
  return self->_addressKind;
}

- (int64_t)validationType
{
  return self->_validationType;
}

- (void)setValidationType:(int64_t)a3
{
  self->_validationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_composeRecipient, 0);
}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXComposeRecipientValidationManager.m"), 48, CFSTR("%s is not available as initializer"), "+[PXComposeRecipientValidationQuery new]");

  abort();
}

@end
