@implementation UICanvasLifecycleCompositeActionMaskComponentDescriptionComponents

uint64_t ___UICanvasLifecycleCompositeActionMaskComponentDescriptionComponents_block_invoke(uint64_t a1, unsigned int a2)
{
  const __CFString *v2;

  if (a2 > 6)
    v2 = &stru_1E16EDF20;
  else
    v2 = off_1E16B8068[a2];
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v2);
}

@end
