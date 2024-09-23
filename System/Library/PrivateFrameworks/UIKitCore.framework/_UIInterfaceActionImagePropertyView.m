@implementation _UIInterfaceActionImagePropertyView

- (_UIInterfaceActionImagePropertyView)initWithAction:(id)a3 imageProperty:(id)a4
{
  id v7;
  id v8;
  _UIInterfaceActionImagePropertyView *v9;
  _UIInterfaceActionImagePropertyView *v10;
  void *v11;
  uint64_t v12;
  NSLayoutConstraint *imageWidthConstraint;
  void *v14;
  uint64_t v15;
  NSLayoutConstraint *imageHeightConstraint;
  double v17;
  double v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_UIInterfaceActionImagePropertyView;
  v9 = -[UIImageView initWithImage:](&v20, sel_initWithImage_, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_action, a3);
    objc_storeStrong((id *)&v10->_imageProperty, a4);
    -[UIImageView _setDefaultRenderingMode:](v10, "_setDefaultRenderingMode:", 2);
    -[UIView widthAnchor](v10, "widthAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToConstant:", 0.0);
    v12 = objc_claimAutoreleasedReturnValue();
    imageWidthConstraint = v10->_imageWidthConstraint;
    v10->_imageWidthConstraint = (NSLayoutConstraint *)v12;

    -[NSLayoutConstraint setIdentifier:](v10->_imageWidthConstraint, "setIdentifier:", CFSTR("imageWidth"));
    -[UIView heightAnchor](v10, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToConstant:", 0.0);
    v15 = objc_claimAutoreleasedReturnValue();
    imageHeightConstraint = v10->_imageHeightConstraint;
    v10->_imageHeightConstraint = (NSLayoutConstraint *)v15;

    -[NSLayoutConstraint setIdentifier:](v10->_imageHeightConstraint, "setIdentifier:", CFSTR("imageHeight"));
    LODWORD(v17) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](v10, "setContentHuggingPriority:forAxis:", 1, v17);
    LODWORD(v18) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](v10, "setContentHuggingPriority:forAxis:", 0, v18);
    -[_UIInterfaceActionImagePropertyView _reloadImageContent](v10, "_reloadImageContent");
    -[UIInterfaceAction _addActionDisplayPropertyObserver:](v10->_action, "_addActionDisplayPropertyObserver:", v10);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[UIInterfaceAction _removeActionDisplayPropertyObserver:](self->_action, "_removeActionDisplayPropertyObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionImagePropertyView;
  -[UIImageView dealloc](&v3, sel_dealloc);
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
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
  double v20;
  NSLayoutConstraint *imageHeightConstraint;
  double v22;
  double v23;
  double v24;
  objc_super v25;

  v4 = a3;
  -[UIImageView image](self, "image");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->_imageWidthConstraint, self->_imageHeightConstraint, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIInterfaceActionImagePropertyView _sizeToOccupy](self, "_sizeToOccupy");
    if (v4)
    {
      objc_msgSend(v4, "size");
      v10 = v9;
      v12 = v11;
      objc_msgSend(v4, "alignmentRectInsets");
      v14 = v13;
      objc_msgSend(v4, "alignmentRectInsets");
      v16 = v10 - (v14 + v15);
      objc_msgSend(v4, "alignmentRectInsets");
      v18 = v17;
      objc_msgSend(v4, "alignmentRectInsets");
      v20 = v12 - (v18 + v19);
      -[NSLayoutConstraint setConstant:](self->_imageWidthConstraint, "setConstant:", v16);
      imageHeightConstraint = self->_imageHeightConstraint;
      v22 = v20;
    }
    else
    {
      v23 = v7;
      v24 = v8;
      if (!-[_UIInterfaceActionImagePropertyView isUsedToOccupySpaceIfNoImage](self, "isUsedToOccupySpaceIfNoImage"))
      {
        objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", v6);
        goto LABEL_8;
      }
      -[NSLayoutConstraint setConstant:](self->_imageWidthConstraint, "setConstant:", v23);
      imageHeightConstraint = self->_imageHeightConstraint;
      v22 = v24;
    }
    -[NSLayoutConstraint setConstant:](imageHeightConstraint, "setConstant:", v22);
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v6);
LABEL_8:
    v25.receiver = self;
    v25.super_class = (Class)_UIInterfaceActionImagePropertyView;
    -[UIImageView setImage:](&v25, sel_setImage_, v4);

  }
}

- (BOOL)isUsedToOccupySpaceIfNoImage
{
  double v2;
  double v3;

  -[_UIInterfaceActionImagePropertyView _sizeToOccupy](self, "_sizeToOccupy");
  return v3 != *(double *)(MEMORY[0x1E0C9D820] + 8) || v2 != *MEMORY[0x1E0C9D820];
}

- (void)tintColorDidChange
{
  objc_super v3;

  -[_UIInterfaceActionImagePropertyView _reloadImageContent](self, "_reloadImageContent");
  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionImagePropertyView;
  -[UIImageView tintColorDidChange](&v3, sel_tintColorDidChange);
}

- (void)interfaceAction:(id)a3 reloadDisplayedContentActionProperties:(id)a4
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;

  v8 = a4;
  if (objc_msgSend(v8, "containsObject:", self->_imageProperty))
  {
    -[_UIInterfaceActionImagePropertyView _reloadImageContent](self, "_reloadImageContent");
  }
  else
  {
    -[_UIInterfaceActionImagePropertyView _visualStyle](self, "_visualStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionPropertiesAffectingImageViewStyling");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[UIInterfaceAction changedProperties:containsAny:](UIInterfaceAction, "changedProperties:containsAny:", v8, v6);

    if (v7)
      -[_UIInterfaceActionImagePropertyView _applyVisualStyleToImageView](self, "_applyVisualStyleToImageView");

  }
}

- (void)_applyVisualStyleToImageView
{
  void *v3;
  NSString *imageProperty;
  void *v5;
  id v6;

  -[UIImageView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIInterfaceActionImagePropertyView _visualStyle](self, "_visualStyle");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    imageProperty = self->_imageProperty;
    -[_UIInterfaceActionImagePropertyView _interfaceActionViewState](self, "_interfaceActionViewState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configureAttributesForImageView:imageProperty:actionViewState:", self, imageProperty, v5);

  }
}

- (id)_interfaceActionViewState
{
  void *v3;
  void *v4;

  -[_UIInterfaceActionImagePropertyView action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIInterfaceActionViewState viewStateForActionRepresentationViewDescendantView:action:](UIInterfaceActionViewState, "viewStateForActionRepresentationViewDescendantView:action:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGSize)_sizeToOccupy
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[_UIInterfaceActionImagePropertyView action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_layoutSizeForImageProperty:", self->_imageProperty);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)_reloadImageContent
{
  void *v3;
  double v4;
  id v5;

  -[_UIInterfaceActionImagePropertyView action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", self->_imageProperty);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIInterfaceActionImagePropertyView setImage:](self, "setImage:", v5);
  v4 = 1.0;
  if (!v5)
    v4 = 0.0;
  -[UIView setAlpha:](self, "setAlpha:", v4);
  -[_UIInterfaceActionImagePropertyView _applyVisualStyleToImageView](self, "_applyVisualStyleToImageView");

}

- (id)_visualStyle
{
  return -[UIInterfaceAction _visualStyle](self->_action, "_visualStyle");
}

- (UIInterfaceAction)action
{
  return self->_action;
}

- (NSString)imageProperty
{
  return self->_imageProperty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProperty, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
}

@end
