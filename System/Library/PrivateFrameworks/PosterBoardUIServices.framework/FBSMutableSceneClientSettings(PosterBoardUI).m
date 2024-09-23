@implementation FBSMutableSceneClientSettings(PosterBoardUI)

- (void)pruis_setSwitcherLayoutMode:()PosterBoardUI
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 25612);

}

- (void)pruis_setSwitcherContextID:()PosterBoardUI
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 25613);

}

- (void)pruis_setPrimaryPosterScale:()PosterBoardUI
{
  void *v3;
  id v4;

  objc_msgSend(a1, "otherSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forSetting:", v3, 25614);

}

- (void)pruis_setPrimaryPosterOffset:()PosterBoardUI
{
  void *v5;
  void *v6;
  _QWORD v7[2];

  objc_msgSend(a1, "otherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)v7 = a2;
  *(double *)&v7[1] = a3;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v7, "{CGPoint=dd}");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 25615);

}

@end
