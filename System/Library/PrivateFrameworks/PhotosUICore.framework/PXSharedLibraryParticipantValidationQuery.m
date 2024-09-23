@implementation PXSharedLibraryParticipantValidationQuery

- (PXSharedLibraryParticipantValidationQuery)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantValidationQuery.m"), 21, CFSTR("%s is not available as initializer"), "-[PXSharedLibraryParticipantValidationQuery init]");

  abort();
}

- (PXSharedLibraryParticipantValidationQuery)initWithAddress:(id)a3
{
  id v5;
  PXSharedLibraryParticipantValidationQuery *v6;
  uint64_t v7;
  NSString *address;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantValidationQuery.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("address.length > 0"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXSharedLibraryParticipantValidationQuery;
  v6 = -[PXSharedLibraryParticipantValidationQuery init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    address = v6->_address;
    v6->_address = (NSString *)v7;

  }
  return v6;
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
    -[PXSharedLibraryParticipantValidationQuery address](self, "address");
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

  -[PXSharedLibraryParticipantValidationQuery address](self, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXSharedLibraryParticipantValidationQuery;
  -[PXSharedLibraryParticipantValidationQuery description](&v14, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[PXSharedLibraryParticipantValidationQuery address](self, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR(":\naddress: %@,\n"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = -[PXSharedLibraryParticipantValidationQuery isValid](self, "isValid");
  v10 = CFSTR("NO");
  if (v9)
    v10 = CFSTR("YES");
  v11 = v10;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("isValid: %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v12);

  return v4;
}

- (NSString)address
{
  return self->_address;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
}

@end
