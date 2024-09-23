@implementation SearchHistoryRecorderFactory

+ (id)historyRecorderWithTicket:(id)a3 ticketError:(id)a4 searchInfo:(id)a5 auxiliaryControlsOrigin:(int64_t)a6 refinedMapItems:(id)a7 completionTitle:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SearchPlaceDisplayHistoryRecorder *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  SearchRAPReportingHistoryRecorder *v27;
  id v28;
  SingleResultSearchHistoryRecorder *v29;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "results"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "directionIntent"));

  if (!v19)
  {
    if (objc_msgSend(v14, "code") == (id)-8)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "publisher"));
      if (v24)
      {

LABEL_17:
        v23 = 0;
        goto LABEL_18;
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "placeCollections"));
      v26 = objc_msgSend(v25, "count");

      if (v26)
        goto LABEL_17;
    }
    if (v14)
    {
      v27 = -[SearchRAPReportingHistoryRecorder initWithTicket:auxiliaryControlsOrigin:]([SearchRAPReportingHistoryRecorder alloc], "initWithTicket:auxiliaryControlsOrigin:", v13, a6);
    }
    else
    {
      v28 = objc_msgSend(v16, "count");
      if (!objc_msgSend(v18, "count"))
        goto LABEL_17;
      if (objc_msgSend(v18, "count") == (id)1)
      {
        v29 = [SingleResultSearchHistoryRecorder alloc];
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
        v22 = -[SingleResultSearchHistoryRecorder initWithSearchResult:](v29, "initWithSearchResult:", v21);
        goto LABEL_4;
      }
      v27 = -[SearchResultsHistoryRecorder initWithTicket:searchResults:auxiliaryControlsOrigin:hasRefinedMapItems:tracksRAPReportingOnly:completionTitle:]([SearchResultsHistoryRecorder alloc], "initWithTicket:searchResults:auxiliaryControlsOrigin:hasRefinedMapItems:tracksRAPReportingOnly:completionTitle:", v13, v18, a6, v28 != 0, objc_msgSend(v18, "count") == 0, v17);
    }
    v23 = v27;
    goto LABEL_18;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "directionIntent"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[DirectionsHistoryRecordingHelper destinationGEOMapItemToRecordWithDirectionIntent:searchResults:](DirectionsHistoryRecordingHelper, "destinationGEOMapItemToRecordWithDirectionIntent:searchResults:", v20, v18));

  if (!v21)
  {
    v23 = 0;
    goto LABEL_9;
  }
  v22 = -[SearchPlaceDisplayHistoryRecorder initWithGEOMapItem:]([SearchPlaceDisplayHistoryRecorder alloc], "initWithGEOMapItem:", v21);
LABEL_4:
  v23 = v22;
LABEL_9:

LABEL_18:
  return v23;
}

@end
