@implementation TSWPEditMenuController

+ (id)p_sharedEditMenuController
{
  if (+[TSWPEditMenuController p_sharedEditMenuController]::onceToken != -1)
    dispatch_once(&+[TSWPEditMenuController p_sharedEditMenuController]::onceToken, &__block_literal_global_59);
  return (id)+[TSWPEditMenuController p_sharedEditMenuController]::sSharedEditMenuController;
}

void __52__TSWPEditMenuController_p_sharedEditMenuController__block_invoke()
{
  TSWPEditMenuController *v0;
  void *v1;

  v0 = objc_alloc_init(TSWPEditMenuController);
  v1 = (void *)+[TSWPEditMenuController p_sharedEditMenuController]::sSharedEditMenuController;
  +[TSWPEditMenuController p_sharedEditMenuController]::sSharedEditMenuController = (uint64_t)v0;

}

+ (int)menuState
{
  _DWORD *v2;
  int v3;

  objc_msgSend(a1, "p_sharedEditMenuController");
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2[2];

  return v3;
}

+ (void)showEditMenuAtTargetRect:(CGRect)a3 canCenterHUD:(BOOL)a4 interactiveCanvasController:(id)a5
{
  _BOOL4 v5;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double MinY;
  double v23;
  double MaxY;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  CGFloat v39;
  CGFloat v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v5 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v38 = a5;
  objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "visibleBoundsRectClippedToWindow");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  v50.origin.x = v13;
  v50.origin.y = v15;
  v50.size.width = v17;
  v50.size.height = v19;
  v42 = CGRectIntersection(v41, v50);
  v39 = v42.origin.x;
  v40 = v42.size.height;
  v20 = v42.origin.y;
  v21 = v42.size.width;
  objc_msgSend(v11, "setArrowDirection:", 0);
  v43.origin.x = v39;
  v43.size.height = v40;
  v43.origin.y = v20;
  v43.size.width = v21;
  MinY = CGRectGetMinY(v43);
  v44.origin.x = v13;
  v44.origin.y = v15;
  v44.size.width = v17;
  v44.size.height = v19;
  v23 = CGRectGetMinY(v44);
  v45.origin.x = v13;
  v45.origin.y = v15;
  v45.size.width = v17;
  v45.size.height = v19;
  MaxY = CGRectGetMaxY(v45);
  v46.origin.x = v39;
  v46.size.height = v40;
  v46.origin.y = v20;
  v46.size.width = v21;
  v25 = CGRectGetMaxY(v46);
  v26 = MinY - v23;
  v27 = MaxY - v25;
  if (MinY - v23 < 55.0 || v27 < 55.0)
  {
    if (v26 >= 55.0 || v27 >= 55.0)
    {
      if (v26 < 55.0)
        v31 = 1;
      else
        v31 = 2;
      objc_msgSend(v11, "setArrowDirection:", v31);
    }
    else if (v5)
    {
      v28 = TSDCenterOfRect(v39, v20, v21, v40);
      v47.origin.x = TSDRectWithOriginAndSize(v29, v28, v30, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
      v48 = CGRectInset(v47, -0.5, -0.5);
      v39 = v48.origin.x;
      v40 = v48.size.height;
      v20 = v48.origin.y;
      v21 = v48.size.width;
    }
  }
  v49.origin.x = v39;
  v49.size.height = v40;
  v49.origin.y = v20;
  v49.size.width = v21;
  if (CGRectGetHeight(v49) != 0.0)
  {
    if (v21 == 0.0)
      v21 = 1.0;
    objc_msgSend(v38, "layerHost");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "asiOSCVC");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "extraMenuItems");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMenuItems:", v34);

    objc_msgSend(v38, "layerHost");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "canvasView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "p_sharedEditMenuController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTargetRect:", v39, v20, v21, v40);
    objc_msgSend(v37, "setTargetView:", v36);
    objc_msgSend(v37, "p_setMenuVisible:", MEMORY[0x24BDBD1C8]);

  }
}

+ (void)hideEditMenu
{
  id v2;

  objc_msgSend(a1, "p_sharedEditMenuController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "p_setMenuVisible:", MEMORY[0x24BDBD1C0]);

}

+ (BOOL)isAnimating
{
  return (+[TSWPEditMenuController menuState](TSWPEditMenuController, "menuState") & 0xFFFFFFFD) != 0;
}

- (TSWPEditMenuController)init
{
  TSWPEditMenuController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPEditMenuController;
  v2 = -[TSWPEditMenuController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_p_willShowMenu_, *MEMORY[0x24BDF7BB8], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_p_didShowMenu_, *MEMORY[0x24BDF7BA8], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_p_willHideMenu_, *MEMORY[0x24BDF7BB0], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_p_didHideMenu_, *MEMORY[0x24BDF7BA0], 0);
    +[TSKKeyboardMonitor addKeyboardObserver:](TSKKeyboardMonitor, "addKeyboardObserver:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TSWPEditMenuController;
  -[TSWPEditMenuController dealloc](&v4, sel_dealloc);
}

- (void)p_setMenuVisible:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_p_setMenuVisible_, 0);
  if ((self->_menuState | 2) == 3)
  {
    -[TSWPEditMenuController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_p_setMenuVisible_, v7, 0.1);
    goto LABEL_3;
  }
  if ((objc_msgSend(v7, "BOOLValue") & 1) == 0)
  {
    self->_showMenuOnKeyboard = 0;
    if (!self->_menuState)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hideMenu");
LABEL_10:

    goto LABEL_3;
  }
  if (self->_menuState != 2)
  {
    -[TSWPEditMenuController targetView](self, "targetView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSWPEditMenuController targetView](self, "targetView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSWPEditMenuController targetRect](self, "targetRect");
      objc_msgSend(v5, "showMenuFromView:rect:", v6);

      goto LABEL_10;
    }
  }
LABEL_3:

}

- (void)p_willShowMenu:(id)a3
{
  self->_menuState = 1;
}

- (void)p_didShowMenu:(id)a3
{
  self->_menuState = 2;
}

- (void)p_willHideMenu:(id)a3
{
  self->_menuState = 3;
}

- (void)p_didHideMenu:(id)a3
{
  self->_menuState = 0;
}

- (void)p_didAnimateKeyboard
{
  if (self->_showMenuOnKeyboard)
  {
    self->_showMenuOnKeyboard = 0;
    -[TSWPEditMenuController p_setMenuVisible:](self, "p_setMenuVisible:", MEMORY[0x24BDBD1C8]);
  }
}

- (void)p_clearIsBeginningEditing
{
  self->_isBeginningEditing = 0;
}

- (void)setIsBeginningEditing:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_p_clearIsBeginningEditing, 0);
  self->_isBeginningEditing = v3;
  if (v3)
    -[TSWPEditMenuController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_p_clearIsBeginningEditing, 0, 0.25);
}

- (BOOL)showMenuOnKeyboard
{
  return self->_showMenuOnKeyboard;
}

- (void)setShowMenuOnKeyboard:(BOOL)a3
{
  self->_showMenuOnKeyboard = a3;
}

- (BOOL)isBeginningEditing
{
  return self->_isBeginningEditing;
}

- (CGRect)targetRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetRect.origin.x;
  y = self->_targetRect.origin.y;
  width = self->_targetRect.size.width;
  height = self->_targetRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTargetRect:(CGRect)a3
{
  self->_targetRect = a3;
}

- (UIView)targetView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_targetView);
}

- (void)setTargetView:(id)a3
{
  objc_storeWeak((id *)&self->_targetView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_targetView);
}

@end
