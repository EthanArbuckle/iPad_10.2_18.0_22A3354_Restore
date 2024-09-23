@implementation THTSWPRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSWPRepAccessibility, a2);
}

- (int64_t)thaxLineIndexAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  NSArray *v5;
  id v6;
  id v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  void *i;
  void *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  CGPoint v23;
  CGRect v24;

  y = a3.y;
  x = a3.x;
  v5 = -[TSWPRepAccessibility tsaxColumns](self, "tsaxColumns");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v6)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v19;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
      v13 = (char *)objc_msgSend(v12, "tsaxCountLines");
      if (v13)
      {
        v14 = v13;
        v15 = 0;
        v16 = &v13[v8];
        while (1)
        {
          objc_msgSend(v12, "tsaxBoundsOfLineFragmentAtIndex:", v15);
          v23.x = x;
          v23.y = y;
          if (CGRectContainsPoint(v24, v23))
            break;
          if (v14 == (char *)++v15)
          {
            v8 = (int64_t)v16;
            goto LABEL_12;
          }
        }
        v8 += v15;
        v10 = v8;
      }
LABEL_12:
      ;
    }
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v7);
  return v10;
}

- (id)thaxContentForLineIndex:(unint64_t)a3
{
  id v5;
  id v6;
  id v7;
  id v9;
  id v10;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v5 = -[THTSWPRepAccessibility _thaxColumnForLineIndex:](self, "_thaxColumnForLineIndex:");
  if (!v5)
  {
    if (!TSAccessibilityShouldPerformValidationChecks())
      return 0;
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    v18 = __TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Line fragment not found for index: %lu"), v13, v14, v15, v16, v17, a3);
LABEL_12:
    if (v18)
      goto LABEL_17;
    return 0;
  }
  v6 = objc_msgSend(v5, "tsaxRangeOfLineFragmentAtIndex:", -[THTSWPRepAccessibility _thaxLineIndexInColumn:forLineIndex:](self, "_thaxLineIndexInColumn:forLineIndex:", v5, a3));
  if (v6 == NSInvalidRange[0] && v7 == NSInvalidRange[1])
  {
    if (!TSAccessibilityShouldPerformValidationChecks())
      return 0;
    v19 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    v18 = __TSAccessibilityHandleValidationErrorWithDescription(v19, 0, (uint64_t)CFSTR("Line fragment range not found for index: %lu, in column: %@"), v20, v21, v22, v23, v24, a3);
    goto LABEL_12;
  }
  v9 = v6;
  v10 = v7;
  if (-[THTSWPRepAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxSubstringInStorageWithRange:", &OBJC_PROTOCOL___TSWPRepAccessibilityExtras))return -[TSWPRepAccessibility tsaxSubstringInStorageWithRange:](self, "tsaxSubstringInStorageWithRange:", v9, v10);
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    v25 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(v25, 0, (uint64_t)CFSTR("THTSWPRepAccessibility should have implemented tsaxSubstringInStorageWithRange from TSWPRepAccessibilityExtras protocol"), v26, v27, v28, v29, v30, v31))LABEL_17:abort();
  }
  return -[TSWPStorageAccessibility tsaxSubstringWithRange:](-[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage"), "tsaxSubstringWithRange:", v9, v10);
}

- (CGRect)thaxFrameForLineIndex:(unint64_t)a3
{
  id v5;
  unint64_t v6;
  double v7;
  CGFloat x;
  double v9;
  CGFloat y;
  double v11;
  CGFloat width;
  double v13;
  CGFloat height;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v5 = -[THTSWPRepAccessibility _thaxColumnForLineIndex:](self, "_thaxColumnForLineIndex:");
  v6 = -[THTSWPRepAccessibility _thaxLineIndexInColumn:forLineIndex:](self, "_thaxLineIndexInColumn:forLineIndex:", v5, a3);
  if (v5)
  {
    objc_msgSend(v5, "tsaxBoundsOfLineFragmentAtIndex:", v6);
    -[TSDRepAccessibility tsaxConvertNaturalRectToScreenSpace:](self, "tsaxConvertNaturalRectToScreenSpace:");
    x = v7;
    y = v9;
    width = v11;
    height = v13;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Line fragment not found for index: %lu"), v16, v17, v18, v19, v20, a3))abort();
    }
  }
  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)_thaxColumnForLineIndex:(unint64_t)a3
{
  NSArray *v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int ShouldPerformValidationChecks;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = -[TSWPRepAccessibility tsaxColumns](self, "tsaxColumns");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v20;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
      v7 += (unint64_t)objc_msgSend(v10, "tsaxCountLines");
      if (v7 > a3)
        break;
      if (v6 == (id)++v9)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }
  ShouldPerformValidationChecks = TSAccessibilityShouldPerformValidationChecks();
  if (!v10)
  {
    if (ShouldPerformValidationChecks)
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("No line fragment found at index: %lu"), v13, v14, v15, v16, v17, a3))abort();
    }
  }
  return v10;
}

- (unint64_t)_thaxLineIndexInColumn:(id)a3 forLineIndex:(unint64_t)a4
{
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v6 = -[TSWPRepAccessibility tsaxColumns](self, "tsaxColumns");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v22;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v10)
        objc_enumerationMutation(v6);
      v12 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * v11);
      if (v12 == a3)
        break;
      v9 += (uint64_t)objc_msgSend(v12, "tsaxCountLines");
      if (v8 == (id)++v11)
      {
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v9 = 0;
  }
  v13 = a4 - v9;
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if (v13 >= (unint64_t)objc_msgSend(a3, "tsaxCountLines") + v9)
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Line index is out of bounds for specified column"), v15, v16, v17, v18, v19, v21))abort();
    }
  }
  return v13;
}

- (_NSRange)_thaxSelectedRepRange
{
  id AssociatedRange;
  NSUInteger v3;
  _NSRange result;

  AssociatedRange = __TSAccessibilityGetAssociatedRange(self, &unk_543A4B);
  result.length = v3;
  result.location = (NSUInteger)AssociatedRange;
  return result;
}

- (void)_thaxSetSelectedRepRange:(_NSRange)a3
{
  __TSAccessibilitySetAssociatedRange(self, &unk_543A4B, a3.location, a3.length);
}

- (id)thaxParentPageRep
{
  TSDRepAccessibility *i;

  for (i = -[TSDRepAccessibility tsaxParentRep](self, "tsaxParentRep");
        i;
        i = -[TSDRepAccessibility tsaxParentRep](i, "tsaxParentRep"))
  {
    if ((objc_opt_isKindOfClass(i, +[TSAccessibilitySafeCategory tsaxTargetClass](THPageRepAccessibility, "tsaxTargetClass")) & 1) != 0)break;
  }
  return i;
}

- (BOOL)thaxIsLastTextRepOnCurrentPage
{
  return objc_msgSend(-[THTSWPRepAccessibility thaxParentPageRep](self, "thaxParentPageRep"), "thaxRepIsLastTextElementOnPage:", self);
}

- (BOOL)isAccessibilityElement
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THTSWPRepAccessibility;
  v3 = -[TSWPRepAccessibility isAccessibilityElement](&v5, "isAccessibilityElement");
  if (v3)
    LOBYTE(v3) = objc_msgSend(-[TSWPRepAccessibility accessibilityValue](self, "accessibilityValue"), "length") != 0;
  return v3;
}

- (id)accessibilityLabel
{
  return 0;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 0;
}

- (BOOL)accessibilityActivate
{
  return 0;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  id v2;
  id v3;
  _NSRange result;

  v2 = -[THTSWPRepAccessibility _thaxSelectedRepRange](self, "_thaxSelectedRepRange");
  if (v2 == NSInvalidRange[0] && v3 == NSInvalidRange[1])
  {
    v2 = 0;
    v3 = 0;
  }
  result.length = (NSUInteger)v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  objc_super v7;

  length = a3.length;
  location = a3.location;
  if (a3.length || (-[THTSWPRepAccessibility _thaxSelectedRepRange](self, "_thaxSelectedRepRange"), v6))
  {
    v7.receiver = self;
    v7.super_class = (Class)THTSWPRepAccessibility;
    -[TSWPRepAccessibility _accessibilitySetSelectedTextRange:](&v7, "_accessibilitySetSelectedTextRange:", location, length);
  }
  -[THTSWPRepAccessibility _thaxSetSelectedRepRange:](self, "_thaxSetSelectedRepRange:", location, length);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THTSWPRepAccessibility;
  v3 = -[TSWPRepAccessibility accessibilityTraits](&v7, "accessibilityTraits") & ~(TSAccessibilityTraitTextEntry | TSAccessibilityTraitTextArea) | UIAccessibilityTraitCausesPageTurn | TSAccessibilityTraitIsEditing | TSAccessibilityTraitStaticText;
  -[THTSWPRepAccessibility _accessibilitySelectedTextRange](self, "_accessibilitySelectedTextRange");
  v4 = TSAccessibilityTraitTextOperationsAvailable;
  if (!v5)
    v4 = 0;
  return v3 | v4;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (int64_t)accessibilityLineNumberForPoint:(CGPoint)a3
{
  -[TSDInteractiveCanvasControllerAccessibility tsaxConvertBoundsToUnscaledPoint:](-[TSWPRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxConvertBoundsToUnscaledPoint:", a3.x, a3.y);
  -[TSDRepAccessibility tsaxConvertNaturalPointFromUnscaledCanvas:](self, "tsaxConvertNaturalPointFromUnscaledCanvas:");
  return -[THTSWPRepAccessibility thaxLineIndexAtPoint:](self, "thaxLineIndexAtPoint:");
}

- (id)accessibilityContentForLineNumber:(int64_t)a3
{
  if (a3 < 0)
    return 0;
  else
    return -[THTSWPRepAccessibility thaxContentForLineIndex:](self, "thaxContentForLineIndex:");
}

- (CGRect)accessibilityFrameForLineNumber:(int64_t)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (a3 < 0)
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  else
  {
    -[THTSWPRepAccessibility thaxFrameForLineIndex:](self, "thaxFrameForLineIndex:");
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)accessibilityTextualContext
{
  return UIAccessibilityTextualContextNarrative;
}

- (CGRect)_accessibilityFrameForRange:(_NSRange)a3
{
  CGSize size;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[6];
  _NSRange v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  const char *v17;
  CGPoint origin;
  CGSize v19;
  CGRect result;

  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x4010000000;
  v17 = "";
  size = CGRectZero.size;
  origin = CGRectZero.origin;
  v19 = size;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_270FE8;
  v12[3] = &unk_43B930;
  v12[4] = self;
  v12[5] = &v14;
  v13 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v12))
    abort();
  v4 = v15[4];
  v5 = v15[5];
  v6 = v15[6];
  v7 = v15[7];
  _Block_object_dispose(&v14, 8);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (BOOL)_accessibilityIncludeDuringContentReading
{
  return 1;
}

- (id)accessibilityPreviousTextNavigationElement
{
  id v3;
  char *v4;

  v3 = objc_msgSend(-[THTSWPRepAccessibility thaxParentPageRep](self, "thaxParentPageRep"), "thaxPageContentReps");
  v4 = (char *)objc_msgSend(v3, "indexOfObject:", self);
  if (v4 && v4 != (char *)0x7FFFFFFFFFFFFFFFLL)
    return objc_msgSend(v3, "objectAtIndexedSubscript:", v4 - 1);
  else
    return 0;
}

- (id)accessibilityNextTextNavigationElement
{
  id v3;
  char *v4;
  char *v5;

  v3 = objc_msgSend(-[THTSWPRepAccessibility thaxParentPageRep](self, "thaxParentPageRep"), "thaxPageContentReps");
  v4 = (char *)objc_msgSend(v3, "indexOfObject:", self);
  if (v4 == (char *)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v5 = v4;
  if (v4 >= (char *)objc_msgSend(v3, "count") - 1)
    return 0;
  else
    return objc_msgSend(v3, "objectAtIndexedSubscript:", v5 + 1);
}

- (unint64_t)_tsaxLinePosition:(BOOL)a3
{
  _BOOL4 v3;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v11;
  char *v12;
  id v13;
  unsigned int v14;
  char *v15;
  char *v16;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = a3;
  v5 = (char *)-[TSWPEditingControllerAccessibility tsaxSelectedTextRange](-[TSWPRepAccessibility tsaxEditingController](self, "tsaxEditingController"), "tsaxSelectedTextRange");
  v7 = (uint64_t)&v5[v6];
  v8 = (char *)-[TSWPEditingControllerAccessibility tsaxStorageRangeOfLineFragmentAtCharIndex:](-[TSWPRepAccessibility tsaxEditingController](self, "tsaxEditingController"), "tsaxStorageRangeOfLineFragmentAtCharIndex:", &v5[v6]);
  if (v8 == NSInvalidRange[0] && v9 == NSInvalidRange[1])
  {
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Line fragment range not found for positionInStorage: %lu"), v19, v20, v21, v22, v23, v7))abort();
    }
    return -1;
  }
  else
  {
    v11 = v8;
    v12 = v9;
    v13 = -[TSWPStorageAccessibility tsaxSubstringWithRange:](-[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage"), "tsaxSubstringWithRange:", v8, v9);
    v14 = objc_msgSend(v13, "hasPrefix:", CFSTR("\n"));
    v15 = &v11[v14];
    v16 = &v12[-v14 - objc_msgSend(v13, "hasSuffix:", CFSTR("\n"))];
    if (v3)
      return (unint64_t)-[TSWPRepAccessibility tsaxRepRangeWithStorageRange:](self, "tsaxRepRangeWithStorageRange:", v15, v16);
    else
      return -[TSWPRepAccessibility tsaxRepPositionWithStoragePosition:](self, "tsaxRepPositionWithStoragePosition:", &v15[(_QWORD)v16]);
  }
}

@end
