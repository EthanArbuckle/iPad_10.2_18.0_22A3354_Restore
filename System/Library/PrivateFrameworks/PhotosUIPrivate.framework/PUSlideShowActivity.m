@implementation PUSlideShowActivity

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BE38];
}

- (id)activityTitle
{
  return PULocalizedString(CFSTR("PUPHOTOBROWSER_BUTTON_SLIDESHOW"));
}

- (id)_systemImageName
{
  return CFSTR("play.rectangle");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[PXActivity itemSourceController](self, "itemSourceController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isPreparingIndividualItems"))
  {
    -[PXActivity itemSourceController](self, "itemSourceController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "itemSourcesSupportSlideshow");

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
