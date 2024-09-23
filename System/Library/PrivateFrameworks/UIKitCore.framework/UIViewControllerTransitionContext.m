@implementation UIViewControllerTransitionContext

uint64_t __62___UIViewControllerTransitionContext___runAlongsideAnimations__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "_setAlongsideAnimations:", 0);
}

uint64_t __62___UIViewControllerTransitionContext__runAlongsideCompletions__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "_setAlongsideCompletions:", 0);
}

uint64_t __62___UIViewControllerTransitionContext__interactivityDidChange___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (!dyld_program_sdk_at_least())
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "_setInteractiveChangeHandlers:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "isInterruptible");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "_setInteractiveChangeHandlers:", 0);
  return result;
}

uint64_t __62___UIViewControllerTransitionContext___runAlongsideAnimations__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "_setSystemAlongsideAnimations:", 0);
}

uint64_t __62___UIViewControllerTransitionContext__runInvalidationHandlers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "_setInvalidationHandlers:", 0);
}

@end
