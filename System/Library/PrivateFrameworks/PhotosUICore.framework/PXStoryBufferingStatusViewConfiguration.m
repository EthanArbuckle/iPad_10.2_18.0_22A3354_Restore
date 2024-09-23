@implementation PXStoryBufferingStatusViewConfiguration

- (BOOL)isEqual:(id)a3
{
  PXStoryBufferingStatusViewConfiguration *v4;
  _BOOL4 v5;
  int v6;

  v4 = (PXStoryBufferingStatusViewConfiguration *)a3;
  if (v4 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[PXStoryBufferingStatusViewConfiguration wantsBackground](v4, "wantsBackground");
      v6 = v5 ^ -[PXStoryBufferingStatusViewConfiguration wantsBackground](self, "wantsBackground") ^ 1;
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return -[PXStoryBufferingStatusViewConfiguration wantsBackground](self, "wantsBackground");
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXStoryBufferingStatusViewConfiguration *v4;

  v4 = objc_alloc_init(PXStoryBufferingStatusViewConfiguration);
  -[PXStoryBufferingStatusViewConfiguration setWantsBackground:](v4, "setWantsBackground:", -[PXStoryBufferingStatusViewConfiguration wantsBackground](self, "wantsBackground"));
  return v4;
}

- (BOOL)wantsBackground
{
  return self->_wantsBackground;
}

- (void)setWantsBackground:(BOOL)a3
{
  self->_wantsBackground = a3;
}

@end
