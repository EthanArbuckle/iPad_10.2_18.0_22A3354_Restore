@implementation UIAlertControllerTVBackgroundView

uint64_t __53___UIAlertControllerTVBackgroundView_setHighlighted___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setShouldShowShadow:", *(unsigned __int8 *)(a1 + 48));
}

uint64_t __53___UIAlertControllerTVBackgroundView_setHighlighted___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49___UIAlertControllerTVBackgroundView_setPressed___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", *(double *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", *(double *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 427))
  {
    objc_msgSend(*(id *)(v3 + 432), "setShadowVerticalOffset:", *(double *)(a1 + 64));
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setShadowRadius:", *(double *)(a1 + 72));
  }
  return result;
}

uint64_t __49___UIAlertControllerTVBackgroundView_setPressed___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
