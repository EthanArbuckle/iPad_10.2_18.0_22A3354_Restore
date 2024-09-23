@implementation SBWindowDefaultLayoutStrategy

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBWindowDefaultLayoutStrategy;
  return -[SBWindowDefaultLayoutStrategy init](&v3, sel_init);
}

+ (id)_strategyWithClipping:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t *v4;

  v3 = a3;
  if (_strategyWithClipping____once != -1)
    dispatch_once(&_strategyWithClipping____once, &__block_literal_global_391);
  v4 = &_strategyWithClipping____clipStrategy;
  if (!v3)
    v4 = &_strategyWithClipping____noClipStrategy;
  return (id)*v4;
}

uint64_t __55__SBWindowDefaultLayoutStrategy__strategyWithClipping___block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;

  kdebug_trace();
  v0 = -[SBWindowDefaultLayoutStrategy _init]([SBWindowDefaultLayoutStrategy alloc], "_init");
  v1 = (void *)_strategyWithClipping____clipStrategy;
  _strategyWithClipping____clipStrategy = (uint64_t)v0;

  *(_BYTE *)(_strategyWithClipping____clipStrategy + 8) = 1;
  v2 = -[SBWindowDefaultLayoutStrategy _init]([SBWindowDefaultLayoutStrategy alloc], "_init");
  v3 = (void *)_strategyWithClipping____noClipStrategy;
  _strategyWithClipping____noClipStrategy = (uint64_t)v2;

  return kdebug_trace();
}

+ (id)clipStrategy
{
  return (id)objc_msgSend(a1, "_strategyWithClipping:", 1);
}

+ (id)noClipStrategy
{
  return (id)objc_msgSend(a1, "_strategyWithClipping:", 0);
}

- (CGRect)frameWithInterfaceOrientation:(int64_t)a3 windowScene:(id)a4
{
  id v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat Width;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat Height;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect result;

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_referenceBounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    Width = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_referenceBounds");
    v8 = v16;
    v10 = v17;
    v12 = v18;
    Width = v19;

  }
  if ((unint64_t)(a3 - 3) <= 1)
  {
    v25.origin.x = v8;
    v25.origin.y = v10;
    v25.size.width = v12;
    v25.size.height = Width;
    Height = CGRectGetHeight(v25);
    v26.origin.x = v8;
    v26.origin.y = v10;
    v26.size.width = v12;
    v26.size.height = Width;
    Width = CGRectGetWidth(v26);
    v12 = Height;
  }

  v21 = v8;
  v22 = v10;
  v23 = v12;
  v24 = Width;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (BOOL)shouldClipForWindow:(id)a3
{
  return self->_clip;
}

@end
