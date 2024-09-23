@implementation ISDefaultBehavior

- (int64_t)behaviorType
{
  return 0;
}

- (void)activeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISDefaultBehavior;
  -[ISBehavior activeDidChange](&v3, sel_activeDidChange);
  -[ISDefaultBehavior _showPhoto](self, "_showPhoto");
}

- (void)_showPhoto
{
  ISPlayerState *v3;

  v3 = -[ISPlayerState initWithPhotoBlurRadius:videoAlpha:videoBlurRadius:label:]([ISPlayerState alloc], "initWithPhotoBlurRadius:videoAlpha:videoBlurRadius:label:", CFSTR("Default"), 0.0, 0.0, 0.0);
  -[ISBehavior setOutputInfo:withTransitionOptions:completion:](self, "setOutputInfo:withTransitionOptions:completion:", v3, 0, 0);

}

@end
