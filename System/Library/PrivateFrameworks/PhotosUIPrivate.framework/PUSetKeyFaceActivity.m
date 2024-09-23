@implementation PUSetKeyFaceActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BDF0];
}

- (id)activityTitle
{
  return (id)PXLocalizedString();
}

- (id)_systemImageName
{
  return CFSTR("rectangle.stack.person.crop");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PXActivity itemSourceController](self, "itemSourceController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") == 1;

  return v5;
}

- (void)performActivity
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

@end
