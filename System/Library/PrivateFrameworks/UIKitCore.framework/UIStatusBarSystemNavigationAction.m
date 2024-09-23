@implementation UIStatusBarSystemNavigationAction

uint64_t __70___UIStatusBarSystemNavigationAction__navigationActionForDestination___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend((id)UIApp, "_systemNavigationAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canSendResponse");
  if ((_DWORD)v3)
    objc_msgSend(v2, "sendResponseForDestination:", *(_QWORD *)(a1 + 32));

  return v3;
}

@end
