@implementation RAPReportComposerInstructionDetailViewController

- (RAPReportComposerInstructionDetailViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9;
  RAPReportComposerInstructionDetailViewController *v10;
  RAPReportComposerInstructionDetailViewController *v11;
  id *p_question;
  uint64_t v13;
  NSString *savedCorrectionText;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  RAPReportComposerInstructionDetailViewController *v24;
  objc_super v25;

  v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)RAPReportComposerInstructionDetailViewController;
  v10 = -[RAPReportTableViewController initWithReport:question:completion:](&v25, "initWithReport:question:completion:", a3, v9, a5);
  v11 = v10;
  if (v10)
  {
    p_question = (id *)&v10->_question;
    objc_storeStrong((id *)&v10->_question, a4);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*p_question, "comment"));
    savedCorrectionText = v11->_savedCorrectionText;
    v11->_savedCorrectionText = (NSString *)v13;

    v15 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, v11, "cancelCorrection");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerInstructionDetailViewController navigationItem](v11, "navigationItem"));
    objc_msgSend(v16, "setLeftBarButtonItem:", v15);

    v17 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, v11, "saveCorrection");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerInstructionDetailViewController navigationItem](v11, "navigationItem"));
    objc_msgSend(v18, "setRightBarButtonItem:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerInstructionDetailViewController navigationItem](v11, "navigationItem"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "rightBarButtonItem"));
    objc_msgSend(v20, "setEnabled:", 0);

    v21 = *p_question;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100393D94;
    v23[3] = &unk_1011B3860;
    v24 = v11;
    objc_msgSend(v21, "addObserver:changeHandler:", v24, v23);

  }
  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RAPReportComposerInstructionDetailViewController;
  -[RAPReportTableViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion parentQuestion](self->_question, "parentQuestion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerInstructionDetailViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setTitle:", v4);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RAPReportComposerInstructionDetailViewController;
  -[RAPReportComposerInstructionDetailViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v6, "willTransitionToTraitCollection:withTransitionCoordinator:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerInstructionDetailViewController tableView](self, "tableView"));
  objc_msgSend(v5, "reloadData");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RAPReportComposerInstructionDetailViewController;
  -[RAPReportComposerInstructionDetailViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerInstructionDetailViewController tableView](self, "tableView"));
  objc_msgSend(v5, "reloadData");

}

- (void)saveCorrection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportLocationSection imageDataOfMapAndInstructionsCell](self->_locationSection, "imageDataOfMapAndInstructionsCell"));
  -[RAPInstructionCorrectionQuestion setCellScreenshotImageData:](self->_question, "setCellScreenshotImageData:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 10105, 1102, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion parentQuestion](self->_question, "parentQuestion"));
  objc_msgSend(v5, "saveCorrection:", self->_question);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RAPReportComposerInstructionDetailViewController navigationController](self, "navigationController"));
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)cancelCorrection
{
  void *v3;
  id v4;

  -[RAPCommentQuestion setComment:](self->_question, "setComment:", self->_savedCorrectionText);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 10109, 1102, 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RAPReportComposerInstructionDetailViewController navigationController](self, "navigationController"));
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)tableParts
{
  id v3;
  void *v4;
  RAPReportLocationSection *v5;
  RAPReportLocationSection *locationSection;
  RAPTablePart *v7;
  void *v8;
  RAPTablePart *v9;
  RAPTablePart *locationPart;
  RAPReportComposerCommentPart *v11;
  RAPReportComposerCommentPart *commentPart;
  RAPReportLocationSection *v14;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController userInfoPart](self, "userInfoPart"));
  objc_msgSend(v3, "addObject:", v4);

  if (!self->_locationPart)
  {
    v5 = -[RAPReportLocationSection initWithQuestion:]([RAPReportLocationSection alloc], "initWithQuestion:", self->_question);
    locationSection = self->_locationSection;
    self->_locationSection = v5;

    v7 = [RAPTablePart alloc];
    v14 = self->_locationSection;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    v9 = -[RAPTablePart initWithSections:](v7, "initWithSections:", v8);
    locationPart = self->_locationPart;
    self->_locationPart = v9;

    objc_msgSend(v3, "addObject:", self->_locationPart);
  }
  if (!self->_commentPart)
  {
    v11 = -[RAPReportComposerCommentPart initWithCommentQuestion:]([RAPReportComposerCommentPart alloc], "initWithCommentQuestion:", self->_question);
    commentPart = self->_commentPart;
    self->_commentPart = v11;

    objc_msgSend(v3, "addObject:", self->_commentPart);
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationPart, 0);
  objc_storeStrong((id *)&self->_locationSection, 0);
  objc_storeStrong((id *)&self->_commentPart, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_savedCorrectionText, 0);
  objc_storeStrong((id *)&self->_question, 0);
}

@end
