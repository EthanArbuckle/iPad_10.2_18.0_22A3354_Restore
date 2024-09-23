@implementation evaluatedRule

- (evaluatedRule)initWithLabel:(int64_t)a3 score:(float)a4 recipientUniqueID:(id)a5
{
  id v9;
  evaluatedRule *v10;
  evaluatedRule *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)evaluatedRule;
  v10 = -[evaluatedRule init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_ruleLabel = a3;
    v10->_ruleScore = a4;
    objc_storeStrong((id *)&v10->_recipientUniqueID, a5);
  }

  return v11;
}

- (int64_t)compare:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  double v10;
  void *v11;
  int64_t v12;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  -[evaluatedRule ruleScore](self, "ruleScore");
  objc_msgSend(v4, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "ruleScore");
  v9 = v8;

  LODWORD(v10) = v9;
  objc_msgSend(v7, "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "compare:", v11);

  return v12;
}

- (int64_t)ruleLabel
{
  return self->_ruleLabel;
}

- (void)setRuleLabel:(int64_t)a3
{
  self->_ruleLabel = a3;
}

- (float)ruleScore
{
  return self->_ruleScore;
}

- (void)setRuleScore:(float)a3
{
  self->_ruleScore = a3;
}

- (NSNumber)recipientUniqueID
{
  return self->_recipientUniqueID;
}

- (void)setRecipientUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_recipientUniqueID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientUniqueID, 0);
}

@end
