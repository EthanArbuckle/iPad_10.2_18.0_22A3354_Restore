@implementation PKPassDynamicState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevancyModel, 0);
  objc_storeStrong((id *)&self->_balanceModel, 0);
  objc_storeStrong((id *)&self->_liveRender, 0);
}

- (void)setLiveRender:(id)a3
{
  objc_storeStrong((id *)&self->_liveRender, a3);
}

- (void)encodeWithCoder:(id)a3
{
  PKPassLiveRender *liveRender;
  id v5;

  liveRender = self->_liveRender;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", liveRender, CFSTR("liveRender"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_balanceModel, CFSTR("balances"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relevancyModel, CFSTR("relevancy"));

}

- (PKPassDynamicState)initWithCoder:(id)a3
{
  id v4;
  PKPassDynamicState *v5;
  uint64_t v6;
  PKPassLiveRender *liveRender;
  uint64_t v8;
  PKPassBalanceModel *balanceModel;
  uint64_t v10;
  PKPassRelevancyModel *relevancyModel;

  v4 = a3;
  v5 = -[PKPassDynamicState init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("liveRender"));
    v6 = objc_claimAutoreleasedReturnValue();
    liveRender = v5->_liveRender;
    v5->_liveRender = (PKPassLiveRender *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("balances"));
    v8 = objc_claimAutoreleasedReturnValue();
    balanceModel = v5->_balanceModel;
    v5->_balanceModel = (PKPassBalanceModel *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relevancy"));
    v10 = objc_claimAutoreleasedReturnValue();
    relevancyModel = v5->_relevancyModel;
    v5->_relevancyModel = (PKPassRelevancyModel *)v10;

  }
  return v5;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassDynamicState;
  return -[PKPassDynamicState init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPassDynamicState;
  return -[PKPassDynamicState isEqual:](&v4, sel_isEqual_, a3);
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassDynamicState;
  return -[PKPassDynamicState hash](&v3, sel_hash);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassLiveRender description](self->_liveRender, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("liveRender: %@"), v4);

  -[PKPassBalanceModel description](self->_balanceModel, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("balanceModel: %@"), v5);

  -[PKPassRelevancyModel description](self->_relevancyModel, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("relevancyModel: %@"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (PKPassLiveRender)liveRender
{
  return self->_liveRender;
}

- (PKPassBalanceModel)balanceModel
{
  return self->_balanceModel;
}

- (void)setBalanceModel:(id)a3
{
  objc_storeStrong((id *)&self->_balanceModel, a3);
}

- (PKPassRelevancyModel)relevancyModel
{
  return self->_relevancyModel;
}

- (void)setRelevancyModel:(id)a3
{
  objc_storeStrong((id *)&self->_relevancyModel, a3);
}

@end
