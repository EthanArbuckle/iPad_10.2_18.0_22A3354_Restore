@implementation EDOfficeArtClient

- (void)setAnchor:(id)a3
{
  objc_storeStrong((id *)&self->mAnchor, a3);
  self->mIsBoundsSet = 0;
}

- (BOOL)hasBounds
{
  return self->mIsBoundsSet;
}

- (id)anchor
{
  return self->mAnchor;
}

- (id)comment
{
  return self->mComment;
}

- (BOOL)hasText
{
  EDTextBox *mTextBox;
  void *v3;
  void *v4;
  BOOL v5;

  mTextBox = self->mTextBox;
  if (!mTextBox)
    return 0;
  -[EDTextBox text](mTextBox, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") != 0;

  return v5;
}

- (void)setTextBox:(id)a3
{
  objc_storeStrong((id *)&self->mTextBox, a3);
}

- (id)textBox
{
  return self->mTextBox;
}

- (void)setBounds:(CGRect)a3
{
  self->mIsBoundsSet = 1;
  self->mBounds = a3;
}

- (void)setSheet:(id)a3
{
  objc_storeStrong((id *)&self->mSheet, a3);
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mBounds.origin.x;
  y = self->mBounds.origin.y;
  width = self->mBounds.size.width;
  height = self->mBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setComment:(id)a3
{
  objc_storeStrong((id *)&self->mComment, a3);
}

- (id)clientState
{
  return self->mClientState;
}

- (void)setClientState:(id)a3
{
  id v5;
  id *p_mClientState;
  id mClientState;
  id v8;

  v5 = a3;
  mClientState = self->mClientState;
  p_mClientState = &self->mClientState;
  if (mClientState != v5)
  {
    v8 = v5;
    objc_storeStrong(p_mClientState, a3);
    v5 = v8;
  }

}

- (BOOL)areBoundsSet
{
  return self->mIsBoundsSet;
}

- (id)sheet
{
  return self->mSheet;
}

- (id)tableModels
{
  return self->mTableModels;
}

- (void)setTableModels:(id)a3
{
  objc_storeStrong((id *)&self->mTableModels, a3);
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDOfficeArtClient;
  -[EDOfficeArtClient description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTableModels, 0);
  objc_storeStrong((id *)&self->mComment, 0);
  objc_storeStrong((id *)&self->mTextBox, 0);
  objc_storeStrong((id *)&self->mAnchor, 0);
  objc_storeStrong(&self->mClientState, 0);
  objc_storeStrong((id *)&self->mSheet, 0);
}

@end
