@implementation SBDisplayItemFixedAspectGrid

void __64___SBDisplayItemFixedAspectGrid__buildFixedGridWithScreenScale___block_invoke(uint64_t a1, int a2, float64_t a3, float64x2_t a4)
{
  float64x2_t v4;
  float64x2_t v10;
  void *v11;
  id v12;

  a4.f64[1] = a3;
  if (a2)
  {
    v4 = vaddq_f64(a4, a4);
    __asm { FMOV            V1.2D, #0.5 }
    v10 = vrndmq_f64(vmulq_f64(v4, _Q1));
    a4 = vmulq_f64(vaddq_f64(v10, v10), _Q1);
  }
  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", a4.f64[1]);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

}

uint64_t __64___SBDisplayItemFixedAspectGrid__buildFixedGridWithScreenScale___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a3;
  objc_msgSend(a2, "CGSizeValue");
  objc_msgSend(v4, "CGSizeValue");

  return BSCompareFloats();
}

@end
