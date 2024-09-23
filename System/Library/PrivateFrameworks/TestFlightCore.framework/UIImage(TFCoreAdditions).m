@implementation UIImage(TFCoreAdditions)

+ (id)tf_imageNamed:()TFCoreAdditions compatibleWithTraitCollection:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDF6AC8];
  v6 = a4;
  v7 = a3;
  +[TFBundle frameworkBundle](TFBundle, "frameworkBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:compatibleWithTraitCollection:", v7, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
