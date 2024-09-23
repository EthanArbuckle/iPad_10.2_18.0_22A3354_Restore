@implementation UIActionSlider

uint64_t __37___UIActionSlider_openTrackAnimated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTrackWidthProportion:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __37___UIActionSlider_openTrackAnimated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTrackWidthProportion:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __37___UIActionSlider_openTrackAnimated___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAnimating:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCachedTrackMaskWidth:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

uint64_t __37___UIActionSlider_openTrackAnimated___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showTrackLabel");
}

uint64_t __38___UIActionSlider_closeTrackAnimated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTrackWidthProportion:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __38___UIActionSlider_closeTrackAnimated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAnimating:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCachedTrackMaskWidth:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

uint64_t __34___UIActionSlider__showTrackLabel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setAlpha:", 1.0);
}

uint64_t __35___UIActionSlider__hideTrackLabel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setAlpha:", 0.0);
}

void __35___UIActionSlider__slideCompleted___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "setKnobPosition:", v2);
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "actionSlider:didUpdateSlideWithValue:", *(_QWORD *)(a1 + 32), v2);

}

uint64_t __35___UIActionSlider__slideCompleted___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAnimating:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCachedTrackMaskWidth:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

uint64_t __35___UIActionSlider__slideCompleted___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showTrackLabel");
}

@end
