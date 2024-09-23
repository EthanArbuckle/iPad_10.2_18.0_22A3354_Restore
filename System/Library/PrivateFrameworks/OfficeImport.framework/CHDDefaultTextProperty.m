@implementation CHDDefaultTextProperty

+ (id)defaultTextPropertyWithResources:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResources:", v3);

  return v4;
}

- (CHDDefaultTextProperty)initWithResources:(id)a3
{
  id v4;
  CHDDefaultTextProperty *v5;
  CHDDefaultTextProperty *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CHDDefaultTextProperty;
  v5 = -[CHDDefaultTextProperty init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v6->mDefaultTextType = 2;
    v6->mContentFormatId = -1;
    *(_QWORD *)&v6->mLabelPosition = 0;
  }

  return v6;
}

- (void)setRuns:(id)a3
{
  EDRunsCollection *v5;
  EDRunsCollection **p_mRuns;
  EDRunsCollection *mRuns;
  EDRunsCollection *v8;

  v5 = (EDRunsCollection *)a3;
  mRuns = self->mRuns;
  p_mRuns = &self->mRuns;
  if (mRuns != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mRuns, a3);
    v5 = v8;
  }

}

- (void)setContentFormatId:(unint64_t)a3
{
  self->mContentFormatId = a3;
}

- (void)setDefaultTextType:(int)a3
{
  self->mDefaultTextType = a3;
}

- (void)setLabelPosition:(int)a3
{
  self->mLabelPosition = a3;
}

- (void)setIsShowCategoryLabel:(BOOL)a3
{
  self->mShowCategoryLabel = a3;
}

- (void)setIsShowValueLabel:(BOOL)a3
{
  self->mShowValueLabel = a3;
}

- (void)setIsShowPercentageLabel:(BOOL)a3
{
  self->mShowPercentageLabel = a3;
}

- (void)setIsShowSeriesLabel:(BOOL)a3
{
  self->mShowSeriesLabel = a3;
}

- (int64_t)key
{
  return self->mDefaultTextType;
}

- (id)runs
{
  return self->mRuns;
}

- (int)defaultTextType
{
  return self->mDefaultTextType;
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

- (int)labelPosition
{
  return self->mLabelPosition;
}

- (BOOL)isShowCategoryLabel
{
  return self->mShowCategoryLabel;
}

- (BOOL)isShowValueLabel
{
  return self->mShowValueLabel;
}

- (BOOL)isShowPercentageLabel
{
  return self->mShowPercentageLabel;
}

- (BOOL)isShowBubbleSizeLabel
{
  return self->mShowBubbleSizeLabel;
}

- (void)setIsShowBubbleSizeLabel:(BOOL)a3
{
  self->mShowBubbleSizeLabel = a3;
}

- (BOOL)isShowSeriesLabel
{
  return self->mShowSeriesLabel;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDDefaultTextProperty;
  -[CHDDefaultTextProperty description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRuns, 0);
  objc_destroyWeak((id *)&self->mResources);
}

- (unint64_t)contentFormatId
{
  return self->mContentFormatId;
}

@end
