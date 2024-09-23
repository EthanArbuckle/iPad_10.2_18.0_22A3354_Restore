@implementation PXSmartScaleView

- (double)displayScale
{
  void *v2;
  double v3;
  double v4;

  -[PXSmartScaleView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayScale");
  v4 = v3;

  return fmax(v4, 1.0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXSmartScaleView;
  v4 = a3;
  -[PXSmartScaleView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "displayScale", v10.receiver, v10.super_class);
  v6 = v5;

  -[PXSmartScaleView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v9 = v8;

  if (v6 != v9)
    -[PXSmartScaleView viewScaleDidChange](self, "viewScaleDidChange");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double v6;
  double v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  v9.receiver = self;
  v9.super_class = (Class)PXSmartScaleView;
  -[PXSmartScaleView setFrame:](&v9, sel_setFrame_, a3.origin.x, a3.origin.y);
  -[PXSmartScaleView displaySize](self, "displaySize");
  if (width != v7 || height != v6)
  {
    -[PXSmartScaleView setDisplaySize:](self, "setDisplaySize:", width, height);
    -[PXSmartScaleView viewScaleDidChange](self, "viewScaleDidChange");
  }
}

- (CGSize)displaySize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_displaySize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setDisplaySize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_displaySize, &v3, 16, 1, 0);
}

@end
