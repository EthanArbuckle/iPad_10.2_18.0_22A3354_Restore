@implementation SBHomeGrabberRotationView

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4 rotationSettings:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  _BYTE v32[48];
  _QWORD v33[4];
  id v34;
  id v35;
  double v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  SBHomeGrabberRotationView *v48;
  id v49;

  v5 = a4;
  v8 = a5;
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    -[NSMutableArray firstObject](self->_rotationWrapperViews, "firstObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[SBHomeGrabberRotationView _addWrapperViewWithOrientation:](self, "_addWrapperViewWithOrientation:", a3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("grabberViewRotationFadeIn-%llu"), ++setOrientation_animated_rotationSettings____animationCount);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_opt_new();
      v12 = (void *)objc_opt_new();
      v13 = MEMORY[0x1E0C809B0];
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke;
      v45[3] = &unk_1E8E9F108;
      v14 = v11;
      v46 = v14;
      v15 = v12;
      v47 = v15;
      v48 = self;
      v16 = v10;
      v49 = v16;
      v17 = (void *)MEMORY[0x1D17E5550](v45);
      v28 = (void *)MEMORY[0x1E0D01908];
      -[SBFHomeGrabberSettings rotationFadeOutAnimationSettings](self->_grabberSettings, "rotationFadeOutAnimationSettings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "BSAnimationSettings");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v13;
      v43[1] = 3221225472;
      v43[2] = __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke_2;
      v43[3] = &unk_1E8E9DED8;
      v44 = v9;
      v37[0] = v13;
      v37[1] = 3221225472;
      v37[2] = __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke_3;
      v37[3] = &unk_1E8E9F5E8;
      v37[4] = self;
      v38 = v16;
      v39 = v29;
      v40 = v44;
      v41 = v14;
      v20 = v17;
      v42 = v20;
      v31 = v14;
      v30 = v44;
      v21 = v29;
      v9 = v16;
      objc_msgSend(v28, "animateWithSettings:actions:completion:", v19, v43, v37);

      objc_msgSend(v8, "delay");
      v23 = v22;
      objc_msgSend(v8, "duration");
      v24 = (void *)*MEMORY[0x1E0CEB258];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke_5;
      v33[3] = &unk_1E8EA1310;
      v36 = v23 + v25;
      v34 = v15;
      v35 = v20;
      v26 = v20;
      v27 = v15;
      objc_msgSend(v24, "_performBlockAfterCATransactionCommits:", v33);

    }
    else
    {
      SBFTransformFromOrientationToOrientation();
      objc_msgSend(v9, "setTransform:", v32);
    }

    -[SBHomeGrabberRotationView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setOrientation:(int64_t)a3
{
  -[SBHomeGrabberRotationView setOrientation:animated:rotationSettings:](self, "setOrientation:animated:rotationSettings:", a3, 0, 0);
}

- (SBHomeGrabberView)grabberView
{
  return self->_grabberView;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SBHomeGrabberView *grabberView;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[SBHomeGrabberRotationView bounds](self, "bounds");
  if (self->_useRotationWrapperViews)
  {
    v7 = v3;
    v8 = v4;
    v9 = v5;
    v10 = v6;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = self->_rotationWrapperViews;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15++), "setFrame:", v7, v8, v9, v10, (_QWORD)v18);
        }
        while (v13 != v15);
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

  }
  grabberView = self->_grabberView;
  -[SBHomeGrabberView superview](grabberView, "superview", (_QWORD)v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  -[SBHomeGrabberView setFrame:](grabberView, "setFrame:");

}

- (SBHomeGrabberRotationView)initWithFrame:(CGRect)a3 settings:(id)a4 useRotationWrapperViews:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  SBHomeGrabberRotationView *v12;
  uint64_t v13;
  NSMutableArray *rotationWrapperViews;
  SBHomeGrabberView *v15;
  uint64_t v16;
  SBHomeGrabberView *grabberView;
  uint64_t v18;
  SBFHomeGrabberSettings *grabberSettings;
  void *v20;
  objc_super v22;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SBHomeGrabberRotationView;
  v12 = -[SBHomeGrabberRotationView initWithFrame:](&v22, sel_initWithFrame_, x, y, width, height);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    rotationWrapperViews = v12->_rotationWrapperViews;
    v12->_rotationWrapperViews = (NSMutableArray *)v13;

    v12->_orientation = 1;
    v15 = [SBHomeGrabberView alloc];
    -[SBHomeGrabberRotationView bounds](v12, "bounds");
    v16 = -[SBHomeGrabberView initWithFrame:settings:shouldEnableGestures:](v15, "initWithFrame:settings:shouldEnableGestures:", v11, 1);
    grabberView = v12->_grabberView;
    v12->_grabberView = (SBHomeGrabberView *)v16;

    objc_msgSend(MEMORY[0x1E0DA9E28], "rootSettings");
    v18 = objc_claimAutoreleasedReturnValue();
    grabberSettings = v12->_grabberSettings;
    v12->_grabberSettings = (SBFHomeGrabberSettings *)v18;

    v12->_useRotationWrapperViews = v5;
    if (v5)
    {
      -[SBHomeGrabberRotationView _addWrapperViewWithOrientation:](v12, "_addWrapperViewWithOrientation:", v12->_orientation);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addSubview:", v12->_grabberView);

    }
    else
    {
      -[SBHomeGrabberRotationView addSubview:](v12, "addSubview:", v12->_grabberView);
    }
  }

  return v12;
}

- (SBHomeGrabberRotationView)initWithFrame:(CGRect)a3
{
  return -[SBHomeGrabberRotationView initWithFrame:settings:](self, "initWithFrame:settings:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBHomeGrabberRotationView)initWithFrame:(CGRect)a3 settings:(id)a4
{
  return -[SBHomeGrabberRotationView initWithFrame:settings:useRotationWrapperViews:](self, "initWithFrame:settings:useRotationWrapperViews:", a4, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

void __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "hasBeenSignalled")
    && objc_msgSend(*(id *)(a1 + 40), "hasBeenSignalled"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 440), "forgetBackgroundLuminance");
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 424), "resetAutoHideTimeOnRotation"))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 440), "resetAutoHide");
    v2 = *(_QWORD *)(a1 + 48);
    v3 = *(_QWORD *)(a1 + 56);
    v4 = *(void **)(v2 + 440);
    objc_msgSend(*(id *)(v2 + 424), "rotationFadeInAnimationSettings");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "BSAnimationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:forReason:withAnimationSettings:", 0, v3, v5);

  }
}

uint64_t __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setHidden:forReason:withAnimationSettings:", 1, *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "_removeAllAnimations:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440));
    objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "removeObject:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 56), "removeFromSuperview");
  v4 = (void *)*MEMORY[0x1E0CEB258];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke_4;
  v5[3] = &unk_1E8EA02D8;
  v6 = *(id *)(a1 + 64);
  v7 = *(id *)(a1 + 72);
  objc_msgSend(v4, "_performBlockAfterCATransactionCommits:", v5);

}

uint64_t __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "signal");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke_5(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke_6;
  v3[3] = &unk_1E8EA02D8;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E0C80D38], v3);

}

uint64_t __70__SBHomeGrabberRotationView_setOrientation_animated_rotationSettings___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "signal");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_addWrapperViewWithOrientation:(int64_t)a3
{
  id v4;
  uint64_t v6;

  if (!self->_useRotationWrapperViews)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  -[NSMutableArray insertObject:atIndex:](self->_rotationWrapperViews, "insertObject:atIndex:", v4, 0);
  SBFTransformFromOrientationToOrientation();
  objc_msgSend(v4, "setTransform:", &v6);
  -[SBHomeGrabberRotationView addSubview:](self, "addSubview:", v4);
  return v4;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_grabberSettings, 0);
  objc_storeStrong((id *)&self->_rotationWrapperViews, 0);
}

@end
