@implementation PUPickerSearchSuggestionsHeaderView

- (PUPickerSearchSuggestionsHeaderView)initWithCollectionView:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  PUPickerSearchSuggestionsHeaderView *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, uint64_t, void *);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PUPickerSearchSuggestionsHeaderView;
  v9 = -[PUPickerSearchSuggestionsHeaderView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v9)
  {
    objc_initWeak(&location, v8);
    v10 = objc_alloc(MEMORY[0x1E0DC35D0]);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __73__PUPickerSearchSuggestionsHeaderView_initWithCollectionView_dataSource___block_invoke;
    v16 = &unk_1E589B948;
    objc_copyWeak(&v17, &location);
    v11 = (void *)objc_msgSend(v10, "initWithSectionProvider:", &v13);
    objc_msgSend(v7, "setCollectionViewLayout:", v11, v13, v14, v15, v16);

    objc_msgSend(v7, "setScrollEnabled:", 0);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "setDelegate:", v9);
    -[PUPickerSearchSuggestionsHeaderView addSubview:](v9, "addSubview:", v7);
    objc_storeStrong((id *)&v9->_collectionView, a3);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  CGSize result;

  width = a3.width;
  -[PUPickerSearchSuggestionsHeaderView collectionView](self, "collectionView", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, width, 10000.0);

  -[PUPickerSearchSuggestionsHeaderView collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

  -[PUPickerSearchSuggestionsHeaderView collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

  -[PUPickerSearchSuggestionsHeaderView collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionViewContentSize");
  v11 = v10;

  -[PUPickerSearchSuggestionsHeaderView collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, width, v11);

  v13 = width;
  v14 = v11;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = a3;
  -[PUPickerSearchSuggestionsHeaderView suggestionsSelectionDelegate](self, "suggestionsSelectionDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerSearchSuggestionsHeaderView collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didSelectSuggestionAtIndexPath:collectionView:", v6, v8);

  objc_msgSend(v9, "deselectItemAtIndexPath:animated:", v6, 1);
}

- (PUAssetPickerSearchSuggestionsSelectionDelegate)suggestionsSelectionDelegate
{
  return (PUAssetPickerSearchSuggestionsSelectionDelegate *)objc_loadWeakRetained((id *)&self->_suggestionsSelectionDelegate);
}

- (void)setSuggestionsSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_suggestionsSelectionDelegate, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_suggestionsSelectionDelegate);
}

id __73__PUPickerSearchSuggestionsHeaderView_initWithCollectionView_dataSource___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = v5;
    v8 = WeakRetained;
    objc_msgSend(v8, "searchDataSourceSectionProviderForSection:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sectionIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectAtIndexedSubscript:", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "layoutForSectionIdentifier:environment:collectionViewLayoutMargins:", v11, v7, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
