@implementation TSWPEquationRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPEquationRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDRepAccessibility, a2);
}

- (NSDictionary)tsaxMathEquationRepresentation
{
  return (NSDictionary *)__TSAccessibilityGetAssociatedObject(self, &unk_5438B0);
}

- (void)tsaxSetMathEquationRepresentation:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_5438B0, a3);
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  BOOL v6;
  objc_super v8;
  CGPoint v9;
  CGRect v10;

  y = a3.y;
  x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)TSWPEquationRepAccessibility;
  v6 = -[TSWPEquationRepAccessibility containsPoint:](&v8, "containsPoint:");
  if (-[TSAccessibility needsAccessibilityElements](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "needsAccessibilityElements"))
  {
    -[TSDRepAccessibility tsaxNaturalBounds](self, "tsaxNaturalBounds");
    v9.x = x;
    v9.y = y;
    return CGRectContainsPoint(v10, v9);
  }
  return v6;
}

- (BOOL)tsaxShouldExposeAsAttachmentToken
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return 0x40000000000;
}

- (id)_axEquation
{
  return objc_msgSend(-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("info")), "tsaxValueForKey:", CFSTR("equation"));
}

- (id)accessibilityMathEquation
{
  NSDictionary *v3;
  id v4;
  id v5;

  v3 = -[TSWPEquationRepAccessibility tsaxMathEquationRepresentation](self, "tsaxMathEquationRepresentation");
  if (!v3)
  {
    v4 = -[TSWPEquationRepAccessibility _axEquation](self, "_axEquation");
    if (qword_5438B8 != -1)
      dispatch_once(&qword_5438B8, &stru_43BF18);
    v5 = objc_msgSend(objc_msgSend(v4, "tsaxValueForKey:", CFSTR("root")), "tsaxValueForKey:", CFSTR("mExpression"));
    v3 = (NSDictionary *)+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    sub_23EE54(v5, v3, 0);
    -[TSWPEquationRepAccessibility tsaxSetMathEquationRepresentation:](self, "tsaxSetMathEquationRepresentation:", v3);
  }
  return v3;
}

- (id)accessibilityLabel
{
  return 0;
}

- (id)accessibilityMathMLSource
{
  id result;

  result = objc_msgSend(-[TSWPEquationRepAccessibility _axEquation](self, "_axEquation"), "tsaxValueForKey:", CFSTR("mSource"));
  if (result)
    return objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", result, 1);
  return result;
}

@end
