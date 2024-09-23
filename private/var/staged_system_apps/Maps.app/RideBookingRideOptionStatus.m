@implementation RideBookingRideOptionStatus

- (NSString)errorMessage
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;

  switch(-[RideBookingRideOptionStatus rideOptionStatusError](self, "rideOptionStatusError"))
  {
    case 1uLL:
    case 4uLL:
    case 5uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("There was a problem communicating with this app.");
      goto LABEL_12;
    case 2uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("A ride is already booked for this app.");
      goto LABEL_12;
    case 3uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v6;
      v7 = CFSTR("No rides are currently available from %@");
      goto LABEL_6;
    case 6uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v6;
      v7 = CFSTR("%@ requires you to launch their app to view the ride options.");
LABEL_6:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOptionStatus application](self, "application"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
      v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v10));
      goto LABEL_15;
    case 7uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v12;
      v13 = CFSTR("Sign in to %@ to request a ride [Ridesharing]");
      goto LABEL_14;
    case 8uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v12;
      v13 = CFSTR("%@ does not offer service [Ridesharing]");
      goto LABEL_14;
    case 9uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v12;
      v13 = CFSTR("Service from %@ is temporarily unavailable [Ridesharing]");
      goto LABEL_14;
    case 0xAuLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v12;
      v13 = CFSTR("Open %@ to verify the state of your previous ride. [Ridesharing]");
      goto LABEL_14;
    case 0xBuLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Review your last ride. [Ridesharing]");
LABEL_12:
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));
      goto LABEL_16;
    case 0xCuLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v12;
      v13 = CFSTR("Open %@ to request a ride [Ridesharing]");
LABEL_14:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v13, CFSTR("localized string not found"), 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOptionStatus application](self, "application"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
      v11 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v10));
LABEL_15:
      v14 = (void *)v11;

LABEL_16:
      break;
    default:
      v14 = 0;
      break;
  }
  return (NSString *)v14;
}

- (id)_init
{
  RideBookingRideOptionStatus *v2;
  RideBookingRideOptionStatus *v3;
  NSArray *rideOptions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RideBookingRideOptionStatus;
  v2 = -[RideBookingRideOptionStatus init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_loadingRideOptions = 0;
    rideOptions = v2->_rideOptions;
    v2->_rideOptions = 0;

    v3->_rideOptionStatusError = 0;
  }
  return v3;
}

+ (RideBookingRideOptionStatus)statusWithApplication:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[RideBookingRideOptionStatus _init]([RideBookingRideOptionStatus alloc], "_init");
  objc_msgSend(v4, "setApplication:", v3);

  return (RideBookingRideOptionStatus *)v4;
}

+ (RideBookingRideOptionStatus)statusWithApplication:(id)a3 loadingRideOptions:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingRideOptionStatus statusWithApplication:](RideBookingRideOptionStatus, "statusWithApplication:", a3));
  objc_msgSend(v5, "setLoadingRideOptions:", v4);
  return (RideBookingRideOptionStatus *)v5;
}

+ (RideBookingRideOptionStatus)statusWithApplication:(id)a3 error:(unint64_t)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingRideOptionStatus statusWithApplication:](RideBookingRideOptionStatus, "statusWithApplication:", a3));
  objc_msgSend(v5, "setRideOptionStatusError:", a4);
  return (RideBookingRideOptionStatus *)v5;
}

+ (RideBookingRideOptionStatus)statusWithApplication:(id)a3 rideOptions:(id)a4 expirationDate:(id)a5 userActivity:(id)a6 rideOptionStatusError:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingRideOptionStatus statusWithApplication:](RideBookingRideOptionStatus, "statusWithApplication:", a3));
  objc_msgSend(v14, "setRideOptions:", v13);

  objc_msgSend(v14, "setExpirationDate:", v12);
  objc_msgSend(v14, "setUserActivity:", v11);

  objc_msgSend(v14, "setRideOptionStatusError:", a7);
  return (RideBookingRideOptionStatus *)v14;
}

- (id)description
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_application);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Application: %@\nRideOptions: %@\nExpiration Date: %@"), WeakRetained, self->_rideOptions, self->_expirationDate));

  return v4;
}

- (RideBookingApplication)application
{
  return (RideBookingApplication *)objc_loadWeakRetained((id *)&self->_application);
}

- (void)setApplication:(id)a3
{
  objc_storeWeak((id *)&self->_application, a3);
}

- (BOOL)loadingRideOptions
{
  return self->_loadingRideOptions;
}

- (void)setLoadingRideOptions:(BOOL)a3
{
  self->_loadingRideOptions = a3;
}

- (NSArray)rideOptions
{
  return self->_rideOptions;
}

- (void)setRideOptions:(id)a3
{
  objc_storeStrong((id *)&self->_rideOptions, a3);
}

- (unint64_t)rideOptionStatusError
{
  return self->_rideOptionStatusError;
}

- (void)setRideOptionStatusError:(unint64_t)a3
{
  self->_rideOptionStatusError = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_userActivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_rideOptions, 0);
  objc_destroyWeak((id *)&self->_application);
}

@end
