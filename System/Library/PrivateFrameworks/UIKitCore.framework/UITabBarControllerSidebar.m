@implementation UITabBarControllerSidebar

- (id)_actualFooterContentConfiguration
{
  if (a1)
    a1 = (id *)a1[8];
  return a1;
}

- (id)_initWithTabBarController:(id)result
{
  objc_super v3;

  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)UITabBarControllerSidebar;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result)
    {
      *((_QWORD *)result + 5) = a2;
      *((_BYTE *)result + 32) = 1;
    }
  }
  return result;
}

- (_UITabOutlineView)_outlineView
{
  void *v3;
  int v4;
  _UITabOutlineView *v5;
  _UITabOutlineView *outlineView;
  id WeakRetained;
  _UITabOutlineView *v8;
  void *v9;

  if (!self->_outlineView)
  {
    -[UITabBarController _visualStyle]((id *)&self->_tabBarController->super.super.super.isa);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "canDisplaySidebar"))
    {
LABEL_10:

      return self->_outlineView;
    }
    v4 = _UITabBarControllerWantsFloatingTabBar();

    if (v4)
    {
      v5 = (_UITabOutlineView *)-[_UITabOutlineView initWithSidebar:]((id *)[_UITabOutlineView alloc], self);
      outlineView = self->_outlineView;
      self->_outlineView = v5;

      WeakRetained = objc_loadWeakRetained((id *)&self->__sidebarViewDelegate);
      v8 = self->_outlineView;
      if (v8)
        objc_storeWeak((id *)&v8->_delegate, WeakRetained);

      -[UIViewController title](self->_tabBarController, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITabOutlineView setTitle:]((id *)&self->_outlineView->super.super.super.isa, v9);

      if (self->_bottomBarView)
        -[_UITabOutlineView updateBottomBarView]((uint64_t)self->_outlineView);
      if (self->__overrideBackgroundEffect)
      {
        -[UITabBarControllerSidebar _outlineView](self, "_outlineView");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITabOutlineView setOverrideBackgroundEffect:]((id *)v3, self->__overrideBackgroundEffect);
        goto LABEL_10;
      }
    }
  }
  return self->_outlineView;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  __int16 v20;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_BYTE *)&self->_delegateImplements = *(_BYTE *)&self->_delegateImplements & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_BYTE *)&self->_delegateImplements = *(_BYTE *)&self->_delegateImplements & 0xFD | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *(_BYTE *)&self->_delegateImplements = *(_BYTE *)&self->_delegateImplements & 0xFB | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 8;
    else
      v7 = 0;
    *(_BYTE *)&self->_delegateImplements = *(_BYTE *)&self->_delegateImplements & 0xF7 | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 16;
    else
      v8 = 0;
    *(_BYTE *)&self->_delegateImplements = *(_BYTE *)&self->_delegateImplements & 0xEF | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 32;
    else
      v9 = 0;
    *(_BYTE *)&self->_delegateImplements = *(_BYTE *)&self->_delegateImplements & 0xDF | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 64;
    else
      v10 = 0;
    *(_BYTE *)&self->_delegateImplements = *(_BYTE *)&self->_delegateImplements & 0xBF | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 0x80;
    else
      v11 = 0;
    *(_BYTE *)&self->_delegateImplements = v11 & 0x80 | *(_BYTE *)&self->_delegateImplements & 0x7F;
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 2;
    else
      v12 = 0;
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xFFFD | v12;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 4;
    else
      v13 = 0;
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xFFFB | v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 8;
    else
      v14 = 0;
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xFFF7 | v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 16;
    else
      v15 = 0;
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xFFEF | v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = 32;
    else
      v16 = 0;
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xFFDF | v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 64;
    else
      v17 = 0;
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xFFBF | v17;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = 128;
    else
      v18 = 0;
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xFF7F | v18;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = 256;
    else
      v19 = 0;
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xFEFF | v19;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = 512;
    else
      v20 = 0;
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xFDFF | v20;
  }

}

- (void)setHidden:(BOOL)a3
{
  -[UITabBarControllerSidebar _setHidden:userInitiated:]((uint64_t)self, a3, 0);
}

- (void)_setHidden:(int)a3 userInitiated:
{
  char v3;
  char v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a1)
  {
    v3 = a2;
    if (*(unsigned __int8 *)(a1 + 32) != a2)
    {
      *(_BYTE *)(a1 + 32) = a2;
      v5 = a3 ? 2 : 0;
      *(_BYTE *)(a1 + 16) = *(_BYTE *)(a1 + 16) & 0xFD | v5;
      -[UITabBarControllerSidebar _visualStyle]((id **)a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "canDisplaySidebar");

      if (v7)
      {
        v12 = (id)objc_opt_new();
        if ((*(_BYTE *)(a1 + 8) & 1) != 0)
        {
          objc_msgSend((id)a1, "delegate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "tabBarController:sidebarVisibilityWillChange:animator:", *(_QWORD *)(a1 + 40), a1, v12);

        }
        -[UITabBarControllerSidebar _visualStyle]((id **)a1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sidebarVisibilityDidChangeWithAnimator:", v12);

        if ((*(_BYTE *)(a1 + 8) & 1) == 0 && (*(_WORD *)(a1 + 12) & 1) != 0)
        {
          objc_msgSend((id)a1, "_delegate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_tabBarController:sidebarVisibilityDidChange:", *(_QWORD *)(a1 + 40), a1);

        }
        if ((v3 & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "viewControllers");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "count");
          _uip_floatingTabBar_sendAnalyticsEvent();

        }
      }
    }
  }
}

- (id)_visualStyle
{
  if (a1)
  {
    -[UITabBarController _visualStyle](a1[5]);
    a1 = (id **)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)setPreferredLayout:(int64_t)a3
{
  uint64_t v5;
  id v6;

  v5 = -[UITabBarControllerSidebar _resolvedLayout]((uint64_t)self);
  self->_preferredLayout = a3;
  if (v5 != -[UITabBarControllerSidebar _resolvedLayout]((uint64_t)self))
  {
    -[UITabBarControllerSidebar _visualStyle]((id **)self);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sidebarLayoutDidChange");

  }
}

- (uint64_t)_resolvedLayout
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    result = objc_msgSend((id)result, "preferredLayout");
    if (!result)
    {
      objc_msgSend(*(id *)(v1 + 40), "traitCollection");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "userInterfaceIdiom");

      if ((unint64_t)(v3 - 5) >= 2)
        return 1;
      else
        return 2;
    }
  }
  return result;
}

- (UIContentConfiguration)headerContentConfiguration
{
  return (UIContentConfiguration *)(id)-[UIContentConfiguration copyWithZone:](self->_headerContentConfiguration, "copyWithZone:", 0);
}

- (void)setHeaderContentConfiguration:(id)a3
{
  id v4;
  UIContentConfiguration *headerContentConfiguration;
  UIContentConfiguration *v6;
  UIContentConfiguration *v7;
  id *v8;
  char v9;
  UIContentConfiguration *v10;
  UIContentConfiguration *v11;
  UIContentConfiguration *v12;

  v4 = a3;
  headerContentConfiguration = self->_headerContentConfiguration;
  v12 = (UIContentConfiguration *)v4;
  v6 = headerContentConfiguration;
  v7 = v12;
  v8 = (id *)v12;
  if (v6 != v12)
  {
    if (v12 && v6)
    {
      v9 = -[UIContentConfiguration isEqual:](v12, "isEqual:", v6);

      if ((v9 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    v7 = self->_headerContentConfiguration;
    v10 = (UIContentConfiguration *)-[UIContentConfiguration copyWithZone:](v12, "copyWithZone:", 0);
    v11 = self->_headerContentConfiguration;
    self->_headerContentConfiguration = v10;

    -[UITabBarControllerSidebar _outlineView](self, "_outlineView");
    v8 = (id *)objc_claimAutoreleasedReturnValue();
    -[_UITabOutlineView headerContentConfigurationDidChange:](v8, (uint64_t)v7);
  }

LABEL_9:
}

- (UIContentConfiguration)footerContentConfiguration
{
  return (UIContentConfiguration *)(id)-[UIContentConfiguration copyWithZone:](self->_footerContentConfiguration, "copyWithZone:", 0);
}

- (void)setFooterContentConfiguration:(id)a3
{
  id v4;
  UIContentConfiguration *footerContentConfiguration;
  UIContentConfiguration *v6;
  UIContentConfiguration *v7;
  id *v8;
  char v9;
  UIContentConfiguration *v10;
  UIContentConfiguration *v11;
  UIContentConfiguration *v12;

  v4 = a3;
  footerContentConfiguration = self->_footerContentConfiguration;
  v12 = (UIContentConfiguration *)v4;
  v6 = footerContentConfiguration;
  v7 = v12;
  v8 = (id *)v12;
  if (v6 != v12)
  {
    if (v12 && v6)
    {
      v9 = -[UIContentConfiguration isEqual:](v12, "isEqual:", v6);

      if ((v9 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    v7 = self->_footerContentConfiguration;
    v10 = (UIContentConfiguration *)-[UIContentConfiguration copyWithZone:](v12, "copyWithZone:", 0);
    v11 = self->_footerContentConfiguration;
    self->_footerContentConfiguration = v10;

    -[UITabBarControllerSidebar _outlineView](self, "_outlineView");
    v8 = (id *)objc_claimAutoreleasedReturnValue();
    -[_UITabOutlineView footerContentConfigurationDidChange:](v8, (uint64_t)v7);
  }

LABEL_9:
}

- (UIView)bottomBarView
{
  if ((*(_BYTE *)&self->_sidebarFlags & 1) != 0)
    return self->_bottomBarView;
  else
    return (UIView *)0;
}

- (void)setBottomBarView:(id)a3
{
  UIView *v6;
  NSUInteger v7;
  void *v8;
  void *v9;
  UIView *v10;

  v6 = (UIView *)a3;
  v10 = v6;
  if (v6)
  {
    v7 = -[NSArray count](self->_toolbarItems, "count");
    v6 = v10;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabBarControllerSidebar.m"), 249, CFSTR("Setting a bottomBarView alongside _toolbarItems is not suppported"));

      v6 = v10;
    }
  }
  if (self->_bottomBarView != v6)
  {
    *(_BYTE *)&self->_sidebarFlags = *(_BYTE *)&self->_sidebarFlags & 0xFE | (v6 != 0);
    objc_storeStrong((id *)&self->_bottomBarView, a3);
    -[UITabBarControllerSidebar _outlineView](self, "_outlineView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITabOutlineView updateBottomBarView]((uint64_t)v8);

    v6 = v10;
  }

}

- (id)_actualHeaderContentConfiguration
{
  if (a1)
    a1 = (id *)a1[7];
  return a1;
}

- (void)reconfigureItemForTab:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITabBarControllerSidebar _outlineView](self, "_outlineView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITabOutlineView reconfigureItemForTab:](v5, (uint64_t)v4);

}

- (void)scrollToTarget:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id *v7;

  v4 = a4;
  v6 = a3;
  -[UITabBarControllerSidebar _outlineView](self, "_outlineView");
  v7 = (id *)objc_claimAutoreleasedReturnValue();
  -[_UITabOutlineView scrollToTarget:animated:](v7, v6, v4);

}

- (void)_setSidebarViewDelegate:(uint64_t)a1
{
  id *v3;
  uint64_t v4;
  id obj;

  if (a1)
  {
    v3 = (id *)(a1 + 104);
    obj = a2;
    objc_storeWeak(v3, obj);
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      objc_storeWeak((id *)(v4 + 432), obj);

  }
}

- (uint64_t)_isSidebarSupportedAndVisible
{
  void *v3;
  uint64_t v4;

  if (!a1 || (objc_msgSend(a1, "isHidden") & 1) != 0)
    return 0;
  -[UITabBarControllerSidebar _visualStyle]((id **)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canDisplaySidebar");

  return v4;
}

- (void)_willDisplayTab:(uint64_t)a1
{
  void *v3;
  id v4;

  v4 = a2;
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 8) & 0x40) != 0)
    {
      objc_msgSend((id)a1, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "tabBarController:sidebar:willBeginDisplayingTab:", *(_QWORD *)(a1 + 40), a1, v4);
      goto LABEL_6;
    }
    if ((*(_WORD *)(a1 + 12) & 0x100) != 0)
    {
      objc_msgSend((id)a1, "_delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_tabBarController:sidebar:willBeginDisplayingTab:", *(_QWORD *)(a1 + 40), a1, v4);
LABEL_6:

    }
  }

}

- (void)_didEndDisplayingTab:(uint64_t)a1
{
  void *v3;
  id v4;

  v4 = a2;
  if (a1)
  {
    if (*(char *)(a1 + 8) < 0)
    {
      objc_msgSend((id)a1, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "tabBarController:sidebar:didEndDisplayingTab:", *(_QWORD *)(a1 + 40), a1, v4);
      goto LABEL_6;
    }
    if ((*(_WORD *)(a1 + 12) & 0x200) != 0)
    {
      objc_msgSend((id)a1, "_delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_tabBarController:sidebar:didEndDisplayingTab:", *(_QWORD *)(a1 + 40), a1, v4);
LABEL_6:

    }
  }

}

- (id)_sidebarItemForRequest:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (!a1)
  {
    v4 = 0;
    goto LABEL_8;
  }
  if ((*(_BYTE *)(a1 + 8) & 2) != 0)
  {
    objc_msgSend((id)a1, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tabBarController:sidebar:itemForRequest:", *(_QWORD *)(a1 + 40), a1, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

    goto LABEL_8;
  }
  if ((*(_WORD *)(a1 + 12) & 8) != 0)
  {
    +[UITabSidebarItem itemFromRequest:](_UITabSidebarItem, "itemFromRequest:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "_delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_tabBarController:sidebar:configureItem:", *(_QWORD *)(a1 + 40), a1, v4);
    goto LABEL_7;
  }
  +[UITabSidebarItem itemFromRequest:](UITabSidebarItem, "itemFromRequest:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v4;
}

- (id)_updatedSidebarItem:(id)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_12;
  if ((*((_BYTE *)a1 + 8) & 4) != 0)
  {
    v5 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(a1, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tabBarController:sidebar:updateItem:", *((_QWORD *)a1 + 5), a1, v5);
LABEL_7:

    goto LABEL_8;
  }
  if ((*((_WORD *)a1 + 6) & 0x10) != 0)
  {
    v5 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(a1, "_delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_tabBarController:sidebar:updateItem:", *((_QWORD *)a1 + 5), a1, v5);
    goto LABEL_7;
  }
  v5 = 0;
LABEL_8:
  if (v5)
    v7 = v5;
  else
    v7 = v4;
  a1 = v7;

LABEL_12:
  return a1;
}

- (id)_leadingSwipeActionsConfigurationForTab:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__leadingSwipeActionsConfigurationForTab_, a1, CFSTR("UITabBarControllerSidebar.m"), 351, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tab != nil"));

    }
    if ((*(_BYTE *)(a1 + 8) & 8) != 0)
    {
      objc_msgSend((id)a1, "_delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tabBarController:sidebar:leadingSwipeActionsConfigurationForTab:", *(_QWORD *)(a1 + 40), a1, v4);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((*(_WORD *)(a1 + 12) & 0x20) == 0)
      {
        a1 = 0;
        goto LABEL_10;
      }
      objc_msgSend((id)a1, "_delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_tabBarController:sidebar:leadingSwipeActionsConfigurationForTab:", *(_QWORD *)(a1 + 40), a1, v4);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    a1 = v6;

  }
LABEL_10:

  return (id)a1;
}

- (id)_trailingSwipeActionsConfigurationForTab:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__trailingSwipeActionsConfigurationForTab_, a1, CFSTR("UITabBarControllerSidebar.m"), 363, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tab != nil"));

    }
    if ((*(_BYTE *)(a1 + 8) & 0x10) != 0)
    {
      objc_msgSend((id)a1, "_delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tabBarController:sidebar:trailingSwipeActionsConfigurationForTab:", *(_QWORD *)(a1 + 40), a1, v4);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((*(_WORD *)(a1 + 12) & 0x40) == 0)
      {
        a1 = 0;
        goto LABEL_10;
      }
      objc_msgSend((id)a1, "_delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_tabBarController:sidebar:trailingSwipeActionsConfigurationForTab:", *(_QWORD *)(a1 + 40), a1, v4);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    a1 = v6;

  }
LABEL_10:

  return (id)a1;
}

- (id)_contextMenuConfigurationForTab:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 8) & 0x20) != 0)
    {
      objc_msgSend((id)a1, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "tabBarController:sidebar:contextMenuConfigurationForTab:", *(_QWORD *)(a1 + 40), a1, v3);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((*(_WORD *)(a1 + 12) & 0x80) == 0)
      {
        a1 = 0;
        goto LABEL_8;
      }
      objc_msgSend((id)a1, "_delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_tabBarController:sidebar:contextMenuConfigurationForTab:", *(_QWORD *)(a1 + 40), a1, v3);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    a1 = v5;

  }
LABEL_8:

  return (id)a1;
}

- (BOOL)_isVisible
{
  return !-[UITabBarControllerSidebar isHidden](self, "isHidden");
}

- (void)_setVisible:(BOOL)a3
{
  -[UITabBarControllerSidebar setHidden:](self, "setHidden:", !a3);
}

- (void)_scrollToHeaderAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  +[UITabSidebarScrollTarget targetForHeader](UITabSidebarScrollTarget, "targetForHeader");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UITabBarControllerSidebar scrollToTarget:animated:](self, "scrollToTarget:animated:", v5, v3);

}

- (void)_scrollToTab:(id)a3 atPosition:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a5;
  +[UITabSidebarScrollTarget targetForTab:](UITabSidebarScrollTarget, "targetForTab:", a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UITabBarControllerSidebar scrollToTarget:animated:](self, "scrollToTarget:animated:", v7, v5);

}

- (id)_customizationIdentifier
{
  if (self)
    self = (UITabBarControllerSidebar *)self->_tabBarController;
  return (id)-[UITabBarControllerSidebar customizationIdentifier](self, "customizationIdentifier");
}

- (void)_setCustomizationIdentifier:(id)a3
{
  if (self)
    self = (UITabBarControllerSidebar *)self->_tabBarController;
  -[UITabBarControllerSidebar setCustomizationIdentifier:](self, "setCustomizationIdentifier:", a3);
}

- (BOOL)_isEditing
{
  if (self)
    self = (UITabBarControllerSidebar *)self->_tabBarController;
  return -[UITabBarControllerSidebar isEditing](self, "isEditing");
}

- (void)_setEditing:(BOOL)a3
{
  if (self)
    self = (UITabBarControllerSidebar *)self->_tabBarController;
  -[UITabBarControllerSidebar setEditing:](self, "setEditing:", a3);
}

- (void)_editingStateDidChange:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    if ((*(_WORD *)(a1 + 12) & 2) != 0)
    {
      objc_msgSend((id)a1, "_delegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_tabbarController:sidebar:editingStateDidChange:", *(_QWORD *)(a1 + 40), a1, a2);

    }
  }
}

- (void)_visibilityDidChangeForTabs:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (a1 && (*(_WORD *)(a1 + 12) & 4) != 0)
  {
    v5 = v3;
    objc_msgSend((id)a1, "_delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_tabBarController:sidebar:visibilityDidChangeForTabs:", *(_QWORD *)(a1 + 40), a1, v5);

    v3 = v5;
  }

}

- (id)_toolbarItems
{
  return self->_toolbarItems;
}

- (void)_setToolbarItems:(id)a3
{
  id v5;
  NSArray *toolbarItems;
  NSArray *v7;
  char v8;
  NSArray *v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  UIView *v13;
  UIToolbar *v14;
  void *v15;
  UIView *bottomBarView;
  UIView *v17;
  void *v18;
  NSArray *v19;

  v5 = a3;
  toolbarItems = self->_toolbarItems;
  v19 = (NSArray *)v5;
  v7 = toolbarItems;
  if (v7 == v19)
  {

    v10 = v19;
  }
  else
  {
    if (v19 && v7)
    {
      v8 = -[NSArray isEqual:](v19, "isEqual:", v7);

      v9 = v19;
      if ((v8 & 1) != 0)
        goto LABEL_19;
    }
    else
    {

      v9 = v19;
    }
    v11 = (NSArray *)-[NSArray copy](v9, "copy");
    v12 = self->_toolbarItems;
    self->_toolbarItems = v11;

    if (-[NSArray count](v19, "count") && (*(_BYTE *)&self->_sidebarFlags & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabBarControllerSidebar.m"), 487, CFSTR("Setting _toolbarItems alongside a _bottomBarView is not supported"));

    }
    if (-[NSArray count](v19, "count"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = self->_bottomBarView;
      }
      else
      {
        v14 = [UIToolbar alloc];
        -[UITabBarControllerSidebar _outlineView](self, "_outlineView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "frame");
        v13 = -[UIToolbar initWithFrame:](v14, "initWithFrame:", 0.0, 0.0);

      }
      -[UIView setItems:](v13, "setItems:", v19);
    }
    else
    {
      v13 = 0;
    }
    bottomBarView = self->_bottomBarView;
    self->_bottomBarView = v13;
    v17 = v13;

    -[UITabBarControllerSidebar _outlineView](self, "_outlineView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UITabOutlineView updateBottomBarView]((uint64_t)v10);
  }

  v9 = v19;
LABEL_19:

}

- (BOOL)_isEditable
{
  void *v2;
  char v3;

  -[UITabBarControllerSidebar _tabModel](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditable");

  return v3;
}

- (_QWORD)_tabModel
{
  _QWORD *v1;

  if (a1)
  {
    v1 = (_QWORD *)a1[5];
    if (v1)
      v1 = (_QWORD *)v1[144];
    a1 = v1;
  }
  return a1;
}

- (void)_setEditable:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UITabBarControllerSidebar _tabModel](self);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditable:", v3);

}

- (_UITabGroup)_displayedGroup
{
  _QWORD *v2;
  void *v3;
  _UITabGroup *v4;

  -[UITabBarControllerSidebar _outlineView](self, "_outlineView");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v2 = (_QWORD *)v2[56];
  v4 = v2;

  return v4;
}

- (void)_setDisplayedGroup:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITabBarControllerSidebar _outlineView](self, "_outlineView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITabOutlineView setDisplayedGroup:]((uint64_t)v5, v4);

}

- (UITabBarControllerSidebarDelegate)delegate
{
  return (UITabBarControllerSidebarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (int64_t)preferredLayout
{
  return self->_preferredLayout;
}

- (void)set_sidebarView:(id)a3
{
  objc_storeStrong((id *)&self->__sidebarView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__sidebarView, 0);
  objc_storeStrong((id *)&self->__overrideBackgroundEffect, 0);
  objc_destroyWeak((id *)&self->__sidebarViewDelegate);
  objc_storeStrong((id *)&self->__activeTransaction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomBarView, 0);
  objc_storeStrong((id *)&self->_footerContentConfiguration, 0);
  objc_storeStrong((id *)&self->_headerContentConfiguration, 0);
  objc_storeStrong((id *)&self->_outlineView, 0);
  objc_storeStrong((id *)&self->_toolbarItems, 0);
}

@end
