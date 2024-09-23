@implementation UIScrollView

uint64_t __90__UIScrollView_PhotosUI__pu_ppt_performPageSwipeTest_iterations_numberOfPages_scrollAxis___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pu_beginPageSwipeTest:", *(_QWORD *)(a1 + 40));
}

uint64_t __90__UIScrollView_PhotosUI__pu_ppt_performPageSwipeTest_iterations_numberOfPages_scrollAxis___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pu_incrementForPageSwipeTest:dt:stop:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __90__UIScrollView_PhotosUI__pu_ppt_performPageSwipeTest_iterations_numberOfPages_scrollAxis___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pu_endPageSwipeTest:", *(_QWORD *)(a1 + 40));
}

uint64_t __77__UIScrollView_PhotosUI__pu_ppt_scrollToContentOffset_withCompletionHandler___block_invoke_2(uint64_t a1, _BYTE *a2, double a3)
{
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "contentOffset");
  v7 = v6;
  v8 = (*(double (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v9 = (*(double (**)(double, double, double))(*(_QWORD *)(a1 + 40) + 16))(v7, *(double *)(a1 + 56) * a3, *(double *)(a1 + 72));
  PXPointRoundToPixel();
  objc_msgSend(*(id *)(a1 + 32), "contentOffset");
  PXPointRoundToPixel();
  result = PXPointApproximatelyEqualToPoint();
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setContentOffset:animated:", 0, v8, v9);
  *a2 = 1;
  return result;
}

double __77__UIScrollView_PhotosUI__pu_ppt_scrollToContentOffset_withCompletionHandler___block_invoke(double a1, double a2, double a3)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  PXFloatSign();
  v7 = v6;
  PXFloatSign();
  if (v7 == v8)
  {
    a1 = a1 + a2;
    PXFloatSign();
    v10 = v9;
    PXFloatSign();
    if (v10 != v11)
      return a3;
  }
  return a1;
}

@end
