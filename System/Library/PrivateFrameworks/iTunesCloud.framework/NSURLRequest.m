@implementation NSURLRequest

void __56__NSURLRequest_ICAdditions__ic_valueForHTTPHeaderField___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if (!objc_msgSend(*(id *)(a1 + 32), "caseInsensitiveCompare:", a2))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

@end
