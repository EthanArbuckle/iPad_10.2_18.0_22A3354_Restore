@implementation AccessPreflightContext

uint64_t ___AccessPreflightContext_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (!(_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "decrementValidReferenceCount");
  __break(1u);
  return result;
}

@end
