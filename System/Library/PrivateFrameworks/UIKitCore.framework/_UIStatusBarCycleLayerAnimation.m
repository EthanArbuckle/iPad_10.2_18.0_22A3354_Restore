@implementation _UIStatusBarCycleLayerAnimation

+ (id)cycleAnimationWithLayer:(id)a3 animation:(id)a4 key:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAnimations:", v13);

  objc_msgSend(v9, "duration");
  objc_msgSend(v12, "setDuration:");
  objc_msgSend(v12, "setAutoreverses:", objc_msgSend(v9, "autoreverses"));
  objc_msgSend(v11, "setLayer:", v10);

  objc_msgSend(v11, "setAnimation:", v12);
  objc_msgSend(v11, "setOriginalAnimation:", v9);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), v8, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setKey:", v14);
  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_layer);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  NSStringFromSelector("key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
  objc_storeStrong((id *)&self->_layer, a3);
}

- (CAAnimation)animation
{
  return self->_animation;
}

- (void)setAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_animation, a3);
}

- (CAAnimation)originalAnimation
{
  return self->_originalAnimation;
}

- (void)setOriginalAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_originalAnimation, a3);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_originalAnimation, 0);
  objc_storeStrong((id *)&self->_animation, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end
