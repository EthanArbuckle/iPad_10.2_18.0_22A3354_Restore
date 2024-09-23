@implementation THWPTOCRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWPTOCRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THWPRepAccessibility, a2);
}

- (unint64_t)thaxLineCount
{
  NSArray *v2;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v2 = -[TSWPRepAccessibility tsaxColumns](self, "tsaxColumns");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v10;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v2);
      v5 += (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "tsaxCountLines");
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  }
  while (v4);
  return v5;
}

- (THChapterViewControllerAccessibility)thaxChapterViewController
{
  void *v3;
  Class v4;
  Class v5;
  void *v6;
  Class v7;
  Class v8;
  void *v9;
  Class v10;
  Class v11;
  void *v12;
  THChapterViewControllerAccessibility *result;
  char v14;
  char v15;
  char v16;
  char v17;

  v17 = 0;
  v3 = (void *)objc_opt_class(THInteractiveCanvasControllerAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSWPRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), 1, &v17);
  if (v17)
    goto LABEL_5;
  v5 = v4;
  v16 = 0;
  v6 = (void *)objc_opt_class(THWScrollableCanvasControllerAccessibility);
  v7 = __TSAccessibilityCastAsSafeCategory(v6, (uint64_t)-[objc_class tsaxDelegate](v5, "tsaxDelegate"), 1, &v16);
  if (v16)
    goto LABEL_5;
  v8 = v7;
  v15 = 0;
  v9 = (void *)objc_opt_class(THWViewportRepAccessibility);
  v10 = __TSAccessibilityCastAsSafeCategory(v9, (uint64_t)-[objc_class thaxDelegate](v8, "thaxDelegate"), 1, &v15);
  if (v15
    || (v11 = v10,
        v14 = 0,
        v12 = (void *)objc_opt_class(THChapterViewControllerAccessibility),
        result = (THChapterViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v12, (uint64_t)objc_msgSend(-[objc_class tsaxInteractiveCanvasController](v11, "tsaxInteractiveCanvasController"), "tsaxDelegate"), 1, &v14), v14))
  {
LABEL_5:
    abort();
  }
  return result;
}

- (THChapterBrowserControllerAccessibility)thaxChapterBrowserController
{
  void *v3;
  THChapterBrowserControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THChapterBrowserControllerAccessibility);
  result = (THChapterBrowserControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THChapterViewControllerAccessibility thaxDelegate](-[THWPTOCRepAccessibility thaxChapterViewController](self, "thaxChapterViewController"), "thaxDelegate"), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (THTOCTileModelAccessibility)thaxTileModel
{
  THChapterBrowserControllerAccessibility *v3;
  void *v4;
  Class v5;
  char v7;

  v3 = -[THWPTOCRepAccessibility thaxChapterBrowserController](self, "thaxChapterBrowserController");
  v7 = 0;
  v4 = (void *)objc_opt_class(THBookViewControllerAccessibility);
  v5 = __TSAccessibilityCastAsSafeCategory(v4, (uint64_t)-[THChapterBrowserControllerAccessibility thaxDelegate](v3, "thaxDelegate"), 1, &v7);
  if (v7)
    abort();
  return (THTOCTileModelAccessibility *)-[objc_class thaxChapterBrowserController:tocTileModelAtIndex:](v5, "thaxChapterBrowserController:tocTileModelAtIndex:", v3, -[THChapterViewControllerAccessibility thaxChapterIndex](-[THWPTOCRepAccessibility thaxChapterViewController](self, "thaxChapterViewController"), "thaxChapterIndex"));
}

- (void)dealloc
{
  objc_super v3;

  -[THWPTOCRepAccessibility tsaxInvalidateChildrenImmediately](self, "tsaxInvalidateChildrenImmediately");
  v3.receiver = self;
  v3.super_class = (Class)THWPTOCRepAccessibility;
  -[TSDRepAccessibility dealloc](&v3, "dealloc");
}

- (BOOL)isAccessibilityElement
{
  return !-[THWPTOCRepAccessibility _thaxContainsSmartFields](self, "_thaxContainsSmartFields");
}

- (int64_t)accessibilityContainerType
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWPTOCRepAccessibility;
  v3 = -[THWPTOCRepAccessibility accessibilityContainerType](&v5, "accessibilityContainerType");
  if (-[THWPTOCRepAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
    return (int64_t)v3;
  else
    return 4;
}

- (id)accessibilityLabel
{
  if (-[THWPTOCRepAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
    return 0;
  else
    return THAccessibilityLocalizedString((uint64_t)CFSTR("table.of.contents"));
}

- (id)accessibilityValue
{
  objc_super v4;

  if (!-[THWPTOCRepAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)THWPTOCRepAccessibility;
  return -[TSWPRepAccessibility accessibilityValue](&v4, "accessibilityValue");
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return !-[THWPTOCRepAccessibility isAccessibilityElement](self, "isAccessibilityElement");
}

- (void)tsaxLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWPTOCRepAccessibility;
  -[TSWPRepAccessibility tsaxLoadAccessibilityInformation](&v3, "tsaxLoadAccessibilityInformation");
  -[THWPTOCRepAccessibility tsaxEnsureChildrenAreLoaded](self, "tsaxEnsureChildrenAreLoaded");
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  void *i;
  void *v6;
  char *v7;
  char *v8;
  char *j;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  THWPTOCRepEntryAccessibilityElement *v14;
  NSArray *obj;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = -[TSWPRepAccessibility tsaxColumns](self, "tsaxColumns");
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v7 = (char *)objc_msgSend(v6, "tsaxCountLines");
        if (v7)
        {
          v8 = v7;
          for (j = 0; j != v8; ++j)
          {
            v10 = objc_msgSend(v6, "tsaxRangeOfLineFragmentAtIndex:", j);
            v12 = v11;
            v13 = -[THWPTOCRepAccessibility _thaxHyperlinkFieldForRange:](self, "_thaxHyperlinkFieldForRange:", v10, v11);
            if (v13)
            {
              v14 = -[THWPTOCRepEntryAccessibilityElement initWithParentTOCRep:linkField:textRange:indexInTOC:]([THWPTOCRepEntryAccessibilityElement alloc], "initWithParentTOCRep:linkField:textRange:indexInTOC:", self, v13, v10, v12, j);
              objc_msgSend(a3, "addObject:", v14);

            }
          }
        }
      }
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v17);
  }
}

- (void)tsaxChildWillBeRemoved:(id)a3
{
  objc_class *v4;
  void *v5;

  v4 = (objc_class *)objc_opt_class(THWPTOCRepEntryAccessibilityElement);
  v5 = (void *)__TSAccessibilityCastAsClass(v4, (uint64_t)a3, 0, 0);
  objc_msgSend(v5, "setParentTOCRep:", 0);
}

- (BOOL)_thaxContainsSmartFields
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_26A658;
  v4[3] = &unk_43C878;
  v4[4] = &v5;
  -[TSWPStorageAccessibility tsaxEnumerateSmartFieldsUsingBlock:](-[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage"), "tsaxEnumerateSmartFieldsUsingBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)_thaxHyperlinkFieldForRange:(_NSRange)a3
{
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_26A748;
  v10 = sub_26A758;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_26A764;
  v5[3] = &unk_43C878;
  v5[4] = &v6;
  -[TSWPStorageAccessibility tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:](-[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage"), "tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, a3.location, a3.length, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end
