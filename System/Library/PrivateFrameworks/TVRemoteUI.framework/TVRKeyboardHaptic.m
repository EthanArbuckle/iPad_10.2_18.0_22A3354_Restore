@implementation TVRKeyboardHaptic

- (void)play
{
  void *v2;
  int v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_supportsForceTouch");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_tapticEngine");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "actuateFeedback:", 1);
  }
  else
  {
    AudioServicesPlaySystemSound(0xFFFu);
  }
}

@end
