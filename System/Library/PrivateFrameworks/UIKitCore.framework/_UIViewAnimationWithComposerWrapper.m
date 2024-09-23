@implementation _UIViewAnimationWithComposerWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composer, 0);
  objc_storeStrong((id *)&self->_animation, 0);
}

- (UIViewAnimationComposing)composer
{
  return self->_composer;
}

- (UIIntervalAnimating)animation
{
  return self->_animation;
}

+ (id)instanceWithAnimation:(id)a3 composer:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setAnimation:", v5);
    objc_msgSend(v8, "setComposer:", v6);
  }

  return v8;
}

- (void)setComposer:(id)a3
{
  objc_storeStrong((id *)&self->_composer, a3);
}

- (void)setAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_animation, a3);
}

@end
