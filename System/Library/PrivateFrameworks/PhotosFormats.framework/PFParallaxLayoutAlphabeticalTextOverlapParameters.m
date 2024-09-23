@implementation PFParallaxLayoutAlphabeticalTextOverlapParameters

- (double)bottomAreaHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PFAlphabeticalTextBottomAreaHeight"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.25;
  }

  return v5;
}

- (double)targetBottomOverlap
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PFAlphabeticalTextTargetBottomAreaOverlap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.5;
  }

  return v5;
}

- (double)maxBottomOverlap
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PFAlphabeticalTextMaxBottomAreaOverlap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 1.0;
  }

  return v5;
}

- (double)maxTopOverlapForTopRect:(CGRect)a3 isInteractive:(BOOL)a4
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("PFAlphabeticalTextMaxTopAreaOverlap"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    v7 = v6;
  }
  else
  {
    v7 = 0.001;
  }

  return v7;
}

@end
