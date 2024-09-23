@implementation SSVRedeemCodeMetadata

- (SSVRedeemCodeMetadata)initWithRedeemCodeDictionary:(id)a3
{
  id v4;
  SSVRedeemCodeMetadata *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *dictionary;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SSVRedeemCodeMetadata;
  v5 = -[SSVRedeemCodeMetadata init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("codeInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = objc_msgSend(v4, "copy");
      dictionary = v5->_dictionary;
      v5->_dictionary = (NSDictionary *)v8;
    }
    else
    {
      dictionary = v5;
      v5 = 0;
    }

  }
  return v5;
}

- (NSString)code
{
  void *v2;
  void *v3;
  void *v4;
  NSString *v5;

  -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("codeInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("code"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NSString)codeType
{
  void *v2;
  void *v3;
  void *v4;
  NSString *v5;

  -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("codeInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("codeType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (BOOL)allowsAutoSubmission
{
  void *v2;
  void *v3;
  char v4;

  -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("codeInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("allowAutoSubmission"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (NSArray)items
{
  void *v3;
  void *v4;
  void *v5;
  SSVRedeemCodeItem *v6;
  SSVRedeemCodeItem *v7;
  void *v8;
  _QWORD v10[4];
  SSVRedeemCodeItem *v11;

  -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("lockups"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("codeInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("salable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[SSVRedeemCodeItem initWithRedeemCodeDictionary:]([SSVRedeemCodeItem alloc], "initWithRedeemCodeDictionary:", v5);
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
      v7 = (SSVRedeemCodeItem *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __30__SSVRedeemCodeMetadata_items__block_invoke;
    v10[3] = &unk_1E47BFDF8;
    v7 = v8;
    v11 = v7;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v10);
    v6 = v11;
LABEL_8:

    goto LABEL_9;
  }
  v7 = 0;
LABEL_9:

  return (NSArray *)v7;
}

void __30__SSVRedeemCodeMetadata_items__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  SSLookupItem *v4;
  SSVRedeemCodeItem *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[SSLookupItem initWithLookupDictionary:]([SSLookupItem alloc], "initWithLookupDictionary:", v6);
    v5 = -[SSVRedeemCodeItem initWithLookupItem:]([SSVRedeemCodeItem alloc], "initWithLookupItem:", v4);
    if (v5)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSDictionary copyWithZone:](self->_dictionary, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_inputCode, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (NSString)inputCode
{
  return self->_inputCode;
}

- (void)setInputCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)redeemCodeDictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputCode, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
