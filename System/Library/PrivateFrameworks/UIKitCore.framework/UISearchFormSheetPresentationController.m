@implementation UISearchFormSheetPresentationController

uint64_t __75___UISearchFormSheetPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "dimmingView"), "display:", 1);
}

uint64_t __75___UISearchFormSheetPresentationController_presentationTransitionWillBegin__block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "presentingViewController"), "view"), "_beginOcclusion:", *(_QWORD *)(a1 + 32));
}

uint64_t __72___UISearchFormSheetPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "dimmingView"), "display:", 0);
}

uint64_t __72___UISearchFormSheetPresentationController_dismissalTransitionWillBegin__block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "presentingViewController"), "view"), "_endOcclusion:", *(_QWORD *)(a1 + 32));
}

uint64_t __98___UISearchFormSheetPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "containerView"), "layoutIfNeeded");
}

@end
