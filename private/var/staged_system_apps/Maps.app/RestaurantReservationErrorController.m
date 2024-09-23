@implementation RestaurantReservationErrorController

- (RestaurantReservationErrorController)initWithAppName:(id)a3 restaurantName:(id)a4 cancelAction:(id)a5 activityAction:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  RestaurantReservationErrorController *v14;
  NSString *v15;
  NSString *appName;
  NSString *v17;
  NSString *restaurantName;
  id v19;
  id cancelAction;
  id v21;
  id activityAction;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)RestaurantReservationErrorController;
  v14 = -[RestaurantReservationErrorController init](&v24, "init");
  if (v14)
  {
    v15 = (NSString *)objc_msgSend(v10, "copy");
    appName = v14->_appName;
    v14->_appName = v15;

    v17 = (NSString *)objc_msgSend(v11, "copy");
    restaurantName = v14->_restaurantName;
    v14->_restaurantName = v17;

    v19 = objc_retainBlock(v12);
    cancelAction = v14->_cancelAction;
    v14->_cancelAction = v19;

    v21 = objc_retainBlock(v13);
    activityAction = v14->_activityAction;
    v14->_activityAction = v21;

  }
  return v14;
}

- (id)alertControllerForAvailableBookingsResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 3;
  if (v6 && !v7)
    v9 = (uint64_t)objc_msgSend(v6, "code");
  if (+[RestaurantReservationErrorController shouldDisplayAlertForResponseWithAvailableBookingsIntentCode:](RestaurantReservationErrorController, "shouldDisplayAlertForResponseWithAvailableBookingsIntentCode:", v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationErrorController errorBodyForAvailableBookingsIntentCode:](self, "errorBodyForAvailableBookingsIntentCode:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v10, 1));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationErrorController alertActionsForAvailableBookingsIntentResponse:error:](self, "alertActionsForAvailableBookingsIntentResponse:error:", v6, v8, 0));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v11, "addAction:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i));
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)alertControllerForBookReservationResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 3;
  if (v6 && !v7)
    v9 = (uint64_t)objc_msgSend(v6, "code");
  if (+[RestaurantReservationErrorController shouldDisplayAlertForResponseWithBookReservationIntentCode:](RestaurantReservationErrorController, "shouldDisplayAlertForResponseWithBookReservationIntentCode:", v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationErrorController errorBodyForBookReservationIntentCode:](self, "errorBodyForBookReservationIntentCode:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v10, 1));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationErrorController alertActionsForBookReservationIntentResponse:error:](self, "alertActionsForBookReservationIntentResponse:error:", v6, v8, 0));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v11, "addAction:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i));
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)shouldDisplayAlertForResponseWithAvailableBookingsIntentCode:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 3;
}

+ (BOOL)shouldDisplayAlertForResponseWithBookReservationIntentCode:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 5;
}

- (id)punchOutAlertActionForIntentResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("reservation_error_continue_in_key"), CFSTR("localized string not found"), 0));

  v7 = objc_alloc((Class)NSString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationErrorController appName](self, "appName"));
  v9 = objc_msgSend(v7, "initWithFormat:", v6, v8);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1006E6E90;
  v13[3] = &unk_1011B0210;
  v13[4] = self;
  v14 = v4;
  v10 = v4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v9, 0, v13));

  return v11;
}

- (id)cancelAlertAction
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("reservation_error_cancel_key"), CFSTR("localized string not found"), 0));

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1006E6FA8;
  v7[3] = &unk_1011AD938;
  v7[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v4, 1, v7));

  return v5;
}

- (id)alertActionsForAvailableBookingsIntentResponse:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationErrorController punchOutAlertActionForIntentResponse:](self, "punchOutAlertActionForIntentResponse:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationErrorController cancelAlertAction](self, "cancelAlertAction"));
  if (v6 && !a4 && (char *)objc_msgSend(v6, "code") - 1 > (char *)2)
  {
    v9 = &__NSArray0__struct;
  }
  else
  {
    v11[0] = v7;
    v11[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  }

  return v9;
}

- (id)alertActionsForBookReservationIntentResponse:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char *v9;
  void **v10;
  uint64_t v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationErrorController punchOutAlertActionForIntentResponse:](self, "punchOutAlertActionForIntentResponse:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationErrorController cancelAlertAction](self, "cancelAlertAction"));
  if (v6 && !a4 && (v9 = (char *)objc_msgSend(v6, "code"), (unint64_t)(v9 - 3) >= 3))
  {
    if ((unint64_t)(v9 - 1) > 1)
    {
      v12 = &__NSArray0__struct;
      goto LABEL_6;
    }
    v16 = v8;
    v10 = &v16;
    v11 = 1;
  }
  else
  {
    v14 = v7;
    v15 = v8;
    v10 = &v14;
    v11 = 2;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, v11, v14, v15, v16));
LABEL_6:

  return v12;
}

- (id)errorBodyForAvailableBookingsIntentCode:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  if ((unint64_t)(a3 - 1) > 2)
  {
    v9 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("reservation_get_available_bookings_alert_body_error_failure_key"), CFSTR("localized string not found"), 0));

    v6 = objc_alloc((Class)NSString);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationErrorController restaurantName](self, "restaurantName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationErrorController appName](self, "appName"));
    v9 = objc_msgSend(v6, "initWithFormat:", v5, v7, v8);

  }
  return v9;
}

- (id)errorBodyForBookReservationIntentCode:(int64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  switch(a3)
  {
    case 1:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("reservation_book_reservation_alert_body_error_denied_key)");
      goto LABEL_6;
    case 2:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("reservation_book_reservation_alert_body_error_failed_key)");
LABEL_6:
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));

      v12 = objc_alloc((Class)NSString);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationErrorController restaurantName](self, "restaurantName"));
      v7 = objc_msgSend(v12, "initWithFormat:", v11, v13);
      goto LABEL_9;
    case 3:
    case 5:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("reservation_book_reservation_alert_body_error_failed_app_launch_key)");
      goto LABEL_8;
    case 4:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("reservation_book_reservation_alert_body_error_failed_credentials_key)");
LABEL_8:
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

      v14 = objc_alloc((Class)NSString);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationErrorController restaurantName](self, "restaurantName"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationErrorController appName](self, "appName"));
      v7 = objc_msgSend(v14, "initWithFormat:", v11, v13, v15);

LABEL_9:
      break;
    default:
      v7 = 0;
      break;
  }
  return v7;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)restaurantName
{
  return self->_restaurantName;
}

- (void)setRestaurantName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)cancelAction
{
  return self->_cancelAction;
}

- (void)setCancelAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)activityAction
{
  return self->_activityAction;
}

- (void)setActivityAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activityAction, 0);
  objc_storeStrong(&self->_cancelAction, 0);
  objc_storeStrong((id *)&self->_restaurantName, 0);
  objc_storeStrong((id *)&self->_appName, 0);
}

@end
