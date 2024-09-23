@implementation AccessibilityWrapper

+ (unsigned)accessibilityKeyboardKeySelectedNotification
{
  unsigned int *v2;
  void *v3;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = (unsigned int *)getUIAccessibilityKeyboardKeySelectedNotificationSymbolLoc_ptr;
  v9 = getUIAccessibilityKeyboardKeySelectedNotificationSymbolLoc_ptr;
  if (!getUIAccessibilityKeyboardKeySelectedNotificationSymbolLoc_ptr)
  {
    v3 = (void *)UIAccessibilityLibrary();
    v2 = (unsigned int *)dlsym(v3, "UIAccessibilityKeyboardKeySelectedNotification");
    v7[3] = (uint64_t)v2;
    getUIAccessibilityKeyboardKeySelectedNotificationSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v5 = (_Unwind_Exception *)soft_MCDMusicGeneralLogging_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return *v2;
}

+ (unint64_t)accessibilityTraitTableIndex
{
  unint64_t *v2;
  void *v3;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = (unint64_t *)getUIAccessibilityTraitTableIndexSymbolLoc_ptr;
  v9 = getUIAccessibilityTraitTableIndexSymbolLoc_ptr;
  if (!getUIAccessibilityTraitTableIndexSymbolLoc_ptr)
  {
    v3 = (void *)UIAccessibilityLibrary();
    v2 = (unint64_t *)dlsym(v3, "UIAccessibilityTraitTableIndex");
    v7[3] = (uint64_t)v2;
    getUIAccessibilityTraitTableIndexSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v5 = (_Unwind_Exception *)soft_MCDMusicGeneralLogging_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return *v2;
}

@end
