@implementation PDAnimationChartTarget

- (PDAnimationChartTarget)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDAnimationChartTarget;
  return -[PDAnimationShapeTarget init](&v3, sel_init);
}

- (void)setCatagoryIndex:(int)a3
{
  self->mHasCatagoryIndex = 1;
  self->mCatagoryIndex = a3;
}

- (void)setSeriesIndex:(int)a3
{
  self->mHasSeriesIndex = 1;
  self->mSeriesIndex = a3;
}

- (BOOL)hasCatagoryIndex
{
  return self->mHasCatagoryIndex;
}

- (int)catagoryIndex
{
  return self->mCatagoryIndex;
}

- (BOOL)hasSeriesIndex
{
  return self->mHasSeriesIndex;
}

- (int)seriesIndex
{
  return self->mSeriesIndex;
}

- (BOOL)hasBuildStep
{
  return self->mHasBuildStep;
}

- (int)buildStep
{
  return self->mBuildStep;
}

- (void)setBuildStep:(int)a3
{
  self->mHasBuildStep = 1;
  self->mBuildStep = a3;
}

- (unint64_t)hash
{
  char *v3;
  char *v4;
  char *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PDAnimationChartTarget;
  v3 = -[PDAnimationShapeTarget hash](&v7, sel_hash);
  v4 = &v3[-[PDAnimationChartTarget catagoryIndex](self, "catagoryIndex")];
  v5 = &v4[-[PDAnimationChartTarget seriesIndex](self, "seriesIndex")];
  return (unint64_t)&v5[-[PDAnimationChartTarget buildStep](self, "buildStep")];
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v10.receiver = self,
        v10.super_class = (Class)PDAnimationChartTarget,
        -[PDAnimationShapeTarget isEqual:](&v10, sel_isEqual_, v4))
    && (v5 = -[PDAnimationChartTarget catagoryIndex](self, "catagoryIndex"),
        v5 == objc_msgSend(v4, "catagoryIndex"))
    && (v6 = -[PDAnimationChartTarget seriesIndex](self, "seriesIndex"),
        v6 == objc_msgSend(v4, "seriesIndex")))
  {
    v7 = -[PDAnimationChartTarget buildStep](self, "buildStep");
    v8 = v7 == objc_msgSend(v4, "buildStep");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int)chartSubElementType
{
  return self->mChartSubElementType;
}

- (void)setChartSubElementType:(int)a3
{
  self->mChartSubElementType = a3;
}

@end
