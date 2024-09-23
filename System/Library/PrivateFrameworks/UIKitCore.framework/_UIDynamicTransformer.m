@implementation _UIDynamicTransformer

- (_UIDynamicTransformer)initWithActionBlock:(id)a3
{
  id v5;
  _UIDynamicTransformer *v6;
  void *v7;
  id action;
  _UIDynamicTransformer *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDynamicTransformer.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionBlock"));

  }
  v12.receiver = self;
  v12.super_class = (Class)_UIDynamicTransformer;
  v6 = -[_UIDynamicTransformer init](&v12, sel_init);
  if (v6)
  {
    v7 = _Block_copy(v5);
    action = v6->_action;
    v6->_action = v7;

    v9 = v6;
  }

  return v6;
}

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
  (*((void (**)(void))self->_action + 2))();
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 100.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 100.0;
  result.size.height = v5;
  result.size.width = v2;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGAffineTransform)transform
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0C9BAA8];
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
}

@end
