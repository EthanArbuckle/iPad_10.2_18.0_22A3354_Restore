@implementation WGWidgetPinningTeachingAnimationView

- (WGWidgetPinningTeachingAnimationView)init
{
  void *v3;
  WGWidgetPinningTeachingAnimationView *v4;
  void *v5;
  void *v6;
  void *v7;
  CGAffineTransform v9;
  CGAffineTransform v10;
  objc_super v11;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)WGWidgetPinningTeachingAnimationView;
  v4 = -[BSUICAPackageView initWithPackageName:inBundle:](&v11, sel_initWithPackageName_inBundle_, CFSTR("widgets-pinning-teaching"), v3);

  if (v4)
  {
    -[BSUICAPackageView publishedObjectWithName:](v4, "publishedObjectWithName:", CFSTR("materials"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v4->_materialsLayer, v5);
    -[BSUICAPackageView publishedObjectWithName:](v4, "publishedObjectWithName:", CFSTR("pages"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v4->_pagesLayer, v6);
    -[BSUICAPackageView publishedObjectWithName:](v4, "publishedObjectWithName:", CFSTR("page 1"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v4->_page1Layer, v7);
    if (-[WGWidgetPinningTeachingAnimationView _shouldReverseLayoutDirection](v4, "_shouldReverseLayoutDirection"))
    {
      memset(&v10, 0, sizeof(v10));
      CGAffineTransformMakeScale(&v10, -1.0, 1.0);
      v9 = v10;
      -[WGWidgetPinningTeachingAnimationView setTransform:](v4, "setTransform:", &v9);
    }

  }
  return v4;
}

- (void)startAnimating
{
  -[WGWidgetPinningTeachingAnimationView _setState:](self, "_setState:", 1);
}

- (void)stopAnimating
{
  -[WGWidgetPinningTeachingAnimationView _setState:](self, "_setState:", 0);
}

- (void)_setState:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  NSObject *v8;
  unint64_t state;
  char v10;
  const __CFString *v11;
  const __CFString *v12;
  _BOOL8 v13;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24[2];
  uint8_t buf[4];
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (self->_state != a3)
  {
    v5 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->_state - 1;
      if (v6 > 5)
        v7 = CFSTR("none");
      else
        v7 = off_24D731408[v6];
      *(_DWORD *)buf = 138412290;
      v26 = v7;
      v8 = v5;
      _os_log_impl(&dword_2172E1000, v8, OS_LOG_TYPE_DEFAULT, "WGWidgetPinningTeachingAnimationView setState: %@", buf, 0xCu);

    }
    state = self->_state;
    self->_state = a3;
    v10 = 0;
    v11 = CFSTR("page 1");
    v12 = CFSTR("unsquished");
    switch(a3)
    {
      case 0uLL:
      case 1uLL:
        goto LABEL_12;
      case 2uLL:
        v13 = state != 0;
        v12 = CFSTR("squished");
        goto LABEL_19;
      case 3uLL:
      case 5uLL:
        v12 = 0;
        v11 = CFSTR("page 2");
        goto LABEL_11;
      case 4uLL:
        v12 = 0;
LABEL_11:
        v10 = 1;
LABEL_12:
        v13 = a3 != 1 && state != 0;
        -[BSUICAPackageView setState:onLayer:animated:transitionSpeed:completion:](self, "setState:onLayer:animated:transitionSpeed:completion:", v11, self->_pagesLayer, v13, 0, 1.0);
        if ((v10 & 1) == 0)
LABEL_19:
          -[BSUICAPackageView setState:onLayer:animated:transitionSpeed:completion:](self, "setState:onLayer:animated:transitionSpeed:completion:", v12, self->_page1Layer, v13, 0, 1.0);
        break;
      default:
        break;
    }
    -[WGWidgetPinningTeachingAnimationView _durationForState:](self, "_durationForState:", self->_state);
    v16 = v15;
    v17 = -[WGWidgetPinningTeachingAnimationView _stateFollowingState:](self, "_stateFollowingState:", self->_state);
    objc_initWeak((id *)buf, self);
    v18 = (void *)MEMORY[0x24BDBCF40];
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __50__WGWidgetPinningTeachingAnimationView__setState___block_invoke;
    v23 = &unk_24D7313E8;
    objc_copyWeak(v24, (id *)buf);
    v24[1] = v17;
    objc_msgSend(v18, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v20, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetPinningTeachingAnimationView _setTimerToNextState:](self, "_setTimerToNextState:", v19, v20, v21, v22, v23);

    objc_destroyWeak(v24);
    objc_destroyWeak((id *)buf);
  }
}

void __50__WGWidgetPinningTeachingAnimationView__setState___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setState:", *(_QWORD *)(a1 + 40));

}

- (void)_setTimerToNextState:(id)a3
{
  id v5;
  id *p_timerToNextState;
  id v7;
  id v8;

  v5 = a3;
  p_timerToNextState = (id *)&self->_timerToNextState;
  v7 = *p_timerToNextState;
  if (*p_timerToNextState != v5)
  {
    v8 = v5;
    if (v7)
      objc_msgSend(v7, "invalidate");
    objc_storeStrong(p_timerToNextState, a3);
    v5 = v8;
  }

}

- (void)_updateMaterials
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  -[WGWidgetPinningTeachingAnimationView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == 2)
    v5 = CFSTR("dark");
  else
    v5 = CFSTR("light");
  -[BSUICAPackageView setState:onLayer:animated:transitionSpeed:completion:](self, "setState:onLayer:animated:transitionSpeed:completion:", v5, self->_materialsLayer, 1, 0, 1.0);
}

- (double)_durationForState:(unint64_t)a3
{
  double result;

  result = 0.0;
  if (a3 - 1 <= 4)
    return dbl_21732B788[a3 - 1];
  return result;
}

- (unint64_t)_stateFollowingState:(unint64_t)a3
{
  if ((self->_state + 1) % 6 <= 1)
    return 1;
  else
    return (self->_state + 1) % 6;
}

- (unint64_t)state
{
  return self->_state;
}

- (CALayer)materialsLayer
{
  return self->_materialsLayer;
}

- (void)setMaterialsLayer:(id)a3
{
  objc_storeStrong((id *)&self->_materialsLayer, a3);
}

- (CALayer)pagesLayer
{
  return self->_pagesLayer;
}

- (void)setPagesLayer:(id)a3
{
  objc_storeStrong((id *)&self->_pagesLayer, a3);
}

- (CALayer)page1Layer
{
  return self->_page1Layer;
}

- (void)setPage1Layer:(id)a3
{
  objc_storeStrong((id *)&self->_page1Layer, a3);
}

- (NSTimer)timerToNextState
{
  return self->_timerToNextState;
}

- (UILabel)debugLabel
{
  return self->_debugLabel;
}

- (void)setDebugLabel:(id)a3
{
  objc_storeStrong((id *)&self->_debugLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_timerToNextState, 0);
  objc_storeStrong((id *)&self->_page1Layer, 0);
  objc_storeStrong((id *)&self->_pagesLayer, 0);
  objc_storeStrong((id *)&self->_materialsLayer, 0);
}

@end
