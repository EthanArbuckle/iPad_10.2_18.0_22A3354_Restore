@implementation UIViewController

void __41__UIViewController_Metrics___rewriteOnce__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  objc_msgSend(v5, "recordViewDidAppearEvent");
  (*(void (**)(id, _QWORD, uint64_t))(a1 + 32))(v5, *(_QWORD *)(a1 + 40), a3);

}

void __41__UIViewController_Metrics___rewriteOnce__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a2;
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "setViewWillAppearTime:");
  (*(void (**)(id, _QWORD, uint64_t))(a1 + 32))(v6, *(_QWORD *)(a1 + 40), a3);

}

uint64_t __53__UIViewController_Metrics__swizzleMethodsForMetrics__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rewriteOnce");
}

IMP __41__UIViewController_Metrics___rewriteOnce__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  IMP v4;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__UIViewController_Metrics___rewriteOnce__block_invoke_4;
  v6[3] = &__block_descriptor_48_e29_v20__0__UIViewController_8B16l;
  v2 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v2;
  v3 = _Block_copy(v6);
  v4 = imp_implementationWithBlock(v3);

  return v4;
}

IMP __41__UIViewController_Metrics___rewriteOnce__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  IMP v4;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__UIViewController_Metrics___rewriteOnce__block_invoke_2;
  v6[3] = &__block_descriptor_48_e29_v20__0__UIViewController_8B16l;
  v2 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v2;
  v3 = _Block_copy(v6);
  v4 = imp_implementationWithBlock(v3);

  return v4;
}

@end
