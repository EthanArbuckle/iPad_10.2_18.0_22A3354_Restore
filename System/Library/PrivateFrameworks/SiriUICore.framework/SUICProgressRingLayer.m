@implementation SUICProgressRingLayer

uint64_t __38___SUICProgressRingLayer_setSpinning___block_invoke()
{
  uint64_t v0;
  void *v1;
  double v2;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)setSpinning__sRotationAnimation;
  setSpinning__sRotationAnimation = v0;

  objc_msgSend((id)setSpinning__sRotationAnimation, "setToValue:", &unk_1E4A632A0);
  objc_msgSend((id)setSpinning__sRotationAnimation, "setDuration:", 0.75);
  objc_msgSend((id)setSpinning__sRotationAnimation, "setCumulative:", 1);
  LODWORD(v2) = 2139095040;
  return objc_msgSend((id)setSpinning__sRotationAnimation, "setRepeatCount:", v2);
}

void __58___SUICProgressRingLayer_setProgress_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setStrokeEnd:", *(double *)(a1 + 40));
    WeakRetained = v3;
  }

}

@end
