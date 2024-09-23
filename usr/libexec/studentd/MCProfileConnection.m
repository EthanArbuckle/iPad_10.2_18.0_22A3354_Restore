@implementation MCProfileConnection

- (NSArray)stu_allWhitelistUserEnabledOptionKeys
{
  _QWORD v3[5];

  v3[0] = kMCAppWhitelistUserEnabledOptionsVoiceOverKey;
  v3[1] = kMCAppWhitelistUserEnabledOptionInvertColorsKey;
  v3[2] = kMCAppWhitelistUserEnabledOptionZoomKey;
  v3[3] = kMCAppWhitelistUserEnabledOptionAssistiveTouchKey;
  v3[4] = kMCAppWhitelistUserEnabledOptionInvertColorsKey;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 5));
}

- (NSArray)stu_whitelistUserEnabledOptionKeysEnabledInSettings
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v3 = (void *)_AXSTripleClickCopyOptions(self, a2);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100053E8C;
  v6[3] = &unk_1000CB410;
  v6[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crk_mapUsingBlock:", v6));

  return (NSArray *)v4;
}

- (id)stu_whitelistUserEnabledOptionKeyForTripleClickOption:(int)a3
{
  id v3;
  id *v4;

  v3 = 0;
  v4 = (id *)&kMCAppWhitelistUserEnabledOptionsVoiceOverKey;
  switch(a3)
  {
    case 1:
      goto LABEL_6;
    case 2:
      goto LABEL_4;
    case 3:
    case 5:
      return v3;
    case 4:
      v4 = (id *)&kMCAppWhitelistUserEnabledOptionZoomKey;
      goto LABEL_6;
    case 6:
      v4 = (id *)&kMCAppWhitelistUserEnabledOptionAssistiveTouchKey;
      goto LABEL_6;
    default:
      if (a3 == 15)
      {
LABEL_4:
        v4 = (id *)&kMCAppWhitelistUserEnabledOptionInvertColorsKey;
LABEL_6:
        v3 = *v4;
      }
      return v3;
  }
}

@end
