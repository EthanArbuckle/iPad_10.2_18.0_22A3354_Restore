@implementation CRLShapeRenderingOperation

- (CRLShapeRenderingOperation)initWithImageSize:(CGSize)a3 imageScale:(double)a4 shapeType:(int64_t)a5 shapePathSource:(id)a6 angle:(double)a7 editingCoordinator:(id)a8 swatchCacheRenderingContext:(id)a9
{
  double height;
  double width;
  id v18;
  id v19;
  CRLShapeRenderingOperation *v20;
  CRLShapeRenderingOperation *v21;
  objc_super v23;

  height = a3.height;
  width = a3.width;
  v18 = a6;
  v19 = a9;
  v23.receiver = self;
  v23.super_class = (Class)CRLShapeRenderingOperation;
  v20 = -[CRLSwatchRenderingOperation initWithImageSize:imageScale:swatchFrame:editingCoordinator:](&v23, "initWithImageSize:imageScale:swatchFrame:editingCoordinator:", a8, width, height, a4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v21 = v20;
  if (v20)
  {
    v20->_shapeType = a5;
    objc_storeStrong((id *)&v20->_shapePathSource, a6);
    v21->_angle = a7;
    objc_storeStrong((id *)&v21->_swatchRenderingContext, a9);
  }

  return v21;
}

- (UIEdgeInsets)swatchEdgeInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSwatchCache swatchCache](CRLSwatchCache, "swatchCache"));
  objc_msgSend(v2, "shapeSwatchInset");
  v4 = v3;
  v6 = v5;

  v7 = v6;
  v8 = v4;
  v9 = v6;
  v10 = v6;
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v7;
  return result;
}

- (BOOL)needsPressedStateBackground
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char isKindOfClass;

  if (self->_shapeType == 3)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSwatchRenderingOperation view](self, "view"));
    v4 = objc_opt_class(UIButton, v3);
    isKindOfClass = objc_opt_isKindOfClass(v2, v4);

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
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
  int64_t shapeType;
  CRLPathSource *shapePathSource;
  double angle;
  void *v13;
  id v14;

  -[CRLSwatchRenderingContext setRendersForWideGamut:](self->_swatchRenderingContext, "setRendersForWideGamut:", -[CRLSwatchRenderingOperation renderForWideGamut](self, "renderForWideGamut"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSwatchCache swatchCache](CRLSwatchCache, "swatchCache"));
  -[CRLSwatchRenderingOperation imageSize](self, "imageSize");
  v5 = v4;
  v7 = v6;
  -[CRLSwatchRenderingOperation imageScale](self, "imageScale");
  v9 = v8;
  shapeType = self->_shapeType;
  shapePathSource = self->_shapePathSource;
  angle = self->_angle;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSwatchRenderingOperation editingCoordinator](self, "editingCoordinator"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageForShapeWithSize:imageScale:shapeType:shapePathSource:angle:editingCoordinator:renderingContext:", shapeType, shapePathSource, v13, self->_swatchRenderingContext, v5, v7, v9, angle));

  if (-[CRLSwatchRenderingOperation deliversImageAutomatically](self, "deliversImageAutomatically"))
    -[CRLSwatchRenderingOperation deliverCGImage:](self, "deliverCGImage:", objc_msgSend(v14, "CGImage"));
  else
    -[CRLSwatchRenderingOperation provideSwatchForLaterDelivery:](self, "provideSwatchForLaterDelivery:", v14);

}

- (double)angle
{
  return self->_angle;
}

- (CRLSwatchRenderingContext)renderingContext
{
  return self->_swatchRenderingContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swatchRenderingContext, 0);
  objc_storeStrong((id *)&self->_shapePathSource, 0);
}

@end
