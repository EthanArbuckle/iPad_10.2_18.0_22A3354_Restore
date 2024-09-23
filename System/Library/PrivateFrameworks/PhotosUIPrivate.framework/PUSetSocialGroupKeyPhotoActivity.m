@implementation PUSetSocialGroupKeyPhotoActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BE08];
}

- (id)activityTitle
{
  return (id)PXLemonadeLocalizedString();
}

- (id)_systemImageName
{
  return CFSTR("person.2.square.stack");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PXActivity itemSourceController](self, "itemSourceController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "socialGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "assets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") == 1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)performActivity
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

@end
