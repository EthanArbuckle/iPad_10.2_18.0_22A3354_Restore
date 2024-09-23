@implementation UIFluidSliderInteraction

void __59___UIFluidSliderInteraction_initWithConfiguration_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_issueUpdate");

}

uint64_t __46___UIFluidSliderInteraction_setConfiguration___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "_normalizedTrackSize");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "_trackWidth");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_normalizedTrackSize");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "_trackLength");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:", v6);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "value");
  return objc_msgSend(v8, "_targetNewValue:");
}

uint64_t __38___UIFluidSliderInteraction_setValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_targetNewValue:", *(double *)(a1 + 40));
}

void __45___UIFluidSliderInteraction__targetNewValue___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_animatedValue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:", v1);

}

void __45___UIFluidSliderInteraction__targetNewScale___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_trackScale");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:", v1);

}

void __59___UIFluidSliderInteraction__cancelDriversExcludingDriver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_drivers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if (v7 != *(void **)(a1 + 40))
          objc_msgSend(v7, "cancel");
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __49___UIFluidSliderInteraction__animate_withSpring___block_invoke(uint64_t a1)
{
  id v1;
  CAFrameRateRange v2;

  v1 = *(id *)(a1 + 32);
  v2 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048627, v1, *(double *)&v2.minimum, *(double *)&v2.maximum, *(double *)&v2.preferred);

}

@end
