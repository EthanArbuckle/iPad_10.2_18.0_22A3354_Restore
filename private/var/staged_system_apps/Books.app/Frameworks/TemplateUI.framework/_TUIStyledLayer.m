@implementation _TUIStyledLayer

- (id)implicitAnimationForKeyPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_TUIStyledLayer;
  v5 = -[_TUIStyledLayer implicitAnimationForKeyPath:](&v8, "implicitAnimationForKeyPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("shadowPath")))
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", v4));
    else
      v6 = 0;
  }

  return v6;
}

@end
