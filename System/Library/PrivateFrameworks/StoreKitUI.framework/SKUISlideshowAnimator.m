@implementation SKUISlideshowAnimator

- (double)transitionDuration:(id)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUISlideshowAnimator transitionDuration:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return 0.400000006;
}

- (void)animateTransition:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  UIImageView *imageView;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  SKUISlideshowAnimator *v46;
  id v47;
  id v48;
  double v49;
  double v50;
  double v51;
  double v52;
  _QWORD v53[4];
  id v54;
  SKUISlideshowAnimator *v55;
  double v56;
  double v57;
  double v58;
  double v59;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUISlideshowAnimator animateTransition:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalFrameForViewController:", v14);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(v15, "setAlpha:", 0.0);
  objc_msgSend(v15, "setFrame:", v19, v21, v23, v25);
  objc_msgSend(v17, "insertSubview:aboveSubview:", v15, v16);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithFrame:privateStyle:", 2020, v19, v21, v23, v25);
  objc_msgSend(v26, "setAlpha:", 0.0);
  objc_msgSend(v26, "setAutoresizingMask:", 18);
  objc_msgSend(v17, "addSubview:", v26);
  imageView = self->_imageView;
  -[UIImageView frame](imageView, "frame");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  -[UIImageView superview](self->_imageView, "superview");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "convertRect:fromView:", v36, v29, v31, v33, v35);
  -[UIImageView setFrame:](imageView, "setFrame:");

  objc_msgSend(v17, "addSubview:", self->_imageView);
  v37 = (void *)MEMORY[0x1E0DC3F10];
  -[SKUISlideshowAnimator transitionDuration:](self, "transitionDuration:", v4);
  v39 = v38;
  v40 = MEMORY[0x1E0C809B0];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __43__SKUISlideshowAnimator_animateTransition___block_invoke;
  v53[3] = &unk_1E73A6188;
  v54 = v26;
  v55 = self;
  v56 = v19;
  v57 = v21;
  v58 = v23;
  v59 = v25;
  v44[0] = v40;
  v44[1] = 3221225472;
  v44[2] = __43__SKUISlideshowAnimator_animateTransition___block_invoke_2;
  v44[3] = &unk_1E73A8190;
  v49 = v19;
  v50 = v21;
  v51 = v23;
  v52 = v25;
  v45 = v15;
  v46 = self;
  v47 = v54;
  v48 = v4;
  v41 = v4;
  v42 = v54;
  v43 = v15;
  objc_msgSend(v37, "animateWithDuration:animations:completion:", v53, v44, v39);

}

uint64_t __43__SKUISlideshowAnimator_animateTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __43__SKUISlideshowAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 56), "completeTransition:", 1);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

- (void)transitionDuration:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)animateTransition:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
