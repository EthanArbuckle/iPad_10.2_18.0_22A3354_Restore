@implementation PKDashboardTileContextViewController

- (PKDashboardTileContextViewController)initWithTileContext:(int64_t)a3 forPass:(id)a4 groupID:(id)a5 passView:(id)a6 overridesMaximumRows:(BOOL)a7
{
  _BOOL8 v7;
  id v13;
  id v14;
  id v15;
  PKDashboardPassTilesItemPresenter *v16;
  PKDashboardSectionDataSourceTileContext *v17;
  void *v18;
  void *v19;
  PKDashboardPassLinkedAppItemPresenter *v20;
  PKDashboardSectionDataSourceLinkedApp *v21;
  void *v22;
  PKDashboardSectionDataSourceLinkedApp *v23;
  PKSectionedDashboardDataSourceTileContext *v24;
  PKDashboardTileContextViewController *v25;
  PKDashboardTileContextViewController *v26;
  objc_super v28;

  v7 = a7;
  v13 = a4;
  v14 = a6;
  v15 = a5;
  v16 = -[PKDashboardPassTilesItemPresenter initWithPassView:]([PKDashboardPassTilesItemPresenter alloc], "initWithPassView:", v14);

  v17 = -[PKDashboardSectionDataSourceTileContext initWithTileContext:forPass:groupID:overridesMaximumRows:]([PKDashboardSectionDataSourceTileContext alloc], "initWithTileContext:forPass:groupID:overridesMaximumRows:", a3, v13, v15, v7);
  objc_storeStrong((id *)&self->_tileContextDataSource, v17);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v16, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v17, 0);
  if (a3 == 2)
  {
    v20 = -[PKDashboardPassLinkedAppItemPresenter initWithDelegate:]([PKDashboardPassLinkedAppItemPresenter alloc], "initWithDelegate:", self);
    objc_msgSend(v18, "addObject:", v20);

    v21 = [PKDashboardSectionDataSourceLinkedApp alloc];
    objc_msgSend(v13, "auxiliaryStoreIdentifiers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[PKDashboardSectionDataSourceLinkedApp initWithStoreIDs:applicationBundleIdentifiers:defaultLaunchURL:](v21, "initWithStoreIDs:applicationBundleIdentifiers:defaultLaunchURL:", v22, 0, 0);
    objc_msgSend(v19, "addObject:", v23);

  }
  v24 = -[PKSectionedDashboardDataSourceTileContext initWithSectionDataSources:]([PKSectionedDashboardDataSourceTileContext alloc], "initWithSectionDataSources:", v19);
  v28.receiver = self;
  v28.super_class = (Class)PKDashboardTileContextViewController;
  v25 = -[PKDashboardViewController initWithDataSource:presenters:layout:](&v28, sel_initWithDataSource_presenters_layout_, v24, v18, 0);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_pass, a4);
    v26->_context = a3;
  }

  return v26;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  int64_t context;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKDashboardTileContextViewController;
  -[PKDashboardViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[PKDashboardTileContextViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKDashboardViewController backgroundColor](PKDashboardViewController, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  context = self->_context;
  if (context == 3)
  {
    PKLocalizedTicketingString(CFSTR("ADDITIONAL_TICKET_INFO_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
LABEL_9:
      -[PKDashboardTileContextViewController setTitle:](self, "setTitle:", v9);

    }
  }
  else if (context == 2)
  {
    -[PKPass eventName](self->_pass, "eventName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      PKLocalizedTicketingString(CFSTR("EVENT_GUIDE_FALLBACK_TITLE"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    if (v9)
      goto LABEL_9;
  }
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  void *v2;
  char v3;

  -[PKPass nfcPayload](self->_pass, "nfcPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiresAuthentication") ^ 1;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileContextDataSource, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
