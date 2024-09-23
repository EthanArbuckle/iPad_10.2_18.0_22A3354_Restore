@implementation VideosExtrasJSITunesStore

- (void)loadStoreURL:(id)a3 playOnLaunch:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openURLHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "processItunesExtrasStoreLink:", v6);
  }

}

- (UIViewController)formPresentationViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_formPresentationViewController);
}

- (void)setFormPresentationViewController:(id)a3
{
  objc_storeWeak((id *)&self->_formPresentationViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_formPresentationViewController);
}

@end
