@implementation CRLShapeConnectionLineKnobTrackerAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("Freeform.CRLShapeConnectionLineKnobTracker");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLCanvasKnobTrackerAccessibility, a2);
}

@end
