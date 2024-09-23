@implementation MapViewModeGridButtonViewModel

- (MapViewModeGridButtonViewModel)initWithTitle:(id)a3 image:(id)a4 wideImage:(id)a5 enabled:(BOOL)a6 selected:(BOOL)a7 overflowMenu:(id)a8 delegate:(id)a9 axIdentifier:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  MapViewModeGridButtonViewModel *v19;
  MapViewModeGridButtonViewModel *v20;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v15 = a5;
  v16 = a8;
  v17 = a9;
  v18 = a10;
  v26.receiver = self;
  v26.super_class = (Class)MapViewModeGridButtonViewModel;
  v19 = -[MapViewModeGridButtonViewModel init](&v26, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_title, a3);
    objc_storeStrong((id *)&v20->_image, a4);
    objc_storeStrong((id *)&v20->_wideImage, a5);
    v20->_enabled = a6;
    v20->_selected = a7;
    objc_storeStrong((id *)&v20->_overflowMenu, a8);
    objc_storeWeak((id *)&v20->_delegate, v17);
    objc_storeStrong((id *)&v20->_axIdentifierForView, a10);
  }

  return v20;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_title, "hash");
}

- (BOOL)isEqual:(id)a3
{
  MapViewModeGridButtonViewModel *v4;
  MapViewModeGridButtonViewModel *v5;
  uint64_t v6;
  MapViewModeGridButtonViewModel *v7;
  NSString *v8;
  NSString *v9;
  UIImage *v10;
  UIImage *v11;
  UIImage *v12;
  UIImage *v13;
  UIMenu *v14;
  unsigned __int8 v15;
  id v17;
  id WeakRetained;

  v4 = (MapViewModeGridButtonViewModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v15 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonViewModel title](v7, "title"));
    v9 = v8;
    if (v8 == self->_title || -[NSString isEqual:](v8, "isEqual:"))
    {
      v10 = (UIImage *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonViewModel image](v7, "image"));
      v11 = v10;
      if (v10 == self->_image || -[UIImage isEqual:](v10, "isEqual:"))
      {
        v12 = (UIImage *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonViewModel wideImage](v7, "wideImage"));
        v13 = v12;
        if ((v12 == self->_wideImage || -[UIImage isEqual:](v12, "isEqual:"))
          && self->_enabled == -[MapViewModeGridButtonViewModel enabled](v7, "enabled")
          && self->_selected == -[MapViewModeGridButtonViewModel selected](v7, "selected"))
        {
          v14 = (UIMenu *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonViewModel overflowMenu](v7, "overflowMenu"));
          if (v14 == self->_overflowMenu)
          {
            v17 = (id)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonViewModel delegate](v7, "delegate"));
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            if (v17 == WeakRetained)
              v15 = 1;
            else
              v15 = objc_msgSend(v17, "isEqual:", WeakRetained);

          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (UIImage)wideImage
{
  return self->_wideImage;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)selected
{
  return self->_selected;
}

- (UIMenu)overflowMenu
{
  return self->_overflowMenu;
}

- (MapViewModeGridButtonViewDelegate)delegate
{
  return (MapViewModeGridButtonViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)axIdentifierForView
{
  return self->_axIdentifierForView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axIdentifierForView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overflowMenu, 0);
  objc_storeStrong((id *)&self->_wideImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
