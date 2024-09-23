@implementation CHDAxis

- (CHDAxis)initWithResources:(id)a3
{
  id v4;
  CHDAxis *v5;
  CHDAxis *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CHDAxis;
  v5 = -[CHDAxis init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    *(_WORD *)&v6->mAutoCrossValue = 1;
    *(_QWORD *)&v6->mReverseOrder = 0x101000100000000;
    v6->mContentFormatId = -1;
    v6->mFontIndex = -1;
    v6->mScalingMaximum = 0.0;
    v6->mScalingMinimum = 0.0;
    v6->mOrientation = 0;
    v6->mTickLabelPosition = 3;
    v6->mAxisId = -1;
    *(_QWORD *)&v6->mCrossBetween = 1;
    *(_OWORD *)&v6->mCrossAxisId = xmmword_22A4C1920;
    *(_OWORD *)&v6->mMajorTickMark = xmmword_22A4C1910;
    v6->mTickLabelRotation = 0.0;
    v6->mIsAutoRotation = 0;
    v6->mTickLabelColorIndex = -1;
  }

  return v6;
}

- (void)setReverseOrder:(BOOL)a3
{
  self->mReverseOrder = a3;
  self->mOrientation = a3;
}

- (void)setCrossesAt:(double)a3
{
  self->mCrossesAt = a3;
  self->mAutoCrossValue = 0;
}

- (void)setCrossBetween:(int)a3
{
  self->mCrossBetween = a3;
}

- (void)setAxisId:(int)a3
{
  self->mAxisId = a3;
}

- (void)setAxisType:(int)a3
{
  self->mAxisType = a3;
}

- (void)setAxisPosition:(int)a3
{
  self->mAxisPosition = a3;
}

- (void)setAxisGraphicProperties:(id)a3
{
  OADGraphicProperties *v5;
  OADGraphicProperties **p_mAxisGraphicProperties;
  OADGraphicProperties *mAxisGraphicProperties;
  OADGraphicProperties *v8;

  v5 = (OADGraphicProperties *)a3;
  mAxisGraphicProperties = self->mAxisGraphicProperties;
  p_mAxisGraphicProperties = &self->mAxisGraphicProperties;
  if (mAxisGraphicProperties != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mAxisGraphicProperties, a3);
    v5 = v8;
  }

}

- (void)setMajorTickMark:(int)a3
{
  self->mMajorTickMark = a3;
}

- (void)setMinorTickMark:(int)a3
{
  self->mMinorTickMark = a3;
}

- (void)setTickLabelPosition:(int)a3
{
  self->mTickLabelPosition = a3;
}

- (void)setTickLabelAutoRotation:(BOOL)a3
{
  self->mIsAutoRotation = a3;
}

- (void)setTickLabelRotationAngle:(double)a3
{
  self->mTickLabelRotation = a3;
}

- (void)setTickLabelColorIndex:(unint64_t)a3
{
  self->mTickLabelColorIndex = a3;
}

- (void)setMinorGridLinesGraphicProperties:(id)a3
{
  OADGraphicProperties *v5;
  OADGraphicProperties **p_mMinorGridLinesGraphicProperties;
  OADGraphicProperties *mMinorGridLinesGraphicProperties;
  OADGraphicProperties *v8;

  v5 = (OADGraphicProperties *)a3;
  mMinorGridLinesGraphicProperties = self->mMinorGridLinesGraphicProperties;
  p_mMinorGridLinesGraphicProperties = &self->mMinorGridLinesGraphicProperties;
  if (mMinorGridLinesGraphicProperties != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mMinorGridLinesGraphicProperties, a3);
    v5 = v8;
  }

}

- (void)setMajorGridLinesGraphicProperties:(id)a3
{
  OADGraphicProperties *v5;
  OADGraphicProperties **p_mMajorGridLinesGraphicProperties;
  OADGraphicProperties *mMajorGridLinesGraphicProperties;
  OADGraphicProperties *v8;

  v5 = (OADGraphicProperties *)a3;
  mMajorGridLinesGraphicProperties = self->mMajorGridLinesGraphicProperties;
  p_mMajorGridLinesGraphicProperties = &self->mMajorGridLinesGraphicProperties;
  if (mMajorGridLinesGraphicProperties != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mMajorGridLinesGraphicProperties, a3);
    v5 = v8;
  }

}

- (int64_t)key
{
  return self->mAxisId;
}

- (void)setScalingMaximum:(double)a3
{
  self->mScalingMaximum = a3;
  self->mAutoMaximumValue = 0;
}

- (void)setTitle:(id)a3
{
  CHDTitle *v5;
  CHDTitle **p_mTitle;
  CHDTitle *mTitle;
  CHDTitle *v8;

  v5 = (CHDTitle *)a3;
  mTitle = self->mTitle;
  p_mTitle = &self->mTitle;
  if (mTitle != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mTitle, a3);
    v5 = v8;
  }

}

- (BOOL)isReverseOrder
{
  return self->mReverseOrder;
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

- (void)setIsContentFormatDerivedFromDataPoints:(BOOL)a3
{
  self->mContentFormatDerived = a3;
}

- (int)axisPosition
{
  return self->mAxisPosition;
}

- (BOOL)isSecondary
{
  return self->mSecondary;
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

- (id)majorGridLinesGraphicProperties
{
  return self->mMajorGridLinesGraphicProperties;
}

- (double)scalingMinimum
{
  return self->mScalingMinimum;
}

- (double)scalingMaximum
{
  return self->mScalingMaximum;
}

- (void)setScalingMinimum:(double)a3
{
  self->mScalingMinimum = a3;
  self->mAutoMinimumValue = 0;
}

- (void)setLineVisible:(BOOL)a3
{
  self->mLineVisible = a3;
}

- (void)setDeleted:(BOOL)a3
{
  self->mDeleted = a3;
}

- (void)setFontIndex:(unint64_t)a3
{
  self->mFontIndex = a3;
}

- (void)setContentFormatId:(unint64_t)a3
{
  self->mContentFormatId = a3;
}

- (void)setCrosses:(int)a3
{
  self->mCrosses = a3;
}

- (BOOL)isHorizontalPosition
{
  int mAxisPosition;

  mAxisPosition = self->mAxisPosition;
  return !mAxisPosition || mAxisPosition == 3;
}

- (void)setSecondary:(BOOL)a3
{
  self->mSecondary = a3;
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

- (int)axisId
{
  return self->mAxisId;
}

- (int)axisIdForXml
{
  return self->mAxisId + 2094734552;
}

- (BOOL)isReverseOrderOverridden
{
  return self->mReverseOrderOverridden;
}

- (void)setReverseOrderOverridden:(BOOL)a3
{
  self->mReverseOrderOverridden = a3;
}

- (BOOL)isLineVisible
{
  return self->mLineVisible;
}

- (BOOL)isDeleted
{
  return self->mDeleted;
}

- (BOOL)isAutoMinimumValue
{
  return self->mAutoMinimumValue;
}

- (BOOL)isAutoMaximumValue
{
  return self->mAutoMaximumValue;
}

- (BOOL)isAutoCrossValue
{
  return self->mAutoCrossValue;
}

- (id)defaultDateTimeContentFormat
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "contentFormats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectWithKey:", 14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isContentFormatDerivedFromDataPoints
{
  return self->mContentFormatDerived;
}

- (int)orientation
{
  return self->mOrientation;
}

- (void)setOrientation:(int)a3
{
  self->mOrientation = a3;
}

- (double)crossAxisId
{
  return self->mCrossAxisId;
}

- (double)crossAxisIdForXml
{
  return self->mCrossAxisId + 2094734550.0;
}

- (void)setCrossAxisId:(double)a3
{
  self->mCrossAxisId = a3;
}

- (double)crossesAt
{
  return self->mCrossesAt;
}

- (int)majorTickMark
{
  return self->mMajorTickMark;
}

- (int)minorTickMark
{
  return self->mMinorTickMark;
}

- (int)axisType
{
  return self->mAxisType;
}

- (int)tickLabelPosition
{
  return self->mTickLabelPosition;
}

- (BOOL)isTickLabelVisible
{
  return self->mTickLabelPosition != 0;
}

- (id)title
{
  return self->mTitle;
}

- (id)minorGridLinesGraphicProperties
{
  return self->mMinorGridLinesGraphicProperties;
}

- (id)axisGraphicProperties
{
  return self->mAxisGraphicProperties;
}

- (int)crossBetween
{
  return self->mCrossBetween;
}

- (int)crosses
{
  return self->mCrosses;
}

- (BOOL)isDate
{
  return 0;
}

- (BOOL)isDateTimeFormattingFlag
{
  return self->mDateTimeFormattingFlag;
}

- (void)setDateTimeFormattingFlag:(BOOL)a3
{
  self->mDateTimeFormattingFlag = a3;
}

- (double)tickLabelRotationAngle
{
  return self->mTickLabelRotation;
}

- (BOOL)isTickLabelAutoRotation
{
  return self->mIsAutoRotation;
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

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDAxis;
  -[CHDAxis description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLabelEffects, 0);
  objc_destroyWeak((id *)&self->mResources);
  objc_storeStrong((id *)&self->mAxisGraphicProperties, 0);
  objc_storeStrong((id *)&self->mMajorGridLinesGraphicProperties, 0);
  objc_storeStrong((id *)&self->mMinorGridLinesGraphicProperties, 0);
  objc_storeStrong((id *)&self->mTitle, 0);
}

- (unint64_t)contentFormatId
{
  return self->mContentFormatId;
}

- (unint64_t)fontIndex
{
  return self->mFontIndex;
}

- (unint64_t)tickLabelColorIndex
{
  return self->mTickLabelColorIndex;
}

- (id)tickLabelColor
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "colors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", self->mTickLabelColorIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
