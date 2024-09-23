@implementation UIDictationSearchButton

+ (id)searchButton
{
  void *v2;
  void *v3;
  void *v4;

  +[UIButton buttonWithType:](UIDictationSearchButton, "buttonWithType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("mic.fill"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:forState:", v3, 0);

  +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v4);

  objc_msgSend(v2, "setPointerInteractionEnabled:", 1);
  return v2;
}

- (int64_t)_interactionTextInputSource
{
  return 2;
}

@end
