@implementation VUIAppDocumentPurchaseEventDescriptor

- (VUIAppDocumentPurchaseEventDescriptor)initWithEventType:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The %@ initializer is not available."), v6);

  return 0;
}

- (VUIAppDocumentPurchaseEventDescriptor)initWithCanonicalID:(id)a3
{
  id v4;
  VUIAppDocumentPurchaseEventDescriptor *v5;
  uint64_t v6;
  NSString *canonicalID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIAppDocumentPurchaseEventDescriptor;
  v5 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:](&v9, sel_initWithEventType_, 4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    canonicalID = v5->_canonicalID;
    v5->_canonicalID = (NSString *)v6;

  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[VUIAppDocumentUpdateEventDescriptor type](self, "type");
  -[VUIAppDocumentPurchaseEventDescriptor canonicalID](self, "canonicalID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VUIAppDocumentPurchaseEventDescriptor *v4;
  VUIAppDocumentPurchaseEventDescriptor *v5;
  VUIAppDocumentPurchaseEventDescriptor *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;

  v4 = (VUIAppDocumentPurchaseEventDescriptor *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[VUIAppDocumentUpdateEventDescriptor type](self, "type");
    if (v7 == -[VUIAppDocumentUpdateEventDescriptor type](v6, "type"))
    {
      -[VUIAppDocumentPurchaseEventDescriptor canonicalID](self, "canonicalID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIAppDocumentPurchaseEventDescriptor canonicalID](v6, "canonicalID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v11 = v9;
      v12 = v11;
      if (v10 == v11)
      {
        v13 = 1;
      }
      else
      {
        v13 = 0;
        if (v10 && v11)
          v13 = objc_msgSend(v10, "isEqual:", v11);
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12.receiver = self;
  v12.super_class = (Class)VUIAppDocumentPurchaseEventDescriptor;
  -[VUIAppDocumentUpdateEventDescriptor description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIAppDocumentPurchaseEventDescriptor canonicalID](self, "canonicalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("canonicalID"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@>"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void)setCanonicalID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalID, 0);
}

@end
