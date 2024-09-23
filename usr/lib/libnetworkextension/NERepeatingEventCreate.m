@implementation NERepeatingEventCreate

uint64_t __NERepeatingEventCreate_block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint64_t *context;
  uint64_t *v3;
  int v4;
  int v5;
  BOOL v6;
  uint64_t result;

  v1 = *(NSObject **)(a1 + 32);
  context = (uint64_t *)dispatch_get_context(v1);
  v3 = context;
  v5 = *((_DWORD *)context + 2);
  v4 = *((_DWORD *)context + 3);
  *((_DWORD *)context + 3) = v4 + 1;
  if (v5)
    v6 = v4 < v5;
  else
    v6 = 1;
  if (v6)
  {
    result = context[2];
    if (!result)
      return result;
    return (*(uint64_t (**)(void))(result + 16))();
  }
  dispatch_source_cancel(v1);
  result = v3[3];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __NERepeatingEventCreate_block_invoke_2(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 32);
  if (v1)
    dispatch_release(v1);
}

@end
