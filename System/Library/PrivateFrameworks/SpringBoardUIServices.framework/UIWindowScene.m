@implementation UIWindowScene

void __105__UIWindowScene_SBSUIScreenSharingOverlaySceneSpecification__setSBSUI_preferredSystemRootLayerTransform___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  void *v5;
  void *v6;
  _OWORD v7[3];

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("SBSUIScreenSharingOverlaySceneSpecification.m"), 61, CFSTR("*** setSBSUI_preferredSystemRootLayerTransform: is unavailable for this window scene. If this message surprises you, contact your friendly SBSUI engineer. ***"));

  }
  v4 = *(_OWORD *)(a1 + 64);
  v7[0] = *(_OWORD *)(a1 + 48);
  v7[1] = v4;
  v7[2] = *(_OWORD *)(a1 + 80);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGAffineTransform:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreferredSystemRootTransform:", v5);

}

void __73__UIWindowScene_SBSUIHearingTestModeAdditions__SBSUI_setHearingTestMode___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setHearingTestMode:", *(_QWORD *)(a1 + 32));

}

@end
