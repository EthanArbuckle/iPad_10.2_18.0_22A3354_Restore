@implementation THNotesSidebarTableCellAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THNotesSidebarTableCell");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  NSString *v4;
  NSString *v5;
  char *v6;
  id v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (-[THNotesSidebarTableCellAccessibility _thaxNoResultsLabel](self, "_thaxNoResultsLabel"))
    return objc_msgSend(-[THNotesSidebarTableCellAccessibility _thaxNoResultsLabel](self, "_thaxNoResultsLabel"), "text");
  v4 = -[UILabel text](-[THNotesSidebarTableCellAccessibility _thaxChapterLabel](self, "_thaxChapterLabel"), "text");
  v5 = -[UILabel text](-[THNotesSidebarTableCellAccessibility _thaxChapterName](self, "_thaxChapterName"), "text");
  v6 = (char *)objc_msgSend(objc_msgSend(-[THNotesSidebarTableCellAccessibility _thaxNoteCountLabel](self, "_thaxNoteCountLabel"), "text"), "integerValue");
  v7 = TSAccessibilityLocalizedNumber((uint64_t)+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6));
  if (v6 == (_BYTE *)&dword_0 + 1)
    v8 = CFSTR("notes.count.singular.format %@");
  else
    v8 = CFSTR("notes.count.plural.format %@");
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", THAccessibilityLocalizedString((uint64_t)v8), v7);
  return __TSAccessibilityStringForVariables(1, v4, v9, v10, v11, v12, v13, v14, (uint64_t)v5);
}

- (id)_thaxNoteCountLabel
{
  objc_class *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UILabel);
  result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THNotesSidebarTableCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("countLabel")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UILabel)_thaxChapterLabel
{
  objc_class *v3;
  UILabel *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UILabel);
  result = (UILabel *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THNotesSidebarTableCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("chapterLabel")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)_thaxNoResultsLabel
{
  objc_class *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UILabel);
  result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THNotesSidebarTableCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("noResultsLabel")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UILabel)_thaxChapterName
{
  objc_class *v3;
  UILabel *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UILabel);
  result = (UILabel *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THNotesSidebarTableCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("chapterName")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UILabel)_thaxCountLabel
{
  return self->__thaxCountLabel;
}

@end
