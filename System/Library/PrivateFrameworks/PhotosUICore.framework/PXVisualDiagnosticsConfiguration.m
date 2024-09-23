@implementation PXVisualDiagnosticsConfiguration

void __91__PXVisualDiagnosticsConfiguration_Diagnostics__collectTapToRadarDiagnosticsIntoContainer___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "addAttachment:", a2);
  objc_msgSend(*(id *)(a1 + 40), "endWithSuccess:error:", a2 != 0, v6);

}

@end
