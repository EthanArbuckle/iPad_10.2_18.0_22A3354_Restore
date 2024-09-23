@implementation PDTimeNodeUnion

- (PDTimeNodeUnion)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDTimeNodeUnion;
  return -[PDTimeNodeUnion init](&v3, sel_init);
}

- (void)setMotionBehavior:(id)a3
{
  objc_storeStrong((id *)&self->mMotionBehavior, a3);
}

- (void)setParallel:(id)a3
{
  objc_storeStrong((id *)&self->mParallelTimeNodeGroup, a3);
}

- (void)setSequential:(id)a3
{
  objc_storeStrong((id *)&self->mSequentialTimeNodeGroup, a3);
}

- (void)setBehavior:(id)a3
{
  objc_storeStrong((id *)&self->mSetBehavior, a3);
}

- (void)setEffectBehavior:(id)a3
{
  objc_storeStrong((id *)&self->mEffectBehavior, a3);
}

- (void)setTimeBehavior:(id)a3
{
  objc_storeStrong((id *)&self->mTimeBehavior, a3);
}

- (void)setScaleBehavior:(id)a3
{
  objc_storeStrong((id *)&self->mScaleBehavior, a3);
}

- (void)setRotateBehavior:(id)a3
{
  objc_storeStrong((id *)&self->mRotateBehavior, a3);
}

- (void)setCmdBehavior:(id)a3
{
  objc_storeStrong((id *)&self->mCmdBehavior, a3);
}

- (void)setAudio:(id)a3
{
  objc_storeStrong((id *)&self->mAudio, a3);
}

- (void)setVideo:(id)a3
{
  objc_storeStrong((id *)&self->mVideo, a3);
}

- (id)commonBehavior
{
  void *mTimeBehavior;

  mTimeBehavior = self->mTimeBehavior;
  if (mTimeBehavior)
    return mTimeBehavior;
  mTimeBehavior = self->mEffectBehavior;
  if (mTimeBehavior)
    return mTimeBehavior;
  mTimeBehavior = self->mMotionBehavior;
  if (mTimeBehavior)
    return mTimeBehavior;
  mTimeBehavior = self->mRotateBehavior;
  if (mTimeBehavior)
    return mTimeBehavior;
  mTimeBehavior = self->mScaleBehavior;
  if (mTimeBehavior)
    return mTimeBehavior;
  mTimeBehavior = self->mSetBehavior;
  if (mTimeBehavior)
    return mTimeBehavior;
  mTimeBehavior = self->mCmdBehavior;
  if (mTimeBehavior)
    return mTimeBehavior;
  else
    return 0;
}

- (id)timeBehavior
{
  return self->mTimeBehavior;
}

- (id)effectBehavior
{
  return self->mEffectBehavior;
}

- (id)motionBehavior
{
  return self->mMotionBehavior;
}

- (id)rotateBehavior
{
  return self->mRotateBehavior;
}

- (id)scaleBehavior
{
  return self->mScaleBehavior;
}

- (id)colorBehavior
{
  return self->mColorBehavior;
}

- (void)setColorBehavior:(id)a3
{
  objc_storeStrong((id *)&self->mColorBehavior, a3);
}

- (id)audio
{
  return self->mAudio;
}

- (id)video
{
  return self->mVideo;
}

- (id)parallel
{
  return self->mParallelTimeNodeGroup;
}

- (id)sequential
{
  return self->mSequentialTimeNodeGroup;
}

- (id)behavior
{
  return self->mSetBehavior;
}

- (id)cmdBehavior
{
  return self->mCmdBehavior;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDTimeNodeUnion;
  -[PDTimeNodeUnion description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCmdBehavior, 0);
  objc_storeStrong((id *)&self->mSetBehavior, 0);
  objc_storeStrong((id *)&self->mSequentialTimeNodeGroup, 0);
  objc_storeStrong((id *)&self->mParallelTimeNodeGroup, 0);
  objc_storeStrong((id *)&self->mVideo, 0);
  objc_storeStrong((id *)&self->mAudio, 0);
  objc_storeStrong((id *)&self->mColorBehavior, 0);
  objc_storeStrong((id *)&self->mScaleBehavior, 0);
  objc_storeStrong((id *)&self->mRotateBehavior, 0);
  objc_storeStrong((id *)&self->mMotionBehavior, 0);
  objc_storeStrong((id *)&self->mEffectBehavior, 0);
  objc_storeStrong((id *)&self->mTimeBehavior, 0);
}

@end
