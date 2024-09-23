@implementation UIRoundedRectButton

+ (Class)_visualProviderClassForIdiom:(int64_t)a3
{
  return (Class)objc_opt_class();
}

- (UIRoundedRectButton)initWithFrame:(CGRect)a3
{
  return -[UIRoundedRectButton initWithFrame:fillColor:](self, "initWithFrame:fillColor:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIRoundedRectButton)initWithFrame:(CGRect)a3 fillColor:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  UIRoundedRectButton *v11;
  UIRoundedRectButton *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIRoundedRectButton;
  v11 = -[UIButton initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
    objc_storeStrong((id *)&v11->_fillColor, a4);

  return v12;
}

- (BOOL)_canDrawContent
{
  return 0;
}

- (id)_contentBackgroundColor
{
  UIColor *fillColor;

  fillColor = self->_fillColor;
  if (fillColor)
    return fillColor;
  +[UIColor whiteColor](UIColor, "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateState
{
  id v3;
  id v4;

  if (-[UIRoundedRectButton _canDrawContent](self, "_canDrawContent"))
  {
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
  else
  {
    -[UIButton _visualProvider](self, "_visualProvider");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v4, "_setupBackgroundView");

  }
}

- (void)_invalidatePaths
{
  UIBezierPath *fillPath;

  fillPath = self->_fillPath;
  if (fillPath)
  {
    self->_fillPath = 0;

  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIRoundedRectButton _invalidatePaths](self, "_invalidatePaths");
  v8.receiver = self;
  v8.super_class = (Class)UIRoundedRectButton;
  -[UIButton setFrame:](&v8, sel_setFrame_, x, y, width, height);
  -[UIRoundedRectButton _updateState](self, "_updateState");
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIRoundedRectButton _invalidatePaths](self, "_invalidatePaths");
  v8.receiver = self;
  v8.super_class = (Class)UIRoundedRectButton;
  -[UIButton setBounds:](&v8, sel_setBounds_, x, y, width, height);
  -[UIRoundedRectButton _updateState](self, "_updateState");
}

- (int64_t)buttonType
{
  return 1;
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIRoundedRectButton;
  -[UIButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[UIRoundedRectButton _updateState](self, "_updateState");
}

- (void)setTintColor:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  -[UIView tintColor](self, "tintColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIRoundedRectButton;
    -[UIButton setTintColor:](&v6, sel_setTintColor_, v4);
    if (-[UIControl isHighlighted](self, "isHighlighted")
      || !-[UIRoundedRectButton _canDrawContent](self, "_canDrawContent"))
    {
      -[UIRoundedRectButton _updateState](self, "_updateState");
    }
  }

}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v8;
  void *v9;
  UIColor *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  UIColor *v14;
  void *v15;
  UIColor *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  _QWORD *ContextStack;
  CGContext *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  UIColor *fillColor;
  void *v38;
  uint64_t v39;
  _QWORD *v40;
  CGContext *v41;
  void *v42;
  void *v43;
  _QWORD *v44;
  CGContext *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  UIColor *v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!_MergedGlobals_33_0)
  {
    +[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)_MergedGlobals_33_0;
    _MergedGlobals_33_0 = v8;

    v10 = -[UIColor initWithWhite:alpha:]([UIColor alloc], "initWithWhite:alpha:", 0.6, 0.94);
    v11 = (void *)qword_1ECD79230;
    qword_1ECD79230 = (uint64_t)v10;

    +[UIColor tableSelectionColor](UIColor, "tableSelectionColor");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)qword_1ECD79238;
    qword_1ECD79238 = v12;

    v14 = -[UIColor initWithRed:green:blue:alpha:]([UIColor alloc], "initWithRed:green:blue:alpha:", 0.17, 0.26, 0.37, 0.94);
    v15 = (void *)qword_1ECD79240;
    qword_1ECD79240 = (uint64_t)v14;

    v16 = -[UIColor initWithRed:green:blue:alpha:]([UIColor alloc], "initWithRed:green:blue:alpha:", 0.17, 0.26, 0.37, 0.75);
    v17 = (void *)qword_1ECD79248;
    qword_1ECD79248 = (uint64_t)v16;

  }
  -[UIView bounds](self, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "userInterfaceIdiom");

  if ((v27 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (!-[UIView clearsContextBeforeDrawing](self, "clearsContextBeforeDrawing"))
    {
      ContextStack = GetContextStack(0);
      if (*(int *)ContextStack < 1)
        v29 = 0;
      else
        v29 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      v57.origin.x = x;
      v57.origin.y = y;
      v57.size.width = width;
      v57.size.height = height;
      CGContextClearRect(v29, v57);
    }
    v25 = v25 + -1.0;
  }
  v58.origin.x = v19;
  v58.origin.y = v21;
  v58.size.width = v23;
  v58.size.height = v25;
  if (!CGRectEqualToRect(v58, *(CGRect *)ymmword_1ECD79258))
  {
    v30 = (void *)qword_1ECD79250;
    qword_1ECD79250 = 0;

  }
  if (!qword_1ECD79250)
  {
    *(CGFloat *)ymmword_1ECD79258 = v19;
    *(double *)&ymmword_1ECD79258[8] = v21;
    *(CGFloat *)&ymmword_1ECD79258[16] = v23;
    *(double *)&ymmword_1ECD79258[24] = v25;
    v59.origin.x = v19;
    v59.origin.y = v21;
    v59.size.width = v23;
    v59.size.height = v25;
    v60 = CGRectInset(v59, 0.5, 0.5);
    +[UIBezierPath roundedRectBezierPath:withRoundedCorners:withCornerRadius:](UIBezierPath, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1, v60.origin.x, v60.origin.y, v60.size.width, v60.size.height, 4.5);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)qword_1ECD79250;
    qword_1ECD79250 = v31;

  }
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "userInterfaceIdiom");

  if ((v34 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v61.origin.y = v21 + 1.0;
    v61.origin.x = v19;
    v61.size.width = v23;
    v61.size.height = v25;
    v62 = CGRectInset(v61, 0.5, 0.5);
    +[UIBezierPath roundedRectBezierPath:withRoundedCorners:withCornerRadius:](UIBezierPath, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1, v62.origin.x, v62.origin.y, v62.size.width, v62.size.height, 4.5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor tableShadowColor](UIColor, "tableShadowColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "set");

    objc_msgSend(v35, "stroke");
  }
  fillColor = self->_fillColor;
  if (!fillColor)
    fillColor = (UIColor *)_MergedGlobals_33_0;
  v56 = fillColor;
  if (-[UIControl isHighlighted](self, "isHighlighted"))
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "userInterfaceIdiom");

    if ((v39 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      -[UIColor set](v56, "set");
      objc_msgSend((id)qword_1ECD79250, "fill");
      v40 = GetContextStack(0);
      if (*(int *)v40 < 1)
        v41 = 0;
      else
        v41 = (CGContext *)v40[3 * (*(_DWORD *)v40 - 1) + 1];
      CGContextSaveGState(v41);
    }
    else
    {
      v41 = 0;
    }
    objc_msgSend((id)qword_1ECD79250, "clip");
    -[UIView tintColor](self, "tintColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v42)
    {
      objc_msgSend(v42, "set");
      v44 = GetContextStack(0);
      if (*(int *)v44 < 1)
        v45 = 0;
      else
        v45 = (CGContext *)v44[3 * (*(_DWORD *)v44 - 1) + 1];
      v63.origin.x = v19;
      v63.origin.y = v21;
      v63.size.width = v23;
      v63.size.height = v25;
      CGContextFillRect(v45, v63);
    }
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "userInterfaceIdiom");

    if ((v47 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      CGContextRestoreGState(v41);

  }
  else
  {
    -[UIColor set](v56, "set");
    objc_msgSend((id)qword_1ECD79250, "fill");
  }
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "userInterfaceIdiom");

  if ((v49 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v64.origin.y = v21 + 1.0;
    v64.size.height = v25 + -1.0;
    v64.origin.x = v19;
    v64.size.width = v23;
    v65 = CGRectInset(v64, 0.5, 0.5);
    +[UIBezierPath roundedRectBezierPath:withRoundedCorners:withCornerRadius:](UIBezierPath, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1, v65.origin.x, v65.origin.y, v65.size.width, v65.size.height, 4.5);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor tableGroupedTopShadowColor](UIColor, "tableGroupedTopShadowColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "set");

    objc_msgSend(v50, "stroke");
  }
  if (-[UIControl isHighlighted](self, "isHighlighted"))
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "userInterfaceIdiom");

    if ((v53 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v54 = (void *)qword_1ECD79248;
    else
      v54 = (void *)qword_1ECD79240;
    goto LABEL_43;
  }
  if (-[UIButton _buttonType](self, "_buttonType") != 113)
  {
    v54 = (void *)qword_1ECD79230;
LABEL_43:
    objc_msgSend(v54, "set");
    goto LABEL_44;
  }
  +[UIColor tableSeparatorDarkColor](UIColor, "tableSeparatorDarkColor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "set");

LABEL_44:
  objc_msgSend((id)qword_1ECD79250, "stroke");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_fillPath, 0);
}

@end
