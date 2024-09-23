@implementation ATXUIFeedbackMetricsResultSection

- (ATXUIFeedbackMetricsResultSection)init
{
  ATXUIFeedbackMetricsResultSection *v2;
  uint64_t v3;
  ATXScoreDistribution *scoreDistribution;
  uint64_t v5;
  ATXCategoricalAttributeBreakdown *clientModelBreakdown;
  uint64_t v7;
  ATXCategoricalAttributeBreakdown *consumerSubTypeBreakdown;
  uint64_t v9;
  ATXCategoricalAttributeBreakdown *confidenceBreakdown;
  uint64_t v11;
  ATXCategoricalAttributeBreakdown *predictionReasonCodeBreakdown;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ATXUIFeedbackMetricsResultSection;
  v2 = -[ATXUIFeedbackMetricsResultSection init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    scoreDistribution = v2->_scoreDistribution;
    v2->_scoreDistribution = (ATXScoreDistribution *)v3;

    v5 = objc_opt_new();
    clientModelBreakdown = v2->_clientModelBreakdown;
    v2->_clientModelBreakdown = (ATXCategoricalAttributeBreakdown *)v5;

    v7 = objc_opt_new();
    consumerSubTypeBreakdown = v2->_consumerSubTypeBreakdown;
    v2->_consumerSubTypeBreakdown = (ATXCategoricalAttributeBreakdown *)v7;

    v9 = objc_opt_new();
    confidenceBreakdown = v2->_confidenceBreakdown;
    v2->_confidenceBreakdown = (ATXCategoricalAttributeBreakdown *)v9;

    v11 = objc_opt_new();
    predictionReasonCodeBreakdown = v2->_predictionReasonCodeBreakdown;
    v2->_predictionReasonCodeBreakdown = (ATXCategoricalAttributeBreakdown *)v11;

  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  ATXUIFeedbackMetricsResultSection *v4;
  ATXUIFeedbackMetricsResultSection *v5;
  BOOL v6;

  v4 = (ATXUIFeedbackMetricsResultSection *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXUIFeedbackMetricsResultSection isEqualToATXUIFeedbackMetricsResultSection:](self, "isEqualToATXUIFeedbackMetricsResultSection:", v5);

  return v6;
}

- (BOOL)isEqualToATXUIFeedbackMetricsResultSection:(id)a3
{
  id *v4;
  ATXScoreDistribution *scoreDistribution;
  ATXScoreDistribution *v6;
  ATXScoreDistribution *v7;
  ATXScoreDistribution *v8;
  BOOL v9;
  ATXCategoricalAttributeBreakdown *clientModelBreakdown;
  ATXCategoricalAttributeBreakdown *v11;
  ATXCategoricalAttributeBreakdown *v12;
  ATXCategoricalAttributeBreakdown *v13;
  BOOL v14;
  ATXCategoricalAttributeBreakdown *consumerSubTypeBreakdown;
  ATXCategoricalAttributeBreakdown *v16;
  ATXCategoricalAttributeBreakdown *v17;
  ATXCategoricalAttributeBreakdown *v18;
  BOOL v19;
  ATXCategoricalAttributeBreakdown *confidenceBreakdown;
  ATXCategoricalAttributeBreakdown *v21;
  ATXCategoricalAttributeBreakdown *v22;
  ATXCategoricalAttributeBreakdown *v23;
  BOOL v24;
  char v25;
  ATXCategoricalAttributeBreakdown *v26;
  ATXCategoricalAttributeBreakdown *v27;

  v4 = (id *)a3;
  scoreDistribution = self->_scoreDistribution;
  v6 = (ATXScoreDistribution *)v4[1];
  if (scoreDistribution == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = scoreDistribution;
    v9 = -[ATXScoreDistribution isEqual:](v8, "isEqual:", v7);

    if (!v9)
      goto LABEL_15;
  }
  clientModelBreakdown = self->_clientModelBreakdown;
  v11 = (ATXCategoricalAttributeBreakdown *)v4[2];
  if (clientModelBreakdown == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = clientModelBreakdown;
    v14 = -[ATXCategoricalAttributeBreakdown isEqual:](v13, "isEqual:", v12);

    if (!v14)
      goto LABEL_15;
  }
  consumerSubTypeBreakdown = self->_consumerSubTypeBreakdown;
  v16 = (ATXCategoricalAttributeBreakdown *)v4[3];
  if (consumerSubTypeBreakdown == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = consumerSubTypeBreakdown;
    v19 = -[ATXCategoricalAttributeBreakdown isEqual:](v18, "isEqual:", v17);

    if (!v19)
      goto LABEL_15;
  }
  confidenceBreakdown = self->_confidenceBreakdown;
  v21 = (ATXCategoricalAttributeBreakdown *)v4[4];
  if (confidenceBreakdown == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = confidenceBreakdown;
    v24 = -[ATXCategoricalAttributeBreakdown isEqual:](v23, "isEqual:", v22);

    if (!v24)
    {
LABEL_15:
      v25 = 0;
      goto LABEL_21;
    }
  }
  v26 = self->_predictionReasonCodeBreakdown;
  v27 = v26;
  if (v26 == v4[5])
    v25 = 1;
  else
    v25 = -[ATXCategoricalAttributeBreakdown isEqual:](v26, "isEqual:");

LABEL_21:
  return v25;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[ATXScoreDistribution hash](self->_scoreDistribution, "hash");
  v4 = -[ATXCategoricalAttributeBreakdown hash](self->_clientModelBreakdown, "hash") - v3 + 32 * v3;
  v5 = -[ATXCategoricalAttributeBreakdown hash](self->_consumerSubTypeBreakdown, "hash") - v4 + 32 * v4;
  v6 = -[ATXCategoricalAttributeBreakdown hash](self->_confidenceBreakdown, "hash") - v5 + 32 * v5;
  return -[ATXCategoricalAttributeBreakdown hash](self->_predictionReasonCodeBreakdown, "hash") - v6 + 32 * v6;
}

- (ATXScoreDistribution)scoreDistribution
{
  return self->_scoreDistribution;
}

- (ATXCategoricalAttributeBreakdown)clientModelBreakdown
{
  return self->_clientModelBreakdown;
}

- (ATXCategoricalAttributeBreakdown)consumerSubTypeBreakdown
{
  return self->_consumerSubTypeBreakdown;
}

- (ATXCategoricalAttributeBreakdown)confidenceBreakdown
{
  return self->_confidenceBreakdown;
}

- (ATXCategoricalAttributeBreakdown)predictionReasonCodeBreakdown
{
  return self->_predictionReasonCodeBreakdown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionReasonCodeBreakdown, 0);
  objc_storeStrong((id *)&self->_confidenceBreakdown, 0);
  objc_storeStrong((id *)&self->_consumerSubTypeBreakdown, 0);
  objc_storeStrong((id *)&self->_clientModelBreakdown, 0);
  objc_storeStrong((id *)&self->_scoreDistribution, 0);
}

@end
