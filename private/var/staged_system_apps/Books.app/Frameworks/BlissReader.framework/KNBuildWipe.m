@implementation KNBuildWipe

+ (BOOL)isTransition
{
  return 0;
}

+ (id)supportedTypes
{
  return &off_4698C8;
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

- (CGRect)frameOfEffectWithFrame:(CGRect)result context:(id)a4
{
  self->super._frameRect = result;
  return result;
}

- (void)animationWillBeginWithContext:(id)a3
{
  objc_super v5;

  self->super._isBuildOut = objc_msgSend(objc_msgSend(a3, "animatedBuild"), "isBuildIn") ^ 1;
  v5.receiver = self;
  v5.super_class = (Class)KNBuildWipe;
  -[KNWipeBase animationWillBeginWithContext:](&v5, "animationWillBeginWithContext:", a3);
}

- (void)renderFrameWithContext:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KNBuildWipe;
  -[KNWipeBase renderFrameWithContext:](&v3, "renderFrameWithContext:", a3);
}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  self->super._isBuildOut = objc_msgSend(objc_msgSend(a3, "animatedBuild"), "isBuildIn") ^ 1;
  -[KNBuildWipe animationWillBeginWithContext:](self, "animationWillBeginWithContext:", a3);
}

- (void)metalAnimationWillBeginWithContext:(id)a3
{
  KNWipeDataBuffer *mWipeDataBuffer;
  _OWORD v5[8];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  if (self)
  {
    -[KNAnimationEffect mvpMatrixWithContext:](self, "mvpMatrixWithContext:", a3);
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
  }
  mWipeDataBuffer = self->super.mWipeDataBuffer;
  v5[4] = v10;
  v5[5] = v11;
  v5[6] = v12;
  v5[7] = v13;
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  v5[3] = v9;
  -[KNWipeDataBuffer setMVPMatrix:](mWipeDataBuffer, "setMVPMatrix:", v5);
}

@end
