@implementation TVRUICubicSpringAnimator

+ (id)standardSpringAnimator
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)objc_opt_class());
  +[TVRUICubicSpringTimingParameters standardTimingParameters](TVRUICubicSpringTimingParameters, "standardTimingParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithDuration:timingParameters:", v3, 0.0);

  return v4;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TVRUICubicSpringAnimator;
  -[UIViewPropertyAnimator _basicAnimationForView:withKeyPath:](&v10, sel__basicAnimationForView_withKeyPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewPropertyAnimator timingParameters](self, "timingParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "springCubicTimingParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_mediaTimingFunction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setTimingFunction:", v8);
  }

  return v5;
}

@end
