@implementation UIFeedbackBackBoardEngine

void __44___UIFeedbackBackBoardEngine__internalQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.UIKit.FeedbackBackBoardEngineInternal", v2);
  v1 = (void *)_MergedGlobals_3_18;
  _MergedGlobals_3_18 = (uint64_t)v0;

}

void __42___UIFeedbackBackBoardEngine_sharedEngine__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECD7A710;
  qword_1ECD7A710 = (uint64_t)v1;

}

uint64_t __51___UIFeedbackBackBoardEngine__playFeedback_atTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_playFeedbackData:forFeedback:atTime:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

uint64_t __44___UIFeedbackBackBoardEngine__stopFeedback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_stopFeedbackData:forFeedback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
