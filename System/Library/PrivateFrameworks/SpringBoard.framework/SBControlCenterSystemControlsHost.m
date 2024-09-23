@implementation SBControlCenterSystemControlsHost

- (id)observeSilentModeWithBlock:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3978];
  v4 = a3;
  if ((objc_msgSend(v3, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBControlCenterSystemControlsHost observeSilentModeWithBlock:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("SBControlCenterSystemControlsHost.m"), 19, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend((id)SBApp, "ringerControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "observeRingerMutedWithBlock:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
