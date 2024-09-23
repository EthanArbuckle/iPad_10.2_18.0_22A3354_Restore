@implementation CRLBezierPathAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLBezierPath");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLBezierPathAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)crlaxInferredLabelForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  unsigned int v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;

  height = a3.height;
  width = a3.width;
  if (-[CRLBezierPathAccessibility _crlaxIsLineSegment](self, "_crlaxIsLineSegment"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("Line");
LABEL_16:
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, 0, 0));
LABEL_17:

    goto LABEL_18;
  }
  if (-[CRLBezierPathAccessibility _crlaxIsRectangular](self, "_crlaxIsRectangular"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (height == width || vabdd_f64(height, width) < 0.00999999978)
      v8 = CFSTR("Square");
    else
      v8 = CFSTR("Rectangle");
LABEL_15:
    v6 = v7;
    goto LABEL_16;
  }
  if (-[CRLBezierPathAccessibility _crlaxIsCircular](self, "_crlaxIsCircular"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (height == width || vabdd_f64(height, width) < 0.00999999978)
      v8 = CFSTR("Circle");
    else
      v8 = CFSTR("Oval");
    goto LABEL_15;
  }
  if (-[CRLBezierPathAccessibility _crlaxIsTriangular](self, "_crlaxIsTriangular"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("Triangle");
    goto LABEL_16;
  }
  if (-[CRLBezierPathAccessibility _crlaxIsDiamond](self, "_crlaxIsDiamond"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("Diamond");
    goto LABEL_16;
  }
  v13 = -[CRLBezierPathAccessibility _crlaxNumberOfSides](self, "_crlaxNumberOfSides");
  if (v13)
  {
    v14 = v13;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%@-sided shape"), 0, 0));
    v16 = CRLAccessibilityLocalizedUnsignedInteger(v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v17));

LABEL_28:
    goto LABEL_17;
  }
  v18 = -[CRLBezierPathAccessibility _crlaxNumberOfLineSegments](self, "_crlaxNumberOfLineSegments");
  v19 = -[CRLBezierPathAccessibility _crlaxHasZeroArcs](self, "_crlaxHasZeroArcs");
  if (v19 && v18)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%@ line segments, non-closed"), 0, 0));
    v20 = CRLAccessibilityLocalizedUnsignedInteger(v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v21));

    goto LABEL_28;
  }
  v9 = 0;
  if ((v19 & 1) == 0 && v18)
  {
    v22 = -[CRLBezierPathAccessibility _crlaxNumberOfArcs](self, "_crlaxNumberOfArcs");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%1$@ line segments, %2$@ arcs"), 0, 0));
    v24 = CRLAccessibilityLocalizedUnsignedInteger(v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = CRLAccessibilityLocalizedUnsignedInteger(v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v25, v27));

    goto LABEL_17;
  }
LABEL_18:
  if (!objc_msgSend(v9, "length"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Shape"), 0, 0));

    v9 = (void *)v11;
  }
  return v9;
}

- (BOOL)_crlaxIsRectangular
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierPathAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isRectangular");

  return v3;
}

- (BOOL)_crlaxIsTriangular
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierPathAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isTriangular");

  return v3;
}

- (BOOL)_crlaxIsCircular
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierPathAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isCircular");

  return v3;
}

- (BOOL)_crlaxIsDiamond
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierPathAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isDiamond");

  return v3;
}

- (BOOL)_crlaxIsLineSegment
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierPathAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isLineSegment");

  return v3;
}

- (unint64_t)_crlaxElementCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierPathAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "elementCount");

  return (unint64_t)v3;
}

- (BOOL)_crlaxHasZeroArcs
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierPathAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isFlat");

  return v3;
}

- (unint64_t)_crlaxNumberOfSides
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unint64_t v8;
  double v11;
  double v12;
  double v13;
  double v14;

  v3 = -[CRLBezierPathAccessibility _crlaxElementCount](self, "_crlaxElementCount");
  if (!-[CRLBezierPathAccessibility _crlaxHasZeroArcs](self, "_crlaxHasZeroArcs"))
    return 0;
  v4 = -[CRLBezierPathAccessibility _crlaxNumberOfConsecutiveLineSegments](self, "_crlaxNumberOfConsecutiveLineSegments");
  v5 = v4 + -[CRLBezierPathAccessibility _crlaxLastElementIsClose](self, "_crlaxLastElementIsClose");
  v6 = -[CRLBezierPathAccessibility _crlaxLastElementIsMove](self, "_crlaxLastElementIsMove");
  v7 = -2;
  v13 = 0.0;
  v14 = 0.0;
  if (!v6)
    v7 = -1;
  v8 = v7 + v3;
  v12 = 0.0;
  -[CRLBezierPathAccessibility _crlaxElementAtIndex:associatedPoints:](self, "_crlaxElementAtIndex:associatedPoints:", 0, &v13, 0);
  -[CRLBezierPathAccessibility _crlaxElementAtIndex:associatedPoints:](self, "_crlaxElementAtIndex:associatedPoints:", v8, &v11);
  if (v14 == v12 && v13 == v11)
    return v5;
  else
    return 0;
}

- (unint64_t)_crlaxNumberOfConsecutiveLineSegments
{
  return -[CRLBezierPathAccessibility _crlaxNumberOfLineSegmentsConsecutive:](self, "_crlaxNumberOfLineSegmentsConsecutive:", 1);
}

- (unint64_t)_crlaxNumberOfLineSegments
{
  return -[CRLBezierPathAccessibility _crlaxNumberOfLineSegmentsConsecutive:](self, "_crlaxNumberOfLineSegmentsConsecutive:", 0);
}

- (unint64_t)_crlaxNumberOfLineSegmentsConsecutive:(BOOL)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;

  v5 = -[CRLBezierPathAccessibility _crlaxElementCount](self, "_crlaxElementCount");
  if (v5 < 2)
    return 0;
  v6 = v5;
  v7 = 0;
  for (i = 1; i != v6; ++i)
  {
    if ((id)-[CRLBezierPathAccessibility _crlaxElementAtIndex:](self, "_crlaxElementAtIndex:", i) == (id)1
      || !-[CRLBezierPathAccessibility _crlaxElementAtIndex:](self, "_crlaxElementAtIndex:", i))
    {
      ++v7;
    }
    else if (a3)
    {
      return v7;
    }
  }
  return v7;
}

- (unint64_t)_crlaxNumberOfArcs
{
  unint64_t v3;
  unint64_t v4;

  if (-[CRLBezierPathAccessibility _crlaxElementCount](self, "_crlaxElementCount") < 2)
    return 0;
  v3 = 0;
  v4 = 1;
  do
  {
    if ((id)-[CRLBezierPathAccessibility _crlaxElementAtIndex:](self, "_crlaxElementAtIndex:", v4) == (id)2)
      ++v3;
    ++v4;
  }
  while (v4 < -[CRLBezierPathAccessibility _crlaxElementCount](self, "_crlaxElementCount"));
  return v3;
}

- (BOOL)_crlaxLastElementIsMove
{
  return -[CRLBezierPathAccessibility _crlaxElementAtIndex:](self, "_crlaxElementAtIndex:", (char *)-[CRLBezierPathAccessibility _crlaxElementCount](self, "_crlaxElementCount") - 1) == 0;
}

- (BOOL)_crlaxLastElementIsClose
{
  return (id)-[CRLBezierPathAccessibility _crlaxElementAtIndex:](self, "_crlaxElementAtIndex:", (char *)-[CRLBezierPathAccessibility _crlaxElementCount](self, "_crlaxElementCount") - 1) == (id)3;
}

- (int64_t)_crlaxElementAtIndex:(int64_t)a3
{
  int64_t v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003EB288;
  v5[3] = &unk_10122DC18;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)_crlaxElementAtIndex:(int64_t)a3 associatedPoints:(CGPoint *)a4
{
  int64_t v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003EB36C;
  v6[3] = &unk_1012348A0;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  v6[7] = a4;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

@end
