@implementation UIWindowHostingScenePerformUpdateWithEffectiveSettings

void ___UIWindowHostingScenePerformUpdateWithEffectiveSettings_block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = ___UIWindowHostingScenePerformUpdateWithEffectiveSettings_block_invoke_2;
  v2[3] = &unk_1E16B1B50;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v2);

}

void ___UIWindowHostingScenePerformUpdateWithEffectiveSettings_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v2 = objc_msgSend(*(id *)(a1 + 40), "interfaceOrientation");
  objc_msgSend(*(id *)(a1 + 32), "_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setInterfaceOrientation:", v2);

  objc_msgSend(*(id *)(a1 + 32), "_updateSceneTraitsAndPushTraitsToScreen:callParentWillTransitionToTraitCollection:", 1, 1);
  objc_msgSend(*(id *)(a1 + 32), "_computeMetrics:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_traitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___UIWindowHostingScenePerformUpdateWithEffectiveSettings_block_invoke_3;
  v6[3] = &unk_1E16B29D0;
  v7 = v4;
  objc_msgSend(v7, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:asCopy:stopped:withBlock:", 1, 1, 0, 0, v6);

}

uint64_t ___UIWindowHostingScenePerformUpdateWithEffectiveSettings_block_invoke_3(uint64_t result, void *a2)
{
  if (!*(_QWORD *)(*(_QWORD *)(result + 32) + 160))
    return objc_msgSend(a2, "layoutIfNeeded");
  return result;
}

@end
