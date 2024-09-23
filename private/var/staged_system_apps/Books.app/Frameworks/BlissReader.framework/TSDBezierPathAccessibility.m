@implementation TSDBezierPathAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDBezierPath");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)tsaxInferredLabelForSize:(CGSize)a3
{
  double height;
  double width;
  __CFString *v6;
  const __CFString *v7;
  NSString *v8;
  unint64_t v10;
  uint64_t v11;
  NSString *v12;
  uint64_t v13;
  unsigned int v14;
  NSString *v15;
  uint64_t v16;
  NSString *v17;
  id v18;
  uint64_t v19;

  height = a3.height;
  width = a3.width;
  if (-[TSDBezierPathAccessibility _tsaxIsLineSegment](self, "_tsaxIsLineSegment"))
  {
    v6 = CFSTR("Line");
    goto LABEL_15;
  }
  if (-[TSDBezierPathAccessibility _tsaxIsRectangular](self, "_tsaxIsRectangular"))
  {
    if (height == width)
      v7 = CFSTR("Square");
    else
      v7 = CFSTR("Rectangle");
  }
  else if (-[TSDBezierPathAccessibility _tsaxIsCircular](self, "_tsaxIsCircular"))
  {
    v7 = CFSTR("Circle");
  }
  else if (-[TSDBezierPathAccessibility _tsaxIsTriangular](self, "_tsaxIsTriangular"))
  {
    v7 = CFSTR("Triangle");
  }
  else
  {
    if (!-[TSDBezierPathAccessibility _tsaxIsDiamond](self, "_tsaxIsDiamond"))
    {
      v10 = -[TSDBezierPathAccessibility _tsaxNumberOfSides](self, "_tsaxNumberOfSides");
      if (v10)
      {
        v11 = v10;
        v12 = TSAccessibilityLocalizedString((uint64_t)CFSTR("shape.with.number.of.sides %@"));
        v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, TSAccessibilityLocalizedUnsignedInteger(v11), v19);
      }
      else
      {
        v13 = -[TSDBezierPathAccessibility _tsaxNumberOfLineSegments](self, "_tsaxNumberOfLineSegments");
        v14 = -[TSDBezierPathAccessibility _tsaxHasZeroArcs](self, "_tsaxHasZeroArcs");
        if (v14 && v13)
        {
          v15 = TSAccessibilityLocalizedString((uint64_t)CFSTR("shape.with.number.of.line.segments %@"));
          v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, TSAccessibilityLocalizedUnsignedInteger(v13), v19);
        }
        else
        {
          v6 = 0;
          if ((v14 & 1) != 0 || !v13)
            goto LABEL_15;
          v16 = -[TSDBezierPathAccessibility _tsaxNumberOfArcs](self, "_tsaxNumberOfArcs");
          v17 = TSAccessibilityLocalizedString((uint64_t)CFSTR("shape.with.number.of.line.segments.and.arcs %@ %@"));
          v18 = TSAccessibilityLocalizedUnsignedInteger(v13);
          v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v18, TSAccessibilityLocalizedUnsignedInteger(v16));
        }
      }
      goto LABEL_14;
    }
    v7 = CFSTR("Diamond");
  }
  v8 = TSAccessibilityLocalizedString((uint64_t)v7);
LABEL_14:
  v6 = (__CFString *)v8;
LABEL_15:
  if (-[__CFString length](v6, "length"))
    return v6;
  else
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("shape"));
}

- (BOOL)_tsaxIsRectangular
{
  return -[TSDBezierPathAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isRectangular"));
}

- (BOOL)_tsaxIsTriangular
{
  return -[TSDBezierPathAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isTriangular"));
}

- (BOOL)_tsaxIsCircular
{
  return -[TSDBezierPathAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isCircular"));
}

- (BOOL)_tsaxIsDiamond
{
  return -[TSDBezierPathAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isDiamond"));
}

- (BOOL)_tsaxIsLineSegment
{
  return -[TSDBezierPathAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isLineSegment"));
}

- (unint64_t)_tsaxElementCount
{
  return (unint64_t)-[TSDBezierPathAccessibility tsaxUnsignedIntegerValueForKey:](self, "tsaxUnsignedIntegerValueForKey:", CFSTR("elementCount"));
}

- (BOOL)_tsaxHasZeroArcs
{
  return -[TSDBezierPathAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isFlat"));
}

- (unint64_t)_tsaxNumberOfSides
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

  v3 = -[TSDBezierPathAccessibility _tsaxElementCount](self, "_tsaxElementCount");
  if (!-[TSDBezierPathAccessibility _tsaxHasZeroArcs](self, "_tsaxHasZeroArcs"))
    return 0;
  v4 = -[TSDBezierPathAccessibility _tsaxNumberOfConsecutiveLineSegments](self, "_tsaxNumberOfConsecutiveLineSegments");
  v5 = v4 + -[TSDBezierPathAccessibility _tsaxLastElementIsClose](self, "_tsaxLastElementIsClose");
  v6 = -[TSDBezierPathAccessibility _tsaxLastElementIsMove](self, "_tsaxLastElementIsMove");
  v7 = -2;
  v13 = 0.0;
  v14 = 0.0;
  if (!v6)
    v7 = -1;
  v8 = v7 + v3;
  v12 = 0.0;
  -[TSDBezierPathAccessibility _tsaxElementAtIndex:associatedPoints:](self, "_tsaxElementAtIndex:associatedPoints:", 0, &v13, 0);
  -[TSDBezierPathAccessibility _tsaxElementAtIndex:associatedPoints:](self, "_tsaxElementAtIndex:associatedPoints:", v8, &v11);
  if (v14 == v12 && v13 == v11)
    return v5;
  else
    return 0;
}

- (unint64_t)_tsaxNumberOfConsecutiveLineSegments
{
  return -[TSDBezierPathAccessibility _tsaxNumberOfLineSegmentsConsecutive:](self, "_tsaxNumberOfLineSegmentsConsecutive:", 1);
}

- (unint64_t)_tsaxNumberOfLineSegments
{
  return -[TSDBezierPathAccessibility _tsaxNumberOfLineSegmentsConsecutive:](self, "_tsaxNumberOfLineSegmentsConsecutive:", 0);
}

- (unint64_t)_tsaxNumberOfLineSegmentsConsecutive:(BOOL)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;

  v5 = -[TSDBezierPathAccessibility _tsaxElementCount](self, "_tsaxElementCount");
  if (v5 < 2)
    return 0;
  v6 = v5;
  v7 = 0;
  for (i = 1; i != v6; ++i)
  {
    if ((char *)-[TSDBezierPathAccessibility _tsaxElementAtIndex:](self, "_tsaxElementAtIndex:", i) == (char *)&dword_0 + 1)
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

- (unint64_t)_tsaxNumberOfArcs
{
  unint64_t v3;
  unint64_t v4;

  if (-[TSDBezierPathAccessibility _tsaxElementCount](self, "_tsaxElementCount") < 2)
    return 0;
  v3 = 0;
  v4 = 1;
  do
  {
    if ((char *)-[TSDBezierPathAccessibility _tsaxElementAtIndex:](self, "_tsaxElementAtIndex:", v4) == (char *)&dword_0 + 2)
      ++v3;
    ++v4;
  }
  while (v4 < -[TSDBezierPathAccessibility _tsaxElementCount](self, "_tsaxElementCount"));
  return v3;
}

- (BOOL)_tsaxLastElementIsMove
{
  return -[TSDBezierPathAccessibility _tsaxElementAtIndex:](self, "_tsaxElementAtIndex:", (char *)-[TSDBezierPathAccessibility _tsaxElementCount](self, "_tsaxElementCount") - 1) == 0;
}

- (BOOL)_tsaxLastElementIsClose
{
  return (char *)-[TSDBezierPathAccessibility _tsaxElementAtIndex:](self, "_tsaxElementAtIndex:", (char *)-[TSDBezierPathAccessibility _tsaxElementCount](self, "_tsaxElementCount") - 1) == (char *)&dword_0 + 3;
}

- (unint64_t)_tsaxElementAtIndex:(int64_t)a3
{
  unint64_t v3;
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
  v5[2] = sub_232618;
  v5[3] = &unk_428E60;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)_tsaxElementAtIndex:(int64_t)a3 associatedPoints:(CGPoint *)a4
{
  unint64_t v4;
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
  v6[2] = sub_2326FC;
  v6[3] = &unk_43B930;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  v6[7] = a4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

@end
