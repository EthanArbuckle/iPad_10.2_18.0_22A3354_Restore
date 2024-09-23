@implementation WFMapSearchTableViewController

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFMapSearchTableViewController;
  -[WFMapSearchTableViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[WFMapSearchTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v6);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[WFMapSearchTableViewController mapItems](self, "mapItems", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFMapSearchTableViewController mapItems](self, "mapItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "row");

  objc_msgSend(v11, "objectAtIndex:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:");
  -[WFMapSearchTableViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFMapSearchTableViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFMapSearchTableViewController mapItems](self, "mapItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v10, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mapSearchViewController:didSelectMapItem:", self, v9);

  }
  -[WFMapSearchTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];

  objc_msgSend(a3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDDB0B8]);
    objc_msgSend(v6, "setNaturalLanguageQuery:", v5);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB0A0]), "initWithRequest:", v6);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __73__WFMapSearchTableViewController_updateSearchResultsForSearchController___block_invoke;
    v8[3] = &unk_24E603938;
    v8[4] = self;
    objc_msgSend(v7, "startWithCompletionHandler:", v8);

  }
}

- (WFMapSearchTableViewControllerDelegate)delegate
{
  return (WFMapSearchTableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)mapItems
{
  return self->_mapItems;
}

- (void)setMapItems:(id)a3
{
  objc_storeStrong((id *)&self->_mapItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __73__WFMapSearchTableViewController_updateSearchResultsForSearchController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(a2, "mapItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setMapItems:", v3);

    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadData");

  }
}

@end
