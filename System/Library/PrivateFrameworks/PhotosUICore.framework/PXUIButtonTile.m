@implementation PXUIButtonTile

- (PXUIButtonTile)init
{
  PXUIButtonTile *v2;
  UIView *v3;
  UIView *view;
  uint64_t v5;
  UIButton *button;
  PXButtonSpec *v7;
  PXButtonSpec *spec;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXUIButtonTile;
  v2 = -[PXUIButtonTile init](&v10, sel_init);
  if (v2)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    view = v2->__view;
    v2->__view = v3;

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v5 = objc_claimAutoreleasedReturnValue();
    button = v2->__button;
    v2->__button = (UIButton *)v5;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v2->__button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v2->__button, "addTarget:action:forControlEvents:", v2, sel__handleButton_, 0x2000);
    -[UIView addSubview:](v2->__view, "addSubview:", v2->__button);
    v7 = objc_alloc_init(PXButtonSpec);
    spec = v2->__spec;
    v2->__spec = v7;

  }
  return v2;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  char v5;
  NSString *v6;
  NSString *title;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_title;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      title = self->_title;
      self->_title = v6;

      -[PXUIButtonTile _invalidateButton](self, "_invalidateButton");
    }
  }

}

- (void)_setSpec:(id)a3
{
  PXButtonSpec *v5;
  PXButtonSpec *v6;

  v5 = (PXButtonSpec *)a3;
  if (self->__spec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__spec, a3);
    -[PXUIButtonTile _invalidateButton](self, "_invalidateButton");
    v5 = v6;
  }

}

- (void)_setLayoutConstraints:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *layoutConstraints;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->__layoutConstraints;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      if (self->__layoutConstraints)
        objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      layoutConstraints = self->__layoutConstraints;
      self->__layoutConstraints = v6;

      if (self->__layoutConstraints)
        objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:");
    }
  }

}

- (void)_handleButton:(id)a3
{
  id v4;

  -[PXUIButtonTile delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttonTileTapped:", self);

}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.button;
}

- (void)_setNeedsUpdate
{
  _QWORD v2[4];
  id v3;
  id location;

  if (!self->_hasScheduledUpdate)
  {
    self->_hasScheduledUpdate = 1;
    objc_initWeak(&location, self);
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __33__PXUIButtonTile__setNeedsUpdate__block_invoke;
    v2[3] = &unk_1E5148D30;
    objc_copyWeak(&v3, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v2);
    objc_destroyWeak(&v3);
    objc_destroyWeak(&location);
  }
}

- (void)_updateIfNeeded
{
  self->_hasScheduledUpdate = 0;
  if (-[PXUIButtonTile _needsUpdate](self, "_needsUpdate"))
    -[PXUIButtonTile _updateButtonIfNeeded](self, "_updateButtonIfNeeded");
}

- (void)_invalidateButton
{
  self->_needsUpdateFlags.button = 1;
  -[PXUIButtonTile _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateButtonIfNeeded
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  if (self->_needsUpdateFlags.button)
  {
    self->_needsUpdateFlags.button = 0;
    -[PXUIButtonTile _button](self, "_button");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIButtonTile title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "length");
    objc_msgSend(v4, "setHidden:", v6 == 0);
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXUIButtonTile _spec](self, "_spec");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "px_stringByApplyingCapitalization:", objc_msgSend(v7, "capitalization"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "font");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        if (v8)
        {
          v10 = objc_alloc(MEMORY[0x1E0CB3498]);
          v41 = *MEMORY[0x1E0DC1138];
          v42[0] = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v10, "initWithString:attributes:", v8, v11);

        }
        else
        {
          v12 = 0;
        }
        objc_msgSend(v4, "setAttributedTitle:forState:", v12, 0);

      }
      else
      {
        objc_msgSend(v4, "setTitle:forState:", v8, 0);
      }
      objc_msgSend(v7, "textColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(v4, "setTitleColor:forState:", v13, 0);
      objc_msgSend(v7, "highlightedTextColor", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        objc_msgSend(v4, "setTitleColor:forState:", v14, 1);
      v15 = *((double *)off_1E50B8010 + 1);
      v16 = *((double *)off_1E50B8010 + 3);
      objc_msgSend(v4, "setContentEdgeInsets:", *(double *)off_1E50B8010, v15, *((double *)off_1E50B8010 + 2), v16);
      objc_msgSend(v7, "contentInsets");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      -[PXUIButtonTile _view](self, "_view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v7, "textAlignment"))
      {
        case 0:
          objc_msgSend(v25, "leftAnchor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "leftAnchor");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v20 - v15;
          goto LABEL_18;
        case 1:
        case 4:
          objc_msgSend(v25, "centerXAnchor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "centerXAnchor");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "constraintEqualToAnchor:", v27);
          v28 = objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        case 2:
          objc_msgSend(v25, "rightAnchor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "rightAnchor");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v24 - v16;
LABEL_18:
          objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, v29);
          v28 = objc_claimAutoreleasedReturnValue();
LABEL_19:
          v30 = (void *)v28;
          objc_msgSend(v6, "addObject:", v28);

          v31 = objc_msgSend(v7, "verticalAlignment");
          if (v31)
          {
            if (v31 == 1)
            {
              objc_msgSend(v25, "bottomAnchor");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "lastBaselineAnchor");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = v32;
              v35 = v33;
              v36 = v22;
            }
            else
            {
              if (v31 != 2)
                goto LABEL_27;
              objc_msgSend(v25, "topAnchor");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "topAnchor");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = v32;
              v35 = v33;
              v36 = v18;
            }
            objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, v36);
            v37 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v25, "centerYAnchor");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "centerYAnchor");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "constraintEqualToAnchor:", v33);
            v37 = objc_claimAutoreleasedReturnValue();
          }
          v38 = (void *)v37;
          objc_msgSend(v6, "addObject:", v37);

LABEL_27:
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIButtonTile.m"), 165, CFSTR("Code which should be unreachable has been reached"));

          abort();
      }
    }
    else
    {
      v8 = v5;
    }
    -[PXUIButtonTile _setLayoutConstraints:](self, "_setLayoutConstraints:", v6);

  }
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  id v5;

  objc_msgSend(a4, "viewSpec", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXUIButtonTile _setSpec:](self, "_setSpec:", v5);
  -[PXUIButtonTile _updateIfNeeded](self, "_updateIfNeeded");

}

- (void)becomeReusable
{
  -[PXUIButtonTile setTitle:](self, "setTitle:", 0);
}

- (PXUIButtonTileDelegate)delegate
{
  return (PXUIButtonTileDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)title
{
  return self->_title;
}

- (UIView)_view
{
  return self->__view;
}

- (UIButton)_button
{
  return self->__button;
}

- (PXButtonSpec)_spec
{
  return self->__spec;
}

- (NSArray)_layoutConstraints
{
  return self->__layoutConstraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__layoutConstraints, 0);
  objc_storeStrong((id *)&self->__spec, 0);
  objc_storeStrong((id *)&self->__button, 0);
  objc_storeStrong((id *)&self->__view, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __33__PXUIButtonTile__setNeedsUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateIfNeeded");

}

@end
