@implementation DirectionsHistoryRecordingHelper

+ (id)destinationGEOMapItemToRecordWithDirectionIntent:(id)a3 searchResults:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "origin"));
  v8 = objc_msgSend(v7, "itemType");

  if (v8 == 4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destination"));
    v10 = objc_msgSend(v9, "itemType");

    if (v10 == 5)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destination"));
      if (!objc_msgSend(v11, "hasResultIndex"))
      {
        v17 = 0;
        goto LABEL_9;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destination"));
      v13 = objc_msgSend(v12, "resultIndex");
      v14 = objc_msgSend(v6, "count");

      if (v13 < v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destination"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v15, "resultIndex")));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapItem"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_geoMapItem"));

LABEL_9:
        goto LABEL_7;
      }
    }
  }
  v17 = 0;
LABEL_7:

  return v17;
}

+ (id)destinationGEOMapItemToRecordWithDirectionItem:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startMapItem"));
  v5 = objc_msgSend(v4, "isCurrentLocation");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "items"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItemIfGeocoded"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_geoMapItem"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
