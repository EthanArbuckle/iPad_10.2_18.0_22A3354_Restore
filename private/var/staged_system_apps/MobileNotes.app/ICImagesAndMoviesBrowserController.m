@implementation ICImagesAndMoviesBrowserController

- (ICImagesAndMoviesBrowserController)initWithAttachmentSection:(signed __int16)a3
{
  uint64_t v3;
  ICImagesAndMoviesBrowserController *v4;
  ICImagesAndMoviesBrowserController *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICImagesAndMoviesBrowserController;
  v4 = -[ICImagesAndMoviesBrowserController init](&v7, "init");
  v5 = v4;
  if (v4)
    -[ICImagesAndMoviesBrowserController setAttachmentSection:](v4, "setAttachmentSection:", v3);
  return v5;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[ICImagesAndMoviesScrollView initForAttachmentSection:]([ICImagesAndMoviesScrollView alloc], "initForAttachmentSection:", -[ICImagesAndMoviesBrowserController attachmentSection](self, "attachmentSection"));
  -[ICImagesAndMoviesBrowserController setScrollView:](self, "setScrollView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBrowserController scrollView](self, "scrollView"));
  objc_msgSend(v4, "setViewController:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBrowserController scrollView](self, "scrollView"));
  objc_msgSend(v5, "setDelegate:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBrowserController scrollView](self, "scrollView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionView"));
  objc_msgSend(v7, "setContentInsetAdjustmentBehavior:", 3);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBrowserController scrollView](self, "scrollView"));
  -[ICImagesAndMoviesBrowserController setView:](self, "setView:", v8);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICImagesAndMoviesBrowserController;
  -[ICImagesAndMoviesBrowserController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBrowserController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBrowserController scrollView](self, "scrollView"));
  objc_msgSend(v4, "setScrollDirection:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBrowserController scrollView](self, "scrollView"));
  objc_msgSend(v5, "setBackground");

  v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "doneAction:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBrowserController navigationItem](self, "navigationItem"));
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

}

- (void)doneAction:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBrowserController presentingViewController](self, "presentingViewController", a3));
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBrowserController eventReporter](self, "eventReporter"));
  objc_msgSend(v5, "submitAttachmentBrowserActionEventForType:", 1);

}

- (void)presentAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBrowserController scrollView](self, "scrollView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attachments"));

  v7 = objc_msgSend(v6, "indexOfObject:", v4);
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortLoggingDescription"));
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Could not find attachment %@ in list of attachments in image scroll view. Falling back to single attachment", buf, 0xCu);

    }
    v14 = v4;
    v10 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));

    v11 = 0;
    v6 = (void *)v10;
  }
  else
  {
    v11 = v7;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBrowserController ic_viewControllerManager](self, "ic_viewControllerManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBrowserController scrollView](self, "scrollView"));
  objc_msgSend(v12, "presentAttachments:startingAtIndex:delegate:displayShowInNote:editable:selectedSubAttachment:presentingViewController:", v6, v11, v13, 1, 0, 0, self);

}

- (void)browseAttachmentsCollectionView:(id)a3 cell:(id)a4 shouldShareAttachment:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[ICAttachmentActivityViewController makeWithAttachment:quickLookItemDelegate:completion:](ICAttachmentActivityViewController, "makeWithAttachment:quickLookItemDelegate:completion:", a5, 0, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "popoverPresentationController"));
  objc_msgSend(v8, "setSourceView:", v7);

  -[ICImagesAndMoviesBrowserController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

- (void)browseAttachmentsCollectionView:(id)a3 didSelectAttachment:(id)a4 indexPath:(id)a5
{
  id v6;

  -[ICImagesAndMoviesBrowserController presentAttachment:](self, "presentAttachment:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBrowserController eventReporter](self, "eventReporter"));
  objc_msgSend(v6, "submitAttachmentBrowserActionEventForType:", 4);

}

- (void)browseAttachmentsCollectionView:(id)a3 shouldInspectAttachment:(id)a4
{
  id v5;
  void *v6;
  ICAttachmentInspectorViewController *v7;

  v5 = a4;
  v7 = -[ICAttachmentInspectorViewController initWithAttachment:]([ICAttachmentInspectorViewController alloc], "initWithAttachment:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController ic_embedInNavigationControllerForModalPresentation](v7, "ic_embedInNavigationControllerForModalPresentation"));
  -[ICImagesAndMoviesBrowserController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (ICImagesAndMoviesScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (signed)attachmentSection
{
  return self->_attachmentSection;
}

- (void)setAttachmentSection:(signed __int16)a3
{
  self->_attachmentSection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
