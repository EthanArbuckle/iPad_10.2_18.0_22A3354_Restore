@implementation TSDCanvasEditorAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDCanvasEditor");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)setSelectionToRep:(id)a3
{
  void *v5;
  Class v6;
  Class v7;
  void *v8;
  Class v9;
  char v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSDCanvasEditorAccessibility;
  -[TSDCanvasEditorAccessibility setSelectionToRep:](&v11, "setSelectionToRep:");
  v10 = 0;
  v5 = (void *)objc_opt_class(TSDInteractiveCanvasControllerAccessibility);
  v6 = __TSAccessibilityCastAsSafeCategory(v5, (uint64_t)-[TSDCanvasEditorAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("interactiveCanvasController")), 1, &v10);
  if (v10
    || (v7 = v6,
        v10 = 0,
        v8 = (void *)objc_opt_class(TSDRepAccessibility),
        v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)a3, 1, &v10),
        v10))
  {
    abort();
  }
  -[objc_class tsaxDidFocusRep:](v7, "tsaxDidFocusRep:", v9);
}

@end
