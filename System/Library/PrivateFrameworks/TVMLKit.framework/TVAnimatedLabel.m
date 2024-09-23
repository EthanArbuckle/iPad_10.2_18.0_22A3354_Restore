@implementation TVAnimatedLabel

void __41___TVAnimatedLabel_setAttributedStrings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = objc_msgSend(*(id *)(a1 + 32), "effectiveUserInterfaceLayoutDirection") == 1;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __41___TVAnimatedLabel_setAttributedStrings___block_invoke_2;
    v6[3] = &unk_24EB854F8;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    objc_msgSend(v4, "tv_resolveWithTextLayoutDirection:layoutObserver:", v5, v6);
    objc_destroyWeak(&v7);

  }
}

void __41___TVAnimatedLabel_setAttributedStrings___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsDisplay");

}

void __33___TVAnimatedLabel_setAnimating___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && *((_BYTE *)WeakRetained + 947))
  {
    v4 = (void *)TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG))
      __33___TVAnimatedLabel_setAnimating___block_invoke_cold_1(a1, v4);
    objc_msgSend(v3, "setNeedsDisplay");
  }

}

void __58___TVAnimatedLabel_stopAnimatingWithoutResetWithDuration___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && WeakRetained[948])
  {
    v4 = (void *)TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG))
      __58___TVAnimatedLabel_stopAnimatingWithoutResetWithDuration___block_invoke_cold_1(a1, v4);
    v3[948] = 0;
    objc_msgSend(v3, "stopAnimating");
  }

}

void __51___TVAnimatedLabel_stopAndResetScrollWithDuration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "currentMarqueeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = *(double *)(a1 + 40);
  v13 = 0.0;
  if (v5 > v12 / *(double *)(a1 + 56) - v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "replicationPadding");
    v13 = (v12 + v14) / *(double *)(a1 + 56);
  }
  objc_msgSend(*(id *)(a1 + 32), "currentMarqueeView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContentsRect:", v13, v7, v9, v11);

}

uint64_t __51___TVAnimatedLabel_stopAndResetScrollWithDuration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAnimating:", 0);
}

uint64_t __51___TVAnimatedLabel_stopAndResetScrollWithDuration___block_invoke_29(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  double v6;

  v2 = (void *)TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG))
    __51___TVAnimatedLabel_stopAndResetScrollWithDuration___block_invoke_29_cold_1(a1, v2);
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", 0.2);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 952);
  v4 = *(double *)(a1 + 56) + 20.0;
  objc_msgSend(v3, "bounds");
  objc_msgSend(v3, "setBounds:", 0.0, 0.0, v4);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 952);
  v6 = (*(double *)(a1 + 56) + -20.0) * 0.5;
  objc_msgSend(v5, "position");
  objc_msgSend(v5, "setPosition:", v6);
  return objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

void __35___TVAnimatedLabel_drawTextInRect___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x24BDF6AC8];
  +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("UILabelMarqueeRightFade.png"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)drawTextInRect____maskImage;
  drawTextInRect____maskImage = v1;

}

uint64_t __49___TVAnimatedLabel__prepareNextMarqueeWithDelay___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

void __49___TVAnimatedLabel__prepareNextMarqueeWithDelay___block_invoke_2(id *a1, int a2)
{
  _BYTE *WeakRetained;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  _BYTE *v9;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    WeakRetained[944] = 0;
    v9 = WeakRetained;
    v5 = WeakRetained;
    objc_sync_enter(v5);
    objc_storeWeak(v5 + 128, a1[4]);
    objc_storeWeak(v5 + 129, a1[5]);
    objc_sync_exit(v5);

    objc_msgSend(v5, "nextMarqueeView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.0);

    objc_msgSend(v5, "nextMarqueeView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

    objc_msgSend(a1[6], "currentMarqueeView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bringSubviewToFront:", v8);

    WeakRetained = v9;
    if (a2)
    {
      objc_msgSend(a1[6], "_startMarqueeIfNeeded");
      WeakRetained = v9;
    }
  }

}

uint64_t __41___TVAnimatedLabel__startMarqueeIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;
  _BYTE *v4;
  uint64_t v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 946) = 0;
  result = objc_msgSend(*(id *)(a1 + 32), "isAnimating");
  if ((_DWORD)result)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "_shouldCycle");
    v4 = *(_BYTE **)(a1 + 32);
    if (v3)
    {
      v5 = 40;
      if (!v4[945])
        v5 = 48;
      return objc_msgSend(v4, "_prepareNextMarqueeWithDelay:", *(double *)(a1 + v5));
    }
    else
    {
      result = objc_msgSend(v4, "isPaused");
      if ((result & 1) == 0)
        return objc_msgSend(*(id *)(a1 + 32), "_startMarqueeIfNeeded");
    }
  }
  return result;
}

void __41___TVAnimatedLabel__startMarqueeIfNeeded__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x24BDF6AC8];
  +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("UILabelMarqueeMask.png"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_startMarqueeIfNeeded___maskImage;
  _startMarqueeIfNeeded___maskImage = v1;

}

void __33___TVAnimatedLabel_setAnimating___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_2_0(), "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_222D98000, v4, v5, "AL(%@): starting timeout end", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

void __58___TVAnimatedLabel_stopAnimatingWithoutResetWithDuration___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_2_0(), "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_222D98000, v4, v5, "AL(%@): stopping timeout end", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

void __51___TVAnimatedLabel_stopAndResetScrollWithDuration___block_invoke_29_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_2_0(), "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_222D98000, v4, v5, "AL(%@): stop-and-reset timeout end", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

@end
