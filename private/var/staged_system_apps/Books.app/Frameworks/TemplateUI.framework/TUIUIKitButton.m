@implementation TUIUIKitButton

- (id)backgroundColor
{
  void *v3;
  void *v4;
  id v6;
  objc_super v7;

  if (-[TUIUIKitButton buttonType](self, "buttonType"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIUIKitButton configuration](self, "configuration"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "baseBackgroundColor"));

    return v4;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TUIUIKitButton;
    v6 = -[TUIUIKitButton backgroundColor](&v7, "backgroundColor");
    return (id)objc_claimAutoreleasedReturnValue(v6);
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  if (-[TUIUIKitButton buttonType](self, "buttonType"))
  {
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIUIKitButton configuration](self, "configuration"));
      v6 = v5;
      if (v5)
        v7 = v5;
      else
        v7 = (id)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration"));
      v8 = v7;

      objc_msgSend(v8, "setBaseBackgroundColor:", v4);
      -[TUIUIKitButton setConfiguration:](self, "setConfiguration:", v8);

    }
    else
    {
      -[TUIUIKitButton setConfiguration:](self, "setConfiguration:", 0);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TUIUIKitButton;
    -[TUIUIKitButton setBackgroundColor:](&v9, "setBackgroundColor:", v4);
  }

}

- (BOOL)isStaticMenu
{
  return 0;
}

- (void)setTui_menu:(id)a3
{
  TUIMenuModel *v5;
  id *p_tui_menu;
  TUIMenuModel *tui_menu;
  unsigned __int8 v8;
  unsigned int v9;
  id v10;
  id v11;
  void *v12;
  TUIMenuModel *v13;
  _QWORD v14[4];
  TUIMenuModel *v15;

  v5 = (TUIMenuModel *)a3;
  p_tui_menu = (id *)&self->_tui_menu;
  tui_menu = self->_tui_menu;
  if (tui_menu != v5)
  {
    v13 = v5;
    v8 = -[TUIMenuModel isEqual:](tui_menu, "isEqual:", v5);
    v5 = v13;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_tui_menu, a3);
      v9 = -[TUIUIKitButton isStaticMenu](self, "isStaticMenu");
      v10 = *p_tui_menu;
      if (v9)
      {
        v11 = objc_msgSend(v10, "newUIMenuElement");
        -[TUIUIKitButton setMenu:](self, "setMenu:", v11);

      }
      else
      {
        -[TUIUIKitButton setContextMenuInteractionEnabled:](self, "setContextMenuInteractionEnabled:", v10 != 0);
      }
      -[TUIUIKitButton setShowsMenuAsPrimaryAction:](self, "setShowsMenuAsPrimaryAction:", objc_msgSend(*p_tui_menu, "isPrimary"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIUIKitButton contextMenuInteraction](self, "contextMenuInteraction"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_16F750;
      v14[3] = &unk_243288;
      v15 = v13;
      objc_msgSend(v12, "updateVisibleMenuWithBlock:", v14);

      v5 = v13;
    }
  }

}

- (void)menuDataDidUpdate
{
  id v3;

  if (-[TUIUIKitButton isStaticMenu](self, "isStaticMenu"))
  {
    v3 = -[TUIMenuModel newUIMenuElement](self->_tui_menu, "newUIMenuElement");
    -[TUIUIKitButton setMenu:](self, "setMenu:", v3);

  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  TUIMenuModel *v8;
  id v9;
  void *v10;
  id WeakRetained;
  _QWORD v13[4];
  TUIMenuModel *v14;
  objc_super v15;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self->_tui_menu;
  if (-[TUIUIKitButton isStaticMenu](self, "isStaticMenu"))
  {
    v15.receiver = self;
    v15.super_class = (Class)TUIUIKitButton;
    v9 = -[TUIUIKitButton contextMenuInteraction:configurationForMenuAtLocation:](&v15, "contextMenuInteraction:configurationForMenuAtLocation:", v7, x, y);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }
  else if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_16F910;
    v13[3] = &unk_2432B0;
    v14 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v13));

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_tui_delegate);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contextMenuConfigurationForButton:point:", self, x, y));

  }
  objc_msgSend(v10, "setPreferredMenuElementOrder:", 2);

  return v10;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TUIUIKitButton;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TUIUIKitButton contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v12, "contextMenuInteraction:willDisplayMenuForConfiguration:animator:", v10, v9, v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_tui_delegate);
  objc_msgSend(WeakRetained, "button:contextMenuInteraction:willDisplayMenuForConfiguration:animator:", self, v10, v9, v8, v12.receiver, v12.super_class);

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TUIUIKitButton;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TUIUIKitButton contextMenuInteraction:willEndForConfiguration:animator:](&v12, "contextMenuInteraction:willEndForConfiguration:animator:", v10, v9, v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_tui_delegate);
  objc_msgSend(WeakRetained, "button:contextMenuInteraction:willEndForConfiguration:animator:", self, v10, v9, v8, v12.receiver, v12.super_class);

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  TUIUIKitButton *v9;
  uint64_t v10;
  TUIUIKitButton *v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  unsigned int v17;
  TUIUIKitButton *v18;
  objc_super v20;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TUIUIKitButton;
  v8 = -[TUIUIKitButton hitTest:withEvent:](&v20, "hitTest:withEvent:", v7, x, y);
  v9 = (TUIUIKitButton *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_opt_class(UIControl);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
  {
    v11 = (TUIUIKitButton *)objc_claimAutoreleasedReturnValue(-[TUIUIKitButton gestureRecognizers](v9, "gestureRecognizers"));
    if (-[TUIUIKitButton count](v11, "count"))
    {
LABEL_5:

      goto LABEL_6;
    }
    v12 = -[TUIUIKitButton pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y);

    if (v12)
    {
      v11 = v9;
      v9 = self;
      goto LABEL_5;
    }
  }
LABEL_6:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[TUIDragController sharedInstance](TUIDragController, "sharedInstance"));
  v14 = objc_opt_class(TUIReusableBaseView);
  v15 = TUIPlatformAncestorOfClassAndProtocol(self, v14, &OBJC_PROTOCOL___TUIReusableRenderView);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = +[TUIDragController viewSupportsDrag:](TUIDragController, "viewSupportsDrag:", v16);
  if (objc_msgSend(v13, "isDragging") && v17)
  {
    v18 = v16;

    v9 = v18;
  }

  return v9;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
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
  double v18;
  CGPoint v20;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  -[TUIUIKitButton computedTouchInsets](self, "computedTouchInsets", a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[TUIUIKitButton bounds](self, "bounds");
  v21.origin.x = v10 + v15;
  v21.origin.y = v8 + v16;
  v21.size.width = v17 - (v10 + v14);
  v21.size.height = v18 - (v8 + v12);
  v20.x = x;
  v20.y = y;
  return CGRectContainsPoint(v21, v20);
}

- (UIEdgeInsets)computedTouchInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  UIEdgeInsets result;

  -[TUIUIKitButton touchInsets](self, "touchInsets");
  if (v4 == UIEdgeInsetsZero.left
    && v3 == UIEdgeInsetsZero.top
    && v6 == UIEdgeInsetsZero.right
    && v5 == UIEdgeInsetsZero.bottom)
  {
    -[TUIUIKitButton bounds](self, "bounds");
    x = v18.origin.x;
    y = v18.origin.y;
    width = v18.size.width;
    height = v18.size.height;
    v14 = 44.0 - CGRectGetWidth(v18);
    if (v14 <= 0.0)
      v15 = 0.0;
    else
      v15 = v14 * 0.5;
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v16 = 44.0 - CGRectGetHeight(v19);
    if (v16 <= 0.0)
      v17 = 0.0;
    else
      v17 = v16 * 0.5;
    v5 = -v17;
    v6 = -v15;
    v4 = -v15;
    v3 = -v17;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)_accessibilityUnderlyingElementForFocusItem
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  TUIUIKitButton *v13;
  TUIUIKitButton *v14;
  TUIUIKitButton *v15;

  v3 = objc_opt_class(TUIFeedViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIUIKitButton _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &stru_2432F0, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_accessibilityViewController"));
  v6 = TUIDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topLevelAXElement"));
  v9 = objc_opt_class(NSArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "children"));
  v11 = TUIDynamicCast(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (TUIUIKitButton *)objc_claimAutoreleasedReturnValue(-[TUIUIKitButton _accessibilityGetAXElementMatchFromArray:](self, "_accessibilityGetAXElementMatchFromArray:", v12));
  v14 = v13;
  if (!v13)
    v13 = self;
  v15 = v13;

  return v15;
}

- (id)_accessibilityGetAXElementMatchFromArray:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "isAccessibilityElement", (_QWORD)v28))
        {
          -[TUIUIKitButton accessibilityFrame](self, "accessibilityFrame");
          v11 = v10;
          v13 = v12;
          v15 = v14;
          v17 = v16;
          objc_msgSend(v9, "accessibilityFrame");
          if (-[TUIUIKitButton _accessibilityRect:equalToRect:](self, "_accessibilityRect:equalToRect:", v11, v13, v15, v17, v18, v19, v20, v21))
          {
            v26 = v9;
            goto LABEL_13;
          }
        }
        else
        {
          v22 = objc_opt_class(NSArray);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "children"));
          v24 = TUIDynamicCast(v22, v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

          v26 = (id)objc_claimAutoreleasedReturnValue(-[TUIUIKitButton _accessibilityGetAXElementMatchFromArray:](self, "_accessibilityGetAXElementMatchFromArray:", v25));
          if (v26)
            goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v6);
  }
  v26 = 0;
LABEL_13:

  return v26;
}

- (BOOL)_accessibilityRect:(CGRect)a3 equalToRect:(CGRect)a4
{
  return vabdd_f64((double)(int)a3.origin.x, (double)(int)a4.origin.x) <= 1.0
      && vabdd_f64((double)(int)a3.origin.y, (double)(int)a4.origin.y) <= 1.0
      && vabdd_f64((double)(int)a3.size.width, (double)(int)a4.size.width) <= 1.0
      && vabdd_f64((double)(int)a3.size.height, (double)(int)a4.size.height) <= 1.0;
}

- (UIEdgeInsets)touchInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_touchInsets.top;
  left = self->_touchInsets.left;
  bottom = self->_touchInsets.bottom;
  right = self->_touchInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  self->_touchInsets = a3;
}

- (TUIMenuModel)tui_menu
{
  return self->_tui_menu;
}

- (TUIButtonDelegate)tui_delegate
{
  return (TUIButtonDelegate *)objc_loadWeakRetained((id *)&self->_tui_delegate);
}

- (void)setTui_delegate:(id)a3
{
  objc_storeWeak((id *)&self->_tui_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tui_delegate);
  objc_storeStrong((id *)&self->_tui_menu, 0);
}

@end
