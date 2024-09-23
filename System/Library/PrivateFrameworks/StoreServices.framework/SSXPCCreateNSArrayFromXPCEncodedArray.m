@implementation SSXPCCreateNSArrayFromXPCEncodedArray

uint64_t __SSXPCCreateNSArrayFromXPCEncodedArray_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithXPCEncoding:", a3);
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

  }
  return 1;
}

@end
