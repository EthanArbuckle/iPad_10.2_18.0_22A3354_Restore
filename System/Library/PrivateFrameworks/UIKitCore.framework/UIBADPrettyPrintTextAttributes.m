@implementation UIBADPrettyPrintTextAttributes

void ___UIBADPrettyPrintTextAttributes_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("), ("));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@=%@"), v6, v5);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

@end
