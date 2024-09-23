@implementation THInteractiveCanvasControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THInteractiveCanvasController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THTSDInteractiveCanvasControllerAccessibility, a2);
}

- (THDocumentNavigatorAccessibility)thaxDocumentNavigator
{
  void *v3;
  THDocumentNavigatorAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THDocumentNavigatorAccessibility);
  result = (THDocumentNavigatorAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THInteractiveCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("documentNavigator")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (THDocumentRootAccessibility)thaxDocumentRoot
{
  void *v3;
  THDocumentRootAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THDocumentRootAccessibility);
  result = (THDocumentRootAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THInteractiveCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("documentRoot")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (THModelNodeAccessibility)thaxCurrentChapterNode
{
  return (THModelNodeAccessibility *)-[THDocumentNavigationModelAccessibility thaxChapterNodeForContentNode:](-[THDocumentRootAccessibility thaxNavigationModel](-[THInteractiveCanvasControllerAccessibility thaxDocumentRoot](self, "thaxDocumentRoot"), "thaxNavigationModel"), "thaxChapterNodeForContentNode:", -[THInteractiveCanvasControllerAccessibility thaxCurrentContentNode](self, "thaxCurrentContentNode"));
}

- (THModelNodeAccessibility)thaxCurrentLessonNode
{
  return (THModelNodeAccessibility *)-[THDocumentNavigationModelAccessibility thaxLessonNodeForContentNode:](-[THDocumentRootAccessibility thaxNavigationModel](-[THInteractiveCanvasControllerAccessibility thaxDocumentRoot](self, "thaxDocumentRoot"), "thaxNavigationModel"), "thaxLessonNodeForContentNode:", -[THInteractiveCanvasControllerAccessibility thaxCurrentContentNode](self, "thaxCurrentContentNode"));
}

- (THModelContentNodeAccessibility)thaxCurrentContentNode
{
  return (THModelContentNodeAccessibility *)-[THModelNodeAccessibility thaxContentNodeForRelativePageIndex:forPresentationType:](-[THDocumentRootAccessibility thaxRootNode](-[THInteractiveCanvasControllerAccessibility thaxDocumentRoot](self, "thaxDocumentRoot"), "thaxRootNode"), "thaxContentNodeForRelativePageIndex:forPresentationType:", -[THInteractiveCanvasControllerAccessibility thaxCurrentAbsolutePageIndex](self, "thaxCurrentAbsolutePageIndex"), +[THPresentationTypeAccessibility thaxPaginatedPresentationTypeInContext:](THPresentationTypeAccessibility, "thaxPaginatedPresentationTypeInContext:", -[THDocumentRootAccessibility thaxContext](-[THInteractiveCanvasControllerAccessibility thaxDocumentRoot](self, "thaxDocumentRoot"), "thaxContext")));
}

- (unint64_t)thaxCurrentAbsolutePageIndex
{
  return -[THDocumentNavigatorAccessibility thaxCurrentAbsolutePageIndex](-[THInteractiveCanvasControllerAccessibility thaxDocumentNavigator](self, "thaxDocumentNavigator"), "thaxCurrentAbsolutePageIndex");
}

- (NSString)thaxCurrentChapterName
{
  return (NSString *)-[THDocumentNavigationModelAccessibility thaxChapterAndNumberStringForNavigationUnit:](-[THDocumentRootAccessibility thaxNavigationModel](-[THInteractiveCanvasControllerAccessibility thaxDocumentRoot](self, "thaxDocumentRoot"), "thaxNavigationModel"), "thaxChapterAndNumberStringForNavigationUnit:", -[THInteractiveCanvasControllerAccessibility thaxCurrentNavigationUnit](self, "thaxCurrentNavigationUnit"));
}

- (NSString)thaxCurrentSectionString
{
  THModelContentNodeAccessibility *v2;
  id v3;

  v2 = -[THInteractiveCanvasControllerAccessibility thaxCurrentContentNode](self, "thaxCurrentContentNode");
  v3 = -[THModelContainerNodeAccessibility thaxIndexOfNode:](-[THModelNodeAccessibility thaxParent](v2, "thaxParent"), "thaxIndexOfNode:", v2);
  if (v3 && v3 != (id)0x7FFFFFFFFFFFFFFFLL)
    return +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", THAccessibilityLocalizedString((uint64_t)CFSTR("section.number %@")), +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v3));
  else
    return 0;
}

- (NSString)thaxCurrentLessonName
{
  THDocumentRootAccessibility *v3;

  v3 = -[THInteractiveCanvasControllerAccessibility thaxDocumentRoot](self, "thaxDocumentRoot");
  return (NSString *)-[THDocumentNavigationModelAccessibility thaxMinorSnippetForAbsolutePageIndex:withDocumentRoot:forPresentationType:](-[THDocumentRootAccessibility thaxNavigationModel](-[THInteractiveCanvasControllerAccessibility thaxDocumentRoot](self, "thaxDocumentRoot"), "thaxNavigationModel"), "thaxMinorSnippetForAbsolutePageIndex:withDocumentRoot:forPresentationType:", -[THInteractiveCanvasControllerAccessibility thaxCurrentAbsolutePageIndex](self, "thaxCurrentAbsolutePageIndex"), v3, +[THPresentationTypeAccessibility thaxPaginatedPresentationTypeInContext:](THPresentationTypeAccessibility, "thaxPaginatedPresentationTypeInContext:", -[THDocumentRootAccessibility thaxContext](v3, "thaxContext")));
}

- (BOOL)thaxIsOnFirstPageOfCurrentChapter
{
  return -[THInteractiveCanvasControllerAccessibility thaxAbsolutePageNumberIsFirstPageOfChapter:](self, "thaxAbsolutePageNumberIsFirstPageOfChapter:", -[THInteractiveCanvasControllerAccessibility thaxCurrentAbsolutePageIndex](self, "thaxCurrentAbsolutePageIndex"));
}

- (BOOL)thaxIsOnFirstPageOfCurrentLesson
{
  return -[THInteractiveCanvasControllerAccessibility thaxAbsolutePageNumberIsFirstPageOfLesson:](self, "thaxAbsolutePageNumberIsFirstPageOfLesson:", -[THInteractiveCanvasControllerAccessibility thaxCurrentAbsolutePageIndex](self, "thaxCurrentAbsolutePageIndex"));
}

- (id)thaxCurrentNavigationUnit
{
  return -[THDocumentNavigationModelAccessibility thaxNavigationUnitContainingContentNode:](-[THDocumentRootAccessibility thaxNavigationModel](-[THInteractiveCanvasControllerAccessibility thaxDocumentRoot](self, "thaxDocumentRoot"), "thaxNavigationModel"), "thaxNavigationUnitContainingContentNode:", -[THInteractiveCanvasControllerAccessibility thaxCurrentContentNode](self, "thaxCurrentContentNode"));
}

- (BOOL)thaxIsAtEndOfBook
{
  char *v3;
  int ShouldPerformValidationChecks;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v13;

  if (-[THModelNodeAccessibility thaxAbsolutePageRangeForPresentationType:](-[THModelNodeAccessibility thaxParent](-[THInteractiveCanvasControllerAccessibility thaxCurrentChapterNode](self, "thaxCurrentChapterNode"), "thaxParent"), "thaxAbsolutePageRangeForPresentationType:", +[THPresentationTypeAccessibility thaxPaginatedPresentationTypeInContext:](THPresentationTypeAccessibility, "thaxPaginatedPresentationTypeInContext:", -[THDocumentRootAccessibility thaxContext](-[THInteractiveCanvasControllerAccessibility thaxDocumentRoot](self, "thaxDocumentRoot"), "thaxContext"))))
  {
    ShouldPerformValidationChecks = TSAccessibilityShouldPerformValidationChecks();
    if (ShouldPerformValidationChecks)
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      v11 = __TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Expected parent model node of chapter node to contain the full book."), v6, v7, v8, v9, v10, v13);
      LOBYTE(ShouldPerformValidationChecks) = 0;
      if (v11)
        abort();
    }
  }
  else
  {
    LOBYTE(ShouldPerformValidationChecks) = (char *)-[THInteractiveCanvasControllerAccessibility thaxCurrentAbsolutePageIndex](self, "thaxCurrentAbsolutePageIndex")+ 1 == v3;
  }
  return ShouldPerformValidationChecks;
}

- (void)thaxHandleHyperlink:(id)a3 hitRep:(id)a4
{
  _QWORD v4[7];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_256788;
  v4[3] = &unk_426F18;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();
}

- (id)thaxSectionNameForAbsolutePageIndex:(unint64_t)a3
{
  return -[THDocumentNavigationModelAccessibility thaxMinorSnippetForAbsolutePageIndex:withDocumentRoot:forPresentationType:](-[THDocumentRootAccessibility thaxNavigationModel](-[THInteractiveCanvasControllerAccessibility thaxDocumentRoot](self, "thaxDocumentRoot"), "thaxNavigationModel"), "thaxMinorSnippetForAbsolutePageIndex:withDocumentRoot:forPresentationType:", a3, -[THInteractiveCanvasControllerAccessibility thaxDocumentRoot](self, "thaxDocumentRoot"), +[THPresentationTypeAccessibility thaxPaginatedPresentationTypeInContext:](THPresentationTypeAccessibility, "thaxPaginatedPresentationTypeInContext:", -[THDocumentRootAccessibility thaxContext](-[THInteractiveCanvasControllerAccessibility thaxDocumentRoot](self, "thaxDocumentRoot"), "thaxContext")));
}

- (BOOL)thaxAbsolutePageNumberIsFirstPageOfChapter:(unint64_t)a3
{
  id v4;

  v4 = -[THModelNodeAccessibility thaxAbsolutePageRangeForPresentationType:](-[THInteractiveCanvasControllerAccessibility thaxCurrentChapterNode](self, "thaxCurrentChapterNode"), "thaxAbsolutePageRangeForPresentationType:", +[THPresentationTypeAccessibility thaxPaginatedPresentationTypeInContext:](THPresentationTypeAccessibility, "thaxPaginatedPresentationTypeInContext:", -[THDocumentRootAccessibility thaxContext](-[THInteractiveCanvasControllerAccessibility thaxDocumentRoot](self, "thaxDocumentRoot"), "thaxContext")));
  return a3 != 0x7FFFFFFFFFFFFFFFLL && v4 == (id)a3;
}

- (BOOL)thaxAbsolutePageNumberIsFirstPageOfLesson:(unint64_t)a3
{
  id v4;

  v4 = -[THModelNodeAccessibility thaxAbsolutePageRangeForPresentationType:](-[THInteractiveCanvasControllerAccessibility thaxCurrentLessonNode](self, "thaxCurrentLessonNode"), "thaxAbsolutePageRangeForPresentationType:", +[THPresentationTypeAccessibility thaxPaginatedPresentationTypeInContext:](THPresentationTypeAccessibility, "thaxPaginatedPresentationTypeInContext:", -[THDocumentRootAccessibility thaxContext](-[THInteractiveCanvasControllerAccessibility thaxDocumentRoot](self, "thaxDocumentRoot"), "thaxContext")));
  return a3 != 0x7FFFFFFFFFFFFFFFLL && v4 == (id)a3;
}

- (id)thaxBodyRepForStorage:(id)a3
{
  NSSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  Class v11;
  Class v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = -[TSDCanvasAccessibility tsaxAllReps](-[TSDInteractiveCanvasControllerAccessibility tsaxCanvas](self, "tsaxCanvas"), "tsaxAllReps");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v15;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v15 != v7)
      objc_enumerationMutation(v4);
    v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
    v10 = (void *)objc_opt_class(THBodyRepAccessibility);
    v11 = __TSAccessibilityCastAsSafeCategory(v10, v9, 0, 0);
    if (v11)
    {
      v12 = v11;
      if (-[objc_class tsaxStorage](v11, "tsaxStorage") == a3)
        return v12;
    }
    if (v6 == (id)++v8)
    {
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (BOOL)thaxShouldFilterTopLevelRepsForHitTesting
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A2E);
}

- (void)thaxSetShouldFilterTopLevelRepsForHitTesting:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A2E, a3);
}

- (id)thaxCurrentResponderElement
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_543A2F);
}

- (void)thaxSetCurrentResponderElement:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_543A2F, a3);
}

- (THDocumentViewControllerAccessibility)thaxDocumentViewController
{
  void *v3;

  v3 = (void *)objc_opt_class(THDocumentViewControllerAccessibility);
  return (THDocumentViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDInteractiveCanvasControllerAccessibility tsaxDelegate](self, "tsaxDelegate"), 0, 0);
}

- (BOOL)thaxHyperlinkFieldRepresentsAGlossaryTerm:(id)a3
{
  THDocumentViewControllerAccessibility *v5;
  char v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = -[THInteractiveCanvasControllerAccessibility thaxDocumentViewController](self, "thaxDocumentViewController");
  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_2682A4;
    v8[3] = &unk_43C7A8;
    v8[4] = self;
    v8[5] = a3;
    v8[6] = v5;
    v8[7] = &v9;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v8))
      abort();
  }
  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)thaxPressableRepWasPressedAtActivationPoint:(id)a3
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11[6];

  if (TSAccessibilityShouldPerformValidationChecks()
    && (objc_msgSend(a3, "conformsToProtocol:", NSProtocolFromString(CFSTR("THWPressableRep"))) & 1) == 0
    && (ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch(),
        __TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("You should not call this method for a rep that does not conform to the THWPressableRep protocol!"), v6, v7, v8, v9, v10, v11[0]))|| (v11[0] = (uint64_t)_NSConcreteStackBlock, v11[1] = 3221225472, v11[2] = (uint64_t)sub_2683B0, v11[3] = (uint64_t)&unk_426E28, v11[4] = (uint64_t)self, v11[5] = (uint64_t)a3, __TSAccessibilityPerformSafeBlock((uint64_t)v11)))
  {
    abort();
  }
}

- (id)_accessibilityResponderElement
{
  id result;
  objc_super v4;

  result = -[THInteractiveCanvasControllerAccessibility thaxCurrentResponderElement](self, "thaxCurrentResponderElement");
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)THInteractiveCanvasControllerAccessibility;
    return -[THInteractiveCanvasControllerAccessibility _accessibilityResponderElement](&v4, "_accessibilityResponderElement");
  }
  return result;
}

@end
