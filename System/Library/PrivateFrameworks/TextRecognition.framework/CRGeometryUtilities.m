@implementation CRGeometryUtilities

+ (BOOL)checkIntersectionForLineThroughPoint:(CGPoint)a3 andPoint:(CGPoint)a4 andSegmentStartingAt:(CGPoint)a5 andEndingAt:(CGPoint)a6 intersectAt:(CGPoint *)a7
{
  return specialized static CRGeometryUtilities.checkIntersection(forLineThroughPoint:andPoint:andSegmentStartingAt:andEndingAt:intersectAt:)(&a7->x, a3.x, a3.y, a4.x, a4.y, a5.x, a5.y, a6.x, a6.y);
}

- (CRGeometryUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRGeometryUtilities;
  return -[CRGeometryUtilities init](&v3, sel_init);
}

@end
