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

  if (sSetupOnceToken != -1)
    dispatch_once(&sSetupOnceToken, &__block_literal_global_37);
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
    v7 = -1.0;
    v9 = -1.0;
    v11 = -1.0;
    v13 = -1.0;
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

  if (sSetupOnceToken != -1)
    dispatch_once(&sSetupOnceToken, &__block_literal_global_37);
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
  if (sSetupOnceToken != -1)
    dispatch_once(&sSetupOnceToken, &__block_literal_global_37);
  -[UIView music_layoutInsets](self, "music_layoutInsets");
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    v15 = _UIViewMusicLayoutAdditionsAssociatedObjectKeyLayoutInsets;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithUIEdgeInsets:](NSValue, "valueWithUIEdgeInsets:", top, left, bottom, right));
    objc_setAssociatedObject(self, v15, v16, &stru_2E8.segname[9]);

    -[UIView _music_updateInheritedLayoutInsets](self, "_music_updateInheritedLayoutInsets");
  }
}

+ (UIEdgeInsets)music_defaultLayoutInsetsInView:(id)a3
{
  double Width;
  double v4;
  int v5;
  double v6;
  double v7;
  double v8;
  CGRect v9;
  UIEdgeInsets result;

  objc_msgSend(a3, "bounds");
  Width = CGRectGetWidth(v9);
  if ((MPUFloatGreaterThanOrEqualToFloat(Width, 1000.0) & 1) != 0)
  {
    v4 = 52.0;
  }
  else
  {
    v5 = MPUFloatGreaterThanOrEqualToFloat(Width, 650.0);
    v4 = 20.0;
    if (v5)
      v4 = 34.0;
  }
  v6 = 0.0;
  v7 = 0.0;
  v8 = v4;
  result.right = v8;
  result.bottom = v7;
  result.left = v4;
  result.top = v6;
  return result;
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  const void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *i;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  -[UIView music_layoutInsets](self, "music_layoutInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
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
    v14 = v21;
    v16 = v22;
    v18 = v23;
    v20 = v24;
  }

  if (MPUFloatEqualToFloat(v4, -1.0))
    v4 = v14;
  if (MPUFloatEqualToFloat(v6, -1.0))
    v6 = v16;
  if (MPUFloatEqualToFloat(v8, -1.0))
    v8 = v18;
  if (MPUFloatEqualToFloat(v10, -1.0))
    v10 = v20;
  -[UIView music_inheritedLayoutInsets](self, "music_inheritedLayoutInsets");
  if (v28 != v6 || v25 != v4 || v27 != v10 || v26 != v8)
  {
    v32 = _UIViewMusicLayoutAdditionsAssociatedObjectKeyInheritedLayoutInsets;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithUIEdgeInsets:](NSValue, "valueWithUIEdgeInsets:", v4, v6, v8, v10));
    objc_setAssociatedObject(self, v32, v33, &stru_2E8.segname[9]);

    -[UIView music_inheritedLayoutInsetsDidChange](self, "music_inheritedLayoutInsetsDidChange");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", self));
    objc_msgSend(v34, "music_viewInheritedLayoutInsetsDidChange");
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self, "subviews", 0));
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v37; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i), "_music_updateInheritedLayoutInsets");
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v37);
    }

  }
}

@end
