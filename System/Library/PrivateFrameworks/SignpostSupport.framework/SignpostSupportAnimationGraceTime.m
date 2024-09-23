@implementation SignpostSupportAnimationGraceTime

- (SignpostSupportAnimationGraceTime)initWithAnimationType:(unint64_t)a3 firstFrameGraceTimeMs:(unint64_t)a4
{
  SignpostSupportAnimationGraceTime *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SignpostSupportAnimationGraceTime;
  result = -[SignpostSupportAnimationGraceTime init](&v7, sel_init);
  if (result)
  {
    result->_animationType = a3;
    result->_firstFrameGraceTimeMs = a4;
  }
  return result;
}

- (unint64_t)animationType
{
  return self->_animationType;
}

- (unint64_t)firstFrameGraceTimeMs
{
  return self->_firstFrameGraceTimeMs;
}

- (void)setFirstFrameGraceTimeMs:(unint64_t)a3
{
  self->_firstFrameGraceTimeMs = a3;
}

@end
