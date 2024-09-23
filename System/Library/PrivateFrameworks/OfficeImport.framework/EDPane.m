@implementation EDPane

+ (id)pane
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (EDPane)init
{
  EDPane *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPane;
  result = -[EDPane init](&v3, sel_init);
  if (result)
  {
    result->mActivePane = 0;
    result->mXSplitPosition = 0.0;
    result->mYSplitPosition = 0.0;
  }
  return result;
}

- (void)setActivePane:(int)a3
{
  self->mActivePane = a3;
}

- (void)setXSplitPosition:(double)a3
{
  self->mXSplitPosition = a3;
}

- (void)setYSplitPosition:(double)a3
{
  self->mYSplitPosition = a3;
}

- (void)setTopLeftCell:(id)a3
{
  EDReference *v5;
  EDReference **p_mTopLeftCell;
  EDReference *mTopLeftCell;
  EDReference *v8;

  v5 = (EDReference *)a3;
  mTopLeftCell = self->mTopLeftCell;
  p_mTopLeftCell = &self->mTopLeftCell;
  if (mTopLeftCell != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mTopLeftCell, a3);
    v5 = v8;
  }

}

- (double)xSplitPosition
{
  return self->mXSplitPosition;
}

- (double)ySplitPosition
{
  return self->mYSplitPosition;
}

- (id)topLeftCell
{
  return self->mTopLeftCell;
}

- (int)activePane
{
  return self->mActivePane;
}

- (int)paneState
{
  return self->mPaneState;
}

- (void)setPaneState:(int)a3
{
  self->mPaneState = a3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPane;
  -[EDPane description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTopLeftCell, 0);
}

@end
