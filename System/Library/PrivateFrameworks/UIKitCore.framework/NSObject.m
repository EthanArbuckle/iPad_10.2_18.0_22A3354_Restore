@implementation NSObject

void __63__NSObject_ConformsToProtocolCached__conformsToProtocolCached___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_MergedGlobals_1095;
  _MergedGlobals_1095 = (uint64_t)v0;

}

uint64_t __56__NSObject_UIAccessibilityAction__accessibilityActivate__block_invoke()
{
  _AXSApplicationAccessibilitySetEnabled();
  return objc_msgSend((id)UIApp, "_accessibilityInit");
}

uint64_t __89__NSObject_UIAccessibilityPrivate____accessibilityRequestGuidedAccessSession_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__NSObject_AccessibilityActivation___keyboardActivate__block_invoke(uint64_t a1)
{
  objc_msgSend((id)UIApp, "_enqueueHIDEvent:", *(_QWORD *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
