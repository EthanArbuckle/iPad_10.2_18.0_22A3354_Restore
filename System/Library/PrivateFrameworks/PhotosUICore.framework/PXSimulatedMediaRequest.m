@implementation PXSimulatedMediaRequest

uint64_t __56___PXSimulatedMediaRequest_initWithWrappedMediaRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleOriginalResult:info:", a2, a3);
}

void __75___PXSimulatedMediaRequest_initWithOriginalOptions_simulatedResultHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, double a5)
{
  id *v8;
  id v9;
  id v10;
  id WeakRetained;

  v8 = (id *)(a1 + 32);
  v9 = a4;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend(WeakRetained, "handleOriginalProgress:error:stop:info:", v10, a3, v9, a5);

}

@end
