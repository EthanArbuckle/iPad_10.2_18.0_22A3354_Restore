@implementation PXGLayoutGuide

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGLayoutGuide;
  -[PXGLayoutGuide performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setRect:(CGRect)a3 inLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGRect v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[PXGLayoutGuide rectInLayout:](self, "rectInLayout:", v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[PXGLayoutGuide setReferenceRect:](self, "setReferenceRect:", x, y, width, height);
  -[PXGLayoutGuide setReferenceLayout:](self, "setReferenceLayout:", v9);

  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v19.origin.x = v11;
  v19.origin.y = v13;
  v19.size.width = v15;
  v19.size.height = v17;
  if (!CGRectEqualToRect(v18, v19))
    -[PXGLayoutGuide signalChange:](self, "signalChange:", 1);
}

- (CGRect)rectInLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
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
  CGRect result;

  v4 = a3;
  -[PXGLayoutGuide referenceRect](self, "referenceRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PXGLayoutGuide referenceLayout](self, "referenceLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v4, "convertRect:fromLayout:", v13, v6, v8, v10, v12);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
  }
  else
  {
    v15 = *MEMORY[0x1E0C9D628];
    v17 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v19 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v21 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)referenceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_referenceRect.origin.x;
  y = self->_referenceRect.origin.y;
  width = self->_referenceRect.size.width;
  height = self->_referenceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (PXGLayout)referenceLayout
{
  return (PXGLayout *)objc_loadWeakRetained((id *)&self->_referenceLayout);
}

- (void)setReferenceRect:(CGRect)a3
{
  self->_referenceRect = a3;
}

- (void)setReferenceLayout:(id)a3
{
  objc_storeWeak((id *)&self->_referenceLayout, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_referenceLayout);
}

@end
