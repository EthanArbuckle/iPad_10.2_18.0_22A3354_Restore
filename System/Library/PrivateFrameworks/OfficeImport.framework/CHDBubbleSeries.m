@implementation CHDBubbleSeries

- (id)sizeData
{
  return self->mSizeData;
}

- (void)setSizeData:(id)a3
{
  CHDData *v5;
  id WeakRetained;
  void *v7;
  CHDData *v8;

  v5 = (CHDData *)a3;
  if (self->mSizeData != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->mSizeData, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->super.mChart);
    objc_msgSend(WeakRetained, "processors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markObject:processor:", v8, objc_opt_class());

    v5 = v8;
  }

}

- (BOOL)isBubble3D
{
  return self->mBubble3D;
}

- (void)setBubble3D:(BOOL)a3
{
  self->mBubble3D = a3;
}

- (BOOL)isInvertIfNegative
{
  return self->mInvertIfNegative;
}

- (void)setInvertIfNegative:(BOOL)a3
{
  self->mInvertIfNegative = a3;
}

- (BOOL)isShowBubbleSize
{
  return self->mShowBubbleSize;
}

- (void)setShowBubbleSize:(BOOL)a3
{
  self->mShowBubbleSize = a3;
}

- (void)setCategoryData:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CHDBubbleSeries;
  -[CHDSeries setCategoryData:](&v7, sel_setCategoryData_, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.mChart);
  objc_msgSend(WeakRetained, "processors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markObject:processor:", v4, objc_opt_class());

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSizeData, 0);
}

@end
