@implementation SXStandaloneTextLayout

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (id)computeLayoutGeometry
{
  SXStandaloneTextLayoutDelegate **p_delegate;
  id WeakRetained;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "positionForTextLayout:", self);
  v6 = v5;

  v7 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v7, "marginForTextLayout:", self);
  v9 = v8;

  v10 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v10, "widthForTextLayout:", self);
  v12 = v11;

  -[TSDAbstractLayout children](self, "children");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "frame");
    v16 = v15;
  }
  else
  {
    v16 = 0.0;
  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3AA8]), "initWithFrame:", v9, v6, v12 + v9 * -2.0, v16);

  return v17;
}

- (id)childInfosForLayout
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[TSDLayout info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unsigned)autosizeFlagsForTextLayout:(id)a3
{
  return 3;
}

- (unsigned)verticalAlignmentForTextLayout:(id)a3
{
  return 0;
}

- (CGRect)nonAutosizedFrameForTextLayout:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4
{
  CGFloat height;
  SXStandaloneTextLayoutDelegate **p_delegate;
  id WeakRetained;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  height = a4.height;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "marginForTextLayout:", self);
  v9 = v8;

  v10 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v10, "widthForTextLayout:", self);
  v12 = v11 + v9 * -2.0;

  v13 = 0.0;
  v14 = 0.0;
  v15 = v12;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)dependentsOfTextLayout:(id)a3
{
  return 0;
}

- (Class)repClassForTextLayout:(id)a3
{
  return 0;
}

- (id)styleProviderForLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SXStandaloneTextLayout p_wpLayoutParent](self, "p_wpLayoutParent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "styleProviderForLayout:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGSize)adjustedInsets
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (TSWPPadding)layoutMargins
{
  return 0;
}

- (unint64_t)columnCount
{
  return 1;
}

- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6
{
  void *v9;
  void *v10;
  void *v11;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SXStandaloneTextLayout positionForColumnIndex:bodyWidth:outWidth:outGap:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXStandaloneTextLayout.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 121, CFSTR("unexpected column index"));

  }
  if (a5)
    *a5 = a4;
  if (a6)
    *a6 = 0.0;
  return 0.0;
}

- (BOOL)alwaysStartsNewTarget
{
  return 0;
}

- (BOOL)shrinkTextToFit
{
  return 0;
}

- (BOOL)columnsAreLeftToRight
{
  return 1;
}

- (id)p_wpLayoutParent
{
  void *v2;
  void *v3;

  -[TSDAbstractLayout parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TSUProtocolCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SXStandaloneTextLayoutDelegate)delegate
{
  return (SXStandaloneTextLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
