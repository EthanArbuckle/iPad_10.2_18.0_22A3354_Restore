@implementation PXTapToRadarDiagnosticCollectionOperation

uint64_t __71___PXTapToRadarDiagnosticCollectionOperation_installCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 18), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

void __67___PXTapToRadarDiagnosticCollectionOperation_initWithName_timeout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_timedOut");

}

@end
