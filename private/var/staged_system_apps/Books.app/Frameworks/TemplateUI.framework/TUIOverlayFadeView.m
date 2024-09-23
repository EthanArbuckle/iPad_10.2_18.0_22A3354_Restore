@implementation TUIOverlayFadeView

+ (id)renderModelWithIdentifier:(id)a3 size:(CGSize)a4 content:(id)a5 contentOrigin:(CGPoint)a6 contentErasableInsets:(UIEdgeInsets)a7 overlay:(id)a8 overlayOrigin:(CGPoint)a9 padding:(double)a10 gradientWidth:(double)a11 layoutDirection:(unint64_t)a12
{
  CGFloat x;
  double left;
  double top;
  double y;
  double v16;
  double height;
  double width;
  id v21;
  id v22;
  id v23;
  _TUIOverlayFadeRenderModel *v24;
  double bottom;
  double right;
  uint64_t v28;
  uint64_t v29;

  x = a9.x;
  bottom = a7.bottom;
  right = a7.right;
  left = a7.left;
  top = a7.top;
  y = a6.y;
  v16 = a6.x;
  height = a4.height;
  width = a4.width;
  v21 = a8;
  v22 = a5;
  v23 = a3;
  v24 = -[_TUIOverlayFadeRenderModel initWithIdentifier:size:content:contentOrigin:contentErasableInsets:overlay:overlayOrigin:padding:gradientWidth:layoutDirection:]([_TUIOverlayFadeRenderModel alloc], "initWithIdentifier:size:content:contentOrigin:contentErasableInsets:overlay:overlayOrigin:padding:gradientWidth:layoutDirection:", v23, v22, v21, *(_QWORD *)&x, width, height, v16, y, top, left, bottom, right, *(_QWORD *)&a10, *(_QWORD *)&a11, v28, v29);

  return v24;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIOverlayFadeView;
  v4 = a3;
  -[TUIReusableBaseView applyLayoutAttributes:](&v6, "applyLayoutAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderModel", v6.receiver, v6.super_class));

  -[TUIOverlayFadeView configureWithModel:](self, "configureWithModel:", v5);
}

- (void)configureWithModel:(id)a3
{
  _TUIOverlayFadeRenderModel *v5;
  _TUIOverlayFadeRenderModel *v6;

  v5 = (_TUIOverlayFadeRenderModel *)a3;
  if (self->_model != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_model, a3);
    -[TUIOverlayFadeView _updateSubviews](self, "_updateSubviews");
LABEL_5:
    v5 = v6;
    goto LABEL_6;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)&self->_flags |= 1u;
    v6 = v5;
    -[TUIOverlayFadeView setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_updateGeometry
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  _BOOL4 IsLessThanOrAlmostEqualFloat;
  double y;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double MinX;
  CGFloat v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  CGFloat v52;
  double v53;
  BOOL v54;
  _BOOL8 v55;
  double v56;
  int v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double MaxX;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double rect;
  double v86;
  double v87;
  double v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;

  -[_TUIOverlayFadeRenderModel size](self->_model, "size");
  v4 = v3;
  v71 = v3;
  -[_TUIOverlayFadeRenderModel padding](self->_model, "padding");
  v6 = v5;
  -[_TUIOverlayFadeRenderModel gradientWidth](self->_model, "gradientWidth");
  v78 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIOverlayFadeRenderModel content](self->_model, "content"));
  objc_msgSend(v8, "size");
  v10 = v9;
  rect = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIOverlayFadeRenderModel overlay](self->_model, "overlay"));
  objc_msgSend(v11, "size");
  v13 = v12;

  -[_TUIOverlayFadeRenderModel contentErasableInsets](self->_model, "contentErasableInsets");
  v15 = v14;
  v17 = v16;
  v80 = v18;
  v20 = v19;
  v21 = -[_TUIOverlayFadeRenderModel layoutDirection](self->_model, "layoutDirection");
  v67 = v6;
  v88 = v13;
  v87 = v6 + v10;
  IsLessThanOrAlmostEqualFloat = TUICGFloatIsLessThanOrAlmostEqualFloat(v6 + v10 + v13, v4);
  y = CGPointZero.y;
  -[_TUIOverlayFadeRenderModel size](self->_model, "size");
  v86 = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIOverlayFadeRenderModel content](self->_model, "content"));
  objc_msgSend(v25, "size");
  v27 = v26;
  v29 = v28;

  v30 = v17 + CGPointZero.x;
  v31 = y;
  v82 = v20;
  v83 = v17;
  v32 = v27 - (v17 + v20);
  v84 = v15;
  v81 = v15 + v80;
  v68 = v29;
  v69 = v10;
  v74 = v29 - v81;
  v76 = v15 + y;
  MinX = v71 - v10;
  v73 = y;
  if (!IsLessThanOrAlmostEqualFloat)
  {
    v70 = v32;
    v35 = 0.0;
    v34 = v78;
    v36 = v78;
    v37 = y;
    v38 = v86;
    if (v21 == 2)
      goto LABEL_5;
    v52 = v30;
    v93.size.width = v13;
    v93.origin.x = v71 - v13;
    v87 = v71 - v13;
    v93.origin.y = v37;
    v93.size.height = v86;
    v51 = CGRectGetMinX(v93) - v78;
    v94.origin.x = v51;
    v94.origin.y = v37;
    v94.size.width = v78;
    v94.size.height = v86;
    rect = CGRectGetMaxX(v94);
    v32 = v70;
LABEL_12:
    v95.origin.x = v51;
    v95.origin.y = v37;
    v95.size.width = v34;
    v95.size.height = v38;
    MaxX = CGRectGetMaxX(v95);
    v96.origin.x = v52;
    v96.size.height = v74;
    v96.origin.y = v76;
    v96.size.width = v32;
    v53 = CGRectGetMaxX(v96);
    v97.origin.x = v51;
    v97.origin.y = v37;
    v97.size.width = v34;
    v97.size.height = v38;
    MinX = 0.0;
    v75 = v34;
    v77 = fmax(v53 - CGRectGetMaxX(v97), 0.0);
    v50 = 0.0;
    goto LABEL_14;
  }
  v34 = v78;
  if (v21 != 2)
  {
    v52 = v30;
    v34 = 0.0;
    v38 = v86;
    v51 = v87;
    v37 = v31;
    goto LABEL_12;
  }
  v70 = v32;
  v35 = MinX - v67 - v13;
  v36 = 0.0;
  v37 = y;
  v38 = v86;
LABEL_5:
  v39 = MinX + v30;
  v87 = v35;
  v40 = v37;
  v41 = v13;
  v42 = v38;
  v43 = CGRectGetMaxX(*(CGRect *)&v35);
  v44 = v43;
  if (!IsLessThanOrAlmostEqualFloat)
  {
    v45 = v37;
    v46 = v34;
    v47 = v38;
    rect = v71 - CGRectGetMinX(*(CGRect *)&v43);
    v89.origin.x = v44;
    v89.origin.y = v37;
    v89.size.width = v34;
    v89.size.height = v38;
    MinX = CGRectGetMinX(v89);
  }
  v90.origin.x = v39;
  v90.origin.y = v76;
  v90.size.width = v70;
  v90.size.height = v74;
  MaxX = CGRectGetMinX(v90);
  v72 = v44;
  v91.origin.x = v44;
  v91.origin.y = v37;
  v48 = v36;
  v91.size.width = v36;
  v91.size.height = v38;
  v49 = CGRectGetMinX(v91);
  v92.origin.x = v39;
  v92.origin.y = v76;
  v92.size.width = v70;
  v92.size.height = v74;
  v50 = 0.0;
  v77 = fmax(v49 - CGRectGetMinX(v92), 0.0);
  if (IsLessThanOrAlmostEqualFloat)
  {
    v75 = 0.0;
  }
  else
  {
    v98.size.height = v68;
    v98.origin.x = MinX;
    v98.origin.y = v37;
    v98.size.width = rect;
    v50 = v69 - CGRectGetWidth(v98);
    v75 = v48;
  }
  v51 = v72;
LABEL_14:
  v54 = v21 == 2;
  v55 = v21 == 2;
  if (v54)
    v56 = 0.0;
  else
    v56 = v83;
  v57 = v54 || IsLessThanOrAlmostEqualFloat;
  if (IsLessThanOrAlmostEqualFloat)
    v58 = v83;
  else
    v58 = v56;
  if (v57)
    v59 = v82;
  else
    v59 = 0.0;
  -[_TUIOverlayFadeRenderModel contentOrigin](self->_model, "contentOrigin");
  v61 = v60;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIOverlayFadeRenderModel content](self->_model, "content"));
  objc_msgSend(v62, "size");
  v64 = v63;

  v65 = v84 + v61;
  v66 = v64 - v81;
  -[UIView setFrame:](self->_content, "setFrame:", v58 + MinX, v65, rect - (v58 + v59), v66);
  -[UIView setBounds:](self->_content, "setBounds:", v58 + v50, v84, rect - (v58 + v59), v66);
  -[TUIOverlayFadeView convertRect:toView:](self, "convertRect:toView:", self->_content, v51, v65, v75, v66);
  -[_TUIOverlayFadeGradientView setFrame:](self->_gradient, "setFrame:");
  -[TUIOverlayFadeView convertRect:toView:](self, "convertRect:toView:", self->_content, MaxX, v65, v77, v66);
  -[UIView setFrame:](self->_gradientOverflow, "setFrame:");
  -[UIView setFrame:](self->_overlay, "setFrame:", v87, v73, v88, v86);
  -[_TUIOverlayFadeGradientView configureGradientWithAxis:leading:](self->_gradient, "configureGradientWithAxis:leading:", 1, v55);
}

- (void)_updateSubviews
{
  UIView *v3;
  UIView *content;
  UIView *v5;
  UIView *overlay;
  _TUIOverlayFadeGradientView *v7;
  _TUIOverlayFadeGradientView *gradient;
  UIView *v9;
  UIView *gradientOverflow;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  TUIViewFactory **p_factory;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  char v27;
  void *v28;
  id WeakRetained;
  double left;
  double bottom;
  double right;
  id v33;
  void *v34;
  id v35;
  id v36;
  char v37;
  _QWORD v38[5];

  if (!self->_content && !self->_overlay)
  {
    v3 = (UIView *)objc_alloc_init((Class)UIView);
    content = self->_content;
    self->_content = v3;

    -[UIView setClipsToBounds:](self->_content, "setClipsToBounds:", 1);
    v5 = (UIView *)objc_alloc_init((Class)UIView);
    overlay = self->_overlay;
    self->_overlay = v5;

    v7 = objc_alloc_init(_TUIOverlayFadeGradientView);
    gradient = self->_gradient;
    self->_gradient = v7;

    v9 = (UIView *)objc_alloc_init((Class)UIView);
    gradientOverflow = self->_gradientOverflow;
    self->_gradientOverflow = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[UIView setBackgroundColor:](self->_gradientOverflow, "setBackgroundColor:", v11);

    v12 = kCAFilterDestOut;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_gradientOverflow, "layer"));
    objc_msgSend(v13, "setCompositingFilter:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIOverlayFadeGradientView layer](self->_gradient, "layer"));
    objc_msgSend(v14, "setZPosition:", 10000.0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIOverlayFadeGradientView layer](self->_gradient, "layer"));
    objc_msgSend(v15, "setZPosition:", 10000.0);

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_B0B94;
    v38[3] = &unk_23D938;
    v38[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v38);
  }
  v37 = 0;
  if (self->_model
    && (p_factory = &self->_factory, v17 = objc_loadWeakRetained((id *)&self->_factory), v17, v17))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "renderOverrideProvider"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "renderOverrides"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView tui_querySectionUUID](self, "tui_querySectionUUID"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView tui_querySectionUID](self, "tui_querySectionUID"));
    }
    else
    {
      v22 = 0;
      v21 = 0;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIOverlayFadeRenderModel content](self->_model, "content"));
    WeakRetained = objc_loadWeakRetained((id *)p_factory);
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    v33 = objc_msgSend(v28, "configureSubviewsWithFactory:outsets:host:overrides:usedOverrides:UUID:uid:", WeakRetained, self->_content, v20, &v37, v21, v22, UIEdgeInsetsZero.top, left, bottom, right);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIOverlayFadeRenderModel overlay](self->_model, "overlay"));
    v35 = objc_loadWeakRetained((id *)p_factory);
    v36 = objc_msgSend(v34, "configureSubviewsWithFactory:outsets:host:overrides:usedOverrides:UUID:uid:", v35, self->_overlay, v20, &v37, v21, v22, UIEdgeInsetsZero.top, left, bottom, right);

    -[TUIOverlayFadeView _updateGeometry](self, "_updateGeometry");
    v27 = 2 * v37;
  }
  else
  {
    v23 = objc_loadWeakRetained((id *)&self->_factory);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "subviewPool"));
    objc_msgSend(v24, "prepareToReuseHost:", self->_content);

    v25 = objc_loadWeakRetained((id *)&self->_factory);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "subviewPool"));
    objc_msgSend(v26, "prepareToReuseHost:", self->_overlay);

    v27 = 0;
  }
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v27;
}

- (void)viewDidEndDisplay
{
  _TUIOverlayFadeRenderModel *model;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIOverlayFadeView;
  -[TUIReusableBaseView viewDidEndDisplay](&v8, "viewDidEndDisplay");
  model = self->_model;
  self->_model = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_factory);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "subviewPool"));
  objc_msgSend(v5, "prepareToReuseHost:", self->_content);

  v6 = objc_loadWeakRetained((id *)&self->_factory);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subviewPool"));
  objc_msgSend(v7, "prepareToReuseHost:", self->_overlay);

}

- (void)layoutSubviews
{
  objc_super v3;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)&self->_flags &= ~1u;
    -[TUIOverlayFadeView _updateSubviews](self, "_updateSubviews");
  }
  v3.receiver = self;
  v3.super_class = (Class)TUIOverlayFadeView;
  -[TUIOverlayFadeView layoutSubviews](&v3, "layoutSubviews");
}

- (TUIViewFactory)factory
{
  return (TUIViewFactory *)objc_loadWeakRetained((id *)&self->_factory);
}

- (void)setFactory:(id)a3
{
  objc_storeWeak((id *)&self->_factory, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_factory);
  objc_storeStrong((id *)&self->_gradientOverflow, 0);
  objc_storeStrong((id *)&self->_gradient, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
