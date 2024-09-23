@implementation CHDDataLabel

+ (CHDDataLabel)dataLabelWithResources:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResources:", v3);

  return (CHDDataLabel *)v4;
}

- (CHDDataLabel)initWithResources:(id)a3
{
  id v4;
  CHDDataLabel *v5;
  CHDDataLabel *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CHDDataLabel;
  v5 = -[CHDDataLabel init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    *(_WORD *)&v6->mDeleted = 0;
    v6->mRotation = 0.0;
    v6->mContentFormatId = -1;
    *(_QWORD *)&v6->mPosition = 0;
    *(_DWORD *)&v6->mShowBubbleSize = 0;
  }

  return v6;
}

- (void)setShowLeaderLines:(BOOL)a3
{
  self->mShowLeaderLines = a3;
}

- (void)setShowCategoryName:(BOOL)a3
{
  self->mShowCategoryName = a3;
}

- (void)setShowPercent:(BOOL)a3
{
  self->mShowPercent = a3;
}

- (void)setShowValue:(BOOL)a3
{
  self->mShowValue = a3;
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

- (void)setShowLegendKey:(BOOL)a3
{
  self->mShowLegendKey = a3;
}

- (void)setShowSeriesName:(BOOL)a3
{
  self->mShowSeriesName = a3;
}

- (void)setPosition:(int)a3
{
  self->mPosition = a3;
}

- (void)setString:(id)a3
{
  objc_storeStrong((id *)&self->mString, a3);
}

- (void)setRotationAngle:(double)a3
{
  self->mRotation = a3;
}

- (BOOL)isShowValue
{
  return self->mShowValue;
}

- (void)setContentFormatId:(unint64_t)a3
{
  self->mContentFormatId = a3;
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

- (int)position
{
  return self->mPosition;
}

- (BOOL)isShowPercent
{
  return self->mShowPercent;
}

- (BOOL)isShowCategoryName
{
  return self->mShowCategoryName;
}

- (BOOL)isShowSeriesName
{
  return self->mShowSeriesName;
}

- (BOOL)isShowLegendKey
{
  return self->mShowLegendKey;
}

- (BOOL)isPositionAffineTransform
{
  return self->mIsPositionAffineTransform;
}

- (void)setIsPositionAffineTransform:(BOOL)a3
{
  self->mIsPositionAffineTransform = a3;
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

- (BOOL)isShowLeaderLines
{
  return self->mShowLeaderLines;
}

- (BOOL)hasLeaderLinesGraphics
{
  return self->mLeaderlineGraphicProperties != 0;
}

- (BOOL)isShowBubbleSize
{
  return self->mShowBubbleSize;
}

- (void)setShowBubbleSize:(BOOL)a3
{
  self->mShowBubbleSize = a3;
}

- (BOOL)isDeleted
{
  return self->mDeleted;
}

- (void)setDeleted:(BOOL)a3
{
  self->mDeleted = a3;
}

- (BOOL)isExtensionDetected
{
  return self->mExtensionDetected;
}

- (BOOL)isLabelVisible
{
  return !self->mDeleted
      && (self->mShowPercent
       || self->mShowValue
       || self->mShowCategoryName
       || self->mShowSeriesName
       || self->mShowBubbleSize);
}

- (void)setExtensionDetected:(BOOL)a3
{
  self->mExtensionDetected = a3;
}

- (BOOL)isCustomLabelBlockingVisibility
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  -[CHDDataLabel string](self, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    goto LABEL_4;
  objc_msgSend(v2, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_4;
  objc_msgSend(v3, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "length");
  if (!v8)
    v9 = 1;
  else
LABEL_4:
    v9 = 0;

  return v9;
}

- (id)graphicProperties
{
  return self->mGraphicProperties;
}

- (id)leaderlineGraphicProperties
{
  return self->mLeaderlineGraphicProperties;
}

- (void)setLeaderlineGraphicProperties:(id)a3
{
  OADGraphicProperties *v5;
  OADGraphicProperties **p_mLeaderlineGraphicProperties;
  OADGraphicProperties *mLeaderlineGraphicProperties;
  OADGraphicProperties *v8;

  v5 = (OADGraphicProperties *)a3;
  mLeaderlineGraphicProperties = self->mLeaderlineGraphicProperties;
  p_mLeaderlineGraphicProperties = &self->mLeaderlineGraphicProperties;
  if (mLeaderlineGraphicProperties != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mLeaderlineGraphicProperties, a3);
    v5 = v8;
  }

}

- (double)rotationAngle
{
  return self->mRotation;
}

- (EDString)string
{
  return self->mString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLeaderlineGraphicProperties, 0);
  objc_storeStrong((id *)&self->mGraphicProperties, 0);
  objc_storeStrong((id *)&self->mString, 0);
  objc_destroyWeak((id *)&self->mResources);
}

- (unint64_t)contentFormatId
{
  return self->mContentFormatId;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDDataLabel;
  -[CHDDataLabel description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
