@implementation MCDAlertButtonView

- (MCDAlertButtonView)initWithTitle:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  double y;
  double width;
  double height;
  MCDAlertButtonView *v11;
  UIImageView *v12;
  UIImageView *imageView;
  void *v14;
  UILabel *v15;
  UILabel *label;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MCDAlertButtonView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v11 = -[MCDAlertButtonView initWithFrame:](&v18, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v11)
  {
    v12 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v7);
    imageView = v11->_imageView;
    v11->_imageView = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlertButtonView imageView](v11, "imageView"));
    objc_msgSend(v14, "setContentMode:", 1);

    objc_storeStrong((id *)&v11->_image, a4);
    -[MCDAlertButtonView addSubview:](v11, "addSubview:", v11->_imageView);
    v15 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    label = v11->_label;
    v11->_label = v15;

    -[UILabel setText:](v11->_label, "setText:", v6);
    -[UILabel sizeToFit](v11->_label, "sizeToFit");
    -[MCDAlertButtonView addSubview:](v11, "addSubview:", v11->_label);
  }

  return v11;
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
  void *v11;
  double v12;
  double v13;
  double Width;
  CGFloat v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  objc_super v47;
  CGRect v48;
  CGRect v49;

  v47.receiver = self;
  v47.super_class = (Class)MCDAlertButtonView;
  -[MCDAlertButtonView layoutSubviews](&v47, "layoutSubviews");
  -[MCDAlertButtonView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlertButtonView traitCollection](self, "traitCollection"));
  objc_msgSend(v11, "displayScale");
  v13 = v12;

  v48.origin.x = v4;
  v48.origin.y = v6;
  v48.size.width = v8;
  v48.size.height = v10;
  Width = CGRectGetWidth(v48);
  v49.origin.x = 0.0;
  v49.origin.y = 0.0;
  v49.size.width = 24.0;
  v49.size.height = 24.0;
  v15 = CGRectGetWidth(v49);
  v16 = UIRectCenteredYInRectScale(Width - v15 + -20.0, 0.0, 24.0, 24.0, v4, v6, v8, v10, v13);
  v21 = MPURectByApplyingUserInterfaceLayoutDirectionInRect(v16, v17, v18, v19, v20, v4, v6, v8, v10);
  v45 = v22;
  v46 = v21;
  v24 = v23;
  v44 = v25;
  v26 = v8 - (v23 + 20.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlertButtonView label](self, "label"));
  objc_msgSend(v27, "sizeThatFits:", v26, v10);
  v29 = v28;

  v30 = UIRectCenteredYInRectScale(20.0, 0.0, v26 + -20.0, v29, v4, v6, v8, v10, v13);
  v35 = MPURectByApplyingUserInterfaceLayoutDirectionInRect(v30, v31, v32, v33, v34, v4, v6, v8, v10);
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlertButtonView imageView](self, "imageView"));
  objc_msgSend(v42, "setFrame:", v46, v45, v24, v44);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlertButtonView label](self, "label"));
  objc_msgSend(v43, "setFrame:", v35, v37, v39, v41);

  -[MCDAlertButtonView setHighlighted:](self, "setHighlighted:", 0);
}

- (void)setHighlighted:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
    -[MCDAlertButtonView setBackgroundColor:](self, "setBackgroundColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlertButtonView label](self, "label"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
    objc_msgSend(v5, "setTextColor:", v6);

    v14 = (id)objc_claimAutoreleasedReturnValue(-[MCDAlertButtonView image](self, "image"));
    v7 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MCDAlertButtonView setBackgroundColor:](self, "setBackgroundColor:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlertButtonView label](self, "label"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
    objc_msgSend(v9, "setTextColor:", v10);

    v14 = (id)objc_claimAutoreleasedReturnValue(-[MCDAlertButtonView image](self, "image"));
    v7 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  }
  v11 = (void *)v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageWithTintColor:renderingMode:", v7, 1));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlertButtonView imageView](self, "imageView"));
  objc_msgSend(v13, "setImage:", v12);

}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  MCDAlertButtonView *v5;

  v5 = (MCDAlertButtonView *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "nextFocusedItem"));
  -[MCDAlertButtonView setHighlighted:](self, "setHighlighted:", v5 == self);

}

- (void)_setHighlightsForHitView:(id)a3
{
  if (a3 == self)
    objc_msgSend(a3, "setHighlighted:", 1);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MCDAlertButtonView;
  -[MCDAlertButtonView touchesBegan:withEvent:](&v20, "touchesBegan:withEvent:", v6, v7);
  v8 = v6;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v13), "type"))
        {

          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "anyObject"));
          objc_msgSend(v14, "locationInView:", self);
          v16 = v15;
          v18 = v17;

          v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlertButtonView hitTest:withEvent:](self, "hitTest:withEvent:", v7, v16, v18));
          -[MCDAlertButtonView _setHighlightsForHitView:](self, "_setHighlightsForHitView:", v19);

          goto LABEL_11;
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
        continue;
      break;
    }
  }

LABEL_11:
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MCDAlertButtonView;
  -[MCDAlertButtonView touchesMoved:withEvent:](&v20, "touchesMoved:withEvent:", v6, v7);
  v8 = v6;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v13), "type"))
        {

          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "anyObject"));
          objc_msgSend(v14, "locationInView:", self);
          v16 = v15;
          v18 = v17;

          v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlertButtonView hitTest:withEvent:](self, "hitTest:withEvent:", v7, v16, v18));
          -[MCDAlertButtonView _setHighlightsForHitView:](self, "_setHighlightsForHitView:", v19);

          goto LABEL_11;
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
        continue;
      break;
    }
  }

LABEL_11:
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCDAlertButtonView;
  -[MCDAlertButtonView touchesCancelled:withEvent:](&v13, "touchesCancelled:withEvent:", v6, a4);
  v7 = v6;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12), "type"))
        {

          -[MCDAlertButtonView setHighlighted:](self, "setHighlighted:", 0);
          goto LABEL_11;
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }

LABEL_11:
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCDAlertButtonView;
  -[MCDAlertButtonView touchesEnded:withEvent:](&v13, "touchesEnded:withEvent:", v6, a4);
  v7 = v6;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12), "type"))
        {

          -[MCDAlertButtonView setHighlighted:](self, "setHighlighted:", 0);
          goto LABEL_11;
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }

LABEL_11:
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCDAlertButtonView label](self, "label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return v3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
