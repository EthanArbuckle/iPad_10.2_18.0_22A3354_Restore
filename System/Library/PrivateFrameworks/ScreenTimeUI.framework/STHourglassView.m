@implementation STHourglassView

- (id)makeCAPackage
{
  void *v2;
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  -[STHourglassView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  if (v3 == 2)
    v4 = CFSTR("hourGlass dark");
  else
    v4 = CFSTR("hourGlass light");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", v4, CFSTR("ca"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE5718], "packageWithContentsOfURL:type:options:error:", v6, *MEMORY[0x24BDE5D50], 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setStateName:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STHourglassView;
  -[STCAPackageView setStateName:](&v3, sel_setStateName_, a3);
}

- (void)animateToStateName:(id)a3 completionHandler:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STHourglassView;
  -[STCAPackageView animateToStateName:completionHandler:](&v4, sel_animateToStateName_completionHandler_, a3, a4);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 72.0;
  v3 = 72.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)prepareForInterfaceBuilder
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STHourglassView;
  -[STHourglassView prepareForInterfaceBuilder](&v3, sel_prepareForInterfaceBuilder);
  -[STHourglassView setStateName:](self, "setStateName:", CFSTR("fill"));
}

@end
