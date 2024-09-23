@implementation PXFocusInfo

+ (PXFocusInfo)focusInfoWithView:(id)a3 cornerRadius:(double)a4 cornerCurve:(id)a5
{
  id v8;
  id v9;
  double *v10;
  void *v11;
  id v12;
  void *v13;

  v8 = a3;
  v9 = a5;
  v10 = (double *)objc_alloc_init((Class)a1);
  v11 = (void *)*((_QWORD *)v10 + 2);
  *((_QWORD *)v10 + 2) = v8;
  v12 = v8;

  v10[3] = a4;
  v13 = (void *)*((_QWORD *)v10 + 4);
  *((_QWORD *)v10 + 4) = v9;

  return (PXFocusInfo *)v10;
}

+ (PXFocusInfo)focusInfoWithView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cornerRadius");
  v7 = v6;
  objc_msgSend(v5, "cornerCurve");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "focusInfoWithView:cornerRadius:cornerCurve:", v4, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXFocusInfo *)v9;
}

- (id)makeHaloEffectForSourceView:(id)a3
{
  UIView *view;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  view = self->_view;
  v5 = a3;
  -[UIView bounds](view, "bounds");
  objc_msgSend(v5, "convertRect:fromView:", self->_view);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  return (id)objc_msgSend(MEMORY[0x1E0DC37D8], "effectWithRoundedRect:cornerRadius:curve:", self->_cornerCurve, v7, v9, v11, v13, self->_cornerRadius);
}

- (BOOL)wantsInnerBorder
{
  return self->_wantsInnerBorder;
}

- (void)setWantsInnerBorder:(BOOL)a3
{
  self->_wantsInnerBorder = a3;
}

- (BOOL)wantsOuterBorder
{
  return self->_wantsOuterBorder;
}

- (void)setWantsOuterBorder:(BOOL)a3
{
  self->_wantsOuterBorder = a3;
}

- (UIView)view
{
  return self->_view;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (NSString)cornerCurve
{
  return self->_cornerCurve;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerCurve, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
