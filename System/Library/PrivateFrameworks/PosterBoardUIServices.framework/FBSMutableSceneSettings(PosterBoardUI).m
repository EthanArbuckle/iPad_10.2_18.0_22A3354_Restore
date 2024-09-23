@implementation FBSMutableSceneSettings(PosterBoardUI)

- (void)pruis_setPreferredSwitcherLayoutMode:()PosterBoardUI
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 25562);

}

- (void)pruis_setLockPosterOverlayLayerRenderID:()PosterBoardUI
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 25563);

}

- (void)pruis_setLockPosterOverlayLayerContextID:()PosterBoardUI
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 25564);

}

- (void)pruis_setLockPosterLiveContentLayerRenderID:()PosterBoardUI
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forSetting:", v4, 25565);

  }
  else
  {
    objc_msgSend(v5, "setObject:forSetting:", 0, 25565);
  }

}

- (void)pruis_setLockPosterLiveContentLayerContextID:()PosterBoardUI
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forSetting:", v4, 25566);

  }
  else
  {
    objc_msgSend(v5, "setObject:forSetting:", 0, 25566);
  }

}

- (void)pruis_setLockPosterFloatingLayerInlined:()PosterBoardUI
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagForBool(), 25569);

}

- (void)pruis_setLockPosterLiveFloatingLayerRenderID:()PosterBoardUI
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forSetting:", v4, 25567);

  }
  else
  {
    objc_msgSend(v5, "setObject:forSetting:", 0, 25567);
  }

}

- (void)pruis_setLockPosterLiveFloatingLayerContextID:()PosterBoardUI
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forSetting:", v4, 25568);

  }
  else
  {
    objc_msgSend(v5, "setObject:forSetting:", 0, 25568);
  }

}

- (void)pruis_setLockPosterComplicationRowHidden:()PosterBoardUI
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagForBool(), 25570);

}

- (void)pruis_setLeadingTopButtonFrame:()PosterBoardUI
{
  void *v9;
  void *v10;
  _QWORD v11[4];

  objc_msgSend(a1, "otherSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)v11 = a2;
  *(double *)&v11[1] = a3;
  *(double *)&v11[2] = a4;
  *(double *)&v11[3] = a5;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v11, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forSetting:", v10, 25571);

}

- (void)pruis_setTrailingTopButtonFrame:()PosterBoardUI
{
  void *v9;
  void *v10;
  _QWORD v11[4];

  objc_msgSend(a1, "otherSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)v11 = a2;
  *(double *)&v11[1] = a3;
  *(double *)&v11[2] = a4;
  *(double *)&v11[3] = a5;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v11, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forSetting:", v10, 25572);

}

- (void)pruis_setLockVibrancyConfiguration:()PosterBoardUI
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 25573);

}

@end
