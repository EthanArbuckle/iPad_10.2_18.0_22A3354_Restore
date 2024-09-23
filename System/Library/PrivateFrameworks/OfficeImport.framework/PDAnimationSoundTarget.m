@implementation PDAnimationSoundTarget

- (PDAnimationSoundTarget)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDAnimationSoundTarget;
  return -[PDAnimationShapeTarget init](&v3, sel_init);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSoundFile, 0);
}

@end
