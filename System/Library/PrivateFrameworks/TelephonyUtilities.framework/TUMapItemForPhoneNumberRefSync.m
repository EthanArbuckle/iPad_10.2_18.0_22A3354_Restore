@implementation TUMapItemForPhoneNumberRefSync

void __TUMapItemForPhoneNumberRefSync_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.telephonyutilities.mapsearch.callbackqueue", 0);
  v1 = (void *)TUMapItemForPhoneNumberRefSync_callbackQueue;
  TUMapItemForPhoneNumberRefSync_callbackQueue = (uint64_t)v0;

}

intptr_t __TUMapItemForPhoneNumberRefSync_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "mapItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
