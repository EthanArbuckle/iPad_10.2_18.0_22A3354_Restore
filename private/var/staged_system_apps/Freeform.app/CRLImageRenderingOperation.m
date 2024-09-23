@implementation CRLImageRenderingOperation

- (CRLImageRenderingOperation)initWithImageSize:(CGSize)a3 imageScale:(double)a4 swatchFrame:(CGRect)a5 imageInfo:(id)a6 editingCoordinator:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  double v14;
  double v15;
  id v17;
  CRLImageRenderingOperation *v18;
  CRLImageRenderingOperation *v19;
  objc_super v21;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a3.height;
  v15 = a3.width;
  v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CRLImageRenderingOperation;
  v18 = -[CRLSwatchRenderingOperation initWithImageSize:imageScale:swatchFrame:editingCoordinator:](&v21, "initWithImageSize:imageScale:swatchFrame:editingCoordinator:", a7, v15, v14, a4, x, y, width, height);
  v19 = v18;
  if (v18)
    objc_storeStrong((id *)&v18->_imageInfo, a6);

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
  _TtC8Freeform12CRLImageItem *imageInfo;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSwatchCache swatchCache](CRLSwatchCache, "swatchCache"));
  -[CRLSwatchRenderingOperation imageSize](self, "imageSize");
  v5 = v4;
  v7 = v6;
  -[CRLSwatchRenderingOperation imageScale](self, "imageScale");
  v9 = v8;
  imageInfo = self->_imageInfo;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSwatchRenderingOperation editingCoordinator](self, "editingCoordinator"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageForImageWithSize:imageScale:imageInfo:editingCoordinator:renderForWideGamut:", imageInfo, v11, -[CRLSwatchRenderingOperation renderForWideGamut](self, "renderForWideGamut"), v5, v7, v9));

  -[CRLSwatchRenderingOperation deliverCGImage:](self, "deliverCGImage:", objc_msgSend(v12, "CGImage"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageInfo, 0);
}

@end
