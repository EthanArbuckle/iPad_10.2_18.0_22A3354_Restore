@implementation UIAlertControllerModernTVActionBackgroundView

uint64_t __65___UIAlertControllerModernTVActionBackgroundView_setHighlighted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v2);

  objc_msgSend(*(id *)(a1 + 32), "updateCompositingForHighlighted:", *(unsigned __int8 *)(a1 + 56));
  v4 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "setShouldShowShadow:", *(unsigned __int8 *)(a1 + 56));
}

uint64_t __65___UIAlertControllerModernTVActionBackgroundView_setHighlighted___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
