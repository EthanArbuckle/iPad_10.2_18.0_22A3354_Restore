@implementation WFToggleSettingContextualAction

- (WFToggleSettingContextualAction)initWithSetting:(unint64_t)a3 operation:(unint64_t)a4
{
  return -[WFToggleSettingContextualAction initWithSetting:operation:unconfigured:](self, "initWithSetting:operation:unconfigured:", a3, a4, 0);
}

- (WFToggleSettingContextualAction)initWithSetting:(unint64_t)a3 operation:(unint64_t)a4 unconfigured:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  __CFString *v11;
  const __CFString *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  int v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  id v23;
  WFContextualActionParameter *v24;
  void *v25;
  WFContextualActionParameter *v26;
  void *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  WFContextualActionParameter *v31;
  WFContextualActionParameter *v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  WFToggleSettingContextualAction *v41;
  WFToggleSettingContextualAction *v42;
  WFToggleSettingContextualAction *v43;
  int v45;
  __CFString *v46;
  const __CFString *v47;
  objc_super v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[4];

  v5 = a5;
  v55[2] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0uLL:
      WFLocalizedString(CFSTR("Airplane Mode"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("OnValue");
      v10 = CFSTR("airplane_mode");
      v11 = CFSTR("is.workflow.actions.airplanemode.set");
      v12 = CFSTR("airplane");
      goto LABEL_16;
    case 1uLL:
      WFLocalizedString(CFSTR("Low Power Mode"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("OnValue");
      v10 = CFSTR("low_power_mode");
      v11 = CFSTR("is.workflow.actions.lowpowermode.set");
      v12 = CFSTR("battery.25");
      goto LABEL_16;
    case 2uLL:
      WFLocalizedStringWithKey(CFSTR("Contextual Action Title: Dark Mode"), CFSTR("Dark Mode"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("OnValue");
      v10 = CFSTR("dark_mode");
      v11 = CFSTR("is.workflow.actions.appearance");
      v12 = CFSTR("appearance");
      goto LABEL_16;
    case 3uLL:
      WFLocalizedString(CFSTR("Always On Display"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("OnValue");
      v10 = CFSTR("always_on_display");
      v11 = CFSTR("is.workflow.actions.display.always-on.set");
      v12 = CFSTR("iphone.always.on.display");
      goto LABEL_16;
    case 4uLL:
      v14 = a5;
      +[WFDevice currentDevice](WFDevice, "currentDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasCapability:", CFSTR("WAPI"));

      if (v16)
      {
        v17 = CFSTR("Contextual Action Title: WLAN");
        v18 = CFSTR("WLAN");
      }
      else
      {
        v17 = CFSTR("Contextual Action Title: Wi-Fi");
        v18 = CFSTR("Wi-Fi");
      }
      WFLocalizedStringWithKey(v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("OnValue");
      v12 = CFSTR("wifi");
      v10 = CFSTR("wifi");
      v5 = v14;
      v11 = CFSTR("is.workflow.actions.wifi.set");
      goto LABEL_16;
    case 5uLL:
      WFLocalizedStringWithKey(CFSTR("Contextual Action Title: Bluetooth"), CFSTR("Bluetooth"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("OnValue");
      v11 = CFSTR("is.workflow.actions.bluetooth.set");
      v12 = CFSTR("bluetooth");
      v10 = CFSTR("bluetooth");
      goto LABEL_16;
    case 6uLL:
      WFLocalizedStringWithKey(CFSTR("Contextual Action Title: Cellular Data"), CFSTR("Cellular Data"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("OnValue");
      v10 = CFSTR("cellular_data");
      v11 = CFSTR("is.workflow.actions.cellulardata.set");
      v12 = CFSTR("antenna.radiowaves.left.and.right");
      goto LABEL_16;
    case 7uLL:
      WFLocalizedStringWithKey(CFSTR("Contextual Action Title: True Tone"), CFSTR("True Tone"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("OnValue");
      v10 = CFSTR("true_tone");
      v11 = CFSTR("is.workflow.actions.truetone.set");
      v12 = CFSTR("truetone");
      goto LABEL_16;
    case 8uLL:
      WFLocalizedStringWithKey(CFSTR("Contextual Action Title: Night Shift"), CFSTR("Night Shift"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("OnValue");
      v10 = CFSTR("night_shift");
      v11 = CFSTR("is.workflow.actions.nightshift.set");
      v12 = CFSTR("nightshift");
      goto LABEL_16;
    case 9uLL:
      WFLocalizedStringWithKey(CFSTR("Contextual Action Title: Silent Mode"), CFSTR("Silent Mode"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("com.apple.ShortcutsActions.SetSilentModeAction");
      v19 = CFSTR("com.apple.ShortcutsActions.SetSilentModeAction");
      v9 = CFSTR("state");
      v10 = CFSTR("silent_mode");
      v12 = CFSTR("bell.slash.fill");
LABEL_16:
      +[WFContextualActionIcon iconWithSystemName:](WFContextualActionIcon, "iconWithSystemName:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v11 = 0;
      v10 = 0;
      v8 = 0;
      v13 = 0;
      v9 = CFSTR("OnValue");
      break;
  }
  switch(a4)
  {
    case 2uLL:
      v46 = v11;
      v47 = v10;
      v20 = v5;
      v29 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedStringWithKey(CFSTR("Toggle (System Setting)"), CFSTR("%@"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", v30, v8);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      WFLocalizedStringWithKey(CFSTR("Toggle (System Setting, Subtitle)"), CFSTR("Toggle"));
      v24 = (WFContextualActionParameter *)objc_claimAutoreleasedReturnValue();
      v31 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFNumberContentItem"), 0, v9, &unk_1E5FFEE18);
      v51[0] = v31;
      v32 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFStringContentItem"), 0, CFSTR("operation"), CFSTR("toggle"));
      v51[1] = v32;
      v33 = v51;
LABEL_29:
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v20;
      v11 = v46;
      v10 = v47;
      goto LABEL_30;
    case 1uLL:
      v46 = v11;
      v47 = v10;
      v20 = v5;
      v34 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedStringWithKey(CFSTR("Turn Off (System Setting)"), CFSTR("Turn Off %@"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", v35, v8);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      WFLocalizedStringWithKey(CFSTR("Turn Off (System Setting, Subtitle)"), CFSTR("Turn Off"));
      v24 = (WFContextualActionParameter *)objc_claimAutoreleasedReturnValue();
      if (a3 == 2)
      {
        WFLocalizedString(CFSTR("Set to Light"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = v36;
        v24 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFStringContentItem"), 0, CFSTR("operation"), CFSTR("set"));
        v53[0] = v24;
        v26 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFStringContentItem"), 0, CFSTR("style"), CFSTR("light"));
        v53[1] = v26;
        v27 = (void *)MEMORY[0x1E0C99D20];
        v28 = v53;
        goto LABEL_25;
      }
      v31 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFNumberContentItem"), 0, v9, &unk_1E5FFEE30);
      v52[0] = v31;
      v32 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFStringContentItem"), 0, CFSTR("operation"), CFSTR("set"));
      v52[1] = v32;
      v33 = v52;
      goto LABEL_29;
    case 0uLL:
      v46 = v11;
      v47 = v10;
      v20 = v5;
      v21 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedStringWithKey(CFSTR("Turn On (System Setting)"), CFSTR("Turn On %@"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", v22, v8);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      WFLocalizedStringWithKey(CFSTR("Turn On (System Setting, Subtitle)"), CFSTR("Turn On"));
      v24 = (WFContextualActionParameter *)objc_claimAutoreleasedReturnValue();
      if (a3 == 2)
      {
        WFLocalizedString(CFSTR("Set to Dark"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = v25;
        v24 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFStringContentItem"), 0, CFSTR("operation"), CFSTR("set"));
        v55[0] = v24;
        v26 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFStringContentItem"), 0, CFSTR("style"), CFSTR("dark"));
        v55[1] = v26;
        v27 = (void *)MEMORY[0x1E0C99D20];
        v28 = v55;
LABEL_25:
        objc_msgSend(v27, "arrayWithObjects:count:", v28, 2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = (uint64_t)v23;
        v11 = v46;
        v10 = v47;
LABEL_33:

        v24 = (WFContextualActionParameter *)v38;
        goto LABEL_34;
      }
      v31 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFNumberContentItem"), 0, v9, &unk_1E5FFEE18);
      v54[0] = v31;
      v32 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFStringContentItem"), 0, CFSTR("operation"), CFSTR("set"));
      v54[1] = v32;
      v33 = v54;
      goto LABEL_29;
  }
  v23 = 0;
  v24 = 0;
  v37 = (void *)MEMORY[0x1E0C9AA60];
LABEL_30:
  if (a3 == 3 && v5)
  {
    WFLocalizedString(CFSTR("Turn On & Off"));
    v38 = objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
LABEL_34:
  v50[0] = CFSTR("com.apple.shortcuts.toggle-setting");
  v50[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "componentsJoinedByString:", CFSTR("."));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v49.receiver = self;
  v49.super_class = (Class)WFToggleSettingContextualAction;
  BYTE2(v45) = 0;
  LOWORD(v45) = 0;
  v41 = -[WFContextualAction initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:actionHasResult:isReversible:](&v49, sel_initWithIdentifier_wfActionIdentifier_associatedAppBundleIdentifier_parameters_displayFormatString_title_subtitleFormatString_icon_accessoryIcon_actionShowsUserInterface_actionHasResult_isReversible_, v40, v11, CFSTR("com.apple.Preferences"), v37, v23, v8, v24, v13, 0, v45);
  v42 = v41;
  if (v41)
  {
    v41->_setting = a3;
    v41->_operation = a4;
    v43 = v41;
  }

  return v42;
}

- (id)settingBiomeStreamIdentifier
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[WFToggleSettingContextualAction operation](self, "operation") == 2)
  {
    switch(-[WFToggleSettingContextualAction setting](self, "setting"))
    {
      case 0uLL:
        WFBiomeLibrary();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "Device");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "Wireless");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "AirplaneMode");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 1uLL:
        WFBiomeLibrary();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "Device");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "Power");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "EnergyMode");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 2uLL:
        WFBiomeLibrary();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "Device");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "Display");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "Appearance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 3uLL:
        WFBiomeLibrary();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "Device");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "Display");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "AlwaysOn");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 4uLL:
        WFBiomeLibrary();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "Device");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "Wireless");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "WiFiAvailabilityStatus");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 5uLL:
        WFBiomeLibrary();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "Device");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "Wireless");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "BluetoothPowerEnabled");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 6uLL:
        WFBiomeLibrary();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "Device");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "Wireless");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "CellularDataEnabled");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 7uLL:
        WFBiomeLibrary();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "Device");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "Display");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "TrueTone");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 8uLL:
        WFBiomeLibrary();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "Device");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "Display");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "NightShift");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
        v8 = v7;
        objc_msgSend(v7, "identifier");
        v2 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_14;
      case 9uLL:
        WFBiomeLibrary();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "Device");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "SilentMode");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        break;
      default:
        return v2;
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)uniqueIdentifier
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = -[WFToggleSettingContextualAction operation](self, "operation");
  if (v3 > 2)
    v4 = 0;
  else
    v4 = off_1E5FC5700[v3];
  -[WFContextualAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isReversible
{
  unint64_t v2;

  v2 = -[WFToggleSettingContextualAction setting](self, "setting");
  return (v2 < 0xA) & (0x20Eu >> v2);
}

- (id)associatedSettingsPreference
{
  unint64_t v2;

  v2 = -[WFToggleSettingContextualAction setting](self, "setting");
  if (v2 > 8)
    return 0;
  else
    return off_1E5FC5718[v2];
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;
  objc_super v9;

  v3 = (void *)objc_opt_new();
  v9.receiver = self;
  v9.super_class = (Class)WFToggleSettingContextualAction;
  v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v9, sel_hash));
  v5 = (id)objc_msgSend(v3, "combineInteger:", -[WFToggleSettingContextualAction setting](self, "setting"));
  v6 = (id)objc_msgSend(v3, "combineInteger:", -[WFToggleSettingContextualAction operation](self, "operation"));
  v7 = objc_msgSend(v3, "finalize");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFToggleSettingContextualAction;
  if (-[WFContextualAction isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v6 = objc_msgSend(v5, "setting");
      if (v6 == -[WFToggleSettingContextualAction setting](self, "setting"))
      {
        v7 = objc_msgSend(v5, "operation");
        v8 = v7 == -[WFToggleSettingContextualAction operation](self, "operation");
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {

      v5 = 0;
    }
    v8 = 0;
    goto LABEL_9;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (WFToggleSettingContextualAction)initWithCoder:(id)a3
{
  id v4;
  WFToggleSettingContextualAction *v5;
  uint64_t v6;
  uint64_t v7;
  WFToggleSettingContextualAction *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFToggleSettingContextualAction;
  v5 = -[WFContextualAction initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("setting"));
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("operation"));
    v5->_setting = v6;
    v5->_operation = v7;
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFToggleSettingContextualAction;
  v4 = a3;
  -[WFContextualAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_setting, CFSTR("setting"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_operation, CFSTR("operation"));

}

- (unint64_t)setting
{
  return self->_setting;
}

- (unint64_t)operation
{
  return self->_operation;
}

+ (id)spotlightDomainIdentifierForBundleIdentifier:(id)a3
{
  return CFSTR("settings-toggles");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
