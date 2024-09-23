@implementation ReservationErrorAlertController

- (void)viewWillAppear:(BOOL)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ReservationErrorAlertController;
  -[ReservationErrorAlertController viewWillAppear:](&v7, "viewWillAppear:", a3);
  v4 = -[ReservationErrorAlertController displayView](self, "displayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationErrorAlertController bookingSession](self, "bookingSession"));
  objc_msgSend(v5, "setCurrentView:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationErrorAlertController bookingSession](self, "bookingSession"));
  objc_msgSend(v6, "beginSessionIfNeeded");

}

- (RestaurantReservationAnalyticsBookingSession)bookingSession
{
  return self->_bookingSession;
}

- (void)setBookingSession:(id)a3
{
  objc_storeStrong((id *)&self->_bookingSession, a3);
}

- (int64_t)displayView
{
  return self->_displayView;
}

- (void)setDisplayView:(int64_t)a3
{
  self->_displayView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookingSession, 0);
}

@end
