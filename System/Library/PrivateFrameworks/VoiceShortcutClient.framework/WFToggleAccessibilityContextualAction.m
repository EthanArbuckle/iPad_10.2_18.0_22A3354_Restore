@implementation WFToggleAccessibilityContextualAction

- (WFToggleAccessibilityContextualAction)initWithSetting:(unint64_t)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WFContextualActionParameter *v16;
  WFContextualActionParameter *v17;
  void *v18;
  WFToggleAccessibilityContextualAction *v19;
  WFToggleAccessibilityContextualAction *v20;
  WFToggleAccessibilityContextualAction *v21;
  int v23;
  const __CFString *v24;
  WFToggleAccessibilityContextualAction *v25;
  objc_super v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  +[WFContextualActionIcon iconWithSystemName:](WFContextualActionIcon, "iconWithSystemName:", CFSTR("accessibility"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = self;
  switch(a3)
  {
    case 0uLL:
      WFLocalizedStringWithKey(CFSTR("Contextual Action Title: Reduce Motion"), CFSTR("Reduce Motion"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("com.apple.AccessibilityUtilities.AXSettingsShortcuts.AXToggleReduceMotionIntent");
      v7 = CFSTR("reduce_motion");
      v8 = CFSTR("circle.dotted.and.circle");
      goto LABEL_13;
    case 1uLL:
      WFLocalizedStringWithKey(CFSTR("Contextual Action Title: Reduce Transparency"), CFSTR("Reduce Transparency"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("com.apple.AccessibilityUtilities.AXSettingsShortcuts.AXToggleTransparencyIntent");
      v7 = CFSTR("reduce_transparency");
      v8 = CFSTR("square.on.square.intersection.dashed");
      goto LABEL_13;
    case 2uLL:
      WFLocalizedStringWithKey(CFSTR("Contextual Action Title: Color Filters"), CFSTR("Color Filters"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("com.apple.AccessibilityUtilities.AXSettingsShortcuts.AXToggleColorFiltersIntent");
      v7 = CFSTR("color_filters");
      v8 = CFSTR("camera.filters");
      goto LABEL_13;
    case 3uLL:
      WFLocalizedStringWithKey(CFSTR("Contextual Action Title: Smart Invert"), CFSTR("Smart Invert"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("com.apple.AccessibilityUtilities.AXSettingsShortcuts.AXToggleSmartInvertIntent");
      v7 = CFSTR("smart_invert");
      v8 = CFSTR("smart.invert");
      goto LABEL_13;
    case 4uLL:
      WFLocalizedStringWithKey(CFSTR("Contextual Action Title: VoiceOver"), CFSTR("VoiceOver"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("com.apple.AccessibilityUtilities.AXSettingsShortcuts.AXToggleVoiceOverIntent");
      v7 = CFSTR("voice_over");
      v8 = CFSTR("voiceover");
      goto LABEL_13;
    case 5uLL:
      WFLocalizedStringWithKey(CFSTR("Contextual Action Title: Zoom"), CFSTR("Zoom"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("com.apple.AccessibilityUtilities.AXSettingsShortcuts.AXToggleZoomIntent");
      v7 = CFSTR("zoom");
      v8 = CFSTR("arrowtriangles.up.right.down.left.magnifyingglass");
      goto LABEL_13;
    case 6uLL:
      WFLocalizedStringWithKey(CFSTR("Contextual Action Title: Voice Control"), CFSTR("Voice Control"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("com.apple.AccessibilityUtilities.AXSettingsShortcuts.AXToggleVoiceControlIntent");
      v7 = CFSTR("voice_control");
      v8 = CFSTR("voice.control");
      goto LABEL_13;
    case 7uLL:
      WFLocalizedStringWithKey(CFSTR("Contextual Action Title: Increase Contrast"), CFSTR("Increase Contrast"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("com.apple.AccessibilityUtilities.AXSettingsShortcuts.AXToggleContrastIntent");
      v7 = CFSTR("increase_contrast");
      v8 = CFSTR("circle.righthalf.filled");
      goto LABEL_13;
    case 8uLL:
      WFLocalizedStringWithKey(CFSTR("Contextual Action Title: Classic Invert"), CFSTR("Classic Invert"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("com.apple.AccessibilityUtilities.AXSettingsShortcuts.AXToggleClassicInvertIntent");
      v7 = CFSTR("classic_invert");
      v8 = CFSTR("classic.invert");
      goto LABEL_13;
    case 9uLL:
      WFLocalizedStringWithKey(CFSTR("Contextual Action Title: Reduce White Point"), CFSTR("Reduce White Point"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("com.apple.AccessibilityUtilities.AXSettingsShortcuts.AXToggleWhitePointIntent");
      v7 = CFSTR("white_point");
      v8 = CFSTR("sun.max.fill");
LABEL_13:
      +[WFContextualActionIcon iconWithSystemName:](WFContextualActionIcon, "iconWithSystemName:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v9;
      break;
    default:
      v6 = 0;
      v7 = 0;
      v24 = 0;
      break;
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedStringWithKey(CFSTR("Toggle (Accessibility Setting)"), CFSTR("%@"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  WFLocalizedStringWithKey(CFSTR("Toggle (System Setting, Subtitle)"), CFSTR("Toggle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = CFSTR("com.apple.shortcuts.toggle-acessibility");
  v28[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR("."));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFNumberContentItem"), 0, CFSTR("OnValue"), &unk_1E60027A8);
  v27[0] = v16;
  v17 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFStringContentItem"), 0, CFSTR("operation"), CFSTR("toggle"));
  v27[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v26.receiver = v25;
  v26.super_class = (Class)WFToggleAccessibilityContextualAction;
  BYTE2(v23) = 0;
  LOWORD(v23) = 0;
  v19 = -[WFContextualAction initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:actionHasResult:isReversible:](&v26, sel_initWithIdentifier_wfActionIdentifier_associatedAppBundleIdentifier_parameters_displayFormatString_title_subtitleFormatString_icon_accessoryIcon_actionShowsUserInterface_actionHasResult_isReversible_, v15, v24, CFSTR("com.apple.Preferences"), v18, v12, v6, v13, v5, 0, v23);
  v20 = v19;
  if (v19)
  {
    v19->_setting = a3;
    v21 = v19;
  }

  return v20;
}

- (id)settingBiomeStreamIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  switch(-[WFToggleAccessibilityContextualAction setting](self, "setting"))
  {
    case 0uLL:
      WFBiomeLibrary_7599();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "Accessibility");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ReduceMotion");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 1uLL:
      WFBiomeLibrary_7599();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "Accessibility");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ReduceTransparency");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 2uLL:
      WFBiomeLibrary_7599();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "Accessibility");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ColorFilters");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 3uLL:
      WFBiomeLibrary_7599();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "Accessibility");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "SmartInvert");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 4uLL:
      WFBiomeLibrary_7599();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "Accessibility");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "VoiceOver");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 5uLL:
      WFBiomeLibrary_7599();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "Accessibility");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "Zoom");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 6uLL:
      WFBiomeLibrary_7599();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "Accessibility");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "VoiceControl");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 7uLL:
      WFBiomeLibrary_7599();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "Accessibility");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "Contrast");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 8uLL:
      WFBiomeLibrary_7599();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "Accessibility");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ClassicInvert");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 9uLL:
      WFBiomeLibrary_7599();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "Accessibility");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "WhitePoint");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      v6 = v5;
      objc_msgSend(v5, "identifier");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v2;
  }
  return v2;
}

- (id)associatedSettingsPreference
{
  unint64_t v2;

  v2 = -[WFToggleAccessibilityContextualAction setting](self, "setting");
  if (v2 > 9)
    return 0;
  else
    return off_1E5FC64C0[v2];
}

- (WFToggleAccessibilityContextualAction)initWithCoder:(id)a3
{
  return -[WFToggleAccessibilityContextualAction initWithSetting:](self, "initWithSetting:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("setting")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFToggleAccessibilityContextualAction;
  v4 = a3;
  -[WFContextualAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_setting, CFSTR("setting"), v5.receiver, v5.super_class);

}

- (unint64_t)setting
{
  return self->_setting;
}

+ (id)spotlightDomainIdentifierForBundleIdentifier:(id)a3
{
  return +[WFToggleSettingContextualAction spotlightDomainIdentifierForBundleIdentifier:](WFToggleSettingContextualAction, "spotlightDomainIdentifierForBundleIdentifier:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
