@implementation TPFavoritesCollectionViewFlowLayout

- (TPFavoritesCollectionViewFlowLayout)init
{
  TPFavoritesCollectionViewFlowLayout *v2;
  TPFavoritesCollectionViewFlowLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPFavoritesCollectionViewFlowLayout;
  v2 = -[UICollectionViewFlowLayout init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v2, "setMinimumInteritemSpacing:", 4.0);
    -[TPFavoritesCollectionViewFlowLayout caption2FontScaledValueForValue:](v3, "caption2FontScaledValueForValue:", 20.0);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v3, "setMinimumLineSpacing:");
    -[UICollectionViewFlowLayout setSectionInset:](v3, "setSectionInset:", 0.0, 0.0, 0.0, 0.0);
  }
  return v3;
}

- (double)caption2FontScaledValueForValue:(double)a3
{
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_scaledValueForValue:", a3);
  v6 = ceil(v5);

  return v6;
}

@end
