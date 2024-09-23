@implementation HistoryRAPUserDirectionsWaypointSearch

+ (void)loadAllRequestsFromStorage:(id)a3 completion:(id)a4
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RAPStorageHistoryContainer directionsRecordingStorage](RAPStorageHistoryContainer, "directionsRecordingStorage"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10093DAEC;
  v7[3] = &unk_1011DC690;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "loadAllRecordingsWithConcurrentBlock:", v7);

}

- (HistoryRAPUserDirectionsWaypointSearch)initWithHistoryItem:(id)a3 recording:(id)a4 waypointIndex:(unint64_t)a5
{
  id v9;
  id v10;
  HistoryRAPUserDirectionsWaypointSearch *v11;
  HistoryRAPUserDirectionsWaypointSearch *v12;
  void *v13;
  NSArray *v14;
  NSArray *auxiliaryControls;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HistoryRAPUserDirectionsWaypointSearch;
  v11 = -[HistoryRAPUserDirectionsWaypointSearch init](&v17, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_historyItem, a3);
    v12->_waypointIndex = a5;
    objc_storeStrong((id *)&v12->_recording, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "auxiliaryControls"));
    v14 = (NSArray *)objc_msgSend(v13, "copy");
    auxiliaryControls = v12->_auxiliaryControls;
    v12->_auxiliaryControls = v14;

    if (objc_msgSend(v10, "hasOriginatingAuxiliaryControlIndex"))
    {
      v12->_hasOriginatingAuxiliaryControlIndex = 1;
      v12->_originatingAuxiliaryControlIndex = (unint64_t)objc_msgSend(v10, "originatingAuxiliaryControlIndex");
    }
  }

  return v12;
}

- (SearchResult)searchResult
{
  unint64_t v3;
  void *v4;
  void *v5;
  id *v6;
  uint64_t *v7;
  uint64_t *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;

  v3 = -[HistoryRAPUserDirectionsWaypointSearch waypointIndex](self, "waypointIndex");
  if (v3 == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryRAPUserDirectionsWaypointSearch historyItem](self, "historyItem", 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "historyEntry"));
    v6 = (id *)&v11;
    v8 = &v11;
    v7 = 0;
    goto LABEL_5;
  }
  if (!v3)
  {
    v12 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryRAPUserDirectionsWaypointSearch historyItem](self, "historyItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "historyEntry"));
    v6 = (id *)&v12;
    v7 = &v12;
    v8 = 0;
LABEL_5:
    +[SearchResult newStartWaypointSearchResult:endWaypointSearchResult:forRouteHistoryEntry:](SearchResult, "newStartWaypointSearchResult:endWaypointSearchResult:forRouteHistoryEntry:", v7, v8, v5);
    v9 = *v6;

    return (SearchResult *)v9;
  }
  return (SearchResult *)0;
}

- (id)correctedSearchTemplate
{
  unint64_t v3;
  void *v4;

  v3 = -[HistoryRAPUserDirectionsWaypointSearch waypointIndex](self, "waypointIndex");
  if (v3 == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording endWaypointCorrectedSearchTemplate](self->_recording, "endWaypointCorrectedSearchTemplate"));
  }
  else if (v3)
  {
    v4 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording startWaypointCorrectedSearchTemplate](self->_recording, "startWaypointCorrectedSearchTemplate"));
  }
  return v4;
}

- (HistoryEntryRecentsItem)historyItem
{
  return self->_historyItem;
}

- (NSString)searchText
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[HistoryRAPUserDirectionsWaypointSearch waypointIndex](self, "waypointIndex");
  if (v3 == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording endWaypoint](self->_recording, "endWaypoint"));
  }
  else
  {
    if (v3)
    {
      v6 = 0;
      return (NSString *)v6;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording startWaypoint](self->_recording, "startWaypoint"));
  }
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchString"));

  return (NSString *)v6;
}

- (NSString)locationDisplayString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryRAPUserDirectionsWaypointSearch searchResult](self, "searchResult"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "locationTitle"));

  return (NSString *)v3;
}

- (unint64_t)searchResultsCount
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryRAPUserDirectionsWaypointSearch searchResult](self, "searchResult"));
  v3 = v2 != 0;

  return v3;
}

- (void)applyToCorrectedSearch:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[HistoryRAPUserDirectionsWaypointSearch correctedSearchTemplate](self, "correctedSearchTemplate"));
  objc_msgSend(v5, "copyTo:", v4);

}

- (id)geoMapItemForSearchResultAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryRAPUserDirectionsWaypointSearch correctedSearchTemplate](self, "correctedSearchTemplate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeResponse"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resultsWithResultType:", 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoMapItem"));

  return v8;
}

- (unint64_t)waypointIndex
{
  return self->_waypointIndex;
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
  objc_storeStrong((id *)&self->_recording, 0);
}

@end
