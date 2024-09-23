@implementation MapsTransitIncidentsContaineeViewController

- (MapsTransitIncidentsContaineeViewController)initWithTransitIncidents:(id)a3
{
  id v4;
  MapsTransitIncidentsContaineeViewController *v5;
  MapsIncidentsViewController *v6;
  MKIncidentsViewController *incidentsViewController;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsTransitIncidentsContaineeViewController;
  v5 = -[MapsTransitIncidentsContaineeViewController init](&v9, "init");
  if (v5)
  {
    v6 = -[MapsIncidentsViewController initWithTransitIncidents:]([MapsIncidentsViewController alloc], "initWithTransitIncidents:", v4);
    incidentsViewController = v5->_incidentsViewController;
    v5->_incidentsViewController = (MKIncidentsViewController *)v6;

  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  ContainerHeaderView *v4;
  ContainerHeaderView *containerHeaderView;
  void *v6;
  void *v7;
  void *v8;
  MacFooterView *v9;
  MacFooterView *footerView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  ContainerHeaderView *v26;
  ContainerHeaderView *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  ContainerHeaderView *v37;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  objc_super v74;
  _QWORD v75[2];
  _QWORD v76[10];

  v74.receiver = self;
  v74.super_class = (Class)MapsTransitIncidentsContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v74, "viewDidLoad");
  if (sub_1002A8AA0(self) == 5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTransitIncidentsContaineeViewController view](self, "view"));
    v4 = -[ContainerHeaderView initWithCardButtonType:]([ContainerHeaderView alloc], "initWithCardButtonType:", 1);
    containerHeaderView = self->_containerHeaderView;
    self->_containerHeaderView = v4;

    -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ContainerHeaderView setHairLineAlpha:](self->_containerHeaderView, "setHairLineAlpha:", 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKIncidentsViewController incidentsTitle](self->_incidentsViewController, "incidentsTitle"));
    -[ContainerHeaderView setTitle:](self->_containerHeaderView, "setTitle:", v6);

    -[ContainerHeaderView setButtonHidden:](self->_containerHeaderView, "setButtonHidden:", 1);
    objc_msgSend(v3, "addSubview:", self->_containerHeaderView);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKIncidentsViewController view](self->_incidentsViewController, "view"));
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MKIncidentsViewController view](self->_incidentsViewController, "view"));
    v63 = v3;
    objc_msgSend(v3, "addSubview:", v8);

    -[MapsTransitIncidentsContaineeViewController addChildViewController:](self, "addChildViewController:", self->_incidentsViewController);
    v9 = -[MacFooterView initWithRightButtonType:]([MacFooterView alloc], "initWithRightButtonType:", 8);
    footerView = self->_footerView;
    self->_footerView = v9;

    -[MacFooterView setTranslatesAutoresizingMaskIntoConstraints:](self->_footerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MacFooterView setRightButtonEnabled:](self->_footerView, "setRightButtonEnabled:", 1);
    -[MacFooterView setDelegate:](self->_footerView, "setDelegate:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
    -[MacFooterView setBackgroundColor:](self->_footerView, "setBackgroundColor:", v11);

    objc_msgSend(v3, "addSubview:", self->_footerView);
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_containerHeaderView, "leadingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTransitIncidentsContaineeViewController view](self, "view"));
    v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leadingAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v56));
    v76[0] = v73;
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_containerHeaderView, "trailingAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTransitIncidentsContaineeViewController view](self, "view"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "trailingAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v70));
    v76[1] = v69;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_containerHeaderView, "topAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTransitIncidentsContaineeViewController view](self, "view"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "topAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v66));
    v76[2] = v65;
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[MKIncidentsViewController view](self->_incidentsViewController, "view"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "leadingAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTransitIncidentsContaineeViewController view](self, "view"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "leadingAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v59));
    v76[3] = v58;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[MKIncidentsViewController view](self->_incidentsViewController, "view"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "trailingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTransitIncidentsContaineeViewController view](self, "view"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "trailingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
    v76[4] = v51;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[MKIncidentsViewController view](self->_incidentsViewController, "view"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "topAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_containerHeaderView, "bottomAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
    v76[5] = v47;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MacFooterView topAnchor](self->_footerView, "topAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MKIncidentsViewController view](self->_incidentsViewController, "view"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "bottomAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
    v76[6] = v43;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MacFooterView bottomAnchor](self->_footerView, "bottomAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTransitIncidentsContaineeViewController view](self, "view"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bottomAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
    v76[7] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MacFooterView leadingAnchor](self->_footerView, "leadingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTransitIncidentsContaineeViewController view](self, "view"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
    v76[8] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MacFooterView trailingAnchor](self->_footerView, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTransitIncidentsContaineeViewController view](self, "view"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
    v76[9] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v76, 10));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

    v22 = v55;
    v23 = (void *)v56;

    v24 = v63;
    v25 = v60;

  }
  else
  {
    v26 = -[ContainerHeaderView initWithCardButtonType:]([ContainerHeaderView alloc], "initWithCardButtonType:", 0);
    v27 = self->_containerHeaderView;
    self->_containerHeaderView = v26;

    -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ContainerHeaderView setHairLineAlpha:](self->_containerHeaderView, "setHairLineAlpha:", 0.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MKIncidentsViewController incidentsTitle](self->_incidentsViewController, "incidentsTitle"));
    -[ContainerHeaderView setTitle:](self->_containerHeaderView, "setTitle:", v28);

    -[ContainerHeaderView setDelegate:](self->_containerHeaderView, "setDelegate:", self);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MKIncidentsViewController view](self->_incidentsViewController, "view"));
    objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MKIncidentsViewController view](self->_incidentsViewController, "view"));
    objc_msgSend(v30, "addSubview:", v31);

    -[MapsTransitIncidentsContaineeViewController addChildViewController:](self, "addChildViewController:", self->_incidentsViewController);
    v32 = objc_alloc((Class)MUEdgeLayout);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MKIncidentsViewController view](self->_incidentsViewController, "view"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v24 = objc_msgSend(v32, "initWithItem:container:", v33, v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    objc_msgSend(v35, "addSubview:", self->_containerHeaderView);

    v36 = objc_alloc((Class)MUEdgeLayout);
    v37 = self->_containerHeaderView;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v25 = objc_msgSend(v36, "initWithItem:container:", v37, v38);

    v75[0] = v24;
    v75[1] = v25;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v75, 2));
    +[NSLayoutConstraint _mapsui_activateLayouts:](NSLayoutConstraint, "_mapsui_activateLayouts:", v39);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MKIncidentsViewController incidentsTitle](self->_incidentsViewController, "incidentsTitle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTransitIncidentsContaineeViewController containerHeaderView](self, "containerHeaderView"));
    objc_msgSend(v23, "setTitle:", v22);
  }

}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  -[ContaineeViewController handleDismissAction:](self, "handleDismissAction:", self, a4);
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return MapKitIdiomIsMacCatalyst(a1, a2) ^ 1;
}

- (id)transitIncidents
{
  return -[MKIncidentsViewController transitIncidents](self->_incidentsViewController, "transitIncidents");
}

- (void)macFooterViewRightButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController containeeDelegate](self, "containeeDelegate"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rightButton"));
    -[ContaineeViewController handleDismissAction:](self, "handleDismissAction:", v5);

  }
  else
  {
    -[MapsTransitIncidentsContaineeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (ContainerHeaderView)containerHeaderView
{
  return self->_containerHeaderView;
}

- (void)setContainerHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_containerHeaderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerHeaderView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_incidentsViewController, 0);
}

@end
