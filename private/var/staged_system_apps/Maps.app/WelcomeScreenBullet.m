@implementation WelcomeScreenBullet

- (WelcomeScreenBullet)initWithTitle:(id)a3 body:(id)a4 imageName:(id)a5 tintColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WelcomeScreenBullet *v14;
  NSString *v15;
  NSString *title;
  NSString *v17;
  NSString *body;
  uint64_t v19;
  UIImage *image;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)WelcomeScreenBullet;
  v14 = -[WelcomeScreenBullet init](&v22, "init");
  if (v14)
  {
    v15 = (NSString *)objc_msgSend(v10, "copy");
    title = v14->_title;
    v14->_title = v15;

    v17 = (NSString *)objc_msgSend(v11, "copy");
    body = v14->_body;
    v14->_body = v17;

    v19 = objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v12));
    image = v14->_image;
    v14->_image = (UIImage *)v19;

    objc_storeStrong((id *)&v14->_tintColor, a6);
  }

  return v14;
}

- (WelcomeScreenBullet)initWithTitle:(id)a3 body:(id)a4 systemImageName:(id)a5 tintColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WelcomeScreenBullet *v14;
  NSString *v15;
  NSString *title;
  NSString *v17;
  NSString *body;
  uint64_t v19;
  UIImage *image;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)WelcomeScreenBullet;
  v14 = -[WelcomeScreenBullet init](&v22, "init");
  if (v14)
  {
    v15 = (NSString *)objc_msgSend(v10, "copy");
    title = v14->_title;
    v14->_title = v15;

    v17 = (NSString *)objc_msgSend(v11, "copy");
    body = v14->_body;
    v14->_body = v17;

    v19 = objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v12));
    image = v14->_image;
    v14->_image = (UIImage *)v19;

    objc_storeStrong((id *)&v14->_tintColor, a6);
  }

  return v14;
}

+ (id)multiStopRouting
{
  WelcomeScreenBullet *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WelcomeScreenBullet *v8;

  v2 = [WelcomeScreenBullet alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Multi-Stop Routing"), CFSTR("localized string not found"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Add multiple stops along your driving route."), CFSTR("localized string not found"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v8 = -[WelcomeScreenBullet initWithTitle:body:imageName:tintColor:](v2, "initWithTitle:body:imageName:tintColor:", v4, v6, CFSTR("multipointrouting"), v7);

  return v8;
}

+ (id)transitCards
{
  WelcomeScreenBullet *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WelcomeScreenBullet *v8;

  v2 = [WelcomeScreenBullet alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Transit Cards"), CFSTR("localized string not found"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Add transit cards to Wallet, see low balances, and replenish your card without leaving Maps."), CFSTR("localized string not found"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v8 = -[WelcomeScreenBullet initWithTitle:body:systemImageName:tintColor:](v2, "initWithTitle:body:systemImageName:tintColor:", v4, v6, CFSTR("creditcard.fill"), v7);

  return v8;
}

+ (id)landmarksIn3D
{
  WelcomeScreenBullet *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WelcomeScreenBullet *v8;

  v2 = [WelcomeScreenBullet alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Landmarks"), CFSTR("localized string not found"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Explore beautifully designed 3D landmarks in Las Vegas, Seattle, Chicago, and more."), CFSTR("localized string not found"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v8 = -[WelcomeScreenBullet initWithTitle:body:systemImageName:tintColor:](v2, "initWithTitle:body:systemImageName:tintColor:", v4, v6, CFSTR("building.columns.fill"), v7);

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)body
{
  return self->_body;
}

- (UIImage)image
{
  return self->_image;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
