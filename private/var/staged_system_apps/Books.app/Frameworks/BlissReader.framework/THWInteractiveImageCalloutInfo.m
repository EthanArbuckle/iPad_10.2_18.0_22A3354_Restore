@implementation THWInteractiveImageCalloutInfo

- (THWInteractiveImageCalloutInfo)initWithViewScale:(double)a3 contentOffset:(CGPoint)a4 groupShape:(id)a5 titleStorage:(id)a6 titleGeometry:(id)a7 descriptionStorage:(id)a8 descriptionGeometry:(id)a9 lineShape:(id)a10
{
  double y;
  double x;
  THWInteractiveImageCalloutInfo *v19;
  id v20;
  id v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  id v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double MinY;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  CGPoint v44;
  float64x2_t v45;
  objc_super v46;
  CGRect v47;
  CGRect v48;

  y = a4.y;
  x = a4.x;
  v46.receiver = self;
  v46.super_class = (Class)THWInteractiveImageCalloutInfo;
  v19 = -[THWInteractiveImageCalloutInfo init](&v46, "init");
  if (v19)
  {
    v20 = objc_msgSend(objc_msgSend(objc_msgSend(a10, "pathSource"), "bezierPath"), "CGPath");
    v44 = CGPointZero;
    v45 = (float64x2_t)v44;
    if (v20)
    {
      TSDPathGetStartAndEndPoints(v20, &v45, &v44);
      v21 = objc_msgSend(a10, "geometry");
      if (v21)
      {
        objc_msgSend(v21, "transform");
        v22 = v41;
        v23 = v42;
        v24 = v43;
      }
      else
      {
        v24 = 0uLL;
        v42 = 0u;
        v43 = 0u;
        v41 = 0u;
        v22 = 0uLL;
        v23 = 0uLL;
      }
      v45 = vaddq_f64(v24, vmlaq_n_f64(vmulq_n_f64(v23, v45.f64[1]), v22, v45.f64[0]));
      v25 = objc_msgSend(a10, "geometry");
      if (v25)
      {
        objc_msgSend(v25, "transform");
        v26 = v38;
        v27 = v39;
        v28 = v40;
      }
      else
      {
        v28 = 0uLL;
        v39 = 0u;
        v40 = 0u;
        v38 = 0u;
        v26 = 0uLL;
        v27 = 0uLL;
      }
      v44 = (CGPoint)vaddq_f64(v28, vmlaq_n_f64(vmulq_n_f64(v27, v44.y), v26, v44.x));
    }
    objc_msgSend(objc_msgSend(a5, "geometry", *(_OWORD *)&v38, *(_OWORD *)&v39, *(_OWORD *)&v40, *(_OWORD *)&v41, *(_OWORD *)&v42, *(_OWORD *)&v43), "boundsBeforeRotation");
    v30 = v29;
    v32 = v31;
    -[THWInteractiveImageCalloutInfo setViewScale:](v19, "setViewScale:", a3);
    -[THWInteractiveImageCalloutInfo setContentOffset:](v19, "setContentOffset:", x, y);
    -[THWInteractiveImageCalloutInfo setGroupShape:](v19, "setGroupShape:", a5);
    -[THWInteractiveImageCalloutInfo setTitleStorage:](v19, "setTitleStorage:", a6);
    -[THWInteractiveImageCalloutInfo setTitleGeometry:](v19, "setTitleGeometry:", -[THWInteractiveImageCalloutInfo p_geometry:offsetBy:](v19, "p_geometry:offsetBy:", a7, v30, v32));
    -[THWInteractiveImageCalloutInfo setDescriptionStorage:](v19, "setDescriptionStorage:", a8);
    -[THWInteractiveImageCalloutInfo setDescriptionGeometry:](v19, "setDescriptionGeometry:", -[THWInteractiveImageCalloutInfo p_geometry:offsetBy:](v19, "p_geometry:offsetBy:", a9, v30, v32));
    -[THWInteractiveImageCalloutInfo setLineShape:](v19, "setLineShape:", a10);
    -[THWInteractiveImageCalloutInfo setSourcePoint:](v19, "setSourcePoint:", *(_OWORD *)&v45);
    -[THWInteractiveImageCalloutInfo setTargetPoint:](v19, "setTargetPoint:", v44);
    -[TSDInfoGeometry position](-[THWInteractiveImageCalloutInfo titleGeometry](v19, "titleGeometry"), "position");
    v34 = v33;
    objc_msgSend(-[TSDShapeInfo geometry](-[THWInteractiveImageCalloutInfo groupShape](v19, "groupShape"), "geometry"), "position");
    v19->_marginInset = v34 - v35;
    -[TSDInfoGeometry boundsBeforeRotation](-[THWInteractiveImageCalloutInfo descriptionGeometry](v19, "descriptionGeometry"), "boundsBeforeRotation");
    MinY = CGRectGetMinY(v47);
    -[TSDInfoGeometry boundsBeforeRotation](-[THWInteractiveImageCalloutInfo titleGeometry](v19, "titleGeometry"), "boundsBeforeRotation");
    v19->_verticalSpacing = MinY - CGRectGetMaxY(v48);
  }
  return v19;
}

- (THWInteractiveImageCalloutInfo)initWithViewScale:(double)a3 contentOffset:(CGPoint)a4
{
  double y;
  double x;
  THWInteractiveImageCalloutInfo *v7;
  THWInteractiveImageCalloutInfo *v8;
  double v9;
  objc_super v11;

  y = a4.y;
  x = a4.x;
  v11.receiver = self;
  v11.super_class = (Class)THWInteractiveImageCalloutInfo;
  v7 = -[THWInteractiveImageCalloutInfo init](&v11, "init");
  v8 = v7;
  if (v7)
  {
    -[THWInteractiveImageCalloutInfo setViewScale:](v7, "setViewScale:", a3);
    -[THWInteractiveImageCalloutInfo setContentOffset:](v8, "setContentOffset:", x, y);
    -[THWInteractiveImageCalloutInfo setGroupShape:](v8, "setGroupShape:", 0);
    -[THWInteractiveImageCalloutInfo setTitleStorage:](v8, "setTitleStorage:", 0);
    -[THWInteractiveImageCalloutInfo setTitleGeometry:](v8, "setTitleGeometry:", 0);
    -[THWInteractiveImageCalloutInfo setDescriptionStorage:](v8, "setDescriptionStorage:", 0);
    -[THWInteractiveImageCalloutInfo setDescriptionGeometry:](v8, "setDescriptionGeometry:", 0);
    -[THWInteractiveImageCalloutInfo setLineShape:](v8, "setLineShape:", 0);
    v9 = CGPointZero.y;
    -[THWInteractiveImageCalloutInfo setSourcePoint:](v8, "setSourcePoint:", CGPointZero.x, v9);
    -[THWInteractiveImageCalloutInfo setTargetPoint:](v8, "setTargetPoint:", CGPointZero.x, v9);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[THWInteractiveImageCalloutInfo setGroupShape:](self, "setGroupShape:", 0);
  -[THWInteractiveImageCalloutInfo setTitleStorage:](self, "setTitleStorage:", 0);
  -[THWInteractiveImageCalloutInfo setTitleGeometry:](self, "setTitleGeometry:", 0);
  -[THWInteractiveImageCalloutInfo setDescriptionStorage:](self, "setDescriptionStorage:", 0);
  -[THWInteractiveImageCalloutInfo setDescriptionGeometry:](self, "setDescriptionGeometry:", 0);
  -[THWInteractiveImageCalloutInfo setLineShape:](self, "setLineShape:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageCalloutInfo;
  -[THWInteractiveImageCalloutInfo dealloc](&v3, "dealloc");
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  NSString *v7;
  id v8;
  id v9;
  NSString *v10;
  CGPoint v12;
  CGPoint v13;
  CGPoint v14;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  -[THWInteractiveImageCalloutInfo viewScale](self, "viewScale");
  v6 = v5;
  -[THWInteractiveImageCalloutInfo contentOffset](self, "contentOffset");
  v7 = NSStringFromCGPoint(v12);
  v8 = -[TSWPStorage string](-[THWInteractiveImageCalloutInfo titleStorage](self, "titleStorage"), "string");
  v9 = objc_msgSend(-[TSDShapeInfo geometry](-[THWInteractiveImageCalloutInfo groupShape](self, "groupShape"), "geometry"), "description");
  -[THWInteractiveImageCalloutInfo sourcePoint](self, "sourcePoint");
  v10 = NSStringFromCGPoint(v13);
  -[THWInteractiveImageCalloutInfo targetPoint](self, "targetPoint");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@=%p viewScale=%.1f contentOffset=%@ title=%@ groupShape.geometry=%@ sourcePoint=%@ targetPoint=%@>"), v4, self, v6, v7, v8, v9, v10, NSStringFromCGPoint(v14));
}

- (CGRect)unscaledTitleRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDInfoGeometry boundsBeforeRotation](-[THWInteractiveImageCalloutInfo titleGeometry](self, "titleGeometry"), "boundsBeforeRotation");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)shouldDraw
{
  return -[THWInteractiveImageCalloutInfo groupShape](self, "groupShape") != 0;
}

- (UIEdgeInsets)contentInset
{
  double marginInset;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  marginInset = self->_marginInset;
  v3 = marginInset;
  v4 = marginInset;
  v5 = marginInset;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = marginInset;
  return result;
}

- (id)p_geometry:(id)a3 offsetBy:(CGPoint)a4
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  id v18;
  id v19;
  double v20;

  y = a4.y;
  x = a4.x;
  objc_msgSend(a3, "position");
  v8 = x + v7;
  v10 = y + v9;
  v11 = objc_alloc((Class)TSDInfoGeometry);
  objc_msgSend(a3, "size");
  v13 = v12;
  v15 = v14;
  v16 = objc_msgSend(a3, "widthValid");
  v17 = objc_msgSend(a3, "heightValid");
  v18 = objc_msgSend(a3, "horizontalFlip");
  v19 = objc_msgSend(a3, "verticalFlip");
  objc_msgSend(a3, "angle");
  return objc_msgSend(v11, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", v16, v17, v18, v19, v8, v10, v13, v15, v20);
}

- (TSDShapeInfo)groupShape
{
  return self->mGroupShape;
}

- (void)setGroupShape:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (TSWPStorage)titleStorage
{
  return self->mTitleStorage;
}

- (void)setTitleStorage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (TSDInfoGeometry)titleGeometry
{
  return self->mTitleGeometry;
}

- (void)setTitleGeometry:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (TSWPStorage)descriptionStorage
{
  return self->mDescriptionStorage;
}

- (void)setDescriptionStorage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (TSDInfoGeometry)descriptionGeometry
{
  return self->mDescriptionGeometry;
}

- (void)setDescriptionGeometry:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (TSDShapeInfo)lineShape
{
  return self->mLineShape;
}

- (void)setLineShape:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (double)viewScale
{
  return self->mViewScale;
}

- (void)setViewScale:(double)a3
{
  self->mViewScale = a3;
}

- (CGPoint)contentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->mContentOffset.x;
  y = self->mContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  self->mContentOffset = a3;
}

- (CGPoint)sourcePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->mSourcePoint.x;
  y = self->mSourcePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setSourcePoint:(CGPoint)a3
{
  self->mSourcePoint = a3;
}

- (CGPoint)targetPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->mTargetPoint.x;
  y = self->mTargetPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTargetPoint:(CGPoint)a3
{
  self->mTargetPoint = a3;
}

- (double)verticalSpacing
{
  return self->_verticalSpacing;
}

@end
