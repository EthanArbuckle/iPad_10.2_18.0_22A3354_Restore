@implementation SBXCloseBoxView

- (id)defaultContentImage
{
  if (defaultContentImage_onceToken_0 != -1)
    dispatch_once(&defaultContentImage_onceToken_0, &__block_literal_global_13);
  return (id)defaultContentImage___image;
}

void __38__SBXCloseBoxView_defaultContentImage__block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  char v3;
  int v4;
  char v5;
  __CFString *v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;

  v2 = __sb__runningInSpringBoard();
  v3 = v2;
  if (v2)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v12 = CFSTR("IconCloseBoxX");
      goto LABEL_15;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v0, "userInterfaceIdiom") != 1)
    {
      v12 = CFSTR("IconCloseBoxX");
LABEL_14:

      goto LABEL_15;
    }
  }
  v4 = __sb__runningInSpringBoard();
  v5 = v4;
  if (v4)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v6 = CFSTR("IconCloseBoxXLarge");
  if (v7 < *(double *)(MEMORY[0x1E0DAB260] + 264))
    v6 = CFSTR("IconCloseBoxX");
  v12 = v6;
  if ((v5 & 1) == 0)

  if ((v3 & 1) == 0)
    goto LABEL_14;
LABEL_15:
  v8 = (void *)MEMORY[0x1E0DC3870];
  SBHBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageNamed:inBundle:", v12, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)defaultContentImage___image;
  defaultContentImage___image = v10;

}

@end
