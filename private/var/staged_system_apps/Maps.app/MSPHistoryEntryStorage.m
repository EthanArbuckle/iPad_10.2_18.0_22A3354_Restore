@implementation MSPHistoryEntryStorage

- (id)initWithHistoryItem:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t Storage;
  void *v11;
  id v12;

  v4 = a3;
  v5 = objc_opt_class(HistoryEntryRecentsItem);
  v6 = v4;
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "historyEntry"));
    Storage = MSPHistoryEntryGetStorage();
    v11 = (void *)objc_claimAutoreleasedReturnValue(Storage);
    v12 = objc_msgSend(v11, "copy");

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (MSPHistoryEntryStorage)storageWithQuerySearch:(id)a3 timestamp:(double)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = objc_alloc_init((Class)MSPHistoryEntryStorage);
  objc_msgSend(v6, "setQuerySearch:", v5);

  objc_msgSend(v6, "setTimestamp:", a4);
  objc_msgSend(v6, "setSearchType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
  objc_msgSend(v6, "setIdentifier:", v8);

  return (MSPHistoryEntryStorage *)v6;
}

+ (MSPHistoryEntryStorage)storageWithDisplayQuery:(id)a3 locationDisplayString:(id)a4 mapRegion:(id)a5 timestamp:(double)a6
{
  void *v7;
  void *v8;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSPQuerySearch querySearchWithDisplayQuery:locationDisplayString:mapRegion:](MSPQuerySearch, "querySearchWithDisplayQuery:locationDisplayString:mapRegion:", a3, a4, a5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSPHistoryEntryStorage storageWithQuerySearch:timestamp:](MSPHistoryEntryStorage, "storageWithQuerySearch:timestamp:", v7, a6));

  return (MSPHistoryEntryStorage *)v8;
}

@end
