@implementation SMMMusicSubscriptionStatusController

+ (void)requestSubscriptionCapabilitiesWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEC88B8], "sharedStatusController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __86__SMMMusicSubscriptionStatusController_requestSubscriptionCapabilitiesWithCompletion___block_invoke;
  v6[3] = &unk_24DC6AB40;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "getSubscriptionStatusWithCompletionHandler:", v6);

}

uint64_t __86__SMMMusicSubscriptionStatusController_requestSubscriptionCapabilitiesWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;

  if (a2 && !a3)
  {
    v4 = a2;
    objc_msgSend(v4, "capabilities");
    objc_msgSend(v4, "capabilities");

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
