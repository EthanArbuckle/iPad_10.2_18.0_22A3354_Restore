@implementation PASSimpleICUTransform

void ___PASSimpleICUTransform_block_invoke(uint64_t a1)
{
  uint64_t v2;
  size_t v3;
  unint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;
  void *memptr;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  v3 = 2 * (int)v2;
  v4 = v3 | 1;
  memptr = 0;
  v12 = 0;
  if ((v3 | 1) > 0x200)
  {
    v8 = malloc_type_posix_memalign(&memptr, 8uLL, v3, 0x1000040BDFB0063uLL);
    LOBYTE(v12) = 0;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v9);
    }
    v5 = (char *)memptr;
  }
  else
  {
    v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v5, v3 | 1);
  }
  if (v2 << 32)
  {
    v6 = 0;
    if ((unint64_t)(int)v2 <= 1)
      v7 = 1;
    else
      v7 = (int)v2;
    do
    {
      *(_WORD *)&v5[2 * v6] = objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", v6);
      ++v6;
    }
    while (v7 != v6);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = utrans_openU();
  if (v4 > 0x200)
    free(v5);
}

@end
