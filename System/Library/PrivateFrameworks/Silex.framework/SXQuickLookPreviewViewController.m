@implementation SXQuickLookPreviewViewController

- (SXQuickLookPreviewViewController)initWithFile:(id)a3 transitionContext:(id)a4
{
  id v7;
  id v8;
  SXQuickLookPreviewViewController *v9;
  SXQuickLookPreviewViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXQuickLookPreviewViewController;
  v9 = -[QLPreviewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_file, a3);
    objc_storeStrong((id *)&v10->_transitionContext, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SXQuickLookPreviewViewController;
  -[QLPreviewController viewDidLoad](&v3, sel_viewDidLoad);
  -[QLPreviewController setDelegate:](self, "setDelegate:", self);
  -[QLPreviewController setDataSource:](self, "setDataSource:", self);
}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4
{
  void *v4;
  void *v5;

  -[SXQuickLookPreviewViewController transitionContext](self, "transitionContext", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return 1;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = objc_alloc(MEMORY[0x24BDB1518]);
  -[SXQuickLookPreviewViewController file](self, "file");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithFileAtURL:", v7);

  -[SXQuickLookPreviewViewController file](self, "file");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shareURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCanonicalWebPageURL:", v10);

  return v8;
}

- (SXQuickLookFile)file
{
  return self->_file;
}

- (SXQuickLookTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_file, 0);
}

@end
