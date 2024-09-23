@implementation THCachedAnnotationAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THCachedAnnotation");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)thaxParentHighlightController
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_543A31);
}

- (void)thaxSetParentHighlightController:(id)a3
{
  __TSAccessibilitySetAssociatedNonRetainedObject(self, &unk_543A31, a3);
}

- (NSString)thaxHighlightedTextDescription
{
  NSString *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[THCachedAnnotationAccessibility thaxHighlightStyleDescription](self, "thaxHighlightStyleDescription");
  v4 = -[THCachedAnnotationAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_annotationRepresentativeText"));
  return (NSString *)__TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

- (NSString)thaxHighlightedText
{
  return (NSString *)-[THCachedAnnotationAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_annotationRepresentativeText"));
}

- (_NSRange)thaxAnnotationStorageRange
{
  id v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[THCachedAnnotationAccessibility tsaxRangeValueForKey:](self, "tsaxRangeValueForKey:", CFSTR("annotationStorageRange"));
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (NSString)thaxNoteText
{
  objc_class *v3;
  NSString *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THCachedAnnotationAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_annotationNote")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (NSString)thaxHighlightStyleDescription
{
  unsigned int v3;
  const __CFString *v4;
  const __CFString *v5;
  uint64_t v6;
  NSString *result;

  switch(-[THCachedAnnotationAccessibility tsaxIntValueForKey:](self, "tsaxIntValueForKey:", CFSTR("_annotationStyle")))
  {
    case 1u:
      v3 = -[THCachedAnnotationAccessibility thaxHasNote](self, "thaxHasNote");
      v4 = CFSTR("highlight.color.green");
      v5 = CFSTR("highlight.color.green.with.note");
      goto LABEL_8;
    case 2u:
      v3 = -[THCachedAnnotationAccessibility thaxHasNote](self, "thaxHasNote");
      v4 = CFSTR("highlight.color.blue");
      v5 = CFSTR("highlight.color.blue.with.note");
      goto LABEL_8;
    case 3u:
      v3 = -[THCachedAnnotationAccessibility thaxHasNote](self, "thaxHasNote");
      v4 = CFSTR("highlight.color.yellow");
      v5 = CFSTR("highlight.color.yellow.with.note");
      goto LABEL_8;
    case 4u:
      v3 = -[THCachedAnnotationAccessibility thaxHasNote](self, "thaxHasNote");
      v4 = CFSTR("highlight.color.pink");
      v5 = CFSTR("highlight.color.pink.with.note");
      goto LABEL_8;
    case 5u:
      v3 = -[THCachedAnnotationAccessibility thaxHasNote](self, "thaxHasNote");
      v4 = CFSTR("highlight.color.purple");
      v5 = CFSTR("highlight.color.purple.with.note");
      goto LABEL_8;
    case 6u:
      v3 = -[THCachedAnnotationAccessibility thaxHasNote](self, "thaxHasNote");
      v4 = CFSTR("highlight.underlined.text");
      v5 = CFSTR("highlight.underlined.text.with.note");
LABEL_8:
      if (v3)
        v6 = (uint64_t)v5;
      else
        v6 = (uint64_t)v4;
      result = THAccessibilityLocalizedString(v6);
      if (!result)
        goto LABEL_12;
      return result;
    default:
LABEL_12:
      if (-[THCachedAnnotationAccessibility thaxHasNote](self, "thaxHasNote"))
        return THAccessibilityLocalizedString((uint64_t)CFSTR("highlight.generic.with.note"));
      else
        return THAccessibilityLocalizedString((uint64_t)CFSTR("highlight.generic"));
  }
}

- (BOOL)thaxHasNote
{
  return -[NSString length](-[THCachedAnnotationAccessibility thaxNoteText](self, "thaxNoteText"), "length") != 0;
}

- (id)thaxParentRep
{
  return objc_msgSend(-[THCachedAnnotationAccessibility thaxParentHighlightController](self, "thaxParentHighlightController"), "tsaxValueForKey:", CFSTR("parentRep"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  CGSize size;
  id v4;
  id v5;
  id v6;
  void *v7;
  Class v8;
  Class v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _QWORD v23[8];
  char v24;
  uint64_t v25;
  double *v26;
  uint64_t v27;
  const char *v28;
  CGPoint origin;
  CGSize v30;
  CGRect result;

  v25 = 0;
  v26 = (double *)&v25;
  v27 = 0x4010000000;
  v28 = "";
  size = CGRectZero.size;
  origin = CGRectZero.origin;
  v30 = size;
  v4 = -[THCachedAnnotationAccessibility thaxParentHighlightController](self, "thaxParentHighlightController");
  v5 = -[THCachedAnnotationAccessibility thaxParentRep](self, "thaxParentRep");
  v6 = objc_msgSend(objc_msgSend(v5, "tsaxValueForKey:", CFSTR("canvas")), "tsaxValueForKey:", CFSTR("canvasController"));
  v24 = 0;
  v7 = (void *)objc_opt_class(TSDCanvasAccessibility);
  v8 = __TSAccessibilityCastAsSafeCategory(v7, (uint64_t)objc_msgSend(v6, "tsaxValueForKey:", CFSTR("canvas")), 1, &v24);
  if (v24)
    abort();
  v9 = v8;
  if (v8)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_26C5A0;
    v23[3] = &unk_43B9F0;
    v23[4] = v4;
    v23[5] = self;
    v23[6] = v5;
    v23[7] = &v25;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v23))
      abort();
    -[objc_class tsaxScreenFrameFromUnscaledCanvas:](v9, "tsaxScreenFrameFromUnscaledCanvas:", v26[4], v26[5], v26[6], v26[7]);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = v26;
    v26[4] = v10;
    v18[5] = v12;
    v18[6] = v14;
    v18[7] = v16;
  }
  else
  {
    v11 = v26[4];
    v13 = v26[5];
    v15 = v26[6];
    v17 = v26[7];
  }
  _Block_object_dispose(&v25, 8);
  v19 = v11;
  v20 = v13;
  v21 = v15;
  v22 = v17;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (BOOL)_axShouldTreatAsCustomItemForTextElement
{
  return 1;
}

@end
