@implementation PCAnnouncementActivity

- (PCAnnouncementActivity)init
{
  PCAnnouncementActivity *v2;
  PCAnnouncementActivity *v3;
  void *v4;
  void *v5;
  objc_super v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)PCAnnouncementActivity;
  v2 = -[PCAnnouncementActivity initWithActivityType:](&v7, sel_initWithActivityType_, CFSTR("com.apple.ProximityControl.activity.annoucement"));
  v3 = v2;
  if (v2)
  {
    makeIneligibleForProcessing(v2);
    +[PCLocalizedString localizedStringForKey:](PCLocalizedString, "localizedStringForKey:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCAnnouncementActivity setTitle:](v3, "setTitle:", v4);

    v8 = CFSTR("IS_ANNOUNCING");
    v9[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCAnnouncementActivity setUserInfo:](v3, "setUserInfo:", v5);

  }
  return v3;
}

- (PCAnnouncementActivity)initWithActivity:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  PCAnnouncementActivity *v8;
  void *v9;
  PCAnnouncementActivity *v10;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(CFSTR("com.apple.ProximityControl.activity.annoucement"), "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(v4, "activityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12.receiver = self;
    v12.super_class = (Class)PCAnnouncementActivity;
    v8 = -[PCAnnouncementActivity initWithActivityType:](&v12, sel_initWithActivityType_, v7);

    if (v8)
    {
      makeIneligibleForProcessing(v8);
      objc_msgSend(v4, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCAnnouncementActivity setUserInfo:](v8, "setUserInfo:", v9);

    }
    self = v8;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)activityString
{
  return +[PCLocalizedString localizedStringForKey:](PCLocalizedString, "localizedStringForKey:", 1);
}

- (id)bundleIdentifier
{
  return CFSTR("com.apple.annouced");
}

- (id)description
{
  return +[PCLocalizedString localizedStringForKey:](PCLocalizedString, "localizedStringForKey:", 1);
}

- (id)image
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double height;
  CGContext *CurrentContext;
  id v12;
  void *v13;
  CGContext *v14;
  id v15;
  void *v16;
  CGSize v18;
  CGSize v19;
  CGSize v20;
  CGRect v21;
  CGRect v22;

  if (announceImage)
  {
    v2 = (id)announceImage;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("waveform"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:weight:", 7, 32.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageWithConfiguration:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithTintColor:renderingMode:", v6, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "size");
    v9 = v8;
    objc_msgSend(v7, "size");
    height = v18.height;
    v18.width = v9;
    UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.width = v9;
    v21.size.height = height;
    CGContextAddEllipseInRect(CurrentContext, v21);
    CGContextClosePath(CurrentContext);
    objc_msgSend(MEMORY[0x24BDF6950], "orangeColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v12, "CGColor"));

    CGContextFillPath(CurrentContext);
    UIGraphicsGetImageFromCurrentImageContext();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    v19.width = v9;
    v19.height = height;
    UIGraphicsBeginImageContext(v19);
    v14 = UIGraphicsGetCurrentContext();
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(v14, (CGColorRef)objc_msgSend(v15, "CGColor"));

    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v22.size.width = v9;
    v22.size.height = height;
    CGContextFillRect(v14, v22);
    objc_msgSend(v7, "drawInRect:blendMode:alpha:", 22, 0.0, 0.0, v9, height, 1.0);
    UIGraphicsGetImageFromCurrentImageContext();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    v20.width = v9;
    v20.height = height;
    UIGraphicsBeginImageContext(v20);
    objc_msgSend(v13, "drawInRect:", 0.0, 0.0, v9, height);
    objc_msgSend(v16, "drawInRect:", 3.0, 3.0, v9 + -6.0, height + -6.0);
    UIGraphicsGetImageFromCurrentImageContext();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    objc_storeStrong((id *)&announceImage, v2);

  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  return objc_msgSend(a3, "pcactivityType") == 2;
}

- (BOOL)isValid
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PCAnnouncementActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (unint64_t)pcactivityType
{
  return 2;
}

@end
