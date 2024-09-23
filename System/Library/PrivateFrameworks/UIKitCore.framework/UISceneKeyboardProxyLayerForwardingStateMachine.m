@implementation UISceneKeyboardProxyLayerForwardingStateMachine

id __78___UISceneKeyboardProxyLayerForwardingStateMachine_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  const __CFString *v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
  if (v3 > 2)
    v4 = CFSTR("(unknown)");
  else
    v4 = off_1E16C34F0[v3];
  return (id)objc_msgSend(v2, "appendObject:withName:skipIfNil:", v4, CFSTR("state"), 1);
}

void __72___UISceneKeyboardProxyLayerForwardingStateMachine__noteHostedInWindow___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_noteHostedInWindow:", WeakRetained[5]);

}

@end
