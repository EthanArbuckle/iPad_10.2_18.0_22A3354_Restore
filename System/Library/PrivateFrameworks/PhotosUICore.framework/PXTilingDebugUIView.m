@implementation PXTilingDebugUIView

- (PXTilingDebugUIView)init
{
  PXTilingDebugUIView *v2;
  PXTilingDebugUIView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXTilingDebugUIView;
  v2 = -[PXTilingDebugUIView init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_debugWidth = 100.0;
    -[PXTilingDebugUIView setOpaque:](v2, "setOpaque:", 0);
    -[PXTilingDebugUIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  }
  return v3;
}

- (void)_setDebugInfo:(id)a3
{
  PXTilingControllerDebugInfo *v5;
  PXTilingControllerDebugInfo *v6;

  v5 = (PXTilingControllerDebugInfo *)a3;
  if (self->__debugInfo != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__debugInfo, a3);
    -[PXTilingDebugUIView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (void)tilingControllerDidUpdateDebugInfo:(id)a3
{
  id v4;

  objc_msgSend(a3, "debugInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXTilingDebugUIView _setDebugInfo:](self, "_setDebugInfo:", v4);

}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGContextRef CurrentContext;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  -[PXTilingDebugUIView _debugInfo](self, "_debugInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "drawInRect:inContext:", CurrentContext, x, y, width, height);

}

- (PXTilingControllerDebugInfo)_debugInfo
{
  return self->__debugInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__debugInfo, 0);
}

@end
