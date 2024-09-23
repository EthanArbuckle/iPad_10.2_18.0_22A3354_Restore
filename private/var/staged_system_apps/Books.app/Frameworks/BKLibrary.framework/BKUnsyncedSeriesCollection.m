@implementation BKUnsyncedSeriesCollection

+ (id)seriesCollectionWithSeriesID:(id)a3 name:(id)a4
{
  id v5;
  id v6;
  BKUnsyncedSeriesCollection *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(BKUnsyncedSeriesCollection);
  -[BKDefaultCollection setSeriesID:](v7, "setSeriesID:", v6);

  -[BKDefaultCollection setTitle:](v7, "setTitle:", v5);
  return v7;
}

- (id)collectionID
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDefaultCollection seriesID](self, "seriesID"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKDefaultCollection seriesID](self, "seriesID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKCollection seriesCollectionIDForSeriesID:](BKCollection, "seriesCollectionIDForSeriesID:", v4));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
