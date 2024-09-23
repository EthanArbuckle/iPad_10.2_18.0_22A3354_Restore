@implementation PushToDeviceActivity

- (PushToDeviceActivity)initWithDevice:(id)a3 place:(id)a4
{
  id v7;
  id v8;
  PushToDeviceActivity *v9;
  PushToDeviceActivity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PushToDeviceActivity;
  v9 = -[PushToDeviceActivity init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_data, a4);
  }

  return v10;
}

+ (int64_t)activityCategory
{
  return 1;
}

- (id)activityType
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPushDevice uniqueID](self->_device, "uniqueID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.Maps.Push.%@"), v2));

  return v3;
}

- (id)activityTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Send to %@"), CFSTR("localized string not found"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPushDevice name](self->_device, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5));

  return v6;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[MapsPushManager defaultManager](MapsPushManager, "defaultManager"));
  objc_msgSend(v3, "pushItem:toDevice:", self->_data, self->_device);

}

- (id)icon
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v4 = objc_msgSend(v3, "appKitBundleClass");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPushDevice model](self->_device, "model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iconNameForDeviceModel:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v6));
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
