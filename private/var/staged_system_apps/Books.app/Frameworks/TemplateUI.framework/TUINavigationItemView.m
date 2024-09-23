@implementation TUINavigationItemView

+ (id)tuiReuseIdentifier
{
  return CFSTR("TUIReuseIdentifierNavigationBarItemView");
}

- (void)setFactory:(id)a3
{
  TUIViewFactory **p_factory;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_factory = &self->_factory;
  WeakRetained = objc_loadWeakRetained((id *)p_factory);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_factory, obj);
    v6 = obj;
  }

}

- (void)configureWithModel:(id)a3
{
  TUIRenderModelNavigationItem *v5;
  void *v6;
  void *v7;
  TUIRenderModelNavigationItem *v8;

  v5 = (TUIRenderModelNavigationItem *)a3;
  if (self->_renderModel != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_renderModel, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem subviewsModel](self->_renderModel, "subviewsModel"));
    if (v6)
      -[TUINavigationItemView addSubviewButton](self, "addSubviewButton");
    else
      -[TUINavigationItemView addDefaultButton](self, "addDefaultButton");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem axAttributes](v8, "axAttributes"));
    if (v7)
      -[TUINavigationItemView _configureWithAXAttributes:](self, "_configureWithAXAttributes:", v7);

    v5 = v8;
  }

}

- (void)addDefaultButton
{
  int64_t v3;
  void *v4;
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
  double y;
  double v17;
  double v18;
  id v19;

  if (-[TUIRenderModelNavigationItem buttonType](self->_renderModel, "buttonType"))
    v3 = +[TUIControlView uiButtonTypeFromTUIButtonType:](TUIControlView, "uiButtonTypeFromTUIButtonType:", -[TUIRenderModelNavigationItem buttonType](self->_renderModel, "buttonType"));
  else
    v3 = 1;
  v19 = (id)objc_claimAutoreleasedReturnValue(+[TUIUIKitButton buttonWithType:](TUIUIKitButton, "buttonWithType:", v3));
  objc_msgSend(v19, "setRole:", +[TUIControlView uiButtonRoleFromTUIButtonRole:](TUIControlView, "uiButtonRoleFromTUIButtonRole:", -[TUIRenderModelNavigationItem buttonRole](self->_renderModel, "buttonRole")));
  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, "_buttonPressed:", 64);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem title](self->_renderModel, "title"));
  objc_msgSend(v19, "setTitle:forState:", v4, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem attributedTitle](self->_renderModel, "attributedTitle"));
  objc_msgSend(v19, "setAttributedTitle:forState:", v5, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem image](self->_renderModel, "image"));
  objc_msgSend(v19, "setImage:forState:", v6, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem menu](self->_renderModel, "menu"));
  objc_msgSend(v19, "setTui_menu:", v7);

  objc_msgSend(v19, "setEnabled:", -[TUIRenderModelNavigationItem isEnabled](self->_renderModel, "isEnabled"));
  objc_msgSend(v19, "setClipsToBounds:", -[TUINavigationItemView clipsToBounds](self, "clipsToBounds"));
  objc_msgSend(v19, "sizeToFit");
  objc_msgSend(v19, "frame");
  objc_msgSend(v19, "alignmentRectForFrame:");
  v9 = v8;
  v11 = v10;
  -[TUIRenderModelNavigationItem width](self->_renderModel, "width");
  if (v12 > 0.0)
  {
    -[TUIRenderModelNavigationItem width](self->_renderModel, "width");
    v9 = v13;
  }
  -[TUIRenderModelNavigationItem minWidth](self->_renderModel, "minWidth");
  if (v14 > 0.0)
  {
    -[TUIRenderModelNavigationItem minWidth](self->_renderModel, "minWidth");
    v9 = fmax(v9, v15);
  }
  y = CGPointZero.y;
  -[TUIRenderModelNavigationItem maxWidth](self->_renderModel, "maxWidth");
  if (v17 > 0.0)
  {
    -[TUIRenderModelNavigationItem maxWidth](self->_renderModel, "maxWidth");
    v9 = fmin(v9, v18);
  }
  -[TUINavigationItemView setFrame:](self, "setFrame:", CGPointZero.x, y, v9, v11);
  objc_msgSend(v19, "frameForAlignmentRect:", CGPointZero.x, y, v9, v11);
  objc_msgSend(v19, "setFrame:");
  -[TUINavigationItemView addSubview:](self, "addSubview:", v19);
  -[TUINavigationItemView verifyHierarchyForSubview:](self, "verifyHierarchyForSubview:", v19);

}

- (void)addSubviewButton
{
  void *v3;
  double v4;
  double v5;
  id WeakRetained;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem subviewsModel](self->_renderModel, "subviewsModel"));
  objc_msgSend(v3, "size");
  -[TUINavigationItemView setFrame:](self, "setFrame:", 0.0, 0.0, v4, v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_factory);
  objc_msgSend(WeakRetained, "viewFactoryPrepareToReuseHost:", self);

  if (v3)
  {
    v7 = objc_loadWeakRetained((id *)&self->_factory);

    if (v7)
    {
      objc_msgSend(v3, "prepare");
      v19 = 0;
      v8 = objc_loadWeakRetained((id *)&self->_factory);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configureSubviewsWithFactory:outsets:host:overrides:usedOverrides:UUID:uid:", v8, self, 0, &v19, 0, 0, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right));

      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v16;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v16 != v13)
              objc_enumerationMutation(v10);
            -[TUINavigationItemView verifyHierarchyForSubview:](self, "verifyHierarchyForSubview:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), (_QWORD)v15);
            v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        }
        while (v12);
      }

    }
  }

}

- (void)_buttonPressed:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[TUINavigationItemView renderModel](self, "renderModel", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionHandler"));
  objc_msgSend(v3, "invoke:arguments:", CFSTR("press"), 0);

}

- (void)_configureWithAXAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unsigned int v13;
  UIAccessibilityTraits v14;
  UIAccessibilityTraits v15;
  UIAccessibilityTraits v16;
  unsigned int v17;
  UIAccessibilityTraits v18;
  UIAccessibilityTraits v19;
  unsigned int v20;
  UIAccessibilityTraits v21;
  id v22;

  v22 = a3;
  -[TUINavigationItemView setIsAccessibilityElement:](self, "setIsAccessibilityElement:", objc_msgSend(v22, "isAXElement"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "axIdentifier"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "axIdentifier"));
    -[TUINavigationItemView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "axLabel"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "axLabel"));
    -[TUINavigationItemView setAccessibilityLabel:](self, "setAccessibilityLabel:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "axValue"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "axValue"));
    -[TUINavigationItemView setAccessibilityValue:](self, "setAccessibilityValue:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "axHint"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "axHint"));
    -[TUINavigationItemView setAccessibilityHint:](self, "setAccessibilityHint:", v11);

  }
  v12 = (unint64_t)-[TUINavigationItemView accessibilityTraits](self, "accessibilityTraits");
  if (objc_msgSend(v22, "axTouchContainer"))
    -[TUINavigationItemView setAccessibilityContainerType:](self, "setAccessibilityContainerType:", 4);
  v13 = objc_msgSend(v22, "axButton");
  v14 = UIAccessibilityTraitButton;
  if (!v13)
    v14 = 0;
  v15 = v14 | v12;
  if (objc_msgSend(v22, "axImage"))
    v16 = UIAccessibilityTraitImage;
  else
    v16 = 0;
  v17 = objc_msgSend(v22, "axHeading");
  v18 = UIAccessibilityTraitHeader;
  if (!v17)
    v18 = 0;
  v19 = v15 | v16 | v18;
  v20 = objc_msgSend(v22, "axToggle");
  v21 = UIAccessibilityTraitToggleButton;
  if (!v20)
    v21 = 0;
  -[TUINavigationItemView setAccessibilityTraits:](self, "setAccessibilityTraits:", v19 | v21);

}

- (TUIViewFactory)factory
{
  return (TUIViewFactory *)objc_loadWeakRetained((id *)&self->_factory);
}

- (TUIRenderModelNavigationItem)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
  objc_storeStrong((id *)&self->_renderModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_destroyWeak((id *)&self->_factory);
}

@end
