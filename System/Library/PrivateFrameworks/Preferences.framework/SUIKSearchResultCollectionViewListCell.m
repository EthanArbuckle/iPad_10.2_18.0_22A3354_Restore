@implementation SUIKSearchResultCollectionViewListCell

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUIKSearchResultCollectionViewListCell;
  -[SUIKSearchResultCollectionViewListCell prepareForReuse](&v3, sel_prepareForReuse);
  -[SUIKSearchResultCollectionViewListCell configureWithSearchableItem:](self, "configureWithSearchableItem:", 0);
}

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  if (updateConfigurationUsingState__onceToken != -1)
    dispatch_once(&updateConfigurationUsingState__onceToken, &__block_literal_global_34);
  objc_msgSend(MEMORY[0x1E0CEA718], "subtitleCellConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSListController appearance](PSListController, "appearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColor:", v6);

  +[PSListController appearance](PSListController, "appearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "altTextColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondaryTextProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColor:", v9);

  v11 = *(double *)&updateConfigurationUsingState__iconSize_0;
  v12 = *(double *)&updateConfigurationUsingState__iconSize_1;
  objc_msgSend(v4, "imageProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setReservedLayoutSize:", v11, v12);

  objc_msgSend(v4, "setImage:", updateConfigurationUsingState__icon);
  v14 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[SUIKSearchResultCollectionViewListCell searchableItem](self, "searchableItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attributeSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "subject");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = CFSTR(" ");
  v20 = (void *)objc_msgSend(v14, "initWithString:", v19);
  objc_msgSend(v4, "setAttributedText:", v20);

  -[SUIKSearchResultCollectionViewListCell searchableItem](self, "searchableItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "attributeSet");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contentDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (v24)
  {
    v25 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[SUIKSearchResultCollectionViewListCell searchableItem](self, "searchableItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "attributeSet");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "contentDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v25, "initWithString:", v28);
    objc_msgSend(v4, "setSecondaryAttributedText:", v29);

  }
  -[SUIKSearchResultCollectionViewListCell setContentConfiguration:](self, "setContentConfiguration:", v4);

}

void __72__SUIKSearchResultCollectionViewListCell_updateConfigurationUsingState___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;

  PSBlankIconImage();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "size");
  updateConfigurationUsingState__iconSize_0 = v1;
  updateConfigurationUsingState__iconSize_1 = v2;

  v3 = objc_alloc_init(MEMORY[0x1E0CEA638]);
  v4 = (void *)updateConfigurationUsingState__icon;
  updateConfigurationUsingState__icon = (uint64_t)v3;

}

- (void)configureWithSearchableItem:(id)a3
{
  -[SUIKSearchResultCollectionViewListCell setSearchableItem:](self, "setSearchableItem:", a3);
  -[SUIKSearchResultCollectionViewListCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (CSSearchableItem)searchableItem
{
  return self->_searchableItem;
}

- (void)setSearchableItem:(id)a3
{
  objc_storeStrong((id *)&self->_searchableItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchableItem, 0);
}

@end
