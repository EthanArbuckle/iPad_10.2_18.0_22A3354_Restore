@implementation HistoryRecentItemOperationUtilities

+ (void)fetchHistoryItemsMatchingMapItem:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = objc_alloc((Class)_TtC8MapsSync22MapsSyncQueryPredicate);
  objc_msgSend(v5, "coordinate");
  v10 = v9;
  objc_msgSend(v5, "coordinate");
  v11 = objc_msgSend(v8, "initWithCenterLatitude:centerLongitude:squareSideLengthMeters:", v10);
  v12 = objc_msgSend(objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions), "initWithPredicate:sortDescriptors:range:", v11, 0, 0);
  v13 = objc_alloc_init((Class)MSHistoryPlaceItemRequest);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10076ADF4;
  v17[3] = &unk_1011B7580;
  v18 = v5;
  v19 = v7;
  v20 = v6;
  v14 = v6;
  v15 = v7;
  v16 = v5;
  objc_msgSend(v13, "fetchWithOptions:completionHandler:", v12, v17);

}

+ (void)saveGeoMapItem:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10076B0AC;
  v5[3] = &unk_1011B7B30;
  v6 = a3;
  v4 = v6;
  objc_msgSend(a1, "fetchHistoryItemsMatchingMapItem:completion:", v4, v5);

}

@end
