@implementation PXUIFocusTimelineView

- (PXUIFocusTimelineView)init
{
  PXUIFocusTimelineView *v2;
  PXUIFocusTimelineView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXUIFocusTimelineView;
  v2 = -[PXUIFocusTimelineView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PXUIFocusTimelineView _PXUIFocusTimelineView_commonInit](v2, "_PXUIFocusTimelineView_commonInit");
  return v3;
}

- (void)_PXUIFocusTimelineView_commonInit
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTap_);
  objc_msgSend(v3, "setDelegate:", self);
  -[PXUIFocusTimelineView addGestureRecognizer:](self, "addGestureRecognizer:", v3);
  -[PXUIFocusTimelineView setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v3);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (void)_handleTap:(id)a3
{
  objc_msgSend(a3, "locationInView:", self);
  -[PXFocusTimelineView handleEventSelectedAtLocation:](self, "handleEventSelectedAtLocation:");
}

- (id)autoFocusEventMarkerImage
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  CGContext *CurrentContext;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  CGSize v17;
  CGRect v18;

  -[PXUIFocusTimelineView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUIFocusTimelineView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  -[PXUIFocusTimelineView autoFocusMarkerImage](self, "autoFocusMarkerImage");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        v8 = -[PXUIFocusTimelineView autoFocusImageInterfaceStyle](self, "autoFocusImageInterfaceStyle"),
        v7,
        v5 != v8))
  {
    v17.width = 14.0;
    v17.height = 14.0;
    UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resolvedColorWithTraitCollection:", v3);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v11, "CGColor"));

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resolvedColorWithTraitCollection:", v3);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v13, "CGColor"));

    CGContextSetLineWidth(CurrentContext, 1.0);
    v18.origin.x = 4.0;
    v18.origin.y = 4.0;
    v18.size.width = 6.0;
    v18.size.height = 6.0;
    CGContextAddEllipseInRect(CurrentContext, v18);
    CGContextDrawPath(CurrentContext, kCGPathFillStroke);
    CGContextRestoreGState(CurrentContext);
    UIGraphicsGetImageFromCurrentImageContext();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIFocusTimelineView setAutoFocusMarkerImage:](self, "setAutoFocusMarkerImage:", v14);

    UIGraphicsEndImageContext();
    -[PXUIFocusTimelineView setAutoFocusImageInterfaceStyle:](self, "setAutoFocusImageInterfaceStyle:", v5);
  }
  -[PXUIFocusTimelineView autoFocusMarkerImage](self, "autoFocusMarkerImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)userInitiatedFocusEventMarkerImage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("cinematic_focus_point_manual"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (UIImage)autoFocusMarkerImage
{
  return self->_autoFocusMarkerImage;
}

- (void)setAutoFocusMarkerImage:(id)a3
{
  objc_storeStrong((id *)&self->_autoFocusMarkerImage, a3);
}

- (int64_t)autoFocusImageInterfaceStyle
{
  return self->_autoFocusImageInterfaceStyle;
}

- (void)setAutoFocusImageInterfaceStyle:(int64_t)a3
{
  self->_autoFocusImageInterfaceStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoFocusMarkerImage, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
}

@end
