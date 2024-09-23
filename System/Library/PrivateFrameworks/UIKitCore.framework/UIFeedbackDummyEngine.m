@implementation UIFeedbackDummyEngine

void __38___UIFeedbackDummyEngine_sharedEngine__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECD7B8B8;
  qword_1ECD7B8B8 = (uint64_t)v1;

}

uint64_t __75___UIFeedbackDummyEngine__internal_activateUnderlyingPlayerWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47___UIFeedbackDummyEngine__playFeedback_atTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_playFeedbackData:forFeedback:atTime:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

uint64_t __40___UIFeedbackDummyEngine__stopFeedback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_stopFeedbackData:forFeedback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
