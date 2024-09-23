@implementation THNotesDetailTableViewCellControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THNotesDetailTableViewCellController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)thaxDateString
{
  return -[UILabel text](-[THNotesDetailTableViewCellControllerAccessibility _thaxDateLabel](self, "_thaxDateLabel"), "text");
}

- (NSString)thaxPageNumberString
{
  NSString *v2;

  v2 = -[UIButton titleForState:](-[THNotesDetailTableViewCellControllerAccessibility thaxReturnToBook](self, "thaxReturnToBook"), "titleForState:", 0);
  if (-[NSString length](v2, "length"))
    return v2;
  else
    return 0;
}

- (THCachedAnnotationAccessibility)thaxAnnotation
{
  void *v3;
  THCachedAnnotationAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THCachedAnnotationAccessibility);
  result = (THCachedAnnotationAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THNotesDetailTableViewCellControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("annotation")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UIButton)thaxReturnToBook
{
  objc_class *v3;
  UIButton *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THNotesDetailTableViewCellControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("returnToBook")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (void)populateWithAnnotation:(id)a3 cellWidth:(double)a4 highlightLayer:(id)a5 highlightTextFrame:(CGRect)a6 editingHighlightLayer:(id)a7 pageNumberString:(id)a8 topAdjustment:(double)a9 showDivider:(BOOL)a10
{
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)THNotesDetailTableViewCellControllerAccessibility;
  -[THNotesDetailTableViewCellControllerAccessibility populateWithAnnotation:cellWidth:highlightLayer:highlightTextFrame:editingHighlightLayer:pageNumberString:topAdjustment:showDivider:](&v11, "populateWithAnnotation:cellWidth:highlightLayer:highlightTextFrame:editingHighlightLayer:pageNumberString:topAdjustment:showDivider:", a3, a5, a7, a8, a10, a4, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a9);
  -[UIButton setIsAccessibilityElement:](-[THNotesDetailTableViewCellControllerAccessibility thaxReturnToBook](self, "thaxReturnToBook"), "setIsAccessibilityElement:", 0);
}

- (UILabel)_thaxDateLabel
{
  objc_class *v3;
  UILabel *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UILabel);
  result = (UILabel *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THNotesDetailTableViewCellControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("dateLabel")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
