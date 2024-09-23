@implementation CRLStyledItemBlockSwatchRenderingOperation

- (CRLStyledItemBlockSwatchRenderingOperation)initWithImageSize:(CGSize)a3 imageScale:(double)a4 swatchFrame:(CGRect)a5 editingCoordinator:(id)a6 styledInfoAspectRatio:(CGSize)a7 swatchInfoBlock:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  double v14;
  double v15;
  id v17;
  CRLStyledItemBlockSwatchRenderingOperation *v18;
  CRLStyledItemBlockSwatchRenderingOperation *v19;
  id v20;
  id swatchInfoBlock;
  objc_super v23;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a3.height;
  v15 = a3.width;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)CRLStyledItemBlockSwatchRenderingOperation;
  v18 = -[CRLSwatchRenderingOperation initWithImageSize:imageScale:swatchFrame:editingCoordinator:](&v23, "initWithImageSize:imageScale:swatchFrame:editingCoordinator:", a6, v15, v14, a4, x, y, width, height);
  v19 = v18;
  if (v18)
  {
    v18->_styledInfoAspectRatio = a7;
    v20 = objc_msgSend(v17, "copy");
    swatchInfoBlock = v19->_swatchInfoBlock;
    v19->_swatchInfoBlock = v20;

  }
  return v19;
}

- (void)doWorkWithReadLock
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSwatchCache swatchCache](CRLSwatchCache, "swatchCache"));
  -[CRLSwatchRenderingOperation imageSize](self, "imageSize");
  v5 = v4;
  v7 = v6;
  -[CRLSwatchRenderingOperation imageScale](self, "imageScale");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSwatchRenderingOperation editingCoordinator](self, "editingCoordinator"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageForStyledItemWithSize:imageScale:editingCoordinator:renderForWideGamut:styledInfoAspectRatio:usingSwatchInfoFromBlock:", v10, -[CRLSwatchRenderingOperation renderForWideGamut](self, "renderForWideGamut"), self->_swatchInfoBlock, v5, v7, v9, self->_styledInfoAspectRatio.width, self->_styledInfoAspectRatio.height));

  -[CRLSwatchRenderingOperation deliverCGImage:](self, "deliverCGImage:", objc_msgSend(v11, "CGImage"));
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_swatchInfoBlock, 0);
}

@end
