@implementation SBActiveRemoteTransientOverlayViewProviderAdapter

void __118___SBActiveRemoteTransientOverlayViewProviderAdapter_presentRemoteTransientOverlayViewController_presentationRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = (uint64_t)(*MEMORY[0x1E0CEBBD0] + 5.0);
  v3 = a2;
  objc_msgSend(v3, "setLevel:", v2);
  objc_msgSend(v3, "setFillsDisplayBounds:", 1);
  objc_msgSend(v3, "setLayoutRole:", 4);

}

@end
