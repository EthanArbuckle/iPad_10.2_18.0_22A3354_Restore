@implementation RAPReportComposerDirectionInstructionsIncorrectViewController

- (RAPReportComposerDirectionInstructionsIncorrectViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9;
  RAPReportComposerDirectionInstructionsIncorrectViewController *v10;
  RAPReportComposerDirectionInstructionsIncorrectViewController *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RAPReportComposerDirectionInstructionsIncorrectViewController;
  v10 = -[RAPReportViewController initWithReport:question:completion:](&v13, "initWithReport:question:completion:", a3, v9, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_question, a4);
    -[RAPQuestion addObserver:changeHandler:](v11->_question, "addObserver:changeHandler:", v11, &stru_1011DEC98);
  }

  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RAPReportComposerDirectionInstructionsIncorrectViewController;
  -[RAPReportComposerDirectionInstructionsIncorrectViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerDirectionInstructionsIncorrectViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportViewController sendButtonItem](self, "sendButtonItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerDirectionInstructionsIncorrectViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  -[RAPReportComposerDirectionInstructionsIncorrectViewController setupInstructionview](self, "setupInstructionview");
}

- (void)_reloadTableViews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController tableView](self->_transitDirectionsListViewController, "tableView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController tableView](self->_transitDirectionsListViewController, "tableView"));
    objc_msgSend(v4, "reloadData");

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController tableView](self->_driveOrWalkDirectionsListViewController, "tableView"));

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController tableView](self->_driveOrWalkDirectionsListViewController, "tableView"));
    objc_msgSend(v6, "reloadData");

  }
}

- (int)analyticTarget
{
  return 1101;
}

- (void)setupInstructionview
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  RAPTransitDirectionsListViewController *v12;
  id *p_transitDirectionsListViewController;
  RAPTransitDirectionsListViewController *transitDirectionsListViewController;
  void *v15;
  void *v16;
  void *v17;
  RAPDirectionsStepsTableViewController *v18;
  RAPDirectionsStepsTableViewController *driveOrWalkDirectionsListViewController;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion parentQuestion](self->_question, "parentQuestion"));
  v4 = objc_opt_class(RAPDirectionsCategoryQuestion);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentQuestion"));
  v8 = objc_opt_class(RAPDirectionsWhichOneQuestion);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v48 = v9;

  v10 = v48;
  if (v48)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "routeFromRecording"));
    if (objc_msgSend(v11, "transportType") == 1)
    {
      v12 = -[TransitDirectionsListViewController initWithRoute:]([RAPTransitDirectionsListViewController alloc], "initWithRoute:", v11);
      p_transitDirectionsListViewController = (id *)&self->_transitDirectionsListViewController;
      transitDirectionsListViewController = self->_transitDirectionsListViewController;
      self->_transitDirectionsListViewController = v12;

      -[RAPTransitDirectionsListViewController setInstructionDelegate:](self->_transitDirectionsListViewController, "setInstructionDelegate:", self);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self->_transitDirectionsListViewController, "dataSource"));
      objc_msgSend(v15, "setOptions:", 0);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self->_transitDirectionsListViewController, "dataSource"));
      objc_msgSend(v16, "setAllowStepSelection:", 1);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self->_transitDirectionsListViewController, "dataSource"));
      objc_msgSend(v17, "setDelegate:", self);
    }
    else
    {
      v18 = objc_alloc_init(RAPDirectionsStepsTableViewController);
      p_transitDirectionsListViewController = (id *)&self->_driveOrWalkDirectionsListViewController;
      driveOrWalkDirectionsListViewController = self->_driveOrWalkDirectionsListViewController;
      self->_driveOrWalkDirectionsListViewController = v18;

      -[RAPDirectionsStepsTableViewController setInstructionDelegate:](self->_driveOrWalkDirectionsListViewController, "setInstructionDelegate:", self);
      -[DirectionsStepsTableViewController setRoute:](self->_driveOrWalkDirectionsListViewController, "setRoute:", v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self->_driveOrWalkDirectionsListViewController, "dataSource"));
      objc_msgSend(v20, "setDelegate:", self);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self->_driveOrWalkDirectionsListViewController, "dataSource"));
      objc_msgSend(v17, "setOptions:", 0);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_transitDirectionsListViewController, "tableView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerDirectionInstructionsIncorrectViewController tableViewHeaderView](self, "tableViewHeaderView"));
    objc_msgSend(v21, "setTableHeaderView:", v22);

    v23 = *p_transitDirectionsListViewController;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "view"));
    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerDirectionInstructionsIncorrectViewController view](self, "view"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "view"));
    objc_msgSend(v25, "addSubview:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "view"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerDirectionInstructionsIncorrectViewController view](self, "view"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v31));
    objc_msgSend(v27, "addObject:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "view"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "widthAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerDirectionInstructionsIncorrectViewController view](self, "view"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "widthAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v36));
    objc_msgSend(v27, "addObject:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "view"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerDirectionInstructionsIncorrectViewController view](self, "view"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "leadingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v41));
    objc_msgSend(v27, "addObject:", v42);

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "view"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "bottomAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerDirectionInstructionsIncorrectViewController view](self, "view"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "bottomAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v46));
    objc_msgSend(v27, "addObject:", v47);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);
    -[RAPReportComposerDirectionInstructionsIncorrectViewController addChildViewController:](self, "addChildViewController:", v23);
    objc_msgSend(v23, "didMoveToParentViewController:", self);

    v10 = v48;
  }

}

- (id)tableViewHeaderView
{
  RAPHeaderFooterView *v2;
  void *v3;
  void *v4;

  v2 = -[RAPHeaderFooterView initWithReuseIdentifier:]([RAPHeaderFooterView alloc], "initWithReuseIdentifier:", CFSTR("RAPHeaderFooterView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Instructions [Report a Problem]"), CFSTR("localized string not found"), 0));
  -[RAPHeaderFooterView setTitleLabelText:](v2, "setTitleLabelText:", v4);

  -[RAPHeaderFooterView systemLayoutSizeFittingSize:](v2, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  -[RAPHeaderFooterView frame](v2, "frame");
  -[RAPHeaderFooterView setFrame:](v2, "setFrame:");
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[RAPQuestion removeObserver:](self->_question, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)RAPReportComposerDirectionInstructionsIncorrectViewController;
  -[RAPReportComposerDirectionInstructionsIncorrectViewController dealloc](&v3, "dealloc");
}

- (BOOL)viewController:(id)a3 shouldShowFlagForStep:(id)a4 listItem:(id)a5
{
  return -[RAPDirectionInstructionsIncorrectQuestion hasCorrectionForRouteStep:transitListItem:](self->_question, "hasCorrectionForRouteStep:transitListItem:", a4, a5);
}

- (int)currentUITargetForAnalytics
{
  return 1102;
}

- (int)currentMapViewTargetForAnalytics
{
  return 0;
}

- (void)directionsStepsList:(id)a3 didTapRowForRouteStep:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RAPDirectionInstructionsIncorrectQuestion instructionCorrectionQuestionForStep:listItem:](self->_question, "instructionCorrectionQuestionForStep:listItem:", a4, 0));
  -[RAPReportComposerDirectionInstructionsIncorrectViewController presentDetailViewControllerForQuestion:](self, "presentDetailViewControllerForQuestion:", v5);

}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapRowForItem:(id)a4
{
  RAPDirectionInstructionsIncorrectQuestion *question;
  id v6;
  void *v7;
  id v8;

  question = self->_question;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "matchingRouteStep"));
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RAPDirectionInstructionsIncorrectQuestion instructionCorrectionQuestionForStep:listItem:](question, "instructionCorrectionQuestionForStep:listItem:", v7, v6));

  -[RAPReportComposerDirectionInstructionsIncorrectViewController presentDetailViewControllerForQuestion:](self, "presentDetailViewControllerForQuestion:", v8);
}

- (void)presentDetailViewControllerForQuestion:(id)a3
{
  id v4;
  void *v5;
  RAPReportComposerInstructionDetailViewController *v6;
  void *v7;
  void *v8;
  id v9;
  RAPReportComposerInstructionDetailViewController *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 10108, -[RAPReportComposerDirectionInstructionsIncorrectViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  v6 = [RAPReportComposerInstructionDetailViewController alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportViewController report](self, "report"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportViewController completion](self, "completion"));
  v10 = -[RAPReportComposerInstructionDetailViewController initWithReport:question:completion:](v6, "initWithReport:question:completion:", v7, v4, v8);

  v9 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v10);
  objc_msgSend(v9, "setModalPresentationStyle:", 2);
  objc_msgSend(v9, "setModalInPresentation:", 1);
  -[RAPReportComposerDirectionInstructionsIncorrectViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionsRequestsPart, 0);
  objc_storeStrong((id *)&self->_driveOrWalkDirectionsListViewController, 0);
  objc_storeStrong((id *)&self->_transitDirectionsListViewController, 0);
  objc_storeStrong((id *)&self->_question, 0);
}

@end
