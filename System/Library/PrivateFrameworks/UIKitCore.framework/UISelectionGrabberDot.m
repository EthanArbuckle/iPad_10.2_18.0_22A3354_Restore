@implementation UISelectionGrabberDot

- (UISelectionGrabberDot)initWithFrame:(CGRect)a3 container:(id)a4
{
  UISelectionGrabberDot *v4;
  UISelectionGrabberDot *v5;
  UISelectionGrabberDot *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UISelectionGrabberDot;
  v4 = -[UIImageView initWithFrame:](&v8, sel_initWithFrame_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[UIImageView setContentMode:](v4, "setContentMode:", 0);
    v6 = v5;
  }

  return v5;
}

- (id)_rasterizedDotImageForScale:(double)a3
{
  double v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  void *v39;
  int v40;
  double v41;
  void *v42;
  int v43;
  void *v44;
  int v45;
  double v46;
  void *v47;
  int v48;

  -[UIView bounds](self, "bounds");
  v6 = v5;
  -[UIView bounds](self, "bounds");
  v8 = v7;
  if (v6 != 0.0 || v7 != 0.0)
  {
    _UIGraphicsBeginImageContextWithOptions(0, 0, v6, v7, a3);
    +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISelectionGrabberDot grabber](self, "grabber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hostView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "container");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v13, "selectionBarColor");
    else
      +[UIColor selectionGrabberColor](UIColor, "selectionGrabberColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "set");
    objc_msgSend(v10, "fill");
    -[UISelectionGrabberDot grabber](self, "grabber");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "customPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      goto LABEL_23;
    -[UISelectionGrabberDot grabber](self, "grabber");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView window](self, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[UISelectionGrabberDot grabber](self, "grabber");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    -[UISelectionGrabberDot grabber](self, "grabber");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "superview");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 == v19)
      -[UIView convertRect:fromView:](self, "convertRect:fromView:", v30, v22, v24, v26, v28);
    else
      -[UIView convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", v30, v22, v24, v26, v28);
    v35 = v31;
    v36 = v32;
    v37 = v33;
    v38 = v34;

    -[UISelectionGrabberDot grabber](self, "grabber");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "isPointedDown");

    if (v40)
    {
      -[UIView size](self, "size");
      v36 = v41 + -1.0;
    }
    else
    {
      -[UISelectionGrabberDot grabber](self, "grabber");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "isPointedUp");

      if (!v43)
      {
        -[UISelectionGrabberDot grabber](self, "grabber");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "isPointedRight");

        if (v45)
        {
          -[UIView size](self, "size");
          v35 = v46 + -1.0;
        }
        else
        {
          -[UISelectionGrabberDot grabber](self, "grabber");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "isPointedLeft");

          if (!v48)
          {
            v35 = *MEMORY[0x1E0C9D648];
            v36 = *(double *)(MEMORY[0x1E0C9D648] + 8);
            v37 = *(double *)(MEMORY[0x1E0C9D648] + 16);
            v38 = *(double *)(MEMORY[0x1E0C9D648] + 24);
            goto LABEL_22;
          }
          v35 = 0.0;
        }
        v37 = 1.0;
LABEL_22:
        UIRectFillUsingOperation(1, v35, v36, v37, v38);
LABEL_23:
        _UIGraphicsGetImageFromCurrentImageContext(0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();

        return v9;
      }
      v36 = 0.0;
    }
    v38 = 1.0;
    goto LABEL_22;
  }
  v9 = 0;
  return v9;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[UISelectionGrabberDot _extendedHitTestingRectWithEvent:includingCalloutBarAdjustments:](self, "_extendedHitTestingRectWithEvent:includingCalloutBarAdjustments:", a4, 0);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (CGRect)_extendedHitTestingRectWithEvent:(id)a3 includingCalloutBarAdjustments:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[UISelectionGrabberDot _extendedHitTestingRectWithPrecision:includingCalloutBarAdjustments:](self, "_extendedHitTestingRectWithPrecision:includingCalloutBarAdjustments:", objc_msgSend(a3, "_inputPrecision"), a4);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_extendedHitTestingRectWithPrecision:(unint64_t)a3 includingCalloutBarAdjustments:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double x;
  double y;
  double width;
  double height;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  double v29;
  int v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect v36;
  CGRect v37;
  CGRect result;

  v4 = a4;
  -[UIView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (a3 == 2)
    v15 = -6.0;
  else
    v15 = -15.0;
  -[UIView _scaleFromLayerTransforms](self, "_scaleFromLayerTransforms");
  if (v16 < 1.0)
    v16 = 1.0;
  if (v17 < 1.0)
    v17 = 1.0;
  v18 = v15 / v16;
  v19 = v15 / v17;
  v36.origin.x = v8;
  v36.origin.y = v10;
  v36.size.width = v12;
  v36.size.height = v14;
  v37 = CGRectInset(v36, v18, v19);
  x = v37.origin.x;
  y = v37.origin.y;
  width = v37.size.width;
  height = v37.size.height;
  if (v4)
  {
    -[UISelectionGrabberDot grabber](self, "grabber");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isVertical");

    -[UISelectionGrabberDot grabber](self, "grabber");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v25)
    {
      height = height + v19;
      v28 = objc_msgSend(v26, "isPointedDown");

      v29 = 0.0;
      if (v28)
        v29 = v19;
      y = y - v29;
    }
    else
    {
      width = width + v18;
      v30 = objc_msgSend(v26, "isPointedLeft");

      v31 = 0.0;
      if (v30)
        v31 = v18;
      x = x - v31;
    }
  }
  v32 = x;
  v33 = y;
  v34 = width;
  v35 = height;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  CGPoint v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  -[UISelectionGrabberDot _extendedHitTestingRectWithEvent:includingCalloutBarAdjustments:](self, "_extendedHitTestingRectWithEvent:includingCalloutBarAdjustments:", a4, 1);
  v12.x = x;
  v12.y = y;
  if (CGRectContainsPoint(v13, v12))
  {
    -[UISelectionGrabberDot grabber](self, "grabber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hostView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(v8, "isUserInteractionEnabled"))
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

- (int)textEffectsVisibilityLevelInKeyboardWindow
{
  return 11;
}

- (int)textEffectsVisibilityLevel
{
  return 11;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  -[UIView window](self, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertRect:toView:", self, 0.0, 0.0, 1.0, 1.0);
  v14 = v13;

  if (v14 == 1.0)
  {
    -[UIView window](self, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    x = pixelAlignedRectForRect(v15);
    y = v16;
    width = v17;
    height = v18;

  }
  v19.receiver = self;
  v19.super_class = (Class)UISelectionGrabberDot;
  -[UIImageView setFrame:](&v19, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
    -[UISelectionGrabberDot redrawRasterizedImageForScale:](self, "redrawRasterizedImageForScale:", 1.0);
}

- (void)redrawRasterizedImageForScale:(double)a3
{
  double v5;
  void *v6;

  -[UIView _currentScreenScale](self, "_currentScreenScale");
  -[UISelectionGrabberDot _rasterizedDotImageForScale:](self, "_rasterizedDotImageForScale:", v5 * a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self, "setImage:", v6);

  -[UIImageView setContentScaleFactor:](self, "setContentScaleFactor:", 1.0);
}

- (UISelectionGrabber)grabber
{
  return (UISelectionGrabber *)objc_loadWeakRetained((id *)&self->m_grabber);
}

- (void)setGrabber:(id)a3
{
  objc_storeWeak((id *)&self->m_grabber, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->m_grabber);
}

@end
