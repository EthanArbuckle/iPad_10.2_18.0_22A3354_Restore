@implementation MapsDebugEmptySectionBannerRow

- (void)configureCell:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MapsDebugEmptySectionBannerRow;
  v3 = a3;
  -[MapsDebugTableRow configureCell:](&v8, "configureCell:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentConfiguration", v8.receiver, v8.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textProperties"));
  objc_msgSend(v6, "setColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textProperties"));
  objc_msgSend(v7, "setAlignment:", 1);

  objc_msgSend(v3, "setContentConfiguration:", v4);
}

@end
