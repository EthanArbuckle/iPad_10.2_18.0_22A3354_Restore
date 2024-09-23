@implementation BCCardStackTransitionCoverFadeAnimationItem

- (BCCardStackTransitioningCoverSource)coverSource
{
  return self->_coverSource;
}

- (void)setCoverSource:(id)a3
{
  objc_storeStrong((id *)&self->_coverSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverSource, 0);
}

@end
