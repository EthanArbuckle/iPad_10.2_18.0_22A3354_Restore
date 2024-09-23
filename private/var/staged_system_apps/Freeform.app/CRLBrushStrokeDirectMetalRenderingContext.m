@implementation CRLBrushStrokeDirectMetalRenderingContext

- (CRLBrushStrokeDirectMetalRenderingContext)initWithMetalDrawable:(id)a3 frame:(CGRect)a4 transform:(CGAffineTransform *)a5 contentsScale:(double)a6 destinationColorSpaceOverride:(CGColorSpace *)a7 metalDeviceOverride:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  id v19;
  CRLBrushStrokeDirectMetalRenderingContext *v20;
  CRLBrushStrokeDirectMetalRenderingContext *v21;
  __int128 v22;
  __int128 v23;
  objc_super v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v18 = a3;
  v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)CRLBrushStrokeDirectMetalRenderingContext;
  v20 = -[CRLBrushStrokeDirectMetalRenderingContext init](&v25, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_metalDrawable, a3);
    v21->_frame.origin.x = x;
    v21->_frame.origin.y = y;
    v21->_frame.size.width = width;
    v21->_frame.size.height = height;
    v22 = *(_OWORD *)&a5->a;
    v23 = *(_OWORD *)&a5->c;
    *(_OWORD *)&v21->_transform.tx = *(_OWORD *)&a5->tx;
    *(_OWORD *)&v21->_transform.c = v23;
    *(_OWORD *)&v21->_transform.a = v22;
    v21->_contentsScale = a6;
    v21->_destinationColorSpaceOverride = CGColorSpaceRetain(a7);
    objc_storeStrong((id *)&v21->_metalDeviceOverride, a8);
  }

  return v21;
}

- (void)dealloc
{
  objc_super v3;

  CGColorSpaceRelease(self->_destinationColorSpaceOverride);
  v3.receiver = self;
  v3.super_class = (Class)CRLBrushStrokeDirectMetalRenderingContext;
  -[CRLBrushStrokeDirectMetalRenderingContext dealloc](&v3, "dealloc");
}

- (CAMetalDrawable)metalDrawable
{
  return self->_metalDrawable;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].b;
  return self;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (CGColorSpace)destinationColorSpaceOverride
{
  return self->_destinationColorSpaceOverride;
}

- (MTLDevice)metalDeviceOverride
{
  return self->_metalDeviceOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalDeviceOverride, 0);
  objc_storeStrong((id *)&self->_metalDrawable, 0);
}

@end
