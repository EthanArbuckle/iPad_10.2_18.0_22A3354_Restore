@implementation CRLShapeControlKnobTrackerAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLShapeControlKnobTracker");
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
  objc_opt_class(CRLShapeControlKnobTrackerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

+ (NSString)_crlaxLastAnnouncedHUDString
{
  return (NSString *)(id)qword_101415500;
}

+ (void)set_crlaxLastAnnouncedHUDString:(id)a3
{
  objc_storeStrong((id *)&qword_101415500, a3);
}

+ (NSDate)_crlaxTimeOfLastHUDAnnouncement
{
  return (NSDate *)(id)qword_101415508;
}

+ (void)set_crlaxTimeOfLastHUDAnnouncement:(id)a3
{
  objc_storeStrong((id *)&qword_101415508, a3);
}

- (BOOL)crlaxShouldAnnounceValueUponEndMovingKnob
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeControlKnobTrackerAccessibility _crlaxHUDString](self, "_crlaxHUDString"));
  v3 = objc_msgSend(v2, "length") == 0;

  return v3;
}

- (void)p_updateHUDAtPoint:(CGPoint)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  unsigned __int8 v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CRLShapeControlKnobTrackerAccessibility;
  -[CRLShapeControlKnobTrackerAccessibility p_updateHUDAtPoint:](&v13, "p_updateHUDAtPoint:", a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeControlKnobTrackerAccessibility _crlaxHUDString](self, "_crlaxHUDString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLShapeControlKnobTrackerAccessibility _crlaxTimeOfLastHUDAnnouncement](CRLShapeControlKnobTrackerAccessibility, "_crlaxTimeOfLastHUDAnnouncement"));
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLShapeControlKnobTrackerAccessibility _crlaxLastAnnouncedHUDString](CRLShapeControlKnobTrackerAccessibility, "_crlaxLastAnnouncedHUDString"));
  v10 = objc_msgSend(v4, "isEqualToString:", v9);

  v11 = objc_msgSend(v4, "length");
  if (v8 <= 1.0)
    v12 = v10;
  else
    v12 = 0;
  if (v11 && (v12 & 1) == 0)
  {
    +[CRLShapeControlKnobTrackerAccessibility set_crlaxTimeOfLastHUDAnnouncement:](CRLShapeControlKnobTrackerAccessibility, "set_crlaxTimeOfLastHUDAnnouncement:", v5);
    +[CRLShapeControlKnobTrackerAccessibility set_crlaxLastAnnouncedHUDString:](CRLShapeControlKnobTrackerAccessibility, "set_crlaxLastAnnouncedHUDString:", v4);
    -[CRLCanvasKnobTrackerAccessibility crlaxAnnounceString:](self, "crlaxAnnounceString:", v4);
  }

}

- (id)_crlaxHUDString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeControlKnobTrackerAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shapeControlLayout"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "smartPathSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeControlKnobTrackerAccessibility crlaxTarget](self, "crlaxTarget"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "knob"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getFeedbackStringForKnob:", objc_msgSend(v7, "tag")));

  return v8;
}

@end
