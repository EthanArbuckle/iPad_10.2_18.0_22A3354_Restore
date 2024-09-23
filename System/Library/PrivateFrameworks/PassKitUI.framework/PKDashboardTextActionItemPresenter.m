@implementation PKDashboardTextActionItemPresenter

- (PKDashboardTextActionItemPresenter)init
{
  PKDashboardTextActionItemPresenter *v2;
  PKDashboardTextCollectionViewCell *v3;
  uint64_t v4;
  PKDashboardTextCollectionViewCell *sampleCell;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKDashboardTextActionItemPresenter;
  v2 = -[PKDashboardTextActionItemPresenter init](&v7, sel_init);
  if (v2)
  {
    v3 = [PKDashboardTextCollectionViewCell alloc];
    v4 = -[PKDashboardTextCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKDashboardTextCollectionViewCell *)v4;

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
  v3 = CFSTR("ActionItemCellReuseIdentifier");
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  void *v5;
  BOOL v6;

  objc_msgSend(a3, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  id v11;

  v11 = a3;
  v8 = a4;
  objc_msgSend(v11, "action");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v11, "action");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v10)[2](v10, v8);

  }
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
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("ActionItemCellReuseIdentifier"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardTextActionItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:](self, "_configureCell:forItem:inCollectionView:forIndexPath:", v11, v10, v9, v8);

  return v11;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  PKDashboardTextCollectionViewCell *sampleCell;
  id v10;
  id v11;
  PKDashboardTextCollectionViewCell *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  v8 = a3;
  sampleCell = self->_sampleCell;
  v10 = a5;
  v11 = a4;
  -[PKDashboardTextCollectionViewCell setTextLayoutStyle:](sampleCell, "setTextLayoutStyle:", objc_msgSend(v8, "layoutStyle"));
  -[PKDashboardTextActionItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:](self, "_configureCell:forItem:inCollectionView:forIndexPath:", self->_sampleCell, v8, v11, v10);

  v12 = self->_sampleCell;
  objc_msgSend(v11, "bounds");
  v14 = v13;

  -[PKDashboardTextCollectionViewCell sizeThatFits:](v12, "sizeThatFits:", v14, 1.79769313e308);
  v16 = v15;
  v18 = v17;

  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  id v7;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  v7 = a4;
  objc_msgSend(v7, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setIconImage:", v8);

  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTitle:", v9);

  objc_msgSend(v7, "titleImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTitleImage:", v10);

  objc_msgSend(v7, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSubtitle:", v11);

  objc_msgSend(v7, "subtitleImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSubtitleImage:", v12);

  objc_msgSend(v7, "subtitleColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSubtitleColor:", v13);

  objc_msgSend(v7, "accessoryImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAccessoryImage:", v14);

  objc_msgSend(v7, "accessoryColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAccessoryColor:", v15);

  objc_msgSend(v21, "setTextLayoutStyle:", objc_msgSend(v7, "layoutStyle"));
  objc_msgSend(v7, "titleColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "action");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v20 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v16 = (void *)v20;
    }
LABEL_12:
    v19 = 1;
    goto LABEL_13;
  }
  v18 = objc_msgSend(v7, "actionStyle");
  if (v18 == 1)
  {
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (!v18 && !v16)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = 0;
LABEL_13:
  objc_msgSend(v21, "setHideDisclosure:", v19);
  objc_msgSend(v21, "setTitleColor:", v16);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end
