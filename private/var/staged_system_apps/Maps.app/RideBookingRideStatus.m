@implementation RideBookingRideStatus

- (INRideStatus)intentsRideStatus
{
  return (INRideStatus *)objc_getAssociatedObject(self, &unk_100E34F50);
}

- (void)setIntentsRideStatus:(id)a3
{
  void *v4;
  id value;

  value = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  if ((objc_msgSend(v4, "isEqual:", value) & 1) == 0)
    objc_setAssociatedObject(self, &unk_100E34F50, value, (void *)3);

}

- (INGetRideStatusIntentResponse)getRideStatusIntentResponse
{
  return (INGetRideStatusIntentResponse *)objc_getAssociatedObject(self, &unk_100E34F51);
}

- (void)setGetRideStatusIntentResponse:(id)a3
{
  void *v4;
  id value;

  value = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus getRideStatusIntentResponse](self, "getRideStatusIntentResponse"));
  if ((objc_msgSend(v4, "isEqual:", value) & 1) == 0)
    objc_setAssociatedObject(self, &unk_100E34F51, value, (void *)3);

}

- (INRequestRideIntentResponse)requestRideIntentResponse
{
  return (INRequestRideIntentResponse *)objc_getAssociatedObject(self, &unk_100E34F52);
}

- (void)setRequestRideIntentResponse:(id)a3
{
  void *v4;
  id value;

  value = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus requestRideIntentResponse](self, "requestRideIntentResponse"));
  if ((objc_msgSend(v4, "isEqual:", value) & 1) == 0)
    objc_setAssociatedObject(self, &unk_100E34F52, value, (void *)3);

}

- (RideBookingRideStatus)initWithApplication:(id)a3 rideOption:(id)a4 canceled:(BOOL)a5 canceledByService:(BOOL)a6 userActivityForCanceling:(id)a7 identifier:(id)a8 phase:(unint64_t)a9 error:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  RideBookingRideStatus *v19;
  RideBookingRideStatus *v20;
  NSString *v21;
  NSString *identifier;
  id obj;
  objc_super v25;

  obj = a3;
  v16 = a4;
  v17 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)RideBookingRideStatus;
  v19 = -[RideBookingRideStatus init](&v25, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_application, obj);
    objc_storeStrong((id *)&v20->_rideOption, a4);
    v20->_rideStatusIsCanceled = a5;
    v20->_rideStatusIsCanceledByService = a6;
    v20->_phase = a9;
    v20->_rideStatusError = a10;
    v21 = (NSString *)objc_msgSend(v18, "copy");
    identifier = v20->_identifier;
    v20->_identifier = v21;

    objc_storeStrong((id *)&v20->_userActivityForCanceling, a7);
  }

  return v20;
}

+ (RideBookingRideStatus)statusWithApplication:(id)a3 error:(unint64_t)a4
{
  id v5;
  RideBookingRideStatus *v6;

  v5 = a3;
  v6 = -[RideBookingRideStatus initWithApplication:rideOption:canceled:canceledByService:userActivityForCanceling:identifier:phase:error:]([RideBookingRideStatus alloc], "initWithApplication:rideOption:canceled:canceledByService:userActivityForCanceling:identifier:phase:error:", v5, 0, 0, 0, 0, 0, 0, a4);

  return v6;
}

- (BOOL)isCanceledByUser
{
  return self->_rideStatusIsCanceled && !self->_rideStatusIsCanceledByService;
}

- (BOOL)isValidRide
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus identifier](self, "identifier"));
  v4 = v3
    && !-[RideBookingRideStatus isCanceledByUser](self, "isCanceledByUser")
    && -[RideBookingRideStatus phase](self, "phase") != 0;

  return v4;
}

- (BOOL)isActiveRide
{
  _BOOL4 v3;

  v3 = -[RideBookingRideStatus isValidRide](self, "isValidRide");
  if (v3)
    LOBYTE(v3) = (id)-[RideBookingRideStatus phase](self, "phase") != (id)4;
  return v3;
}

- (id)description
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_application);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RBRideStatus: %@\nIdentifier: %@"), WeakRetained, self->_identifier));

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

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(unint64_t)a3
{
  self->_phase = a3;
}

- (unint64_t)rideStatusError
{
  return self->_rideStatusError;
}

- (void)setRideStatusError:(unint64_t)a3
{
  self->_rideStatusError = a3;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_userActivity, a3);
}

- (NSUserActivity)userActivityForCanceling
{
  return self->_userActivityForCanceling;
}

- (NSUserActivity)userActivityForCompletedRide
{
  return self->_userActivityForCompletedRide;
}

- (BOOL)rideStatusIsCanceled
{
  return self->_rideStatusIsCanceled;
}

- (void)setRideStatusIsCanceled:(BOOL)a3
{
  self->_rideStatusIsCanceled = a3;
}

- (BOOL)rideStatusIsCanceledByService
{
  return self->_rideStatusIsCanceledByService;
}

- (void)setRideStatusIsCanceledByService:(BOOL)a3
{
  self->_rideStatusIsCanceledByService = a3;
}

- (RideBookingRideOption)rideOption
{
  return self->_rideOption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rideOption, 0);
  objc_storeStrong((id *)&self->_userActivityForCompletedRide, 0);
  objc_storeStrong((id *)&self->_userActivityForCanceling, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_application);
}

- (BOOL)shouldShowFeedbackControls
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "completionStatus"));
  if (objc_msgSend(v4, "isCompleted"))
  {
    if (-[RideBookingRideStatus shouldShowTippingOptions](self, "shouldShowTippingOptions"))
    {

      return 1;
    }
    v5 = -[RideBookingRideStatus shouldShowRatingOptions](self, "shouldShowRatingOptions");

    if ((v5 & 1) != 0)
      return 1;
  }
  else
  {

  }
  return 0;
}

- (BOOL)shouldShowTippingOptions
{
  return -[RideBookingRideStatus _showFeedbackType:](self, "_showFeedbackType:", 2);
}

- (BOOL)shouldShowRatingOptions
{
  return -[RideBookingRideStatus _showFeedbackType:](self, "_showFeedbackType:", 1);
}

- (BOOL)_showFeedbackType:(unint64_t)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completionStatus"));

  v6 = objc_msgSend(v5, "isCompleted") && ((unint64_t)objc_msgSend(v5, "feedbackType") & a3) != 0;
  return v6;
}

- (BOOL)_feedbackRequired
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "completionStatus"));
  if ((objc_msgSend(v4, "feedbackType") & 2) != 0)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "completionStatus"));
    v7 = (unint64_t)objc_msgSend(v6, "feedbackType") & 1;

  }
  return v7;
}

- (BOOL)isScheduledRide
{
  void *v3;
  void *v4;
  BOOL v5;

  if ((id)-[RideBookingRideStatus phase](self, "phase") != (id)2)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheduledPickupTime"));
  v5 = v4 != 0;

  return v5;
}

- (UIImage)templatedViewAppIcon
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus application](self, "application"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iconWithFormat:", 2));

  return (UIImage *)v3;
}

- (NSString)templatedViewTitle
{
  void *v3;
  id v4;
  __CFString *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = objc_msgSend(v3, "phase");

  switch((unint64_t)v4)
  {
    case 1uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _receivedTemplatedViewTitle](self, "_receivedTemplatedViewTitle"));
      break;
    case 2uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _confirmedTemplatedViewTitle](self, "_confirmedTemplatedViewTitle"));
      break;
    case 3uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _ongoingTemplatedViewTitle](self, "_ongoingTemplatedViewTitle"));
      break;
    case 4uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _completedTemplatedViewTitle](self, "_completedTemplatedViewTitle"));
      break;
    case 5uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _approachingPickupTemplatedViewTitle](self, "_approachingPickupTemplatedViewTitle"));
      break;
    case 6uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _pickupTemplatedViewTitle](self, "_pickupTemplatedViewTitle"));
      break;
    default:
      v5 = &stru_1011EB268;
      break;
  }
  return (NSString *)v5;
}

- (NSString)templatedViewSubtitle
{
  void *v3;
  id v4;
  __CFString *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = objc_msgSend(v3, "phase");

  switch((unint64_t)v4)
  {
    case 1uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _receivedTemplatedViewSubtitle](self, "_receivedTemplatedViewSubtitle"));
      break;
    case 2uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _confirmedTemplatedViewSubtitle](self, "_confirmedTemplatedViewSubtitle"));
      break;
    case 3uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _ongoingTemplatedViewSubtitle](self, "_ongoingTemplatedViewSubtitle"));
      break;
    case 4uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _completedTemplatedViewSubtitle](self, "_completedTemplatedViewSubtitle"));
      break;
    case 5uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _approachingPickupTemplatedViewSubtitle](self, "_approachingPickupTemplatedViewSubtitle"));
      break;
    case 6uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _pickupTemplatedViewSubtitle](self, "_pickupTemplatedViewSubtitle"));
      break;
    default:
      v5 = &stru_1011EB268;
      break;
  }
  return (NSString *)v5;
}

- (id)timeFormatter
{
  if (qword_1014D3810 != -1)
    dispatch_once(&qword_1014D3810, &stru_1011DAA00);
  return (id)qword_1014D3808;
}

- (id)_minuteStringForSeconds:(double)a3
{
  double v3;
  void *v4;
  void *v5;

  if (a3 >= 60.0)
    v3 = a3;
  else
    v3 = 60.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus timeFormatter](self, "timeFormatter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromTimeInterval:", v3));

  return v5;
}

- (id)_receivedTemplatedViewTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Requesting your %@ [Ridesharing]"), CFSTR("localized string not found"), 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Requesting ride proactive [Ridesharing-Default]"), CFSTR("localized string not found"), 0));
  }

  return v9;
}

- (id)_confirmedTemplatedViewTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "estimatedPickupDate"));

  if (v4)
  {
    objc_msgSend(v4, "timeIntervalSinceNow");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _minuteStringForSeconds:](self, "_minuteStringForSeconds:"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    if (v7)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Your %@ arrives in %@ [Ridesharing]"), CFSTR("localized string not found"), 0));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v12, v5));

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Your ride arrives in %@ [Ridesharing]"), CFSTR("localized string not found"), 0));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v5));
    }

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Your %@ arrives soon [Ridesharing]"), CFSTR("localized string not found"), 0));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, v18));

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Your ride arrives soon [Ridesharing]"), CFSTR("localized string not found"), 0));
    }
  }

  return v13;
}

- (id)_approachingPickupTemplatedViewTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Your %@ is arriving now [Ridesharing]"), CFSTR("localized string not found"), 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v8));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Your ride is arriving now [Ridesharing]"), CFSTR("localized string not found"), 0));
  }

  return v9;
}

- (id)_pickupTemplatedViewTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "estimatedPickupEndDate"));

  if (v4)
  {
    objc_msgSend(v4, "timeIntervalSinceNow");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _minuteStringForSeconds:](self, "_minuteStringForSeconds:"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    if (v7)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Your %@ departs in %@ [Ridesharing]"), CFSTR("localized string not found"), 0));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v12, v5));

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Your ride departs in %@ [Ridesharing]"), CFSTR("localized string not found"), 0));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v5));
    }

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Your %@ has arrived [Ridesharing]"), CFSTR("localized string not found"), 0));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, v18));

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Your ride has arrived [Ridesharing]"), CFSTR("localized string not found"), 0));
    }
  }

  return v13;
}

- (id)_ongoingTemplatedViewTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "estimatedDropOffDate"));

  if (v4)
  {
    objc_msgSend(v4, "timeIntervalSinceNow");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _minuteStringForSeconds:](self, "_minuteStringForSeconds:"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Ridesharing] You’ll arrive in %@"), CFSTR("localized string not found"), 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v5));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[Ridesharing] You’ll arrive soon"), CFSTR("localized string not found"), 0));
  }

  return v8;
}

- (id)_completedTemplatedViewTitle
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[RideBookingRideStatus _feedbackRequired](self, "_feedbackRequired"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _driverName](self, "_driverName"));
    v4 = objc_msgSend(v3, "length");

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ridesharing.tray.subtitle.completed.feedbackRequired.driverName"), CFSTR("localized string not found"), 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _driverName](self, "_driverName"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v8));
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ridesharing.templated.title.completed.feedbackRequired.rideName"), CFSTR("localized string not found"), 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v10));

    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _completedTrayTitle](self, "_completedTrayTitle"));
  }
  return v9;
}

- (id)_receivedTemplatedViewSubtitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Ridesharing] contacting nearby drivers..."), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)_confirmedTemplatedViewSubtitle
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "vehicle"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "registrationPlate"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vehicle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "manufacturer"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "vehicle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "model"));

  if (v8)
    v12 = v8;
  else
    v12 = v11;
  v13 = v12;
  if (v8 && v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("[Ridesharing] templated view vehicle make"), CFSTR("localized string not found"), 0));
    v16 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v8, v11));

    v13 = (__CFString *)v16;
  }
  if (v13 && v5)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("[Ridesharing] templated view vehicle details"), CFSTR("localized string not found"), 0));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v13, v5));

  }
  else
  {
    v20 = &stru_1011EB268;
    if (v5)
      v20 = v5;
    if (v13)
      v20 = v13;
    v19 = v20;
  }

  return v19;
}

- (id)_ongoingTemplatedViewSubtitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dropOffLocation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_geoMapItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));

  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Ridesharing] templated view ongoing subtitle"), CFSTR("localized string not found"), 0));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v5));

  }
  else
  {
    v8 = &stru_1011EB268;
  }

  return v8;
}

- (id)_completedTemplatedViewSubtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  __CFString *v21;
  void *v22;
  uint64_t v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "estimatedPickupDate"));

  if (-[RideBookingRideStatus _feedbackRequired](self, "_feedbackRequired"))
  {
    if (v4)
    {
      if (qword_1014D3820 != -1)
        dispatch_once(&qword_1014D3820, &stru_1011DAA20);
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D3818, "stringFromDate:", v4));
      v24 = 0;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar autoupdatingCurrentCalendar](NSCalendar, "autoupdatingCurrentCalendar"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar autoupdatingCurrentCalendar](NSCalendar, "autoupdatingCurrentCalendar"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timeZone"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_navigation_transitRelativeDateStringForDate:context:inTimeZone:outUsedFormat:", v4, 5, v8, &v24));

      v10 = MapsSuggestionsTimeZone();
      v11 = (id)objc_claimAutoreleasedReturnValue(v10);
      v12 = v4;
      v13 = v11;
      if (!v11)
      {
        v14 = MapsSuggestionsTimeZone();
        v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar autoupdatingCurrentCalendar](NSCalendar, "autoupdatingCurrentCalendar"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "componentsInTimeZone:fromDate:", v13, v12));

      v17 = objc_msgSend(v16, "hour");
      if (v17 == (id)13 || v17 == (id)1)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v19 = v18;
        v20 = CFSTR("Pickup date and time [Ridesharing] at 1");
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v19 = v18;
        v20 = CFSTR("Pickup date and time [Ridesharing] not at 1");
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", v20, CFSTR("localized string not found"), 0));

      v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v22, v9, v5));
    }
    else
    {
      v21 = &stru_1011EB268;
    }
  }
  else
  {
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _completedTraySubtitle](self, "_completedTraySubtitle"));
  }

  return v21;
}

- (NSString)trayTitle
{
  void *v3;
  id v4;
  __CFString *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = objc_msgSend(v3, "phase");

  switch((unint64_t)v4)
  {
    case 1uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _receivedTrayTitle](self, "_receivedTrayTitle"));
      break;
    case 2uLL:
      if (-[RideBookingRideStatus isScheduledRide](self, "isScheduledRide"))
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _scheduledTrayTitle](self, "_scheduledTrayTitle"));
      else
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _confirmedTrayTitle](self, "_confirmedTrayTitle"));
      break;
    case 3uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _ongoingTrayTitle](self, "_ongoingTrayTitle"));
      break;
    case 4uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _completedTrayTitle](self, "_completedTrayTitle"));
      break;
    case 5uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _approachingPickupTrayTitle](self, "_approachingPickupTrayTitle"));
      break;
    case 6uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _pickupTrayTitle](self, "_pickupTrayTitle"));
      break;
    default:
      v5 = &stru_1011EB268;
      break;
  }
  return (NSString *)v5;
}

- (id)_pickupAddress
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus pickupLocation](self, "pickupLocation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_geoMapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  return v4;
}

- (id)_destinationAddress
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus dropoffLocation](self, "dropoffLocation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_geoMapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  return v4;
}

- (NSString)traySubtitle
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = objc_msgSend(v3, "phase");

  switch((unint64_t)v4)
  {
    case 1uLL:
    case 2uLL:
      if (!-[RideBookingRideStatus isScheduledRide](self, "isScheduledRide"))
        goto LABEL_4;
      v5 = objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _scheduledTraySubtitle](self, "_scheduledTraySubtitle"));
      goto LABEL_13;
    case 3uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "estimatedDropOffDate"));

      if (!v12)
        goto LABEL_11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "estimatedDropOffDate"));
      objc_msgSend(v14, "timeIntervalSinceNow");
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _minuteStringForSeconds:](self, "_minuteStringForSeconds:"));

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("You’ll arrive in %@ [Ridesharing]");
      goto LABEL_9;
    case 4uLL:
      v5 = objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _completedTraySubtitle](self, "_completedTraySubtitle"));
LABEL_13:
      v10 = (__CFString *)v5;
      return (NSString *)v10;
    case 5uLL:
    case 6uLL:
LABEL_4:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _pickupAddress](self, "_pickupAddress"));
      if (objc_msgSend(v6, "length"))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("Pickup at %@ [Ridesharing]");
LABEL_9:
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, CFSTR("localized string not found"), 0));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v6));

      }
      else
      {
        v10 = &stru_1011EB268;
      }

      return (NSString *)v10;
    default:
LABEL_11:
      v10 = &stru_1011EB268;
      return (NSString *)v10;
  }
}

- (id)_scheduledTrayTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _destinationAddress](self, "_destinationAddress"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _pickupAddress](self, "_pickupAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));

  v7 = objc_msgSend(v3, "length");
  if (v6)
  {
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("%@ to %@ [Ridesharing]"), CFSTR("localized string not found"), 0));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
      v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v11, v3);
    }
    else
    {
      v15 = objc_msgSend(v4, "length");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v16;
      if (v15)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("%@ from %@ [Ridesharing]"), CFSTR("localized string not found"), 0));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
        v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v11, v4);
      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("%@ [Ridesharing]"), CFSTR("localized string not found"), 0));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
        v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v11, v19);
      }
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(v12);

  }
  else
  {
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Ride to %@ [Ridesharing]"), CFSTR("localized string not found"), 0));
      v14 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v3);
    }
    else
    {
      if (!objc_msgSend(v4, "length"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Ride"), CFSTR("localized string not found"), 0));
        goto LABEL_13;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Ride from %@ [Ridesharing]"), CFSTR("localized string not found"), 0));
      v14 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v4);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(v14);

  }
LABEL_13:

  return v17;
}

- (id)_receivedTrayTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Requesting %@ [Ridesharing]"), CFSTR("localized string not found"), 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Requesting ride [Ridesharing-Default]"), CFSTR("localized string not found"), 0));
  }

  return v9;
}

- (id)_confirmedTrayTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "estimatedPickupDate"));

  if (v4)
  {
    objc_msgSend(v4, "timeIntervalSinceNow");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _minuteStringForSeconds:](self, "_minuteStringForSeconds:"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    if (v7)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("%@ arrives in %@ [Ridesharing]"), CFSTR("localized string not found"), 0));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v12, v5));

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Ride arrives in %@ [Ridesharing]"), CFSTR("localized string not found"), 0));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v5));
    }

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("%@ arrives soon [Ridesharing]"), CFSTR("localized string not found"), 0));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, v18));

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Ride arrives soon [Ridesharing]"), CFSTR("localized string not found"), 0));
    }
  }

  return v13;
}

- (id)_approachingPickupTrayTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("%@ is arriving [Ridesharing]"), CFSTR("localized string not found"), 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v8));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Ride is arriving [Ridesharing]"), CFSTR("localized string not found"), 0));
  }

  return v9;
}

- (id)_pickupTrayTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "estimatedPickupEndDate"));

  if (v4)
  {
    objc_msgSend(v4, "timeIntervalSinceNow");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _minuteStringForSeconds:](self, "_minuteStringForSeconds:"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    if (v7)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("%@ departs in %@ [Ridesharing]"), CFSTR("localized string not found"), 0));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v12, v5));

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Ride departs in %@ [Ridesharing]"), CFSTR("localized string not found"), 0));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v5));
    }

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("%@ has arrived [Ridesharing]"), CFSTR("localized string not found"), 0));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, v18));

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Ride has arrived [Ridesharing]"), CFSTR("localized string not found"), 0));
    }
  }

  return v13;
}

- (id)_ongoingTrayTitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _destinationAddress](self, "_destinationAddress"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_msgSend(v3, "length");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("%@ to %@ [Ridesharing]"), CFSTR("localized string not found"), 0));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v11, v3));

      goto LABEL_10;
    }
  }
  else
  {

  }
  if (objc_msgSend(v3, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Ride to %@ [Ridesharing]"), CFSTR("localized string not found"), 0));
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v3));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    if (!v14)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Current ride [Ridesharing]"), CFSTR("localized string not found"), 0));

      v9 = 0;
      goto LABEL_10;
    }
    v13 = v14;
    v9 = v13;
  }
  v12 = v13;
LABEL_10:

  return v12;
}

- (id)_completedTrayTitle
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "completionStatus"));
  v5 = objc_msgSend(v4, "isCanceled");

  if (!v5)
  {
    if (-[RideBookingRideStatus _feedbackRequired](self, "_feedbackRequired"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("ridesharing.tray.title.completed.feedbackRequired");
      goto LABEL_8;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));

    if (v12)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("%@ is complete [Ridesharing]");
      goto LABEL_8;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v17;
    v18 = CFSTR("The current ride is complete [Ridesharing]");
LABEL_11:
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v18, CFSTR("localized string not found"), 0));
    goto LABEL_12;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));

  if (!v7)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v17;
    v18 = CFSTR("The current ride was canceled [Ridesharing]");
    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = v8;
  v10 = CFSTR("%@ was canceled [Ridesharing]");
LABEL_8:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v15));

LABEL_12:
  return v16;
}

- (id)_scheduledTraySubtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  NSString *v45;
  void *v46;
  uint64_t v48;
  uint64_t v49;

  if (qword_1014D3830 != -1)
    dispatch_once(&qword_1014D3830, &stru_1011DAA40);
  objc_msgSend((id)qword_1014D3828, "setTimeStyle:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
  objc_msgSend((id)qword_1014D3828, "setLocale:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus scheduledPickupWindowStartDateComponents](self, "scheduledPickupWindowStartDateComponents"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeZone"));
  objc_msgSend((id)qword_1014D3828, "setTimeZone:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar autoupdatingCurrentCalendar](NSCalendar, "autoupdatingCurrentCalendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus scheduledPickupWindowStartDateComponents](self, "scheduledPickupWindowStartDateComponents"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateFromComponents:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D3828, "stringFromDate:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus scheduledPickupWindowStartDateComponents](self, "scheduledPickupWindowStartDateComponents"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timeZone"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "abbreviation"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar autoupdatingCurrentCalendar](NSCalendar, "autoupdatingCurrentCalendar"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "timeZone"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus scheduledPickupWindowStartDateComponents](self, "scheduledPickupWindowStartDateComponents"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "timeZone"));
  v17 = objc_msgSend(v14, "isEqualToTimeZone:", v16);

  if (v17)
  {

    v12 = 0;
  }
  v49 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar autoupdatingCurrentCalendar](NSCalendar, "autoupdatingCurrentCalendar"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus scheduledPickupWindowStartDateComponents](self, "scheduledPickupWindowStartDateComponents"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "timeZone"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_navigation_transitRelativeDateStringForDate:context:inTimeZone:outUsedFormat:", v8, 5, v20, &v49));

  if (v12)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus scheduledPickupWindowStartDateComponents](self, "scheduledPickupWindowStartDateComponents"));
    v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "timeZone"));
    v24 = v8;
    v25 = v23;
    if (!v23)
    {
      v26 = MapsSuggestionsTimeZone();
      v25 = (void *)objc_claimAutoreleasedReturnValue(v26);
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar autoupdatingCurrentCalendar](NSCalendar, "autoupdatingCurrentCalendar"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "componentsInTimeZone:fromDate:", v25, v24));

    v29 = objc_msgSend(v28, "hour");
    if (v29 == (id)13 || v29 == (id)1)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v31 = v30;
      v32 = CFSTR("Pickup %@ at %@ %@ [Ridesharing] at 1 O'clock");
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v31 = v30;
      v32 = CFSTR("Pickup %@ at %@ %@ [Ridesharing]");
    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", v32, CFSTR("localized string not found"), 0));

    v45 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v44, v21, v9, v12);
  }
  else
  {
    v33 = MapsSuggestionsTimeZone();
    v34 = (id)objc_claimAutoreleasedReturnValue(v33);
    v35 = v8;
    v36 = v34;
    if (!v34)
    {
      v37 = MapsSuggestionsTimeZone();
      v36 = (void *)objc_claimAutoreleasedReturnValue(v37);
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar autoupdatingCurrentCalendar](NSCalendar, "autoupdatingCurrentCalendar"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "componentsInTimeZone:fromDate:", v36, v35));

    v40 = objc_msgSend(v39, "hour");
    if (v40 == (id)13 || v40 == (id)1)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v42 = v41;
      v43 = CFSTR("Pickup date and time [Ridesharing] at 1 O'clock");
    }
    else
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v42 = v41;
      v43 = CFSTR("Pickup date and time [Ridesharing] not at 1");
    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "localizedStringForKey:value:table:", v43, CFSTR("localized string not found"), 0));

    v45 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v44, v21, v9, v48);
  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);

  return v46;
}

- (id)_completedTraySubtitle
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  __CFString *v12;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "completionStatus"));
  v5 = objc_msgSend(v4, "isMissedPickup");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("Driver has departed proactive [Ridesharing]");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "completionStatus"));
    v11 = objc_msgSend(v10, "isCanceled");

    if (!v11)
    {
      if (-[RideBookingRideStatus _feedbackRequired](self, "_feedbackRequired"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _driverName](self, "_driverName"));
        v15 = objc_msgSend(v14, "length");

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ridesharing.tray.subtitle.completed.feedbackRequired.driverName"), CFSTR("localized string not found"), 0));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _driverName](self, "_driverName"));
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v18));

          return v12;
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "estimatedPickupDate"));

        if (!v7)
        {
          v12 = &stru_1011EB268;
          goto LABEL_6;
        }
        if (qword_1014D3840 != -1)
          dispatch_once(&qword_1014D3840, &stru_1011DAA60);
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar autoupdatingCurrentCalendar](NSCalendar, "autoupdatingCurrentCalendar"));
        v28 = objc_msgSend(v27, "isDateInToday:", v7);

        if (!v28)
        {
          v46 = 0;
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar autoupdatingCurrentCalendar](NSCalendar, "autoupdatingCurrentCalendar"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar autoupdatingCurrentCalendar](NSCalendar, "autoupdatingCurrentCalendar"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "timeZone"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "_navigation_transitRelativeDateStringForDate:context:inTimeZone:outUsedFormat:", v7, 5, v42, &v46));

          v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("ridesharing.completed.feedbackRequired.rideDay"), CFSTR("localized string not found"), 0));
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v45, v43));

          goto LABEL_6;
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D3838, "stringFromDate:", v7));
        v29 = MapsSuggestionsTimeZone();
        v30 = (id)objc_claimAutoreleasedReturnValue(v29);
        v31 = v7;
        v32 = v30;
        if (!v30)
        {
          v33 = MapsSuggestionsTimeZone();
          v32 = (void *)objc_claimAutoreleasedReturnValue(v33);
        }
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar autoupdatingCurrentCalendar](NSCalendar, "autoupdatingCurrentCalendar"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "componentsInTimeZone:fromDate:", v32, v31));

        v36 = objc_msgSend(v35, "hour");
        if (v36 == (id)13 || v36 == (id)1)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v38 = v37;
          v39 = CFSTR("ridesharing.completed.feedbackRequired.rideTime at 1 O'clock");
        }
        else
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v38 = v37;
          v39 = CFSTR("ridesharing.completed.feedbackRequired.rideTime");
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", v39, CFSTR("localized string not found"), 0));

        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v22, v21));
      }
      else
      {
        if (!-[RideBookingRideStatus _shouldShowPayment](self, "_shouldShowPayment"))
        {
          v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v7 = v6;
          v8 = CFSTR("Arrived proactive [Ridesharing]");
          goto LABEL_5;
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "completionStatus"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "paymentAmount"));

        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Total fare is %@ proactive [Ridesharing]"), CFSTR("localized string not found"), 0));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "amount"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currencyCode"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_formattedStringForPriceValueWithAmount:currencyCode:](NSString, "_navigation_formattedStringForPriceValueWithAmount:currencyCode:", v23, v24));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v22, v25));

      }
      goto LABEL_6;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("Trip was canceled proactive [Ridesharing]");
  }
LABEL_5:
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, CFSTR("localized string not found"), 0));
LABEL_6:

  return v12;
}

- (NSString)bannerAttributionTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus application](self, "application"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[ridesharing] banner view attribution"), CFSTR("localized string not found"), 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus application](self, "application"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v8));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[ridesharing] banner view attribution no app name"), CFSTR("localized string not found"), 0));
  }

  return (NSString *)v9;
}

- (UIImage)cardIcon
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus application](self, "application"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iconWithFormat:", 0));

  return (UIImage *)v3;
}

- (NSString)cardTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));

  return (NSString *)v3;
}

- (NSString)cardSubtitle
{
  void *v3;
  id v4;
  __CFString *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = objc_msgSend(v3, "phase");

  switch((unint64_t)v4)
  {
    case 1uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _receivedCardSubtitle](self, "_receivedCardSubtitle"));
      break;
    case 2uLL:
      if (-[RideBookingRideStatus isScheduledRide](self, "isScheduledRide"))
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _scheduledCardSubtitle](self, "_scheduledCardSubtitle"));
      else
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _confirmedCardSubtitle](self, "_confirmedCardSubtitle"));
      break;
    case 3uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _ongoingCardSubtitle](self, "_ongoingCardSubtitle"));
      break;
    case 4uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _completedCardSubtitle](self, "_completedCardSubtitle"));
      break;
    case 5uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _approachingPickupCardSubtitle](self, "_approachingPickupCardSubtitle"));
      break;
    case 6uLL:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _pickupCardSubtitle](self, "_pickupCardSubtitle"));
      break;
    default:
      v5 = &stru_1011EB268;
      break;
  }
  return (NSString *)v5;
}

- (NSString)cardTertiaryTitle
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = (unint64_t)objc_msgSend(v3, "phase");

  v5 = &stru_1011EB268;
  if (v4 <= 6)
  {
    if (((1 << v4) & 0x6E) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "priceRange"));

    }
    else if (v4 == 4)
    {
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _completedCardTertiaryTitle](self, "_completedCardTertiaryTitle"));
    }
  }
  return (NSString *)v5;
}

- (RidesharingSpecialPricingBadge)cardFormattedPriceRangeBadge
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "specialPricingBadge"));

  return (RidesharingSpecialPricingBadge *)v3;
}

- (NSString)cardDisclaimer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Route, fares, and waits are estimates and may vary due to traffic, weather, or other factors."), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (NSArray)cardFareLineItems
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus rideOption](self, "rideOption"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "intentsRideOption"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RidesharingFareLineItem _fareItemsFromRideOption:](RidesharingFareLineItem, "_fareItemsFromRideOption:", v3));

  return (NSArray *)v4;
}

- (id)_receivedCardSubtitle
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "estimatedPickupDate"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "estimatedPickupDate"));
    objc_msgSend(v8, "timeIntervalSinceNow");
    v10 = round(v9 / 60.0);
    v11 = 1.0;
    if (v10 >= 1.0)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus", 1.0));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "estimatedPickupDate"));
      objc_msgSend(v3, "timeIntervalSinceNow");
      v11 = round(v12 / 60.0);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _maps_ridesharingETA:partySize:](NSString, "_maps_ridesharingETA:partySize:", v13, 0));

    if (v10 >= 1.0)
    {

    }
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _maps_ridesharingETA:partySize:](NSString, "_maps_ridesharingETA:partySize:", 0, 0));
  }

  return v14;
}

- (id)_scheduledCardSubtitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "scheduledPickupTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDateComponents"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _maps_ridesharingScheduledPickupWindowStart:partySize:](NSString, "_maps_ridesharingScheduledPickupWindowStart:partySize:", v4, 0));

  return v5;
}

- (id)_ongoingCardSubtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "estimatedDropOffDate"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "estimatedDropOffDate"));
    objc_msgSend(v6, "timeIntervalSinceNow");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus _minuteStringForSeconds:](self, "_minuteStringForSeconds:"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Arriving in %@ card subtitle [Ridesharing]"), CFSTR("localized string not found"), 0));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v7));

  }
  else
  {
    v10 = &stru_1011EB268;
  }
  return v10;
}

- (id)_completedCardSubtitle
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "completionStatus"));
  v5 = objc_msgSend(v4, "isMissedPickup");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("Driver has departed card [Ridesharing]");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "completionStatus"));
    v11 = objc_msgSend(v10, "isCanceled");

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    if (v11)
      v8 = CFSTR("Trip was canceled card [Ridesharing]");
    else
      v8 = CFSTR("Trip is complete card [Ridesharing]");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, CFSTR("localized string not found"), 0));

  return v12;
}

- (id)_completedCardTertiaryTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;

  if (-[RideBookingRideStatus _shouldShowPayment](self, "_shouldShowPayment"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "completionStatus"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "paymentAmount"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Total fare is card %@ [Ridesharing]"), CFSTR("localized string not found"), 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "amount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currencyCode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_formattedStringForPriceValueWithAmount:currencyCode:](NSString, "_navigation_formattedStringForPriceValueWithAmount:currencyCode:", v8, v9));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v10));

  }
  else
  {
    v11 = &stru_1011EB268;
  }
  return v11;
}

- (NSArray)cardActions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "additionalActionActivities"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1008C0130;
  v8[3] = &unk_1011DAA88;
  v8[4] = self;
  v5 = sub_10039DCD4(v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSArray *)v6;
}

- (NSString)cardRideCompletedActionButtonTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "completionStatus"));

  if (objc_msgSend(v4, "isCompleted")
    && objc_msgSend(v4, "isOutstanding")
    && -[RideBookingRideStatus _shouldShowPayment](self, "_shouldShowPayment"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[ridesharing] pay %@ now"), CFSTR("localized string not found"), 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "paymentAmount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "amount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "paymentAmount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currencyCode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_formattedStringForPriceValueWithAmount:currencyCode:showsCurrencySymbol:](NSString, "_navigation_formattedStringForPriceValueWithAmount:currencyCode:showsCurrencySymbol:", v8, v10, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v11));

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus application](self, "application"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[ridesharing] view in %@"), CFSTR("localized string not found"), 0));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus application](self, "application"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v17));

    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[ridesharing] view in app"), CFSTR("localized string not found"), 0));
    }
  }

  return (NSString *)v12;
}

- (BOOL)_shouldShowPayment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "completionStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "paymentAmount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "amount"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "completionStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "paymentAmount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currencyCode"));

  if (v6)
    v11 = objc_msgSend(v6, "compare:", &off_10126FA90) == (id)1;
  else
    v11 = 0;
  if (v6)
    v12 = v10 == 0;
  else
    v12 = 1;
  v13 = !v12 && v11;

  return v13;
}

- (NSString)openInAppCommandTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus application](self, "application"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Open in %@ [Ridesharing]"), CFSTR("localized string not found"), 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus application](self, "application"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Open in app [Ridesharing]"), CFSTR("localized string not found"), 0));
  }

  return (NSString *)v9;
}

- (NSString)cancelCommandTitle
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = objc_msgSend(v3, "phase");

  switch((unint64_t)v4)
  {
    case 0uLL:
    case 4uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("[Ridesharing] cancel button");
      goto LABEL_7;
    case 1uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Cancel Request");
      goto LABEL_7;
    case 2uLL:
      if (!-[RideBookingRideStatus isScheduledRide](self, "isScheduledRide"))
        goto LABEL_2;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Cancel Scheduled Ride");
      goto LABEL_7;
    case 3uLL:
    case 5uLL:
    case 6uLL:
LABEL_2:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Cancel Ride");
LABEL_7:
      v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));

      break;
    default:
      return (NSString *)v4;
  }
  return (NSString *)v4;
}

- (NSString)contactCommandTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Contact Driver"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (NSString)driverPhoneNumber
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "driver"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "phoneNumber"));

  return (NSString *)v4;
}

- (UIImage)driverImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy imageCache](RideBookingAccessProxy, "imageCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "driver"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "image"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageForKey:", v7));

  return (UIImage *)v8;
}

- (id)_driverName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "driver"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nameComponents"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "driver"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nameComponents"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:style:options:](NSPersonNameComponentsFormatter, "localizedStringFromPersonNameComponents:style:options:", v8, 0, 0));

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (CLLocation)vehicleLocation
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "vehicle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "location"));

  return (CLLocation *)v4;
}

- (UIImage)vehicleImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy imageCache](RideBookingAccessProxy, "imageCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vehicle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapAnnotationImage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageForKey:", v7));

  return (UIImage *)v8;
}

- (CLPlacemark)pickupLocation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pickupLocation"));

  return (CLPlacemark *)v3;
}

- (CLPlacemark)dropoffLocation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dropOffLocation"));

  return (CLPlacemark *)v3;
}

- (NSDateComponents)scheduledPickupWindowStartDateComponents
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "scheduledPickupTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDateComponents"));

  return (NSDateComponents *)v4;
}

- (NSNumber)pickupETAMinutes
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;

  v2 = (uint64_t)self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "estimatedPickupDate"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v2, "intentsRideStatus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "estimatedPickupDate"));
    objc_msgSend(v6, "timeIntervalSinceNow");
    if (round(v7 / 60.0) < 1.0)
    {
      v2 = 1;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v2, "intentsRideStatus"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "estimatedPickupDate"));
      objc_msgSend(v9, "timeIntervalSinceNow");
      LODWORD(v2) = vcvtad_u64_f64(v10 / 60.0);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2));
  }
  else
  {
    v11 = 0;
  }
  return (NSNumber *)v11;
}

- (NSDate)estimatedDropOffDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "estimatedDropOffDate"));

  return (NSDate *)v3;
}

- (NSArray)tippingOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "completionStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultTippingOptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
  v7 = sub_10039DCD4(v6, &stru_1011DAAC8);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "completionStatus"));
  if (objc_msgSend(v10, "isCompleted")
    && -[RideBookingRideStatus shouldShowTippingOptions](self, "shouldShowTippingOptions"))
  {
    v11 = objc_msgSend(v8, "count");

    if (v11)
      v11 = v8;
  }
  else
  {

    v11 = 0;
  }

  return (NSArray *)v11;
}

- (NSArray)intentResponseFailures
{
  NSMutableArray *v3;
  void *v4;
  unint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  double latitude;
  double longitude;
  double v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  CLLocationCoordinate2D v33;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_opt_new(GEORideBookingIntentResponseFailure);
  objc_msgSend(v4, "setIntent:", 4);
  objc_msgSend(v4, "setFailure:", 0);
  v5 = -[RideBookingRideStatus rideStatusError](self, "rideStatusError");
  if (v5 <= 8 && ((0x1FDu >> v5) & 1) != 0)
    objc_msgSend(v4, "setFailure:", dword_100E3C590[v5]);
  if (objc_msgSend(v4, "failure"))
  {
    v6 = objc_msgSend(v4, "copy");
    -[NSMutableArray addObject:](v3, "addObject:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rideIdentifier"));

  if (!v8)
  {
    objc_msgSend(v4, "setFailure:", 13);
    v9 = objc_msgSend(v4, "copy");
    -[NSMutableArray addObject:](v3, "addObject:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rideOption"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
  v13 = objc_msgSend(v12, "length");

  if (!v13)
  {
    objc_msgSend(v4, "setFailure:", 11);
    v14 = objc_msgSend(v4, "copy");
    -[NSMutableArray addObject:](v3, "addObject:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "estimatedPickupDate"));

  if (!v16)
  {
    objc_msgSend(v4, "setFailure:", 12);
    v17 = objc_msgSend(v4, "copy");
    -[NSMutableArray addObject:](v3, "addObject:", v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "vehicle"));
  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "location"));
  v21 = v20;
  if (!v20)
    goto LABEL_21;
  objc_msgSend(v20, "coordinate");
  latitude = v33.latitude;
  longitude = v33.longitude;
  if (!CLLocationCoordinate2DIsValid(v33))
    goto LABEL_21;
  v24 = -latitude;
  if (latitude >= 0.0)
    v24 = latitude;
  if (v24 <= 2.22044605e-16)
  {
LABEL_21:

LABEL_22:
    objc_msgSend(v4, "setFailure:", 17);
    v25 = objc_msgSend(v4, "copy");
    -[NSMutableArray addObject:](v3, "addObject:", v25);

    goto LABEL_23;
  }
  if (longitude < 0.0)
    longitude = -longitude;

  if (longitude <= 2.22044605e-16)
    goto LABEL_22;
LABEL_23:
  v26 = objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
  if (v26)
  {
    v27 = (void *)v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideStatus intentsRideStatus](self, "intentsRideStatus"));
    v29 = objc_msgSend(v28, "phase");

    if (!v29)
    {
      objc_msgSend(v4, "setFailure:", 14);
      v30 = objc_msgSend(v4, "copy");
      -[NSMutableArray addObject:](v3, "addObject:", v30);

    }
  }
  v31 = -[NSMutableArray copy](v3, "copy");

  return (NSArray *)v31;
}

@end
