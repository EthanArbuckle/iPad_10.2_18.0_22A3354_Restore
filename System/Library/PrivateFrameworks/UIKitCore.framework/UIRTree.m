@implementation UIRTree

void __23___UIRTree_description__block_invoke(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  CGRect v17;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(_QWORD *)(v12 + 24);
  *(_QWORD *)(v12 + 24) = v13 + 1;
  if (v13)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendString:", CFSTR(";"));
  v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17.origin.x = a3;
  v17.origin.y = a4;
  v17.size.width = a5;
  v17.size.height = a6;
  NSStringFromCGRect(v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendFormat:", CFSTR("%@:%@"), v16, v15);

}

uint64_t __37___UIRTree_enumerateFramesWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, __n128 *a4)
{
  return (*(uint64_t (**)(__n128, double, __n128, double))(*(_QWORD *)(a1 + 32) + 16))(*a4, a4->n128_f64[1], a4[1], a4[1].n128_f64[1]);
}

uint64_t __27___UIRTree__frameForIndex___block_invoke(uint64_t result, uint64_t a2, double a3, double a4, double a5, double a6)
{
  double *v6;

  if (*(_QWORD *)(result + 40) == a2)
  {
    v6 = *(double **)(*(_QWORD *)(result + 32) + 8);
    v6[6] = a3;
    v6[7] = a4;
    v6[8] = a5;
    v6[9] = a6;
  }
  return result;
}

@end
