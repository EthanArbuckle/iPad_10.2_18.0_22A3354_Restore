@implementation PUCloudSharedCreateAlbumViewController

- (PUCloudSharedCreateAlbumViewController)init
{
  PUCloudSharedCreateAlbumViewController *v2;
  PUPhotoStreamRecipientViewController *v3;
  PUPhotoStreamRecipientViewController *composeRecipientController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUCloudSharedCreateAlbumViewController;
  v2 = -[PUCloudSharedCreateAlbumViewController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PUPhotoStreamRecipientViewController);
    composeRecipientController = v2->_composeRecipientController;
    v2->_composeRecipientController = v3;

    -[PUPhotoStreamRecipientViewController setDelegate:](v2->_composeRecipientController, "setDelegate:", v2);
    -[PUCloudSharedCreateAlbumViewController addChildViewController:](v2, "addChildViewController:", v2->_composeRecipientController);
    -[PUPhotoStreamRecipientViewController didMoveToParentViewController:](v2->_composeRecipientController, "didMoveToParentViewController:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[PUPhotoStreamRecipientViewController setDelegate:](self->_composeRecipientController, "setDelegate:", 0);
  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)PUCloudSharedCreateAlbumViewController;
  -[PUCloudSharedCreateAlbumViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v6 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v6, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v4);

  -[PUPhotoStreamRecipientViewController view](self->_composeRecipientController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v5);

  -[PUCloudSharedCreateAlbumViewController setView:](self, "setView:", v6);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  void *v4;
  uint64_t v5;

  -[PUCloudSharedCreateAlbumViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  return a3 != 2 || v5 == 1;
}

- (NSArray)recipients
{
  return -[PUPhotoStreamRecipientViewController recipients](self->_composeRecipientController, "recipients");
}

- (void)_handleCompletionWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "albumStreamingCreateViewController:didSucceed:", self, v3);

}

- (void)_cancelAction:(id)a3
{
  PUCloudSharedCreateAlbumViewController *v4;
  id v5;
  id v6;

  -[PUCloudSharedCreateAlbumViewController navigationController](self, "navigationController", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topViewController");
  v4 = (PUCloudSharedCreateAlbumViewController *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
    -[PUCloudSharedCreateAlbumViewController _handleCompletionWithSuccess:](self, "_handleCompletionWithSuccess:", 0);
  else
    v5 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 1);

}

- (void)_doneAction:(id)a3
{
  PUCloudSharedCreateAlbumViewController *v4;
  id v5;
  id v6;

  -[PUCloudSharedCreateAlbumViewController navigationController](self, "navigationController", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topViewController");
  v4 = (PUCloudSharedCreateAlbumViewController *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
    -[PUCloudSharedCreateAlbumViewController _saveUserEnterredInfo](self, "_saveUserEnterredInfo");
  else
    v5 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 1);

}

- (void)_saveUserEnterredInfo
{
  void *v3;
  id obj;

  -[PUPhotoStreamRecipientViewController makeRecipientViewResignFirstResponder](self->_composeRecipientController, "makeRecipientViewResignFirstResponder");
  -[PUPhotoStreamRecipientViewController recipients](self->_composeRecipientController, "recipients");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7BBE8], "defaultPresenterWithViewController:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (PXSharedAlbumsValidateRecipientsToAddToAlbum())
  {
    objc_storeStrong((id *)&self->_recipients, obj);
    -[PUCloudSharedCreateAlbumViewController _handleCompletionWithSuccess:](self, "_handleCompletionWithSuccess:", 1);
  }

}

- (id)navigationItem
{
  UINavigationItem *navItem;
  id v4;
  void *v5;
  UINavigationItem *v6;
  UINavigationItem *v7;
  UINavigationItem *v8;
  id v9;
  void *v10;
  void *v11;
  UINavigationItem *v12;
  void *v13;

  navItem = self->_navItem;
  if (!navItem)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3A48]);
    PULocalizedString(CFSTR("PHOTO_STREAM_NAV_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UINavigationItem *)objc_msgSend(v4, "initWithTitle:", v5);
    v7 = self->_navItem;
    self->_navItem = v6;

    v8 = self->_navItem;
    v9 = objc_alloc(MEMORY[0x1E0DC34F0]);
    -[PUCloudSharedCreateAlbumViewController nextButtonTitle](self, "nextButtonTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithTitle:style:target:action:", v10, 2, self, sel__doneAction_);
    -[UINavigationItem setRightBarButtonItem:](v8, "setRightBarButtonItem:", v11);

    v12 = self->_navItem;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelAction_);
    -[UINavigationItem setLeftBarButtonItem:](v12, "setLeftBarButtonItem:", v13);

    navItem = self->_navItem;
  }
  return navItem;
}

- (CGSize)contentSizeForViewInPopover
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (PUCloudSharedCreateAlbumViewControllerDelegate)delegate
{
  return (PUCloudSharedCreateAlbumViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)nextButtonTitle
{
  return self->_nextButtonTitle;
}

- (void)setNextButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextButtonTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_navItem, 0);
  objc_storeStrong((id *)&self->_composeRecipientController, 0);
}

@end
