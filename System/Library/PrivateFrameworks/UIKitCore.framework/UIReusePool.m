@implementation UIReusePool

uint64_t __26___UIReusePool_addObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
}

void __30___UIReusePool_reusableObject__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "anyObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:");
}

void __26___UIReusePool_initialize__block_invoke()
{
  atomic_store(0, byte_1ECD75E09);
  __purgeReusePools();
}

void __26___UIReusePool_initialize__block_invoke_2()
{
  atomic_store(1u, byte_1ECD75E09);
}

uint64_t __25___UIReusePool_drainPool__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
}

@end
