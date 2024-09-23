@implementation KNTransitionWipe

+ (BOOL)isTransition
{
  return 1;
}

+ (id)supportedTypes
{
  return &off_4698B0;
}

- (void)animationWillBeginWithContext:(id)a3
{
  CGRect *p_frameRect;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  objc_super v10;

  p_frameRect = &self->super._frameRect;
  -[KNAnimationContext slideRect](self->super.super.mAnimationContext, "slideRect");
  p_frameRect->origin.x = v6;
  p_frameRect->origin.y = v7;
  p_frameRect->size.width = v8;
  p_frameRect->size.height = v9;
  v10.receiver = self;
  v10.super_class = (Class)KNTransitionWipe;
  -[KNWipeBase animationWillBeginWithContext:](&v10, "animationWillBeginWithContext:", a3);
}

- (void)renderFrameWithContext:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KNTransitionWipe;
  -[KNWipeBase renderFrameWithContext:](&v3, "renderFrameWithContext:", a3);
}

@end
