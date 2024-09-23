@implementation UIButtonBarTargetAction

uint64_t __45___UIButtonBarTargetAction__invoke_forEvent___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_triggerActionForEvent:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_executeValidationHandler");
}

@end
