@implementation TUISmartGridContentLayout

- (id)hoverIdentifierWithName:(id)a3 forDescdendent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  TUIHoverIdentifier *v13;
  id v14;
  TUIHoverIdentifier *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("cell")))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "model"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parentModel"));

    v10 = objc_opt_class(TUICellModel);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout model](self, "model"));
    if (v9)
    {
      do
      {
        if (objc_opt_class(v9) == v10)
          break;
        if (v9 == v11)
          break;
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parentModel"));

        v9 = (void *)v12;
      }
      while (v12);
    }
    v13 = 0;
    if (v9 != v11 && v9)
    {
      v14 = v9;
      v15 = [TUIHoverIdentifier alloc];
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));

      v13 = -[TUIHoverIdentifier initWithName:identifier:](v15, "initWithName:identifier:", v6, v16);
    }

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
    v13 = (TUIHoverIdentifier *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hoverIdentifierWithName:", v6));
  }

  return v13;
}

- (void)appendHoverRegions:(id)a3 relativeToLayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _OWORD v11[3];
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layoutAncestor"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layoutManager"));
  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  -[TUILayout computedTransformInAncestorLayout:](self, "computedTransformInAncestorLayout:", v6);

  v11[0] = v12;
  v11[1] = v13;
  v11[2] = v14;
  objc_msgSend(v10, "appendHoverRegions:transform:", v7, v11);

}

- (void)appendAnchorsToSet:(id)a3 inRoot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layoutAncestor"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layoutManager"));
  objc_msgSend(v9, "appendAnchorsToSet:forLayout:inRoot:", v7, self, v6);

}

- (void)computeLayout
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutAncestor"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutManager"));
  objc_msgSend(v4, "layoutContent:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  objc_msgSend(v4, "positionContainerLayout:", v5);

  objc_msgSend(v4, "contentLayoutSize");
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:");

}

- (void)appendChildRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  double y;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  void *v26;
  float64x2_t v27;
  CGAffineTransform t1;
  CGAffineTransform t2;
  objc_super v30;
  CGAffineTransform v31;

  v10 = a4;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layoutAncestor"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layoutManager"));
  if ((objc_opt_respondsToSelector(v14, "appendChildRenderModelCompatibleWithKind:context:transform:toModels:") & 1) != 0)
  {
    v15 = *(_OWORD *)&a5->c;
    *(_OWORD *)&v31.a = *(_OWORD *)&a5->a;
    *(_OWORD *)&v31.c = v15;
    *(_OWORD *)&v31.tx = *(_OWORD *)&a5->tx;
    objc_msgSend(v14, "appendChildRenderModelCompatibleWithKind:context:transform:toModels:", a3, v10, &v31, v11);
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)TUISmartGridContentLayout;
    v16 = *(_OWORD *)&a5->c;
    *(_OWORD *)&v31.a = *(_OWORD *)&a5->a;
    *(_OWORD *)&v31.c = v16;
    *(_OWORD *)&v31.tx = *(_OWORD *)&a5->tx;
    -[TUILayout appendChildRenderModelCompatibleWithKind:context:transform:toModels:](&v30, "appendChildRenderModelCompatibleWithKind:context:transform:toModels:", a3, v10, &v31, v11);
  }
  y = CGPointZero.y;
  v18 = a5->tx + y * a5->c + a5->a * CGPointZero.x;
  v19 = a5->ty + y * a5->d + a5->b * CGPointZero.x;
  -[TUILayout computedNaturalSize](self, "computedNaturalSize");
  v27 = vaddq_f64(*(float64x2_t *)&a5->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a5->c, v21 * 0.5), *(float64x2_t *)&a5->a, v20 * 0.5));
  objc_msgSend(v10, "contentsScale");
  v23 = TUIPointRoundedForScale(v27.f64[0], v27.f64[1], v22);
  memset(&v31, 0, sizeof(v31));
  CGAffineTransformMakeTranslation(&t2, -(v18 + v23 - v27.f64[0]), -(v19 + v24 - v27.f64[1]));
  v25 = *(_OWORD *)&a5->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&t1.c = v25;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a5->tx;
  CGAffineTransformConcat(&v31, &t1, &t2);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "box"));
  t1 = v31;
  objc_msgSend(v14, "appendAdornmentRenderModelsCompatibleWithKind:transform:context:box:toModels:", a3, &t1, v10, v26, v11);

}

- (CGSize)layoutScrollContentScrollSizeWithProposedSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutAncestor"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutManager"));
  if ((objc_opt_respondsToSelector(v7, "scrollLayoutSizeWithSize:") & 1) != 0)
  {
    objc_msgSend(v7, "scrollLayoutSizeWithSize:", width, height);
    width = v8;
    height = v9;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "box"));
    objc_msgSend(v10, "height");
    if ((v11 & 0x6000000000000) == 0x2000000000000)
    {
      objc_msgSend(v7, "contentLayoutSize");
      height = v12;
    }

  }
  v13 = width;
  v14 = height;
  result.height = v14;
  result.width = v13;
  return result;
}

- (id)scrollPolicy
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layoutAncestor"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutManager"));
  if ((objc_opt_respondsToSelector(v4, "scrollPolicy") & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scrollPolicy"));
  else
    v5 = 0;

  return v5;
}

- (double)layoutScrollPageGap
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layoutAncestor"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  v6 = 0.0;
  if (objc_msgSend(v5, "paginated"))
  {
    objc_msgSend(v4, "computedColumnSpacing");
    v6 = v7;
  }

  return v6;
}

- (UIEdgeInsets)layoutScrollGradientInsets
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  CGFloat top;
  double v7;
  CGFloat left;
  double v9;
  CGFloat bottom;
  double v11;
  CGFloat right;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layoutAncestor"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutManager"));
  if ((objc_opt_respondsToSelector(v4, "scrollGradientInsets") & 1) != 0)
  {
    objc_msgSend(v4, "scrollGradientInsets");
    top = v5;
    left = v7;
    bottom = v9;
    right = v11;
  }
  else
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }

  v13 = top;
  v14 = left;
  v15 = bottom;
  v16 = right;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (UIEdgeInsets)layoutScrollGradientFraction
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  CGFloat top;
  double v7;
  CGFloat left;
  double v9;
  CGFloat bottom;
  double v11;
  CGFloat right;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layoutAncestor"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutManager"));
  if ((objc_opt_respondsToSelector(v4, "scrollGradientFraction") & 1) != 0)
  {
    objc_msgSend(v4, "scrollGradientFraction");
    top = v5;
    left = v7;
    bottom = v9;
    right = v11;
  }
  else
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }

  v13 = top;
  v14 = left;
  v15 = bottom;
  v16 = right;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (BOOL)layoutScrollContentShouldClipVertically
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layoutAncestor"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "box"));
  objc_msgSend(v4, "height");
  v6 = (v5 & 0x6000000000000) != 0x2000000000000;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverRegions, 0);
}

@end
