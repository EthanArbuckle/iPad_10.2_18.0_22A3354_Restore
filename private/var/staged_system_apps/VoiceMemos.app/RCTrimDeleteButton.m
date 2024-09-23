@implementation RCTrimDeleteButton

- (RCTrimDeleteButton)initWithFrame:(CGRect)a3
{
  RCTrimDeleteButton *v3;
  RCTrimDeleteButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCTrimDeleteButton;
  v3 = -[RCPointerInteractionButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[RCTrimDeleteButton _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCTrimDeleteButton _title](self, "_title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCTrimDeleteButton _configurationUpdateHandlerWithTitle:](self, "_configurationUpdateHandlerWithTitle:", v7));
  -[RCTrimDeleteButton setConfigurationUpdateHandler:](self, "setConfigurationUpdateHandler:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCTrimDeleteButton _accessibilityLabel](self, "_accessibilityLabel"));
  -[RCTrimDeleteButton setAccessibilityLabel:](self, "setAccessibilityLabel:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCTrimDeleteButton _accessibilityIdentifier](self, "_accessibilityIdentifier"));
  -[RCTrimDeleteButton setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCTrimDeleteButton _largeContentTitle](self, "_largeContentTitle"));
  -[RCTrimDeleteButton setLargeContentTitle:](self, "setLargeContentTitle:", v6);

}

- (id)_configurationUpdateHandlerWithTitle:(id)a3
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100024C44;
  v7[3] = &unk_1001AB768;
  v8 = a3;
  v3 = v8;
  v4 = objc_retainBlock(v7);
  v5 = objc_retainBlock(v4);

  return v5;
}

- (id)_title
{
  -[RCTrimDeleteButton doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return &stru_1001B2BC0;
}

- (id)_accessibilityLabel
{
  -[RCTrimDeleteButton doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return &stru_1001B2BC0;
}

- (id)_accessibilityIdentifier
{
  -[RCTrimDeleteButton doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return &stru_1001B2BC0;
}

- (id)_largeContentTitle
{
  -[RCTrimDeleteButton doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return &stru_1001B2BC0;
}

@end
