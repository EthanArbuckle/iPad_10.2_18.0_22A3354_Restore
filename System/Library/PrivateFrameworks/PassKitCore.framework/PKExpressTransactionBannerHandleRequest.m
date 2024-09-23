@implementation PKExpressTransactionBannerHandleRequest

+ (id)createForPassUniqueIdentifier:(id)a3
{
  id v3;
  PKExpressTransactionBannerHandleRequest *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v3 = a3;
  if (v3)
  {
    v4 = [PKExpressTransactionBannerHandleRequest alloc];
    if (v4)
    {
      v10.receiver = v4;
      v10.super_class = (Class)PKBannerHandleRequest;
      v5 = objc_msgSendSuper2(&v10, sel_init);
      v6 = v5;
      if (v5)
        v5[1] = 0;
    }
    else
    {
      v6 = 0;
    }
    v7 = objc_msgSend(v3, "copy");
    v8 = (void *)v6[2];
    v6[2] = v7;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKExpressTransactionBannerHandleRequest)initWithCoder:(id)a3
{
  id v4;
  PKExpressTransactionBannerHandleRequest *v5;
  uint64_t v6;
  NSString *passUniqueIdentifier;
  PKExpressTransactionBannerHandleRequest *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKExpressTransactionBannerHandleRequest;
  v5 = -[PKBannerHandleRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5
    && (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passUniqueIdentifier")),
        v6 = objc_claimAutoreleasedReturnValue(),
        passUniqueIdentifier = v5->_passUniqueIdentifier,
        v5->_passUniqueIdentifier = (NSString *)v6,
        passUniqueIdentifier,
        !v5->_passUniqueIdentifier))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKExpressTransactionBannerHandleRequest"), 0, 0);
    objc_msgSend(v4, "failWithError:", v9);

    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKExpressTransactionBannerHandleRequest;
  v4 = a3;
  -[PKBannerHandleRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_passUniqueIdentifier, CFSTR("passUniqueIdentifier"), v5.receiver, v5.super_class);

}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

@end
