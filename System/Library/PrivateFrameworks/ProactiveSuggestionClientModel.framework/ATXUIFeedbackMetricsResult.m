@implementation ATXUIFeedbackMetricsResult

- (ATXUIFeedbackMetricsResult)initWithSpecification:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  ATXUIFeedbackMetricsResult *v11;
  ATXTrendPlot *v12;
  ATXTrendPlot *trendPlot;
  uint64_t v14;
  ATXUIFeedbackMetricsResultSection *sectionForShownSuggestions;
  uint64_t v16;
  ATXUIFeedbackMetricsResultSection *sectionForEngagedSuggestions;
  uint64_t v18;
  ATXUIFeedbackMetricsResultSection *sectionForRejectedSuggestions;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ATXUIFeedbackMetricsResult;
  v11 = -[ATXUIFeedbackMetricsResult init](&v21, sel_init);
  if (v11)
  {
    v12 = -[ATXTrendPlot initWithStartDate:endDate:granularity:binInitialDataProvider:]([ATXTrendPlot alloc], "initWithStartDate:endDate:granularity:binInitialDataProvider:", v9, v10, objc_msgSend(v8, "trendPlotGranularity"), &__block_literal_global_10);
    trendPlot = v11->_trendPlot;
    v11->_trendPlot = v12;

    v14 = objc_opt_new();
    sectionForShownSuggestions = v11->_sectionForShownSuggestions;
    v11->_sectionForShownSuggestions = (ATXUIFeedbackMetricsResultSection *)v14;

    v16 = objc_opt_new();
    sectionForEngagedSuggestions = v11->_sectionForEngagedSuggestions;
    v11->_sectionForEngagedSuggestions = (ATXUIFeedbackMetricsResultSection *)v16;

    v18 = objc_opt_new();
    sectionForRejectedSuggestions = v11->_sectionForRejectedSuggestions;
    v11->_sectionForRejectedSuggestions = (ATXUIFeedbackMetricsResultSection *)v18;

  }
  return v11;
}

id __70__ATXUIFeedbackMetricsResult_initWithSpecification_startDate_endDate___block_invoke()
{
  return (id)objc_opt_new();
}

- (BOOL)isEqual:(id)a3
{
  ATXUIFeedbackMetricsResult *v4;
  ATXUIFeedbackMetricsResult *v5;
  BOOL v6;

  v4 = (ATXUIFeedbackMetricsResult *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXUIFeedbackMetricsResult isEqualToATXUIFeedbackMetricsResult:](self, "isEqualToATXUIFeedbackMetricsResult:", v5);

  return v6;
}

- (BOOL)isEqualToATXUIFeedbackMetricsResult:(id)a3
{
  id *v4;
  ATXTrendPlot *trendPlot;
  ATXTrendPlot *v6;
  ATXTrendPlot *v7;
  ATXTrendPlot *v8;
  BOOL v9;
  ATXUIFeedbackMetricsResultSection *sectionForShownSuggestions;
  ATXUIFeedbackMetricsResultSection *v11;
  ATXUIFeedbackMetricsResultSection *v12;
  ATXUIFeedbackMetricsResultSection *v13;
  BOOL v14;
  ATXUIFeedbackMetricsResultSection *sectionForEngagedSuggestions;
  ATXUIFeedbackMetricsResultSection *v16;
  ATXUIFeedbackMetricsResultSection *v17;
  ATXUIFeedbackMetricsResultSection *v18;
  BOOL v19;
  char v20;
  ATXUIFeedbackMetricsResultSection *v21;
  ATXUIFeedbackMetricsResultSection *v22;

  v4 = (id *)a3;
  trendPlot = self->_trendPlot;
  v6 = (ATXTrendPlot *)v4[1];
  if (trendPlot == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = trendPlot;
    v9 = -[ATXTrendPlot isEqual:](v8, "isEqual:", v7);

    if (!v9)
      goto LABEL_11;
  }
  sectionForShownSuggestions = self->_sectionForShownSuggestions;
  v11 = (ATXUIFeedbackMetricsResultSection *)v4[2];
  if (sectionForShownSuggestions == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = sectionForShownSuggestions;
    v14 = -[ATXUIFeedbackMetricsResultSection isEqual:](v13, "isEqual:", v12);

    if (!v14)
      goto LABEL_11;
  }
  sectionForEngagedSuggestions = self->_sectionForEngagedSuggestions;
  v16 = (ATXUIFeedbackMetricsResultSection *)v4[3];
  if (sectionForEngagedSuggestions == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = sectionForEngagedSuggestions;
    v19 = -[ATXUIFeedbackMetricsResultSection isEqual:](v18, "isEqual:", v17);

    if (!v19)
    {
LABEL_11:
      v20 = 0;
      goto LABEL_17;
    }
  }
  v21 = self->_sectionForRejectedSuggestions;
  v22 = v21;
  if (v21 == v4[4])
    v20 = 1;
  else
    v20 = -[ATXUIFeedbackMetricsResultSection isEqual:](v21, "isEqual:");

LABEL_17:
  return v20;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[ATXTrendPlot hash](self->_trendPlot, "hash");
  v4 = -[ATXUIFeedbackMetricsResultSection hash](self->_sectionForShownSuggestions, "hash") - v3 + 32 * v3;
  v5 = -[ATXUIFeedbackMetricsResultSection hash](self->_sectionForEngagedSuggestions, "hash") - v4 + 32 * v4;
  return -[ATXUIFeedbackMetricsResultSection hash](self->_sectionForRejectedSuggestions, "hash") - v5 + 32 * v5;
}

- (ATXTrendPlot)trendPlot
{
  return self->_trendPlot;
}

- (ATXUIFeedbackMetricsResultSection)sectionForShownSuggestions
{
  return self->_sectionForShownSuggestions;
}

- (ATXUIFeedbackMetricsResultSection)sectionForEngagedSuggestions
{
  return self->_sectionForEngagedSuggestions;
}

- (ATXUIFeedbackMetricsResultSection)sectionForRejectedSuggestions
{
  return self->_sectionForRejectedSuggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionForRejectedSuggestions, 0);
  objc_storeStrong((id *)&self->_sectionForEngagedSuggestions, 0);
  objc_storeStrong((id *)&self->_sectionForShownSuggestions, 0);
  objc_storeStrong((id *)&self->_trendPlot, 0);
}

@end
