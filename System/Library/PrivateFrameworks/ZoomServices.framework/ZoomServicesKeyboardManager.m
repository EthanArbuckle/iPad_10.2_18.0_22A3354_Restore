@implementation ZoomServicesKeyboardManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__ZoomServicesKeyboardManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_Manager;
}

void __45__ZoomServicesKeyboardManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_Manager;
  sharedInstance_Manager = (uint64_t)v1;

}

- (int64_t)keyboardCommandForEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  int64_t v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  BOOL v21;
  uint64_t v22;
  int v23;
  int v24;
  void *v25;
  int v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  int v32;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "zoomKeyboardShortcutsEnabled");

  if (!v6)
    goto LABEL_29;
  if (!-[ZoomServicesKeyboardManager inUnitTestMode](self, "inUnitTestMode"))
  {
    objc_msgSend(v4, "keyInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "translateKeycode");

  }
  objc_msgSend(v4, "keyInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "keyDown");

  objc_msgSend(v4, "keyInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "modifierState");
  if (!v9)
  {
    v18 = ZWCommandOptionShiftModifiers;

    if (v11 == v18)
    {
      objc_msgSend(v4, "keyInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "keyCode");

      if (v20 != 9)
      {
LABEL_31:
        v16 = 15;
        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v17, "zoomSwitchZoomModeKbShortcutEnabled") == 0;
      v22 = 5;
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  v12 = ZWCommandOptionModifiers;

  objc_msgSend(v4, "keyInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v11 != v12)
  {
    v23 = objc_msgSend(v13, "modifierState");
    v24 = ZWControlOptionModifiers;

    if (v23 == v24)
    {
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v17, "zoomTempToggleZoomKbShortcutEnabled") == 0;
      v22 = 3;
      goto LABEL_25;
    }
    objc_msgSend(v4, "keyInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "modifierState");
    v27 = ZWCommandOptionControlModifiers;

    if (v26 == v27)
    {
      objc_msgSend(v4, "keyInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "keyCode");

      switch(v29)
      {
        case 'O':
          objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v17, "zoomResizeZoomWindowKbShortcutEnabled") == 0;
          v22 = 10;
          goto LABEL_25;
        case 'P':
          objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v17, "zoomResizeZoomWindowKbShortcutEnabled") == 0;
          v22 = 12;
          goto LABEL_25;
        case 'Q':
          objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v17, "zoomResizeZoomWindowKbShortcutEnabled") == 0;
          v22 = 13;
          goto LABEL_25;
        case 'R':
          objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v17, "zoomResizeZoomWindowKbShortcutEnabled") == 0;
          v22 = 11;
          goto LABEL_25;
        default:
          goto LABEL_31;
      }
    }
LABEL_23:
    objc_msgSend(v4, "keyInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "modifierState");
    v32 = ZWControlModifier;

    if (v31 == v32)
    {
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v17, "zoomScrollWheelKbShortcutEnabled") == 0;
      v22 = 14;
      goto LABEL_25;
    }
LABEL_29:
    v16 = 16;
    goto LABEL_30;
  }
  v15 = objc_msgSend(v13, "keyCode");

  v16 = 15;
  if (v15 > 45)
  {
    switch(v15)
    {
      case 'O':
        objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v17, "zoomPanZoomKbShortcutEnabled") == 0;
        v22 = 7;
        goto LABEL_25;
      case 'P':
        objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v17, "zoomPanZoomKbShortcutEnabled") == 0;
        v22 = 6;
        goto LABEL_25;
      case 'Q':
        objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v17, "zoomPanZoomKbShortcutEnabled") == 0;
        v22 = 9;
        goto LABEL_25;
      case 'R':
        objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v17, "zoomPanZoomKbShortcutEnabled") == 0;
        v22 = 8;
        goto LABEL_25;
      default:
        if (v15 != 46)
          goto LABEL_30;
        objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "zoomAdjustZoomLevelKbShortcutEnabled"))
          v16 = 0;
        else
          v16 = 16;
        break;
    }
    goto LABEL_28;
  }
  switch(v15)
  {
    case 9:
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v17, "zoomSwitchZoomModeKbShortcutEnabled") == 0;
      v22 = 4;
      goto LABEL_25;
    case 37:
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v17, "zoomToggleZoomKbShortcutEnabled") == 0;
      v22 = 2;
LABEL_25:
      if (v21)
        v16 = 16;
      else
        v16 = v22;
      goto LABEL_28;
    case 45:
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "zoomAdjustZoomLevelKbShortcutEnabled"))
        v16 = 1;
      else
        v16 = 16;
LABEL_28:

      break;
  }
LABEL_30:

  return v16;
}

- (BOOL)inUnitTestMode
{
  return self->_inUnitTestMode;
}

- (void)setInUnitTestMode:(BOOL)a3
{
  self->_inUnitTestMode = a3;
}

@end
