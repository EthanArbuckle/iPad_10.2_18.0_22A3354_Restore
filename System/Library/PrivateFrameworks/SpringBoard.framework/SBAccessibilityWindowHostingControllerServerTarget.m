@implementation SBAccessibilityWindowHostingControllerServerTarget

void __91___SBAccessibilityWindowHostingControllerServerTarget_registerWindowWithContextID_atLevel___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  objc_msgSend(WeakRetained, "registerWindowWithContextID:atLevel:", a1[5], a1[6]);

}

void __85___SBAccessibilityWindowHostingControllerServerTarget_unregisterWindowWithContextID___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "unregisterWindowWithContextID:", *(_QWORD *)(a1 + 40));

}

@end
