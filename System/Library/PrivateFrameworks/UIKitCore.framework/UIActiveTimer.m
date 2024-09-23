@implementation UIActiveTimer

uint64_t __49___UIActiveTimer_initWithDuration_updateHandler___block_invoke(uint64_t a1)
{
  CFTimeInterval v2;
  uint64_t result;

  v2 = (CACurrentMediaTime() - *(double *)(a1 + 48)) / *(double *)(a1 + 56);
  result = (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 40) + 16))(v2);
  if (v2 >= 1.0)
    return objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return result;
}

uint64_t __49___UIActiveTimer_initWithDuration_updateHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(1.0);
}

@end
