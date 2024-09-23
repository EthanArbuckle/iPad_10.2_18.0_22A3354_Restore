@implementation _TVStackWrappingViewController

- (void)tv_setShowcaseConfig:(TVShowcaseConfig *)a3
{
  TVShowcaseConfig v3;

  v3 = *a3;
  -[_TVStackWrappingViewController setShowcaseConfig:](self, "setShowcaseConfig:", &v3);
}

- (TVShowcaseConfig)showcaseConfig
{
  *retstr = *(TVShowcaseConfig *)((char *)self + 968);
  return self;
}

- (void)setShowcaseConfig:(TVShowcaseConfig *)a3
{
  double inset;

  inset = a3->inset;
  *(_OWORD *)&self->_showcaseConfig.flavor = *(_OWORD *)&a3->flavor;
  self->_showcaseConfig.inset = inset;
}

@end
