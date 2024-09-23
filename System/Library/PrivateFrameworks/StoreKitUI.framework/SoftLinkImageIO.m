@implementation SoftLinkImageIO

void *__SoftLinkImageIO_block_invoke()
{
  void *v0;
  void *v1;
  void *result;

  v0 = (void *)SKUIImageIOFramework();
  if (!v0)
    __SoftLinkImageIO_block_invoke_cold_1();
  v1 = v0;
  weak_kCGImagePropertyEncoder = *(_QWORD *)SKUIWeakLinkedSymbolForString("kCGImagePropertyEncoder", v0);
  if (!weak_kCGImagePropertyEncoder)
    __SoftLinkImageIO_block_invoke_cold_2();
  weak_kCGImagePropertyASTCBlockSize = *(_QWORD *)SKUIWeakLinkedSymbolForString("kCGImagePropertyASTCBlockSize", v1);
  if (!weak_kCGImagePropertyASTCBlockSize)
    __SoftLinkImageIO_block_invoke_cold_3();
  weak_kCGImagePropertyASTCEncoder = *(_QWORD *)SKUIWeakLinkedSymbolForString("kCGImagePropertyASTCEncoder", v1);
  if (!weak_kCGImagePropertyASTCEncoder)
    __SoftLinkImageIO_block_invoke_cold_4();
  weak_CGImageDestinationCreateWithData = SKUIWeakLinkedSymbolForString("CGImageDestinationCreateWithData", v1);
  if (!weak_CGImageDestinationCreateWithData)
    __SoftLinkImageIO_block_invoke_cold_5();
  weak_CGImageDestinationAddImage = SKUIWeakLinkedSymbolForString("CGImageDestinationAddImage", v1);
  if (!weak_CGImageDestinationAddImage)
    __SoftLinkImageIO_block_invoke_cold_6();
  result = SKUIWeakLinkedSymbolForString("CGImageDestinationFinalize", v1);
  weak_CGImageDestinationFinalize = result;
  if (!result)
    __SoftLinkImageIO_block_invoke_cold_7();
  return result;
}

void __SoftLinkImageIO_block_invoke_cold_1()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SKUIGraphics.m", 28, "imageIOFramework != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_2()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SKUIGraphics.m", 31, "weak_kCGImagePropertyEncoder != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_3()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SKUIGraphics.m", 34, "weak_kCGImagePropertyASTCBlockSize != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_4()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SKUIGraphics.m", 37, "weak_kCGImagePropertyASTCEncoder != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_5()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SKUIGraphics.m", 40, "weak_CGImageDestinationCreateWithData != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_6()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SKUIGraphics.m", 43, "weak_CGImageDestinationAddImage != NULL");
}

void __SoftLinkImageIO_block_invoke_cold_7()
{
  __assert_rtn("SoftLinkImageIO_block_invoke", "SKUIGraphics.m", 46, "weak_CGImageDestinationFinalize != NULL");
}

@end
