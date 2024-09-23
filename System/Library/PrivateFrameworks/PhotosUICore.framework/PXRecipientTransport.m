@implementation PXRecipientTransport

- (PXRecipientTransport)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXRecipient.m"), 30, CFSTR("%s is not available as initializer"), "-[PXRecipientTransport init]");

  abort();
}

- (PXRecipientTransport)initWithAddress:(id)a3 addressKind:(int64_t)a4
{
  id v7;
  PXRecipientTransport *v8;
  uint64_t v9;
  NSString *address;
  void *v12;
  objc_super v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXRecipient.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("address"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PXRecipientTransport;
  v8 = -[PXRecipientTransport init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    address = v8->_address;
    v8->_address = (NSString *)v9;

    v8->_addressKind = a4;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  BOOL v10;
  int64_t v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXRecipientTransport address](self, "address");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "address");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {

    }
    else
    {
      v8 = v7;
      v9 = objc_msgSend(v6, "isEqualToString:", v7);

      if ((v9 & 1) == 0)
      {
        v10 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    v11 = -[PXRecipientTransport addressKind](self, "addressKind");
    v10 = v11 == objc_msgSend(v5, "addressKind");
    goto LABEL_8;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXRecipientTransport address](self, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[PXRecipientTransport addressKind](self, "addressKind");
  if (v3 > 2)
    v4 = 0;
  else
    v4 = off_1E511C940[v3];
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[PXRecipientTransport address](self, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("address %@ addressKind %@"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)address
{
  return self->_address;
}

- (int64_t)addressKind
{
  return self->_addressKind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXRecipient.m"), 34, CFSTR("%s is not available as initializer"), "+[PXRecipientTransport new]");

  abort();
}

@end
