@implementation CRLMutableGradientFillStop

- (id)copyWithZone:(_NSZone *)a3
{
  CRLGradientFillStop *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  CRLGradientFillStop *v9;

  v4 = +[CRLGradientFillStop allocWithZone:](CRLGradientFillStop, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGradientFillStop color](self, "color"));
  -[CRLGradientFillStop fraction](self, "fraction");
  v7 = v6;
  -[CRLGradientFillStop inflection](self, "inflection");
  v9 = -[CRLGradientFillStop initWithColor:fraction:inflection:](v4, "initWithColor:fraction:inflection:", v5, v7, v8);

  return v9;
}

@end
