@implementation PKDashboardCenteredTextItemPresenter

- (PKDashboardCenteredTextItemPresenter)init
{
  PKDashboardCenteredTextItemPresenter *v2;
  PKCenteredTextCollectionViewCell *v3;
  uint64_t v4;
  PKCenteredTextCollectionViewCell *sampleCell;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKDashboardCenteredTextItemPresenter;
  v2 = -[PKDashboardCenteredTextItemPresenter init](&v7, sel_init);
  if (v2)
  {
    v3 = [PKCenteredTextCollectionViewCell alloc];
    v4 = -[PKCenteredTextCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKCenteredTextCollectionViewCell *)v4;

  }
  return v2;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("CenteredTextCellReuseIdentifier");
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  return 0;
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("CenteredTextCellReuseIdentifier"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardCenteredTextItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:](self, "_configureCell:forItem:inCollectionView:forIndexPath:", v11, v10, v9, v8);

  return v11;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  PKCenteredTextCollectionViewCell *sampleCell;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  sampleCell = self->_sampleCell;
  v9 = a4;
  -[PKDashboardCenteredTextItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:](self, "_configureCell:forItem:inCollectionView:forIndexPath:", sampleCell, a3, v9, a5);
  objc_msgSend(v9, "bounds");
  v11 = v10;

  +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
  -[PKCenteredTextCollectionViewCell sizeThatFits:](self->_sampleCell, "sizeThatFits:", v11 + v12 * -2.0, 70.0);
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v9);

  objc_msgSend(v7, "subtitle");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setSubtitle:", v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end
