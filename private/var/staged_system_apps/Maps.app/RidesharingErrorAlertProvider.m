@implementation RidesharingErrorAlertProvider

- (id)_initWithCause:(int64_t)a3 application:(id)a4 activity:(id)a5
{
  id v9;
  id v10;
  RidesharingErrorAlertProvider *v11;
  RidesharingErrorAlertProvider *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RidesharingErrorAlertProvider;
  v11 = -[RidesharingErrorAlertProvider init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_application, a4);
    objc_storeStrong((id *)&v12->_activity, a5);
    v12->_cause = a3;
  }

  return v12;
}

- (NSString)title
{
  RidesharingErrorAlertProvider *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  id v7;
  void *v8;

  v2 = self;
  switch(-[RidesharingErrorAlertProvider cause](self, "cause"))
  {
    case 0:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("There was a problem booking your ride [ridesharing booking error alert]");
      goto LABEL_4;
    case 1:
    case 3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("There was a problem updating your ride status [ridesharing status error alert]");
LABEL_4:
      v2 = (RidesharingErrorAlertProvider *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));
      goto LABEL_6;
    case 2:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Set pickup location in %@ [ridesharing API error alert]"), CFSTR("localized string not found"), 0));

      v7 = objc_alloc((Class)NSString);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication name](v2->_application, "name"));
      v2 = (RidesharingErrorAlertProvider *)objc_msgSend(v7, "initWithFormat:", v4, v8);

LABEL_6:
      break;
    default:
      return (NSString *)v2;
  }
  return (NSString *)v2;
}

- (NSString)message
{
  id v2;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  void *v9;

  switch(-[RidesharingErrorAlertProvider cause](self, "cause"))
  {
    case 0:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Open %@ to check your booking [ridesharing booking error alert]");
      goto LABEL_5;
    case 1:
    case 3:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Open %@ to check your ride status [ridesharing status error alert]");
      goto LABEL_5;
    case 2:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Open %@ to set the pickup location for this ride. [ridesharing API error alert]");
LABEL_5:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

      v8 = objc_alloc((Class)NSString);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication name](self->_application, "name"));
      v2 = objc_msgSend(v8, "initWithFormat:", v7, v9);

      break;
    default:
      return (NSString *)v2;
  }
  return (NSString *)v2;
}

- (NSString)openAppCommandTitle
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Open %@ [ridesharing booking error alert]"), CFSTR("localized string not found"), 0));

  v5 = objc_alloc((Class)NSString);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication name](self->_application, "name"));
  v7 = objc_msgSend(v5, "initWithFormat:", v4, v6);

  return (NSString *)v7;
}

- (NSString)dismissCommandTitle
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  v3 = -[RidesharingErrorAlertProvider cause](self, "cause");
  if (v3 < 2)
    goto LABEL_4;
  if (v3 == 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("Cancel [ridesharing confirmation error alert]");
    goto LABEL_6;
  }
  if (v3 == 3)
  {
LABEL_4:
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("OK [ridesharing booking error alert]");
LABEL_6:
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

  }
  return (NSString *)v2;
}

- (void)openApp
{
  if (!self->_superseded)
    -[RideBookingApplication openWithActivity:](self->_application, "openWithActivity:", self->_activity);
}

- (void)_supersede
{
  void *v3;
  void (**v4)(id, RidesharingErrorAlertProvider *);

  if (!self->_superseded)
  {
    self->_superseded = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingErrorAlertProvider didSupersede](self, "didSupersede"));

    if (v3)
    {
      v4 = (void (**)(id, RidesharingErrorAlertProvider *))objc_claimAutoreleasedReturnValue(-[RidesharingErrorAlertProvider didSupersede](self, "didSupersede"));
      v4[2](v4, self);

    }
  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingErrorAlertProvider title](self, "title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingErrorAlertProvider message](self, "message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Title: %@, message: %@"), v3, v4));

  return v5;
}

- (int64_t)cause
{
  return self->_cause;
}

- (id)didSupersede
{
  return self->_didSupersede;
}

- (void)setDidSupersede:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didSupersede, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end
