@implementation NPUIMediaControlsStandaloneViewController

- (void)setStandaloneControlsDelegate:(id)a3
{
  id v4;
  id v5;
  NPUIMediaControlsStandaloneViewController *v6;
  id obj;

  obj = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[NPUIMediaControlsStandaloneViewController standaloneControlsDelegate](self, "standaloneControlsDelegate"));

  if (v4 != obj)
  {
    v5 = objc_storeWeak((id *)&self->_standaloneControlsDelegate, obj);
    if (obj)
      v6 = self;
    else
      v6 = 0;
    -[NPUIMediaControlsStandaloneViewController setDelegate:](self, "setDelegate:", v6);

  }
}

- (void)mediaControlsViewController:(id)a3 didSelectRoute:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[NPUIMediaControlsStandaloneViewController standaloneControlsDelegate](self, "standaloneControlsDelegate"));
  objc_msgSend(v6, "standaloneMediaControlsViewController:didSelectRoute:", self, v5);

}

- (NPUIMediaControlsStandaloneViewControllerDelegate)standaloneControlsDelegate
{
  return (NPUIMediaControlsStandaloneViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_standaloneControlsDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_standaloneControlsDelegate);
}

@end
