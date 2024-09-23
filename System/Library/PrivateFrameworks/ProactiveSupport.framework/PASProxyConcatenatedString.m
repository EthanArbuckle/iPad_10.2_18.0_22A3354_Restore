@implementation PASProxyConcatenatedString

uint64_t __54___PASProxyConcatenatedString__locationOfStringIndex___block_invoke(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3 >= *a3)
    return v3 >= a3[1];
  else
    return 0xFFFFFFFFLL;
}

id __64___PASProxyConcatenatedString_concatenatedStringWithComponents___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
    v3 = (void *)objc_msgSend(v2, "copy");
  else
    v3 = 0;

  return v3;
}

@end
