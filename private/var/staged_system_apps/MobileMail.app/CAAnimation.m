@implementation CAAnimation

+ (id)mf_animationWithKeyPath:(id)a3 type:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (a4 == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", v5));
    objc_msgSend(v6, "setMass:", 2.0);
    objc_msgSend(v6, "setStiffness:", 300.0);
    objc_msgSend(v6, "setDamping:", 400.0);
  }
  else if (a4)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", v5));
  }

  return v6;
}

+ (id)shortDescriptionWithAnimationType:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Magic Spring");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return (id)v3;
  else
    return CFSTR("Basic");
}

- (void)mf_setAnimationCompletion:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = objc_retainBlock(a3);
    -[CAAnimation setValue:forKey:](self, "setValue:forKey:");

  }
}

- (void)mf_executeAnimationCompletionFinished:(BOOL)a3
{
  _BOOL8 v3;
  void (**v4)(id, _BOOL8);

  v3 = a3;
  v4 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue(-[CAAnimation valueForKey:](self, "valueForKey:", CFSTR("MFAnimationCompletionKey")));
  if (v4)
    v4[2](v4, v3);

}

@end
