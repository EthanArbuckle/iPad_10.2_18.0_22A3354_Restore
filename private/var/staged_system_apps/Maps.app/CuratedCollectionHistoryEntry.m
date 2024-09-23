@implementation CuratedCollectionHistoryEntry

- (CuratedCollectionHistoryEntry)initWithMapsSyncHistoryCuratedCollection:(id)a3 placeCollection:(id)a4
{
  id v7;
  id v8;
  CuratedCollectionHistoryEntry *v9;
  CuratedCollectionHistoryEntry *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CuratedCollectionHistoryEntry;
  v9 = -[CuratedCollectionHistoryEntry init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_curatedCollection, a3);
    objc_storeStrong((id *)&v10->_placeCollection, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = (unint64_t)-[MSHistoryCuratedCollection hash](self->_curatedCollection, "hash");
  return (unint64_t)-[GEOPlaceCollection hash](self->_placeCollection, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  CuratedCollectionHistoryEntry *v4;
  CuratedCollectionHistoryEntry *v5;
  uint64_t v6;
  CuratedCollectionHistoryEntry *v7;
  MSHistoryCuratedCollection *v8;
  MSHistoryCuratedCollection *v9;
  GEOPlaceCollection *v10;
  GEOPlaceCollection *v11;
  unsigned __int8 v12;

  v4 = (CuratedCollectionHistoryEntry *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = (MSHistoryCuratedCollection *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHistoryEntry curatedCollection](v7, "curatedCollection"));
    v9 = v8;
    if (v8 == self->_curatedCollection || -[MSHistoryCuratedCollection isEqual:](v8, "isEqual:"))
    {
      v10 = (GEOPlaceCollection *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionHistoryEntry placeCollection](v7, "placeCollection"));
      v11 = v10;
      if (v10 == self->_placeCollection)
        v12 = 1;
      else
        v12 = -[GEOPlaceCollection isEqual:](v10, "isEqual:");

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (Class)mutableObjectClass
{
  return 0;
}

+ (id)mutableObjectProtocol
{
  return 0;
}

- (id)storageIdentifier
{
  return -[MSHistoryCuratedCollection storageIdentifier](self->_curatedCollection, "storageIdentifier");
}

- (NSDate)usageDate
{
  return (NSDate *)-[MSHistoryCuratedCollection usageDate](self->_curatedCollection, "usageDate");
}

- (BOOL)isUserVisibleDuplicateOfEntry:(id)a3
{
  return -[MSHistoryCuratedCollection isUserVisibleDuplicateOfEntry:](self->_curatedCollection, "isUserVisibleDuplicateOfEntry:", a3);
}

- (BOOL)tracksRAPReportingOnly
{
  return -[MSHistoryCuratedCollection tracksRAPReportingOnly](self->_curatedCollection, "tracksRAPReportingOnly");
}

- (BOOL)isFailed
{
  return 0;
}

- (MSHistoryCuratedCollection)curatedCollection
{
  return self->_curatedCollection;
}

- (GEOPlaceCollection)placeCollection
{
  return self->_placeCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeCollection, 0);
  objc_storeStrong((id *)&self->_curatedCollection, 0);
}

@end
