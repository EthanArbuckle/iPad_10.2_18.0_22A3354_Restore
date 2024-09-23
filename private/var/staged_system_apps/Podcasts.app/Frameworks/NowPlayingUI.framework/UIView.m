@implementation UIView

- (UIEdgeInsets)music_layoutInsets
{
  id AssociatedObject;
  void *v4;
  void *v5;
  double v6;
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
  UIEdgeInsets result;

  if (sSetupOnceToken[0] != -1)
    dispatch_once(sSetupOnceToken, &__block_literal_global_47);
  AssociatedObject = objc_getAssociatedObject(self, _UIViewMusicLayoutAdditionsAssociatedObjectKeyLayoutInsets);
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "UIEdgeInsetsValue");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v7 = MTMPULayoutSizeNoDimension;
    v9 = MTMPULayoutSizeNoDimension;
    v11 = MTMPULayoutSizeNoDimension;
    v13 = MTMPULayoutSizeNoDimension;
  }

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIEdgeInsets)music_inheritedLayoutInsets
{
  id AssociatedObject;
  void *v4;
  double v5;
  double v6;
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
  UIEdgeInsets result;

  if (sSetupOnceToken[0] != -1)
    dispatch_once(sSetupOnceToken, &__block_literal_global_47);
  AssociatedObject = objc_getAssociatedObject(self, _UIViewMusicLayoutAdditionsAssociatedObjectKeyInheritedLayoutInsets);
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  objc_msgSend(v4, "UIEdgeInsetsValue");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)music_setLayoutInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  const void *v15;
  void *v16;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (sSetupOnceToken[0] != -1)
    dispatch_once(sSetupOnceToken, &__block_literal_global_47);
  -[UIView music_layoutInsets](self, "music_layoutInsets");
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    v15 = _UIViewMusicLayoutAdditionsAssociatedObjectKeyLayoutInsets;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithUIEdgeInsets:](NSValue, "valueWithUIEdgeInsets:", top, left, bottom, right));
    objc_setAssociatedObject(self, v15, v16, &stru_2E8.segname[9]);

    if (-[UIView _isInAWindow](self, "_isInAWindow"))
      -[UIView _music_updateInheritedLayoutInsets](self, "_music_updateInheritedLayoutInsets");
    else
      objc_setAssociatedObject(self, _UIViewMusicLayoutAdditionsAssociatedObjectKeyNeedsUpdateAfterMovingToWindow, &__kCFBooleanTrue, (char *)&dword_0 + 3);
  }
}

- (void)_music_layoutInsets_didMoveToSuperview
{
  -[UIView _music_updateInheritedLayoutInsets](self, "_music_updateInheritedLayoutInsets");
  -[UIView _music_layoutInsets_didMoveToSuperview](self, "_music_layoutInsets_didMoveToSuperview");
}

- (void)_music_layoutInsets_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  -[UIView _music_updateInheritedLayoutInsets](self, "_music_updateInheritedLayoutInsets");
  -[UIView _music_layoutInsets_didMoveFromWindow:toWindow:](self, "_music_layoutInsets_didMoveFromWindow:toWindow:", a3, a4);
}

- (void)_music_updateInheritedLayoutInsets
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
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  const void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *i;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];

  -[UIView music_layoutInsets](self, "music_layoutInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[UIView _isInAWindow](self, "_isInAWindow"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
      objc_msgSend(v12, "music_inheritedLayoutInsets");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;

    }
    else
    {
      -[UIView music_inheritedLayoutInsets](self, "music_inheritedLayoutInsets");
      v14 = v26;
      v16 = v27;
      v18 = v28;
      v20 = v29;
    }

  }
  else
  {
    v21 = -[UIView music_inheritedLayoutInsets](self, "music_inheritedLayoutInsets");
    v14 = v22;
    v16 = v23;
    v18 = v24;
    v20 = v25;
  }
  v30 = MTMPUFloatEqualToFloat(v21, v4, MTMPULayoutSizeNoDimension);
  if ((_DWORD)v30)
    v4 = v14;
  v31 = MTMPUFloatEqualToFloat(v30, v6, MTMPULayoutSizeNoDimension);
  if ((_DWORD)v31)
    v6 = v16;
  v32 = MTMPUFloatEqualToFloat(v31, v8, MTMPULayoutSizeNoDimension);
  if ((_DWORD)v32)
    v8 = v18;
  if (MTMPUFloatEqualToFloat(v32, v10, MTMPULayoutSizeNoDimension))
    v10 = v20;
  -[UIView music_inheritedLayoutInsets](self, "music_inheritedLayoutInsets");
  if (v36 != v6 || v33 != v4 || v35 != v10 || v34 != v8)
  {
    v40 = _UIViewMusicLayoutAdditionsAssociatedObjectKeyInheritedLayoutInsets;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithUIEdgeInsets:](NSValue, "valueWithUIEdgeInsets:", v4, v6, v8, v10));
    objc_setAssociatedObject(self, v40, v41, &stru_2E8.segname[9]);

    -[UIView music_inheritedLayoutInsetsDidChange](self, "music_inheritedLayoutInsetsDidChange");
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", self));
    objc_msgSend(v42, "music_viewInheritedLayoutInsetsDidChange");
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self, "subviews", 0));
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v45; i = (char *)i + 1)
        {
          if (*(_QWORD *)v49 != v46)
            objc_enumerationMutation(v43);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i), "_music_updateInheritedLayoutInsets");
        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v45);
    }

  }
}

- (CGRect)untransformedFrame
{
  UIView *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat Width;
  CGFloat Height;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect result;

  v2 = self;
  -[UIView bounds](v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView center](v2, "center");
  v12 = v11;
  v14 = v13;
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  v15 = v12 - CGRectGetWidth(v23) * 0.5;
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  v16 = v14 - CGRectGetHeight(v24) * 0.5;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  Width = CGRectGetWidth(v25);
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  Height = CGRectGetHeight(v26);

  v19 = v15;
  v20 = v16;
  v21 = Width;
  v22 = Height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)setUntransformedFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  UIView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  CGRect.center.getter(-[UIView setBounds:](v7, "setBounds:", 0.0, 0.0, width, height), x, y, width, height);
  -[UIView setCenter:](v7, "setCenter:");

}

@end
