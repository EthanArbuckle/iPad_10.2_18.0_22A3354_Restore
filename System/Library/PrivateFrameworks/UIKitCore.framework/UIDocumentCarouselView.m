@implementation UIDocumentCarouselView

uint64_t __41___UIDocumentCarouselView__performLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_setHiddenForReuse:", 1);
}

void __41___UIDocumentCarouselView__performLayout__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;

  switch(a2)
  {
    case 0:
    case 3:
      CGRectGetMidX(*(CGRect *)(a1 + 48));
      break;
    case 1:
    case 2:
    case 4:
    case 5:
      return;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 32), CFSTR("_UIDocumentCarouselView.m"), 399, CFSTR("UIKit internal inconsistency: unhandled item position"));

      break;
  }
}

double __41___UIDocumentCarouselView__performLayout__block_invoke_3(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 4:
      return *(double *)(a1 + 32);
    case 3:
      return 1.0;
    case 2:
      return *(double *)(a1 + 32);
  }
  return *(double *)(a1 + 32) * 0.25;
}

double __41___UIDocumentCarouselView__performLayout__block_invoke_4(uint64_t a1, unint64_t a2)
{
  void *v4;

  if (a2 < 6)
    return dbl_18667DBC8[a2];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("_UIDocumentCarouselView.m"), 430, CFSTR("UIKit internal inconsistency: unhandled item position"));

  return 0.0;
}

double __41___UIDocumentCarouselView__performLayout__block_invoke_5(uint64_t a1, double a2, double a3, double a4, double a5)
{
  if (a3 + a5 * 0.5 > CGRectGetHeight(*(CGRect *)(a1 + 40)) - *(double *)(a1 + 88))
    UIRoundToViewScale(*(void **)(a1 + 32));
  return 0.0;
}

__n128 __47___UIDocumentCarouselView__invalidateItemSizes__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __n128 result;

  if (a3)
  {
    result = *(__n128 *)MEMORY[0x1E0C9D820];
    *(_OWORD *)(a3 + 432) = *MEMORY[0x1E0C9D820];
  }
  return result;
}

uint64_t __62___UIDocumentCarouselView__updatePagingFraction_withTracking___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setValue:", *(double *)(a1 + 40));
}

void __62___UIDocumentCarouselView__updatePagingFraction_withTracking___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_UIDocumentCarouselView _cleanUpAfterAnimation]((uint64_t)WeakRetained);

}

void __57___UIDocumentCarouselView__configureAnimatableProperties__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_UIDocumentCarouselView _performLayout]((uint64_t)WeakRetained);

}

uint64_t __53___UIDocumentCarouselView_setPagingEnabled_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setValue:", *(double *)(a1 + 40));
}

void __53___UIDocumentCarouselView_setPagingEnabled_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_UIDocumentCarouselView _cleanUpAfterAnimation]((uint64_t)WeakRetained);

}

@end
