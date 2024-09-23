@implementation VSExportCompressionToContext

uint64_t __VSExportCompressionToContext_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "transformedValue:", a2);
}

uint64_t __VSExportCompressionToContext_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "reverseTransformedValue:", a2);
}

@end
