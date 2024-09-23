@implementation UIApplication(SiriUI)

- (double)siriui_applicationFrame
{
  void *v0;
  double v1;
  double v2;
  void *v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "conformsToProtocol:", &unk_254F58890))
  {
    objc_msgSend(v0, "applicationFrame");
    v2 = v1;
  }
  else
  {
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "keyWindow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v2 = v4;

  }
  return v2;
}

@end
