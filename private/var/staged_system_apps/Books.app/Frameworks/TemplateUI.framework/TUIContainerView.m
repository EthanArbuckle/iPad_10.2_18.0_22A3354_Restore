@implementation TUIContainerView

+ (id)renderModelWithSubviewsModel:(id)a3 style:(id)a4 identifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  TUIRenderModelView *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[TUIRenderModelView initWithReuseIdentifier:identifier:submodel:style:]([TUIRenderModelView alloc], "initWithReuseIdentifier:identifier:submodel:style:", CFSTR("TUIReuseIdentifierContainerView"), v7, v9, v8);

  return v10;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TUIContainerView;
  v4 = a3;
  -[TUIReusableBaseView applyLayoutAttributes:](&v16, "applyLayoutAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderModel", v16.receiver, v16.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "submodel"));
  objc_msgSend(v4, "outsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[TUIContainerView configureWithModel:outsets:](self, "configureWithModel:outsets:", v6, v8, v10, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "style"));
  -[TUIContainerView applyStyle:](self, "applyStyle:", v15);

}

- (void)applyStyle:(id)a3
{
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  _TUIBackdropView *backdropView;
  _TUIBackdropView *v12;
  _TUIBackdropView *v13;
  _TUIBackdropView *v14;
  _TUIBackdropView *v15;
  void *v16;
  float v17;
  float v18;
  id v19;
  UIView *v20;
  UIView *shadowView;
  UIView *v22;
  UIView *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  double v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  id v53;

  v53 = a3;
  -[TUIRenderStyling removeStylingFromView:](self->_currentStyle, "removeStylingFromView:", self->_contentView);
  objc_msgSend(v53, "applyStylingToView:", self->_contentView);
  objc_storeStrong((id *)&self->_currentStyle, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_contentView, "layer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "compositingFilter"));

  v7 = TUILayerCompositingFilterNeedsBackdropLayer(v6);
  v8 = v7;
  if (v6)
    v9 = v7;
  else
    v9 = 1;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIContainerView layer](self, "layer"));
  objc_msgSend(v10, "setAllowsGroupBlending:", v9);

  backdropView = self->_backdropView;
  if (v8)
  {
    if (!backdropView)
    {
      v12 = [_TUIBackdropView alloc];
      -[TUIContainerView bounds](self, "bounds");
      v13 = -[_TUIBackdropView initWithFrame:](v12, "initWithFrame:");
      v14 = self->_backdropView;
      self->_backdropView = v13;

      -[_TUIBackdropView setUserInteractionEnabled:](self->_backdropView, "setUserInteractionEnabled:", 0);
      -[_TUIBackdropView setAutoresizingMask:](self->_backdropView, "setAutoresizingMask:", 18);
      -[TUIContainerView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_backdropView, self->_contentView);
    }
  }
  else if (backdropView)
  {
    -[_TUIBackdropView removeFromSuperview](backdropView, "removeFromSuperview");
    v15 = self->_backdropView;
    self->_backdropView = 0;

  }
  if (v6
    && (v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_contentView, "layer")),
        objc_msgSend(v16, "shadowOpacity"),
        v18 = v17,
        v16,
        v18 > 0.0))
  {
    if (!self->_shadowView)
    {
      v19 = objc_alloc((Class)UIView);
      -[TUIContainerView bounds](self, "bounds");
      v20 = (UIView *)objc_msgSend(v19, "initWithFrame:");
      shadowView = self->_shadowView;
      self->_shadowView = v20;

      -[UIView setUserInteractionEnabled:](self->_shadowView, "setUserInteractionEnabled:", 0);
      -[UIView setAutoresizingMask:](self->_shadowView, "setAutoresizingMask:", 18);
      -[TUIContainerView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_shadowView, self->_contentView);
    }
  }
  else
  {
    v22 = self->_shadowView;
    if (v22)
    {
      -[UIView removeFromSuperview](v22, "removeFromSuperview");
      v23 = self->_shadowView;
      self->_shadowView = 0;

    }
  }
  if (self->_shadowView)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_contentView, "layer"));
    v25 = objc_msgSend(v24, "shadowColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_shadowView, "layer"));
    objc_msgSend(v26, "setShadowColor:", v25);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_contentView, "layer"));
    objc_msgSend(v27, "shadowOffset");
    v29 = v28;
    v31 = v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_shadowView, "layer"));
    objc_msgSend(v32, "setShadowOffset:", v29, v31);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_contentView, "layer"));
    objc_msgSend(v33, "shadowRadius");
    v35 = v34;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_shadowView, "layer"));
    objc_msgSend(v36, "setShadowRadius:", v35);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_contentView, "layer"));
    objc_msgSend(v37, "shadowOpacity");
    LODWORD(v35) = v38;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_shadowView, "layer"));
    LODWORD(v40) = LODWORD(v35);
    objc_msgSend(v39, "setShadowOpacity:", v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_contentView, "layer"));
    v42 = objc_msgSend(v41, "shadowPath");
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_shadowView, "layer"));
    objc_msgSend(v43, "setShadowPath:", v42);

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_shadowView, "layer"));
    objc_msgSend(v44, "setPunchoutShadow:", 1);

    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
    v46 = objc_msgSend(v45, "CGColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_contentView, "layer"));
    objc_msgSend(v47, "setShadowColor:", v46);

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_contentView, "layer"));
    objc_msgSend(v48, "setShadowOffset:", 0.0, -3.0);

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_contentView, "layer"));
    objc_msgSend(v49, "setShadowRadius:", 3.0);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_contentView, "layer"));
    LODWORD(v51) = 0;
    objc_msgSend(v50, "setShadowOpacity:", v51);

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_contentView, "layer"));
    objc_msgSend(v52, "setShadowPath:", 0);

  }
}

- (void)setFactory:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_factory);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_factory, obj);
    -[TUIContainerView _updateSubviews](self, "_updateSubviews");
    v5 = obj;
  }

}

- (TUIContainerView)initWithFrame:(CGRect)a3
{
  TUIContainerView *v3;
  TUIContainerView *v4;
  _TUIContainerContentView *v5;
  _TUIContainerContentView *v6;
  UIView *contentView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUIContainerView;
  v3 = -[TUIContainerView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TUIContainerView setClipsToBounds:](v3, "setClipsToBounds:", 0);
    v5 = [_TUIContainerContentView alloc];
    -[TUIContainerView bounds](v4, "bounds");
    v6 = -[_TUIContainerContentView initWithFrame:](v5, "initWithFrame:");
    contentView = v4->_contentView;
    v4->_contentView = &v6->super;

    -[UIView setAutoresizingMask:](v4->_contentView, "setAutoresizingMask:", 18);
    -[TUIContainerView addSubview:](v4, "addSubview:", v4->_contentView);
  }
  return v4;
}

- (void)_resetStyling
{
  TUIRenderStyling *currentStyle;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _TUIBackdropView *backdropView;
  UIView *shadowView;
  id v13;

  -[TUIRenderStyling removeStylingFromView:](self->_currentStyle, "removeStylingFromView:", self->_contentView);
  currentStyle = self->_currentStyle;
  self->_currentStyle = 0;

  -[UIView setBackgroundColor:](self->_contentView, "setBackgroundColor:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_contentView, "layer"));
  LODWORD(v5) = 0;
  objc_msgSend(v4, "setShadowOpacity:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_contentView, "layer"));
  objc_msgSend(v6, "setBorderWidth:", 0.0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_contentView, "layer"));
  objc_msgSend(v7, "setCornerRadius:", 0.0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_contentView, "layer"));
  objc_msgSend(v8, "setMasksToBounds:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_contentView, "layer"));
  objc_msgSend(v9, "setShadowPath:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_contentView, "layer"));
  objc_msgSend(v10, "setCompositingFilter:", 0);

  -[_TUIBackdropView removeFromSuperview](self->_backdropView, "removeFromSuperview");
  backdropView = self->_backdropView;
  self->_backdropView = 0;

  -[UIView removeFromSuperview](self->_shadowView, "removeFromSuperview");
  shadowView = self->_shadowView;
  self->_shadowView = 0;

  v13 = (id)objc_claimAutoreleasedReturnValue(-[TUIContainerView layer](self, "layer"));
  objc_msgSend(v13, "setAllowsGroupBlending:", 1);

}

- (void)prepareForReuse
{
  TUIRenderModelSubviews *model;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUIContainerView;
  -[TUIReusableBaseView prepareForReuse](&v4, "prepareForReuse");
  -[TUIContainerView _resetStyling](self, "_resetStyling");
  model = self->_model;
  self->_model = 0;

  -[TUIContainerView _updateSubviews](self, "_updateSubviews");
}

- (void)viewDidEndDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIContainerView;
  -[TUIReusableBaseView viewDidEndDisplay](&v3, "viewDidEndDisplay");
  -[TUIContainerView prepareForReuse](self, "prepareForReuse");
}

- (BOOL)showContents
{
  return 1;
}

- (void)_updateSubviews
{
  TUIViewFactory **p_factory;
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  TUIRenderModelSubviews *model;
  id WeakRetained;
  void *v17;
  NSArray *v18;
  NSArray *currentSubviews;
  char v20;

  v20 = 0;
  if (self->_model
    && (p_factory = &self->_factory, (v4 = objc_loadWeakRetained((id *)&self->_factory)) != 0)
    && (v5 = v4, v6 = -[TUIContainerView showContents](self, "showContents"), v5, v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "renderOverrideProvider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "renderOverrides"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView tui_querySectionUUID](self, "tui_querySectionUUID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView tui_querySectionUID](self, "tui_querySectionUID"));
    }
    else
    {
      v11 = 0;
      v10 = 0;
    }
    model = self->_model;
    WeakRetained = objc_loadWeakRetained((id *)p_factory);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSubviews configureSubviewsWithFactory:outsets:host:overrides:usedOverrides:UUID:uid:](model, "configureSubviewsWithFactory:outsets:host:overrides:usedOverrides:UUID:uid:", WeakRetained, self, v9, &v20, v10, v11, self->_outsets.top, self->_outsets.left, self->_outsets.bottom, self->_outsets.right));

    v18 = (NSArray *)objc_msgSend(v17, "copy");
    currentSubviews = self->_currentSubviews;
    self->_currentSubviews = v18;

    v14 = 2 * v20;
  }
  else
  {
    v12 = objc_loadWeakRetained((id *)&self->_factory);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subviewPool"));
    objc_msgSend(v13, "prepareToReuseHost:", self);

    v14 = 0;
  }
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v14;
}

- (void)layoutSubviews
{
  objc_super v3;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)&self->_flags &= ~1u;
    -[TUIContainerView _updateSubviews](self, "_updateSubviews");
  }
  v3.receiver = self;
  v3.super_class = (Class)TUIContainerView;
  -[TUIContainerView layoutSubviews](&v3, "layoutSubviews");
}

- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  TUIRenderModelSubviews *v10;
  double v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  TUIRenderModelSubviews *v15;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v10 = (TUIRenderModelSubviews *)a3;
  v15 = v10;
  if (self->_model == v10
    && ((v11 = self->_outsets.top, self->_outsets.left == left) ? (v12 = v11 == top) : (v12 = 0),
        v12 ? (v13 = self->_outsets.right == right) : (v13 = 0),
        v13 ? (v14 = self->_outsets.bottom == bottom) : (v14 = 0),
        v14))
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_14;
    *(_BYTE *)&self->_flags |= 1u;
    -[TUIContainerView setNeedsLayout](self, "setNeedsLayout", v11);
  }
  else
  {
    objc_storeStrong((id *)&self->_model, a3);
    self->_outsets.top = top;
    self->_outsets.left = left;
    self->_outsets.bottom = bottom;
    self->_outsets.right = right;
    -[TUIContainerView _updateSubviews](self, "_updateSubviews");
  }
  v10 = v15;
LABEL_14:

}

- (void)invalidateShowContents
{
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    *(_BYTE *)&self->_flags |= 1u;
    -[TUIContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)descendentViewWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TUIContainerView;
  v5 = -[TUIReusableBaseView descendentViewWithIdentifier:](&v19, "descendentViewWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIContainerView tui_hostedSubviewsMap](self, "tui_hostedSubviewsMap", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "descendentViewWithIdentifier:", v4));
          if (v13)
          {
            v6 = (void *)v13;
            goto LABEL_12;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v10)
          continue;
        break;
      }
    }
    v6 = 0;
LABEL_12:

  }
  return v6;
}

- (id)descendentViewWithRefId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TUIContainerView;
  v5 = -[TUIReusableBaseView descendentViewWithRefId:](&v19, "descendentViewWithRefId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIContainerView tui_hostedSubviewsMap](self, "tui_hostedSubviewsMap", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "descendentViewWithRefId:", v4));
          if (v13)
          {
            v6 = (void *)v13;
            goto LABEL_12;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v10)
          continue;
        break;
      }
    }
    v6 = 0;
LABEL_12:

  }
  return v6;
}

- (id)tui_hostingView
{
  return self->_contentView;
}

- (void)appendRenderOverrideObservers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "addObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIContainerView tui_hostedSubviewsMap](self, "tui_hostedSubviewsMap"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_47A6C;
  v7[3] = &unk_23EB70;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  TUIContainerView *v6;
  UIView *contentView;
  id v8;

  y = a3.y;
  x = a3.x;
  v6 = self;
  contentView = self->_contentView;
  v8 = a4;
  -[TUIContainerView convertPoint:toView:](v6, "convertPoint:toView:", contentView, x, y);
  LOBYTE(v6) = -[UIView pointInside:withEvent:](contentView, "pointInside:withEvent:", v8);

  return (char)v6;
}

- (void)invalidateRenderReferenceOverride:(id)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  -[TUIContainerView setNeedsLayout](self, "setNeedsLayout", a3);
}

- (TUIViewFactory)factory
{
  return (TUIViewFactory *)objc_loadWeakRetained((id *)&self->_factory);
}

- (NSDictionary)tui_hostedSubviewsMap
{
  return self->_hostedSubviewsMap;
}

- (void)setTui_hostedSubviewsMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (_TUIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_hostedSubviewsMap, 0);
  objc_destroyWeak((id *)&self->_factory);
  objc_storeStrong((id *)&self->_currentSubviews, 0);
  objc_storeStrong((id *)&self->_currentStyle, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
