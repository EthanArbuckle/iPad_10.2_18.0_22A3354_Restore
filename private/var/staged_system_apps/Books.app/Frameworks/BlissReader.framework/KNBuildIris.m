@implementation KNBuildIris

+ (BOOL)isTransition
{
  return 0;
}

+ (id)supportedTypes
{
  return &off_4699E8;
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return CFSTR("anim-icons-builds-iris");
}

- (CGRect)frameOfEffectWithContext:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a3, "drawableFrame");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "animatedBuild"));
  self->super._isBuildOut = objc_msgSend(v5, "isBuildIn") ^ 1;

  v6.receiver = self;
  v6.super_class = (Class)KNBuildIris;
  -[KNIrisBase animationWillBeginWithContext:](&v6, "animationWillBeginWithContext:", v4);
  -[KNBuildIris metalAnimationWillBeginWithContext:](self, "metalAnimationWillBeginWithContext:", v4);

}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "animatedBuild"));
  self->super._isBuildOut = objc_msgSend(v5, "isBuildIn") ^ 1;

  v6.receiver = self;
  v6.super_class = (Class)KNBuildIris;
  -[KNIrisBase animationWillBeginWithContext:](&v6, "animationWillBeginWithContext:", v4);

}

- (void)metalAnimationWillBeginWithContext:(id)a3
{
  uint64_t v4;
  float32x4_t v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;

  -[KNAnimationEffect mvpMatrixWithContext:](self, "mvpMatrixWithContext:", a3);
  v4 = 0;
  v5 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)0), (float64x2_t)0);
  do
  {
    v6 = &self->super._anon_40[v4];
    *(float32x4_t *)v6 = v5;
    *((float32x4_t *)v6 + 1) = v5;
    *((float32x4_t *)v6 + 2) = v5;
    *((float32x4_t *)v6 + 3) = v5;
    v7 = &self->super._anon_130[v4 + 32];
    *((float32x4_t *)v7 - 2) = v5;
    *((float32x4_t *)v7 - 1) = v5;
    v4 += 80;
    *(float32x4_t *)v7 = v5;
    *((float32x4_t *)v7 + 1) = v5;
  }
  while (v4 != 240);
  *(float32x4_t *)self->super._anon_280 = v5;
  *(float32x4_t *)&self->super._anon_280[16] = v5;
  *(float32x4_t *)&self->super._anon_280[32] = v5;
  *(float32x4_t *)&self->super._anon_280[48] = v5;
}

- (void)renderFrameWithContext:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KNBuildIris;
  -[KNIrisBase renderFrameWithContext:](&v3, "renderFrameWithContext:", a3);
}

@end
