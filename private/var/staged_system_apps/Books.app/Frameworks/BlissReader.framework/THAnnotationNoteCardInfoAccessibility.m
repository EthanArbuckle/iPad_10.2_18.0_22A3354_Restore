@implementation THAnnotationNoteCardInfoAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THAnnotationNoteCardInfo");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)thaxFrontDescription
{
  return (NSString *)-[THAnnotationNoteCardInfoAccessibility _wholeCardSideDescriptionFor:](self, "_wholeCardSideDescriptionFor:", -[THCachedAnnotationAccessibility thaxHighlightedTextDescription](-[THAnnotationNoteCardInfoAccessibility _thaxAnnotation](self, "_thaxAnnotation"), "thaxHighlightedTextDescription"));
}

- (NSString)thaxFrontHint
{
  return THAccessibilityLocalizedString((uint64_t)CFSTR("study.card.annotation.highlight.hint.ios"));
}

- (NSString)thaxBackDescription
{
  NSString *v3;

  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", THAccessibilityLocalizedString((uint64_t)CFSTR("study.card.annotation.note.format %@")), -[THCachedAnnotationAccessibility thaxNoteText](-[THAnnotationNoteCardInfoAccessibility _thaxAnnotation](self, "_thaxAnnotation"), "thaxNoteText"));
  return (NSString *)-[THAnnotationNoteCardInfoAccessibility _wholeCardSideDescriptionFor:](self, "_wholeCardSideDescriptionFor:", v3);
}

- (NSString)thaxBackHint
{
  return THAccessibilityLocalizedString((uint64_t)CFSTR("study.card.annotation.note.hint.ios"));
}

- (THCachedAnnotationAccessibility)_thaxAnnotation
{
  void *v3;
  Class v4;
  THCachedAnnotationAccessibility *v5;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char v14;

  v14 = 0;
  v3 = (void *)objc_opt_class(THCachedAnnotationAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THAnnotationNoteCardInfoAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("annotation")), 1, &v14);
  if (v14
    || (v5 = (THCachedAnnotationAccessibility *)v4, TSAccessibilityShouldPerformValidationChecks())
    && !v5
    && (ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch(),
        __TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Annotation is nil"), v7, v8, v9, v10, v11, v13)))
  {
    abort();
  }
  return v5;
}

- (id)_wholeCardSideDescriptionFor:(id)a3
{
  id v5;
  objc_class *v6;
  uint64_t v7;
  NSString *v8;
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  char v18;

  v5 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("page %@"), &stru_43D7D8, 0);
  v18 = 0;
  v6 = (objc_class *)objc_opt_class(NSString);
  v7 = __TSAccessibilityCastAsClass(v6, (uint64_t)-[THAnnotationNoteCardInfoAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("pageNumberString")), 1, &v18);
  if (v18
    || (v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v7),
        v17 = 0,
        v9 = (objc_class *)objc_opt_class(NSString),
        __TSAccessibilityCastAsClass(v9, (uint64_t)-[THAnnotationNoteCardInfoAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("title")), 1, &v17), v17))
  {
    abort();
  }
  return __TSAccessibilityStringForVariables(1, a3, v10, v11, v12, v13, v14, v15, (uint64_t)v8);
}

@end
