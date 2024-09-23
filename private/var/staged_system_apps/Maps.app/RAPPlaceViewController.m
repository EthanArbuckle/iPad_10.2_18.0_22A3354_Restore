@implementation RAPPlaceViewController

- (RAPPlaceViewController)initWithMapItem:(id)a3
{
  id v5;
  RAPPlaceViewController *v6;
  RAPPlaceViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPPlaceViewController;
  v6 = -[RAPPlaceViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mapItem, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  MUPlaceViewController *v6;
  MUPlaceViewController *placeViewController;
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
  void *v19;
  id v20;
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
  id v37;
  objc_super v38;
  _QWORD v39[4];

  v38.receiver = self;
  v38.super_class = (Class)RAPPlaceViewController;
  -[RAPPlaceViewController viewDidLoad](&v38, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem name](self->_mapItem, "name"));
  -[RAPPlaceViewController setTitle:](self, "setTitle:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceViewController view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v37 = objc_alloc_init((Class)MUPlaceViewControllerConfiguration);
  objc_msgSend(v37, "setOptions:", 35658312);
  v6 = (MUPlaceViewController *)objc_msgSend(objc_alloc((Class)MUPlaceViewController), "initWithConfiguration:", v37);
  placeViewController = self->_placeViewController;
  self->_placeViewController = v6;

  -[MUPlaceViewController setMapItem:](self->_placeViewController, "setMapItem:", self->_mapItem);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController view](self->_placeViewController, "view"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[RAPPlaceViewController addChildViewController:](self, "addChildViewController:", self->_placeViewController);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController view](self->_placeViewController, "view"));
  objc_msgSend(v9, "addSubview:", v10);

  -[MUPlaceViewController didMoveToParentViewController:](self->_placeViewController, "didMoveToParentViewController:", self);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController view](self->_placeViewController, "view"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v39[0] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController view](self->_placeViewController, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceViewController view](self, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v39[1] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController view](self->_placeViewController, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v12));
  v39[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController view](self->_placeViewController, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v17));
  v39[3] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

  v20 = objc_alloc((Class)UIBarButtonItem);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Done"), CFSTR("localized string not found"), 0));
  v23 = objc_msgSend(v20, "initWithTitle:style:target:action:", v22, 2, self, "actionButtonTapped:");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v24, "setRightBarButtonItem:", v23);

}

- (void)actionButtonTapped:(id)a3
{
  -[RAPPlaceViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_placeViewController, 0);
}

@end
