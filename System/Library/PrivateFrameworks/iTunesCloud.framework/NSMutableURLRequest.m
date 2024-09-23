@implementation NSMutableURLRequest

void __57__NSMutableURLRequest_ICAdditions__ic_appendHTTPCookies___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  if (objc_msgSend(v5, "length"))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("; "));
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@=%@"), v7, v6);

  objc_msgSend(*(id *)(a1 + 32), "appendString:", v8);
}

@end
