@implementation RTRoutineManager

- (void)_maps_fetchAllVisitedLocationsOfInterestWithHandler:(id)a3
{
  -[RTRoutineManager _maps_fetchLocationsOfInterestWithTypes:handler:](self, "_maps_fetchLocationsOfInterestWithTypes:handler:", 2, a3);
}

- (void)_maps_fetchAllLocationsOfInterestWithHandler:(id)a3
{
  -[RTRoutineManager _maps_fetchLocationsOfInterestWithTypes:handler:](self, "_maps_fetchLocationsOfInterestWithTypes:handler:", 3, a3);
}

- (void)_maps_fetchPredictedLocationsOfInterestWithHandler:(id)a3
{
  -[RTRoutineManager _maps_fetchLocationsOfInterestWithTypes:handler:](self, "_maps_fetchLocationsOfInterestWithTypes:handler:", 4, a3);
}

- (void)_maps_fetchLocationsOfInterestWithTypes:(int)a3 handler:(id)a4
{
  char v4;
  id v6;
  dispatch_group_t v7;
  id v8;
  NSObject *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[4];
  _QWORD *v25;
  _QWORD v26[4];
  id v27;
  NSObject *v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;

  v4 = a3;
  v6 = a4;
  v7 = dispatch_group_create();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_100AC02E4;
  v30[4] = sub_100AC02F4;
  v31 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100AC02FC;
  v26[3] = &unk_1011E19E8;
  v29 = v30;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v27 = v8;
  v9 = v7;
  v28 = v9;
  v10 = objc_retainBlock(v26);
  if ((v4 & 1) != 0)
  {
    dispatch_group_enter(v9);
    -[RTRoutineManager fetchLocationsOfInterestOfType:withHandler:](self, "fetchLocationsOfInterestOfType:withHandler:", 0, v10);
    dispatch_group_enter(v9);
    -[RTRoutineManager fetchLocationsOfInterestOfType:withHandler:](self, "fetchLocationsOfInterestOfType:withHandler:", 1, v10);
  }
  if ((v4 & 2) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:", -4233600.0));
    dispatch_group_enter(v9);
    -[RTRoutineManager fetchLocationsOfInterestVisitedBetweenStartDate:endDate:withHandler:](self, "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:withHandler:", v12, v11, v10);

  }
  if ((v4 & 4) != 0)
  {
    v13 = objc_alloc((Class)NSDateInterval);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v15 = objc_msgSend(v13, "initWithStartDate:duration:", v14, 3024000.0);

    dispatch_group_enter(v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endDate"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100AC0418;
    v24[3] = &unk_1011AE268;
    v25 = v10;
    -[RTRoutineManager fetchPredictedLocationsOfInterestBetweenStartDate:endDate:withHandler:](self, "fetchPredictedLocationsOfInterestBetweenStartDate:endDate:withHandler:", v16, v17, v24);

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100AC0598;
  block[3] = &unk_1011E1A10;
  v22 = v6;
  v23 = v30;
  v21 = v8;
  v18 = v8;
  v19 = v6;
  dispatch_group_notify(v9, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v30, 8);
}

@end
