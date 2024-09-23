@implementation HistoryRAPUserDirectionRequest

+ (void)loadAllRequestsFromStorage:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RAPStorageHistoryContainer directionsRecordingStorage](RAPStorageHistoryContainer, "directionsRecordingStorage"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10093D588;
  v8[3] = &unk_1011DC668;
  v9 = v5;
  v10 = a1;
  v7 = v5;
  objc_msgSend(v6, "loadAllRecordingsWithConcurrentBlock:", v8);

}

- (HistoryRAPUserDirectionRequest)initWithHistoryItem:(id)a3 recording:(id)a4
{
  id v6;
  id v7;
  HistoryRAPUserDirectionRequest *v8;
  HistoryEntryRecentsItem *v9;
  HistoryEntryRecentsItem *historyItem;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HistoryRAPUserDirectionRequest;
  v8 = -[HistoryRAPUserDirectionRequest init](&v12, "init");
  if (v8)
  {
    v9 = -[HistoryEntryRecentsItem initWithHistoryEntry:]([HistoryEntryRecentsItem alloc], "initWithHistoryEntry:", v6);
    historyItem = v8->_historyItem;
    v8->_historyItem = v9;

    objc_storeStrong((id *)&v8->_recording, a4);
  }

  return v8;
}

- (int)requestedTransportType
{
  RAPDirectionsRecording *recording;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  int v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  recording = self->_recording;
  if (recording)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording directionsRequests](recording, "directionsRequests", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "routeAttributes"));
          v11 = objc_msgSend(v10, "hasMainTransportType");

          if ((v11 & 1) != 0)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "routeAttributes"));
            v12 = objc_msgSend(v13, "mainTransportType");

            goto LABEL_19;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          continue;
        break;
      }
    }

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](self->_historyItem, "historyEntry"));
  switch((unint64_t)objc_msgSend(v4, "transportType"))
  {
    case 1uLL:
      v12 = 0;
      break;
    case 2uLL:
      v12 = 2;
      break;
    case 3uLL:
      v12 = 1;
      break;
    case 4uLL:
      v12 = 6;
      break;
    case 5uLL:
      v12 = 3;
      break;
    default:
      v12 = 4;
      break;
  }
LABEL_19:

  return v12;
}

- (RAPDirectionsRecording)recording
{
  return self->_recording;
}

- (HistoryEntryRecentsItem)historyItem
{
  return self->_historyItem;
}

- (NSString)searchText
{
  return 0;
}

- (NSString)locationDisplayString
{
  return 0;
}

- (unint64_t)searchResultsCount
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyItem, 0);
  objc_storeStrong((id *)&self->_recording, 0);
}

@end
