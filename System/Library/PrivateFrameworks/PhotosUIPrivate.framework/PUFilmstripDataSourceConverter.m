@implementation PUFilmstripDataSourceConverter

- (BOOL)convertIndexPath:(id *)a3 tileKind:(id *)a4 fromDataSource:(id)a5 toDataSource:(id)a6
{
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  BOOL v13;
  uint64_t v14;

  v9 = a5;
  v10 = a6;
  if (objc_msgSend(*a4, "isEqualToString:", CFSTR("PUTileKindItemContentFilmStripIndicator")))
  {
    objc_msgSend(v10, "indicatorInfos");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    v13 = v12 >= objc_msgSend(*a3, "indexAtPosition:", 0);

  }
  else
  {
    v14 = objc_msgSend(v9, "numberOfIndexes");
    v13 = v14 == objc_msgSend(v10, "numberOfIndexes");
  }

  return v13;
}

@end
