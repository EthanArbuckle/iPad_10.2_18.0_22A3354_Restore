@implementation UIWebTiledView

- (void)_updateForScreen:(id)a3
{
  WAKWindow *wakWindow;
  double v6;
  double v7;
  UIWindow *v8;
  UIWindow *v9;
  _BOOL8 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  if (a3)
  {
    wakWindow = self->_wakWindow;
    objc_msgSend(a3, "_referenceBounds");
    -[WAKWindow setScreenSize:](wakWindow, "setScreenSize:", v6, v7);
    if (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle"))
    {
      v8 = -[UIView window](self, "window");
      if (v8)
      {
        v9 = v8;
        if ((objc_msgSend(__UIStatusBarManagerForWindow(v8), "isStatusBarHidden") & 1) != 0)
        {
          v10 = 1;
        }
        else
        {
          objc_msgSend(__UIStatusBarManagerForWindow(v9), "defaultStatusBarHeightInOrientation:", -[UIWindowScene interfaceOrientation](-[UIWindow windowScene](v9, "windowScene"), "interfaceOrientation"));
          v10 = v13 == 0.0;
        }
        -[UIWindow _referenceFrameFromSceneUsingScreenBounds:](v9, "_referenceFrameFromSceneUsingScreenBounds:", v10);
      }
      else
      {
        objc_msgSend(a3, "_mainSceneFrame");
      }
    }
    else
    {
      objc_msgSend(a3, "_applicationFrame");
    }
    -[WAKWindow setAvailableScreenSize:](self->_wakWindow, "setAvailableScreenSize:", v11, v12);
    -[WAKWindow screenScale](self->_wakWindow, "screenScale");
    v15 = v14;
    objc_msgSend(a3, "scale");
    v17 = v16;
    -[WAKWindow setScreenScale:](self->_wakWindow, "setScreenScale:");
    if (v17 != v15)
    {
      -[UIWebTiledView removeAllTiles](self, "removeAllTiles");
      -[UIWebTiledView layoutTilesNow](self, "layoutTilesNow");
    }
  }
}

- (UIWebTiledView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char v8;
  UIWebTiledView *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_opt_self();
  v8 = __invalidatesViewUponCreation;
  objc_opt_self();
  __invalidatesViewUponCreation = 0;
  v11.receiver = self;
  v11.super_class = (Class)UIWebTiledView;
  v9 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  objc_opt_self();
  __invalidatesViewUponCreation = v8;
  if (v9)
  {
    v9->_wakWindow = (WAKWindow *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9720]), "initWithLayer:", -[UIView layer](v9, "layer"));
    -[UIWebTiledView _updateForScreen:](v9, "_updateForScreen:", -[UIView _screen](v9, "_screen"));
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v9, sel__screenChanged_, CFSTR("UIWindowDidMoveToScreenNotification"), 0);
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("UIWindowDidMoveToScreenNotification"), 0);

  v3.receiver = self;
  v3.super_class = (Class)UIWebTiledView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)setWAKWindow:(id)a3
{
  id v5;

  v5 = a3;

  self->_wakWindow = (WAKWindow *)a3;
}

- (CGRect)visibleRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[WAKWindow visibleRect](self->_wakWindow, "visibleRect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)layoutTilesNow
{
  WebThreadLock();
  -[WAKWindow layoutTilesNow](self->_wakWindow, "layoutTilesNow");
}

- (void)layoutTilesNowOnWebThread
{
  -[WAKWindow layoutTilesNow](self->_wakWindow, "layoutTilesNow");
}

- (void)layoutTilesNowForRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WebThreadLock();
  -[WAKWindow layoutTilesNowForRect:](self->_wakWindow, "layoutTilesNowForRect:", x, y, width, height);
}

- (void)drawImageIntoTiles:(CGImage *)a3
{
  _QWORD v5[5];

  WebThreadLock();
  -[WAKWindow setContentReplacementImage:](self->_wakWindow, "setContentReplacementImage:", a3);
  -[WAKWindow removeAllTiles](self->_wakWindow, "removeAllTiles");
  -[WAKWindow layoutTilesNow](self->_wakWindow, "layoutTilesNow");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__UIWebTiledView_drawImageIntoTiles___block_invoke;
  v5[3] = &unk_1E16B41B8;
  v5[4] = self;
  objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v5);
}

uint64_t __37__UIWebTiledView_drawImageIntoTiles___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setContentReplacementImage:", 0);
}

- (void)layoutSubviews
{
  if (self->_didFirstTileLayout && !self->_layoutTilesInMainThread)
  {
    -[WAKWindow layoutTiles](self->_wakWindow, "layoutTiles");
  }
  else
  {
    WebThreadLock();
    -[WAKWindow layoutTilesNow](self->_wakWindow, "layoutTilesNow");
    self->_didFirstTileLayout = 1;
  }
}

- (void)_screenChanged:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(a3, "object"), "isEqual:", -[UIView window](self, "window")))
    -[UIWebTiledView _updateForScreen:](self, "_updateForScreen:", objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("UIWindowNewScreenUserInfoKey")));
}

- (void)willMoveToWindow:(id)a3
{
  uint64_t v5;

  v5 = -[WAKWindow rootLayer](self->_wakWindow, "rootLayer");
  if (a3 && !v5)
    -[UIWebTiledView setNeedsLayout](self, "setNeedsLayout");
  -[UIWebTiledView _updateForScreen:](self, "_updateForScreen:", objc_msgSend(a3, "screen"));
  -[WAKWindow setVisible:](self->_wakWindow, "setVisible:", a3 != 0);
}

- (void)updateTilingMode
{
  int tilingArea;
  unsigned int v3;
  int inGestureType;
  BOOL v7;
  uint64_t v8;

  tilingArea = self->_tilingArea;
  if (tilingArea == 2)
  {
    v3 = 4;
  }
  else if (tilingArea == 3)
  {
    v3 = 5;
  }
  else
  {
    inGestureType = self->_inGestureType;
    v3 = tilingArea == 1;
    if (inGestureType == 8)
      v3 = 2;
    if (inGestureType == 2)
      v3 = 3;
  }
  if (self->_allowsPaintingAndScriptsWhilePanning && v3 != 4 && v3 != 1)
    v3 = 0;
  if (v3)
    v7 = 1;
  else
    v7 = !self->_editingTilingModeEnabled;
  if (v7)
    v8 = v3;
  else
    v8 = 1;
  -[WAKWindow setTilingMode:](self->_wakWindow, "setTilingMode:", v8);
}

- (void)setInGesture:(int)a3
{
  if (self->_inGestureType != a3)
  {
    self->_inGestureType = a3;
    -[UIWebTiledView updateTilingMode](self, "updateTilingMode");
  }
}

- (void)setTilingArea:(int)a3
{
  if (self->_tilingArea != a3)
  {
    self->_tilingArea = a3;
    if (!self->_tilingModeIsLocked)
      -[UIWebTiledView updateTilingMode](self, "updateTilingMode");
  }
}

- (int)tilingArea
{
  return self->_tilingArea;
}

- (void)lockTilingMode
{
  self->_tilingModeIsLocked = 1;
}

- (void)unlockTilingMode
{
  self->_tilingModeIsLocked = 0;
  -[UIWebTiledView updateTilingMode](self, "updateTilingMode");
}

- (BOOL)allowsPaintingAndScriptsWhilePanning
{
  return self->_allowsPaintingAndScriptsWhilePanning;
}

- (void)setAllowsPaintingAndScriptsWhilePanning:(BOOL)a3
{
  if (self->_allowsPaintingAndScriptsWhilePanning != a3)
  {
    self->_allowsPaintingAndScriptsWhilePanning = a3;
    -[UIWebTiledView updateTilingMode](self, "updateTilingMode");
  }
}

- (void)setNeedsLayout
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)UIWebTiledView;
  -[UIView setNeedsLayout](&v2, sel_setNeedsLayout);
}

- (void)_didScroll
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)UIWebTiledView;
  -[UIView setNeedsLayout](&v2, sel_setNeedsLayout);
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  -[WAKWindow setNeedsDisplayInRect:](self->_wakWindow, "setNeedsDisplayInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setNeedsDisplay
{
  -[WAKWindow setNeedsDisplay](self->_wakWindow, "setNeedsDisplay");
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  _OWORD v4[3];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIWebTiledView;
  v3 = *(_OWORD *)&a3->c;
  v4[0] = *(_OWORD *)&a3->a;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->tx;
  -[UIView setTransform:](&v5, sel_setTransform_, v4);
}

- (CGSize)tileSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 512.0;
  v3 = 512.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)drawsGrid
{
  return 0;
}

- (unsigned)maxTileCount
{
  return 1;
}

- (unsigned)adjustedMaxTileCount
{
  return 1;
}

- (BOOL)isTilingEnabled
{
  return 1;
}

- (BOOL)logsTilingChanges
{
  return 0;
}

- (void)setTileDrawingEnabled:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 0;
  else
    v3 = 4;
  -[WAKWindow setTilingMode:](self->_wakWindow, "setTilingMode:", v3);
}

- (BOOL)editingTilingModeEnabled
{
  return self->_editingTilingModeEnabled;
}

- (void)setEditingTilingModeEnabled:(BOOL)a3
{
  if (self->_editingTilingModeEnabled != a3)
  {
    self->_editingTilingModeEnabled = a3;
    -[UIWebTiledView updateTilingMode](self, "updateTilingMode");
  }
}

- (BOOL)tileDrawingEnabled
{
  return 1;
}

- (void)setTilesOpaque:(BOOL)a3
{
  -[WAKWindow setTilesOpaque:](self->_wakWindow, "setTilesOpaque:", a3);
}

- (BOOL)tilesOpaque
{
  return -[WAKWindow tilesOpaque](self->_wakWindow, "tilesOpaque");
}

- (void)setKeepsZoomedOutTiles:(BOOL)a3
{
  -[WAKWindow setKeepsZoomedOutTiles:](self->_wakWindow, "setKeepsZoomedOutTiles:", a3);
}

- (BOOL)keepsZoomedOutTiles
{
  return -[WAKWindow keepsZoomedOutTiles](self->_wakWindow, "keepsZoomedOutTiles");
}

- (void)removeAllNonVisibleTiles
{
  -[WAKWindow removeAllNonVisibleTiles](self->_wakWindow, "removeAllNonVisibleTiles");
}

- (void)removeAllTiles
{
  -[WAKWindow removeAllTiles](self->_wakWindow, "removeAllTiles");
}

- (void)removeForegroundTiles
{
  -[WAKWindow removeForegroundTiles](self->_wakWindow, "removeForegroundTiles");
}

- (void)dumpTiles
{
  -[WAKWindow dumpTiles](self->_wakWindow, "dumpTiles");
}

- (BOOL)layoutTilesInMainThread
{
  return self->_layoutTilesInMainThread;
}

- (void)setLayoutTilesInMainThread:(BOOL)a3
{
  self->_layoutTilesInMainThread = a3;
}

- (id)wakWindow
{
  return self->_wakWindow;
}

@end
