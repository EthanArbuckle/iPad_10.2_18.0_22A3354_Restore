@implementation SBUISearchUtilities

+ (double)idealSearchPlatterWidth
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  char *v10;
  double v11;
  double v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  double v17;
  double v18;
  double result;
  void *v20;
  uint64_t v21;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "interfaceOrientation");

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_referenceBounds");
  v6 = v5;
  v8 = v7;

  if (v6 >= v8)
    v9 = v8;
  else
    v9 = v6;
  v10 = "SpringBoard";
  if (_os_feature_enabled_impl())
    v11 = 500.0;
  else
    v11 = 672.0;
  if (_os_feature_enabled_impl())
    v12 = 425.0;
  else
    v12 = 556.0;
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v14 = 0;
      v15 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "userInterfaceIdiom") != 1)
    {
      v15 = 0;
      v14 = 1;
      goto LABEL_20;
    }
  }
  v14 = v13 ^ 1;
  v16 = __sb__runningInSpringBoard();
  if (v16)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v13, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if (v17 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    if ((v16 & 1) != 0)
      goto LABEL_24;
    goto LABEL_35;
  }
  v15 = v16 ^ 1;
LABEL_20:
  v11 = v9 + -16.0;
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
      v11 = v12;
    if ((v15 & 1) == 0)
      goto LABEL_24;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "userInterfaceIdiom");

    if (v21 == 1)
      v11 = v12;
    if (!v15)
    {
LABEL_24:
      if (!v14)
        goto LABEL_26;
      goto LABEL_25;
    }
  }
LABEL_35:

  if ((v14 & 1) != 0)
LABEL_25:

LABEL_26:
  if ((unint64_t)(v3 - 1) >= 2)
    v18 = v8;
  else
    v18 = v6;
  result = v18 + -16.0;
  if (v11 < result)
    return v11;
  return result;
}

- (SBUISearchUtilities)init
{
  void *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUISearchUtilities.m"), 34, CFSTR("Do not instantiate this class"));

  v6.receiver = self;
  v6.super_class = (Class)SBUISearchUtilities;
  return -[SBUISearchUtilities init](&v6, sel_init);
}

@end
