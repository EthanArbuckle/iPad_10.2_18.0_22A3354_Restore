@implementation TSDStylePresetsInspectorPaneAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDStylePresetsInspectorPane");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  id v5;
  id v6;
  char *v7;
  char *v8;
  char *i;
  id v10;
  id v11;
  NSString *v12;
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TSDStylePresetsInspectorPaneAccessibility;
  -[TSDStylePresetsInspectorPaneAccessibility viewDidAppear:](&v14, "viewDidAppear:", a3);
  v4 = -[TSDStylePresetsInspectorPaneAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mButtons"));
  v5 = -[TSDStylePresetsInspectorPaneAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("presets"));
  v6 = -[TSDStylePresetsInspectorPaneAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("delegate"));
  v7 = (char *)objc_msgSend(v4, "count");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      v10 = objc_msgSend(v4, "objectAtIndex:", i);
      if (!objc_msgSend(objc_msgSend(v10, "accessibilityLabel"), "length"))
      {
        if ((objc_opt_respondsToSelector(v6, "swatchRenderingOperationForPreset:imageSize:imageScale:swatchFrame:view:") & 1) != 0)
        {
          objc_msgSend(v10, "setAccessibilityLabel:", objc_msgSend(objc_msgSend(v5, "objectAtIndex:", i), "accessibilityLabel"));
        }
        else
        {
          v11 = objc_alloc((Class)NSString);
          v12 = TSAccessibilityLocalizedString((uint64_t)CFSTR("style.label.formatter %@"));
          v13 = objc_msgSend(v11, "initWithFormat:", v12, TSAccessibilityLocalizedUnsignedInteger((uint64_t)(i + 1)));
          objc_msgSend(v10, "setAccessibilityLabel:", v13);

        }
      }
    }
  }
}

@end
