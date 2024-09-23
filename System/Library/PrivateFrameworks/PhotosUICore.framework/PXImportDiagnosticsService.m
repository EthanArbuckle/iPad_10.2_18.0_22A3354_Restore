@implementation PXImportDiagnosticsService

+ (void)simulateFakeImportSource
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "_runImportTestCommonInit:navigateToImportTab:completionHandler:", &unk_1E53F0F20, +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled") ^ 1, 0);
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(sel__runImportTestCommonInit_navigateToImportTab_completionHandler_);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("The Photos UIApplication doesn't seem to respond to %@"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Could Not Add Fake Import Source"), v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, &__block_literal_global_245047);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v6);

    objc_msgSend(v9, "px_firstKeyWindow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_presentOverTopmostPresentedViewController:animated:completion:", v5, 1, 0);

  }
}

- (id)title
{
  return CFSTR("Start Import Simulation");
}

- (BOOL)canPerformAction
{
  void *v2;
  int v3;
  void *v4;

  +[PXImportSettings sharedInstance](PXImportSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "importSourceSimulationViaDiagnosticsEnabled");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = objc_msgSend(v4, "isShowingImportTab") ^ 1;
    else
      LOBYTE(v3) = 1;

  }
  return v3;
}

- (void)performAction
{
  objc_msgSend((id)objc_opt_class(), "simulateFakeImportSource");
}

@end
