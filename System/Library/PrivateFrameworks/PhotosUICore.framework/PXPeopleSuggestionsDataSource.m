@implementation PXPeopleSuggestionsDataSource

- (id)personSuggestionAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *(_OWORD *)&a3->item;
  v5[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v5[1] = v3;
  -[PXPeopleSuggestionsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)personSuggestionAtIndexPath:(id)a3
{
  id v4;
  _OWORD v6[4];

  v4 = a3;
  -[PXPeopleSuggestionsDataSource identifier](self, "identifier");
  PXSimpleIndexPathFromIndexPath();

  memset(v6, 0, sizeof(v6));
  -[PXPeopleSuggestionsDataSource personSuggestionAtItemIndexPath:](self, "personSuggestionAtItemIndexPath:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
