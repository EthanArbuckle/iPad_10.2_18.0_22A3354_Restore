@implementation SearchResultsHistoryRecorder

- (SearchResultsHistoryRecorder)initWithTicket:(id)a3 searchResults:(id)a4 auxiliaryControlsOrigin:(int64_t)a5 hasRefinedMapItems:(BOOL)a6 tracksRAPReportingOnly:(BOOL)a7 completionTitle:(id)a8
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  SearchResultsHistoryRecorder *v18;
  SearchResultsHistoryRecorder *v19;
  NSArray *v20;
  NSArray *searchResults;
  id v22;
  void *v23;
  MSPMutableHistoryEntrySearch *v24;
  MSPMutableHistoryEntrySearch *searchRequestHistoryItem;
  objc_super v27;

  v9 = a7;
  v15 = a3;
  v16 = a4;
  v17 = a8;
  v27.receiver = self;
  v27.super_class = (Class)SearchResultsHistoryRecorder;
  v18 = -[SearchResultsHistoryRecorder init](&v27, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_ticket, a3);
    v20 = (NSArray *)objc_msgSend(v16, "copy");
    searchResults = v19->_searchResults;
    v19->_searchResults = v20;

    v19->_auxiliaryControlsOrigin = a5;
    v19->_hasRefinedMapItems = a6;
    v22 = objc_alloc((Class)MSPMutableHistoryEntrySearch);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsHistoryRecorder ticket](v19, "ticket"));
    v24 = (MSPMutableHistoryEntrySearch *)objc_msgSend(v22, "initWithTicket:completionTitle:", v23, v17);
    searchRequestHistoryItem = v19->_searchRequestHistoryItem;
    v19->_searchRequestHistoryItem = v24;

    -[MSPMutableHistoryEntrySearch setTracksRAPReportingOnly:](v19->_searchRequestHistoryItem, "setTracksRAPReportingOnly:", v9);
  }

  return v19;
}

- (void)recordItemInHistory
{
  -[SearchResultsHistoryRecorder recordItemInHistoryWithCompletion:](self, "recordItemInHistoryWithCompletion:", 0);
}

- (void)recordItemInHistoryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1006284AC;
  v23 = sub_1006284BC;
  v24 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsHistoryRecorder searchRequestHistoryItem](self, "searchRequestHistoryItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "query"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsHistoryRecorder searchResults](self, "searchResults"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1006284C4;
  v16[3] = &unk_1011BE6C0;
  v18 = &v19;
  v8 = v6;
  v17 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v16);

  v9 = v20[5];
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsHistoryRecorder searchRequestHistoryItem](self, "searchRequestHistoryItem"));
    objc_msgSend(v10, "setLocationDisplayString:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsHistoryRecorder searchRequestHistoryItem](self, "searchRequestHistoryItem"));
    objc_msgSend(v12, "setUsageDate:", v11);

  }
  if (!-[SearchResultsHistoryRecorder hasRefinedMapItems](self, "hasRefinedMapItems"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsHistoryRecorder searchRequestHistoryItem](self, "searchRequestHistoryItem"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1006285F4;
    v14[3] = &unk_1011BE6E8;
    v15 = v4;
    +[HistoryEntryRecentsItem saveSearch:completion:](HistoryEntryRecentsItem, "saveSearch:completion:", v13, v14);

  }
  _Block_object_dispose(&v19, 8);

}

- (MSPMutableHistoryEntrySearch)searchRequestHistoryItem
{
  return self->_searchRequestHistoryItem;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (BOOL)hasRefinedMapItems
{
  return self->_hasRefinedMapItems;
}

- (MKMapServiceSearchTicket)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
  objc_storeStrong((id *)&self->_ticket, a3);
}

- (int64_t)auxiliaryControlsOrigin
{
  return self->_auxiliaryControlsOrigin;
}

- (void)setAuxiliaryControlsOrigin:(int64_t)a3
{
  self->_auxiliaryControlsOrigin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_searchRequestHistoryItem, 0);
}

@end
