@implementation PXApplicationRequestAVAudioSessionController

void __PXApplicationRequestAVAudioSessionController_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[PXSystemAVAudioSessionController applicationAVAudioSessionController](PXSystemAVAudioSessionController, "applicationAVAudioSessionController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __PXApplicationRequestAVAudioSessionController_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("PXApplicationAVAudioSessionController", v2);
  v1 = (void *)PXApplicationRequestAVAudioSessionController_queue;
  PXApplicationRequestAVAudioSessionController_queue = (uint64_t)v0;

}

@end
