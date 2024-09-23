@implementation SBSystemApertureViewControllerRotationTransitionContext

- (SBSystemApertureViewControllerRotationTransitionContext)initWithTargetOrientation:(int64_t)a3
{
  char *v4;
  void *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSystemApertureViewControllerRotationTransitionContext;
  v4 = -[_UIViewControllerTransitionContext init](&v10, sel_init);
  if (v4)
  {
    v5 = (void *)objc_opt_class();
    if (v5)
    {
      objc_msgSend(v5, "transformForRotationToInterfaceOrientation:", a3);
    }
    else
    {
      v8 = 0u;
      v9 = 0u;
      v7 = 0u;
    }
    *(_OWORD *)(v4 + 184) = v8;
    *(_OWORD *)(v4 + 200) = v9;
    *(_OWORD *)(v4 + 168) = v7;
  }
  return (SBSystemApertureViewControllerRotationTransitionContext *)v4;
}

+ (CGAffineTransform)transformForRotationToInterfaceOrientation:(SEL)a3
{
  double v4;

  switch(a4)
  {
    case 1:
      v4 = 0.0;
      break;
    case 3:
      v4 = 1.57079633;
      break;
    case 4:
      v4 = -1.57079633;
      break;
    default:
      v4 = 3.14159265;
      if (a4 != 2)
        v4 = 0.0;
      break;
  }
  return CGAffineTransformMakeRotation(retstr, v4);
}

- (CGAffineTransform)_affineTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].b;
  return self;
}

@end
