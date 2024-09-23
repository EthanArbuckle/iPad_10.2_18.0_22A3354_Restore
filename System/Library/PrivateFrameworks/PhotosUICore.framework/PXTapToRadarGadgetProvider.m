@implementation PXTapToRadarGadgetProvider

- (unint64_t)estimatedNumberOfGadgets
{
  return 1;
}

- (void)generateGadgets
{
  PXTapToRadarGadget *v3;
  PXTapToRadarGadget *v4;
  _QWORD v5[4];
  PXTapToRadarGadget *v6;

  v3 = objc_alloc_init(PXTapToRadarGadget);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PXTapToRadarGadgetProvider_generateGadgets__block_invoke;
  v5[3] = &unk_1E5145360;
  v6 = v3;
  v4 = v3;
  -[PXGadgetProvider performChanges:](self, "performChanges:", v5);

}

void __45__PXTapToRadarGadgetProvider_generateGadgets__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGadgets:", v4, v5, v6);

}

@end
