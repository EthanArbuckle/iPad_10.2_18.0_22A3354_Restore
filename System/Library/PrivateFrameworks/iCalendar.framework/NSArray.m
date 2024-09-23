@implementation NSArray

uint64_t __62__NSArray_ICSWriter___ICSStringWithOptions_appendingToString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a2;
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(v4, "compare:", v5);
  }
  else
  {
    NSLog(CFSTR("Attempted to sort details when checksumming that didn't respond to compare:, this is unexpected: %@"), v4);
    v7 = -1;
    if (v4 >= v5)
      v7 = 1;
    if (v4 == v5)
      v6 = 0;
    else
      v6 = v7;
  }

  return v6;
}

uint64_t __36__NSArray_VCSUtilities__VCS_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
