@implementation RAPCuratedCollectionPOISelectionViewController

- (RAPCuratedCollectionPOISelectionViewController)initWithReport:(id)a3 parentQuestion:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  RAPCuratedCollectionPOISelectionViewController *v12;
  RAPCuratedCollectionPOISelectionViewController *v13;
  id v14;
  id completion;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)RAPCuratedCollectionPOISelectionViewController;
  v12 = -[RAPCuratedCollectionPOISelectionViewController initWithStyle:](&v21, "initWithStyle:", 1);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_question, a4);
    objc_storeStrong((id *)&v13->_report, a3);
    v14 = objc_msgSend(v11, "copy");
    completion = v13->_completion;
    v13->_completion = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionPOISelectionViewController tableView](v13, "tableView"));
    objc_msgSend(v16, "_maps_initializeRAPAppearance");

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionPOISelectionViewController tableView](v13, "tableView"));
    v18 = objc_opt_class(RAPTwoLinesMenuTableViewCell);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[RAPTwoLinesMenuTableViewCell reuseIdentifier](RAPTwoLinesMenuTableViewCell, "reuseIdentifier"));
    objc_msgSend(v17, "registerClass:forCellReuseIdentifier:", v18, v19);

  }
  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RAPCuratedCollectionPOISelectionViewController;
  -[RAPCuratedCollectionPOISelectionViewController viewDidLoad](&v11, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Report an Individual Place [Curated Collections]"), CFSTR("localized string not found"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionPOISelectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setTitle:", v4);

  v6 = objc_alloc((Class)UIBarButtonItem);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Cancel [Report a Problem Placecard]"), CFSTR("localized string not found"), 0));
  v9 = objc_msgSend(v6, "initWithTitle:style:target:action:", v8, 0, self, "_cancel");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionPOISelectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v10, "setLeftBarButtonItem:", v9);

}

- (void)_cancel
{
  void (**completion)(id, RAPCuratedCollectionPOISelectionViewController *, _QWORD);

  completion = (void (**)(id, RAPCuratedCollectionPOISelectionViewController *, _QWORD))self->_completion;
  if (completion)
    completion[2](completion, self, 0);
}

- (id)_mapItemAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self->_report, "_context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "curatedCollectionContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "placeCollectionMapItems"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
  return v8;
}

- (unint64_t)_numberOfMapItems
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self->_report, "_context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "curatedCollectionContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "placeCollectionMapItems"));
  v5 = objc_msgSend(v4, "count");

  return (unint64_t)v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[RAPCuratedCollectionPOISelectionViewController _numberOfMapItems](self, "_numberOfMapItems", a3, a4);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Pick the Place [RAP]"), CFSTR("localized string not found"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_groupedHeaderViewWithTitle:", v6));

  return v7;
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

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RAPTwoLinesMenuTableViewCell reuseIdentifier](RAPTwoLinesMenuTableViewCell, "reuseIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v8));

  v10 = objc_msgSend(v6, "row");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionPOISelectionViewController _mapItemAtIndex:](self, "_mapItemAtIndex:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[RAPTwoLinesViewModelImpl viewModelFromMapItem:](RAPTwoLinesViewModelImpl, "viewModelFromMapItem:", v11));
  objc_msgSend(v9, "setViewModel:", v12);

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void ***v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t);
  void *v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionPOISelectionViewController _mapItemAtIndex:](self, "_mapItemAtIndex:", objc_msgSend(v7, "row")));
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  objc_initWeak(&location, self);
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_1003D4204;
  v15 = &unk_1011B4770;
  objc_copyWeak(&v16, &location);
  v9 = objc_retainBlock(&v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionPOISelectionViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate", v12, v13, v14, v15));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rapPresenter"));
  objc_msgSend(v11, "presentRAPWebBundleWithMapItem:fromEntryPoint:completion:", v8, 259, v9);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_question, 0);
}

@end
