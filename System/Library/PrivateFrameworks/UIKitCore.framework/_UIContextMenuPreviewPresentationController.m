@implementation _UIContextMenuPreviewPresentationController

- (CGRect)frameOfPresentedViewInContainerView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGRect result;

  v13.receiver = self;
  v13.super_class = (Class)_UIContextMenuPreviewPresentationController;
  -[UIPresentationController frameOfPresentedViewInContainerView](&v13, sel_frameOfPresentedViewInContainerView);
  v4 = v3;
  v6 = v5;
  -[_UIContextMenuPreviewPresentationController platterContentSize](self, "platterContentSize");
  v8 = v7;
  v10 = v9;
  v11 = v4;
  v12 = v6;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  return 0;
}

- (BOOL)_shouldOccludeDuringPresentation
{
  return 0;
}

- (BOOL)_shouldPreserveFirstResponder
{
  return 0;
}

- (BOOL)_shouldKeepCurrentFirstResponder
{
  return 0;
}

- (BOOL)_shouldRestoreFirstResponder
{
  return 0;
}

- (BOOL)_wantsAutomaticFirstResponderWhenPresentingRemoteViewController
{
  void *v3;
  int v4;
  objc_super v6;

  -[_UIContextMenuPreviewPresentationController menuStyle](self, "menuStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "keepsInputViewsVisible");

  if (!v4)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)_UIContextMenuPreviewPresentationController;
  return -[UIPresentationController _wantsAutomaticFirstResponderWhenPresentingRemoteViewController](&v6, sel__wantsAutomaticFirstResponderWhenPresentingRemoteViewController);
}

- (int64_t)presentationStyle
{
  return 20;
}

- (UIEdgeInsets)_baseContentInsetsWithLeftMargin:(double *)a3 rightMargin:(double *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  UIEdgeInsets result;

  v8.receiver = self;
  v8.super_class = (Class)_UIContextMenuPreviewPresentationController;
  -[UIPresentationController _baseContentInsetsWithLeftMargin:rightMargin:](&v8, sel__baseContentInsetsWithLeftMargin_rightMargin_, a3, a4);
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  CGFloat Width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  CATransform3D v13;
  CATransform3D v14;
  objc_super v15;
  CGRect v16;

  v15.receiver = self;
  v15.super_class = (Class)_UIContextMenuPreviewPresentationController;
  -[UIPresentationController presentationTransitionWillBegin](&v15, sel_presentationTransitionWillBegin);
  -[UIPresentationController presentedView](self, "presentedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);
  objc_msgSend(v4, "frame");
  Width = CGRectGetWidth(v16);
  CATransform3DMakeTranslation(&v14, -Width, 0.0, 0.0);
  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v14;
  objc_msgSend(v6, "setSublayerTransform:", &v13);

  objc_msgSend(v4, "setAlpha:", 0.0);
  objc_msgSend(v4, "addSubview:", v3);
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSize");
  -[_UIContextMenuPreviewPresentationController _updatePlatterContentSizeWithPreferredContentSize:](self, "_updatePlatterContentSizeWithPreferredContentSize:");

  -[_UIContextMenuPreviewPresentationController platterContentSize](self, "platterContentSize");
  v9 = v8;
  v11 = v10;
  -[UIPresentationController presentedView](self, "presentedView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, v9, v11);

  objc_msgSend(v4, "setNeedsLayout");
  objc_msgSend(v4, "layoutIfNeeded");

}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  objc_super v4;

  -[UIPresentationController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIContextMenuPreviewPresentationController;
  -[UIPresentationController dismissalTransitionWillBegin](&v4, sel_dismissalTransitionWillBegin);
}

- (id)preferredFocusEnvironments
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[_UIContextMenuPreviewPresentationController menuStyle](self, "menuStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasInteractivePreview");

  -[_UIContextMenuPreviewPresentationController menuPresentationDelegate](self, "menuPresentationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredFocusEnvironmentsForContextMenuPreviewPresentationController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIContextMenuPreviewPresentationController;
    -[UIPresentationController preferredFocusEnvironments](&v10, sel_preferredFocusEnvironments);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
      objc_msgSend(v7, "addObjectsFromArray:", v8);

  }
  return v7;
}

- (void)menuLayoutDidProducePreviewSize:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  CGAffineTransform v18;

  width = a3.width;
  -[_UIContextMenuPreviewPresentationController platterContentSize](self, "platterContentSize");
  v6 = v5;
  v8 = v7;
  -[_UIContextMenuPreviewPresentationController menuStyle](self, "menuStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "ignoresDefaultSizingRules");

  if (v10)
  {
    -[_UIContextMenuPreviewPresentationController platterContentSize](self, "platterContentSize");
    v12 = v11 / width;
    if (v12 < 1.0)
      v12 = 1.0;
    CGAffineTransformMakeScale(&v18, v12, v12);
    -[UIPresentationController containerView](self, "containerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToViewScale(v13);
    v6 = v14;
    -[UIPresentationController containerView](self, "containerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToViewScale(v15);
    v8 = v16;

  }
  -[UIPresentationController presentedView](self, "presentedView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", 0.0, 0.0, v6, v8);

}

- (void)menuDidPresentWithContentPlatterView:(id)a3
{
  objc_storeWeak((id *)&self->_viewForRemoteTextEffectsWindowMatchAnimation, a3);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuPreviewPresentationController;
  v4 = a3;
  -[UIPresentationController preferredContentSizeDidChangeForChildContentContainer:](&v9, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  v6 = v5;
  v8 = v7;

  -[_UIContextMenuPreviewPresentationController _updatePlatterContentSizeWithPreferredContentSize:](self, "_updatePlatterContentSizeWithPreferredContentSize:", v6, v8);
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UIContextMenuPreviewPresentationController;
  v4 = a3;
  -[UIPresentationController systemLayoutFittingSizeDidChangeForChildContentContainer:](&v14, sel_systemLayoutFittingSizeDidChangeForChildContentContainer_, v4);
  -[UIPresentationController presentedView](self, "presentedView", v14.receiver, v14.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSize");
  v7 = v6;
  v9 = v8;

  objc_msgSend(v5, "systemLayoutSizeFittingSize:", v7, v9);
  v11 = v10;
  v13 = v12;

  -[_UIContextMenuPreviewPresentationController _updatePlatterContentSizeWithPreferredContentSize:](self, "_updatePlatterContentSizeWithPreferredContentSize:", v11, v13);
}

- (void)_updatePlatterContentSizeWithPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  id v25;
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
  double v36;
  double v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  double v42;
  double v43;
  uint64_t v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  uint64_t v53;
  CGFloat v54;
  double v55;
  double v56;
  void *v57;
  char v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  id v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  height = a3.height;
  width = a3.width;
  -[UIPresentationController containerView](self, "containerView");
  v72 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v6, "userInterfaceIdiom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "previewPlatterMaximumSize");
  v9 = v8;
  objc_msgSend(v7, "previewPlatterMaximumSize");
  v11 = v10;
  -[_UIContextMenuPreviewPresentationController menuStyle](self, "menuStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "preferredLayout") == 1)
  {

LABEL_30:
    v15 = v72;
    goto LABEL_31;
  }
  -[_UIContextMenuPreviewPresentationController menuStyle](self, "menuStyle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "preferredLayout");

  v15 = v72;
  if (v14 == 3)
    goto LABEL_31;
  if (v72)
  {
    objc_msgSend(v72, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "verticalSizeClass");

    if (v17 == 1)
    {
      v18 = v9 / v11;
      objc_msgSend(v72, "bounds");
      v11 = CGRectGetHeight(v73);
      v9 = v18 * v11;
    }
    else
    {
      objc_msgSend(v72, "bounds");
      v20 = v19;
      v22 = v21;
      -[_UIContextMenuPreviewPresentationController menuStyle](self, "menuStyle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "preferredLayout");

      if (!v24)
      {
        v71 = v20;
        v25 = v72;
        objc_msgSend(v25, "safeAreaInsets");
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v33 = v32;
        objc_msgSend(v25, "traitCollection");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "verticalSizeClass");

        v36 = v33 + 0.0;
        if (v35 == 1)
          v36 = v33;
        v70 = v36;
        if (v35 == 1)
        {
          v37 = v27;
        }
        else
        {
          v31 = v31 + 20.0;
          v29 = v29 + 0.0;
          v37 = v27 + 20.0;
        }
        v38 = v25;
        objc_msgSend(v38, "traitCollection");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "userInterfaceIdiom");

        _UIContextMenuGetPlatformMetrics(v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIViewController _horizontalContentMarginForView:](UIViewController, "_horizontalContentMarginForView:", v38);
        v43 = v42;
        objc_msgSend(v41, "contentSpacingForContainer");
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = (void *)v44;
        if (v44)
          v43 = (*(double (**)(uint64_t, id))(v44 + 16))(v44, v38);

        v46 = fmax(v37, 20.0);
        v47 = fmax(v29, v43);

        objc_msgSend(v38, "bounds");
        v74.origin.x = v47 + v48;
        v74.origin.y = v46 + v49;
        v74.size.width = v50 - (v47 + fmax(v70, v43));
        v74.size.height = v51 - (fmax(v31, 20.0) + v46) - (v47 + 135.0);
        v20 = v71;
        v22 = CGRectGetHeight(v74) * (v71 / v74.size.width);
      }
      objc_msgSend(v72, "traitCollection");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "userInterfaceIdiom");

      if (!v53)
      {
        objc_msgSend(v72, "bounds");
        v54 = CGRectGetWidth(v75);
        v11 = v11 * (v54 / v9);
        v9 = v54;
      }
      if (v20 < v9)
        v9 = v20;
      if (v22 < v11)
        v11 = v22;
    }
  }
  if (width <= 0.0)
    v55 = v9;
  else
    v55 = width;
  if (height <= 0.0)
    v56 = v11;
  else
    v56 = height;
  -[_UIContextMenuPreviewPresentationController menuStyle](self, "menuStyle");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "ignoresDefaultSizingRules");

  if ((v58 & 1) != 0)
  {
    height = v56;
    goto LABEL_30;
  }
  v68 = fmin(v9 / v55, 1.0);
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    if (v56 * v68 >= v11)
      height = v11;
    else
      height = v56 * v68;
  }
  else
  {
    v69 = fmin(v11 / v56, 1.0);
    if (v68 >= v69)
      v68 = v69;
    height = v56 * v68;
  }
  v15 = v72;
LABEL_31:
  UIRoundToViewScale(v15);
  if (v59 >= 1.0)
    v60 = v59;
  else
    v60 = 1.0;
  objc_msgSend(v72, "_screen");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "scale");
  UIFloorToScale(height, v62);
  v64 = v63;

  if (v64 < 1.0)
    v64 = 1.0;
  -[_UIContextMenuPreviewPresentationController platterContentSize](self, "platterContentSize");
  if (v60 != v66 || v64 != v65)
  {
    -[_UIContextMenuPreviewPresentationController setPlatterContentSize:](self, "setPlatterContentSize:", v60, v64);
    -[_UIContextMenuPreviewPresentationController menuPresentationDelegate](self, "menuPresentationDelegate");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "contextMenuPreviewPresentationController:didChangePreviewContentSize:", self, v60, v64);

  }
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[6];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_UIContextMenuPreviewPresentationController;
  v4 = a3;
  -[UIPresentationController _traitCollectionForChildEnvironment:](&v15, sel__traitCollectionForChildEnvironment_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    -[_UIContextMenuPreviewPresentationController platterContentSize](self, "platterContentSize");
    v9 = _UIUserInterfaceSizeClassForWidth(v8);
    -[_UIContextMenuPreviewPresentationController platterContentSize](self, "platterContentSize");
    v11 = _UIUserInterfaceSizeClassForHeight(v10);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __83___UIContextMenuPreviewPresentationController__traitCollectionForChildEnvironment___block_invoke;
    v14[3] = &__block_descriptor_48_e86_v24__0_____UITraitCollection____8_____UITraitCollection_UIMutableTraitsInternal_____16l;
    v14[4] = v9;
    v14[5] = v11;
    -[UITraitCollection _traitCollectionByModifyingTraitsCopyOnWrite:](v5, (uint64_t)v14);
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v12;
  }
  return v5;
}

- (id)_viewForRemoteTextEffectsWindowMatchAnimation
{
  return objc_loadWeakRetained((id *)&self->_viewForRemoteTextEffectsWindowMatchAnimation);
}

- (_UIContextMenuPreviewPresentationControllerDelegate)menuPresentationDelegate
{
  return (_UIContextMenuPreviewPresentationControllerDelegate *)objc_loadWeakRetained((id *)&self->_menuPresentationDelegate);
}

- (void)setMenuPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_menuPresentationDelegate, a3);
}

- (_UIContextMenuStyle)menuStyle
{
  return self->_menuStyle;
}

- (void)setMenuStyle:(id)a3
{
  objc_storeStrong((id *)&self->_menuStyle, a3);
}

- (CGSize)platterContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_platterContentSize.width;
  height = self->_platterContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPlatterContentSize:(CGSize)a3
{
  self->_platterContentSize = a3;
}

- (BOOL)platterContentSizeDidChange
{
  return self->_platterContentSizeDidChange;
}

- (void)setPlatterContentSizeDidChange:(BOOL)a3
{
  self->_platterContentSizeDidChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuStyle, 0);
  objc_destroyWeak((id *)&self->_menuPresentationDelegate);
  objc_destroyWeak((id *)&self->_viewForRemoteTextEffectsWindowMatchAnimation);
}

@end
