@implementation _UIDocumentPropertiesHeaderView

- (_UIDocumentPropertiesHeaderView)initWithProperties:(id)a3 metadata:(id)a4 menuInteraction:(id)a5 sourceViewProvider:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  _UIDocumentPropertiesHeaderView *v16;
  _UIDocumentPropertiesHeaderView *v17;
  void *v18;
  id sourceViewProvider;
  double v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  UIStackView *v28;
  void *v29;
  UIStackView *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  UIDragInteraction *v39;
  UIPointerInteraction *v40;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id obj;
  void *aBlock;
  void *v59;
  id v60;
  id v61;
  id location;
  objc_super v63;
  _QWORD v64[4];
  _QWORD v65[4];

  v65[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v55 = v12;
  if (!v12)
  {
    v42 = v15;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentProperties.m"), 339, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("properties != NULL"));

    v15 = v42;
  }
  v56 = v13;
  if (!v13)
  {
    v44 = v15;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentProperties.m"), 340, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metadata != nil"));

    v15 = v44;
  }
  obj = v14;
  if (!v14)
  {
    v46 = v15;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentProperties.m"), 341, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("menuInteraction != nil"));

    v15 = v46;
  }
  aBlock = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentProperties.m"), 342, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceViewProvider != NULL"));

  }
  v63.receiver = self;
  v63.super_class = (Class)_UIDocumentPropertiesHeaderView;
  v16 = -[UIView init](&v63, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_properties, a3);
    objc_storeWeak((id *)&v17->_menuInteraction, obj);
    v18 = _Block_copy(aBlock);
    sourceViewProvider = v17->_sourceViewProvider;
    v17->_sourceViewProvider = v18;

    v61 = (id)objc_msgSend(objc_alloc((Class)getLPLinkViewClass()), "initWithMetadata:", v56);
    objc_msgSend(v61, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v61, "setDelegate:", v17);
    objc_msgSend(v61, "_setDisableTapGesture:", 1);
    objc_msgSend(v61, "_setDisableAnimations:", 1);
    objc_msgSend(v61, "_setPreferredSizeClass:", 2);
    LODWORD(v20) = 1132068864;
    objc_msgSend(v61, "setContentCompressionResistancePriority:forAxis:", 0, v20);
    objc_storeStrong((id *)&v17->_linkView, v61);
    objc_initWeak(&location, v17);
    -[UIView traitCollection](v17, "traitCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "userInterfaceIdiom") == 6;

    if (v22)
      +[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration");
    else
      +[UIButtonConfiguration grayButtonConfiguration](UIButtonConfiguration, "grayButtonConfiguration");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.arrow.up"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setImage:", v23);

    objc_msgSend(v59, "setCornerStyle:", 4);
    +[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setPreferredSymbolConfigurationForImage:", v24);

    +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v59, 0);
    v60 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addTarget:action:forControlEvents:", v17, sel__share_, 0x2000);
    objc_msgSend(v60, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView traitCollection](v17, "traitCollection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "userInterfaceIdiom") == 6;

    if (!v26)
    {
      +[UIColor labelColor](UIColor, "labelColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setTintColor:", v27);

    }
    objc_storeStrong((id *)&v17->_shareButton, v60);
    v28 = [UIStackView alloc];
    v65[0] = v61;
    v65[1] = v60;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[UIStackView initWithArrangedSubviews:](v28, "initWithArrangedSubviews:", v29);

    -[UIStackView setAxis:](v30, "setAxis:", 0);
    -[UIStackView setDistribution:](v30, "setDistribution:", 3);
    -[UIStackView setAlignment:](v30, "setAlignment:", 3);
    -[UIStackView setSpacing:](v30, "setSpacing:", 1.17549435e-38);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v17, "addSubview:", v30);
    v49 = (void *)MEMORY[0x1E0D156E0];
    -[UIView leadingAnchor](v30, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v17, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:constant:", v53, 16.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v52;
    -[UIView bottomAnchor](v30, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v17, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v64[1] = v31;
    -[UIView trailingAnchor](v30, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v17, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, -16.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v64[2] = v34;
    -[UIView topAnchor](v30, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v17, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v64[3] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "activateConstraints:", v38);

    v39 = -[UIDragInteraction initWithDelegate:]([UIDragInteraction alloc], "initWithDelegate:", v17);
    -[UIView addInteraction:](v17, "addInteraction:", v39);

    v40 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", v17);
    -[UIView addInteraction:](v17, "addInteraction:", v40);

    -[_UIDocumentPropertiesHeaderView update](v17, "update");
    objc_destroyWeak(&location);

  }
  return v17;
}

- (CGRect)_rectForDragInteraction
{
  UIDocumentProperties *v3;
  UIDocumentProperties *v4;
  void *v5;
  void *v6;
  void *v7;
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
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect result;

  v3 = self->_properties;
  v4 = v3;
  if (v3
    && (-[UIDocumentProperties dragItemsProvider](v3, "dragItemsProvider"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[LPLinkView _primaryMediaView](self->_linkView, "_primaryMediaView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "bounds");
      v21 = CGRectInset(v20, -10.0, -10.0);
      -[UIView convertRect:fromView:](self, "convertRect:fromView:", v7, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
    }
    else
    {
      v9 = *MEMORY[0x1E0C9D628];
      v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    }

  }
  else
  {
    v9 = *MEMORY[0x1E0C9D628];
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v10;
  CGFloat v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  CGPoint v15;
  CGRect v16;
  CGRect v17;

  v5 = a4;
  -[_UIDocumentPropertiesHeaderView _rectForDragInteraction](self, "_rectForDragInteraction");
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  if (CGRectIsNull(v16)
    || (objc_msgSend(v5, "locationInView:", self),
        v15.x = v10,
        v15.y = v11,
        v17.origin.x = x,
        v17.origin.y = y,
        v17.size.width = width,
        v17.size.height = height,
        !CGRectContainsPoint(v17, v15)))
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[UIDocumentProperties dragItemsProvider](self->_properties, "dragItemsProvider");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v12)[2](v12, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)_defaultDragPreview
{
  LPLinkView *v3;
  void *v4;
  UIPreviewTarget *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIPreviewTarget *v10;
  void *v11;
  void *v12;
  void *v13;
  UITargetedDragPreview *v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v18;
  uint8_t v19[16];
  uint8_t buf[16];

  v3 = self->_linkView;
  -[LPLinkView _primaryMediaView](v3, "_primaryMediaView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [UIPreviewTarget alloc];
    objc_msgSend(v4, "bounds");
    objc_msgSend(v4, "convertPoint:toView:", self, v7 + v6 * 0.5, v9 + v8 * 0.5);
    v10 = -[UIPreviewTarget initWithContainer:center:](v5, "initWithContainer:center:", self);
    v11 = (void *)objc_opt_new();
    _UIBezierPathAroundViewAlpha(v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v11, "setShadowPath:", v12);
      +[UIColor clearColor](UIColor, "clearColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBackgroundColor:", v13);

    }
    v14 = -[UITargetedDragPreview initWithView:parameters:target:]([UITargetedDragPreview alloc], "initWithView:parameters:target:", v4, v11, v10);

  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "Requesting a drag preview for a document menu header that does not seem to have an image view.", buf, 2u);
      }

    }
    else
    {
      v15 = _defaultDragPreview___s_category;
      if (!_defaultDragPreview___s_category)
      {
        v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&_defaultDragPreview___s_category);
      }
      v16 = *(NSObject **)(v15 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Requesting a drag preview for a document menu header that does not seem to have an image view.", v19, 2u);
      }
    }
    v14 = 0;
  }

  return v14;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_menuInteraction);
  objc_msgSend(WeakRetained, "dismissMenu");

}

- (void)_share:(id)a3
{
  void (**v5)(void);
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(void);

  -[UIDocumentProperties activityViewControllerProvider](self->_properties, "activityViewControllerProvider", a3);
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v12 = v5;
    v5[2]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentProperties.m"), 478, CFSTR("activityViewControllerProvider requires a UIActivityViewController."));

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_menuInteraction);
    objc_msgSend(WeakRetained, "dismissMenu");

    (*((void (**)(void))self->_sourceViewProvider + 2))();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "popoverPresentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSourceView:", v8);

    objc_msgSend(v8, "_viewControllerForAncestor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentViewController:animated:completion:", v6, 1, 0);

    v5 = v12;
  }

}

- (void)linkViewNeedsResize:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  CGRect v9;

  if (self->_linkView == a3)
  {
    objc_msgSend(a3, "frame");
    if (!CGRectIsEmpty(v9))
    {
      -[UIView superview](self, "superview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        while (1)
        {
          v7 = v4;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          objc_msgSend(v7, "superview");
          v5 = objc_claimAutoreleasedReturnValue();

          v4 = (void *)v5;
          if (!v5)
            goto LABEL_9;
        }
        v4 = v7;
      }
LABEL_9:
      v8 = v4;
      objc_msgSend(v4, "collectionViewLayout");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "invalidateLayout");

    }
  }
}

- (void)update
{
  id v3;

  -[UIDocumentProperties activityViewControllerProvider](self->_properties, "activityViewControllerProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setHidden:](self->_shareButton, "setHidden:", v3 == 0);

}

- (CGRect)_rectForShareButton
{
  UIButton *shareButton;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  shareButton = self->_shareButton;
  if (shareButton && !-[UIView isHidden](shareButton, "isHidden"))
  {
    -[UIView bounds](self->_shareButton, "bounds");
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", self->_shareButton);
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D628];
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)_defaultSharePreview
{
  UIButton *v3;
  UIButton *v4;
  unint64_t v5;
  NSObject *v6;
  UITargetedPreview *v7;
  UIPreviewTarget *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIPreviewTarget *v13;
  UITargetedPreview *v14;
  void *v15;
  NSObject *v17;
  uint8_t v18[16];
  uint8_t buf[16];

  v3 = self->_shareButton;
  v4 = v3;
  if (v3 && !-[UIView isHidden](v3, "isHidden"))
  {
    v8 = [UIPreviewTarget alloc];
    -[UIView bounds](v4, "bounds");
    -[UIView convertPoint:toView:](v4, "convertPoint:toView:", self, v10 + v9 * 0.5, v12 + v11 * 0.5);
    v13 = -[UIPreviewTarget initWithContainer:center:](v8, "initWithContainer:center:", self);
    v14 = [UITargetedPreview alloc];
    v15 = (void *)objc_opt_new();
    v7 = -[UITargetedPreview initWithView:parameters:target:](v14, "initWithView:parameters:target:", v4, v15, v13);

  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v17, OS_LOG_TYPE_FAULT, "Requesting a share preview for a document menu header that does not seem to have a share button.", buf, 2u);
      }

    }
    else
    {
      v5 = _defaultSharePreview___s_category;
      if (!_defaultSharePreview___s_category)
      {
        v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&_defaultSharePreview___s_category);
      }
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Requesting a share preview for a document menu header that does not seem to have a share button.", v18, 2u);
      }
    }
    v7 = 0;
  }

  return v7;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  double x;
  double y;
  double width;
  double height;
  CGFloat v11;
  CGFloat v12;
  const __CFString *v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  CGPoint v18;
  CGPoint v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v6 = a4;
  -[_UIDocumentPropertiesHeaderView _rectForDragInteraction](self, "_rectForDragInteraction");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  if (CGRectIsNull(v20)
    || (objc_msgSend(v6, "location"),
        v18.x = v11,
        v18.y = v12,
        v21.origin.x = x,
        v21.origin.y = y,
        v21.size.width = width,
        v21.size.height = height,
        !CGRectContainsPoint(v21, v18)))
  {
    -[_UIDocumentPropertiesHeaderView _rectForShareButton](self, "_rectForShareButton");
    x = v22.origin.x;
    y = v22.origin.y;
    width = v22.size.width;
    height = v22.size.height;
    if (CGRectIsNull(v22)
      || (objc_msgSend(v6, "location"),
          v19.x = v14,
          v19.y = v15,
          v23.origin.x = x,
          v23.origin.y = y,
          v23.size.width = width,
          v23.size.height = height,
          !CGRectContainsPoint(v23, v19)))
    {
      v16 = 0;
      goto LABEL_9;
    }
    v13 = CFSTR("com.apple.documentproperties.header.share");
  }
  else
  {
    v13 = CFSTR("com.apple.documentproperties.header.drag");
  }
  +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v13, x, y, width, height);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v16;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  CGRect v24;

  v5 = a4;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("com.apple.documentproperties.header.drag"));

  if (v7)
  {
    -[_UIDocumentPropertiesHeaderView _defaultDragPreview](self, "_defaultDragPreview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIPointerEffect effectWithPreview:](UIPointerLiftEffect, "effectWithPreview:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", CFSTR("com.apple.documentproperties.header.share"));

    if (!v12)
    {
      v10 = 0;
      goto LABEL_7;
    }
    -[_UIDocumentPropertiesHeaderView _rectForShareButton](self, "_rectForShareButton");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[_UIDocumentPropertiesHeaderView _defaultSharePreview](self, "_defaultSharePreview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIPointerEffect effectWithPreview:](UIPointerLiftEffect, "effectWithPreview:", v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v24.origin.x = v14;
    v24.origin.y = v16;
    v24.size.width = v18;
    v24.size.height = v20;
    +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v14, v16, v18, v20, CGRectGetHeight(v24) * 0.5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v9, v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:

  return v10;
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_linkView, 0);
  objc_storeStrong(&self->_sourceViewProvider, 0);
  objc_destroyWeak((id *)&self->_menuInteraction);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
