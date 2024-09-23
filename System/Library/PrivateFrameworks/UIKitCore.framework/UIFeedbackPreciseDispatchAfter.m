@implementation UIFeedbackPreciseDispatchAfter

void ___UIFeedbackPreciseDispatchAfter_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
}

@end
