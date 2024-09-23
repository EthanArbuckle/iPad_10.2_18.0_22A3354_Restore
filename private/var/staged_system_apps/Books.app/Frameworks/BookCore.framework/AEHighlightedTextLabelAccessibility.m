@implementation AEHighlightedTextLabelAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("AEHighlightedTextLabel");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightedTextLabelAccessibility thaxAnnotation](self, "thaxAnnotation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imaxAnnotationStyleDescription"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightedTextLabelAccessibility thaxAnnotation](self, "thaxAnnotation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imaxAnnotationSelectedText"));

  v14 = __IMAccessibilityStringForVariables(v4, v7, v8, v9, v10, v11, v12, v13, (uint64_t)v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return v15;
}

- (BOOL)isAccessibilityElement
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = -[AEHighlightedTextLabelAccessibility imaxAncestorIsKindOf:](self, "imaxAncestorIsKindOf:", objc_opt_class(UITableViewCell));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  if (v4)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightedTextLabelAccessibility accessibilityLabel](self, "accessibilityLabel"));
  v5 = objc_msgSend(v6, "length") != 0;

  return v5;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  char v9;

  v9 = 0;
  v3 = (objc_class *)objc_opt_class(UIView);
  v4 = __IMAccessibilityCastAsClass(v3, self, 1, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v9)
    abort();
  v6 = v5;
  v7 = objc_msgSend(v5, "isUserInteractionEnabled");

  return v7;
}

- (id)thaxAnnotation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char v8;

  v8 = 0;
  v3 = (void *)objc_opt_class(AEAnnotationAccessibility);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEHighlightedTextLabelAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("annotation")));
  v5 = __IMAccessibilityCastAsSafeCategory(v3, v4, 1, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v8)
    abort();
  return v6;
}

@end
