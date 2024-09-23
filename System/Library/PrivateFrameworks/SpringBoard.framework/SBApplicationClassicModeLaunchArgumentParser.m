@implementation SBApplicationClassicModeLaunchArgumentParser

- (SBApplicationClassicModeLaunchArgumentParser)initWithApplication:(id)a3
{
  id v5;
  SBApplicationClassicModeLaunchArgumentParser *v6;
  SBApplicationClassicModeLaunchArgumentParser *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBApplicationClassicModeLaunchArgumentParser;
  v6 = -[SBApplicationClassicModeLaunchArgumentParser init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_application, a3);

  return v7;
}

- (int64_t)classicModeForLaunchArgument:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  void *v15;

  v6 = a3;
  if (v6)
  {
    v7 = SBHScreenTypeForCurrentDevice();
    v8 = SBHScreenTypeForShortString();
    if (v7 == v8)
    {
      v9 = 0;
    }
    else
    {
      v10 = v8;
      v9 = +[SBApplication _bestClassicModeForScreenType:](SBApplication, "_bestClassicModeForScreenType:", v8);
      if (v10 == 1 && !objc_msgSend(&unk_1E91CE290, "containsObject:", v6))
        v9 = -1;
    }
  }
  else
  {
    v9 = -1;
  }
  if (_SBApplicationClassicModeIsClassic(v9))
  {
    v11 = -[SBApplication _canLaunchInClassicMode:](self->_application, "_canLaunchInClassicMode:", v9);
    if (v11)
      v12 = v9;
    else
      v12 = -1;
    if (!a4)
    {
      v9 = v12;
      goto LABEL_22;
    }
    if (!v11)
    {
      SBApplicationClassicModeDescription(v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBApplication bundleIdentifier](self->_application, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      FBSOpenApplicationErrorCreate();
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
      v9 = -1;
      goto LABEL_22;
    }
  }
  else if (!a4)
  {
    goto LABEL_22;
  }
  if (v9 == -1)
  {
    if (classicModeForLaunchArgument_error__onceToken != -1)
      dispatch_once(&classicModeForLaunchArgument_error__onceToken, &__block_literal_global_27);
    FBSOpenApplicationErrorCreate();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_22:

  return v9;
}

void __83__SBApplicationClassicModeLaunchArgumentParser_classicModeForLaunchArgument_error___block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v0 = v3;
  SBHEnumerateScreenTypes();
  objc_msgSend(v0, "componentsJoinedByString:", CFSTR(", "));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)classicModeForLaunchArgument_error__modeString;
  classicModeForLaunchArgument_error__modeString = v1;

}

void __83__SBApplicationClassicModeLaunchArgumentParser_classicModeForLaunchArgument_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (_SBApplicationClassicModeIsClassic(+[SBApplication _bestClassicModeForScreenType:](SBApplication, "_bestClassicModeForScreenType:", a2)))
  {
    v3 = *(void **)(a1 + 32);
    SBHShortStringForScreenType();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);
}

@end
