@implementation PKExpressTransactionBannerHandleState

+ (id)createForTransactionState:(id)a3
{
  id v3;
  id v4;
  PKExpressTransactionBannerHandleState *v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (!v4)
  {
    __break(1u);
    goto LABEL_7;
  }
  v3 = v4;
  v5 = [PKExpressTransactionBannerHandleState alloc];
  if (!v5)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_5;
  }
  v10.receiver = v5;
  v10.super_class = (Class)PKBannerHandleState;
  v6 = objc_msgSendSuper2(&v10, sel_init);
  v7 = v6;
  if (v6)
    v6[1] = 0;
LABEL_5:
  v8 = (void *)v7[2];
  v7[2] = v3;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKExpressTransactionBannerHandleState)initWithCoder:(id)a3
{
  id v4;
  PKExpressTransactionBannerHandleState *v5;
  uint64_t v6;
  PKExpressTransactionState *transactionState;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKExpressTransactionBannerHandleState;
  v5 = -[PKBannerHandleState initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionState"));
    v6 = objc_claimAutoreleasedReturnValue();
    transactionState = v5->_transactionState;
    v5->_transactionState = (PKExpressTransactionState *)v6;

    if (!v5->_transactionState)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKExpressTransactionBannerHandleState"), 0, 0);
      objc_msgSend(v4, "failWithError:", v8);

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKExpressTransactionBannerHandleState;
  v4 = a3;
  -[PKBannerHandleState encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_transactionState, CFSTR("transactionState"), v5.receiver, v5.super_class);

}

- (PKExpressTransactionState)transactionState
{
  return self->_transactionState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionState, 0);
}

@end
