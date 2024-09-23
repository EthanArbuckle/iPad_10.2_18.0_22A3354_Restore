@implementation THAEHighlightColorEditorControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("AEHighlightColorEditorController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)p_removeAnnotation:(id)a3
{
  objc_super v5;
  _QWORD v6[6];

  if (a3)
  {
    if (-[THAEHighlightColorEditorControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("thaxOriginatingButton")) == a3)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_26B21C;
      v6[3] = &unk_426E28;
      v6[4] = self;
      v6[5] = a3;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
        abort();
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)THAEHighlightColorEditorControllerAccessibility;
  -[THAEHighlightColorEditorControllerAccessibility p_removeAnnotation:](&v5, "p_removeAnnotation:", a3);
}

@end
