@implementation UIStoryboardUnwindChain

void __44___UIStoryboardUnwindChain_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;
  const __CFString *v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v5 = a2;
  if (v4)
    v6 = CFSTR(", ");
  else
    v6 = CFSTR(" ");
  objc_msgSend(v3, "appendString:", v6);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

@end
