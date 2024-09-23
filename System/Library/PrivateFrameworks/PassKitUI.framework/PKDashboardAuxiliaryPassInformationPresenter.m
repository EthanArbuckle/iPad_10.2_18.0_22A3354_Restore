@implementation PKDashboardAuxiliaryPassInformationPresenter

- (PKDashboardAuxiliaryPassInformationPresenter)initWithPass:(id)a3
{
  id v5;
  PKDashboardAuxiliaryPassInformationPresenter *v6;
  PKDashboardAuxiliaryPassInformationItemCollectionViewCell *v7;
  uint64_t v8;
  PKDashboardAuxiliaryPassInformationItemCollectionViewCell *sampleCell;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDashboardAuxiliaryPassInformationPresenter;
  v6 = -[PKDashboardAuxiliaryPassInformationPresenter init](&v11, sel_init);
  if (v6)
  {
    v7 = [PKDashboardAuxiliaryPassInformationItemCollectionViewCell alloc];
    v8 = -[PKDashboardAuxiliaryPassInformationItemCollectionViewCell initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sampleCell = v6->_sampleCell;
    v6->_sampleCell = (PKDashboardAuxiliaryPassInformationItemCollectionViewCell *)v8;

    objc_storeStrong((id *)&v6->_pass, a3);
  }

  return v6;
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
  v3 = CFSTR("AuxiliaryPassInformationItemCellReuseIdentifier");
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  PKDashboardAuxiliaryPassInformationItemCollectionViewCell *v12;
  PKDashboardAuxiliaryPassInformationItemCollectionViewCell *v13;
  PKDashboardAuxiliaryPassInformationItemCollectionViewCell *sampleCell;
  id v15;

  v15 = a3;
  v7 = a4;
  if (v15 && v7)
  {
    objc_msgSend(v15, "preferredContentSizeCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredContentSizeCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v8, (UIContentSizeCategory)v9))
    {

LABEL_6:
      v12 = [PKDashboardAuxiliaryPassInformationItemCollectionViewCell alloc];
      v13 = -[PKDashboardAuxiliaryPassInformationItemCollectionViewCell initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      sampleCell = self->_sampleCell;
      self->_sampleCell = v13;

      goto LABEL_7;
    }
    v10 = objc_msgSend(v15, "legibilityWeight");
    v11 = objc_msgSend(v7, "legibilityWeight");

    if (v10 != v11)
      goto LABEL_6;
  }
LABEL_7:

}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;

  objc_msgSend(a3, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapsURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v5, "sections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 != 0;

  }
  return v7;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v9;
  PKDashboardAuxiliaryPassInformationViewController *v10;
  id v11;

  v9 = a6;
  objc_msgSend(a3, "item");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = -[PKDashboardAuxiliaryPassInformationViewController initWithItem:forPass:]([PKDashboardAuxiliaryPassInformationViewController alloc], "initWithItem:forPass:", v11, self->_pass);
  objc_msgSend(v9, "pushViewController:animated:", v10, 1);

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
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("AuxiliaryPassInformationItemCellReuseIdentifier"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardAuxiliaryPassInformationPresenter _configureCell:forItem:inCollectionView:forIndexPath:](self, "_configureCell:forItem:inCollectionView:forIndexPath:", v11, v10, v9, v8);

  return v11;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  PKDashboardAuxiliaryPassInformationItemCollectionViewCell *sampleCell;
  id v9;
  PKDashboardAuxiliaryPassInformationItemCollectionViewCell *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  sampleCell = self->_sampleCell;
  v9 = a4;
  -[PKDashboardAuxiliaryPassInformationPresenter _configureCell:forItem:inCollectionView:forIndexPath:](self, "_configureCell:forItem:inCollectionView:forIndexPath:", sampleCell, a3, v9, a5);
  v10 = self->_sampleCell;
  objc_msgSend(v9, "bounds");
  v12 = v11;

  -[PKDashboardAuxiliaryPassInformationItemCollectionViewCell sizeThatFits:](v10, "sizeThatFits:", v12, 1.79769313e308);
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  id v13;

  v13 = a3;
  objc_msgSend(a4, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:", v8);

  objc_msgSend(v7, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSubtitle:", v9);

  objc_msgSend(v7, "subtitle2");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSubtitle2:", v10);

  objc_msgSend(v7, "mapsURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v7, "sections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;
  }

  objc_msgSend(v13, "setHideDisclosure:", v12);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end
