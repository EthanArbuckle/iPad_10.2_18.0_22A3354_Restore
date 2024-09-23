@implementation ZN3lsl9Allocator16defaultAllocatorEv

_QWORD *___ZN3lsl9Allocator16defaultAllocatorEv_block_invoke()
{
  _QWORD *result;

  result = malloc_type_malloc(0x10uLL, 0x2004026850B6CuLL);
  *result = &lsl::Allocator::createAllocator(void)::memoryManager;
  result[1] = 0;
  lsl::Allocator::defaultAllocator(void)::allocator = (uint64_t)result;
  return result;
}

@end
