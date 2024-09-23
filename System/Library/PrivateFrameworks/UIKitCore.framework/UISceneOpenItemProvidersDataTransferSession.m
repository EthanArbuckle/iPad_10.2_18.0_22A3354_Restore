@implementation UISceneOpenItemProvidersDataTransferSession

void __72___UISceneOpenItemProvidersDataTransferSession_didFinishSendingRequests__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "dragContinuationDidFinishRequestingData");
  objc_msgSend(*(id *)(a1 + 32), "monitor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendDelegateEventsIfNeeded");

}

@end
