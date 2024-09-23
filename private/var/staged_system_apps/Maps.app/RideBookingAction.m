@implementation RideBookingAction

- (RideBookingAction)initWithActivity:(id)a3 application:(id)a4
{
  id v6;
  id v7;
  RideBookingAction *v8;
  NSUserActivity *v9;
  NSUserActivity *activity;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RideBookingAction;
  v8 = -[RideBookingAction init](&v12, "init");
  if (v8)
  {
    v9 = (NSUserActivity *)objc_msgSend(v6, "copy");
    activity = v8->_activity;
    v8->_activity = v9;

    objc_storeWeak((id *)&v8->_application, v7);
  }

  return v8;
}

- (NSString)title
{
  return -[NSUserActivity title](self->_activity, "title");
}

- (void)perform
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_application);
  objc_msgSend(WeakRetained, "openWithActivity:", self->_activity);

}

- (NSUserActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (RideBookingApplication)application
{
  return (RideBookingApplication *)objc_loadWeakRetained((id *)&self->_application);
}

- (void)setApplication:(id)a3
{
  objc_storeWeak((id *)&self->_application, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_application);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
