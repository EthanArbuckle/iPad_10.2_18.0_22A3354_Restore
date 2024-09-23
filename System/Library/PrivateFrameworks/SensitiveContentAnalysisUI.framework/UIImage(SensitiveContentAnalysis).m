@implementation UIImage(SensitiveContentAnalysis)

+ (id)scImageNamed:()SensitiveContentAnalysis
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  +[SCUIResources mainBundle](SCUIResources, "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:compatibleWithTraitCollection:", v3, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
