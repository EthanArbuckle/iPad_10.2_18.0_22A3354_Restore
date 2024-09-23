@implementation VOSVoiceOverGreyCommandInfo

+ (id)defaultCustomizeGestures
{
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x24BDAC8D0];
  v3[0] = &unk_24CBBC888;
  v3[1] = &unk_24CBBC8A0;
  v4[0] = kVOTEventCommandSimpleTap;
  v4[1] = kVOTEventCommandActivateHomeButton;
  v3[2] = &unk_24CBBC8B8;
  v3[3] = &unk_24CBBC8D0;
  v4[2] = kVOTEventCommandNextElement;
  v4[3] = kVOTEventCommandPreviousElement;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)defaultActions
{
  void *v2;
  void *v3;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x24BDAC8D0];
  v5[0] = kVOTEventCommandActivateHomeButton;
  v5[1] = kVOTEventCommandSimpleTap;
  v5[2] = kVOTEventCommandNextElement;
  v5[3] = kVOTEventCommandPreviousElement;
  v5[4] = kVOTEventCommandWatchWakeDoubleTap;
  v5[5] = kVOTEventCommandStartStopToggle;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  if (+[VOSVoiceOverGreyCommandInfo _isStingSupported](VOSVoiceOverGreyCommandInfo, "_isStingSupported"))
  {
    objc_msgSend(v3, "insertObject:atIndex:", kVOTEventCommandStingKeycordPress, 1);
    objc_msgSend(v3, "insertObject:atIndex:", kVOTEventCommandStingPress, 1);
  }
  return v3;
}

+ (id)nameForAction:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", kVOTEventCommandActivateHomeButton) & 1) != 0)
  {
    v4 = CFSTR("action.digital.crown.press");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kVOTEventCommandSimpleTap) & 1) != 0)
  {
    v4 = CFSTR("action.double.tap");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kVOTEventCommandNextElement) & 1) != 0)
  {
    v4 = CFSTR("action.swipe.left");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kVOTEventCommandPreviousElement) & 1) != 0)
  {
    v4 = CFSTR("action.swipe.right");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kVOTEventCommandWatchWakeDoubleTap) & 1) != 0)
  {
    v4 = CFSTR("action.taptic.time");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kVOTEventCommandStartStopToggle) & 1) != 0)
  {
    v4 = CFSTR("action.magic.tap");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kVOTEventCommandStingPress) & 1) != 0)
  {
    v4 = CFSTR("action.sting.press");
  }
  else if (objc_msgSend(v3, "isEqualToString:", kVOTEventCommandStingKeycordPress))
  {
    v4 = CFSTR("action.sting.keycord.press");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

+ (id)symbolNameForAction:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", kVOTEventCommandActivateHomeButton) & 1) != 0)
  {
    v4 = CFSTR("applewatch.crown.fill.arrow.up");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kVOTEventCommandSimpleTap) & 1) != 0)
  {
    v4 = CFSTR("hand.tap.fill");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kVOTEventCommandNextElement) & 1) != 0)
  {
    v4 = CFSTR("chevron.left.circle.fill");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kVOTEventCommandPreviousElement) & 1) != 0)
  {
    v4 = CFSTR("chevron.right.circle.fill");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kVOTEventCommandWatchWakeDoubleTap) & 1) != 0)
  {
    v4 = CFSTR("applewatch.radiowaves.left.and.right");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kVOTEventCommandStartStopToggle) & 1) != 0)
  {
    v4 = CFSTR("playpause.fill");
  }
  else
  {
    v4 = CFSTR("watchdock.applewatch.case");
    if ((objc_msgSend(v3, "isEqualToString:", kVOTEventCommandStingPress) & 1) == 0
      && !objc_msgSend(v3, "isEqualToString:", kVOTEventCommandStingKeycordPress))
    {
      v4 = 0;
    }
  }

  return (id)v4;
}

+ (BOOL)isVoiceOverGreyFeatureOn
{
  char v2;
  void *v3;
  void *v4;
  char v5;

  v2 = _os_feature_enabled_impl();
  objc_msgSend((id)objc_opt_class(), "_pairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("1FD8E157-2B7C-45B6-B939-FFB8BE14E27F"));
  v5 = objc_msgSend(v3, "supportsCapability:", v4);

  return v2 & v5;
}

+ (id)_pairedDevice
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B4E0], "activePairedDeviceSelectorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valueForProperty:", *MEMORY[0x24BE6B348]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "BOOLValue"))
    v7 = 0;
  else
    v7 = v5;
  v8 = v7;

  return v8;
}

+ (BOOL)_isStingSupported
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend((id)objc_opt_class(), "_pairedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("15BF559D-D50B-44FE-AC84-DFBA323EC985"));
  v4 = objc_msgSend(v2, "supportsCapability:", v3);

  return v4;
}

@end
