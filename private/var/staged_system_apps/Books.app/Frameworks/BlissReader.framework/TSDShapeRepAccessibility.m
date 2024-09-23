@implementation TSDShapeRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDShapeRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDRepAccessibility, a2);
}

- (TSDShapeInfoAccessibility)tsaxShapeInfo
{
  void *v3;
  TSDShapeInfoAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDShapeInfoAccessibility);
  result = (TSDShapeInfoAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("shapeInfo")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (NSString)tsaxShapeTypeDescription
{
  return (NSString *)objc_msgSend(objc_msgSend(-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("shapeInfo")), "tsaxValueForKey:", CFSTR("pathSource")), "tsaxLabel");
}

- (NSString)tsaxShapeLabel
{
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[TSDRepAccessibility tsaxLockedLabel](self, "tsaxLockedLabel");
  v4 = -[TSDShapeInfoAccessibility tsaxShapeTypeDescription](-[TSDShapeRepAccessibility tsaxShapeInfo](self, "tsaxShapeInfo"), "tsaxShapeTypeDescription");
  return (NSString *)__TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

- (id)tsaxKnobLabel
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("shape"));
}

- (id)tsaxHelpDescription
{
  id v3;
  TSDInteractiveCanvasControllerAccessibility *v4;
  double v5;
  double v6;
  id v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;

  v3 = objc_msgSend(-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("shapeLayout")), "tsaxValueForKey:", CFSTR("layoutInfoGeometry"));
  v4 = -[TSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController");
  objc_msgSend(v3, "tsaxCGSizeValueForKey:", CFSTR("size"));
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("object.size.formatter %@ %@")), -[TSDInteractiveCanvasControllerAccessibility tsaxDescriptionOfPointValueConvertedToRulerUnit:](v4, "tsaxDescriptionOfPointValueConvertedToRulerUnit:"), -[TSDInteractiveCanvasControllerAccessibility tsaxDescriptionOfPointValueConvertedToRulerUnit:](v4, "tsaxDescriptionOfPointValueConvertedToRulerUnit:", v5));
  objc_msgSend(v3, "tsaxCGFloatValueForKey:", CFSTR("angle"));
  if (v6 != 0.0)
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("shape.angle %f")), *(_QWORD *)&v6);
  v7 = objc_msgSend(-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("shapeInfo")), "tsaxValueForKey:", CFSTR("style"));
  v19 = 0;
  v8 = (objc_class *)objc_opt_class(NSString);
  v9 = __TSAccessibilityCastAsClass(v8, (uint64_t)objc_msgSend(v7, "tsaxValueForKey:", CFSTR("name")), 1, &v19);
  if (v19)
    abort();
  v10 = v9;
  v11 = -[TSDShapeRepAccessibility tsaxShapeLabel](self, "tsaxShapeLabel");
  -[TSDRepAccessibility tsaxLockedHint](self, "tsaxLockedHint");
  return __TSAccessibilityStringForVariables(1, v11, v12, v13, v14, v15, v16, v17, v10);
}

- (BOOL)tsaxIsIgnored
{
  return -[TSDInteractiveCanvasControllerAccessibility tsaxShapeRepsAreIgnored](-[TSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxShapeRepsAreIgnored");
}

- (BOOL)isAccessibilityElement
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDShapeRepAccessibility;
  v3 = -[TSDRepAccessibility isAccessibilityElement](&v5, "isAccessibilityElement");
  if (v3)
    LOBYTE(v3) = !-[TSDShapeRepAccessibility tsaxIsIgnored](self, "tsaxIsIgnored");
  return v3;
}

- (id)accessibilityLabel
{
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (-[TSDRepAccessibility tsaxHasComment](self, "tsaxHasComment"))
    v3 = TSAccessibilityLocalizedString((uint64_t)CFSTR("annotation.object.has.comment"));
  else
    v3 = 0;
  v4 = -[TSDShapeRepAccessibility tsaxShapeLabel](self, "tsaxShapeLabel");
  return __TSAccessibilityStringForVariables(1, v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
}

- (id)accessibilityHint
{
  id v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSDShapeRepAccessibility;
  v3 = -[TSDRepAccessibility accessibilityHint](&v12, "accessibilityHint");
  v4 = -[TSDShapeInfoAccessibility tsaxShapeStyleName](-[TSDShapeRepAccessibility tsaxShapeInfo](self, "tsaxShapeInfo"), "tsaxShapeStyleName");
  return __TSAccessibilityStringForVariables(1, v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
}

@end
