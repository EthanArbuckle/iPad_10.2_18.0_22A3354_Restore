@implementation BKDefaultCollection

- (NSNumber)deletedFlag
{
  return (NSNumber *)&__kCFBooleanFalse;
}

- (NSNumber)sortKey
{
  return (NSNumber *)&off_CA120;
}

- (NSString)title
{
  NSString *title;
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  title = self->_title;
  if (!title)
  {
    v4 = BKLibraryFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Collections_AllBooks"), CFSTR("All Books"), &stru_C40E8));
    v7 = self->_title;
    self->_title = v6;

    title = self->_title;
  }
  return title;
}

- (NSString)details
{
  return (NSString *)&stru_C40E8;
}

- (NSNumber)hidden
{
  return (NSNumber *)&__kCFBooleanFalse;
}

- (NSNumber)sortMode
{
  return (NSNumber *)&off_C9F40;
}

- (NSNumber)viewMode
{
  return (NSNumber *)&off_C9F40;
}

- (NSString)collectionID
{
  return (NSString *)kBKCollectionDefaultAll;
}

- (NSDate)lastModification
{
  return 0;
}

- (NSSet)members
{
  return 0;
}

- (BOOL)isSeriesCollection
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKDefaultCollection seriesID](self, "seriesID"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)allowsManualAddition
{
  return 0;
}

- (BOOL)isEqualToCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDefaultCollection collectionID](self, "collectionID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionID"));

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (BOOL)canDeleteCollection
{
  return 0;
}

- (BOOL)isDefaultCollection
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKDefaultCollection seriesID](self, "seriesID"));
  v3 = v2 == 0;

  return v3;
}

- (BOOL)deleteRemovesFromCollection
{
  return 0;
}

- (BOOL)isValidForSerialization
{
  return 0;
}

+ (BOOL)isValidForDeserialization:(id)a3
{
  return 0;
}

- (id)dictionaryRepresentation
{
  return 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKDefaultCollection title](self, "title"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKDefaultCollection collectionID](self, "collectionID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDefaultCollection sortKey](self, "sortKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKDefaultCollection sortMode](self, "sortMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDefaultCollection viewMode](self, "viewMode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKDefaultCollection deletedFlag](self, "deletedFlag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKDefaultCollection hidden](self, "hidden"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKDefaultCollection lastModification](self, "lastModification"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKDefaultCollection members](self, "members"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKDefaultCollection seriesID](self, "seriesID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("   %@ (%p) \n title: %@\n collectionID: %@\n sortKey: %@\n sortMode: %@\n viewMode: %@\n deletedFlag: %@\n hidden: %@\n lastModification: %@\n member count: %@\n seriesID: %@"), CFSTR("self"), self, v14, v15, v3, v4, v5, v13, v6, v7, v9, v10));

  return (NSString *)v11;
}

- (NSNumber)maxSortKey
{
  return self->_maxSortKey;
}

- (NSString)seriesID
{
  return self->_seriesID;
}

- (void)setSeriesID:(id)a3
{
  objc_storeStrong((id *)&self->_seriesID, a3);
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_seriesID, 0);
  objc_storeStrong((id *)&self->_maxSortKey, 0);
}

@end
