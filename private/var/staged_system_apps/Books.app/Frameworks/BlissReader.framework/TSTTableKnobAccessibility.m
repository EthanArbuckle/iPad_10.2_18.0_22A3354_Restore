@implementation TSTTableKnobAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTTableKnob");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDKnobAccessibility, a2);
}

- (id)accessibilityLabel
{
  unsigned int v3;
  NSString *v4;
  const __CFString *v5;

  v3 = -[TSTTableKnobAccessibility tsaxUnsignedIntValueForKey:](self, "tsaxUnsignedIntValueForKey:", CFSTR("knobVariant"));
  v4 = -[TSDRepAccessibility tsaxKnobLabel](-[TSDKnobAccessibility tsaxParentRepForKnob](self, "tsaxParentRepForKnob"), "tsaxKnobLabel");
  switch(v3)
  {
    case 1u:
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("knob.selection.changer %@")), v4);
    case 9u:
      v5 = CFSTR("knob.row.resize");
      return TSAccessibilityLocalizedString((uint64_t)v5);
    case 5u:
      v5 = CFSTR("knob.column.resize");
      return TSAccessibilityLocalizedString((uint64_t)v5);
  }
  return 0;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableKnobAccessibility;
  return -[TSTTableKnobAccessibility accessibilityTraits](&v3, "accessibilityTraits") & ~UIAccessibilityTraitAdjustable;
}

- (BOOL)isAccessibilityElement
{
  unsigned int v3;
  objc_super v6;

  v3 = -[TSTTableKnobAccessibility tsaxUnsignedIntValueForKey:](self, "tsaxUnsignedIntValueForKey:", CFSTR("knobVariant"));
  if (v3 <= 8 && ((1 << v3) & 0x114) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)TSTTableKnobAccessibility;
  return -[TSTTableKnobAccessibility isAccessibilityElement](&v6, "isAccessibilityElement");
}

- (id)accessibilityHint
{
  unsigned int v2;

  v2 = -[TSTTableKnobAccessibility tsaxUnsignedIntValueForKey:](self, "tsaxUnsignedIntValueForKey:", CFSTR("knobVariant"));
  switch(v2)
  {
    case 1u:
      return TSAccessibilityLocalizedString((uint64_t)CFSTR("knob.selection.changer.hint.iOS"));
    case 5u:
      return TSAccessibilityLocalizedString((uint64_t)CFSTR("knob.column.resize.hint.iOS"));
    case 9u:
      return TSAccessibilityLocalizedString((uint64_t)CFSTR("knob.row.resize.hint.iOS"));
  }
  return 0;
}

@end
