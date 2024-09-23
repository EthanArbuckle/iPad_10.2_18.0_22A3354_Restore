@implementation RCToggleButton

+ (id)playbackSettingsButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "playbackSettingsImage"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCToggleButton _toggleButtonWithDefaultImage:toggleImage:](RCToggleButton, "_toggleButtonWithDefaultImage:toggleImage:", v3, v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PLAYBACK_SETTINGS"), &stru_1001B2BC0, 0));

  objc_msgSend(v4, "setAccessibilityLabel:", v6);
  objc_msgSend(v4, "setLargeContentTitle:", v6);
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("Playback Settings button"));

  return v4;
}

+ (id)transcriptionButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "transcriptionImage"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transcriptionToggleImage"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCToggleButton _toggleButtonWithDefaultImage:toggleImage:](RCToggleButton, "_toggleButtonWithDefaultImage:toggleImage:", v3, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TRANSCRIPTION"), &stru_1001B2BC0, 0));

  objc_msgSend(v6, "setAccessibilityLabel:", v8);
  objc_msgSend(v6, "setLargeContentTitle:", v8);
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("Transcription button"));

  return v6;
}

+ (id)_toggleButtonWithDefaultImage:(id)a3 toggleImage:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCToggleButton buttonWithType:](RCToggleButton, "buttonWithType:", 1));
  objc_msgSend(v7, "setDefaultImage:", v6);

  objc_msgSend(v7, "setToggleImage:", v5);
  return v7;
}

- (RCToggleButton)initWithFrame:(CGRect)a3
{
  RCToggleButton *v3;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RCToggleButton;
  v3 = -[RCPointerInteractionButton initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100073074;
    v5[3] = &unk_1001ACC00;
    objc_copyWeak(&v6, &location);
    -[RCToggleButton setConfigurationUpdateHandler:](v3, "setConfigurationUpdateHandler:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)setIsToggled:(BOOL)a3
{
  self->_isToggled = a3;
  -[RCToggleButton restyle](self, "restyle");
}

- (void)restyle
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000732C8;
  v2[3] = &unk_1001AB588;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

- (void)setImageSymbolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, a3);
  -[RCToggleButton restyle](self, "restyle");
}

- (unint64_t)accessibilityTraits
{
  objc_super v4;
  objc_super v5;

  if (-[RCToggleButton isToggled](self, "isToggled"))
  {
    v5.receiver = self;
    v5.super_class = (Class)RCToggleButton;
    return UIAccessibilityTraitSelected | -[RCToggleButton accessibilityTraits](&v5, "accessibilityTraits");
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)RCToggleButton;
    return -[RCToggleButton accessibilityTraits](&v4, "accessibilityTraits");
  }
}

- (BOOL)isToggled
{
  return self->_isToggled;
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return self->_imageSymbolConfiguration;
}

- (UIImage)defaultImage
{
  return self->_defaultImage;
}

- (void)setDefaultImage:(id)a3
{
  objc_storeStrong((id *)&self->_defaultImage, a3);
}

- (UIImage)toggleImage
{
  return self->_toggleImage;
}

- (void)setToggleImage:(id)a3
{
  objc_storeStrong((id *)&self->_toggleImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleImage, 0);
  objc_storeStrong((id *)&self->_defaultImage, 0);
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, 0);
}

@end
