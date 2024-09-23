@implementation _UISearchSuggestionsListCollectionViewCell

- (_UISearchSuggestionsListCollectionViewCell)initWithFrame:(CGRect)a3
{
  _UISearchSuggestionsListCollectionViewCell *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UISearchSuggestionsListCollectionViewCell;
  v3 = -[UICollectionViewListCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIColor labelColor](UIColor, "labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](v3, "setTintColor:", v4);

  }
  return v3;
}

- (void)setRepresentedSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  +[UIListContentConfiguration cellConfiguration](UIListContentConfiguration, "cellConfiguration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v5);

  objc_msgSend(v4, "localizedSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v6);

  objc_msgSend(v4, "localizedAttributedSuggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributedText:", v7);

  -[UICollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v8);
  objc_storeWeak((id *)&self->_representedSuggestion, v4);

}

- (_UISearchSuggestion_dci)representedSuggestion
{
  return (_UISearchSuggestion_dci *)objc_loadWeakRetained((id *)&self->_representedSuggestion);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_representedSuggestion);
}

@end
