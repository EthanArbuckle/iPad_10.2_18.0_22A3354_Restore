@implementation UIDebuggingZoomLoupeView

- (UIDebuggingZoomLoupeView)initWithFrame:(CGRect)a3
{
  UIDebuggingZoomLoupeView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIDebuggingZoomLoupeView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  CGImage *v39;
  _QWORD *ContextStack;
  CGContext *v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat width;
  CGFloat height;
  void *v46;
  void *v47;
  double v48;
  CGFloat v49;
  double v50;
  id v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  -[UIView window](self, "window", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_referenceBounds");
  v7 = v6;
  v9 = v8;

  -[UIView window](self, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "inspectedWindow");
    v51 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v51, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView frame](self, "frame");
    objc_msgSend(v13, "convertRect:toLayer:", 0);
    v15 = v14;
    v17 = v16;

    v18 = v15 / 1.2;
    v19 = v17 / 1.2;
    -[UIDebuggingZoomLoupeView currentlyInspectedPoint](self, "currentlyInspectedPoint");
    v21 = v20 - v18 * 0.5;
    -[UIDebuggingZoomLoupeView currentlyInspectedPoint](self, "currentlyInspectedPoint");
    v23 = v22 - v17 / 1.2 * 0.5;
    v24 = v18 + v21;
    v25 = v18 * 0.2 * 0.5;
    v26 = v7 + v25;
    v27 = -v25;
    v28 = 0.0;
    if (v21 >= -v25)
    {
      v28 = v21;
      v27 = v21;
    }
    v29 = v7 - v18 + v25;
    if (v24 > v26)
      v30 = v7 - v18;
    else
      v30 = v28;
    if (v24 > v26)
      v31 = v29;
    else
      v31 = v27;
    v32 = v19 * 0.2 * 0.5;
    if (v19 + v23 <= v9 + v32)
    {
      v34 = -v32;
      v33 = v23;
      if (v23 < v34)
      {
        v23 = 0.0;
        v33 = v34;
      }
    }
    else
    {
      v23 = v9 - v19;
      v33 = v9 - v19 + v32;
    }
    -[UIDebuggingZoomLoupeView currentlyInspectedPoint](self, "currentlyInspectedPoint");
    v50 = (v35 - v30) * 1.2;
    -[UIDebuggingZoomLoupeView currentlyInspectedPoint](self, "currentlyInspectedPoint");
    v37 = (v36 - v23) * 1.2;
    -[UIDebuggingZoomLoupeView delegate](self, "delegate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (CGImage *)objc_msgSend(v38, "newCaptureSnapshotAtRect:window:", v51, v31, v33, v18, v19);

    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1)
      v41 = 0;
    else
      v41 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    CGContextSaveGState(v41);
    v42 = *MEMORY[0x1E0C9D538];
    v43 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[UIView frame](self, "frame");
    width = v52.size.width;
    height = v52.size.height;
    v52.origin.x = v42;
    v52.origin.y = v43;
    CGContextClipToRect(v41, v52);
    CGContextScaleCTM(v41, 1.2, 1.2);
    CGContextTranslateCTM(v41, fabs(v18) * -0.1, fabs(v19) * -0.1);
    CGContextTranslateCTM(v41, 0.0, height);
    CGContextScaleCTM(v41, 1.0, -1.0);
    v53.origin.x = v42;
    v53.origin.y = v43;
    v53.size.width = width;
    v53.size.height = height;
    CGContextDrawImage(v41, v53, v39);
    CGImageRelease(v39);
    CGContextRestoreGState(v41);
    CGContextSaveGState(v41);
    +[UIColor redColor](UIColor, "redColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "set");

    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "scale");
    v49 = 1.0 / v48;

    v54.origin.x = v50 + -2.0;
    v54.origin.y = v37 + -2.0;
    v54.size.width = 4.0;
    v54.size.height = 4.0;
    CGContextStrokeRectWithWidth(v41, v54, v49);
    CGContextRestoreGState(v41);

  }
}

- (void)setCurrentlyInspectedPoint:(CGPoint)a3
{
  self->_currentlyInspectedPoint = a3;
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

- (CGPoint)currentlyInspectedPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentlyInspectedPoint.x;
  y = self->_currentlyInspectedPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (UIDebuggingZoomDelegate)delegate
{
  return (UIDebuggingZoomDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
