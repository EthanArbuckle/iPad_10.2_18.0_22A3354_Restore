@implementation MapsSuggestionsPredictor

- (void)storeSignalPackData:(id)a3 forEntryData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsSignalPack signalPackFromData:](MapsSuggestionsSignalPack, "signalPackFromData:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsEntry entryWithData:](MapsSuggestionsEntry, "entryWithData:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoMapItem"));
  -[MapsSuggestionsPredictor storeSignalPack:forMapItem:andEntry:](self, "storeSignalPack:forMapItem:andEntry:", v9, v8, v7);

}

- (void)storeSignalPackData:(id)a3 forMapItemData:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsSignalPack signalPackFromData:](MapsSuggestionsSignalPack, "signalPackFromData:", a3));
  v7 = objc_msgSend(objc_alloc((Class)GEOMapItemStorage), "initWithData:", v6);

  -[MapsSuggestionsPredictor storeSignalPack:forMapItem:andEntry:](self, "storeSignalPack:forMapItem:andEntry:", v8, v7, 0);
}

@end
