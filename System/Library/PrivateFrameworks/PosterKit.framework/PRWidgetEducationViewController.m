@implementation PRWidgetEducationViewController

- (void)loadView
{
  PRWidgetEducationView *v3;

  v3 = objc_alloc_init(PRWidgetEducationView);
  -[PRWidgetEducationView setDelegate:](v3, "setDelegate:", self);
  -[PRWidgetEducationViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRWidgetEducationViewController;
  -[PRWidgetEducationViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PRWidgetEducationViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 2);
  -[PRWidgetEducationViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRWidgetEducationViewController;
  -[PRWidgetEducationViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[PRWidgetEducationViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)_updatePreferredContentSize
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[PRWidgetEducationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = 1148846080;
  LODWORD(v10) = 1112014848;
  objc_msgSend(v8, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", 420.0, *(double *)(MEMORY[0x1E0DC4FF8] + 8), v9, v10);
  v12 = v11;
  v14 = v13;

  -[PRWidgetEducationViewController setPreferredContentSize:](self, "setPreferredContentSize:", v12, v14);
}

- (void)widgetEducationViewDidDismiss:(id)a3
{
  -[PRWidgetEducationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

@end
