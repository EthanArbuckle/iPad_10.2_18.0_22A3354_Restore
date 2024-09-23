@implementation ICPaperStyleSheetCollectionViewController

- (ICPaperStyleSheetCollectionViewController)initWithInitialPaperStyleType:(unint64_t)a3 delegate:(id)a4
{
  id v6;
  ICPaperStyleSheetCollectionViewController *v7;
  ICPaperStyleSheetCollectionViewController *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ICPaperStyleSheetCollectionViewController;
  v7 = -[ICPaperStyleCollectionViewController initWithLargeIcons:forPreferences:](&v10, sel_initWithLargeIcons_forPreferences_, 0, 0);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_paperStyleDelegate, v6);
    v8->_initialPaperStyleType = a3;
  }

  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)ICPaperStyleSheetCollectionViewController;
  -[ICPaperStyleCollectionViewController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelAction_);
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleSheetCollectionViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItems:", v4);

}

- (id)indexPathForInitialSelection
{
  return -[ICPaperStyleCollectionViewController indexPathFromPaperStyleType:](self, "indexPathFromPaperStyleType:", -[ICPaperStyleSheetCollectionViewController initialPaperStyleType](self, "initialPaperStyleType"));
}

- (CGSize)preferredContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[ICPaperStyleSheetCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleSheetCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleCollectionViewController collectionView:layout:referenceSizeForHeaderInSection:](self, "collectionView:layout:referenceSizeForHeaderInSection:", v3, v4, 0);
  v6 = v5;

  -[ICPaperStyleCollectionViewController itemSize](self, "itemSize");
  v8 = v7 * 3.0 + 128.0;
  -[ICPaperStyleCollectionViewController itemSize](self, "itemSize");
  v10 = v6 + v9 * 3.0 + 96.0;
  v11 = v8;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)cancelAction:(id)a3
{
  -[ICPaperStyleSheetCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;

  if (a4)
  {
    v5 = a4;
    -[ICPaperStyleSheetCollectionViewController paperStyleDelegate](self, "paperStyleDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ICPaperStyleCollectionViewController paperStyleTypeFromIndexPath:](self, "paperStyleTypeFromIndexPath:", v5);

    objc_msgSend(v6, "paperStyleSheetCollectionViewController:didFinishWithPaperStyleType:", self, v7);
  }
  -[ICPaperStyleSheetCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)accessibilityPerformEscape
{
  -[ICPaperStyleSheetCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ICPaperStyleSheetCollectionViewControllerDelegate)paperStyleDelegate
{
  return (ICPaperStyleSheetCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_paperStyleDelegate);
}

- (void)setPaperStyleDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_paperStyleDelegate, a3);
}

- (unint64_t)initialPaperStyleType
{
  return self->_initialPaperStyleType;
}

- (void)setInitialPaperStyleType:(unint64_t)a3
{
  self->_initialPaperStyleType = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_paperStyleDelegate);
}

@end
