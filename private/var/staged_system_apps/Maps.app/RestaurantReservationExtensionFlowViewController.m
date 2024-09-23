@implementation RestaurantReservationExtensionFlowViewController

- (RestaurantReservationExtensionFlowViewController)initWithRestaurantReservationRequester:(id)a3
{
  id v4;
  RestaurantReservationExtensionFlowViewController *v5;
  RestaurantReservationExtensionFlowViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RestaurantReservationExtensionFlowViewController;
  v5 = -[ExtensionFlowViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
    -[RestaurantReservationExtensionFlowViewController setReservationRequester:](v5, "setReservationRequester:", v4);

  return v6;
}

- (void)viewDidLoad
{
  RestaurantReservationRequestController *v3;
  void *v4;
  RestaurantReservationRequestController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RestaurantReservationExtensionFlowViewController;
  -[ExtensionFlowViewController viewDidLoad](&v10, "viewDidLoad");
  v3 = [RestaurantReservationRequestController alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationExtensionFlowViewController reservationRequester](self, "reservationRequester"));
  v5 = -[RestaurantReservationRequestController initWithFlowController:reservationRequester:](v3, "initWithFlowController:reservationRequester:", self, v4);
  -[RestaurantReservationExtensionFlowViewController setRestaurantRequestController:](self, "setRestaurantRequestController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationExtensionFlowViewController restaurantRequestController](self, "restaurantRequestController"));
  objc_msgSend(v6, "setDelegate:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationExtensionFlowViewController bookingSession](self, "bookingSession"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationExtensionFlowViewController restaurantRequestController](self, "restaurantRequestController"));
  objc_msgSend(v8, "setAnalyticsBookingSession:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationExtensionFlowViewController restaurantRequestController](self, "restaurantRequestController"));
  objc_msgSend(v9, "present");

}

- (void)willResignCurrent:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationExtensionFlowViewController restaurantRequestController](self, "restaurantRequestController"));
  objc_msgSend(v5, "willResignCurrent:", v3);

  v6.receiver = self;
  v6.super_class = (Class)RestaurantReservationExtensionFlowViewController;
  -[ContaineeViewController willResignCurrent:](&v6, "willResignCurrent:", v3);
}

- (void)restaurantReservationRequestControllerDidComplete:(id)a3 contentRefresh:(BOOL)a4
{
  void *v5;
  id v6;

  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionFlowViewController contentUpdateDelegate](self, "contentUpdateDelegate", a3));
    objc_msgSend(v5, "extensionContentDidChange");

  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  objc_msgSend(v6, "dismiss:", 1);

}

- (RestaurantReservationAnalyticsBookingSession)bookingSession
{
  return self->_bookingSession;
}

- (void)setBookingSession:(id)a3
{
  objc_storeStrong((id *)&self->_bookingSession, a3);
}

- (RestaurantReservationRequestController)restaurantRequestController
{
  return self->_restaurantRequestController;
}

- (void)setRestaurantRequestController:(id)a3
{
  objc_storeStrong((id *)&self->_restaurantRequestController, a3);
}

- (RestaurantReservationRequester)reservationRequester
{
  return self->_reservationRequester;
}

- (void)setReservationRequester:(id)a3
{
  objc_storeStrong((id *)&self->_reservationRequester, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservationRequester, 0);
  objc_storeStrong((id *)&self->_restaurantRequestController, 0);
  objc_storeStrong((id *)&self->_bookingSession, 0);
}

@end
