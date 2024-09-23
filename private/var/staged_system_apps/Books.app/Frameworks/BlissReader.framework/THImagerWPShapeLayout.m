@implementation THImagerWPShapeLayout

- (CGRect)frameForCulling
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;
  CGRect result;
  CGRect v19;

  v15.receiver = self;
  v15.super_class = (Class)THImagerWPShapeLayout;
  -[THImagerWPShapeLayout frameForCulling](&v15, "frameForCulling");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  if (-[THImagerWPShapeLayout containedLayout](self, "containedLayout")
    && objc_msgSend(objc_msgSend(-[THImagerWPShapeLayout info](self, "info"), "containedStorage"), "length"))
  {
    objc_msgSend(-[THImagerWPShapeLayout containedLayout](self, "containedLayout"), "frameForCulling");
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v17 = CGRectUnion(v16, v19);
    x = v17.origin.x;
    y = v17.origin.y;
    width = v17.size.width;
    height = v17.size.height;
  }
  v11 = x;
  v12 = y;
  v13 = width;
  v14 = height;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

@end
