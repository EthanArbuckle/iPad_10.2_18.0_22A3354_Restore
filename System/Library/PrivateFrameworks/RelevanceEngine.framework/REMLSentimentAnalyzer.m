@implementation REMLSentimentAnalyzer

- (REMLSentimentAnalyzer)initWithContentRanker:(id)a3
{
  id v5;
  REMLSentimentAnalyzer *v6;
  REMLSentimentAnalyzer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMLSentimentAnalyzer;
  v6 = -[REMLSentimentAnalyzer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contentRanker, a3);

  return v7;
}

- (id)sentimentForText:(id)a3
{
  void *v4;
  void *v5;

  RETokenizeString(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMLSentimentAnalyzer sentimentForTokens:](self, "sentimentForTokens:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sentimentForTokens:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  float v9;
  double v10;

  v4 = a3;
  -[REContentRanker predict:](self->_contentRanker, "predict:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "valid"))
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v5, "positivePolarity");
    *(float *)&v7 = v7;
    objc_msgSend(v6, "setPostivieSentiment:", v7);
    objc_msgSend(v5, "negativePolarity");
    *(float *)&v8 = v8;
    objc_msgSend(v6, "setNegativeSentiment:", v8);
    v9 = (float)(int)objc_msgSend(v5, "unknownCount");
    *(float *)&v10 = 1.0 - (float)(v9 / (float)(unint64_t)objc_msgSend(v4, "count"));
    objc_msgSend(v6, "setCertainty:", v10);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithContentRanker:", self->_contentRanker);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentRanker, 0);
}

@end
