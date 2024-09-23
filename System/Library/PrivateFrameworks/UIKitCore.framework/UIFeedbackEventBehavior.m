@implementation UIFeedbackEventBehavior

void __42___UIFeedbackEventBehavior_eventOccurred___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECD7A558;
  qword_1ECD7A558 = (uint64_t)v1;

}

uint64_t __50___UIFeedbackEventBehavior__activateAndPlayEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateAndPlayEvent:", *(_QWORD *)(a1 + 40));
}

@end
