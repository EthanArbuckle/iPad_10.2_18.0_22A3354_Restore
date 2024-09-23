@implementation BKAudioTurnModeViewController

- (BKAudioTurnModeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKAudioTurnModeViewController;
  return -[BKViewController initWithNibName:bundle:](&v5, "initWithNibName:bundle:", a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  -[BKAudioTurnModeViewController releaseViews](self, "releaseViews");
  v3.receiver = self;
  v3.super_class = (Class)BKAudioTurnModeViewController;
  -[BKViewController dealloc](&v3, "dealloc");
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKAudioTurnModeViewController;
  -[BKAudioTurnModeViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = AEBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Turn Pages"), &stru_1C3088, 0));
  -[BKAudioTurnModeViewController setTitle:](self, "setTitle:", v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKAudioTurnModeViewController;
  -[BKAudioTurnModeViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)releaseViews
{
  UITableView *tableView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKAudioTurnModeViewController;
  -[BKViewController releaseViews](&v4, "releaseViews");
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", 0);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", 0);
  tableView = self->_tableView;
  self->_tableView = 0;

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BKAudioTurnModeViewController;
  -[BKAudioTurnModeViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("BKAudioController")));
  if (!v7)
    v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("BKAudioController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudioTurnModeViewController delegate](self, "delegate"));
  v9 = objc_msgSend(v8, "turnState");

  v10 = objc_msgSend(v6, "row");
  v11 = AEBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (!v10)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Automatically"), &stru_1C3088, 0));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
    objc_msgSend(v19, "setText:", v18);

    if ((v9 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Manually"), &stru_1C3088, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v15, "setText:", v14);

  if ((v9 & 1) == 0)
LABEL_5:
    objc_msgSend(v7, "setAccessoryType:", 3);
LABEL_6:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v7, "setBackgroundColor:", v16);

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v5 = objc_msgSend(a4, "row", a3) == 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudioTurnModeViewController delegate](self, "delegate"));
  objc_msgSend(v6, "setTurnState:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudioTurnModeViewController delegate](self, "delegate"));
  LODWORD(v6) = objc_msgSend(v7, "readAloudState");

  if ((_DWORD)v6)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[BKAudioTurnModeViewController delegate](self, "delegate"));
    objc_msgSend(v9, "dismissPopover");
  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[BKAudioTurnModeViewController navigationController](self, "navigationController"));
    v8 = objc_msgSend(v9, "popViewControllerAnimated:", 1);
  }

}

- (BKAudioControllerDelegate)delegate
{
  return (BKAudioControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
