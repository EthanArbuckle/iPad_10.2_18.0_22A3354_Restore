@implementation SKUIAddToWishlistAnimation

- (SKUIAddToWishlistAnimation)initWithImage:(id)a3 buttonItem:(id)a4 navigationBar:(id)a5
{
  id v9;
  id v10;
  id v11;
  SKUIAddToWishlistAnimation *v12;
  SKUIAddToWishlistAnimation *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  SKUIAddToWishlistAnimation *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIAddToWishlistAnimation initWithImage:buttonItem:navigationBar:].cold.1();
  }
  v32.receiver = self;
  v32.super_class = (Class)SKUIAddToWishlistAnimation;
  v12 = -[SKUIAddToWishlistAnimation init](&v32, sel_init);
  v13 = v12;
  if (v12)
  {
    v27 = v9;
    objc_storeStrong((id *)&v12->_image, a3);
    objc_msgSend(v10, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v26 = v11;
    objc_msgSend(v11, "_allViews");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
      v25 = v13;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v21, "imageForState:", 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "titleForState:", 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22 == v14)
            {
              v22 = v14;
LABEL_19:
              v13 = v25;
              objc_storeStrong((id *)&v25->_targetButton, v21);

              goto LABEL_20;
            }
            if ((objc_msgSend(v15, "isEqualToString:", v23) & 1) != 0)
              goto LABEL_19;

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        v13 = v25;
        if (v18)
          continue;
        break;
      }
    }
LABEL_20:

    if (!v13->_targetButton)
    {

      v13 = 0;
    }
    v9 = v27;
    v11 = v26;

  }
  return v13;
}

- (void)animateWithCompletionBlock:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id completionBlock;
  SKUIAddToWishlistAnimation *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  UINavigationButton *targetButton;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  float v24;
  double v25;
  float v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  float v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  CATransform3D v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[3];
  _QWORD v65[5];

  v65[3] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CD28B0];
  v5 = a3;
  objc_msgSend(v4, "begin");
  v6 = (void *)objc_msgSend(v5, "copy");

  completionBlock = self->_completionBlock;
  self->_completionBlock = v6;

  v8 = self;
  v9 = (void *)__AddToWishlistAnimations;
  if (!__AddToWishlistAnimations)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v11 = (void *)__AddToWishlistAnimations;
    __AddToWishlistAnimations = (uint64_t)v10;

    v9 = (void *)__AddToWishlistAnimations;
  }
  objc_msgSend(v9, "addObject:", v8);

  -[UINavigationButton window](v8->_targetButton, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  targetButton = v8->_targetButton;
  -[UINavigationButton bounds](targetButton, "bounds");
  -[UINavigationButton convertRect:toView:](targetButton, "convertRect:toView:", v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v8->_image);
  objc_msgSend(v22, "frame");
  v24 = (v19 - v23) * 0.5;
  v26 = (v21 - v25) * 0.5;
  objc_msgSend(v22, "setFrame:", v15 + floorf(v24), v17 + floorf(v26));
  objc_msgSend(v12, "addSubview:", v22);
  v27 = (void *)MEMORY[0x1E0DC3F10];
  v28 = MEMORY[0x1E0C809B0];
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __57__SKUIAddToWishlistAnimation_animateWithCompletionBlock___block_invoke;
  v62[3] = &unk_1E739FD38;
  v63 = v22;
  v60[0] = v28;
  v60[1] = 3221225472;
  v60[2] = __57__SKUIAddToWishlistAnimation_animateWithCompletionBlock___block_invoke_2;
  v60[3] = &unk_1E73A0108;
  v61 = v63;
  v29 = v63;
  objc_msgSend(v27, "animateWithDuration:delay:options:animations:completion:", 0x20000, v62, v60, 0.4, 0.0);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setBeginTime:", CACurrentMediaTime() + 0.4);
  objc_msgSend(v30, "setDelegate:", v8);
  objc_msgSend(v30, "setDuration:", 0.33);
  objc_msgSend(v30, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  UIAnimationDragCoefficient();
  *(float *)&v32 = 1.0 / v31;
  objc_msgSend(v30, "setSpeed:", v32);
  objc_msgSend(v30, "setKeyTimes:", &unk_1E749BB18);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v33;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v34;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v65[2] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setTimingFunctions:", v36);

  v50 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v56 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v49 = v56;
  v57 = v50;
  v48 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v58 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v47 = v58;
  v59 = v48;
  v46 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v52 = *MEMORY[0x1E0CD2610];
  v45 = v52;
  v53 = v46;
  v44 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v54 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v43 = v54;
  v55 = v44;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v52);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v37;
  v38 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v51, 1.4, 1.4, 1.0);
  objc_msgSend(v38, "valueWithCATransform3D:", &v51);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v39;
  v56 = v49;
  v57 = v50;
  v58 = v47;
  v59 = v48;
  v52 = v45;
  v53 = v46;
  v54 = v43;
  v55 = v44;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v52);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 3);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setValues:", v41);

  -[UINavigationButton layer](v8->_targetButton, "layer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addAnimation:forKey:", v30, CFSTR("WishlistPop"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

uint64_t __57__SKUIAddToWishlistAnimation_animateWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, 0.0, 0.0);
  return objc_msgSend(v1, "setTransform:", &v3);
}

uint64_t __57__SKUIAddToWishlistAnimation_animateWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void (**completionBlock)(void);
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  completionBlock = (void (**)(void))self->_completionBlock;
  if (completionBlock)
  {
    completionBlock[2]();
    v6 = self->_completionBlock;
    self->_completionBlock = 0;

  }
  objc_msgSend((id)__AddToWishlistAnimations, "removeObject:", self);
  if (!objc_msgSend((id)__AddToWishlistAnimations, "count"))
  {
    v7 = (void *)__AddToWishlistAnimations;
    __AddToWishlistAnimations = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetButton, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

- (void)initWithImage:buttonItem:navigationBar:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIAddToWishlistAnimation initWithImage:buttonItem:navigationBar:]";
}

@end
