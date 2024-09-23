@implementation CardShadowSettings

- (CardShadowSettings)initWithRadius:(double)a3 opacity:(double)a4 rimOpacity:(double)a5 cornerRadius:(double)a6
{
  CardShadowSettings *v10;
  CardShadowSettings *v11;
  CardShadowSettings *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CardShadowSettings;
  v10 = -[CardShadowSettings init](&v14, "init");
  v11 = v10;
  if (v10)
  {
    v10->_radius = a3;
    v10->_opacity = a4;
    v10->_rimOpacity = a5;
    v10->_cornerRadius = a6;
    v12 = v10;
  }

  return v11;
}

- (double)expansion
{
  return ceil(self->_radius);
}

+ (id)lightCardShadowSettings
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return objc_msgSend(v2, "initWithRadius:opacity:rimOpacity:cornerRadius:", 15.0, 0.0799999982, 0.0700000003, _UISheetCornerRadius);
}

+ (id)lightButtonShadowSettings
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithRadius:opacity:rimOpacity:cornerRadius:", 7.0, 0.150000006, 0.0500000007, 9.0);
}

+ (id)darkCardShadowSettings
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return objc_msgSend(v2, "initWithRadius:opacity:rimOpacity:cornerRadius:", 15.0, 0.217999995, 0.135100007, _UISheetCornerRadius);
}

+ (id)darkButtonShadowSettings
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithRadius:opacity:rimOpacity:cornerRadius:", 7.0, 0.234999999, 0.116499998, 9.0);
}

+ (id)lightCardMacShadowSettings
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return objc_msgSend(v2, "initWithRadius:opacity:rimOpacity:cornerRadius:", 15.0, 0.200000003, 0.100000001, _UISheetCornerRadius);
}

+ (id)darkCardMacShadowSettings
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return objc_msgSend(v2, "initWithRadius:opacity:rimOpacity:cornerRadius:", 15.0, 0.217999995, 0.135100007, _UISheetCornerRadius);
}

+ (id)settingsForTraitCollection:(id)a3 button:(BOOL)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = objc_msgSend(v6, "userInterfaceStyle");
  v8 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == (id)2)
  {
    if (v8 == (id)5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "darkCardMacShadowSettings"));
    }
    else if (a4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "darkButtonShadowSettings"));
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "darkCardShadowSettings"));
    }
  }
  else if (v8 == (id)5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "lightCardMacShadowSettings"));
  }
  else if (a4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "lightButtonShadowSettings"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "lightCardShadowSettings"));
  }
  return v9;
}

- (double)radius
{
  return self->_radius;
}

- (double)opacity
{
  return self->_opacity;
}

- (double)rimOpacity
{
  return self->_rimOpacity;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

@end
