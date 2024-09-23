@implementation SPUIMutableSearchBarSceneSettings

- (void)setScrollProgress:(double)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 1001);

}

- (double)scrollProgress
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1001);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v4 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "doubleValue");
    v4 = v5;
  }

  return v4;
}

- (void)setAnimated:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagIfYes(), 1002);

}

- (BOOL)animated
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 1002);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([SPUISearchBarSceneSettings alloc], "initWithSettings:", self);
}

@end
