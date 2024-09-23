@implementation SKUISlideshowDismissalAnimator

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
        -[SKUISlideshowDismissalAnimator transitionDuration:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return 0.25;
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
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[5];
  id v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  SKUISlideshowDismissalAnimator *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUISlideshowDismissalAnimator animateTransition:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
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
  objc_msgSend(v15, "setFrame:");
  objc_msgSend(v16, "frame");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[UIImageView frame](self->_imageView, "frame");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  -[UIImageView superview](self->_imageView, "superview");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "convertRect:fromView:", v34, v27, v29, v31, v33);
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;

  objc_msgSend(v16, "setAlpha:", 0.0);
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithFrame:privateStyle:", 2020, v19, v21, v23, v25);
  objc_msgSend(v43, "setAlpha:", 1.0);
  objc_msgSend(v43, "setAutoresizingMask:", 18);
  objc_msgSend(v17, "addSubview:", v43);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", self->_imageRect.origin.x, self->_imageRect.origin.y, self->_imageRect.size.width, self->_imageRect.size.height);
  objc_msgSend(v17, "addSubview:", self->_imageView);
  v44 = (void *)MEMORY[0x1E0DC3F10];
  -[SKUISlideshowDismissalAnimator transitionDuration:](self, "transitionDuration:", v4);
  v46 = v45;
  v47 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __52__SKUISlideshowDismissalAnimator_animateTransition___block_invoke;
  v55[3] = &unk_1E73A6188;
  v56 = v43;
  v57 = self;
  v58 = v36;
  v59 = v38;
  v60 = v40;
  v61 = v42;
  v51[0] = v47;
  v51[1] = 3221225472;
  v51[2] = __52__SKUISlideshowDismissalAnimator_animateTransition___block_invoke_2;
  v51[3] = &unk_1E73A3E30;
  v51[4] = self;
  v52 = v56;
  v53 = v16;
  v54 = v4;
  v48 = v4;
  v49 = v16;
  v50 = v56;
  objc_msgSend(v44, "animateWithDuration:animations:completion:", v55, v51, v46);

}

uint64_t __52__SKUISlideshowDismissalAnimator_animateTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __52__SKUISlideshowDismissalAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
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

- (CGRect)imageRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_imageRect.origin.x;
  y = self->_imageRect.origin.y;
  width = self->_imageRect.size.width;
  height = self->_imageRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setImageRect:(CGRect)a3
{
  self->_imageRect = a3;
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
