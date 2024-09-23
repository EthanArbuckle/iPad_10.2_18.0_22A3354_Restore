@implementation LTUIVisualTranslationView

- (void)updatePresentationAnchorRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
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
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v69 = *MEMORY[0x1E0C80C00];
  if (CGRectIsEmpty(a3))
  {
    v8 = _LTOSLogVisualTranslation();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[LTUIVisualTranslationView updatePresentationAnchorRectForContentRect:].cold.1();
  }
  else
  {
    -[LTUIVisualTranslationView _presentationAnchorView](self, "_presentationAnchorView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    -[LTUIVisualTranslationView _presentationAnchorView](self, "_presentationAnchorView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v13;
    v58 = v11;
    v55 = v17;
    v56 = v15;
    objc_msgSend(v18, "convertRect:toView:", self, v11, v13, v15, v17);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    v53 = v22;
    v54 = v20;
    v51 = v26;
    v52 = v24;
    objc_msgSend((id)objc_opt_class(), "clipRect:contentRect:", v20, v22, v24, v26, x, y, width, height);
    v49 = v28;
    v50 = v27;
    v47 = v30;
    v48 = v29;
    objc_msgSend((id)objc_opt_class(), "swiftUIRectFrom:contentRect:", v27, v28, v29, v30, x, y, width, height);
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v39 = _LTOSLogVisualTranslation();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      v41 = v39;
      objc_msgSend((id)objc_opt_class(), "describeRect:", v58, v57, v56, v55);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "describeRect:", v54, v53, v52, v51);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "describeRect:", v50, v49, v48, v47);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "describeRect:", v32, v34, v36, v38);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "describeRect:", x, y, width, height);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v60 = v42;
      v61 = 2114;
      v62 = v43;
      v63 = 2114;
      v64 = v44;
      v65 = 2114;
      v66 = v45;
      v67 = 2114;
      v68 = v46;
      _os_log_debug_impl(&dword_1D2CC0000, v41, OS_LOG_TYPE_DEBUG, "Anchor rect %{public}@ converted to %{public}@; clipped to %{public}@; Swift UI rect %{public}@ in content rect %{public}@",
        buf,
        0x34u);

    }
    -[LTUIVisualTranslationView translationView](self, "translationView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setPresentationAnchorWithRect:contentRect:", v32, v34, v36, v38, x, y, width, height);

  }
}

+ (CGRect)clipRect:(CGRect)a3 contentRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double MaxY;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double MaxX;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;
  CGRect v33;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v33.origin.x = v11;
  v33.origin.y = v10;
  v33.size.width = v9;
  v33.size.height = v8;
  if (!CGRectContainsRect(a4, v33))
  {
    if (v11 < x)
      v12 = x;
    else
      v12 = v11;
    if (v12 > width)
      v11 = width;
    else
      v11 = v12;
    if (v10 < y)
      v13 = y;
    else
      v13 = v10;
    if (v13 > height)
      v10 = height;
    else
      v10 = v13;
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    MaxX = CGRectGetMaxX(v27);
    v28.origin.x = v11;
    v28.origin.y = v10;
    v28.size.width = v9;
    v28.size.height = v8;
    v14 = MaxX - CGRectGetMaxX(v28);
    v15 = height;
    if (v14 >= 0.0)
      v14 = -0.0;
    v9 = v9 + v14;
    v16 = x;
    v17 = y;
    v18 = width;
    MaxY = CGRectGetMaxY(*(CGRect *)(&v15 - 3));
    v29.origin.x = v11;
    v29.origin.y = v10;
    v29.size.width = v9;
    v29.size.height = v8;
    v20 = MaxY - CGRectGetMaxY(v29);
    if (v20 >= 0.0)
      v20 = -0.0;
    v8 = v8 + v20;
    if (v9 == 0.0)
    {
      v30.origin.x = v11;
      v30.origin.y = v10;
      v30.size.width = v9;
      v30.size.height = v8;
      if (CGRectGetMaxX(v30) == width)
      {
        v9 = v9 + 1.0;
        v11 = v11 + -1.0;
      }
    }
    if (v8 == 0.0)
    {
      v31.origin.x = v11;
      v31.origin.y = v10;
      v31.size.width = v9;
      v31.size.height = v8;
      if (CGRectGetMaxY(v31) == height)
      {
        v10 = v10 + -1.0;
        v8 = v8 + 1.0;
      }
    }
  }
  v21 = v11;
  v22 = v10;
  v23 = v9;
  v24 = v8;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

+ (id)describeRect:(CGRect)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(x:%f y:%f; w:%f h:%f)"),
               *(_QWORD *)&a3.origin.x,
               *(_QWORD *)&a3.origin.y,
               *(_QWORD *)&a3.size.width,
               *(_QWORD *)&a3.size.height);
}

- (LTUIVisualTranslationView)initWithFrame:(CGRect)a3
{
  LTUIVisualTranslationView *v3;
  LTUIVisualTranslationView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  LTUIVisualTranslationView *v10;
  uint64_t v12;
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)LTUIVisualTranslationView;
  v3 = -[LTUIVisualTranslationView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[LTUIVisualTranslationView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = (void *)objc_opt_new();
    -[LTUIVisualTranslationView setTranslationView:](v4, "setTranslationView:", v5);

    objc_initWeak(&location, v4);
    v12 = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v13, &location);
    -[LTUIVisualTranslationView translationView](v4, "translationView", v12, 3221225472, __43__LTUIVisualTranslationView_initWithFrame___block_invoke, &unk_1E9447C60);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDismissHandler:", &v12);

    -[LTUIVisualTranslationView setCompletion:](v4, "setCompletion:", 0);
    -[LTUIVisualTranslationView translationView](v4, "translationView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

    -[LTUIVisualTranslationView addSubview:](v4, "addSubview:", v8);
    +[LTUIVisualTranslationView constrainToSuperview:](LTUIVisualTranslationView, "constrainToSuperview:", v8);
    v10 = v4;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v4;
}

void __43__LTUIVisualTranslationView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismiss");

}

- (LTUIVisualTranslationView)initWithCoder:(id)a3
{
  LTUIVisualTranslationView *v3;
  LTUIVisualTranslationView *v4;
  LTUIVisualTranslationView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LTUIVisualTranslationView;
  v3 = -[LTUIVisualTranslationView initWithFrame:](&v7, sel_initWithFrame_, a3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

+ (void)isTranslatable:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;

  v5 = a4;
  +[LTUIVisualTranslationService compactObservations:](LTUIVisualTranslationService, "compactObservations:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _LTOSLogVisualTranslation();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[LTUIVisualTranslationView isTranslatable:completion:].cold.1();
  +[VisualTranslationService isTranslatable:completion:](_TtC13TranslationUI24VisualTranslationService, "isTranslatable:completion:", v6, v5);

}

- (void)translate:(id)a3
{
  void *v4;
  id v5;

  +[LTUIVisualTranslationService compactObservations:](LTUIVisualTranslationService, "compactObservations:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[LTUIVisualTranslationView translationView](self, "translationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translate:sourceLocale:targetLocale:completion:", v5, 0, 0, 0);

}

- (void)translate:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  +[LTUIVisualTranslationService compactObservations:](LTUIVisualTranslationService, "compactObservations:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[LTUIVisualTranslationView translationView](self, "translationView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "translate:sourceLocale:targetLocale:completion:", v8, 0, 0, v6);

}

- (void)translate:(id)a3 sourceLocale:(id)a4 targetLocale:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = _LTOSLogVisualTranslation();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v18 = 134218498;
    v19 = objc_msgSend(v10, "count");
    v20 = 2114;
    v21 = v11;
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_1D2CC0000, v15, OS_LOG_TYPE_DEFAULT, "Requested translation of %lu observations from %{public}@ to %{public}@", (uint8_t *)&v18, 0x20u);

  }
  +[LTUIVisualTranslationService compactObservations:](LTUIVisualTranslationService, "compactObservations:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[LTUIVisualTranslationView translationView](self, "translationView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "translate:sourceLocale:targetLocale:completion:", v16, v11, v12, v13);

}

- (void)dismiss
{
  NSObject *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  uint8_t v7[16];

  v3 = _LTOSLogVisualTranslation();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D2CC0000, v3, OS_LOG_TYPE_INFO, "Dismissing LTUIVisualTranslationView", v7, 2u);
  }
  -[LTUIVisualTranslationView removeFromSuperview](self, "removeFromSuperview");
  -[LTUIVisualTranslationView translationView](self, "translationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissErrorUI");

  -[LTUIVisualTranslationView completion](self, "completion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LTUIVisualTranslationView completion](self, "completion");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0);

  }
}

- (void)registerForDismissEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  -[LTUIVisualTranslationView completion](self, "completion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__LTUIVisualTranslationView_registerForDismissEvent___block_invoke;
  v8[3] = &unk_1E9447C88;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  -[LTUIVisualTranslationView setCompletion:](self, "setCompletion:", v8);

}

void __53__LTUIVisualTranslationView_registerForDismissEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    v3 = v6;
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

- (void)setZoomScale:(double)a3
{
  id v4;

  -[LTUIVisualTranslationView translationView](self, "translationView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setZoomScale:", a3);

}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSObject *v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = _LTOSLogVisualTranslation();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[LTUIVisualTranslationView drawRect:].cold.1();
  v9.receiver = self;
  v9.super_class = (Class)LTUIVisualTranslationView;
  -[LTUIVisualTranslationView drawRect:](&v9, sel_drawRect_, x, y, width, height);
  -[LTUIVisualTranslationView updatePresentationAnchorRectForContentRect:](self, "updatePresentationAnchorRectForContentRect:", x, y, width, height);
}

- (void)didMoveToSuperview
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D2CC0000, v0, v1, "LTUIVisualTranslationView didMoveToSuperview", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)constrainToSuperview:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v4, "topAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "topAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v19);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v18;
      objc_msgSend(v4, "bottomAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bottomAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:", v16);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v7;
      objc_msgSend(v4, "leadingAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "leadingAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToAnchor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2] = v10;
      objc_msgSend(v4, "trailingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21[3] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "activateConstraints:", v14);

    }
  }

}

- (_TtC13TranslationUI27VisualTranslationViewBridge)translationView
{
  return self->_translationView;
}

- (void)setTranslationView:(id)a3
{
  objc_storeStrong((id *)&self->_translationView, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (UIView)_presentationAnchorView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->__presentationAnchorView);
}

- (void)set_presentationAnchorView:(id)a3
{
  objc_storeWeak((id *)&self->__presentationAnchorView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__presentationAnchorView);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_translationView, 0);
}

- (void)updatePresentationAnchorRectForContentRect:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D2CC0000, v0, v1, "LTUIVisualTranslationView is aborting anchor update since the frame is empty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)isTranslatable:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D2CC0000, v0, v1, "Calling +[LTUIVisualTranslationView isTranslatable:completion:]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)drawRect:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D2CC0000, v0, v1, "LTUIVisualTranslationView drawRect", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
