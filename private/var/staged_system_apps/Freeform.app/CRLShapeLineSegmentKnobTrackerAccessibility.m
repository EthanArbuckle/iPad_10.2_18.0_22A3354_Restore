@implementation CRLShapeLineSegmentKnobTrackerAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLShapeLineSegmentKnobTracker");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLCanvasKnobTrackerAccessibility, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_opt_class(CRLShapeLineSegmentKnobTrackerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

@end
