@implementation IMCommonCoreAccessibility

- (UIColor)preferredSpeakScreenHighlightColor
{
  return (UIColor *)__IMAccessibilityGetAssociatedObject(self, &unk_30D5A0);
}

- (void)setPreferredSpeakScreenHighlightColor:(id)a3
{
  __IMAccessibilitySetAssociatedObject(self, &unk_30D5A0, a3);
}

- (UIColor)preferredSpeakScreenUnderlineColor
{
  return (UIColor *)__IMAccessibilityGetAssociatedObject(self, &unk_30D5A1);
}

- (void)setPreferredSpeakScreenUnderlineColor:(id)a3
{
  __IMAccessibilitySetAssociatedObject(self, &unk_30D5A1, a3);
}

- (id)preferencesDomain
{
  return CFSTR("com.apple.Accessibility");
}

- (BOOL)needsAccessibilityAnnouncements
{
  return -[IMCommonCoreAccessibility needsAccessibilityElements](self, "needsAccessibilityElements");
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_649F8;
  block[3] = &unk_28B8C8;
  block[4] = a1;
  if (qword_30D748 != -1)
    dispatch_once(&qword_30D748, block);
  return (id)qword_30D740;
}

- (void)performValidation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __IMAccessibilityValidateInstanceMethodComplete(CFSTR("AEAnnotation"), CFSTR("annotationIsUnderline"), "B", v2, v3, v4, v5, v6, 0);
  __IMAccessibilityValidateProperty(CFSTR("AEAnnotation"), "annotationRepresentativeText");
  __IMAccessibilityValidateProperty(CFSTR("AEAnnotation"), "annotationNote");
  __IMAccessibilityValidateProperty(CFSTR("AEAnnotation"), "annotationStyle");
}

- (void)addSafeCategoryNamesToCollection:(id)a3
{
  objc_msgSend(a3, "addObject:", CFSTR("AEAnnotationAccessibility"));
}

- (void)loadAccessibilitySupport
{
  NSMutableSet *v3;

  if (!-[IMCommonCoreAccessibility _isAccessibilitySupportLoaded](self, "_isAccessibilitySupportLoaded"))
  {
    if (IMAccessibilityShouldPerformValidationChecks())
    {
      -[IMCommonCoreAccessibility performValidation](self, "performValidation");
      if (-[IMCommonCoreAccessibility conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___IMCommonCoreAccessibilityExtras))
      {
        if ((objc_opt_respondsToSelector(self, "performExtraValidation") & 1) != 0)
          -[IMCommonCoreAccessibility performExtraValidation](self, "performExtraValidation");
      }
    }
    v3 = objc_opt_new(NSMutableSet);
    -[IMCommonCoreAccessibility addSafeCategoryNamesToCollection:](self, "addSafeCategoryNamesToCollection:");
    if (-[IMCommonCoreAccessibility conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___IMCommonCoreAccessibilityExtras))
    {
      if ((objc_opt_respondsToSelector(self, "addExtraSafeCategoryNamesToCollection:") & 1) != 0)
        -[IMCommonCoreAccessibility addExtraSafeCategoryNamesToCollection:](self, "addExtraSafeCategoryNamesToCollection:", v3);
    }
    IMAccessibilityInstallSafeCategories(v3);
    -[IMCommonCoreAccessibility _setAccessibilitySupportLoaded:](self, "_setAccessibilitySupportLoaded:", 1);

  }
}

- (BOOL)_isAccessibilitySupportLoaded
{
  return self->_accessibilitySupportLoaded;
}

- (void)_setAccessibilitySupportLoaded:(BOOL)a3
{
  self->_accessibilitySupportLoaded = a3;
}

@end
