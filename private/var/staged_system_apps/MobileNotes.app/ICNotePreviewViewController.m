@implementation ICNotePreviewViewController

- (ICNotePreviewViewController)initWithNote:(id)a3
{
  id v4;
  ICNotePreviewViewController *v5;
  ICNotePreviewViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICNotePreviewViewController;
  v5 = -[ICNotePreviewViewController init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_note, v4);

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICNotePreviewViewController;
  -[ICNotePreviewViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNotePreviewViewController noteResultsThumbnailView](self, "noteResultsThumbnailView"));
  objc_msgSend(v3, "setPreviewing:", 1);

  -[ICNotePreviewViewController registerForTraitChanges](self, "registerForTraitChanges");
}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNotePreviewViewController;
  -[ICNotePreviewViewController viewIsAppearing:](&v6, "viewIsAppearing:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNotePreviewViewController note](self, "note"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNotePreviewViewController noteResultsThumbnailView](self, "noteResultsThumbnailView"));
  objc_msgSend(v5, "setNote:", v4);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICNotePreviewViewController;
  -[ICNotePreviewViewController viewDidLayoutSubviews](&v8, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNotePreviewViewController stackView](self, "stackView"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  -[ICNotePreviewViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5, v7);
}

- (void)registerForTraitChanges
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;

  v6 = objc_opt_class(UITraitUserInterfaceStyle);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNotePreviewViewController noteResultsThumbnailView](self, "noteResultsThumbnailView"));
  v5 = -[ICNotePreviewViewController registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v3, v4, "updateImages");

}

- (ICSearchIndexableNote)note
{
  return (ICSearchIndexableNote *)objc_loadWeakRetained((id *)&self->_note);
}

- (UIStackView)stackView
{
  return (UIStackView *)objc_loadWeakRetained((id *)&self->_stackView);
}

- (void)setStackView:(id)a3
{
  objc_storeWeak((id *)&self->_stackView, a3);
}

- (ICNoteResultsThumbnailView)noteResultsThumbnailView
{
  return (ICNoteResultsThumbnailView *)objc_loadWeakRetained((id *)&self->_noteResultsThumbnailView);
}

- (void)setNoteResultsThumbnailView:(id)a3
{
  objc_storeWeak((id *)&self->_noteResultsThumbnailView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_noteResultsThumbnailView);
  objc_destroyWeak((id *)&self->_stackView);
  objc_destroyWeak((id *)&self->_note);
}

@end
