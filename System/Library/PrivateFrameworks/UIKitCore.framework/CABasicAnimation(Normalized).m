@implementation CABasicAnimation(Normalized)

+ (id)normalizedAnimationWithKeyPath:()Normalized fromValue:toValue:
{
  void *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0CD2710];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "animationWithKeyPath:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBeginTime:", 1.0e-100);
  objc_msgSend(v10, "setDuration:", 1.0);
  objc_msgSend(v10, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v10, "setRemovedOnCompletion:", 0);
  objc_msgSend(v10, "setFromValue:", v9);

  objc_msgSend(v10, "setToValue:", v8);
  return v10;
}

@end
