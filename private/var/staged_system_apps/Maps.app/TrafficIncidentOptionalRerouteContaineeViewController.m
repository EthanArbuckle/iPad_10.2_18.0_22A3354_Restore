@implementation TrafficIncidentOptionalRerouteContaineeViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (TrafficIncidentOptionalRerouteContaineeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TrafficIncidentOptionalRerouteContaineeViewController;
  return -[TrafficIncidentOptionalRerouteContaineeViewController initWithNibName:bundle:](&v5, "initWithNibName:bundle:", a3, a4);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TrafficIncidentOptionalRerouteContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "setPresentedModally:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentOptionalRerouteContaineeViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentOptionalRerouteContaineeViewController rerouteIncidentView](self, "rerouteIncidentView"));
  objc_msgSend(v4, "addSubview:", v5);

  -[TrafficIncidentOptionalRerouteContaineeViewController _setupConstraints](self, "_setupConstraints");
}

- (void)_setupConstraints
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
  _QWORD v19[3];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentOptionalRerouteContaineeViewController rerouteIncidentView](self, "rerouteIncidentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentOptionalRerouteContaineeViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v19[0] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentOptionalRerouteContaineeViewController rerouteIncidentView](self, "rerouteIncidentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentOptionalRerouteContaineeViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v19[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentOptionalRerouteContaineeViewController rerouteIncidentView](self, "rerouteIncidentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentOptionalRerouteContaineeViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v19[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (NavUserDecisionConfirmationView)rerouteIncidentView
{
  NavUserDecisionConfirmationView *rerouteIncidentView;
  NavUserDecisionConfirmationView *v4;
  NavUserDecisionConfirmationView *v5;

  rerouteIncidentView = self->_rerouteIncidentView;
  if (!rerouteIncidentView)
  {
    v4 = -[NavUserDecisionConfirmationView initWithFrame:]([NavUserDecisionConfirmationView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_rerouteIncidentView;
    self->_rerouteIncidentView = v4;

    -[NavUserDecisionConfirmationView setTranslatesAutoresizingMaskIntoConstraints:](self->_rerouteIncidentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[NavUserDecisionConfirmationView setDelegate:](self->_rerouteIncidentView, "setDelegate:", self);
    rerouteIncidentView = self->_rerouteIncidentView;
  }
  return rerouteIncidentView;
}

- (void)setIncidentAlert:(id)a3
{
  void *v5;
  MNTrafficIncidentAlert *v6;

  v6 = (MNTrafficIncidentAlert *)a3;
  if (self->_incidentAlert != v6)
  {
    objc_storeStrong((id *)&self->_incidentAlert, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentOptionalRerouteContaineeViewController rerouteIncidentView](self, "rerouteIncidentView"));
    +[NavTrafficIncidentViewComposer configureRerouteView:withTrafficIncidentAlert:](NavTrafficIncidentViewComposer, "configureRerouteView:withTrafficIncidentAlert:", v5, v6);

  }
}

- (void)setRerouteTimerProgress:(double)a3
{
  -[NavUserDecisionConfirmationView setCompletionProgress:](self->_rerouteIncidentView, "setCompletionProgress:", a3);
}

- (double)rerouteTimerProgress
{
  double result;

  -[NavUserDecisionConfirmationView completionProgress](self->_rerouteIncidentView, "completionProgress");
  return result;
}

- (void)setProgressBarHidden:(BOOL)a3
{
  -[NavUserDecisionConfirmationView setProgressBarHidden:](self->_rerouteIncidentView, "setProgressBarHidden:", a3);
}

- (BOOL)progressBarHidden
{
  return -[NavUserDecisionConfirmationView progressBarHidden](self->_rerouteIncidentView, "progressBarHidden");
}

- (double)heightForLayout:(unint64_t)a3
{
  double v3;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  v3 = -1.0;
  if (a3 == 5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentOptionalRerouteContaineeViewController rerouteIncidentView](self, "rerouteIncidentView"));
    objc_msgSend(v5, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v8, "bottomSafeOffset");
    v3 = v7 + v9;

  }
  return v3;
}

- (void)userDecisionConfirmationViewDidCancel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentOptionalRerouteContaineeViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "didTapRejectButtonOnTrafficIncidentAlertViewControllerTarget:", 739);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert originalRoute](self->_incidentAlert, "originalRoute"));
  if ((objc_msgSend(v5, "isEVRoute") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert originalRouteNavigability](self->_incidentAlert, "originalRouteNavigability"));
    v7 = objc_msgSend(v6, "isEvFeasible");

    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert alternateRoute](self->_incidentAlert, "alternateRoute"));

      if (!v8)
        return;
      v11 = (id)objc_claimAutoreleasedReturnValue(+[NavigationFeedbackCollector sharedFeedbackCollector](NavigationFeedbackCollector, "sharedFeedbackCollector"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert alternateRoute](self->_incidentAlert, "alternateRoute"));
      objc_msgSend(v11, "offeredEVRerouteWithAlternateRoute:wasAccepted:", v9, 0);
      goto LABEL_8;
    }
  }
  else
  {

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert analyticsMessage](self->_incidentAlert, "analyticsMessage"));

  v11 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  if (!v10)
  {
    objc_msgSend(v11, "captureUserAction:onTarget:eventValue:", 3061, 615, 0);
    goto LABEL_10;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert analyticsMessage](self->_incidentAlert, "analyticsMessage"));
  objc_msgSend(v11, "captureUserAction:onTarget:eventValue:", 3061, 401, v9);
LABEL_8:

LABEL_10:
}

- (void)userDecisionConfirmationViewDidConfirm:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentOptionalRerouteContaineeViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "didTapAcceptButtonOnTrafficIncidentAlertViewControllerTarget:", 739);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert originalRoute](self->_incidentAlert, "originalRoute"));
  if ((objc_msgSend(v5, "isEVRoute") & 1) == 0)
  {

    goto LABEL_6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert alternateRoute](self->_incidentAlert, "alternateRoute"));

  if (!v6)
  {
LABEL_6:
    v10 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert analyticsMessage](self->_incidentAlert, "analyticsMessage"));
    objc_msgSend(v10, "captureUserAction:onTarget:eventValue:", 3060, 401, v9);
    goto LABEL_7;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v7, "captureUserAction:onTarget:eventValue:", 6097, 615, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert alternateRoute](self->_incidentAlert, "alternateRoute"));
  if (!v8)
    return;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NavigationFeedbackCollector sharedFeedbackCollector](NavigationFeedbackCollector, "sharedFeedbackCollector"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert alternateRoute](self->_incidentAlert, "alternateRoute"));
  objc_msgSend(v10, "offeredEVRerouteWithAlternateRoute:wasAccepted:", v9, 0);
LABEL_7:

}

- (MNTrafficIncidentAlert)incidentAlert
{
  return self->_incidentAlert;
}

- (NavTrafficIncidentAlertViewControllerDelegate)delegate
{
  return (NavTrafficIncidentAlertViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setRerouteIncidentView:(id)a3
{
  objc_storeStrong((id *)&self->_rerouteIncidentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rerouteIncidentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_incidentAlert, 0);
}

@end
