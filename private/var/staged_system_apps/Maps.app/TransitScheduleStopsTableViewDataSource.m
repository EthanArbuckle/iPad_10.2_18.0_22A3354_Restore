@implementation TransitScheduleStopsTableViewDataSource

- (TransitScheduleStopsTableViewDataSource)initWithBoardingStopMuid:(unint64_t)a3 alightStopMuid:(unint64_t)a4 alightHallMuid:(unint64_t)a5 alightStationMuid:(unint64_t)a6 transitLine:(id)a7 referenceDate:(id)a8
{
  TransitScheduleStopsTableViewDataSource *result;

  result = -[TransitScheduleStopsTableViewDataSource initWithBoardingStopMuid:transitLine:referenceDate:](self, "initWithBoardingStopMuid:transitLine:referenceDate:", a3, a7, a8);
  if (result)
  {
    result->_alightStopMuid = a4;
    result->_alightHallMuid = a5;
    result->_alightStationMuid = a6;
    result->_hasAlightStop = 1;
  }
  return result;
}

- (TransitScheduleStopsTableViewDataSource)initWithBoardingStopMuid:(unint64_t)a3 transitLine:(id)a4 referenceDate:(id)a5
{
  id v9;
  id v10;
  TransitScheduleStopsTableViewDataSource *v11;
  TransitScheduleStopsTableViewDataSource *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TransitScheduleStopsTableViewDataSource;
  v11 = -[TransitScheduleStopsTableViewDataSource init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    v11->_boardingStopMuid = a3;
    objc_storeStrong((id *)&v11->_transitLine, a4);
    objc_storeStrong((id *)&v12->_referenceDate, a5);
    v12->_remoteNetworkState = 0;
    *(int64x2_t *)&v12->_alightStopItemIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  }

  return v12;
}

+ (void)registerCellsForCollectionView:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v3 = objc_opt_class(TransitSchedulesStopViewCell);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TransitSchedulesStopViewCell identifier](TransitSchedulesStopViewCell, "identifier"));
  objc_msgSend(v7, "registerClass:forCellWithReuseIdentifier:", v3, v4);

  v5 = objc_opt_class(TransitSchedulesCollapsedStopsPlaceholderViewCell);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TransitSchedulesCollapsedStopsPlaceholderViewCell identifier](TransitSchedulesCollapsedStopsPlaceholderViewCell, "identifier"));
  objc_msgSend(v7, "registerClass:forCellWithReuseIdentifier:", v5, v6);

  objc_msgSend(v7, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(TransitScheduleNetworkActivityTableViewCell), CFSTR("TransitScheduleNetworkActivityTableViewCellIdentifier"));
}

- (void)removeAllStops
{
  NSArray *transitTripStopItems;

  transitTripStopItems = self->_transitTripStopItems;
  self->_transitTripStopItems = 0;

  -[TransitScheduleStopsTableViewDataSource setRemoteNetworkState:](self, "setRemoteNetworkState:", 0);
}

- (void)buildTransitTripStopItemsWithTransitStops:(id)a3 boardingStopDepartureDate:(id)a4 maintainingCollapsedState:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSArray *v10;
  NSArray *transitStops;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  unint64_t boardingStopMuid;
  id v17;
  NSObject *v18;
  unint64_t alightStopMuid;
  unint64_t boardingStopItemIndex;
  _BOOL4 v22;
  char *alightStopItemIndex;
  id v24;
  NSArray *v25;
  id v26;
  id v27;
  int v28;
  int v29;
  uint64_t v30;
  void *i;
  void *v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  void *v41;
  int v42;
  TransitTripStopItem *v43;
  uint64_t v44;
  int v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  TransitTripStopItem *v49;
  char v50;
  void *v51;
  char *v52;
  char v53;
  NSArray *v54;
  NSArray *transitTripStopItems;
  id v56;
  NSObject *v57;
  void *v58;
  id v59;
  id v60;
  int v61;
  int v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[5];
  id v72;
  id v73;
  uint8_t v74[128];
  uint8_t buf[4];
  unint64_t v76;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (NSArray *)objc_msgSend(v8, "copy");
  transitStops = self->_transitStops;
  self->_transitStops = v10;

  objc_storeStrong((id *)&self->_boardingStopDepartureDate, a4);
  *(int64x2_t *)&self->_alightStopItemIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  self->_mostRecentPastDepartureStopItemIndex = 0x7FFFFFFFFFFFFFFFLL;
  if (!v5)
    self->_canShowMoreStops = 1;
  v12 = objc_alloc_init((Class)NSMutableIndexSet);
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_1002F2F0C;
  v71[3] = &unk_1011B0ED8;
  v71[4] = self;
  v59 = v9;
  v72 = v59;
  v13 = v12;
  v73 = v13;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v71);
  if (self->_boardingStopItemIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = sub_1004325AC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      boardingStopMuid = self->_boardingStopMuid;
      *(_DWORD *)buf = 134217984;
      v76 = boardingStopMuid;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Could not find the a boarding trip stop with muid %llu", buf, 0xCu);
    }

  }
  if (self->_hasAlightStop && self->_alightStopItemIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = sub_1004325AC();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      alightStopMuid = self->_alightStopMuid;
      *(_DWORD *)buf = 134217984;
      v76 = alightStopMuid;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Could not find an alight trip stop with muid %llu", buf, 0xCu);
    }

  }
  if (!self->_canShowMoreStops)
  {
    v62 = 0;
    goto LABEL_27;
  }
  boardingStopItemIndex = self->_boardingStopItemIndex;
  v22 = boardingStopItemIndex != 0x7FFFFFFFFFFFFFFFLL && boardingStopItemIndex > 1;
  v62 = v22;
  if (!self->_hasAlightStop)
    goto LABEL_27;
  alightStopItemIndex = (char *)self->_alightStopItemIndex;
  if (alightStopItemIndex == (char *)0x7FFFFFFFFFFFFFFFLL
    || alightStopItemIndex >= (char *)objc_msgSend(v8, "count") - 1)
  {
    goto LABEL_27;
  }
  v61 = 1;
  if (boardingStopItemIndex >= 2 && boardingStopItemIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_alightStopItemIndex > self->_boardingStopItemIndex)
    {
      v61 = 1;
      goto LABEL_28;
    }
    v56 = sub_1004325AC();
    v57 = objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "The alighting stop was found before the boarding stop.", buf, 2u);
    }

LABEL_27:
    v61 = 0;
  }
LABEL_28:
  if (v5 && -[NSArray count](self->_transitTripStopItems, "count"))
  {
    v24 = v13;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v25 = self->_transitTripStopItems;
    v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    if (v26)
    {
      v27 = v26;
      v28 = 0;
      v29 = 0;
      v30 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(_QWORD *)v68 != v30)
            objc_enumerationMutation(v25);
          v32 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v32, "type") == (id)1)
            v29 = 1;
          else
            v28 |= objc_msgSend(v32, "type") == (id)2;
        }
        v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
      }
      while (v27);
    }
    else
    {
      v28 = 0;
      v29 = 0;
    }

    v62 &= v29;
    v61 &= v28;
    v13 = v24;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if ((v62 & 1) != 0 || (v61 & 1) != 0 || objc_msgSend(v13, "count"))
  {
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_1002F2FEC;
    v65[3] = &unk_1011B0F00;
    v60 = objc_alloc_init((Class)NSMutableArray);
    v66 = v60;
    objc_msgSend(v13, "enumerateRangesUsingBlock:", v65);
    if (v62 && (v34 = self->_boardingStopItemIndex) != 0)
    {
      v35 = v34 - 1;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v34 - 1));
      if (objc_msgSend(v36, "isHidden"))
        v35 = self->_boardingStopItemIndex;

    }
    else
    {
      v35 = 0;
    }
    v58 = v13;
    if (v61)
      v37 = self->_alightStopItemIndex;
    else
      v37 = (unint64_t)objc_msgSend(v8, "count") - 1;
    if (objc_msgSend(v8, "count"))
    {
      v38 = 0;
      v39 = ~v37;
      do
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v38));
        v41 = v40;
        v42 = v62;
        if (v38 >= v35)
          v42 = 0;
        if (v42 == 1)
        {
          v43 = -[TransitTripStopItem initWithPlaceHolderType:numCollapsedStops:]([TransitTripStopItem alloc], "initWithPlaceHolderType:numCollapsedStops:", 1, v35);
          objc_msgSend(v33, "addObject:", v43);
          -[TransitScheduleStopsTableViewDataSource _adjustIndexesForCollapsedStopsBeforeBoardingIndex:](self, "_adjustIndexesForCollapsedStopsBeforeBoardingIndex:", v35);
          v44 = v35;
        }
        else
        {
          if (v38 > v37)
            v45 = v61;
          else
            v45 = 0;
          if (v45 == 1)
          {
            v44 = (uint64_t)objc_msgSend(v8, "count") + v39;
            v43 = -[TransitTripStopItem initWithPlaceHolderType:numCollapsedStops:]([TransitTripStopItem alloc], "initWithPlaceHolderType:numCollapsedStops:", 2, v44);
            objc_msgSend(v33, "addObject:", v43);
          }
          else if (objc_msgSend(v40, "isHidden"))
          {
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "firstObject"));
            objc_msgSend(v46, "rangeValue");
            v44 = v47;

            objc_msgSend(v60, "removeObjectAtIndex:", 0);
            v48 = self->_boardingStopItemIndex;
            v49 = [TransitTripStopItem alloc];
            if (v38 >= v48)
            {
              v43 = -[TransitTripStopItem initWithPlaceHolderType:numCollapsedStops:](v49, "initWithPlaceHolderType:numCollapsedStops:", 2, v44);
              objc_msgSend(v33, "addObject:", v43);
            }
            else
            {
              v43 = -[TransitTripStopItem initWithPlaceHolderType:numCollapsedStops:](v49, "initWithPlaceHolderType:numCollapsedStops:", 1, v44);
              objc_msgSend(v33, "addObject:", v43);
              -[TransitScheduleStopsTableViewDataSource _adjustIndexesForCollapsedStopsBeforeBoardingIndex:](self, "_adjustIndexesForCollapsedStopsBeforeBoardingIndex:", v44);
            }
            v39 = ~v37;
          }
          else
          {
            v43 = -[TransitTripStopItem initWithTransitTripStop:stopIndex:]([TransitTripStopItem alloc], "initWithTransitTripStop:stopIndex:", v41, v38);
            objc_msgSend(v33, "addObject:", v43);
            v44 = 1;
          }
        }

        v38 += v44;
      }
      while (v38 < (unint64_t)objc_msgSend(v8, "count"));
    }
    if (v62)
    {
      v13 = v58;
      v50 = objc_msgSend(v58, "containsIndexesInRange:", 0, v35) ^ 1;
    }
    else
    {
      v50 = 0;
      v13 = v58;
    }
    v51 = v59;
    v52 = (char *)objc_msgSend(v8, "count");
    v53 = v61;
    if (v61)
      v53 = objc_msgSend(v13, "containsIndexesInRange:", v37 + 1, &v52[-v37 - 1]) ^ 1;
    self->_canShowMoreStops = v50 | v53;

  }
  else
  {
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_1002F303C;
    v63[3] = &unk_1011B0F28;
    v64 = v33;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v63);
    self->_canShowMoreStops = 0;
    v51 = v59;

  }
  v54 = (NSArray *)objc_msgSend(v33, "copy");
  transitTripStopItems = self->_transitTripStopItems;
  self->_transitTripStopItems = v54;

  -[TransitScheduleStopsTableViewDataSource _updatePastDepartureAndVehicleIndexes](self, "_updatePastDepartureAndVehicleIndexes");
  -[TransitScheduleStopsTableViewDataSource setRemoteNetworkState:](self, "setRemoteNetworkState:", 1);

}

- (void)_adjustIndexesForCollapsedStopsBeforeBoardingIndex:(unint64_t)a3
{
  unint64_t boardingStopItemIndex;
  unint64_t mostRecentPastDepartureStopItemIndex;
  unint64_t v5;
  unint64_t alightStopItemIndex;

  boardingStopItemIndex = self->_boardingStopItemIndex;
  mostRecentPastDepartureStopItemIndex = self->_mostRecentPastDepartureStopItemIndex;
  if (mostRecentPastDepartureStopItemIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (mostRecentPastDepartureStopItemIndex >= boardingStopItemIndex)
      v5 = mostRecentPastDepartureStopItemIndex - a3 + 1;
    else
      v5 = 0;
    self->_mostRecentPastDepartureStopItemIndex = v5;
  }
  self->_boardingStopItemIndex = boardingStopItemIndex - a3 + 1;
  alightStopItemIndex = self->_alightStopItemIndex;
  if (alightStopItemIndex != 0x7FFFFFFFFFFFFFFFLL)
    self->_alightStopItemIndex = alightStopItemIndex - a3 + 1;
}

- (id)stopItemAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleStopsTableViewDataSource transitTripStopItems](self, "transitTripStopItems"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
  {
    v8 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleStopsTableViewDataSource transitTripStopItems](self, "transitTripStopItems"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));

  }
  return v8;
}

- (BOOL)hasStops
{
  return -[NSArray count](self->_transitTripStopItems, "count") != 0;
}

- (NSArray)stopIdentifiers
{
  NSArray *transitTripStopItems;
  NSString *v3;
  void *v4;
  void *v5;

  transitTripStopItems = self->_transitTripStopItems;
  v3 = NSStringFromSelector("identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray valueForKey:](transitTripStopItems, "valueForKey:", v4));

  return (NSArray *)v5;
}

- (void)setReferenceDate:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  unint64_t v9;
  unint64_t mostRecentPastDepartureStopItemIndex;
  char *v11;
  char *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  NSString *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];

  v7 = a3;
  v8 = a4;
  if (!-[NSDate isEqualToDate:](self->_referenceDate, "isEqualToDate:", v7))
  {
    objc_storeStrong((id *)&self->_referenceDate, a3);
    v9 = self->_mostRecentPastDepartureStopItemIndex == 0x7FFFFFFFFFFFFFFFLL
       ? 0
       : self->_mostRecentPastDepartureStopItemIndex;
    -[TransitScheduleStopsTableViewDataSource _updatePastDepartureAndVehicleIndexes](self, "_updatePastDepartureAndVehicleIndexes");
    mostRecentPastDepartureStopItemIndex = self->_mostRecentPastDepartureStopItemIndex;
    if (mostRecentPastDepartureStopItemIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (mostRecentPastDepartureStopItemIndex <= self->_vehicleStopItemIndex)
        mostRecentPastDepartureStopItemIndex = self->_vehicleStopItemIndex;
      v11 = (char *)(mostRecentPastDepartureStopItemIndex + 1);
      if ((char *)(mostRecentPastDepartureStopItemIndex + 1) >= (char *)-[NSArray count](self->_transitTripStopItems, "count")- 1)v11 = (char *)-[NSArray count](self->_transitTripStopItems, "count") - 1;
      v12 = &v11[-v9];
      if (v12 && (id)-[TransitScheduleStopsTableViewDataSource remoteNetworkState](self, "remoteNetworkState") == (id)1)
      {
        v36 = v7;
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v9, v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectsAtIndexes:](self->_transitTripStopItems, "objectsAtIndexes:"));
        v14 = NSStringFromSelector("identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKeyPath:", v15));

        v35 = v8;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "snapshot"));
        v33 = v16;
        v18 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v16, "count"));
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v19 = v13;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(_QWORD *)v39 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifier"));
              if (objc_msgSend(v17, "indexOfItemIdentifier:", v25) == (id)0x7FFFFFFFFFFFFFFFLL)
              {
                v26 = sub_1004325AC();
                v27 = objc_claimAutoreleasedReturnValue(v26);
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  v28 = NSStringFromSelector(a2);
                  v29 = v19;
                  v30 = v18;
                  v31 = (void *)objc_claimAutoreleasedReturnValue(v28);
                  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "description"));
                  *(_DWORD *)buf = 138412802;
                  v43 = v31;
                  v44 = 2112;
                  v45 = v25;
                  v46 = 2112;
                  v47 = v32;
                  _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@ - Could not find identifier %@ for stop %@ in snapshot", buf, 0x20u);

                  v18 = v30;
                  v19 = v29;
                }

              }
              else
              {
                objc_msgSend(v18, "addObject:", v25);
              }

            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
          }
          while (v21);
        }

        objc_msgSend(v17, "reloadItemsWithIdentifiers:", v18);
        v8 = v35;
        objc_msgSend(v35, "applySnapshot:animatingDifferences:", v17, 1);

        v7 = v36;
      }
    }
  }

}

- (BOOL)_isPastDeparture:(id)a3
{
  return objc_msgSend(a3, "isPastDepartureRelativeToDate:usingGracePeriod:", self->_referenceDate, 0);
}

- (void)_updatePastDepartureAndVehicleIndexes
{
  void *v3;
  _QWORD v4[9];
  _QWORD v5[3];
  char v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_1002F36D4;
  v7[4] = sub_1002F36E4;
  v8 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v6 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleStopsTableViewDataSource transitTripStopItems](self, "transitTripStopItems"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002F36EC;
  v4[3] = &unk_1011B0F50;
  v4[4] = self;
  v4[5] = v5;
  v4[6] = v7;
  v4[7] = &v9;
  v4[8] = &v13;
  objc_msgSend(v3, "enumerateObjectsWithOptions:usingBlock:", 2, v4);

  self->_mostRecentPastDepartureStopItemIndex = v10[3];
  self->_vehicleStopItemIndex = v14[3];
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
}

- (void)expandTransitTripStops
{
  self->_canShowMoreStops = 0;
  -[TransitScheduleStopsTableViewDataSource buildTransitTripStopItemsWithTransitStops:boardingStopDepartureDate:maintainingCollapsedState:](self, "buildTransitTripStopItemsWithTransitStops:boardingStopDepartureDate:maintainingCollapsedState:", self->_transitStops, self->_boardingStopDepartureDate, 1);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v7;
  id v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char *v17;
  uint64_t v18;
  unint64_t boardingStopItemIndex;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v32;
  unint64_t v33;

  v7 = a4;
  v8 = a3;
  v9 = (char *)objc_msgSend(v7, "row");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleStopsTableViewDataSource transitTripStopItems](self, "transitTripStopItems"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v9));

  if (objc_msgSend(v11, "isPlaceholder"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TransitSchedulesCollapsedStopsPlaceholderViewCell identifier](TransitSchedulesCollapsedStopsPlaceholderViewCell, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v12, v7));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "placeholderTextForLine:", self->_transitLine));
    objc_msgSend(v13, "setPlaceholderText:", v14);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[TransitSchedulesStopViewCell identifier](TransitSchedulesStopViewCell, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v15, v7));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transitTripStop"));
    if (v9)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleStopsTableViewDataSource transitTripStopItems](self, "transitTripStopItems"));
      v17 = (char *)objc_msgSend(v16, "count") - 1;

      if (v9 == v17)
        v18 = 3;
      else
        v18 = 2;
    }
    else
    {
      v18 = 1;
    }
    boardingStopItemIndex = self->_boardingStopItemIndex;
    if (v9 != (char *)boardingStopItemIndex && self->_hasAlightStop && v9 == (char *)self->_alightStopItemIndex)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "departure"));
      objc_msgSend(v13, "setHighlightStation:", objc_msgSend(v20, "isCanceled") ^ 1);

    }
    else
    {
      objc_msgSend(v13, "setHighlightStation:", v9 == (char *)boardingStopItemIndex);
    }
    v21 = -[TransitScheduleStopsTableViewDataSource _linkColorTypeForStopAtIndex:](self, "_linkColorTypeForStopAtIndex:", v9);
    v22 = v21;
    if (v9)
    {
      v33 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransitScheduleStopsTableViewDataSource transitTripStopItems](self, "transitTripStopItems"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", v9 - 1));

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "transitTripStop"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "timeZone"));

      v27 = 0;
      if ((objc_msgSend(v24, "isPlaceholder") & 1) == 0 && v26)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timeZone"));
        if (v28)
        {
          v32 = v18;
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timeZone"));
          v27 = objc_msgSend(v29, "isEqualToTimeZone:", v26) ^ 1;

          v18 = v32;
        }
        else
        {
          v27 = 0;
        }

      }
      v22 = v33;
    }
    else
    {
      v27 = 0;
    }
    if (v9 == (char *)self->_vehicleStopItemIndex)
    {
      if (-[TransitScheduleStopsTableViewDataSource _hasVehicleDepartedStation](self, "_hasVehicleDepartedStation"))
        v30 = 2;
      else
        v30 = 1;
    }
    else
    {
      v30 = 0;
    }
    objc_msgSend(v13, "setTransitLine:withTransitTripStop:stopType:colorStyleType:vehiclePosition:showTimeZone:", self->_transitLine, v14, v18, v22, v30, v27);
  }

  return v13;
}

- (BOOL)_hasVehicleDepartedStation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_transitTripStopItems, "objectAtIndexedSubscript:", self->_vehicleStopItemIndex));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitTripStop"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "departure"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "departureDate"));
  if (v6)
    v7 = objc_msgSend(v5, "isPastDepartureRelativeToDate:usingGracePeriod:", self->_referenceDate, 1);
  else
    v7 = 1;

  return v7;
}

- (unint64_t)_linkColorTypeForStopAtIndex:(unint64_t)a3
{
  unint64_t boardingStopItemIndex;
  unint64_t mostRecentPastDepartureStopItemIndex;

  boardingStopItemIndex = self->_boardingStopItemIndex;
  if (boardingStopItemIndex != 0x7FFFFFFFFFFFFFFFLL && boardingStopItemIndex > a3)
    return 2;
  mostRecentPastDepartureStopItemIndex = self->_mostRecentPastDepartureStopItemIndex;
  if (mostRecentPastDepartureStopItemIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_6:
    if (boardingStopItemIndex == a3)
      return 3;
    else
      return 1;
  }
  if (self->_vehicleStopItemIndex != a3)
  {
    if (mostRecentPastDepartureStopItemIndex < a3)
    {
      if (mostRecentPastDepartureStopItemIndex + 1 == a3)
        return 3;
      goto LABEL_6;
    }
    return 2;
  }
  if (-[TransitScheduleStopsTableViewDataSource _hasVehicleDepartedStation](self, "_hasVehicleDepartedStation"))
    return 2;
  else
    return 3;
}

- (unint64_t)remoteNetworkState
{
  return self->_remoteNetworkState;
}

- (void)setRemoteNetworkState:(unint64_t)a3
{
  self->_remoteNetworkState = a3;
}

- (GEOTransitLine)transitLine
{
  return self->_transitLine;
}

- (void)setTransitLine:(id)a3
{
  objc_storeStrong((id *)&self->_transitLine, a3);
}

- (BOOL)canShowMoreStops
{
  return self->_canShowMoreStops;
}

- (NSArray)transitTripStopItems
{
  return self->_transitTripStopItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitTripStopItems, 0);
  objc_storeStrong((id *)&self->_transitLine, 0);
  objc_storeStrong((id *)&self->_boardingStopDepartureDate, 0);
  objc_storeStrong((id *)&self->_transitStops, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
}

@end
