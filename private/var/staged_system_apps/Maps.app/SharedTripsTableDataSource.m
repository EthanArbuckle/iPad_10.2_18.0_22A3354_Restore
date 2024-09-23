@implementation SharedTripsTableDataSource

- (SharedTripsTableDataSource)initWithTableView:(id)a3 cellProvider:(id)a4 tableViewReloadEvent:(id)a5
{
  id v9;
  id v10;
  id v11;
  SharedTripsTableDataSource *v12;
  SharedTripsTableDataSource *v13;
  id v14;
  id cellProvider;
  id v16;
  id tableViewReloadEvent;
  void *v18;
  uint64_t v19;
  NSArray *sharedTrips;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  objc_super v27;
  uint8_t buf[4];
  SharedTripsTableDataSource *v29;
  __int16 v30;
  void *v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)SharedTripsTableDataSource;
  v12 = -[SharedTripsTableDataSource init](&v27, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_tableView, a3);
    -[UITableView setDataSource:](v13->_tableView, "setDataSource:", v13);
    v14 = objc_msgSend(v10, "copy");
    cellProvider = v13->_cellProvider;
    v13->_cellProvider = v14;

    if (v11)
    {
      v16 = objc_msgSend(v11, "copy");
      tableViewReloadEvent = v13->_tableViewReloadEvent;
      v13->_tableViewReloadEvent = v16;

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "receivedTrips"));
    sharedTrips = v13->_sharedTrips;
    v13->_sharedTrips = (NSArray *)v19;

    v21 = sub_1007EB4C4();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = sub_10039DCD4(v13->_sharedTrips, &stru_1011C93B8);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      *(_DWORD *)buf = 134349314;
      v29 = v13;
      v30 = 2112;
      v31 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%{public}p] Initializing with shared trips: %@", buf, 0x16u);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    objc_msgSend(v25, "addReceivingObserver:", v13);

  }
  return v13;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  SharedTripsTableDataSource *v7;

  v3 = sub_1007EB4C4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)SharedTripsTableDataSource;
  -[SharedTripsTableDataSource dealloc](&v5, "dealloc");
}

- (void)setSelectedTrip:(id)a3
{
  -[SharedTripsTableDataSource setSelectedTrip:animated:](self, "setSelectedTrip:animated:", a3, 0);
}

- (void)setSelectedTrip:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id WeakRetained;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  SharedTripsTableDataSource *v12;
  __int16 v13;
  void *v14;

  v4 = a4;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_selectedTrip);

  if (WeakRetained != v6)
  {
    v8 = sub_1007EB4C4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupIdentifier"));
      v11 = 134349314;
      v12 = self;
      v13 = 2112;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Selecting trip: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_storeWeak((id *)&self->_selectedTrip, v6);
    -[SharedTripsTableDataSource _updateTableSelection:](self, "_updateTableSelection:", v4);
  }

}

- (id)sharedTripAtIndexPath:(id)a3
{
  id v4;
  void *v5;

  v4 = objc_msgSend(a3, "row");
  if (v4 >= (id)-[NSArray count](self->_sharedTrips, "count"))
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sharedTrips, "objectAtIndexedSubscript:", v4));
  return v5;
}

- (unint64_t)numberOfSharedTrips
{
  return -[NSArray count](self->_sharedTrips, "count");
}

- (void)_updateTableSelection:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSUInteger v6;
  NSArray *sharedTrips;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v3 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[UITableView indexPathForSelectedRow](self->_tableView, "indexPathForSelectedRow"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsTableDataSource selectedTrip](self, "selectedTrip"));
  if (v11)
  {

    if (!v5)
      -[UITableView deselectRowAtIndexPath:animated:](self->_tableView, "deselectRowAtIndexPath:animated:", v11, v3);
  }
  else if (v5)
  {
    v6 = -[NSArray count](self->_sharedTrips, "count");

    if (v6)
    {
      sharedTrips = self->_sharedTrips;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsTableDataSource selectedTrip](self, "selectedTrip"));
      v9 = -[NSArray indexOfObject:](sharedTrips, "indexOfObject:", v8);

      if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        -[SharedTripsTableDataSource setSelectedTrip:](self, "setSelectedTrip:", 0);
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v9, 0));
        if ((objc_msgSend(0, "isEqual:", v10) & 1) == 0)
          -[UITableView selectRowAtIndexPath:animated:scrollPosition:](self->_tableView, "selectRowAtIndexPath:animated:scrollPosition:", 0, v3, 1);

      }
    }
  }

}

- (void)_updateCellForSharedTrip:(id)a3
{
  NSArray *sharedTrips;
  void *v5;
  id v6;
  void *v7;
  UITableView *tableView;
  void *v9;
  void *v10;

  sharedTrips = self->_sharedTrips;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "equalityTest"));
  v6 = -[NSArray indexOfObjectPassingTest:](sharedTrips, "indexOfObjectPassingTest:", v5);

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v6, 0));
    tableView = self->_tableView;
    v10 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](tableView, "reloadRowsAtIndexPaths:withRowAnimation:", v9, 5);

    -[SharedTripsTableDataSource _updateTableSelection:](self, "_updateTableSelection:", 0);
  }
}

- (void)_updateTableView
{
  void (**tableViewReloadEvent)(id, UITableView *);

  -[UITableView reloadData](self->_tableView, "reloadData");
  -[SharedTripsTableDataSource _updateTableSelection:](self, "_updateTableSelection:", 1);
  tableViewReloadEvent = (void (**)(id, UITableView *))self->_tableViewReloadEvent;
  if (tableViewReloadEvent)
    tableViewReloadEvent[2](tableViewReloadEvent, self->_tableView);
}

- (void)_updateTableViewWithTrip:(id)a3
{
  id v4;
  NSArray *v5;
  _UNKNOWN **v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  NSArray *v21;
  NSArray *sharedTrips;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  SharedTripsTableDataSource *v29;
  __int16 v30;
  void *v31;

  v4 = a3;
  v5 = self->_sharedTrips;
  v6 = MKPlaceCollectionsLogicController_ptr;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "receivedTrips"));

  v9 = -[NSArray count](v5, "count");
  v10 = objc_msgSend(v8, "count");
  v11 = 1;
  if (v4 && v9 == v10)
  {
    if (-[NSArray count](self->_sharedTrips, "count"))
    {
      v27 = v4;
      v12 = 0;
      while (1)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v12));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v12));
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "groupIdentifier"));
        if (!v15)
          break;
        v16 = (void *)v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "groupIdentifier"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "groupIdentifier"));
        v19 = objc_msgSend(v17, "isEqualToString:", v18);

        if (!v19)
          break;

        if (++v12 >= -[NSArray count](self->_sharedTrips, "count"))
        {
          v11 = 0;
          goto LABEL_10;
        }
      }

      v11 = 1;
LABEL_10:
      v4 = v27;
      v6 = MKPlaceCollectionsLogicController_ptr;
    }
    else
    {
      v11 = 0;
    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[114], "sharedInstance"));
  v21 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "receivedTrips"));
  sharedTrips = self->_sharedTrips;
  self->_sharedTrips = v21;

  v23 = sub_1007EB4C4();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = sub_10039DCD4(self->_sharedTrips, &stru_1011C93D8);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    *(_DWORD *)buf = 134349314;
    v29 = self;
    v30 = 2112;
    v31 = v26;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}p] Updated shared trips: %@", buf, 0x16u);

  }
  if ((v11 & 1) != 0)
    -[SharedTripsTableDataSource _updateTableView](self, "_updateTableView");
  else
    -[SharedTripsTableDataSource _updateCellForSharedTrip:](self, "_updateCellForSharedTrip:", v4);

}

- (void)sharedTripServiceDidUpdateReceivingAvailability:(id)a3
{
  -[SharedTripsTableDataSource _updateTableViewWithTrip:](self, "_updateTableViewWithTrip:", 0);
}

- (void)sharedTripService:(id)a3 didReceiveSharedTrip:(id)a4
{
  -[SharedTripsTableDataSource _updateTableViewWithTrip:](self, "_updateTableViewWithTrip:", a4);
}

- (void)sharedTripService:(id)a3 didUpdateETAForSharedTrip:(id)a4
{
  -[SharedTripsTableDataSource _updateTableViewWithTrip:](self, "_updateTableViewWithTrip:", a4);
}

- (void)sharedTripService:(id)a3 didUpdateDestinationForSharedTrip:(id)a4
{
  -[SharedTripsTableDataSource _updateTableViewWithTrip:](self, "_updateTableViewWithTrip:", a4);
}

- (void)sharedTripService:(id)a3 didUpdateRouteForSharedTrip:(id)a4
{
  -[SharedTripsTableDataSource _updateTableViewWithTrip:](self, "_updateTableViewWithTrip:", a4);
}

- (void)sharedTripService:(id)a3 didUpdateReachedDestinationForSharedTrip:(id)a4
{
  -[SharedTripsTableDataSource _updateTableViewWithTrip:](self, "_updateTableViewWithTrip:", a4);
}

- (void)sharedTripService:(id)a3 didRemoveSharedTrip:(id)a4
{
  -[SharedTripsTableDataSource _updateTableViewWithTrip:](self, "_updateTableViewWithTrip:", 0, a4);
}

- (void)sharedTripService:(id)a3 didUpdateClosedTrip:(id)a4
{
  -[SharedTripsTableDataSource _updateTableViewWithTrip:](self, "_updateTableViewWithTrip:", a4);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_sharedTrips, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t (**cellProvider)(id, id, id, void *);
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  cellProvider = (uint64_t (**)(id, id, id, void *))self->_cellProvider;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsTableDataSource sharedTripAtIndexPath:](self, "sharedTripAtIndexPath:", v7));
  v10 = cellProvider[2](cellProvider, v8, v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (GEOSharedNavState)selectedTrip
{
  return (GEOSharedNavState *)objc_loadWeakRetained((id *)&self->_selectedTrip);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selectedTrip);
  objc_storeStrong((id *)&self->_sharedTrips, 0);
  objc_storeStrong(&self->_tableViewReloadEvent, 0);
  objc_storeStrong(&self->_cellProvider, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
