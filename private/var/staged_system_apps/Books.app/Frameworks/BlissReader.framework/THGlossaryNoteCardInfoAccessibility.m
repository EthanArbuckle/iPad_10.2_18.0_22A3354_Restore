@implementation THGlossaryNoteCardInfoAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THGlossaryNoteCardInfo");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)thaxFrontDescription
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", THAccessibilityLocalizedString((uint64_t)CFSTR("study.card.glossary.term.format %@")), -[THModelGlossaryEntryAccessibility thaxTerm](-[THGlossaryNoteCardInfoAccessibility _thaxGlossaryEntry](self, "_thaxGlossaryEntry"), "thaxTerm"));
}

- (NSString)thaxFrontHint
{
  return THAccessibilityLocalizedString((uint64_t)CFSTR("study.card.glossary.term.hint.ios"));
}

- (NSString)thaxBackDescription
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", THAccessibilityLocalizedString((uint64_t)CFSTR("study.card.glossary.definition.format %@")), -[THModelGlossaryEntryAccessibility thaxDefinition](-[THGlossaryNoteCardInfoAccessibility _thaxGlossaryEntry](self, "_thaxGlossaryEntry"), "thaxDefinition"));
}

- (NSString)thaxBackHint
{
  return THAccessibilityLocalizedString((uint64_t)CFSTR("study.card.glossary.definition.hint.ios"));
}

- (THModelGlossaryEntryAccessibility)_thaxGlossaryEntry
{
  void *v3;
  THModelGlossaryEntryAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THModelGlossaryEntryAccessibility);
  result = (THModelGlossaryEntryAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THGlossaryNoteCardInfoAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("glossaryEntry")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
