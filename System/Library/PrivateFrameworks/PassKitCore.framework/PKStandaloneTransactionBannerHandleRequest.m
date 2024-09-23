@implementation PKStandaloneTransactionBannerHandleRequest

+ (id)createForPassUniqueIdentifier:(id)a3 withDisplayableName:(id)a4 transactionType:(int64_t)a5 walletForeground:(BOOL)a6
{
  id v9;
  _QWORD *v10;
  id v11;
  PKStandaloneTransactionBannerHandleRequest *v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v9 = a3;
  v10 = 0;
  if (v9 && a5)
  {
    v11 = a4;
    v12 = [PKStandaloneTransactionBannerHandleRequest alloc];
    if (v12)
    {
      v19.receiver = v12;
      v19.super_class = (Class)PKBannerHandleRequest;
      v13 = objc_msgSendSuper2(&v19, sel_init);
      v10 = v13;
      if (v13)
        v13[1] = 2;
    }
    else
    {
      v10 = 0;
    }
    v14 = objc_msgSend(v9, "copy");
    v15 = (void *)v10[3];
    v10[3] = v14;

    v16 = objc_msgSend(v11, "copy");
    v17 = (void *)v10[4];
    v10[4] = v16;

    v10[5] = a5;
    *((_BYTE *)v10 + 16) = a6;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKStandaloneTransactionBannerHandleRequest)initWithCoder:(id)a3
{
  id v4;
  PKStandaloneTransactionBannerHandleRequest *v5;
  uint64_t v6;
  NSString *passUniqueIdentifier;
  uint64_t v8;
  NSString *displayableName;
  uint64_t v10;
  PKStandaloneTransactionBannerHandleRequest *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKStandaloneTransactionBannerHandleRequest;
  v5 = -[PKBannerHandleRequest initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passUniqueIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    passUniqueIdentifier = v5->_passUniqueIdentifier;
    v5->_passUniqueIdentifier = (NSString *)v6;

    if (!v5->_passUniqueIdentifier
      || (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayableName")),
          v8 = objc_claimAutoreleasedReturnValue(),
          displayableName = v5->_displayableName,
          v5->_displayableName = (NSString *)v8,
          displayableName,
          v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transactionType")),
          (v5->_transactionType = v10) == 0))
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKStandaloneTransactionBannerHandleRequest"), 0, 0);
      objc_msgSend(v4, "failWithError:", v12);

      v11 = 0;
      goto LABEL_7;
    }
    v5->_walletForeground = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("walletForeground"));
  }
  v11 = v5;
LABEL_7:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKStandaloneTransactionBannerHandleRequest;
  v4 = a3;
  -[PKBannerHandleRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_passUniqueIdentifier, CFSTR("passUniqueIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayableName, CFSTR("displayableName"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_transactionType, CFSTR("transactionType"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_walletForeground, CFSTR("walletForeground"));

}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (NSString)displayableName
{
  return self->_displayableName;
}

- (int64_t)transactionType
{
  return self->_transactionType;
}

- (BOOL)isWalletForeground
{
  return self->_walletForeground;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayableName, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

@end
