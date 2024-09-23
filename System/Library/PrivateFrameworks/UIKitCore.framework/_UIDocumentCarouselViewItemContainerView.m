@implementation _UIDocumentCarouselViewItemContainerView

- (void)setContentConfiguration:(uint64_t)a1
{
  id v4;
  id v5;
  char v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  objc_class *v19;
  id v20;
  void *v21;
  objc_class *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  objc_msgSend(*(id *)(a1 + 416), "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = a2;
  v27 = v5;
  if (v4 == v5)
  {

LABEL_23:
    return;
  }
  if (!v5 || !v4)
  {

LABEL_8:
    *(_OWORD *)(a1 + 432) = *MEMORY[0x1E0C9D820];
    v7 = *(void **)(a1 + 416);
    v8 = v27;
    v9 = v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "supportsConfiguration:", v8);

      if (!v10)
      {
LABEL_10:
        objc_msgSend(v8, "makeContentView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v11;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v27, "_wrappedContentView");
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = v27;
        }
        v15 = v12;
        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "configuration");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", sel_setContentConfiguration_, a1, CFSTR("_UIDocumentCarouselView.m"), 805, CFSTR("Configuration returned a nil content view: %@"), v25);

        }
        if ((objc_msgSend(v15, "translatesAutoresizingMaskIntoConstraints") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel_setContentConfiguration_, a1, CFSTR("_UIDocumentCarouselView.m"), 806, CFSTR("The content view returned from the content configuration must have translatesAutoresizingMaskIntoConstraints enabled: %@"), v15);

        }
        v16 = *(id *)(a1 + 416);
        v17 = *(id *)(a1 + 424);
        objc_storeStrong((id *)(a1 + 416), v11);
        objc_storeStrong((id *)(a1 + 424), v15);
        objc_msgSend(v17, "removeFromSuperview");
        if (v15)
        {
          objc_msgSend((id)a1, "bounds");
          objc_msgSend(v15, "setFrame:");
          objc_msgSend(v15, "setAutoresizingMask:", 18);
          objc_msgSend((id)a1, "addSubview:", v15);
        }

        goto LABEL_23;
      }
    }
    else
    {
      objc_msgSend(v9, "configuration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v13;
      if (v14)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v14, "_wrappedConfigurationIdentifier");
        }
        else
        {
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }

      v20 = v8;
      if (v20)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v20, "_wrappedConfigurationIdentifier");
        }
        else
        {
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }

      v23 = objc_msgSend(v18, "isEqualToString:", v21);
      if ((v23 & 1) == 0)
        goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 416), "setConfiguration:", v8);
    return;
  }
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
    goto LABEL_8;
}

- (void)_configureView
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;

  -[UIView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShadowOffset:", 0.0, 3.0);

  -[UIView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShadowRadius:", 20.0);

  +[UIColor blackColor](UIColor, "blackColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");
  -[UIView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShadowColor:", v6);

  -[UIView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShouldRasterize:", 1);

  -[UIView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayScale");
  v11 = v10;
  -[UIView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRasterizationScale:", v11);

  -[UIView setPreservesSuperviewLayoutMargins:](self, "setPreservesSuperviewLayoutMargins:", 0);
  -[UIView setInsetsLayoutMarginsFromSafeArea:](self, "setInsetsLayoutMarginsFromSafeArea:", 0);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_contentView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, 2777777.0);
  if (v8 >= height)
    v9 = v8;
  else
    v9 = height;
  if (v8 < 2777777.0)
    height = v9;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v11 = UISizeRoundToScale(width, height, v10);
  self->_cachedContentSize.width = v11;
  self->_cachedContentSize.height = v12;
  result.height = v12;
  result.width = v11;
  return result;
}

- (UIEdgeInsets)_concreteDefaultLayoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 8.0;
  v3 = 8.0;
  v4 = 8.0;
  v5 = 8.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_viewForConfiguration, 0);
}

@end
