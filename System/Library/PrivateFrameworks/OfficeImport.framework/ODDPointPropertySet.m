@implementation ODDPointPropertySet

- (void)setLayoutTypeId:(id)a3
{
  objc_storeStrong((id *)&self->mLayoutTypeId, a3);
}

- (void)setPresentationName:(id)a3
{
  objc_storeStrong((id *)&self->mPresentationName, a3);
}

- (void)setPresentationStyleLabel:(id)a3
{
  objc_storeStrong((id *)&self->mPresentationStyleLabel, a3);
}

- (void)setPresentationAssociatedId:(id)a3
{
  objc_storeStrong((id *)&self->mPresentationAssociatedId, a3);
}

- (void)setPresentationStyleCount:(int)a3
{
  self->mPresentationStyleCount = a3;
}

- (void)setPresentationStyleIndex:(int)a3
{
  self->mPresentationStyleIndex = a3;
}

- (id)presentationAssociatedId
{
  return self->mPresentationAssociatedId;
}

- (id)layoutTypeId
{
  return self->mLayoutTypeId;
}

- (double)customScaleX
{
  return self->mCustomScaleX;
}

- (double)customScaleY
{
  return self->mCustomScaleY;
}

- (double)customOffsetX
{
  return self->mCustomOffsetX;
}

- (double)customOffsetY
{
  return self->mCustomOffsetY;
}

- (id)presentationName
{
  return self->mPresentationName;
}

- (id)presentationStyleLabel
{
  return self->mPresentationStyleLabel;
}

- (int)presentationStyleIndex
{
  return self->mPresentationStyleIndex;
}

- (void)setCustomVerticalFlip:(BOOL)a3
{
  self->mCustomVerticalFlip = a3;
}

- (int)presentationStyleCount
{
  return self->mPresentationStyleCount;
}

- (BOOL)customVerticalFlip
{
  return self->mCustomVerticalFlip;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ODDPointPropertySet;
  -[ODDPointPropertySet description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setCustomScaleX:(double)a3
{
  self->mCustomScaleX = a3;
}

- (void)setCustomScaleY:(double)a3
{
  self->mCustomScaleY = a3;
}

- (void)setCustomOffsetX:(double)a3
{
  self->mCustomOffsetX = a3;
}

- (void)setCustomOffsetY:(double)a3
{
  self->mCustomOffsetY = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPresentationAssociatedId, 0);
  objc_storeStrong((id *)&self->mPresentationStyleLabel, 0);
  objc_storeStrong((id *)&self->mPresentationName, 0);
  objc_storeStrong((id *)&self->mLayoutTypeId, 0);
}

@end
