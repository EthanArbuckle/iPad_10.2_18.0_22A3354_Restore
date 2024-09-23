@implementation PXPlacesMapViewController

- (PXPlacesMapViewController)init
{
  PXPlacesMapViewController *v2;
  PXPlacesMapViewController *v3;
  PXPlacesMapController *v4;
  PXPlacesMapController *mapController;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPlacesMapViewController;
  v2 = -[PXPlacesMapViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, 0, 0);
  v3 = v2;
  if (v2)
  {
    -[UIViewController px_enableExtendedTraitCollection](v2, "px_enableExtendedTraitCollection");
    v4 = objc_alloc_init(PXPlacesMapController);
    mapController = v3->_mapController;
    v3->_mapController = v4;

  }
  return v3;
}

- (PXPlacesMapViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapViewController.m"), 34, CFSTR("%s is not available as initializer"), "-[PXPlacesMapViewController initWithNibName:bundle:]");

  abort();
}

- (PXPlacesMapViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapViewController.m"), 38, CFSTR("%s is not available as initializer"), "-[PXPlacesMapViewController initWithCoder:]");

  abort();
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v10;

  -[PXPlacesMapViewController nibName](self, "nibName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v10.receiver = self;
    v10.super_class = (Class)PXPlacesMapViewController;
    -[PXPlacesMapViewController loadView](&v10, sel_loadView);
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[PXPlacesMapViewController mapController](self, "mapController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "addSubview:", v5);
    _NSDictionaryOfVariableBindings(CFSTR("mapView"), v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[mapView]|"), 0, 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addConstraints:", v7);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[mapView]|"), 0, 0, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addConstraints:", v8);

    -[PXPlacesMapViewController setView:](self, "setView:", v9);
  }
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXPlacesMapViewController;
  -[PXPlacesMapViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[UIViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerChangeObserver:context:", self, 0);

  -[PXPlacesMapViewController sendTraitNotification](self, "sendTraitNotification");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPlacesMapViewController;
  -[PXPlacesMapViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PXPlacesMapViewController mapController](self, "mapController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapContainerViewWillAppear");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPlacesMapViewController;
  -[PXPlacesMapViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[PXPlacesMapViewController mapController](self, "mapController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapContainerViewDidAppear");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPlacesMapViewController;
  -[PXPlacesMapViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[PXPlacesMapViewController mapController](self, "mapController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapContainerViewWillDisappear");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPlacesMapViewController;
  -[PXPlacesMapViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[PXPlacesMapViewController mapController](self, "mapController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapContainerViewDidDisappear");

}

- (PKExtendedTraitCollection)pk_extendedTraitCollection
{
  void *v2;
  PXPlacesUtils *v3;
  void *v4;

  -[UIViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(PXPlacesUtils);
  -[PXPlacesUtils pkExtendedTraitCollectionFromPXExtendedTraitCollection:](v3, "pkExtendedTraitCollectionFromPXExtendedTraitCollection:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKExtendedTraitCollection *)v4;
}

- (void)sendTraitNotification
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[PXPlacesMapViewController pk_extendedTraitCollection](self, "pk_extendedTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("kPKExtendedTraitCollectionKey");
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("kPKExtendedTraitCollectionChangedNotification"), 0, v3);

}

- (PXPlacesMapController)mapController
{
  return self->_mapController;
}

- (void)setMapController:(id)a3
{
  objc_storeStrong((id *)&self->_mapController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapController, 0);
}

@end
