@implementation TSUIButtonAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)tsaxPreventPopoverAssociation
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543830);
}

- (void)tsaxSetPreventPopoverAssociation:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543830, a3);
}

- (TSKPopoverControllerAccessibility)tsaxAssociatedPopoverController
{
  return (TSKPopoverControllerAccessibility *)__TSAccessibilityGetAssociatedObject(self, &unk_543831);
}

- (void)tsaxSetAssociatedPopoverController:(id)a3
{
  __TSAccessibilitySetAssociatedNonRetainedObject(self, &unk_543831, a3);
}

+ (id)tsaxAdditionalButtonLabelsPerImageFileName
{
  return 0;
}

+ (id)tsaxAddDocumentButtonLabel
{
  return 0;
}

- (id)__accessibilityLabel
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v9;
  Class v10;
  objc_super v11;

  v3 = objc_msgSend(-[TSUIButtonAccessibility attributedTitleForState:](self, "attributedTitleForState:", 0), "string");
  if (objc_msgSend(v3, "length"))
    return v3;
  v3 = -[TSUIButtonAccessibility titleForState:](self, "titleForState:", 0);
  if (objc_msgSend(v3, "length"))
    return v3;
  v4 = -[TSUIButtonAccessibility imageForState:](self, "imageForState:", 0);
  if (!v4)
    v4 = -[TSUIButtonAccessibility backgroundImageForState:](self, "backgroundImageForState:", 0);
  v3 = objc_msgSend(v4, "accessibilityLabel");
  if (objc_msgSend(v3, "length"))
    return v3;
  if (!qword_543838)
  {
    v6 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "tsaxAdditionalButtonLabelsPerImageFileName"), "mutableCopy");
    qword_543838 = (uint64_t)v6;
    if (!v6)
    {
      v6 = (id)objc_opt_new(NSMutableDictionary, v5);
      qword_543838 = (uint64_t)v6;
    }
    objc_msgSend(v6, "setObject:forKey:", TSAccessibilityLocalizedString((uint64_t)CFSTR("extras")), CFSTR("TSA_NavigationBarExtrasIcon.png"));
    objc_msgSend((id)qword_543838, "setObject:forKey:", TSAccessibilityLocalizedString((uint64_t)CFSTR("preview.button")), CFSTR("TSA_Preview_N.png"));
    objc_msgSend((id)qword_543838, "setObject:forKey:", TSAccessibilityLocalizedString((uint64_t)CFSTR("paragraph.align.justified")), CFSTR("TSWP_align-H_justify_N.png"));
    objc_msgSend((id)qword_543838, "setObject:forKey:", TSAccessibilityLocalizedString((uint64_t)CFSTR("paragraph.align.left")), CFSTR("TSWP_align-H_left_N.png"));
    objc_msgSend((id)qword_543838, "setObject:forKey:", TSAccessibilityLocalizedString((uint64_t)CFSTR("paragraph.align.center")), CFSTR("TSWP_align-H_center_N.png"));
    objc_msgSend((id)qword_543838, "setObject:forKey:", TSAccessibilityLocalizedString((uint64_t)CFSTR("paragraph.align.right")), CFSTR("TSWP_align-H_right_N.png"));
    objc_msgSend((id)qword_543838, "setObject:forKey:", TSAccessibilityLocalizedString((uint64_t)CFSTR("paragraph.align.natural")), CFSTR("TSWP_align-H_natural_N.png"));
    objc_msgSend((id)qword_543838, "setObject:forKey:", TSAccessibilityLocalizedString((uint64_t)CFSTR("vertical.align.top")), CFSTR("TSWP_align-V_top_N.png"));
    objc_msgSend((id)qword_543838, "setObject:forKey:", TSAccessibilityLocalizedString((uint64_t)CFSTR("vertical.align.middle")), CFSTR("TSWP_align-V_middle_N.png"));
    objc_msgSend((id)qword_543838, "setObject:forKey:", TSAccessibilityLocalizedString((uint64_t)CFSTR("vertical.align.bottom")), CFSTR("TSWP_align-V_bottom_N.png"));
    objc_msgSend((id)qword_543838, "setObject:forKey:", TSAccessibilityLocalizedString((uint64_t)CFSTR("bold")), CFSTR("sf_inspector_style_bold.png"));
    objc_msgSend((id)qword_543838, "setObject:forKey:", TSAccessibilityLocalizedString((uint64_t)CFSTR("italic")), CFSTR("sf_inspector_style_italic.png"));
    objc_msgSend((id)qword_543838, "setObject:forKey:", TSAccessibilityLocalizedString((uint64_t)CFSTR("underline")), CFSTR("sf_inspector_style_underline.png"));
    objc_msgSend((id)qword_543838, "setObject:forKey:", TSAccessibilityLocalizedString((uint64_t)CFSTR("strikethrough")), CFSTR("sf_inspector_style_strikethrough.png"));
    objc_msgSend((id)qword_543838, "setObject:forKey:", TSAccessibilityLocalizedString((uint64_t)CFSTR("gear.button")), CFSTR("TSCH_Gear.png"));
    objc_msgSend((id)qword_543838, "setObject:forKey:", TSAccessibilityLocalizedString((uint64_t)CFSTR("gear.button")), CFSTR("TSA_GearIcon.png"));
    objc_msgSend((id)qword_543838, "setObject:forKey:", TSAccessibilityLocalizedString((uint64_t)CFSTR("delete.button")), CFSTR("DeleteGlyph.png"));
    objc_msgSend((id)qword_543838, "setObject:forKey:", TSAccessibilityLocalizedString((uint64_t)CFSTR("formula.input.key.delete")), CFSTR("TSWPKeyboard_glyph_delete-N"));
    objc_msgSend((id)qword_543838, "setObject:forKey:", TSAccessibilityLocalizedString((uint64_t)CFSTR("formula.input.key.functionbrowser")), CFSTR("TSWPKeyboard-Formula_glyph_fx-P"));
    objc_msgSend((id)qword_543838, "setObject:forKey:", TSAccessibilityLocalizedString((uint64_t)CFSTR("formula.input.key.operatortoggle")), CFSTR("TSWPKeyboard-Formula_glyph_formula2-P"));
    objc_msgSend((id)qword_543838, "setObject:forKey:", TSAccessibilityLocalizedString((uint64_t)CFSTR("formula.input.key.date.duration")), CFSTR("Keyboard-DateTime.png"));
  }
  v7 = objc_msgSend(objc_msgSend(v4, "accessibilityIdentifier"), "lastPathComponent");
  v3 = objc_msgSend((id)qword_543838, "objectForKey:", v7);
  if (v3)
    return v3;
  v3 = objc_msgSend((id)qword_543838, "objectForKey:", objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("png")));
  if (v3)
    return v3;
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("TSA_Sync")))
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("sync.button"));
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("TSA_Duplicate")))
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("duplicate.button"));
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("TSA_Delete")))
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("delete.button"));
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("TSA_Action")))
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("action.button"));
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("TSA_New")))
  {
    v9 = -[TSUIButtonAccessibility superview](self, "superview");
    v10 = NSClassFromString(CFSTR("TSKToolbar"));
    if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
      return TSAccessibilityLocalizedString((uint64_t)CFSTR("new.button"));
    v3 = objc_msgSend((id)objc_opt_class(self), "tsaxAddDocumentButtonLabel");
    if (!v3)
      return TSAccessibilityLocalizedString((uint64_t)CFSTR("new.button"));
    return v3;
  }
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("TSA_GearIcon")))
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("gear.button"));
  if ((objc_msgSend(v7, "hasPrefix:", CFSTR("kn_tb_icon_play")) & 1) == 0
    && !objc_msgSend(v7, "hasPrefix:", CFSTR("kn_tb_icon_extdisplay")))
  {
    v11.receiver = self;
    v11.super_class = (Class)TSUIButtonAccessibility;
    return -[TSUIButtonAccessibility accessibilityLabel](&v11, "accessibilityLabel");
  }
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("preview.animation"));
}

- (id)accessibilityLabel
{
  id v3;

  v3 = -[TSUIButtonAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  if (objc_msgSend(v3, "length"))
    return v3;
  v3 = -[TSUIButtonAccessibility __accessibilityLabel](self, "__accessibilityLabel");
  if (!-[TSUIButtonAccessibility _tsaxCanDismissAssociatedPopoverController](self, "_tsaxCanDismissAssociatedPopoverController"))return v3;
  else
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("dismiss.popover.button.label.format %@")), v3);
}

- (BOOL)accessibilityActivate
{
  objc_super v4;

  if (-[TSUIButtonAccessibility _tsaxDismissAssociatedPopoverControllerIfAppropriate](self, "_tsaxDismissAssociatedPopoverControllerIfAppropriate"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUIButtonAccessibility;
  return -[TSUIButtonAccessibility accessibilityActivate](&v4, "accessibilityActivate");
}

- (BOOL)accessibilityPerformEscape
{
  objc_super v4;

  if (-[TSUIButtonAccessibility _tsaxDismissAssociatedPopoverControllerIfAppropriate](self, "_tsaxDismissAssociatedPopoverControllerIfAppropriate"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUIButtonAccessibility;
  return -[TSUIButtonAccessibility accessibilityPerformEscape](&v4, "accessibilityPerformEscape");
}

- (id)_tsaxAssociatedPopoverController
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSKPopoverControllerAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSUIButtonAccessibility tsaxAssociatedPopoverController](self, "tsaxAssociatedPopoverController"), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (BOOL)_tsaxDismissAssociatedPopoverControllerIfAppropriate
{
  id v2;
  char v3;

  v2 = -[TSUIButtonAccessibility _tsaxAssociatedPopoverController](self, "_tsaxAssociatedPopoverController");
  v3 = objc_opt_respondsToSelector(v2, "dismissPopoverAnimated:");
  if ((v3 & 1) != 0)
    objc_msgSend(v2, "dismissPopoverAnimated:", 1);
  return v3 & 1;
}

- (BOOL)_tsaxCanDismissAssociatedPopoverController
{
  id v2;
  unsigned __int8 v3;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v2 = -[TSUIButtonAccessibility _tsaxAssociatedPopoverController](self, "_tsaxAssociatedPopoverController");
  if (!v2)
    return 0;
  v3 = objc_msgSend(v2, "tsaxIsPopoverVisible");
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if ((v3 & 1) == 0)
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      v3 = 0;
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("_tsaxAssociatedPopoverController should be cleared when the popover goes away"), v5, v6, v7, v8, v9, v11))abort();
    }
  }
  return v3;
}

@end
