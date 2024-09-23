@implementation _UIDuoShadowView

- (_UIDuoShadowView)initWithFrame:(CGRect)a3
{
  _UIDuoShadowView *v3;
  _UIDuoShadowView *v4;
  void *v5;
  void *v6;
  UIView *v7;
  UIView *secondaryShadowView;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIDuoShadowView;
  v3 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShadowPathIsBounds:", 1);

    -[UIView layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPunchoutShadow:", 1);

    v7 = objc_alloc_init(UIView);
    secondaryShadowView = v4->_secondaryShadowView;
    v4->_secondaryShadowView = v7;

    -[UIView layer](v4->_secondaryShadowView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShadowPathIsBounds:", 1);

    -[UIView layer](v4->_secondaryShadowView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPunchoutShadow:", 1);

    -[UIView addSubview:](v4, "addSubview:", v4->_secondaryShadowView);
  }
  return v4;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDuoShadowView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_secondaryShadowView, "setFrame:");
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)_UIDuoShadowView;
  -[UIView setBounds:](&v8, sel_setBounds_);
  -[UIView setFrame:](self->_secondaryShadowView, "setFrame:", x, y, width, height);
}

- (void)setCornerRadii:(id *)a1
{
  __int128 v4;
  __int128 v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  _OWORD v10[4];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[4];

  if (a1)
  {
    v4 = a2[1];
    v15[0] = *a2;
    v15[1] = v4;
    v5 = a2[3];
    v15[2] = a2[2];
    v15[3] = v5;
    objc_msgSend(a1, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadii:", v15);

    v7 = a2[1];
    v11 = *a2;
    v12 = v7;
    v8 = a2[3];
    v13 = a2[2];
    v14 = v8;
    objc_msgSend(a1[52], "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v11;
    v10[1] = v12;
    v10[2] = v13;
    v10[3] = v14;
    objc_msgSend(v9, "setCornerRadii:", v10);

  }
}

- (void)setPrimaryShadow:(uint64_t)a1
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a2;
  if (a1)
  {
    v7 = v4;
    objc_storeStrong((id *)(a1 + 424), a2);
    if (v7)
      v5 = v7;
    else
      v5 = (id)objc_opt_new();
    v6 = v5;
    objc_msgSend(v5, "applyToView:", a1);

    v4 = v7;
  }

}

- (void)setSecondaryShadow:(uint64_t)a1
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a2;
  if (a1)
  {
    v7 = v4;
    objc_storeStrong((id *)(a1 + 432), a2);
    if (v7)
      v5 = v7;
    else
      v5 = (id)objc_opt_new();
    v6 = v5;
    objc_msgSend(v5, "applyToView:", *(_QWORD *)(a1 + 416));

    v4 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryShadow, 0);
  objc_storeStrong((id *)&self->_primaryShadow, 0);
  objc_storeStrong((id *)&self->_secondaryShadowView, 0);
}

@end
