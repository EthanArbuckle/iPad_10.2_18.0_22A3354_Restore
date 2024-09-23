@implementation CHDTrendlineLabel

+ (CHDTrendlineLabel)trendlineLabelWithResources:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResources:", v3);

  return (CHDTrendlineLabel *)v4;
}

- (CHDTrendlineLabel)initWithResources:(id)a3
{
  id v4;
  CHDTrendlineLabel *v5;
  CHDTrendlineLabel *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CHDTrendlineLabel;
  v5 = -[CHDTrendlineLabel init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v6->mContentFormatId = -1;
    *(_WORD *)&v6->mGeneratedText = 1;
  }

  return v6;
}

- (void)setName:(id)a3 chart:(id)a4
{
  id v7;
  CHDFormula **p_mName;
  CHDFormula *mName;
  void *v10;
  CHDFormula *v11;

  v11 = (CHDFormula *)a3;
  v7 = a4;
  mName = self->mName;
  p_mName = &self->mName;
  if (mName != v11)
  {
    objc_storeStrong((id *)p_mName, a3);
    if (v11)
    {
      objc_msgSend(v7, "processors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "markObject:processor:", v11, objc_opt_class());

    }
  }

}

- (void)setContentFormatId:(unint64_t)a3
{
  self->mContentFormatId = a3;
}

- (void)setGeneratedText:(BOOL)a3
{
  self->mGeneratedText = a3;
}

- (void)setAutomaticLabelDeleted:(BOOL)a3
{
  self->mAutomaticLabelDeleted = a3;
}

- (void)setLastCachedName:(id)a3
{
  objc_storeStrong((id *)&self->mLastCachedName, a3);
}

- (void)setGraphicProperties:(id)a3
{
  OADGraphicProperties *v5;
  OADGraphicProperties **p_mGraphicProperties;
  OADGraphicProperties *mGraphicProperties;
  OADGraphicProperties *v8;

  v5 = (OADGraphicProperties *)a3;
  mGraphicProperties = self->mGraphicProperties;
  p_mGraphicProperties = &self->mGraphicProperties;
  if (mGraphicProperties != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mGraphicProperties, a3);
    v5 = v8;
  }

}

- (void)setContentFormat:(id)a3
{
  unint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "formatId");
  if (v4 == -1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    objc_msgSend(WeakRetained, "contentFormats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v6, "addOrEquivalentObject:", v8));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->mContentFormatId = objc_msgSend(v7, "formatId");

  }
  else
  {
    self->mContentFormatId = v4;
  }

}

- (id)name
{
  return self->mName;
}

- (id)contentFormat
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "contentFormats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectWithKey:", self->mContentFormatId);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isContentFormatDerivedFromDataPoints
{
  return self->mContentFormatDerived;
}

- (void)setIsContentFormatDerivedFromDataPoints:(BOOL)a3
{
  self->mContentFormatDerived = a3;
}

- (BOOL)isGeneratedText
{
  return self->mGeneratedText;
}

- (BOOL)isAutomaticLabelDeleted
{
  return self->mAutomaticLabelDeleted;
}

- (id)graphicProperties
{
  return self->mGraphicProperties;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDTrendlineLabel;
  -[CHDTrendlineLabel description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (EDString)lastCachedName
{
  return self->mLastCachedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLastCachedName, 0);
  objc_storeStrong((id *)&self->mGraphicProperties, 0);
  objc_storeStrong((id *)&self->mName, 0);
  objc_destroyWeak((id *)&self->mResources);
}

- (unint64_t)contentFormatId
{
  return self->mContentFormatId;
}

@end
