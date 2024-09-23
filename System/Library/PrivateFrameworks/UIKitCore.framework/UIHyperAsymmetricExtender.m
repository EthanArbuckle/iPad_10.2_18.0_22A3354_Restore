@implementation UIHyperAsymmetricExtender

uint64_t __44___UIHyperAsymmetricExtender_initWithCoder___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __44___UIHyperAsymmetricExtender_initWithCoder___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __43___UIHyperAsymmetricExtender_copyWithZone___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_extentBeyondMinimum");
  objc_msgSend(*(id *)(a1 + 32), "_dimensions");
  return cblas_dcopy_NEWLAPACK();
}

uint64_t __43___UIHyperAsymmetricExtender_copyWithZone___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_extentBeyondMaximum");
  objc_msgSend(*(id *)(a1 + 32), "_dimensions");
  return cblas_dcopy_NEWLAPACK();
}

@end
