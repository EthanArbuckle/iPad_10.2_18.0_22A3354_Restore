@implementation UIStatusBarBatteryView

uint64_t __44___UIStatusBarBatteryView__batteryFillColor__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAccessibilityContrast:", *(_QWORD *)(a1 + 32));
}

void __44___UIStatusBarBatteryView__batteryFillColor__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setUserInterfaceStyle:", v3);
  objc_msgSend(v4, "setAccessibilityContrast:", *(_QWORD *)(a1 + 40));

}

void __44___UIStatusBarBatteryView__batteryFillColor__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setUserInterfaceStyle:", v3);
  objc_msgSend(v4, "setAccessibilityContrast:", *(_QWORD *)(a1 + 40));

}

void __43___UIStatusBarBatteryView__updateFillColor__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  int v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  char v12;

  objc_msgSend(*(id *)(a1 + 32), "_updateBatteryFillColor");
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[419])
  {
    objc_msgSend(v2, "_batteryTextColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(a1 + 32), "_batteryTextIsCutout");
    if (+[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504);
      +[UIView _currentAnimationDuration](UIView, "_currentAnimationDuration");
      v7 = v6;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __43___UIStatusBarBatteryView__updateFillColor__block_invoke_2;
      v10[3] = &unk_1E16B4008;
      v10[4] = *(_QWORD *)(a1 + 32);
      v11 = v3;
      v12 = v4;
      +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v5, 5242880, v10, 0, v7);

    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setTextColor:", v3);
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C50]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCompositingFilter:", v8);

      if (v4)
    }

  }
}

void __43___UIStatusBarBatteryView__updateFillColor__block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setTextColor:", *(_QWORD *)(a1 + 40));
  v2 = *(unsigned __int8 *)(a1 + 48);
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C50]);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompositingFilter:", v4);

  if (v2)
}

uint64_t __38___UIStatusBarBatteryView__updateBolt__block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  double v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  double v14;
  _OWORD v16[8];
  _OWORD v17[8];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 544);
  v3 = *(_OWORD *)(a1 + 120);
  v17[4] = *(_OWORD *)(a1 + 104);
  v17[5] = v3;
  v4 = *(_OWORD *)(a1 + 152);
  v17[6] = *(_OWORD *)(a1 + 136);
  v17[7] = v4;
  v5 = *(_OWORD *)(a1 + 56);
  v17[0] = *(_OWORD *)(a1 + 40);
  v17[1] = v5;
  v6 = *(_OWORD *)(a1 + 88);
  v17[2] = *(_OWORD *)(a1 + 72);
  v17[3] = v6;
  objc_msgSend(v2, "setTransform:", v17);
  LODWORD(v7) = 1.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "setOpacity:", v7);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 536);
  v9 = *(_OWORD *)(a1 + 120);
  v16[4] = *(_OWORD *)(a1 + 104);
  v16[5] = v9;
  v10 = *(_OWORD *)(a1 + 152);
  v16[6] = *(_OWORD *)(a1 + 136);
  v16[7] = v10;
  v11 = *(_OWORD *)(a1 + 56);
  v16[0] = *(_OWORD *)(a1 + 40);
  v16[1] = v11;
  v12 = *(_OWORD *)(a1 + 88);
  v16[2] = *(_OWORD *)(a1 + 72);
  v16[3] = v12;
  objc_msgSend(v8, "setTransform:", v16);
  v13 = *(_QWORD *)(a1 + 32);
  LODWORD(v14) = 0;
  if (!*(_BYTE *)(v13 + 419))
    *(float *)&v14 = 1.0;
  objc_msgSend(*(id *)(v13 + 536), "setOpacity:", v14);
  return objc_msgSend(*(id *)(a1 + 32), "_unflipBoltIfNecessary");
}

uint64_t __38___UIStatusBarBatteryView__updateBolt__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDidFinishAnimatingBoltToVisible:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __38___UIStatusBarBatteryView__updateBolt__block_invoke_3(uint64_t a1)
{
  float v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "opacity");
  if (v2 == 0.0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "removeFromSuperlayer");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setMask:", 0);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDidFinishAnimatingBoltToVisible:", *(unsigned __int8 *)(a1 + 40));
}

id __48___UIStatusBarBatteryView__updatePercentageFont__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v14 = *(_QWORD *)off_1E167DC10;
  v2 = *(_QWORD *)off_1E167DC48;
  v13[0] = *(_QWORD *)off_1E167DC38;
  v3 = *(_QWORD *)off_1E167DC80;
  v12[0] = v2;
  v12[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)off_1E167DC50);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A830, "fontDescriptorWithFontAttributes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 48) && *(_QWORD *)(v8 + 472) || *(double *)(v8 + 464) >= 0.995)
  {
    objc_msgSend(v7, "fontDescriptorWithSymbolicTraits:", 66);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v7, *(double *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __44___UIStatusBarBatteryView__updatePercentage__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setAlpha:", 1.0);
}

uint64_t __44___UIStatusBarBatteryView__updatePercentage__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setAlpha:", 0.0);
}

uint64_t __44___UIStatusBarBatteryView_setChargePercent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBolt");
}

uint64_t __44___UIStatusBarBatteryView_setChargePercent___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLightningBoltAndPercentagePosition");
}

uint64_t __44___UIStatusBarBatteryView_setChargingState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLightningBoltAndPercentagePosition");
}

uint64_t __46___UIStatusBarBatteryView_setShowsPercentage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLightningBoltAndPercentagePosition");
}

@end
