@implementation SBBannerCustomTransitioningDelegate

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return -[SBBannerCustomTransitioningDelegate animationControllerForPresentedController:presentingController:sourceController:userInfo:](self, "animationControllerForPresentedController:presentingController:sourceController:userInfo:", a3, a4, a5, 0);
}

- (id)animationControllerForDismissedController:(id)a3
{
  return -[SBBannerCustomTransitioningDelegate animationControllerForDismissedController:userInfo:](self, "animationControllerForDismissedController:userInfo:", a3, 0);
}

- (id)animationControllerForDismissedController:(id)a3 userInfo:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0DACA18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (v9)
    -[SBBannerCustomTransitioningDelegate setStyle:](self, "setStyle:", objc_msgSend(v9, "integerValue"));
  -[SBBannerCustomTransitioningDelegate animatorForDismissalTransitionWithStyle:](self, "animatorForDismissalTransitionWithStyle:", -[SBBannerCustomTransitioningDelegate style](self, "style"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5 userInfo:(id)a6
{
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  objc_msgSend(a6, "objectForKeyedSubscript:", *MEMORY[0x1E0DACA18], a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v9 = v7;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  if (v11)
    -[SBBannerCustomTransitioningDelegate setStyle:](self, "setStyle:", objc_msgSend(v11, "integerValue"));
  -[SBBannerCustomTransitioningDelegate animatorForPresentationTransitionWithStyle:](self, "animatorForPresentationTransitionWithStyle:", -[SBBannerCustomTransitioningDelegate style](self, "style"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)animatorForPresentationTransitionWithStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 > 3)
    return 0;
  else
    return (id)objc_msgSend(objc_alloc(**((Class **)&unk_1E8EB74D0 + a3)), "initForPresenting:", 1, v3, v4);
}

- (id)animatorForDismissalTransitionWithStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 > 3)
    return 0;
  else
    return (id)objc_msgSend(objc_alloc(**((Class **)&unk_1E8EB74D0 + a3)), "initForPresenting:", 0, v3, v4);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

@end
