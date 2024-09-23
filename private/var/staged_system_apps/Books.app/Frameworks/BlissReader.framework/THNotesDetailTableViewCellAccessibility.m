@implementation THNotesDetailTableViewCellAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THNotesDetailTableViewCell");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  THNotesDetailTableViewCellControllerAccessibility *v2;
  THCachedAnnotationAccessibility *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = -[THNotesDetailTableViewCellAccessibility _thaxTableViewCellController](self, "_thaxTableViewCellController");
  v3 = -[THNotesDetailTableViewCellControllerAccessibility thaxAnnotation](v2, "thaxAnnotation");
  v4 = -[THCachedAnnotationAccessibility thaxNoteText](v3, "thaxNoteText");
  if (-[NSString length](v4, "length"))
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", THAccessibilityLocalizedString((uint64_t)CFSTR("note.format %@")), v4);
  else
    v5 = 0;
  v6 = -[THNotesDetailTableViewCellControllerAccessibility thaxPageNumberString](v2, "thaxPageNumberString");
  if (-[NSString length](v6, "length"))
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", THAccessibilityLocalizedString((uint64_t)CFSTR("note.page.format %@")), v6);
  v7 = -[THNotesDetailTableViewCellControllerAccessibility thaxDateString](v2, "thaxDateString");
  if (-[NSString length](v7, "length"))
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", THAccessibilityLocalizedString((uint64_t)CFSTR("note.created.format %@")), v7);
  v8 = -[THCachedAnnotationAccessibility thaxHighlightedTextDescription](v3, "thaxHighlightedTextDescription");
  return __TSAccessibilityStringForVariables(1, v8, v9, v10, v11, v12, v13, v14, (uint64_t)v5);
}

- (id)accessibilityHint
{
  NSString *v4;
  objc_super v5;

  if (-[THNotesDetailTableViewCellAccessibility _thaxIsEditing](self, "_thaxIsEditing"))
  {
    if (-[THNotesDetailTableViewCellAccessibility _thaxIsSelected](self, "_thaxIsSelected"))
      return THAccessibilityLocalizedString((uint64_t)CFSTR("notes.editing.selected.hint.ios"));
    else
      return THAccessibilityLocalizedString((uint64_t)CFSTR("notes.editing.hint.ios"));
  }
  else
  {
    v4 = -[THNotesDetailTableViewCellControllerAccessibility thaxPageNumberString](-[THNotesDetailTableViewCellAccessibility _thaxTableViewCellController](self, "_thaxTableViewCellController"), "thaxPageNumberString");
    if (-[NSString length](v4, "length"))
    {
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", THAccessibilityLocalizedString((uint64_t)CFSTR("note.jump.hint.format.iOS %@")), v4);
    }
    else
    {
      v5.receiver = self;
      v5.super_class = (Class)THNotesDetailTableViewCellAccessibility;
      return -[THNotesDetailTableViewCellAccessibility accessibilityHint](&v5, "accessibilityHint");
    }
  }
}

- (CGPoint)accessibilityActivationPoint
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[THNotesDetailTableViewCellAccessibility _thaxIsEditing](self, "_thaxIsEditing"))
  {
    v5.receiver = self;
    v5.super_class = (Class)THNotesDetailTableViewCellAccessibility;
    -[THNotesDetailTableViewCellAccessibility accessibilityActivationPoint](&v5, "accessibilityActivationPoint");
  }
  else
  {
    -[UIButton accessibilityActivationPoint](-[THNotesDetailTableViewCellControllerAccessibility thaxReturnToBook](-[THNotesDetailTableViewCellAccessibility _thaxTableViewCellController](self, "_thaxTableViewCellController"), "thaxReturnToBook"), "accessibilityActivationPoint");
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  unsigned int v4;
  UIAccessibilityTraits v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THNotesDetailTableViewCellAccessibility;
  v3 = -[THNotesDetailTableViewCellAccessibility accessibilityTraits](&v7, "accessibilityTraits");
  v4 = -[THNotesDetailTableViewCellAccessibility _thaxIsEditing](self, "_thaxIsEditing");
  v5 = UIAccessibilityTraitButton;
  if (v4)
    v5 = 0;
  return v5 | v3;
}

- (id)accessibilityUserInputLabels
{
  id v3;
  THCachedAnnotationAccessibility *v4;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = -[THNotesDetailTableViewCellControllerAccessibility thaxAnnotation](-[THNotesDetailTableViewCellAccessibility _thaxTableViewCellController](self, "_thaxTableViewCellController"), "thaxAnnotation");
  objc_msgSend(v3, "tsu_addNonNilObject:", -[THCachedAnnotationAccessibility thaxHighlightedText](v4, "thaxHighlightedText"));
  objc_msgSend(v3, "tsu_addNonNilObject:", -[THCachedAnnotationAccessibility thaxNoteText](v4, "thaxNoteText"));
  objc_msgSend(v3, "tsu_addNonNilObject:", -[THCachedAnnotationAccessibility thaxHighlightedTextDescription](v4, "thaxHighlightedTextDescription"));
  objc_msgSend(v3, "tsu_addNonNilObject:", -[THNotesDetailTableViewCellAccessibility accessibilityLabel](self, "accessibilityLabel"));
  return v3;
}

- (BOOL)_thaxIsEditing
{
  return -[THNotesDetailTableViewCellAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isEditing"));
}

- (BOOL)_thaxIsSelected
{
  return -[THNotesDetailTableViewCellAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isSelected"));
}

- (THNotesDetailTableViewCellControllerAccessibility)_thaxTableViewCellController
{
  void *v3;
  THNotesDetailTableViewCellControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THNotesDetailTableViewCellControllerAccessibility);
  result = (THNotesDetailTableViewCellControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THNotesDetailTableViewCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("tableViewCellController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (THCachedAnnotationAccessibility)_thaxAnnotation
{
  return self->__thaxAnnotation;
}

@end
