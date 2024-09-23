@implementation OADTableCellProperties

- (void)setLeftMargin:(float)a3
{
  self->mLeftMargin = a3;
  self->mIsLeftMarginOverridden = 1;
}

- (void)setRightMargin:(float)a3
{
  self->mRightMargin = a3;
  self->mIsRightMarginOverridden = 1;
}

- (void)setTopMargin:(float)a3
{
  self->mTopMargin = a3;
  self->mIsTopMarginOverridden = 1;
}

- (void)setBottomMargin:(float)a3
{
  self->mBottomMargin = a3;
  self->mIsBottomMarginOverridden = 1;
}

- (BOOL)isTextAnchorOverridden
{
  return self->mIsTextAnchorOverridden;
}

- (void)setLeftStroke:(id)a3
{
  objc_storeStrong((id *)&self->mLeftStroke, a3);
}

- (void)setRightStroke:(id)a3
{
  objc_storeStrong((id *)&self->mRightStroke, a3);
}

- (void)setTopStroke:(id)a3
{
  objc_storeStrong((id *)&self->mTopStroke, a3);
}

- (void)setBottomStroke:(id)a3
{
  objc_storeStrong((id *)&self->mBottomStroke, a3);
}

- (void)setTopLeftToBottomRightStroke:(id)a3
{
  objc_storeStrong((id *)&self->mTopLeftToBottomRightStroke, a3);
}

- (void)setBottomLeftToTopRightStroke:(id)a3
{
  objc_storeStrong((id *)&self->mBottomLeftToTopRightStroke, a3);
}

- (void)setFill:(id)a3
{
  objc_storeStrong((id *)&self->mFill, a3);
}

- (void)setTextHorizontalOverflow:(unsigned __int8)a3
{
  self->mTextHorizontalOverflow = a3;
  self->mIsTextHorizontalOverflowOverridden = 1;
}

- (id)topStroke
{
  return self->mTopStroke;
}

- (id)bottomStroke
{
  return self->mBottomStroke;
}

- (id)leftStroke
{
  return self->mLeftStroke;
}

- (id)rightStroke
{
  return self->mRightStroke;
}

- (id)fill
{
  return self->mFill;
}

- (void)setTextAnchor:(unsigned __int8)a3
{
  self->mTextAnchor = a3;
  self->mIsTextAnchorOverridden = 1;
}

- (unsigned)textAnchor
{
  return self->mTextAnchor;
}

- (void)setTextAnchorCenter:(BOOL)a3
{
  self->mTextAnchorCenter = a3;
  self->mIsTextAnchorCenterOverridden = 1;
}

- (id)stroke:(int)a3
{
  void *v4;

  v4 = 0;
  switch(a3)
  {
    case 1:
      -[OADTableCellProperties leftStroke](self, "leftStroke");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[OADTableCellProperties rightStroke](self, "rightStroke");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[OADTableCellProperties topStroke](self, "topStroke");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[OADTableCellProperties bottomStroke](self, "bottomStroke");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[OADTableCellProperties topLeftToBottomRightStroke](self, "topLeftToBottomRightStroke");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[OADTableCellProperties bottomLeftToTopRightStroke](self, "bottomLeftToTopRightStroke");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v4;
  }
  return v4;
}

- (void)setStrokeOfType:(int)a3 toValue:(id)a4
{
  id v6;

  v6 = a4;
  switch(a3)
  {
    case 1:
      -[OADTableCellProperties setLeftStroke:](self, "setLeftStroke:", v6);
      break;
    case 2:
      -[OADTableCellProperties setRightStroke:](self, "setRightStroke:", v6);
      break;
    case 3:
      -[OADTableCellProperties setTopStroke:](self, "setTopStroke:", v6);
      break;
    case 4:
      -[OADTableCellProperties setBottomStroke:](self, "setBottomStroke:", v6);
      break;
    case 7:
      -[OADTableCellProperties setTopLeftToBottomRightStroke:](self, "setTopLeftToBottomRightStroke:", v6);
      break;
    case 8:
      -[OADTableCellProperties setBottomLeftToTopRightStroke:](self, "setBottomLeftToTopRightStroke:", v6);
      break;
    default:
      break;
  }

}

- (id)topLeftToBottomRightStroke
{
  return self->mTopLeftToBottomRightStroke;
}

- (id)bottomLeftToTopRightStroke
{
  return self->mBottomLeftToTopRightStroke;
}

- (id)strokeNormalToDir:(int)a3 bound:(int)a4
{
  void *v4;

  if (a3 == 1)
  {
    if (a4 == 1)
    {
      -[OADTableCellProperties rightStroke](self, "rightStroke");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    if (!a4)
    {
      -[OADTableCellProperties leftStroke](self, "leftStroke");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
LABEL_9:
    v4 = 0;
    return v4;
  }
  if (a3)
    goto LABEL_9;
  if (a4 == 1)
  {
    -[OADTableCellProperties bottomStroke](self, "bottomStroke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (a4)
    goto LABEL_9;
  -[OADTableCellProperties topStroke](self, "topStroke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)threeDProperties
{
  return self->mThreeDProperties;
}

- (void)setThreeDProperties:(id)a3
{
  objc_storeStrong((id *)&self->mThreeDProperties, a3);
}

- (float)leftMargin
{
  return self->mLeftMargin;
}

- (BOOL)isLeftMarginOverridden
{
  return self->mIsLeftMarginOverridden;
}

- (float)rightMargin
{
  return self->mRightMargin;
}

- (BOOL)isRightMarginOverridden
{
  return self->mIsRightMarginOverridden;
}

- (float)topMargin
{
  return self->mTopMargin;
}

- (BOOL)isTopMarginOverridden
{
  return self->mIsTopMarginOverridden;
}

- (float)bottomMargin
{
  return self->mBottomMargin;
}

- (BOOL)isBottomMarginOverridden
{
  return self->mIsBottomMarginOverridden;
}

- (unsigned)textFlow
{
  return self->mTextFlow;
}

- (void)setTextFlow:(unsigned __int8)a3
{
  self->mTextFlow = a3;
  self->mIsTextFlowOverridden = 0;
}

- (BOOL)isTextFlowOverridden
{
  return self->mIsTextFlowOverridden;
}

- (BOOL)textAnchorCenter
{
  return self->mTextAnchorCenter;
}

- (BOOL)isTextAnchorCenterOverridden
{
  return self->mIsTextAnchorCenterOverridden;
}

- (unsigned)textHorizontalOverflow
{
  return self->mTextHorizontalOverflow;
}

- (BOOL)isTextHorizontalOverflowOverridden
{
  return self->mIsTextHorizontalOverflowOverridden;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTableCellProperties;
  -[OADTableCellProperties description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFill, 0);
  objc_storeStrong((id *)&self->mThreeDProperties, 0);
  objc_storeStrong((id *)&self->mBottomLeftToTopRightStroke, 0);
  objc_storeStrong((id *)&self->mTopLeftToBottomRightStroke, 0);
  objc_storeStrong((id *)&self->mBottomStroke, 0);
  objc_storeStrong((id *)&self->mTopStroke, 0);
  objc_storeStrong((id *)&self->mRightStroke, 0);
  objc_storeStrong((id *)&self->mLeftStroke, 0);
}

@end
