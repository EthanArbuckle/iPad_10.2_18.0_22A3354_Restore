@implementation UIFluidSliderDiscreteButtonDriver

void __58___UIFluidSliderDiscreteButtonDriver__handleButton_state___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_pressedButton"))
  {
    objc_msgSend(WeakRetained, "_incrementValue");
    objc_msgSend(WeakRetained, "set_isRepeating:", 1);
  }

}

void __58___UIFluidSliderDiscreteButtonDriver__handleButton_state___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_releaseCurrentlyPressedButton");

}

uint64_t __60___UIFluidSliderDiscreteButtonDriver__issueUpdateWithValue___block_invoke(uint64_t a1)
{
  _QWORD v2[5];
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  CAFrameRateRange v6;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __60___UIFluidSliderDiscreteButtonDriver__issueUpdateWithValue___block_invoke_2;
  v2[3] = &unk_1E16E0798;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 40);
  v4 = *(_OWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 72);
  v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048627, v2, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

void __60___UIFluidSliderDiscreteButtonDriver__issueUpdateWithValue___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  _OWORD v5[2];
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "drivable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v4;
  v6 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v2, "fluidSliderDriver:didGenerateUpdate:", v3, v5);

}

@end
