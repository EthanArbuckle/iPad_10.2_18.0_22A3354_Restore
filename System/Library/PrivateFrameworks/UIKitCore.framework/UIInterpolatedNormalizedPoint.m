@implementation UIInterpolatedNormalizedPoint

+ (id)epsilonCompatibleWithVector:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__UIInterpolatedNormalizedPoint_epsilonCompatibleWithVector___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD82328 != -1)
    dispatch_once(&qword_1ECD82328, block);
  return (id)_MergedGlobals_1311;
}

void __61__UIInterpolatedNormalizedPoint_epsilonCompatibleWithVector___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "valueWithCGPoint:", 0.001, 0.001);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MergedGlobals_1311;
  _MergedGlobals_1311 = v1;

}

@end
