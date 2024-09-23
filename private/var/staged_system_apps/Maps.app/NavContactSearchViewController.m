@implementation NavContactSearchViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSOrderedSet *v9;
  NSOrderedSet *activeContactsValues;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NavContactSearchViewController;
  -[ContactSearchViewController viewDidLoad](&v11, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "setBlurInCardView:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("NavigationMaterialColor")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "setCardColor:", v4);

  v6 = objc_alloc((Class)NSOrderedSet);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "receivers"));
  v9 = (NSOrderedSet *)objc_msgSend(v6, "initWithArray:", v8);
  activeContactsValues = self->_activeContactsValues;
  self->_activeContactsValues = v9;

}

- (void)loadContaineeHeaderView
{
  ModalCardHeaderView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ModalCardHeaderView *v13;

  v3 = [ModalCardHeaderView alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ModalCardHeaderConfiguration leadingNavigationModalCardHeaderCompactConfiguration](ModalCardHeaderConfiguration, "leadingNavigationModalCardHeaderCompactConfiguration"));
  v13 = -[ModalCardHeaderView initWithConfiguration:](v3, "initWithConfiguration:", v4);

  -[ModalCardHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[SharedETA] Contacts Title"), CFSTR("localized string not found"), 0));
  -[ModalCardHeaderView setTitle:](v13, "setTitle:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](v13, "trailingButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[SharedETA] Contacts cancel button"), CFSTR("localized string not found"), 0));
  objc_msgSend(v7, "setTitle:forState:", v9, 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](v13, "trailingButton"));
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, "_cancelAction:", 64);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView bottomHairline](v13, "bottomHairline"));
  objc_msgSend(v11, "setAlpha:", 0.0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavContactSearchViewController view](self, "view"));
  objc_msgSend(v12, "addSubview:", v13);

  -[ContactSearchViewController setTitleHeaderView:](self, "setTitleHeaderView:", v13);
}

- (void)_contactValuesSelected:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController suggestionDataSource](self, "suggestionDataSource"));
  objc_msgSend(v5, "toggleContact:", v4);

  -[ContaineeViewController handleDismissAction:](self, "handleDismissAction:", 0);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController contactValues](self, "contactValues"));
  v7 = objc_msgSend(v5, "row");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));
  LOBYTE(self) = !-[NSOrderedSet containsObject:](self->_activeContactsValues, "containsObject:", v8);

  return (char)self;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSearchViewController contactValues](self, "contactValues"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));

  v14.receiver = self;
  v14.super_class = (Class)NavContactSearchViewController;
  v10 = -[ContactSearchViewController tableView:cellForRowAtIndexPath:](&v14, "tableView:cellForRowAtIndexPath:", v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (-[NSOrderedSet containsObject:](self->_activeContactsValues, "containsObject:", v9))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v11, "setCapabilityColor:", v12);

  }
  return v11;
}

- (NavActionCoordination)navActionCoordinator
{
  return (NavActionCoordination *)objc_loadWeakRetained((id *)&self->_navActionCoordinator);
}

- (void)setNavActionCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_navActionCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navActionCoordinator);
  objc_storeStrong((id *)&self->_activeContactsValues, 0);
}

@end
