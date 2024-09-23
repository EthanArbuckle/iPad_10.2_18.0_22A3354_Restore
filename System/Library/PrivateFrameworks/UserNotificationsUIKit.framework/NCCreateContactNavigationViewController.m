@implementation NCCreateContactNavigationViewController

+ (id)navigationControllerWithContact:(id)a3 bundleIdentifier:(id)a4 imageData:(id)a5 presenterDelegate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[NCCreateContactNavigationViewController _initWithContact:bundleIdentifier:imageData:presenterDelegate:]([NCCreateContactNavigationViewController alloc], "_initWithContact:bundleIdentifier:imageData:presenterDelegate:", v12, v11, v10, v9);

  return v13;
}

- (id)_initWithContact:(id)a3 bundleIdentifier:(id)a4 imageData:(id)a5 presenterDelegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NCCreateContactNavigationViewController *v22;
  id *p_isa;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = (void *)MEMORY[0x1E0DC6038];
  v15 = a5;
  objc_msgSend(v14, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "newCuratedContactForContact:imageData:bundleIdentifier:", v11, v15, v12);

  objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForUnknownContact:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x1E0C97298]);
  objc_msgSend(v18, "setContactStore:", v19);

  objc_msgSend(v18, "setDelegate:", self);
  objc_msgSend(v18, "setActions:", 32);
  objc_msgSend(v18, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelAddToContacts_);
  objc_msgSend(v20, "setRightBarButtonItem:", v21);

  v25.receiver = self;
  v25.super_class = (Class)NCCreateContactNavigationViewController;
  v22 = -[NCCreateContactNavigationViewController initWithRootViewController:](&v25, sel_initWithRootViewController_, v18);
  p_isa = (id *)&v22->super.super.super.super.super.isa;
  if (v22)
  {
    -[NCModalNavigationController setPresenterDelegate:](v22, "setPresenterDelegate:", v13);
    objc_storeStrong(p_isa + 177, a3);
    objc_storeStrong(p_isa + 178, a4);
  }

  return p_isa;
}

- (void)_cancelAddToContacts:(id)a3
{
  -[NCCreateContactNavigationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a4, "identifier", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DC6038], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didAddToCuratedContactsForContact:bundleIdentifier:cnContactIdentifier:", self->_contact, self->_bundleIdentifier, v8);

  }
  if (a4)
  {
    -[NCModalNavigationController presenterDelegate](self, "presenterDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "createContactNavigationControllerDidComplete:", self);

  }
  -[NCCreateContactNavigationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
