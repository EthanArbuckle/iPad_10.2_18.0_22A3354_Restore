@implementation CHDLegend

- (CHDLegend)initWithResources:(id)a3
{
  id v4;
  CHDLegend *v5;
  CHDLegend *v6;
  EDCollection *v7;
  EDCollection *mLegendEntries;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CHDLegend;
  v5 = -[CHDLegend init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v6->mFontIndex = -1;
    v6->mLegendPosition = 0;
    v7 = objc_alloc_init(EDCollection);
    mLegendEntries = v6->mLegendEntries;
    v6->mLegendEntries = v7;

    *(_WORD *)&v6->mIsVertical = 1;
  }

  return v6;
}

- (void)setFontIndex:(unint64_t)a3
{
  self->mFontIndex = a3;
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

- (void)setLegendPosition:(int)a3
{
  self->mLegendPosition = a3;
}

- (void)setIsSingleColumnLegend:(BOOL)a3
{
  self->mIsVertical = a3;
}

- (id)legendEntries
{
  return self->mLegendEntries;
}

- (int)legendPosition
{
  return self->mLegendPosition;
}

- (id)font
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "fonts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", self->mFontIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setFont:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "fonts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->mFontIndex = objc_msgSend(v5, "addOrEquivalentObject:", v6);

}

- (id)graphicProperties
{
  return self->mGraphicProperties;
}

- (BOOL)isSingleColumnLegend
{
  return self->mIsVertical;
}

- (BOOL)isOverlay
{
  return self->mIsOverlay;
}

- (void)setIsOverlay:(BOOL)a3
{
  self->mIsOverlay = a3;
}

- (id)labelEffects
{
  return self->mLabelEffects;
}

- (void)setLabelEffects:(id)a3
{
  NSArray *v5;
  NSArray **p_mLabelEffects;
  NSArray *mLabelEffects;
  NSArray *v8;

  v5 = (NSArray *)a3;
  mLabelEffects = self->mLabelEffects;
  p_mLabelEffects = &self->mLabelEffects;
  if (mLabelEffects != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mLabelEffects, a3);
    v5 = v8;
  }

}

- (BOOL)isAutoSizeAndPosition
{
  return !-[OADDrawableProperties hasOrientedBounds](self->mGraphicProperties, "hasOrientedBounds");
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDLegend;
  -[CHDLegend description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLabelEffects, 0);
  objc_destroyWeak((id *)&self->mResources);
  objc_storeStrong((id *)&self->mLegendEntries, 0);
  objc_storeStrong((id *)&self->mGraphicProperties, 0);
}

- (unint64_t)fontIndex
{
  return self->mFontIndex;
}

@end
