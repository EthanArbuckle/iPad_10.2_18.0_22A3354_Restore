@implementation AEAnnotationAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("AEAnnotation");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory, a2);
}

- (NSString)imaxAnnotationLocation
{
  objc_class *v3;
  void *v4;
  id v5;
  void *v6;
  char v8;

  v8 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("annotationLocation")));
  v5 = __IMAccessibilityCastAsClass(v3, v4, 1, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v8)
    abort();
  return (NSString *)v6;
}

- (NSString)imaxWholeAnnotationDescription
{
  unsigned int v3;
  const __CFString *v4;
  const __CFString *v5;
  __CFString *v6;
  id v7;
  void *v8;
  __CFString *v9;
  id v10;

  switch(-[AEAnnotationAccessibility thaxAnnotationStyle](self, "thaxAnnotationStyle"))
  {
    case 1:
      v3 = -[AEAnnotationAccessibility imaxHasNote](self, "imaxHasNote");
      v4 = CFSTR("highlight.color.green");
      v5 = CFSTR("highlight.color.green.with.note");
      goto LABEL_9;
    case 2:
      v3 = -[AEAnnotationAccessibility imaxHasNote](self, "imaxHasNote");
      v4 = CFSTR("highlight.color.blue");
      v5 = CFSTR("highlight.color.blue.with.note");
      goto LABEL_9;
    case 3:
      v3 = -[AEAnnotationAccessibility imaxHasNote](self, "imaxHasNote");
      v4 = CFSTR("highlight.color.yellow");
      v5 = CFSTR("highlight.color.yellow.with.note");
      goto LABEL_9;
    case 4:
      v3 = -[AEAnnotationAccessibility imaxHasNote](self, "imaxHasNote");
      v4 = CFSTR("highlight.color.pink");
      v5 = CFSTR("highlight.color.pink.with.note");
      goto LABEL_9;
    case 5:
      v3 = -[AEAnnotationAccessibility imaxHasNote](self, "imaxHasNote");
      v4 = CFSTR("highlight.color.purple");
      v5 = CFSTR("highlight.color.purple.with.note");
      goto LABEL_9;
    default:
      if (!-[AEAnnotationAccessibility thaxAnnotationIsUnderline](self, "thaxAnnotationIsUnderline"))
        goto LABEL_13;
      v3 = -[AEAnnotationAccessibility imaxHasNote](self, "imaxHasNote");
      v4 = CFSTR("highlight.underlined.text");
      v5 = CFSTR("highlight.underlined.text.with.note");
LABEL_9:
      if (v3)
        v6 = (__CFString *)v5;
      else
        v6 = (__CFString *)v4;
      v7 = IMCommonCoreAccessibilityLocalizedString(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      if (!v8)
      {
LABEL_13:
        if (-[AEAnnotationAccessibility imaxHasNote](self, "imaxHasNote"))
          v9 = CFSTR("highlight.generic.with.note");
        else
          v9 = CFSTR("highlight.generic");
        v10 = IMCommonCoreAccessibilityLocalizedString(v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue(v10);
      }
      return (NSString *)v8;
  }
}

- (NSString)imaxAnnotationStyleDescription
{
  unsigned int v3;
  __CFString *v4;
  id v5;
  void *v6;

  v3 = -[AEAnnotationAccessibility thaxAnnotationStyle](self, "thaxAnnotationStyle") - 1;
  if (v3 >= 5)
  {
    if (!-[AEAnnotationAccessibility thaxAnnotationIsUnderline](self, "thaxAnnotationIsUnderline"))
    {
      v6 = 0;
      return (NSString *)v6;
    }
    v4 = CFSTR("highlight.underlined.text");
  }
  else
  {
    v4 = *(&off_2900D8 + (int)v3);
  }
  v5 = IMCommonCoreAccessibilityLocalizedString(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  return (NSString *)v6;
}

- (NSString)imaxAnnotationNote
{
  objc_class *v3;
  void *v4;
  id v5;
  void *v6;
  char v8;

  v8 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("annotationNote")));
  v5 = __IMAccessibilityCastAsClass(v3, v4, 1, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v8)
    abort();
  return (NSString *)v6;
}

- (BOOL)imaxHasNote
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationAccessibility imaxAnnotationNote](self, "imaxAnnotationNote"));
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)imaxIsAnnotationDeleted
{
  return -[AEAnnotationAccessibility imaxBoolValueForKey:](self, "imaxBoolValueForKey:", CFSTR("isAnnotationDeleted"));
}

- (id)imaxLocation
{
  return -[AEAnnotationAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("location"));
}

- (NSString)imaxAnnotationSelectedText
{
  return (NSString *)-[AEAnnotationAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("annotationSelectedText"));
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationAccessibility imaxWholeAnnotationDescription](self, "imaxWholeAnnotationDescription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("annotationRepresentativeText")));
  v12 = __IMAccessibilityStringForVariables(v3, v5, v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (id)accessibilityValue
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("annotationNote")));
  if (objc_msgSend(v2, "length"))
  {
    v3 = IMCommonCoreAccessibilityLocalizedString(CFSTR("note.format %@"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v2));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int)thaxAnnotationStyle
{
  return -[AEAnnotationAccessibility imaxIntValueForKey:](self, "imaxIntValueForKey:", CFSTR("annotationStyle"));
}

- (BOOL)thaxAnnotationIsUnderline
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("annotationIsUnderline")));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

@end
