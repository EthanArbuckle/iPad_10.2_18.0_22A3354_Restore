@implementation HandleMotionManagerNotification

void ___HandleMotionManagerNotification_block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "consumer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateEventProviderStatus:", *(_QWORD *)(a1 + 40));

}

@end
