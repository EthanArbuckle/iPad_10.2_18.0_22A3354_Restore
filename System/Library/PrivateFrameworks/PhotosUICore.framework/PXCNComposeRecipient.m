@implementation PXCNComposeRecipient

- (PXCNComposeRecipient)initWithContact:(id)a3 address:(id)a4 nameComponents:(id)a5 recipientKind:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCNComposeRecipient.m"), 22, CFSTR("%s is not available as initializer"), "-[PXCNComposeRecipient initWithContact:address:nameComponents:recipientKind:]");

  abort();
}

- (PXCNComposeRecipient)initWithRecipient:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  PXCNComposeRecipient *v12;
  objc_super v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "kind");
  if (v6)
    v7 = 2 * (v6 == 1);
  else
    v7 = 1;
  if (!v7)
  {
    v8 = v6;
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v16 = v8;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Unsupported address kind: %lu", buf, 0xCu);
    }

  }
  objc_msgSend(v5, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "address");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)PXCNComposeRecipient;
  v12 = -[PXRecipient initWithContact:address:nameComponents:recipientKind:](&v14, sel_initWithContact_address_nameComponents_recipientKind_, v10, v11, 0, v7);

  if (v12)
    objc_storeStrong((id *)&v12->_recipient, a3);

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ recipient: %@>"), objc_opt_class(), self->_recipient);
}

- (CNComposeRecipient)recipient
{
  return self->_recipient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipient, 0);
}

@end
