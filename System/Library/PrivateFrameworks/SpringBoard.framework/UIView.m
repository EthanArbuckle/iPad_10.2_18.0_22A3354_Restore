@implementation UIView

uint64_t __114__UIView_SBSAC2PropertyAnimating___sbsa_deepestLayerAndCALayerRelativeKeyPathForUIKeyPath_caLayerRelativeKeyPath___block_invoke()
{
  return BSEqualObjects();
}

void __99__UIView_SBSAGeometricTypeAnimationDecomposing___independentlyAnimatableMemberKeyPathsForProperty___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("x"), CFSTR("y"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_independentlyAnimatableMemberKeyPathsForProperty____centerMembers;
  _independentlyAnimatableMemberKeyPathsForProperty____centerMembers = v0;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("origin.x"), CFSTR("origin.y"), CFSTR("size.width"), CFSTR("size.height"), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_independentlyAnimatableMemberKeyPathsForProperty____boundsMembers;
  _independentlyAnimatableMemberKeyPathsForProperty____boundsMembers = v2;

}

uint64_t __80__UIView_SBSAC2PropertyAnimating__sbsa_isPropertyActivelyC2AnimatingForKeyPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "_independentlyAnimatableMemberKeyPathsForProperty:", *(_QWORD *)(a1 + 48), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathExtension:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "keyPath");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = BSEqualStrings();

          if ((v14 & 1) != 0)
          {
            v6 = 1;
            goto LABEL_13;
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
    v6 = 0;
LABEL_13:

  }
  return v6;
}

uint64_t __76__UIView_SBSAC2PropertyAnimating__sbsa_presentationModifierValueForKeyPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "keyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BSEqualStrings();

  return v3;
}

uint64_t __76__UIView_SBSAC2PropertyAnimating__sbsa_presentationModifierValueForKeyPath___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "stringByAppendingPathExtension:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = BSEqualStrings();
  return v7;
}

uint64_t __58__UIView_SpringBoardAdditions__sb_firstDescendantOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __78__UIView_SBSystemApertureIDCornerCurve__sb_cornerCurveFloatAnimatableProperty__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  id *v6;
  uint64_t v7;
  BOOL v8;
  id *v9;
  id v10;
  id v11;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "value");
  v5 = v4;
  v6 = (id *)MEMORY[0x1E0CD2A70];
  v7 = SBFEffectiveArtworkSubtype();
  v8 = v7 == 2622 || v7 == 2868;
  v9 = (id *)MEMORY[0x1E0CD2A78];
  if (!v8)
    v9 = v6;
  v10 = *v9;
  if (v5 >= 20.0)
  {
    v11 = (id)*MEMORY[0x1E0CD2A68];

    v10 = v11;
  }
  objc_msgSend(v3, "setCornerCurve:", v10);

  objc_msgSend(v3, "setCornerRadius:", v5);
}

void __78__UIView_SBSystemApertureIDCornerCurve__sb_cornerCurveFloatAnimatableProperty__block_invoke_2(id *a1)
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v2 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "presentationValue");
  v4 = v3;
  if (objc_msgSend(a1[4], "sbsa_isPropertyActivelyC2AnimatingForKeyPath:", CFSTR("bounds")))
  {
    objc_msgSend(WeakRetained, "value");
    objc_msgSend(WeakRetained, "presentationValue");
    if ((BSFloatApproximatelyEqualToFloat() & 1) == 0)
    {
      objc_msgSend(v2, "bounds");
      v6 = v5;
      v8 = v7;
      objc_msgSend(a1[4], "sbsa_presentationModifierValueForKeyPath:", CFSTR("bounds"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "CGRectValue");
        v6 = v11;
        v8 = v12;
      }
      v13 = v8 * 0.5;
      if (v8 * 0.5 >= v4)
        v13 = v4;
      if (v6 * 0.5 >= v13)
        v4 = v13;
      else
        v4 = v6 * 0.5;

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "velocity");
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setPresentationValue:velocity:preferredFrameRateRangeMaximum:forKey:", v14, v16, 120, CFSTR("cornerRadius"));

}

uint64_t __67__UIView_SBPIPAdditions__SBPIP_performWithoutRetargetingAnimation___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "activate");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

uint64_t __91__UIView_SBPIPAdditions__SBPIP_animateUsingDefaultTimingWithOptions_animations_completion___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CD28B0], "activate");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v2 = (void *)MEMORY[0x1E0CD28B0];
  objc_msgSend(*(id *)(a1 + 40), "_currentAnimationDuration");
  objc_msgSend(v2, "setAnimationDuration:");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

void __65__UIView_SBSnapshoting__sb_generateSnapshotContentsSynchronously__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __68__UIView_SBSnapshoting___generateSnapshotOnQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  SBSnapshotSlotIdWrapper *v3;
  uint64_t v4;
  id object;

  v2 = objc_msgSend(*(id *)(a1 + 32), "createImageSlot:hasAlpha:", 1, *(double *)(a1 + 56), *(double *)(a1 + 64));
  CGRectGetMinX(*(CGRect *)(a1 + 72));
  CGRectGetMinY(*(CGRect *)(a1 + 72));
  CARenderServerCaptureLayerWithTransform();
  objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:", v2);
  object = (id)objc_claimAutoreleasedReturnValue();
  if (object)
  {
    v3 = -[SBSnapshotSlotIdWrapper initWithContext:slotId:]([SBSnapshotSlotIdWrapper alloc], "initWithContext:slotId:", *(_QWORD *)(a1 + 32), v2);
    objc_setAssociatedObject(object, "com.apple.SpringBoard.SBAppViewSnapshotSlotIdWrapper", v3, (void *)0x301);

  }
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, id, double))(v4 + 16))(v4, object, *(double *)(a1 + 104));

}

uint64_t __68__UIView_SBSnapshoting___generateSnapshotOnQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
