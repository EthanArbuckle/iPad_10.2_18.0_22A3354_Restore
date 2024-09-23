uint64_t WCInputSourceTypeIsSupportedOnDevice(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;

  if (a1)
    return 1;
  v3 = (objc_class *)MEMORY[0x24BDD1880];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("1FD8E157-2B7C-45B6-B939-FFB8BE14E27F"));
  v6 = objc_msgSend(v4, "supportsCapability:", v5);

  return v6;
}

id WCAvailableInputSourceTypes()
{
  if (WCAvailableInputSourceTypes_onceToken != -1)
    dispatch_once(&WCAvailableInputSourceTypes_onceToken, &__block_literal_global);
  return (id)WCAvailableInputSourceTypes_AvailableInputSourceTypes;
}

id WCNameForInputSourceType(uint64_t a1, id a2)
{
  __CFString *v2;

  switch(a1)
  {
    case 0:
      v2 = CFSTR("input.source.grey");
      goto LABEL_7;
    case 1000:
      v2 = CFSTR("input.source.digital.crown");
      goto LABEL_7;
    case 1:
      v2 = CFSTR("input.source.motion.pointer");
LABEL_7:
      WCLocalizedString(v2);
      a2 = (id)objc_claimAutoreleasedReturnValue();
      break;
  }
  return a2;
}

BOOL WCInputSourceTypeDefaultEnabledState(uint64_t a1)
{
  return a1 != 1000 && a1 != 1;
}

uint64_t WatchControlSettingsChanged(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "informLocalObservers");
}

void WCSynchronizeDomain(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v4 = a1;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "synchronizeNanoDomain:keys:", v4, v3);

}

void sub_22D26B808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id WCNameForActionMenuPosition(unint64_t a1)
{
  if (a1 <= 2)
  {
    WCLocalizedString(off_24F870A18[a1]);
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

id WCLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isLoaded") & 1) == 0)
    objc_msgSend(v2, "load");
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_24F871428, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id defaultGreyEventActionCustomizations()
{
  _QWORD v1[4];
  _QWORD v2[5];

  v2[4] = *MEMORY[0x24BDAC8D0];
  v1[0] = &unk_24F8740E8;
  v1[1] = &unk_24F874100;
  v2[0] = &unk_24F874118;
  v2[1] = &unk_24F874130;
  v1[2] = &unk_24F8740B8;
  v1[3] = &unk_24F8740D0;
  v2[2] = &unk_24F874148;
  v2[3] = &unk_24F874160;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v2, v1, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id WCNameForMotionPointerMovementTolerance(unint64_t a1)
{
  if (a1 <= 2)
  {
    WCLocalizedString(off_24F870A30[a1]);
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

id WCNameForMotionPointerEdge(unint64_t a1)
{
  if (a1 <= 3)
  {
    WCLocalizedString(off_24F870A48[a1]);
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

id defaultMotionPointerEdgeActionCustomizations()
{
  if (defaultMotionPointerEdgeActionCustomizations_onceToken != -1)
    dispatch_once(&defaultMotionPointerEdgeActionCustomizations_onceToken, &__block_literal_global_381);
  return (id)defaultMotionPointerEdgeActionCustomizations_DefaultMotionPointerEdgeActions;
}

void __defaultMotionPointerEdgeActionCustomizations_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  v6[0] = &unk_24F8740B8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", WCDefaultActionForMotionPointerEdge(0));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v0;
  v6[1] = &unk_24F8740D0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", WCDefaultActionForMotionPointerEdge(1uLL));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  v6[2] = &unk_24F8740E8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", WCDefaultActionForMotionPointerEdge(2uLL));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  v6[3] = &unk_24F874100;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", WCDefaultActionForMotionPointerEdge(3uLL));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)defaultMotionPointerEdgeActionCustomizations_DefaultMotionPointerEdgeActions;
  defaultMotionPointerEdgeActionCustomizations_DefaultMotionPointerEdgeActions = v4;

}

uint64_t AXAssistiveTouchCursorColorForCursorColor(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 7)
    return 0;
  return result;
}

uint64_t WCNameForCursorColor()
{
  return AXAssistiveTouchScannerColorDescription();
}

id WCNameForFocusMovementStyle(void *a1)
{
  __CFString *v1;

  if (!a1)
  {
    v1 = CFSTR("focus.movement.style.manual");
    goto LABEL_5;
  }
  if (a1 == (void *)1)
  {
    v1 = CFSTR("focus.movement.style.auto");
LABEL_5:
    WCLocalizedString(v1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id WCLocalizedStringElton(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isLoaded") & 1) == 0)
    objc_msgSend(v2, "load");
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_24F871428, CFSTR("Localizable-elton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t WCAXHandGestureEventUsageForGreyEvent(unint64_t a1)
{
  if (a1 < 4)
    return a1 + 1;
  else
    return WCAXHandGestureEventUsageUnknown;
}

uint64_t WCGreyEventForAXHandGestureEventUsage(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 4)
    return WCGreyEventNone;
  else
    return a1 - 1;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id wc_general_log()
{
  if (wc_general_log_onceToken != -1)
    dispatch_once(&wc_general_log_onceToken, &__block_literal_global_1);
  return (id)wc_general_log___logger;
}

void __wc_general_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WatchControl", "general");
  v1 = (void *)wc_general_log___logger;
  wc_general_log___logger = (uint64_t)v0;

}

id wc_action_log()
{
  if (wc_action_log_onceToken != -1)
    dispatch_once(&wc_action_log_onceToken, &__block_literal_global_3);
  return (id)wc_action_log___logger;
}

void __wc_action_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WatchControl", "action");
  v1 = (void *)wc_action_log___logger;
  wc_action_log___logger = (uint64_t)v0;

}

id wc_autoscroll_log()
{
  if (wc_autoscroll_log_onceToken != -1)
    dispatch_once(&wc_autoscroll_log_onceToken, &__block_literal_global_5);
  return (id)wc_autoscroll_log___logger;
}

void __wc_autoscroll_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WatchControl", "autoscroll");
  v1 = (void *)wc_autoscroll_log___logger;
  wc_autoscroll_log___logger = (uint64_t)v0;

}

id wc_focus_log()
{
  if (wc_focus_log_onceToken != -1)
    dispatch_once(&wc_focus_log_onceToken, &__block_literal_global_7);
  return (id)wc_focus_log___logger;
}

void __wc_focus_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WatchControl", "focus");
  v1 = (void *)wc_focus_log___logger;
  wc_focus_log___logger = (uint64_t)v0;

}

id wc_input_source_log()
{
  if (wc_input_source_log_onceToken != -1)
    dispatch_once(&wc_input_source_log_onceToken, &__block_literal_global_9);
  return (id)wc_input_source_log___logger;
}

void __wc_input_source_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WatchControl", "input_source");
  v1 = (void *)wc_input_source_log___logger;
  wc_input_source_log___logger = (uint64_t)v0;

}

id wc_motion_pointer_log()
{
  if (wc_motion_pointer_log_onceToken != -1)
    dispatch_once(&wc_motion_pointer_log_onceToken, &__block_literal_global_11);
  return (id)wc_motion_pointer_log___logger;
}

void __wc_motion_pointer_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WatchControl", "motion_pointer");
  v1 = (void *)wc_motion_pointer_log___logger;
  wc_motion_pointer_log___logger = (uint64_t)v0;

}

id wc_services_log()
{
  if (wc_services_log_onceToken != -1)
    dispatch_once(&wc_services_log_onceToken, &__block_literal_global_13);
  return (id)wc_services_log___logger;
}

void __wc_services_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WatchControl", "services");
  v1 = (void *)wc_services_log___logger;
  wc_services_log___logger = (uint64_t)v0;

}

id wc_shake_gesture_log()
{
  if (wc_shake_gesture_log_onceToken != -1)
    dispatch_once(&wc_shake_gesture_log_onceToken, &__block_literal_global_15);
  return (id)wc_shake_gesture_log___logger;
}

void __wc_shake_gesture_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WatchControl", "shake_gesture");
  v1 = (void *)wc_shake_gesture_log___logger;
  wc_shake_gesture_log___logger = (uint64_t)v0;

}

id WCLocalizedTitleForCustomAction(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  if (a1 != 1)
    goto LABEL_4;
  v2 = (void *)MEMORY[0x24BE006E0];
  v3 = a2;
  objc_msgSend(v2, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shortcutForIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "shortcutName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    v6 = 0;
  }
  return v6;
}

id WCImageForCustomAction(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;

  v3 = a2;
  if (a1 == 1)
  {
    objc_msgSend(MEMORY[0x24BE006E0], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortcutForIdentifier:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_msgSend(v5, "glyphCharacter");
      v14 = 0;
      v15 = &v14;
      v16 = 0x2020000000;
      v7 = (void (*)(uint64_t))getWFSystemImageNameForGlyphCharacterSymbolLoc_ptr;
      v17 = getWFSystemImageNameForGlyphCharacterSymbolLoc_ptr;
      if (!getWFSystemImageNameForGlyphCharacterSymbolLoc_ptr)
      {
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __getWFSystemImageNameForGlyphCharacterSymbolLoc_block_invoke;
        v13[3] = &unk_24F870B90;
        v13[4] = &v14;
        __getWFSystemImageNameForGlyphCharacterSymbolLoc_block_invoke((uint64_t)v13);
        v7 = (void (*)(uint64_t))v15[3];
      }
      _Block_object_dispose(&v14, 8);
      if (!v7)
        WCImageForCustomAction_cold_1();
      v7(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
      {
        v9 = (void *)MEMORY[0x24BDF6AC8];
        objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithTextStyle:", *MEMORY[0x24BDF7858]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_systemImageNamed:withConfiguration:", v8, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void sub_22D271628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WCPayloadForCustomAction(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = kWCCustomActionTypePayloadTypeKey;
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a2;
  objc_msgSend(v3, "numberWithInteger:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = kWCCustomActionTypePayloadIdentifierKey;
  v10[0] = v5;
  v10[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id WCDictionaryForCustomActionPayload(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a1;
  if (WCDictionaryForCustomActionPayload_onceToken != -1)
    dispatch_once(&WCDictionaryForCustomActionPayload_onceToken, &__block_literal_global_2);
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", WCDictionaryForCustomActionPayload_UnarchiveClasses, v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
    v6 = 0;
  else
    v6 = v4;

  return v6;
}

BOOL WCRetrieveCustomActionFromPayload(void *a1, _QWORD *a2, _QWORD *a3, uint64_t a4)
{
  void *v6;
  void *v7;
  void *v8;

  WCDictionaryForCustomActionPayload(a1, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", kWCCustomActionTypePayloadTypeKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *a2 = objc_msgSend(v8, "integerValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", kWCCustomActionTypePayloadIdentifierKey);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7 != 0;
}

void *__getWFSystemImageNameForGlyphCharacterSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (VoiceShortcutClientLibraryCore_frameworkLibrary)
  {
    v2 = (void *)VoiceShortcutClientLibraryCore_frameworkLibrary;
  }
  else
  {
    VoiceShortcutClientLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)VoiceShortcutClientLibraryCore_frameworkLibrary;
    if (!VoiceShortcutClientLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "WFSystemImageNameForGlyphCharacter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getWFSystemImageNameForGlyphCharacterSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id WCAvailableActions()
{
  if (WCAvailableActions_onceToken != -1)
    dispatch_once(&WCAvailableActions_onceToken, &__block_literal_global_3);
  return (id)WCAvailableActions_AvailableActions;
}

id WCNameForAction(uint64_t a1)
{
  void *v2;
  __CFString *v3;

  v3 = CFSTR("action.none");
  switch(a1)
  {
    case 0:
      goto LABEL_48;
    case 1:
      v3 = CFSTR("action.activate.focused.element");
      goto LABEL_48;
    case 2:
      v3 = CFSTR("action.motion.pointer.toggle");
      goto LABEL_48;
    case 3:
      v3 = CFSTR("action.move.focus.forwards");
      goto LABEL_48;
    case 4:
      v3 = CFSTR("action.move.focus.backwards");
      goto LABEL_48;
    case 5:
      v3 = CFSTR("action.autoscroll.digital.crown");
      goto LABEL_48;
    case 6:
      v3 = CFSTR("action.autoscroll.vertical");
      goto LABEL_48;
    case 7:
      v3 = CFSTR("action.autoscroll.horizontal");
      goto LABEL_48;
    case 8:
      v3 = CFSTR("action.scroll.to.bottom");
      goto LABEL_48;
    case 9:
      v3 = CFSTR("action.scroll.to.top");
      goto LABEL_48;
    case 10:
      v3 = CFSTR("action.digital.crown.press");
      goto LABEL_48;
    case 11:
      v3 = CFSTR("action.sting.press");
      goto LABEL_48;
    case 12:
      v3 = CFSTR("action.sting.keycord.press");
      goto LABEL_48;
    case 13:
      v3 = CFSTR("action.show.dock");
      goto LABEL_48;
    case 14:
      v3 = CFSTR("action.show.notification.center");
      goto LABEL_48;
    case 15:
      v3 = CFSTR("action.show.control.center");
      goto LABEL_48;
    case 16:
LABEL_6:
      v3 = CFSTR("action.show.app.launcher");
      goto LABEL_48;
    case 17:
      v3 = CFSTR("action.show.siri");
      goto LABEL_48;
    case 18:
      v3 = CFSTR("action.show.wallet");
      goto LABEL_48;
    case 19:
      v3 = CFSTR("action.show.shutdown.alert");
      goto LABEL_48;
    case 20:
      v3 = CFSTR("action.gesture.mode");
      goto LABEL_48;
    case 21:
LABEL_7:
      v3 = CFSTR("action.action.menu");
      goto LABEL_48;
    case 22:
      v3 = CFSTR("action.tap.and.hold");
      goto LABEL_48;
    case 23:
      v3 = CFSTR("action.side.button.press");
LABEL_48:
      WCLocalizedString(v3);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v2 = 0;
      switch(a1)
      {
        case 10000:
          v3 = CFSTR("action.action.menu.dismiss");
          goto LABEL_48;
        case 10001:
          goto LABEL_7;
        case 10002:
          v3 = CFSTR("action.system.state.unlock");
          goto LABEL_48;
        case 10003:
          v3 = CFSTR("action.motion.pointer.tap.point");
          goto LABEL_48;
        case 10004:
        case 10005:
          goto LABEL_6;
        case 10006:
          v3 = CFSTR("action.confirm.apple.pay");
          goto LABEL_48;
        case 10007:
          v3 = CFSTR("action.confirm.auto.unlock");
          goto LABEL_48;
        case 10008:
          v3 = CFSTR("action.file.radar");
          goto LABEL_48;
        case 10009:
          v3 = CFSTR("action.motion.pointer.edge.swipe.top");
          goto LABEL_48;
        case 10010:
          v3 = CFSTR("action.motion.pointer.edge.swipe.bottom");
          goto LABEL_48;
        case 10011:
          v3 = CFSTR("action.motion.pointer.edge.swipe.left");
          goto LABEL_48;
        case 10012:
          v3 = CFSTR("action.motion.pointer.edge.swipe.right");
          goto LABEL_48;
        case 10013:
          v3 = CFSTR("action.move.focus.to.first");
          goto LABEL_48;
        case 10014:
          v3 = CFSTR("action.move.focus.to.last");
          goto LABEL_48;
        case 10015:
          v3 = CFSTR("action.pause.motion.pointer");
          goto LABEL_48;
        case 10016:
          v3 = CFSTR("action.digital.crown.single.turn.up");
          goto LABEL_48;
        case 10017:
          v3 = CFSTR("action.digital.crown.single.turn.down");
          goto LABEL_48;
        case 10018:
          v3 = CFSTR("action.pause.auto.focus.navigation");
          goto LABEL_48;
        case 10019:
          v3 = CFSTR("action.turn.off.backlight");
          goto LABEL_48;
        case 10021:
          v3 = CFSTR("action.nearby.device.control");
          goto LABEL_48;
        case 10022:
          v3 = CFSTR("action.return.to.last.app");
          goto LABEL_48;
        case 10023:
          v3 = CFSTR("action.digital.crown.dynamic.turn");
          goto LABEL_48;
        case 10024:
          v3 = CFSTR("action.show.home.screen");
          goto LABEL_48;
        default:
          return v2;
      }
  }
  return v2;
}

const __CFString *WCSymbolNameForAction(uint64_t a1)
{
  const __CFString *result;

  result = 0;
  switch(a1)
  {
    case 10000:
      result = CFSTR("xmark.circle.fill");
      break;
    case 10001:
LABEL_11:
      result = CFSTR("filemenu.and.selection");
      break;
    case 10002:
      result = CFSTR("lock.open.fill");
      break;
    case 10003:
      result = CFSTR("dot.circle.and.hand.point.up.left.fill");
      break;
    case 10004:
      result = CFSTR("list.bullet");
      break;
    case 10005:
LABEL_9:
      result = CFSTR("circles.hexagongrid.fill");
      break;
    case 10006:
LABEL_10:
      result = CFSTR("wallet.fill");
      break;
    case 10007:
      result = CFSTR("lock.circle.fill");
      break;
    case 10008:
      result = CFSTR("ant.circle.fill");
      break;
    case 10009:
      result = CFSTR("chevron.up.circle.fill");
      break;
    case 10010:
      result = CFSTR("chevron.down.circle.fill");
      break;
    case 10011:
      result = CFSTR("chevron.left.circle.fill");
      break;
    case 10012:
      result = CFSTR("chevron.right.circle.fill");
      break;
    case 10013:
LABEL_7:
      result = CFSTR("arrow.up.to.line");
      break;
    case 10014:
LABEL_6:
      result = CFSTR("arrow.down.to.line");
      break;
    case 10015:
    case 10018:
      result = CFSTR("pause.circle.fill");
      break;
    case 10016:
    case 10023:
LABEL_5:
      result = CFSTR("digitalcrown.arrow.clockwise.fill");
      break;
    case 10017:
      result = CFSTR("digitalcrown.arrow.counterclockwise.fill");
      break;
    case 10019:
      result = CFSTR("applewatch.case.inset.filled");
      break;
    case 10020:
      return result;
    case 10021:
      result = CFSTR("wave.3.forward");
      break;
    case 10022:
      result = CFSTR("square.fill.on.square.fill");
      break;
    case 10024:
      result = CFSTR("platter.filled.bottom.applewatch.case");
      break;
    default:
      switch(a1)
      {
        case 1:
        case 22:
          result = CFSTR("hand.tap.fill");
          break;
        case 2:
          result = CFSTR("smallcircle.fill.circle");
          break;
        case 3:
          result = CFSTR("chevron.forward.2");
          break;
        case 4:
          result = CFSTR("chevron.backward.2");
          break;
        case 5:
          goto LABEL_5;
        case 6:
          result = CFSTR("arrow.up.arrow.down.circle.fill");
          break;
        case 7:
          result = CFSTR("arrow.left.arrow.right.circle.fill");
          break;
        case 8:
          goto LABEL_6;
        case 9:
          goto LABEL_7;
        case 10:
          result = CFSTR("digitalcrown.press.fill");
          break;
        case 11:
        case 12:
          result = CFSTR("applewatch.action.button.arrow.right");
          break;
        case 13:
          result = CFSTR("watchdock.applewatch.case");
          break;
        case 14:
          result = CFSTR("bell.badge");
          break;
        case 15:
          result = CFSTR("controlcenter.applewatch.case");
          break;
        case 16:
          goto LABEL_9;
        case 17:
          result = CFSTR("siri");
          break;
        case 18:
          goto LABEL_10;
        case 19:
          result = CFSTR("power");
          break;
        case 20:
          result = CFSTR("hand.draw.fill");
          break;
        case 21:
          goto LABEL_11;
        case 23:
          result = CFSTR("applewatch.side.button.arrow.left");
          break;
        default:
          return result;
      }
      break;
  }
  return result;
}

id WCImageForAction(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (void *)MEMORY[0x24BDF6AC8];
  WCSymbolNameForAction(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithTextStyle:", *MEMORY[0x24BDF7858]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_systemImageNamed:withConfiguration:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithTintColor:renderingMode:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL WCActionIsInternalAction(unint64_t a1)
{
  return a1 >> 4 > 0x270;
}

BOOL WCActionIsAutoScrollAction(uint64_t a1)
{
  return (unint64_t)(a1 - 5) < 3;
}

BOOL WCActionIsEdgeSwipeAction(uint64_t a1)
{
  return (unint64_t)(a1 - 10009) < 4;
}

BOOL WCActionRequiresFocusRing(unint64_t a1)
{
  _BOOL8 result;

  result = 1;
  if (a1 > 0x15 || ((1 << a1) & 0x20001A) == 0)
    return a1 - 10000 < 2;
  return result;
}

uint64_t WCActionIsStingSupported()
{
  void *v0;
  void *v1;
  void *v2;
  int v3;
  void *v4;
  unsigned int v5;
  void *v6;
  int v7;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getActivePairedDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "valueForProperty:", *MEMORY[0x24BE6B340]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  objc_msgSend(v1, "valueForProperty:", *MEMORY[0x24BE6B348]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("15BF559D-D50B-44FE-AC84-DFBA323EC985"));
  v7 = objc_msgSend(v1, "supportsCapability:", v6);

  return v7 & ~(v3 | v5);
}

id WCDefaultActionsForActionGroup(uint64_t a1)
{
  void *v1;

  if (a1 <= 9999)
  {
    if (a1)
    {
      if (a1 == 1)
      {
        v1 = &unk_24F8746A8;
      }
      else if (a1 == 2)
      {
        v1 = &unk_24F874690;
      }
      else
      {
LABEL_8:
        v1 = (void *)MEMORY[0x24BDBD1A8];
      }
    }
    else
    {
      v1 = (void *)objc_msgSend(&unk_24F8746C0, "mutableCopy");
      if (_os_feature_enabled_impl())
        objc_msgSend(v1, "removeObject:", &unk_24F8742C8);
      if (AXIsInternalInstall())
        objc_msgSend(v1, "addObject:", &unk_24F874358);
      if (WCActionIsStingSupported())
      {
        objc_msgSend(v1, "insertObject:atIndex:", &unk_24F874370, 3);
        objc_msgSend(v1, "insertObject:atIndex:", &unk_24F874388, 3);
      }
    }
  }
  else
  {
    switch(a1)
    {
      case 10000:
        v1 = &unk_24F8746D8;
        break;
      case 10001:
        v1 = &unk_24F8746F0;
        break;
      case 10003:
        v1 = &unk_24F874708;
        break;
      default:
        goto LABEL_8;
    }
  }
  return v1;
}

id WCNameForActionGroup(uint64_t a1)
{
  void *v2;
  __CFString *v3;

  v2 = 0;
  if (a1 > 9999)
  {
    switch(a1)
    {
      case 10000:
        v3 = CFSTR("action.group.general.interaction");
        goto LABEL_14;
      case 10002:
        v3 = CFSTR("action.group.siri.shortcuts");
        goto LABEL_14;
      case 10003:
        v3 = CFSTR("action.group.digital.crown");
        goto LABEL_14;
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        v3 = CFSTR("action.group.system");
        goto LABEL_14;
      case 1:
        v3 = CFSTR("action.group.autoscroll");
        goto LABEL_14;
      case 2:
        v3 = CFSTR("action.group.accessibility.actions");
LABEL_14:
        WCLocalizedString(v3);
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  return v2;
}

const __CFString *WCSymbolNameForActionGroup(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;

  v1 = CFSTR("smallcircle.fill.circle.fill");
  v2 = CFSTR("digitalcrown.arrow.clockwise.fill");
  if (a1 != 10003)
    v2 = 0;
  if (a1 == 10002)
    v3 = CFSTR("app.2.stack.3d.fill");
  else
    v3 = v2;
  v4 = CFSTR("applewatch");
  if (a1 != 10000)
    v1 = v3;
  v5 = CFSTR("hand.tap.fill");
  if (a1 != 2)
    v5 = 0;
  if (a1 == 1)
    v5 = CFSTR("arrow.up.and.down.and.sparkles");
  if (a1)
    v4 = v5;
  if (a1 <= 9999)
    return v4;
  else
    return v1;
}

id WCImageForActionGroup(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (void *)MEMORY[0x24BDF6AC8];
  WCSymbolNameForActionGroup(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithTextStyle:", *MEMORY[0x24BDF7858]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_systemImageNamed:withConfiguration:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithTintColor:renderingMode:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void *WCAvailableActionGroups()
{
  return &unk_24F874720;
}

id WCAvailableActionGroupsForSettings()
{
  void *v0;
  void *v1;

  objc_msgSend(&unk_24F874738, "arrayByAddingObjectsFromArray:", &unk_24F874720);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayByAddingObjectsFromArray:", &unk_24F874750);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

unint64_t WCDefaultActionForMotionPointerEdge(unint64_t a1)
{
  if (a1 >= 4)
    return 0;
  else
    return a1 + 10009;
}

const __CFString *greyEventNameForAnalytics(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("clench");
  else
    return off_24F870C10[a1 - 1];
}

const __CFString *actionNameForAnalytics(uint64_t a1)
{
  const __CFString *result;

  switch(a1)
  {
    case 10000:
      result = CFSTR("DismissActionMenu");
      break;
    case 10001:
      result = CFSTR("ActivateActionMenu");
      break;
    case 10002:
      result = CFSTR("SystemStateUnlock");
      break;
    case 10003:
      result = CFSTR("TapAtMotionPointerPoint");
      break;
    case 10004:
      result = CFSTR("AppLauncherList");
      break;
    case 10005:
      result = CFSTR("AppLauncherFieldOfIcons");
      break;
    case 10006:
      result = CFSTR("ConfirmApplePay");
      break;
    case 10007:
      result = CFSTR("ConfirmAutoUnlock");
      break;
    case 10008:
      result = CFSTR("FileRadar");
      break;
    case 10009:
      result = CFSTR("DwellControlTopEdgeSwipe");
      break;
    case 10010:
      result = CFSTR("DwellControlBottomEdgeSwipe");
      break;
    case 10011:
      result = CFSTR("DwellControlLeftEdgeSwipe");
      break;
    case 10012:
      result = CFSTR("DwellControlRightEdgeSwipe");
      break;
    case 10013:
      result = CFSTR("MoveFocusToFirst");
      break;
    case 10014:
      result = CFSTR("MoveFocusToLast");
      break;
    case 10015:
      result = CFSTR("PauseMotionPointer");
      break;
    case 10016:
      result = CFSTR("DigitalCrownSingleTurnUp");
      break;
    case 10017:
      result = CFSTR("DigitalCrownSingleTurnDown");
      break;
    case 10018:
      result = CFSTR("PauseAutoFocusNavigation");
      break;
    case 10019:
      result = CFSTR("TurnOffBacklight");
      break;
    case 10020:
      result = CFSTR("CustomActionPlaceholder");
      break;
    case 10021:
      result = CFSTR("NearbyDeviceControl");
      break;
    case 10022:
      result = CFSTR("ReturnToLastApp");
      break;
    case 10023:
      result = CFSTR("DigitalCrownDynamicTurn");
      break;
    case 10024:
      result = CFSTR("ShowHomeScreen");
      break;
    default:
      switch(a1)
      {
        case 1:
          result = CFSTR("ActivateFocusedElement");
          break;
        case 2:
          result = CFSTR("MotionPointer");
          break;
        case 3:
          result = CFSTR("MoveFocusForwards");
          break;
        case 4:
          result = CFSTR("MoveFocusBackwards");
          break;
        case 5:
          result = CFSTR("DigitalCrownAutoScroll");
          break;
        case 6:
          result = CFSTR("VerticalAutoScroll");
          break;
        case 7:
          result = CFSTR("HorizontalAutoScroll");
          break;
        case 8:
          result = CFSTR("ScrollToBottom");
          break;
        case 9:
          result = CFSTR("ScrollToTop");
          break;
        case 10:
          result = CFSTR("DigitalCrownPress");
          break;
        case 11:
          result = CFSTR("StingPress");
          break;
        case 12:
          result = CFSTR("StingKeycordPress");
          break;
        case 13:
          result = CFSTR("ShowDock");
          break;
        case 14:
          result = CFSTR("ShowNotificationCenter");
          break;
        case 15:
          result = CFSTR("ShowControlCenter");
          break;
        case 16:
          result = CFSTR("ShowAppLauncher");
          break;
        case 17:
          result = CFSTR("ShowSiri");
          break;
        case 18:
          result = CFSTR("ShowWallet");
          break;
        case 19:
          result = CFSTR("ShowShutdownAlert");
          break;
        case 20:
          result = CFSTR("GestureMode");
          break;
        case 21:
          result = CFSTR("Menu");
          break;
        case 22:
          result = CFSTR("TapAndHoldAtPoint");
          break;
        case 23:
          result = CFSTR("SideButtonPress");
          break;
        default:
          result = CFSTR("None");
          break;
      }
      break;
  }
  return result;
}

const __CFString *inputSourceNameForAnalytics(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Grey");
  if (a1 == 1)
    v1 = CFSTR("MotionPointer");
  if (a1 == 1000)
    return CFSTR("DigitalCrown");
  else
    return v1;
}

const __CFString *focusRingColorNameForAnalytics(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6)
    return CFSTR("Default");
  else
    return off_24F870C28[a1 - 1];
}

uint64_t isUsingGrey()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;

  +[WatchControlSettings sharedInstance](WatchControlSettings, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "enabledInputSourceTypes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "objectForKeyedSubscript:", &unk_24F8744D8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

id WCAvailableGreyEvents()
{
  if (WCAvailableGreyEvents_onceToken != -1)
    dispatch_once(&WCAvailableGreyEvents_onceToken, &__block_literal_global_4);
  return (id)WCAvailableGreyEvents_AvailableGreyEvents;
}

id WCNameForGreyEvent(uint64_t a1)
{
  __CFString *v1;
  void *v2;
  __CFString *v3;

  switch(a1)
  {
    case 0:
      v1 = CFSTR("grey.event.clinch");
      goto LABEL_5;
    case 1:
      v1 = CFSTR("grey.event.double.clinch");
      goto LABEL_5;
    case 2:
      v3 = CFSTR("grey.event.tap");
      goto LABEL_8;
    case 3:
      v3 = CFSTR("grey.event.double.tap");
LABEL_8:
      WCLocalizedStringElton(v3);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v1 = CFSTR("grey.event.none");
LABEL_5:
      WCLocalizedString(v1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v2;
}

id WCOnboardingDescriptionForGreyEvent(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  WCLocalizedString(*(&off_24F870C98 + a1));
  return (id)objc_claimAutoreleasedReturnValue();
}

id WCOnboardingInstructionsForGreyEvent(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  WCLocalizedString(*(&off_24F870CB8 + a1));
  return (id)objc_claimAutoreleasedReturnValue();
}

id WCPracticeGestureSuccessTitleForGreyEvent(uint64_t a1)
{
  __CFString *v1;
  void *v2;
  __CFString *v3;

  switch(a1)
  {
    case 0:
      v1 = CFSTR("grey.practice.success.clench.title");
      goto LABEL_6;
    case 1:
      v1 = CFSTR("grey.practice.success.double.clench.title");
LABEL_6:
      WCLocalizedString(v1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      return v2;
    case 2:
      v3 = CFSTR("grey.practice.success.tap.title");
      goto LABEL_9;
    case 3:
      v3 = CFSTR("grey.practice.success.double.tap.title");
LABEL_9:
      WCLocalizedStringElton(v3);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v2 = 0;
      break;
  }
  return v2;
}

id WCPracticeGestureSuccessMessageForGreyEvent(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  WCLocalizedString(*(&off_24F870CD8 + a1));
  return (id)objc_claimAutoreleasedReturnValue();
}

id WCOnboardingImageForGreyEvent(unint64_t a1, char a2)
{
  void *v2;
  void *v3;

  if (a1 > 3)
  {
    v2 = 0;
    if ((a2 & 1) != 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v2 = *(&off_24F870CF8 + a1);
  if ((a2 & 1) == 0)
  {
LABEL_5:
    objc_msgSend(v2, "stringByAppendingString:", CFSTR("-Pre"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_6:
  if (v2)
  {
    soft_WCImageForAssetName(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id soft_WCImageForAssetName(void *a1)
{
  id v1;
  void (*v2)(id);
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v1 = a1;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = (void (*)(id))getWCImageForAssetNameSymbolLoc_ptr;
  v9 = getWCImageForAssetNameSymbolLoc_ptr;
  if (!getWCImageForAssetNameSymbolLoc_ptr)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getWCImageForAssetNameSymbolLoc_block_invoke;
    v5[3] = &unk_24F870B90;
    v5[4] = &v6;
    __getWCImageForAssetNameSymbolLoc_block_invoke((uint64_t)v5);
    v2 = (void (*)(id))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
    WCImageForCustomAction_cold_1();
  v2(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_22D2737AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WCOnboardingAnimationImagesForGreyEvent(unint64_t a1, double *a2)
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  double v11;
  unint64_t v12;
  void *v13;
  double v14;
  unint64_t v15;
  void *v16;
  double v17;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a1 > 3)
  {
    v5 = 0;
    v3 = 0.0;
    v4 = 1;
  }
  else
  {
    v3 = dbl_22D274A90[a1];
    v4 = qword_22D274AB0[a1];
    v5 = (uint64_t)*(&off_24F870D18 + a1);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  do
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%03lu"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    soft_WCImageForAssetName(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "addObject:", v9);
    }
    else
    {
      wc_general_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_fault_impl(&dword_22D269000, v10, OS_LOG_TYPE_FAULT, "missing image %@", buf, 0xCu);
      }

    }
    ++v7;
  }
  while (v4 != v7);
  v11 = 1.0 / (v3 / (float)(unint64_t)objc_msgSend(v6, "count"));
  if (v11 > 0.0)
  {
    v12 = 1;
    do
    {
      objc_msgSend(v6, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "insertObject:atIndex:", v13, 0);

      v14 = (double)v12++;
    }
    while (v11 > v14);
    if (v11 > 0.0)
    {
      v15 = 1;
      do
      {
        objc_msgSend(v6, "lastObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v16);

        v17 = (double)v15++;
      }
      while (v11 > v17);
    }
  }
  *a2 = v3 + 1.0 + 1.0;
  return v6;
}

void *__getWCImageForAssetNameSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (WatchControlAssetsLibraryCore_frameworkLibrary)
  {
    v2 = (void *)WatchControlAssetsLibraryCore_frameworkLibrary;
  }
  else
  {
    WatchControlAssetsLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)WatchControlAssetsLibraryCore_frameworkLibrary;
    if (!WatchControlAssetsLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "WCImageForAssetName");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getWCImageForAssetNameSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id WCNameForAutoScrollDirection(void *a1)
{
  if ((unint64_t)a1 <= 3)
  {
    WCLocalizedString(*(&off_24F870D38 + (_QWORD)a1));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id WCNameForAutoMovementSpeed(void *a1)
{
  if ((unint64_t)a1 <= 2)
  {
    WCLocalizedString(*(&off_24F870D58 + (_QWORD)a1));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id WCNameForAutoScrollHandlerStatus(void *a1)
{
  if ((unint64_t)a1 <= 2)
  {
    WCLocalizedString(*(&off_24F870D70 + (_QWORD)a1));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void WCImageForCustomAction_cold_1()
{
  dlerror();
  abort_report_np();
  AXAssistiveTouchScannerColorDescription();
}

uint64_t AXAssistiveTouchScannerColorDescription()
{
  return MEMORY[0x24BDFFE48]();
}

uint64_t AXIsInternalInstall()
{
  return MEMORY[0x24BDFE088]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x24BDFE240]();
}

uint64_t AXSAssistiveTouchCursorColor()
{
  return MEMORY[0x24BDFE328]();
}

uint64_t AX_PERFORM_WITH_LOCK()
{
  return MEMORY[0x24BDFE3F8]();
}

uint64_t CALayerGetDelegate()
{
  return MEMORY[0x24BDE54D8]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x24BDBC080](center, observer);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x24BDD1238]();
}

uint64_t _AXSFullKeyboardAccessSetEnabled()
{
  return MEMORY[0x24BED2208]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x24BED25B0]();
}

uint64_t _AXSVoiceOverTouchSetEnabled()
{
  return MEMORY[0x24BED25B8]();
}

uint64_t _AXSWatchControlSetEnabled()
{
  return MEMORY[0x24BED2630]();
}

uint64_t _AXSZoomTouchEnabled()
{
  return MEMORY[0x24BED2650]();
}

uint64_t _AXSZoomTouchSetEnabled()
{
  return MEMORY[0x24BED2658]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x24BDFE550]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

