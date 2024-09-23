@implementation SBCrossfadeView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endView, 0);
  objc_storeStrong((id *)&self->_startView, 0);
  objc_storeStrong((id *)&self->_animationFactory, 0);
}

- (void)layoutSubviews
{
  UIView *startView;
  UIView *endView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBCrossfadeView;
  -[SBCrossfadeView layoutSubviews](&v5, sel_layoutSubviews);
  startView = self->_startView;
  -[SBCrossfadeView bounds](self, "bounds");
  -[UIView setFrame:](startView, "setFrame:");
  endView = self->_endView;
  -[SBCrossfadeView bounds](self, "bounds");
  -[UIView setFrame:](endView, "setFrame:");
}

- (void)setAnimationFactory:(id)a3
{
  objc_storeStrong((id *)&self->_animationFactory, a3);
}

+ (id)crossfadeViewWithStartView:(id)a3 endView:(id)a4 translucent:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithStartView:endView:translucent:", v9, v8, v5);

  return v10;
}

uint64_t __43__SBCrossfadeView_crossfadeWithCompletion___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;

  if ((uint64_t)--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) <= 0)
  {
    v1 = result;
    objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 424), "layer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAllowsHitTesting:", *(unsigned __int8 *)(v1 + 56));

    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 424), "setUserInteractionEnabled:", *(unsigned __int8 *)(v1 + 57));
    result = *(_QWORD *)(v1 + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)crossfadeWithCompletion:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  _QWORD v34[5];
  id v35;
  uint64_t *v36;
  char v37;
  BOOL v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;

  v4 = a3;
  if (!self->_crossfaded)
  {
    self->_crossfaded = 1;
    v5 = -[UIView isUserInteractionEnabled](self->_startView, "isUserInteractionEnabled");
    -[UIView layer](self->_startView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "allowsHitTesting");

    -[UIView layer](self->_startView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsHitTesting:", 0);

    -[UIView setUserInteractionEnabled:](self->_startView, "setUserInteractionEnabled:", 0);
    -[UIView setHidden:](self->_endView, "setHidden:", 0);
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 1;
    v9 = MEMORY[0x24BDAC760];
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __43__SBCrossfadeView_crossfadeWithCompletion___block_invoke;
    v34[3] = &unk_24D4D0778;
    v36 = &v39;
    v34[4] = self;
    v37 = v7;
    v38 = v5;
    v35 = v4;
    v10 = (void *)MEMORY[0x2199F42EC](v34);
    -[SBCrossfadeView animationFactory](self, "animationFactory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_translucent)
    {
      ++v40[3];
      v12 = -[SBCrossfadeView allowsGroupOpacityDuringCrossfade](self, "allowsGroupOpacityDuringCrossfade");
      -[UIView layer](self->_endView, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAllowsGroupOpacity:", v12);

      -[UIView layer](self->_startView, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAllowsGroupOpacity:", v12);

      v15 = -[SBCrossfadeView adaptsAnimationFactoryTimingFunction](self, "adaptsAnimationFactoryTimingFunction");
      if (v15)
      {
        LODWORD(v16) = 0.25;
        LODWORD(v17) = 0.75;
        LODWORD(v18) = 0.25;
        LODWORD(v19) = 0.75;
        objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v16, v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "factoryWithTimingFunction:", v20);
        v21 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v21;
      }
      v22 = (void *)MEMORY[0x24BE0BF08];
      v33[0] = v9;
      v33[1] = 3221225472;
      v33[2] = __43__SBCrossfadeView_crossfadeWithCompletion___block_invoke_2;
      v33[3] = &unk_24D4CFFF8;
      v33[4] = self;
      v31[0] = v9;
      v31[1] = 3221225472;
      v31[2] = __43__SBCrossfadeView_crossfadeWithCompletion___block_invoke_3;
      v31[3] = &unk_24D4D07A0;
      v31[4] = self;
      v32 = v10;
      objc_msgSend(v22, "animateWithFactory:options:actions:completion:", v11, 2, v33, v31);
      if (v15)
      {
        LODWORD(v23) = 0.75;
        LODWORD(v24) = 0.25;
        LODWORD(v25) = 0.75;
        LODWORD(v26) = 0.25;
        objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v23, v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "factoryWithTimingFunction:", v27);
        v28 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v28;
      }

    }
    else
    {
      v30[0] = v9;
      v30[1] = 3221225472;
      v30[2] = __43__SBCrossfadeView_crossfadeWithCompletion___block_invoke_4;
      v30[3] = &unk_24D4CFFF8;
      v30[4] = self;
      objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v30);
    }
    v29[0] = v9;
    v29[1] = 3221225472;
    v29[2] = __43__SBCrossfadeView_crossfadeWithCompletion___block_invoke_5;
    v29[3] = &unk_24D4CFFF8;
    v29[4] = self;
    objc_msgSend(MEMORY[0x24BE0BF08], "animateWithFactory:options:actions:completion:", v11, 2, v29, v10);

    _Block_object_dispose(&v39, 8);
  }

}

- (BSUIAnimationFactory)animationFactory
{
  return self->_animationFactory;
}

- (id)_initWithStartView:(id)a3 endView:(id)a4 translucent:(BOOL)a5
{
  id v9;
  id v10;
  SBCrossfadeView *v11;
  uint64_t v12;
  BSUIAnimationFactory *animationFactory;
  void *v14;
  _QWORD v16[4];
  SBCrossfadeView *v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "frame");
  v18.receiver = self;
  v18.super_class = (Class)SBCrossfadeView;
  v11 = -[SBCrossfadeView initWithFrame:](&v18, sel_initWithFrame_);
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BE0BF08], "factoryWithDuration:", 0.35);
    v12 = objc_claimAutoreleasedReturnValue();
    animationFactory = v11->_animationFactory;
    v11->_animationFactory = (BSUIAnimationFactory *)v12;

    objc_storeStrong((id *)&v11->_startView, a3);
    objc_storeStrong((id *)&v11->_endView, a4);
    v11->_translucent = a5;
    v11->_allowsGroupOpacityDuringCrossfade = 1;
    v11->_adaptsAnimationFactoryTimingFunction = 1;
    -[SBCrossfadeView addSubview:](v11, "addSubview:", v11->_endView);
    -[SBCrossfadeView addSubview:](v11, "addSubview:", v11->_startView);
    v14 = (void *)MEMORY[0x24BDF6F90];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __58__SBCrossfadeView__initWithStartView_endView_translucent___block_invoke;
    v16[3] = &unk_24D4CFFF8;
    v17 = v11;
    objc_msgSend(v14, "performWithoutAnimation:", v16);

  }
  return v11;
}

uint64_t __58__SBCrossfadeView__initWithStartView_endView_translucent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
}

uint64_t __43__SBCrossfadeView_crossfadeWithCompletion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 0.0);
}

uint64_t __43__SBCrossfadeView_crossfadeWithCompletion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 1.0);
}

uint64_t __43__SBCrossfadeView_crossfadeWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 1.0);
}

uint64_t __43__SBCrossfadeView_crossfadeWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsGroupOpacity:", 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupOpacity:", 0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("zPosition")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBCrossfadeView;
    v5 = -[SBCrossfadeView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (BOOL)allowsGroupOpacityDuringCrossfade
{
  return self->_allowsGroupOpacityDuringCrossfade;
}

- (void)setAllowsGroupOpacityDuringCrossfade:(BOOL)a3
{
  self->_allowsGroupOpacityDuringCrossfade = a3;
}

- (BOOL)adaptsAnimationFactoryTimingFunction
{
  return self->_adaptsAnimationFactoryTimingFunction;
}

- (void)setAdaptsAnimationFactoryTimingFunction:(BOOL)a3
{
  self->_adaptsAnimationFactoryTimingFunction = a3;
}

@end
