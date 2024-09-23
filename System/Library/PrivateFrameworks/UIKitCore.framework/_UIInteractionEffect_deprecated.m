@implementation _UIInteractionEffect_deprecated

- (_UIInteractionEffect_deprecated)init
{
  _UIInteractionEffect_deprecated *v2;
  _UIInteractionEffect_deprecated *v3;
  uint64_t v4;
  __int128 v5;
  _UIInteractionEffect_deprecated *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIInteractionEffect_deprecated;
  v2 = -[_UIInteractionEffect_deprecated init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_damping = xmmword_186681F90;
    *(_OWORD *)&v2->_density = xmmword_186681FA0;
    v2->_forceFactor = 0.0;
    v4 = MEMORY[0x1E0C9BAA8];
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v2->_preferredContentTransform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v2->_preferredContentTransform.c = v5;
    *(_OWORD *)&v2->_preferredContentTransform.tx = *(_OWORD *)(v4 + 32);
    -[_UIInteractionEffect_deprecated _prepareAnimatorIfNeeded](v2, "_prepareAnimatorIfNeeded");
    v6 = v3;
  }

  return v3;
}

- (void)setForceFactor:(double)a3
{
  if (self->_forceFactor != a3)
  {
    self->_forceFactor = a3;
    -[_UIInteractionEffect_deprecated _updateAnimatorIfNeeded](self, "_updateAnimatorIfNeeded");
  }
}

- (CGAffineTransform)preferredContentTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].c;
  return self;
}

- (double)progress
{
  return self->_progress;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 320.0;
  v3 = 480.0;
  v4 = 0.0;
  v5 = 0.0;
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)_prepareAnimatorIfNeeded
{
  UIDynamicAnimator *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _UIDynamicTransformer *v12;
  _UIDynamicTransformer *v13;
  double v14;
  double v15;
  _UIDynamicTransformer *transformer;
  _UIDynamicTransformer *v17;
  _UISpringBehavior *v18;
  _UISpringBehavior *springBehavior;
  UIPushBehavior *v20;
  void *v21;
  UIPushBehavior *v22;
  UIPushBehavior *forceBehavior;
  UIDynamicItemBehavior *v24;
  void *v25;
  UIDynamicItemBehavior *v26;
  UIDynamicItemBehavior *itemProperties;
  UIDynamicAnimator *animator;
  _QWORD v29[4];
  id v30;
  id location;
  _UIDynamicTransformer *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v3 = -[UIDynamicAnimator initWithReferenceSystem:]([UIDynamicAnimator alloc], "initWithReferenceSystem:", self);
  -[_UIInteractionEffect_deprecated bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_initWeak(&location, self);
  v12 = [_UIDynamicTransformer alloc];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __59___UIInteractionEffect_deprecated__prepareAnimatorIfNeeded__block_invoke;
  v29[3] = &unk_1E16DAD50;
  objc_copyWeak(&v30, &location);
  v13 = -[_UIDynamicTransformer initWithActionBlock:](v12, "initWithActionBlock:", v29);
  v14 = v5 + v9 * 0.5;
  v15 = v7 + v11 * 0.5;
  -[_UIDynamicTransformer setCenter:](v13, "setCenter:", v14, v15);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
  transformer = self->_transformer;
  self->_transformer = v13;

  v17 = v13;
  v18 = -[_UISpringBehavior initWithItem:anchorPoint:]([_UISpringBehavior alloc], "initWithItem:anchorPoint:", v17, v14, v15);
  -[_UISpringBehavior setDamping:](v18, "setDamping:", self->_damping);
  -[_UISpringBehavior setFrequency:](v18, "setFrequency:", self->_frequency);
  -[UIDynamicAnimator addBehavior:](v3, "addBehavior:", v18);
  springBehavior = self->_springBehavior;
  self->_springBehavior = v18;

  v20 = [UIPushBehavior alloc];
  v33[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[UIPushBehavior initWithItems:mode:](v20, "initWithItems:mode:", v21, 0);

  -[UIPushBehavior setMagnitude:](v22, "setMagnitude:", 0.0);
  -[UIPushBehavior setPushDirection:](v22, "setPushDirection:", 0.0, 1.0);
  -[UIDynamicAnimator addBehavior:](v3, "addBehavior:", v22);
  forceBehavior = self->_forceBehavior;
  self->_forceBehavior = v22;

  v24 = [UIDynamicItemBehavior alloc];
  v32 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[UIDynamicItemBehavior initWithItems:](v24, "initWithItems:", v25);

  -[UIDynamicItemBehavior setDensity:](v26, "setDensity:", self->_density);
  -[UIDynamicItemBehavior setResistance:](v26, "setResistance:", self->_resistance);
  -[UIDynamicAnimator addBehavior:](v3, "addBehavior:", v26);
  itemProperties = self->_itemProperties;
  self->_itemProperties = v26;

  animator = self->_animator;
  self->_animator = v3;

  -[_UIInteractionEffect_deprecated _updateAnimatorIfNeeded](self, "_updateAnimatorIfNeeded");
}

- (void)_updateAnimatorIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[UIPushBehavior setMagnitude:](self->_forceBehavior, "setMagnitude:", fmin(self->_forceFactor * 100.0, 120.0));
  -[_UIInteractionEffect_deprecated bounds](self, "bounds");
  -[_UISpringBehavior setAnchorPoint:](self->_springBehavior, "setAnchorPoint:", v4 + v3 * 0.5, v6 + v5 * 0.5);
}

- (void)_updateFromTransformer:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  __int128 v10;
  void (**updateBlock)(id, _UIInteractionEffect_deprecated *);
  CGAffineTransform v12;

  objc_msgSend(a3, "center");
  v5 = v4;
  -[_UIInteractionEffect_deprecated bounds](self, "bounds");
  v8 = v5 - (v7 + v6 * 0.5);
  v9 = floor((1.0 - v8 + v8 * 1.03) * 1000.0) / 1000.0;
  CGAffineTransformMakeScale(&v12, v9, v9);
  v10 = *(_OWORD *)&v12.c;
  *(_OWORD *)&self->_preferredContentTransform.a = *(_OWORD *)&v12.a;
  *(_OWORD *)&self->_preferredContentTransform.c = v10;
  *(_OWORD *)&self->_preferredContentTransform.tx = *(_OWORD *)&v12.tx;
  self->_progress = v8;
  updateBlock = (void (**)(id, _UIInteractionEffect_deprecated *))self->_updateBlock;
  if (updateBlock)
    updateBlock[2](updateBlock, self);
}

- (void)_stopAnimations
{
  -[UIDynamicAnimator removeBehavior:](self->_animator, "removeBehavior:", self->_springBehavior);
  -[UIDynamicAnimator removeBehavior:](self->_animator, "removeBehavior:", self->_forceBehavior);
  -[UIDynamicAnimator removeBehavior:](self->_animator, "removeBehavior:", self->_itemProperties);
}

- (double)forceFactor
{
  return self->_forceFactor;
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_itemProperties, 0);
  objc_storeStrong((id *)&self->_forceBehavior, 0);
  objc_storeStrong((id *)&self->_springBehavior, 0);
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_animator, 0);
}

@end
