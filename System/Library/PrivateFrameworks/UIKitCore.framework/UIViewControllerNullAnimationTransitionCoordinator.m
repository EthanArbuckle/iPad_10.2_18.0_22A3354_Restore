@implementation UIViewControllerNullAnimationTransitionCoordinator

uint64_t __90___UIViewControllerNullAnimationTransitionCoordinator__runAlongsideCompletionsAfterCommit__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runAlongsideCompletions");
}

void __79___UIViewControllerNullAnimationTransitionCoordinator__runAlongsideCompletions__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

void __78___UIViewControllerNullAnimationTransitionCoordinator__runAlongsideAnimations__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

@end
