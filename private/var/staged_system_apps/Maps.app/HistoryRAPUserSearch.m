@implementation HistoryRAPUserSearch

+ (void)loadAllSearchesFromStorage:(id)a3 completion:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10093E1B8;
  v6[3] = &unk_1011DC690;
  v7 = a4;
  v5 = v7;
  objc_msgSend(a3, "loadAllRecordingsWithConcurrentBlock:", v6);

}

- (HistoryRAPUserSearch)initWithHistoryItem:(id)a3 correctedSearchTemplate:(id)a4 auxiliaryControls:(id)a5 originatingIndex:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  HistoryRAPUserSearch *v14;
  HistoryRAPUserSearch *v15;
  NSArray *v16;
  NSArray *auxiliaryControls;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  NSString *searchText;
  uint64_t v24;
  NSString *locationDisplayString;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v27.receiver = self;
  v27.super_class = (Class)HistoryRAPUserSearch;
  v14 = -[HistoryRAPUserSearch init](&v27, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_historyItem, a3);
    objc_storeStrong((id *)&v15->_template, a4);
    v16 = (NSArray *)objc_msgSend(v13, "copy");
    auxiliaryControls = v15->_auxiliaryControls;
    v15->_auxiliaryControls = v16;

    if (a6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v15->_hasOriginatingAuxiliaryControlIndex = 1;
      v15->_originatingAuxiliaryControlIndex = a6;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryRAPUserSearch historyItem](v15, "historyItem"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "historyEntry"));

    if (objc_msgSend(v19, "conformsToProtocol:", &OBJC_PROTOCOL___MSPHistoryEntrySearch))
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;

    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "query"));
    searchText = v15->_searchText;
    v15->_searchText = (NSString *)v22;

    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "locationDisplayString"));
    locationDisplayString = v15->_locationDisplayString;
    v15->_locationDisplayString = (NSString *)v24;

  }
  return v15;
}

- (void)applyToCorrectedSearch:(id)a3
{
  -[GEORPCorrectedSearch copyTo:](self->_template, "copyTo:", a3);
}

- (unint64_t)searchResultsCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPCorrectedSearch placeResponse](self->_template, "placeResponse"));
  v3 = objc_msgSend(v2, "resultsCountWithResultType:", 1);

  return (unint64_t)v3;
}

- (id)geoMapItemForSearchResultAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPCorrectedSearch placeResponse](self->_template, "placeResponse"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resultsWithResultType:", 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geoMapItem"));

  return v7;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (NSString)locationDisplayString
{
  return self->_locationDisplayString;
}

- (HistoryEntryRecentsItem)historyItem
{
  return self->_historyItem;
}

- (NSArray)auxiliaryControls
{
  return self->_auxiliaryControls;
}

- (BOOL)hasOriginatingAuxiliaryControlIndex
{
  return self->_hasOriginatingAuxiliaryControlIndex;
}

- (unint64_t)originatingAuxiliaryControlIndex
{
  return self->_originatingAuxiliaryControlIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryControls, 0);
  objc_storeStrong((id *)&self->_historyItem, 0);
  objc_storeStrong((id *)&self->_locationDisplayString, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_template, 0);
}

@end
