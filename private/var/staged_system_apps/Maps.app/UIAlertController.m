@implementation UIAlertController

+ (id)_maps_confirmationAlertControllerForBlockingTripInSummary:(id)a3 userInterfaceIdiom:(int64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "sharedTrips"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_maps_confirmationAlertControllerForBlockingTrip:userInterfaceIdiom:completion:", v10, a4, v8));
  return v11;
}

+ (id)_maps_confirmationAlertControllerForBlockingTrip:(id)a3 userInterfaceIdiom:(int64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[Share ETA] Alert's title when blocking a trip"), CFSTR("localized string not found"), 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "senderName"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v12, 0, a4 == 5));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("[Share ETA] Block alert's confirm button title"), CFSTR("localized string not found"), 0));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1002BF090;
  v26[3] = &unk_1011AD960;
  v16 = v7;
  v27 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 2, v26));

  objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("SharedTripBlockAction"));
  objc_msgSend(v13, "addAction:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("[Share ETA] Block alert's cancel button title"), CFSTR("localized string not found"), 0));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1002BF0A0;
  v24[3] = &unk_1011AD960;
  v25 = v16;
  v20 = v16;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v19, 1, v24));

  objc_msgSend(v21, "setAccessibilityIdentifier:", CFSTR("SharedTripCancelAction"));
  objc_msgSend(v13, "addAction:", v21);
  objc_msgSend(v13, "setPreferredAction:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
  objc_msgSend(v22, "setAccessibilityIdentifier:", CFSTR("SharedTripDeleteAlert"));

  return v13;
}

+ (id)clusteredVehiclesSelectionAlertControllerForClusteredSegment:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD v39[5];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Transit_Clustered_Vehicle_Action_Sheet_Cancel"), CFSTR("localized string not found"), 0));
  v10 = objc_claimAutoreleasedReturnValue(+[UIAlertAction _actionWithTitle:image:style:handler:shouldDismissHandler:](UIAlertAction, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v9, 0, 1, 0, &stru_1011B0910));

  v27 = (void *)v10;
  objc_msgSend(v7, "addAction:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clusteredRouteVehicleInfoItems"));
  v12 = objc_msgSend(v11, "count");
  v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v12);
  v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v12);
  v15 = objc_alloc_init((Class)NSMutableArray);
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0x7FFFFFFFFFFFFFFFLL;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1002E0904;
  v31[3] = &unk_1011B0960;
  v16 = v13;
  v32 = v16;
  v17 = v14;
  v33 = v17;
  v18 = v15;
  v34 = v18;
  v19 = v5;
  v35 = v19;
  v20 = v6;
  v37 = v20;
  v21 = v7;
  v36 = v21;
  v38 = v39;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction _maps_alertActionsForTransitLinesWithNames:artworks:selectionHandlers:](UIAlertAction, "_maps_alertActionsForTransitLinesWithNames:artworks:selectionHandlers:", v16, v17, v18));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1002E0C34;
  v28[3] = &unk_1011B0988;
  v30 = v39;
  v23 = v21;
  v29 = v23;
  objc_msgSend(v22, "enumerateObjectsUsingBlock:", v28);
  v24 = v29;
  v25 = v23;

  _Block_object_dispose(v39, 8);
  return v25;
}

+ (id)_maps_alertControllerForTicketedSegments:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  id v23;
  id v24;
  void *v25;
  void *v27;
  id obj;
  _QWORD v29[4];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 7014, 606, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Transit_Get_Tickets_Action_Sheet_Title"), CFSTR("localized string not found"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, 0, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Transit_Get_Tickets_Action_Sheet_Cancel"), CFSTR("localized string not found"), 0));
  v10 = objc_claimAutoreleasedReturnValue(+[UIAlertAction _actionWithTitle:image:style:handler:shouldDismissHandler:](UIAlertAction, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v9, 0, 1, 0, &stru_1011C6900));

  v27 = (void *)v10;
  objc_msgSend(v7, "addAction:", v10);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v3;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ticketingUrl"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAddingPercentEncodingWithAllowedCharacters:", v17));

        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v18));
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "segmentName"));
        v21 = (void *)v20;
        v29[0] = _NSConcreteStackBlock;
        if (v20)
          v22 = (const __CFString *)v20;
        else
          v22 = &stru_1011EB268;
        v29[1] = 3221225472;
        v29[2] = sub_10079D380;
        v29[3] = &unk_1011B0210;
        v30 = v18;
        v31 = v19;
        v23 = v19;
        v24 = v18;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v22, 0, v29));

        objc_msgSend(v7, "addAction:", v25);
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v12);
  }

  return v7;
}

+ (id)_maps_confirmationAlertControllerForDeletingCollections:(id)a3 userInterfaceIdiom:(int64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;

  v7 = a5;
  v8 = a3;
  v9 = objc_msgSend(v8, "count");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = v10;
  if (v9 == (id)1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[Collections] Alert's title when deleting a guide"), CFSTR("localized string not found"), 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
    v15 = (void *)v14;
    v16 = &stru_1011EB268;
    if (v14)
      v16 = (const __CFString *)v14;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v16));

    v18 = 0;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[Collections] Alert's title when deleting guides"), CFSTR("localized string not found"), 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, objc_msgSend(v8, "count")));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Collections] Alert's subtitle when deleting guides"), CFSTR("localized string not found"), 0));
    v20 = objc_msgSend(v8, "count");

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v20));
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v17, v18, a4 == 5));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("[Collection] Alert's delete button title"), CFSTR("localized string not found"), 0));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100945BAC;
  v34[3] = &unk_1011AD960;
  v24 = v7;
  v35 = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v23, 2, v34));

  objc_msgSend(v25, "setAccessibilityIdentifier:", CFSTR("CollectionDeleteAction"));
  objc_msgSend(v21, "addAction:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("[Collection] Alert's cancel button title"), CFSTR("localized string not found"), 0));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100945BBC;
  v32[3] = &unk_1011AD960;
  v33 = v24;
  v28 = v24;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v27, 1, v32));

  objc_msgSend(v29, "setAccessibilityIdentifier:", CFSTR("CollectionCancelAction"));
  objc_msgSend(v21, "addAction:", v29);
  objc_msgSend(v21, "setPreferredAction:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "view"));
  objc_msgSend(v30, "setAccessibilityIdentifier:", CFSTR("CollectionDeleteAlert"));

  return v21;
}

@end
