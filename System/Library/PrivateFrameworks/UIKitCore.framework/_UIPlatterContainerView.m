@implementation _UIPlatterContainerView

- (_UIPlatterContainerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _UIPlatterContainerView *v7;
  UIView *v8;
  UIView *platterContentView;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)_UIPlatterContainerView;
  v7 = -[UIView initWithFrame:](&v11, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", x, y, width, height);
    platterContentView = v7->_platterContentView;
    v7->_platterContentView = v8;

    -[UIView setAutoresizingMask:](v7->_platterContentView, "setAutoresizingMask:", 18);
    -[UIView addSubview:](v7, "addSubview:", v7->_platterContentView);
  }
  return v7;
}

- (void)installPreviewContainer:(id)a3 overrideSourceView:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  -[UIView bounds](self, "bounds");
  objc_msgSend(v6, "setFrame:");
  -[UIView addSubview:](self, "addSubview:", v6);
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    -[_UIPlatterContainerView source](self, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      -[_UIPlatterContainerView target](self, "target");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v11;

  }
  -[_UIPlatterContainerView platterContentView](self, "platterContentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView transform](self, "transform");
  objc_msgSend(v6, "_preparePreviewContainerWithPreview:source:initialTransform:", v12, v8, &v13);

}

- (void)applyTransform:(CGAffineTransform *)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  double v8;
  double v9;
  CGAffineTransform v10;

  height = a4.height;
  width = a4.width;
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  CGAffineTransformMakeScale(&v10, sqrt(a3->a * a3->a + a3->c * a3->c), sqrt(a3->b * a3->b + a3->d * a3->d));
  -[_UIPlatterContainerView setBounds:](self, "setBounds:", v8, v9, width * v10.a + height * v10.c, width * v10.b + height * v10.d);
  -[_UIPlatterContainerView applyRotation:](self, "applyRotation:", (double)atan2(a3->b, a3->a));
}

- (void)applyRotation:(double)a3
{
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeRotation(&v5, a3);
  v4 = v5;
  -[UIView setTransform:](self, "setTransform:", &v4);
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPlatterContainerView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UIPlatterContainerView _updateTransforms](self, "_updateTransforms");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPlatterContainerView;
  -[UIView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UIPlatterContainerView _updateTransforms](self, "_updateTransforms");
}

- (void)setSource:(id)a3
{
  _UIPlatterView *v5;
  _UIPlatterView *source;
  void *v7;
  _UIPlatterView *v8;

  v5 = (_UIPlatterView *)a3;
  source = self->_source;
  v8 = v5;
  if (source != v5)
    -[UIView removeFromSuperview](source, "removeFromSuperview");
  objc_storeStrong((id *)&self->_source, a3);
  if (self->_source)
  {
    -[_UIPlatterContainerView platterContentView](self, "platterContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[_UIPlatterContainerView _updateTransforms](self, "_updateTransforms");
  }

}

- (void)setTarget:(id)a3
{
  _UIPlatterView *v5;
  _UIPlatterView *target;
  void *v7;
  UIView *v8;
  UIView *v9;
  UIView *updatedTargetWrapper;
  void *v11;
  _UIPlatterView *v12;

  v5 = (_UIPlatterView *)a3;
  target = self->_target;
  v12 = v5;
  if (target != v5)
    -[UIView removeFromSuperview](target, "removeFromSuperview");
  objc_storeStrong((id *)&self->_target, a3);
  if (self->_target)
  {
    -[_UIPlatterContainerView platterContentView](self, "platterContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v12);

    if (!self->_updatedTargetWrapper)
    {
      v8 = [UIView alloc];
      -[UIView bounds](self, "bounds");
      v9 = -[UIView initWithFrame:](v8, "initWithFrame:");
      updatedTargetWrapper = self->_updatedTargetWrapper;
      self->_updatedTargetWrapper = v9;

      -[_UIPlatterContainerView platterContentView](self, "platterContentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", self->_updatedTargetWrapper);

    }
    -[_UIPlatterContainerView _updateTransforms](self, "_updateTransforms");
  }

}

- (void)setUpdatedTarget:(id)a3
{
  _UIPlatterView *v5;
  _UIPlatterView **p_updatedTarget;
  _UIPlatterView *updatedTarget;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  _UIPlatterView *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect rect;
  __int128 v29;
  __int128 v30;
  CGAffineTransform v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v5 = (_UIPlatterView *)a3;
  p_updatedTarget = &self->_updatedTarget;
  updatedTarget = self->_updatedTarget;
  if (updatedTarget != v5)
    -[UIView removeFromSuperview](updatedTarget, "removeFromSuperview");
  objc_storeStrong((id *)&self->_updatedTarget, a3);
  if (*p_updatedTarget)
  {
    -[UIView bounds](*p_updatedTarget, "bounds");
    v9 = v8;
    rect.origin.x = v8;
    rect.origin.y = v10;
    v12 = v11;
    v14 = v13;
    -[UIView bounds](self->_updatedTargetWrapper, "bounds");
    x = v32.origin.x;
    y = v32.origin.y;
    width = v32.size.width;
    height = v32.size.height;
    v19 = CGRectGetWidth(v32);
    v33.origin.x = v9;
    v33.origin.y = v12;
    v33.size.width = v14;
    v33.size.height = rect.origin.y;
    v20 = v19 / CGRectGetWidth(v33);
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    v21 = CGRectGetHeight(v34);
    v35.origin.x = rect.origin.x;
    v35.origin.y = v12;
    v35.size.width = v14;
    v35.size.height = rect.origin.y;
    v22 = CGRectGetHeight(v35);
    CGAffineTransformMakeScale(&v31, v20, v21 / v22);
    v23 = *p_updatedTarget;
    rect.size = *(CGSize *)&v31.a;
    v29 = *(_OWORD *)&v31.c;
    v30 = *(_OWORD *)&v31.tx;
    -[UIView setTransform:](v23, "setTransform:", &rect.size);
    -[UIView bounds](self->_updatedTargetWrapper, "bounds");
    -[UIView setCenter:](*p_updatedTarget, "setCenter:", v25 + v24 * 0.5, v27 + v26 * 0.5);
    -[UIView addSubview:](self->_updatedTargetWrapper, "addSubview:", *p_updatedTarget);
    -[_UIPlatterContainerView _updateTransforms](self, "_updateTransforms");
  }

}

- (void)_updateTransforms
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double Width;
  CGFloat v23;
  double Height;
  CGFloat v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  void *v41;
  void *v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  UIView *updatedTargetWrapper;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat rect;
  CGAffineTransform rect_8;
  CGAffineTransform v66;
  CGAffineTransform v67;
  CGAffineTransform v68;
  CGAffineTransform v69;
  CGAffineTransform v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIPlatterContainerView source](self, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v62 = v14;
  rect = v12;
  v16 = v15;
  v18 = v17;
  v71.origin.x = v4;
  v71.origin.y = v6;
  v19 = v6;
  v59 = v6;
  v71.size.width = v8;
  v20 = v8;
  v71.size.height = v10;
  v21 = v10;
  v61 = v10;
  Width = CGRectGetWidth(v71);
  v72.origin.x = v13;
  v72.origin.y = v16;
  v72.size.width = v18;
  v72.size.height = v62;
  v23 = Width / CGRectGetWidth(v72);
  v73.origin.x = v4;
  v73.origin.y = v19;
  v73.size.width = v20;
  v73.size.height = v21;
  Height = CGRectGetHeight(v73);
  v74.origin.x = rect;
  v74.origin.y = v16;
  v74.size.width = v18;
  v74.size.height = v62;
  v25 = CGRectGetHeight(v74);
  CGAffineTransformMakeScale(&v70, v23, Height / v25);
  -[_UIPlatterContainerView source](self, "source");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v70;
  objc_msgSend(v26, "setTransform:", &v69);

  v63 = v4 + v20 * 0.5;
  rect = v59 + v61 * 0.5;
  -[_UIPlatterContainerView source](self, "source");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setCenter:", v63, rect);

  -[_UIPlatterContainerView target](self, "target");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  v30 = v29;
  v55 = v31;
  v57 = v29;
  v33 = v32;
  v35 = v34;
  v75.origin.x = v4;
  v36 = v4;
  v60 = v4;
  v75.origin.y = v59;
  v75.size.width = v20;
  v75.size.height = v61;
  v37 = CGRectGetWidth(v75);
  v76.origin.x = v30;
  v76.origin.y = v33;
  v76.size.width = v35;
  v76.size.height = v55;
  v38 = v37 / CGRectGetWidth(v76);
  v77.origin.x = v36;
  v77.origin.y = v59;
  v77.size.width = v20;
  v77.size.height = v61;
  v39 = CGRectGetHeight(v77);
  v78.origin.x = v57;
  v78.origin.y = v33;
  v78.size.width = v35;
  v78.size.height = v55;
  v40 = CGRectGetHeight(v78);
  CGAffineTransformMakeScale(&v68, v38, v39 / v40);
  -[_UIPlatterContainerView target](self, "target");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v68;
  objc_msgSend(v41, "setTransform:", &v67);

  -[_UIPlatterContainerView target](self, "target");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setCenter:", v63, rect);

  -[UIView bounds](self->_updatedTargetWrapper, "bounds");
  v44 = v43;
  v56 = v45;
  v58 = v43;
  v47 = v46;
  v49 = v48;
  v79.origin.x = v60;
  v79.origin.y = v59;
  v79.size.width = v20;
  v79.size.height = v61;
  v50 = CGRectGetWidth(v79);
  v80.origin.x = v44;
  v80.origin.y = v47;
  v80.size.width = v49;
  v80.size.height = v56;
  v51 = v50 / CGRectGetWidth(v80);
  v81.origin.x = v60;
  v81.origin.y = v59;
  v81.size.width = v20;
  v81.size.height = v61;
  v52 = CGRectGetHeight(v81);
  v82.origin.x = v58;
  v82.origin.y = v47;
  v82.size.width = v49;
  v82.size.height = v56;
  v53 = CGRectGetHeight(v82);
  CGAffineTransformMakeScale(&v66, v51, v52 / v53);
  updatedTargetWrapper = self->_updatedTargetWrapper;
  rect_8 = v66;
  -[UIView setTransform:](updatedTargetWrapper, "setTransform:", &rect_8);
  -[UIView setCenter:](self->_updatedTargetWrapper, "setCenter:", v63, rect);
}

- (_UIPlatterView)source
{
  return self->_source;
}

- (_UIPlatterView)target
{
  return self->_target;
}

- (_UIPlatterView)updatedTarget
{
  return self->_updatedTarget;
}

- (UIView)platterContentView
{
  return self->_platterContentView;
}

- (void)setPlatterContentView:(id)a3
{
  objc_storeStrong((id *)&self->_platterContentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterContentView, 0);
  objc_storeStrong((id *)&self->_updatedTarget, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_updatedTargetWrapper, 0);
}

@end
