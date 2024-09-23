@implementation ICFolderPreviewViewController

- (ICFolderPreviewViewController)initWithFolder:(id)a3
{
  id v4;
  ICFolderPreviewViewController *v5;
  ICFolderPreviewViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICFolderPreviewViewController;
  v5 = -[ICFolderPreviewViewController init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_folder, v4);

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ICFolderPreviewViewController;
  -[ICFolderPreviewViewController viewDidLoad](&v19, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderPreviewViewController folder](self, "folder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderPreviewViewController folderThumbnailView](self, "folderThumbnailView"));
  objc_msgSend(v4, "setFolder:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderPreviewViewController folderThumbnailView](self, "folderThumbnailView"));
  objc_msgSend(v5, "setBackgroundColor:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderPreviewViewController folderThumbnailView](self, "folderThumbnailView"));
  objc_msgSend(v6, "setHasDropShadow:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderPreviewViewController folderThumbnailView](self, "folderThumbnailView"));
  objc_msgSend(v7, "setAllowsCompactSizeMetrics:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderPreviewViewController folder](self, "folder"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderPreviewViewController previewFooterView](self, "previewFooterView"));
  objc_msgSend(v10, "setTitle:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("%lu Notes"), &stru_1005704B8, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderPreviewViewController folder](self, "folder"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, objc_msgSend(v13, "visibleNotesCount")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderPreviewViewController previewFooterView](self, "previewFooterView"));
  objc_msgSend(v15, "setContentsSubtitle:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderPreviewViewController folder](self, "folder"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "shareDescription"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderPreviewViewController previewFooterView](self, "previewFooterView"));
  objc_msgSend(v18, "setSharingSubtitle:", v17);

}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderPreviewViewController stackView](self, "stackView"));
  objc_msgSend(v5, "frame");
  -[ICFolderPreviewViewController setPreferredContentSize:](self, "setPreferredContentSize:", v3, v4);

}

- (ICFolder)folder
{
  return (ICFolder *)objc_loadWeakRetained((id *)&self->_folder);
}

- (UIStackView)stackView
{
  return (UIStackView *)objc_loadWeakRetained((id *)&self->_stackView);
}

- (void)setStackView:(id)a3
{
  objc_storeWeak((id *)&self->_stackView, a3);
}

- (ICNoteBrowseFolderThumbnailView)folderThumbnailView
{
  return (ICNoteBrowseFolderThumbnailView *)objc_loadWeakRetained((id *)&self->_folderThumbnailView);
}

- (void)setFolderThumbnailView:(id)a3
{
  objc_storeWeak((id *)&self->_folderThumbnailView, a3);
}

- (ICPreviewFooterView)previewFooterView
{
  return (ICPreviewFooterView *)objc_loadWeakRetained((id *)&self->_previewFooterView);
}

- (void)setPreviewFooterView:(id)a3
{
  objc_storeWeak((id *)&self->_previewFooterView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_previewFooterView);
  objc_destroyWeak((id *)&self->_folderThumbnailView);
  objc_destroyWeak((id *)&self->_stackView);
  objc_destroyWeak((id *)&self->_folder);
}

@end
