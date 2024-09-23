@implementation BMSyncDatabase

- (id)locationRowWithLocation:(id)a3
{
  _bmFMDatabase *fmdb;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BMSyncCRDTLocationRow *v11;
  _QWORD v13[6];

  if (!a3)
    return 0;
  fmdb = self->_fmdb;
  v13[0] = CFSTR("stream = ?");
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "streamName"));
  v13[1] = v5;
  v13[2] = CFSTR(" AND site = ?");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "siteIdentifier"));
  v13[3] = v6;
  v13[4] = CFSTR(" AND day = ?");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "day"));

  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v13[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("CRDTLocation"), &off_10006E348, v9));

  if (objc_msgSend(v10, "next"))
    v11 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]([BMSyncCRDTLocationRow alloc], "initWithFMResultSet:modifier:", v10, 0);
  else
    v11 = 0;
  objc_msgSend(v10, "close");

  return v11;
}

- (id)locationRowWithLocationID:(id)a3
{
  id v4;
  void *v5;
  _bmFMDatabase *fmdb;
  void *v7;
  void *v8;
  BMSyncCRDTLocationRow *v9;
  _QWORD v11[2];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    fmdb = self->_fmdb;
    v11[0] = CFSTR("id = ?");
    v11[1] = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("CRDTLocation"), &off_10006E360, v7));

    if (objc_msgSend(v8, "next"))
      v9 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]([BMSyncCRDTLocationRow alloc], "initWithFMResultSet:modifier:", v8, 0);
    else
      v9 = 0;
    objc_msgSend(v8, "close");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)updateLocationState:(unint64_t)a3 forLocation:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  BMSyncCRDTLocationRow *v9;
  void *v10;
  BMSyncCRDTLocationRow *v11;
  BOOL v12;
  int v14;
  unint64_t v15;
  __int16 v16;
  id v17;

  v6 = a4;
  v7 = __biome_log_for_category(11);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134218242;
    v15 = a3;
    v16 = 2112;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "updateLocationState: %lu forLocation:%@", (uint8_t *)&v14, 0x16u);
  }

  v9 = [BMSyncCRDTLocationRow alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "location"));
  v11 = -[BMSyncCRDTLocationRow initWithLocation:state:primaryKey:](v9, "initWithLocation:state:primaryKey:", v10, a3, objc_msgSend(v6, "primaryKey"));

  v12 = -[BMSyncDatabase upsertLocation:](self, "upsertLocation:", v11);
  return v12;
}

- (BOOL)updateAllLocationsAtOrBefore:(id)a3 state:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  _bmFMDatabase *fmdb;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  _QWORD v21[6];
  const __CFString *v22;
  void *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  unint64_t v27;

  v6 = a3;
  v7 = __biome_log_for_category(11);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v6;
    v26 = 2048;
    v27 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "updateAllLocationsAtOrBefore:%@ to state %lu", buf, 0x16u);
  }

  fmdb = self->_fmdb;
  v22 = CFSTR("state");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v23 = v20;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  v21[0] = CFSTR("stream = ?");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "location"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "streamName"));
  v21[1] = v11;
  v21[2] = CFSTR(" AND site = ?");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "location"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "siteIdentifier"));
  v21[3] = v13;
  v21[4] = CFSTR(" AND day <= ?");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "location"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "day"));
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v21[5] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 6));
  LOBYTE(fmdb) = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", CFSTR("CRDTLocation"), v10, v17);

  return (char)fmdb;
}

- (id)insertLocationIfNotExists:(id)a3 withState:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  BMSyncCRDTLocationRow *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BMSyncCRDTLocationRow *v16;
  _bmFMDatabase *fmdb;
  _QWORD v19[4];
  _QWORD v20[4];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase locationRowWithLocation:](self, "locationRowWithLocation:", v6));
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    fmdb = self->_fmdb;
    v19[0] = CFSTR("stream");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "streamName"));
    v20[0] = v10;
    v19[1] = CFSTR("site");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "siteIdentifier"));
    v20[1] = v11;
    v19[2] = CFSTR("day");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "day"));
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v20[2] = v13;
    v19[3] = CFSTR("state");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v20[3] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 4));
    -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", CFSTR("CRDTLocation"), v15);

    v9 = -[BMSyncCRDTLocationRow initWithLocation:state:primaryKey:]([BMSyncCRDTLocationRow alloc], "initWithLocation:state:primaryKey:", v6, a4, -[_bmFMDatabase lastInsertRowId](self->_fmdb, "lastInsertRowId"));
  }
  v16 = v9;

  return v16;
}

- (BOOL)upsertLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _bmFMDatabase *fmdb;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  id v19;
  void *v21;
  _QWORD v22[4];
  _QWORD v23[4];
  _QWORD v24[2];
  _QWORD v25[4];
  _QWORD v26[4];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase locationRowWithLocation:](self, "locationRowWithLocation:", v5));
  fmdb = self->_fmdb;
  if (v6)
  {
    v25[0] = CFSTR("stream");
    v21 = v6;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "streamName"));
    v26[0] = v8;
    v25[1] = CFSTR("site");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "siteIdentifier"));
    v26[1] = v9;
    v25[2] = CFSTR("day");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "day"));
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v26[2] = v11;
    v25[3] = CFSTR("state");
    v12 = objc_msgSend(v4, "state");

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v12));
    v26[3] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 4));
    v24[0] = CFSTR("id = ?");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "primaryKey")));
    v24[1] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2));
    v17 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", CFSTR("CRDTLocation"), v14, v16);

    v18 = (void *)v8;
    v6 = v21;
  }
  else
  {
    v22[0] = CFSTR("stream");
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "streamName"));
    v23[0] = v18;
    v22[1] = CFSTR("site");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "siteIdentifier"));
    v23[1] = v9;
    v22[2] = CFSTR("day");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "day"));
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v23[2] = v11;
    v22[3] = CFSTR("state");
    v19 = objc_msgSend(v4, "state");

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v19));
    v23[3] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 4));
    v17 = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", CFSTR("CRDTLocation"), v14);
  }

  return v17;
}

- (BOOL)removeAllDeletedLocationsBeforeHighestDeletedLocation:(id)a3
{
  void *v4;
  _bmFMDatabase *fmdb;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[12];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "location"));
  fmdb = self->_fmdb;
  v12[0] = CFSTR("stream = ?");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "streamName"));
  v12[1] = v6;
  v12[2] = CFSTR(" AND site = ?");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "siteIdentifier"));
  v12[3] = v7;
  v12[4] = CFSTR(" AND state = ?");
  v12[5] = &off_10006EA50;
  v12[6] = CFSTR(" AND day < ?");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "day"));
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v12[7] = v9;
  v12[8] = CFSTR(" AND NOT EXISTS (SELECT * FROM CKAtom WHERE location_id = id)");
  v12[9] = &stru_100069AC0;
  v12[10] = CFSTR(" AND NOT EXISTS (SELECT location_id FROM CKRecord WHERE location_id = id)");
  v12[11] = &stru_100069AC0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 12));
  LOBYTE(fmdb) = -[_bmFMDatabase DELETE_FROM:WHERE:](fmdb, "DELETE_FROM:WHERE:", CFSTR("CRDTLocation"), v10);

  return (char)fmdb;
}

- (id)previousLocationRowBeforeLocationRow:(id)a3
{
  _bmFMDatabase *fmdb;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BMSyncCRDTLocationRow *v14;
  _QWORD v16[6];

  fmdb = self->_fmdb;
  v16[0] = CFSTR("stream = ?");
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "streamName"));
  v16[1] = v6;
  v16[2] = CFSTR(" AND site = ?");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "siteIdentifier"));
  v16[3] = v8;
  v16[4] = CFSTR(" AND day < ?");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "day"));
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v16[5] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 6));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:](fmdb, "SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:", CFSTR("CRDTLocation"), &off_10006E378, v12, &off_10006E390, &off_10006EA68));

  if (objc_msgSend(v13, "next"))
    v14 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]([BMSyncCRDTLocationRow alloc], "initWithFMResultSet:modifier:", v13, 0);
  else
    v14 = 0;
  objc_msgSend(v13, "close");

  return v14;
}

- (id)locationsWithState:(unint64_t)a3
{
  _bmFMDatabase *fmdb;
  void *v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  BMSyncCRDTLocationRow *v8;
  void *v9;
  _QWORD v11[2];

  fmdb = self->_fmdb;
  v11[0] = CFSTR("state = ?");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v11[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:](fmdb, "SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:", CFSTR("CRDTLocation"), &off_10006E3A8, v5, &off_10006E3C0, 0));

  v7 = objc_opt_new(NSMutableArray);
  if (objc_msgSend(v6, "next"))
  {
    do
    {
      v8 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]([BMSyncCRDTLocationRow alloc], "initWithFMResultSet:modifier:", v6, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncCRDTLocationRow location](v8, "location"));
      -[NSMutableArray addObject:](v7, "addObject:", v9);

    }
    while ((objc_msgSend(v6, "next") & 1) != 0);
  }
  objc_msgSend(v6, "close");

  return v7;
}

- (id)highestDeletedLocationsForStream:(id)a3
{
  id v4;
  NSMutableArray *v5;
  _bmFMDatabase *fmdb;
  void *v7;
  void *v8;
  BMSyncCRDTLocationRow *v9;
  void *v10;
  _QWORD v12[6];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  fmdb = self->_fmdb;
  v12[0] = CFSTR("day = (select max(day) from CRDTLocation i where i.stream = ? and i.site=CRDTLocation.site");
  v12[1] = v4;
  v12[2] = CFSTR(" and state = ?)");
  v12[3] = &off_10006EA50;
  v12[4] = CFSTR(" AND stream = ?");
  v12[5] = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("CRDTLocation"), &off_10006E3D8, v7));

  if (objc_msgSend(v8, "next"))
  {
    do
    {
      v9 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]([BMSyncCRDTLocationRow alloc], "initWithFMResultSet:modifier:", v8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncCRDTLocationRow location](v9, "location"));
      -[NSMutableArray addObject:](v5, "addObject:", v10);

    }
    while ((objc_msgSend(v8, "next") & 1) != 0);
  }
  objc_msgSend(v8, "close");

  return v5;
}

- (id)highestDeletedLocationForSiteIdentifier:(id)a3 inStream:(id)a4
{
  id v6;
  id v7;
  _bmFMDatabase *fmdb;
  void *v9;
  void *v10;
  BMSyncCRDTLocationRow *v11;
  _QWORD v13[6];

  v6 = a3;
  v7 = a4;
  fmdb = self->_fmdb;
  v13[0] = CFSTR("stream = ?");
  v13[1] = v7;
  v13[2] = CFSTR(" AND site = ?");
  v13[3] = v6;
  v13[4] = CFSTR(" AND state = ? ");
  v13[5] = &off_10006EA50;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:](fmdb, "SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:", CFSTR("CRDTLocation"), &off_10006E3F0, v9, &off_10006E408, &off_10006EA68));

  if (objc_msgSend(v10, "next"))
    v11 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]([BMSyncCRDTLocationRow alloc], "initWithFMResultSet:modifier:", v10, 0);
  else
    v11 = 0;
  objc_msgSend(v10, "close");

  return v11;
}

- (int)CRDTLocationCount
{
  OS_dispatch_queue *queue;
  void *v4;
  int v5;

  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](self->_fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("CRDTLocation"), &off_10006E420, 0));
  if (objc_msgSend(v4, "next"))
    v5 = objc_msgSend(v4, "intForColumnIndex:", 0);
  else
    v5 = 0;
  objc_msgSend(v4, "close");

  return v5;
}

- (id)localDevice
{
  OS_dispatch_queue *queue;
  void *v4;
  BMSyncDevicePeer *v5;

  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](self->_fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("DevicePeer"), &off_10006E438, &off_10006E450));
  if (objc_msgSend(v4, "next"))
    v5 = -[BMSyncDevicePeer initWithFMResultSet:]([BMSyncDevicePeer alloc], "initWithFMResultSet:", v4);
  else
    v5 = 0;
  objc_msgSend(v4, "close");

  return v5;
}

- (BOOL)upsertSyncDevicePeer:(id)a3 isMe:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  OS_dispatch_queue *queue;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v29;
  void *v30;
  _bmFMDatabase *fmdb;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[6];
  _QWORD v37[6];
  _QWORD v38[7];
  _QWORD v39[7];

  v4 = a4;
  v6 = a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceIdentifier"));
  v9 = objc_claimAutoreleasedReturnValue(-[BMSyncDatabase deviceWithIdentifier:](self, "deviceWithIdentifier:", v8));

  fmdb = self->_fmdb;
  v34 = (void *)v9;
  if (v9)
  {
    v36[0] = CFSTR("device_identifier");
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceIdentifier"));
    v37[0] = v29;
    v36[1] = CFSTR("ids_device_identifier");
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "idsDeviceIdentifier"));
    v33 = (void *)v10;
    if (v10)
      v11 = (const __CFString *)v10;
    else
      v11 = &stru_100069AC0;
    v37[1] = v11;
    v36[2] = CFSTR("name");
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metadata"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "name"));
    v13 = (void *)v12;
    if (v12)
      v14 = (const __CFString *)v12;
    else
      v14 = &stru_100069AC0;
    v37[2] = v14;
    v36[3] = CFSTR("model");
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metadata"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "model"));
    v37[3] = v15;
    v36[4] = CFSTR("platform");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metadata"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v16, "platform")));
    v37[4] = v17;
    v36[5] = CFSTR("protocol_version");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "protocolVersion")));
    v37[5] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 6));
    v35[0] = CFSTR("device_identifier = ?");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceIdentifier"));
    v35[1] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 2));
    v22 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", CFSTR("DevicePeer"), v19, v21);

    v23 = (void *)v29;
  }
  else
  {
    v38[0] = CFSTR("device_identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceIdentifier"));
    v39[0] = v23;
    v38[1] = CFSTR("ids_device_identifier");
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "idsDeviceIdentifier"));
    v33 = (void *)v24;
    if (v24)
      v25 = (const __CFString *)v24;
    else
      v25 = &stru_100069AC0;
    v39[1] = v25;
    v38[2] = CFSTR("name");
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metadata"));
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "name"));
    v13 = (void *)v26;
    if (v26)
      v27 = (const __CFString *)v26;
    else
      v27 = &stru_100069AC0;
    v39[2] = v27;
    v38[3] = CFSTR("me");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    v39[3] = v30;
    v38[4] = CFSTR("model");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metadata"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "model"));
    v39[4] = v16;
    v38[5] = CFSTR("platform");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metadata"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v17, "platform")));
    v39[5] = v18;
    v38[6] = CFSTR("protocol_version");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "protocolVersion")));
    v39[6] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 7));
    v22 = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", CFSTR("DevicePeer"), v20);
  }

  return v22;
}

- (id)deviceWithIdentifier:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v7;
  void *v8;
  BMSyncDevicePeer *v9;
  _QWORD v11[2];

  v4 = a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v11[0] = CFSTR("device_identifier = ?");
  v11[1] = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("DevicePeer"), &off_10006E468, v7));

  if (objc_msgSend(v8, "next"))
    v9 = -[BMSyncDevicePeer initWithFMResultSet:]([BMSyncDevicePeer alloc], "initWithFMResultSet:", v8);
  else
    v9 = 0;
  objc_msgSend(v8, "close");

  return v9;
}

- (id)lastSyncDateFromAnyDevice
{
  OS_dispatch_queue *queue;
  void *v4;
  void *v5;

  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](self->_fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("DevicePeer"), &off_10006E480, 0));
  v5 = 0;
  if (objc_msgSend(v4, "next"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateForColumnIndex:", 0));
  objc_msgSend(v4, "close");

  return v5;
}

- (id)lastSyncDateOfDeviceWithIdentifier:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v4 = a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v11[0] = CFSTR("device_identifier = ?");
  v11[1] = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("DevicePeer"), &off_10006E498, v7));

  if (objc_msgSend(v8, "next"))
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateForColumnIndex:", 0));
  else
    v9 = 0;
  objc_msgSend(v8, "close");

  return v9;
}

- (BOOL)setLastSyncDate:(id)a3 forDeviceWithIdentifier:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v10;
  void *v11;
  _QWORD v13[2];
  const __CFString *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v14 = CFSTR("last_sync_date");
  v15 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  v13[0] = CFSTR("device_identifier = ?");
  v13[1] = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
  LOBYTE(fmdb) = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", CFSTR("DevicePeer"), v10, v11);

  return (char)fmdb;
}

- (id)allPeers
{
  OS_dispatch_queue *queue;
  NSMutableArray *v4;
  void *v5;
  BMSyncDevicePeer *v6;

  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v4 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](self->_fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("DevicePeer"), &off_10006E4B0, 0));
  if (objc_msgSend(v5, "next"))
  {
    do
    {
      v6 = -[BMSyncDevicePeer initWithFMResultSet:]([BMSyncDevicePeer alloc], "initWithFMResultSet:", v5);
      -[NSMutableArray addObject:](v4, "addObject:", v6);

    }
    while ((objc_msgSend(v5, "next") & 1) != 0);
  }
  objc_msgSend(v5, "close");

  return v4;
}

- (void)runMetricsCollectionTask:(id)a3
{
  id v4;
  BMStateVectorMetricsCollector *v5;
  BMSyncSessionMetricsAggregator *v6;

  v4 = a3;
  v6 = -[BMSyncSessionMetricsAggregator initWithDatabase:activity:]([BMSyncSessionMetricsAggregator alloc], "initWithDatabase:activity:", self, v4);
  -[BMSyncSessionMetricsAggregator enforceMaxSessionLogPrunePolicy](v6, "enforceMaxSessionLogPrunePolicy");
  -[BMSyncSessionMetricsAggregator computeAndSendAggregatedMetrics](v6, "computeAndSendAggregatedMetrics");
  -[BMSyncSessionMetricsAggregator compactAndDeleteSessionLogs](v6, "compactAndDeleteSessionLogs");
  v5 = -[BMStateVectorMetricsCollector initWithDatabase:activity:]([BMStateVectorMetricsCollector alloc], "initWithDatabase:activity:", self, v4);

  -[BMStateVectorMetricsCollector computeAndSendStateVectorMetrics](v5, "computeAndSendStateVectorMetrics");
}

- (BOOL)ckZoneExists:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v4 = a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v10[0] = CFSTR("zone_name = ?");
  v10[1] = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("CKZone"), &off_10006E4C8, v7));

  LOBYTE(fmdb) = objc_msgSend(v8, "next");
  return (char)fmdb;
}

- (id)ckZoneForZoneName:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v7;
  void *v8;
  BMSyncCKZone *v9;
  _QWORD v11[2];

  v4 = a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v11[0] = CFSTR("zone_name = ?");
  v11[1] = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("CKZone"), &off_10006E4E0, v7));

  if (objc_msgSend(v8, "next"))
    v9 = -[BMSyncCKZone initWithFMResultSet:]([BMSyncCKZone alloc], "initWithFMResultSet:", v8);
  else
    v9 = 0;

  return v9;
}

- (BOOL)ckZoneSetAttemptingRecoveryForZoneName:(id)a3 state:(int)a4
{
  uint64_t v4;
  id v6;
  OS_dispatch_queue *queue;
  unsigned int v8;
  _bmFMDatabase *fmdb;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  BOOL v14;
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[2];
  const __CFString *v19;
  void *v20;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v8 = -[BMSyncDatabase ckZoneExists:](self, "ckZoneExists:", v6);
  fmdb = self->_fmdb;
  if (v8)
  {
    v19 = CFSTR("recovery_state");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
    v20 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v18[0] = CFSTR("zone_name = ?");
    v18[1] = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
    v13 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", CFSTR("CKZone"), v11, v12);
  }
  else
  {
    v17[0] = v6;
    v16[0] = CFSTR("zone_name");
    v16[1] = CFSTR("recovery_state");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
    v17[1] = v10;
    v17[2] = CFSTR("UUID not set");
    v16[2] = CFSTR("zone_uuid");
    v16[3] = CFSTR("attempted_recovery_date");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    v17[3] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 4));
    v13 = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", CFSTR("CKZone"), v12);
  }
  v14 = v13;

  return v14;
}

- (BOOL)ckZoneSetZoneVersionUUID:(id)a3 forZoneName:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  unsigned int v9;
  _bmFMDatabase *fmdb;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  BOOL v14;
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[2];
  const __CFString *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v9 = -[BMSyncDatabase ckZoneExists:](self, "ckZoneExists:", v7);
  fmdb = self->_fmdb;
  if (v9)
  {
    v19 = CFSTR("zone_uuid");
    v20 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v18[0] = CFSTR("zone_name = ?");
    v18[1] = v7;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
    v13 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", CFSTR("CKZone"), v11, v12);
  }
  else
  {
    v16[0] = CFSTR("zone_name");
    v16[1] = CFSTR("zone_uuid");
    v17[0] = v7;
    v17[1] = v6;
    v17[2] = &off_10006EAB0;
    v16[2] = CFSTR("recovery_state");
    v16[3] = CFSTR("attempted_recovery_date");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    v17[3] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 4));
    v13 = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", CFSTR("CKZone"), v12);
  }
  v14 = v13;

  return v14;
}

- (BOOL)ckZoneSetAttemptedRecoveryDate:(id)a3 state:(int)a4 forZoneName:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  unsigned int v11;
  _bmFMDatabase *fmdb;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v11 = -[BMSyncDatabase ckZoneExists:](self, "ckZoneExists:", v9);
  fmdb = self->_fmdb;
  if (v11)
  {
    v21[0] = CFSTR("recovery_state");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
    v21[1] = CFSTR("attempted_recovery_date");
    v22[0] = v13;
    v22[1] = v8;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
    v20[0] = CFSTR("zone_name = ?");
    v20[1] = v9;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
    v16 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", CFSTR("CKZone"), v14, v15);

  }
  else
  {
    v19[0] = v9;
    v18[0] = CFSTR("zone_name");
    v18[1] = CFSTR("recovery_state");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
    v19[1] = v13;
    v19[2] = CFSTR("UUID not set");
    v18[2] = CFSTR("zone_uuid");
    v18[3] = CFSTR("attempted_recovery_date");
    v19[3] = v8;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 4));
    v16 = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", CFSTR("CKZone"), v14);
  }

  return v16;
}

- (void)enumerateZonesWithBlock:(id)a3
{
  void (**v4)(id, BMSyncCKZone *, _BYTE *);
  OS_dispatch_queue *queue;
  void *v6;
  void *v7;
  BMSyncCKZone *v8;
  char v9;

  v4 = (void (**)(id, BMSyncCKZone *, _BYTE *))a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](self->_fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("CKZone"), &off_10006E4F8, 0));
  v9 = 0;
  do
  {
    if (!objc_msgSend(v6, "next"))
      break;
    v7 = objc_autoreleasePoolPush();
    v8 = -[BMSyncCKZone initWithFMResultSet:]([BMSyncCKZone alloc], "initWithFMResultSet:", v6);
    v4[2](v4, v8, &v9);

    objc_autoreleasePoolPop(v7);
  }
  while (!v9);

}

- (BOOL)addCKAtomRow:(id)a3 inStream:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  _bmFMDatabase **p_fmdb;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _bmFMDatabase *fmdb;
  unsigned __int8 v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[14];
  _QWORD v64[14];

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v9 = objc_alloc((Class)NSString);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timestamp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "siteIdentifierObject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  v13 = objc_msgSend(v9, "initWithData:encoding:", v12, 4);

  v14 = objc_alloc((Class)NSString);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "causalReference"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "timestamp"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "siteIdentifierObject"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
  v19 = objc_msgSend(v14, "initWithData:encoding:", v18, 4);

  p_fmdb = &self->_fmdb;
  fmdb = self->_fmdb;
  v63[0] = CFSTR("stream");
  v63[1] = CFSTR("site");
  v64[0] = v7;
  v64[1] = v13;
  v61 = v13;
  v63[2] = CFSTR("clock");
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timestamp"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v59, "clockValue")));
  v64[2] = v58;
  v63[3] = CFSTR("type");
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "type")));
  v64[3] = v57;
  v63[4] = CFSTR("location_id");
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "location"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v56, "primaryKey")));
  v64[4] = v55;
  v63[5] = CFSTR("segment_name");
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "segmentName"));
  v21 = (void *)v20;
  if (!v20)
    v20 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v54 = v21;
  v43 = (void *)v20;
  v64[5] = v20;
  v63[6] = CFSTR("segment_offset");
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "segmentName"));
  if (v53)
    v22 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", objc_msgSend(v6, "segmentOffset")));
  else
    v22 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v52 = (void *)v22;
  v64[6] = v22;
  v63[7] = CFSTR("on_disk");
  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "segmentName"));
  if (v23)
    v24 = &__kCFBooleanTrue;
  else
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v42 = v24;
  v64[7] = v24;
  v63[8] = CFSTR("ref_type");
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "causalReference"));
  if (v48)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "causalReference"));
    v25 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v47, "type")));
  }
  else
  {
    v25 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v47 = (void *)v25;
  }
  v45 = (void *)v25;
  v64[8] = v25;
  v63[9] = CFSTR("ref_location_id");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "referenceLocation"));
  if (v26)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "referenceLocation"));
    v27 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v46, "primaryKey")));
  }
  else
  {
    v27 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v46 = (void *)v27;
  }
  v44 = (void *)v27;
  v64[9] = v27;
  v63[10] = CFSTR("ref_site");
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "causalReference"));
  v60 = v19;
  if (!v28)
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v49 = (void *)v23;
  v62 = v7;
  v41 = v19;
  v64[10] = v19;
  v63[11] = CFSTR("ref_clock");
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "causalReference"));
  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "causalReference"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "timestamp"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v40, "clockValue")));
  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v30 = v31;
  }
  v64[11] = v31;
  v63[12] = CFSTR("value_version");
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "valueVersion")));
  v64[12] = v32;
  v63[13] = CFSTR("value_data");
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueData"));
  v34 = v33;
  if (!v33)
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v64[13] = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v64, v63, 14));
  v51 = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", CFSTR("CKAtom"), v35);

  if (!v33)
  if (v29)
  {

  }
  if (!v28)

  if (v26)
  if (v48)

  if (!v49)
  if (!v54)

  if ((v51 & 1) == 0)
  {
    v36 = __biome_log_for_category(11);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      sub_100042D14((id *)p_fmdb);

  }
  return v51;
}

- (id)ckAtomRowWithTimestamp:(id)a3 inStream:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  BMSyncCKAtomRow *v16;
  _QWORD v18[6];

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v9 = objc_alloc((Class)NSString);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "siteIdentifierObject"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  v12 = objc_msgSend(v9, "initWithData:encoding:", v11, 4);

  v18[0] = CFSTR("CKAtom.site = ?");
  v18[1] = v12;
  v18[2] = CFSTR(" AND CKAtom.stream = ?");
  v18[3] = v7;
  v18[4] = CFSTR(" AND clock = ?");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "clockValue")));
  v18[5] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 6));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:](self, "SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:", v14, 0, 0));

  if (objc_msgSend(v15, "next"))
  {
    v16 = -[BMSyncCKAtomRow initWithFMResultSet:]([BMSyncCKAtomRow alloc], "initWithFMResultSet:", v15);
  }
  else
  {
    objc_msgSend(v15, "close");
    v16 = 0;
  }

  return v16;
}

- (id)latestCKAtomRowForSiteIdentifier:(id)a3 inStream:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  void *v9;
  void *v10;
  BMSyncCKAtomRow *v11;
  _QWORD v13[6];

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v13[0] = CFSTR("CKAtom.site = ?");
  v13[1] = v6;
  v13[2] = CFSTR(" AND CKAtom.stream = ?");
  v13[3] = v7;
  v13[4] = CFSTR(" AND on_disk IS ?");
  v13[5] = &__kCFBooleanTrue;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:](self, "SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:", v9, &off_10006E510, &off_10006EAE0));

  if (objc_msgSend(v10, "next"))
  {
    v11 = -[BMSyncCKAtomRow initWithFMResultSet:]([BMSyncCKAtomRow alloc], "initWithFMResultSet:", v10);
  }
  else
  {
    objc_msgSend(v10, "close");
    v11 = 0;
  }

  return v11;
}

- (id)timestampClockVectorForStreamName:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  void *v6;
  _bmFMDatabase *fmdb;
  void *v8;
  void *v9;
  id v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  _QWORD v17[4];

  v4 = a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v6 = (void *)objc_opt_new(CKDistributedTimestampClockVector);
  fmdb = self->_fmdb;
  v17[0] = CFSTR("stream = ?");
  v17[1] = v4;
  v17[2] = CFSTR(" AND on_disk IS ?");
  v17[3] = &__kCFBooleanTrue;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:GROUP_BY:](fmdb, "SELECT_FROM:COLUMNS:WHERE:GROUP_BY:", CFSTR("CKAtom"), &off_10006E528, v8, &off_10006E540));

  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_10001E624;
  v15 = &unk_1000691F0;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v9, "enumerateWithBlock:", &v12);
  objc_msgSend(v9, "close", v12, v13, v14, v15);

  return v10;
}

- (id)stateVectorForLocationRow:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  _QWORD v24[4];

  v4 = a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v24[0] = CFSTR("location_id = ?");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "primaryKey")));
  v24[1] = v7;
  v24[2] = CFSTR(" AND on_disk IS ?");
  v24[3] = &__kCFBooleanTrue;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:](fmdb, "SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:", CFSTR("CKAtom"), &off_10006E558, v8, &off_10006E570, 0));

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10001E950;
  v20 = sub_10001E960;
  v21 = (id)objc_opt_new(CKDistributedTimestampStateVector);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001E968;
  v15[3] = &unk_100069218;
  v15[4] = &v16;
  objc_msgSend(v9, "enumerateWithBlock:", v15);
  objc_msgSend(v9, "close");
  v10 = __biome_log_for_category(11);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v17[5];
    *(_DWORD *)buf = 138412290;
    v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "stateVector: %@", buf, 0xCu);
  }

  v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

- (id)latestCKAtomRowOfType:(unint64_t)a3 forSiteIdentifier:(id)a4 inStream:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  void *v11;
  void *v12;
  void *v13;
  BMSyncCKAtomRow *v14;
  _QWORD v16[10];

  v8 = a4;
  v9 = a5;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v16[0] = CFSTR("type = ?");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v16[1] = v11;
  v16[2] = CFSTR(" AND CKAtom.stream = ?");
  v16[3] = v9;
  v16[4] = CFSTR(" AND CKAtom.site = ?");
  v16[5] = v8;
  v16[6] = CFSTR(" AND on_disk IS ?");
  v16[7] = &__kCFBooleanTrue;
  v16[8] = CFSTR(" AND segment_name IS NOT ?");
  v16[9] = CFSTR("DOA");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 10));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:](self, "SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:", v12, &off_10006E588, &off_10006EAE0));

  if (objc_msgSend(v13, "next"))
  {
    v14 = -[BMSyncCKAtomRow initWithFMResultSet:]([BMSyncCKAtomRow alloc], "initWithFMResultSet:", v13);
  }
  else
  {
    objc_msgSend(v13, "close");
    v14 = 0;
  }

  return v14;
}

- (int)ckAtomCount
{
  OS_dispatch_queue *queue;
  void *v4;
  int v5;

  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](self->_fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("CKAtom"), &off_10006E5A0, 0));
  if (objc_msgSend(v4, "next"))
  {
    v5 = objc_msgSend(v4, "intForColumnIndex:", 0);
  }
  else
  {
    objc_msgSend(v4, "close");
    v5 = 0;
  }

  return v5;
}

- (BOOL)containsCKAtomRowWithTimestamp:(id)a3 inStream:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _bmFMDatabase *fmdb;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  _QWORD v19[6];

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v9 = objc_alloc((Class)NSString);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "siteIdentifierObject"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  v12 = objc_msgSend(v9, "initWithData:encoding:", v11, 4);

  fmdb = self->_fmdb;
  v19[0] = CFSTR("clock = ?");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "clockValue")));
  v19[1] = v14;
  v19[2] = CFSTR(" AND stream = ?");
  v19[3] = v7;
  v19[4] = CFSTR(" AND site = ?");
  v19[5] = v12;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 6));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("CKAtom"), &off_10006E5B8, v15));

  if (objc_msgSend(v16, "next"))
  {
    v17 = (int)objc_msgSend(v16, "intForColumnIndex:", 0) > 0;
  }
  else
  {
    objc_msgSend(v16, "close");
    v17 = 0;
  }

  return v17;
}

- (BOOL)containsCKAtomRowWithTimestamp:(id)a3 inStream:(id)a4 onDisk:(BOOL)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _bmFMDatabase *fmdb;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  _QWORD v22[8];

  v8 = a3;
  v9 = a4;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v11 = objc_alloc((Class)NSString);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "siteIdentifierObject"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
  v14 = objc_msgSend(v11, "initWithData:encoding:", v13, 4);

  fmdb = self->_fmdb;
  v22[0] = CFSTR("clock = ?");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "clockValue")));
  v22[1] = v16;
  v22[2] = CFSTR(" AND stream = ?");
  v22[3] = v9;
  v22[4] = CFSTR(" AND site = ?");
  v22[5] = v14;
  v22[6] = CFSTR(" AND on_disk IS ?");
  if (a5)
    v17 = &__kCFBooleanTrue;
  else
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v22[7] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 8));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("CKAtom"), &off_10006E5D0, v18));

  if (!a5)
  if (objc_msgSend(v19, "next"))
  {
    v20 = (int)objc_msgSend(v19, "intForColumnIndex:", 0) > 0;
  }
  else
  {
    objc_msgSend(v19, "close");
    v20 = 0;
  }

  return v20;
}

- (BOOL)updateCKAtomRow:(id)a3 inStream:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  uint64_t v27;
  NSObject *v28;
  _bmFMDatabase **p_fmdb;
  void *v31;
  void *v32;
  void *v33;
  _bmFMDatabase *fmdb;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[8];
  _QWORD v41[5];
  _QWORD v42[5];

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v9 = objc_alloc((Class)NSString);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timestamp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "siteIdentifierObject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  v13 = objc_msgSend(v9, "initWithData:encoding:", v12, 4);

  p_fmdb = &self->_fmdb;
  fmdb = self->_fmdb;
  v41[0] = CFSTR("segment_name");
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "segmentName"));
  v15 = (void *)v14;
  if (!v14)
    v14 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v37 = v15;
  v32 = (void *)v14;
  v42[0] = v14;
  v41[1] = CFSTR("segment_offset");
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "segmentName"));
  if (v36)
    v16 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", objc_msgSend(v6, "segmentOffset")));
  else
    v16 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v35 = (void *)v16;
  v42[1] = v16;
  v41[2] = CFSTR("value_version");
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "valueVersion")));
  v42[2] = v33;
  v41[3] = CFSTR("value_data");
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueData"));
  v18 = (void *)v17;
  if (!v17)
    v17 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v31 = (void *)v17;
  v42[3] = v17;
  v41[4] = CFSTR("on_disk");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "segmentName"));
  if (v19)
    v20 = &__kCFBooleanTrue;
  else
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v42[4] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 5));
  v39 = v7;
  v40[0] = CFSTR("stream = ?");
  v40[1] = v7;
  v40[2] = CFSTR(" AND site = ?");
  v38 = v13;
  v40[3] = v13;
  v40[4] = CFSTR(" AND clock = ?");
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timestamp"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "clockValue")));
  v40[5] = v23;
  v40[6] = CFSTR(" AND type = ?");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "type")));
  v40[7] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 8));
  v26 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", CFSTR("CKAtom"), v21, v25);

  if (!v19)
  if (!v18)

  if (!v37)
  if ((v26 & 1) == 0)
  {
    v27 = __biome_log_for_category(11);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      sub_100042D90((id *)p_fmdb);

  }
  return v26;
}

- (id)ckAtomRowForAtomWithBookmark:(id)a3 type:(unint64_t)a4 forSiteIdentifier:(id)a5 inStream:(id)a6
{
  id v10;
  id v11;
  id v12;
  OS_dispatch_queue *queue;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BMSyncCKAtomRow *v19;
  _QWORD v21[10];

  v10 = a3;
  v11 = a5;
  v12 = a6;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v21[0] = CFSTR("CKAtom.site = ?");
  v21[1] = v11;
  v21[2] = CFSTR(" AND CKAtom.stream = ?");
  v21[3] = v12;
  v21[4] = CFSTR(" AND type = ?");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v21[5] = v14;
  v21[6] = CFSTR(" AND segment_name = ?");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "segmentName"));
  v21[7] = v15;
  v21[8] = CFSTR(" AND segment_offset = ?");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", objc_msgSend(v10, "offset")));
  v21[9] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 10));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:](self, "SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:", v17, 0, 0));

  if (objc_msgSend(v18, "next"))
  {
    v19 = -[BMSyncCKAtomRow initWithFMResultSet:]([BMSyncCKAtomRow alloc], "initWithFMResultSet:", v18);
  }
  else
  {
    objc_msgSend(v18, "close");
    v19 = 0;
  }

  return v19;
}

- (id)latestDistributedTimestampForSiteIdentifier:(id)a3 inStream:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v18[0] = CFSTR("site = ?");
  v18[1] = v6;
  v18[2] = CFSTR(" AND stream = ?");
  v18[3] = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("CKAtom"), &off_10006E5E8, v10));

  if (objc_msgSend(v11, "next"))
  {
    v12 = objc_msgSend(v11, "unsignedLongLongIntForColumnIndex:", 0);
    v13 = objc_alloc((Class)CKDistributedSiteIdentifier);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataUsingEncoding:", 4));
    v15 = objc_msgSend(v13, "initWithIdentifier:", v14);

    v16 = objc_msgSend(objc_alloc((Class)CKDistributedTimestamp), "initWithSiteIdentifierObject:clockValue:", v15, v12);
  }
  else
  {
    objc_msgSend(v11, "close");
    v16 = 0;
  }

  return v16;
}

- (BOOL)containsCKAtomRowWithSegment:(id)a3 inStream:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v13[0] = CFSTR("stream = ?");
  v13[1] = v7;
  v13[2] = CFSTR(" AND segment_name = ?");
  v13[3] = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("CKAtom"), &off_10006E600, v10));

  LOBYTE(fmdb) = objc_msgSend(v11, "next");
  return (char)fmdb;
}

- (id)CKAtomRowSiteIdentifiers
{
  OS_dispatch_queue *queue;
  void *v4;
  id v5;
  void *v6;

  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](self->_fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("CKAtom"), &off_10006E618, 0));
  v5 = objc_alloc_init((Class)NSMutableArray);
  if (objc_msgSend(v4, "next"))
  {
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForColumnIndex:", 0));
      objc_msgSend(v5, "addObject:", v6);

    }
    while ((objc_msgSend(v4, "next") & 1) != 0);
  }

  return v5;
}

- (void)atomRowsNotOnDiskReferencingSiteIdentifier:(id)a3 inStream:(id)a4 enumerateWithBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *queue;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[8];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v20[0] = CFSTR("(ref_site = ?");
  v20[1] = v8;
  v20[2] = CFSTR(" OR (ref_site IS NULL AND CKAtom.site = ?))");
  v20[3] = v8;
  v20[4] = CFSTR(" AND CKAtom.stream = ?");
  v20[5] = v9;
  v20[6] = CFSTR(" AND on_disk IS ?");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v20[7] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 8));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:](self, "SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:", v13, &off_10006E630, 0));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001FBA4;
  v17[3] = &unk_100069240;
  v18 = v14;
  v19 = v10;
  v15 = v14;
  v16 = v10;
  objc_msgSend(v15, "enumerateWithBlock:", v17);
  objc_msgSend(v15, "close");

}

- (void)atomsAtOrBeforeLocation:(id)a3 ofType:(unint64_t)a4 enumerateWithBlock:(id)a5
{
  id v8;
  OS_dispatch_queue *queue;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[8];

  v8 = a3;
  v22 = a5;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v26[0] = CFSTR("location.stream = ?");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "location"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "streamName"));
  v26[1] = v10;
  v26[2] = CFSTR(" AND location.site = ?");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "location"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "siteIdentifier"));
  v26[3] = v12;
  v26[4] = CFSTR(" AND location.day <= ?");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "location"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "day"));
  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v26[5] = v15;
  v26[6] = CFSTR(" AND type = ?");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v26[7] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 8));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:](self, "SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:", v17, &off_10006E648, 0));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001FE38;
  v23[3] = &unk_100069240;
  v24 = v18;
  v25 = v22;
  v19 = v18;
  v20 = v22;
  objc_msgSend(v19, "enumerateWithBlock:", v23);
  objc_msgSend(v19, "close");

}

- (BOOL)deleteAllAtomsAtOrBeforeLocation:(id)a3
{
  id v4;
  _bmFMDatabase *fmdb;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  _bmFMDatabase *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[12];
  _QWORD v29[4];

  v4 = a3;
  fmdb = self->_fmdb;
  v29[0] = CFSTR("site = ?");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "siteIdentifier"));
  v29[1] = v7;
  v29[2] = CFSTR(" AND stream = ?");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "streamName"));
  v29[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:](fmdb, "SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:", CFSTR("CKAtom"), &off_10006E660, v10, &off_10006E678, &off_10006EAE0));

  if (objc_msgSend(v11, "next"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v11, "intForColumnIndex:", 0)));
    v21 = self->_fmdb;
    v28[0] = CFSTR("location_id IN (SELECT id from CRDTLocation where stream = ?");
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "streamName"));
    v28[1] = v26;
    v28[2] = CFSTR(" AND site = ?");
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "siteIdentifier"));
    v28[3] = v24;
    v28[4] = CFSTR(" AND day <= ?)");
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "day"));
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v28[5] = v13;
    v28[6] = CFSTR(" AND clock != ?");
    v28[7] = v23;
    v28[8] = CFSTR(" AND clock != (SELECT MAX(clock) FROM CKAtom WHERE stream = ?");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "streamName"));
    v28[9] = v15;
    v28[10] = CFSTR(" AND site = ?)");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "siteIdentifier"));
    v28[11] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 12));
    v19 = -[_bmFMDatabase DELETE_FROM:WHERE:](v21, "DELETE_FROM:WHERE:", CFSTR("CKAtom"), v18);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)locationsInClockVector:(id)a3 inStream:(id)a4 enumerateWithBlock:(id)a5
{
  id v8;
  id v9;
  NSMutableArray *v10;
  void *v11;
  id v12;
  uint64_t v13;
  char v14;
  void *i;
  void *v16;
  id v17;
  void *v18;
  id v19;
  const __CFString *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  BMSyncDatabase *v24;
  id v25;
  id obj;
  _QWORD v27[5];
  NSMutableArray *v28;
  id v29;
  _QWORD v30[4];
  NSMutableArray *v31;
  _QWORD *v32;
  _QWORD v33[3];
  char v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v8 = a3;
  v9 = a4;
  v25 = a5;
  if (objc_msgSend(v8, "timestampCount"))
  {
    v24 = self;
    v10 = objc_opt_new(NSMutableArray);
    -[NSMutableArray addObject:](v10, "addObject:", CFSTR("CKAtom.stream = ? "));
    -[NSMutableArray addObject:](v10, "addObject:", v9);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v11 = v8;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allSiteIdentifiers"));
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v36;
      v14 = 1;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          v17 = objc_alloc((Class)NSString);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
          v19 = objc_msgSend(v17, "initWithData:encoding:", v18, 4);

          if ((v14 & 1) != 0)
            v20 = CFSTR(" AND ((CKAtom.site = ? ");
          else
            v20 = CFSTR(") OR (CKAtom.site = ? ");
          -[NSMutableArray addObject:](v10, "addObject:", v20);
          -[NSMutableArray addObject:](v10, "addObject:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "clockValuesForSiteIdentifier:", v16));
          v33[0] = 0;
          v33[1] = v33;
          v33[2] = 0x2020000000;
          v34 = 1;
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_100020504;
          v30[3] = &unk_100069268;
          v32 = v33;
          v31 = v10;
          objc_msgSend(v21, "enumerateRangesUsingBlock:", v30);

          _Block_object_dispose(v33, 8);
          v14 = 0;
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        v14 = 0;
      }
      while (v12);
    }

    -[NSMutableArray addObject:](v10, "addObject:", CFSTR(")) AND on_disk IS ?"));
    -[NSMutableArray addObject:](v10, "addObject:", &__kCFBooleanTrue);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100020658;
    v27[3] = &unk_100068D90;
    v27[4] = v24;
    v28 = v10;
    v29 = v25;
    v22 = v10;
    -[BMSyncDatabase disableStatementCachingForBlock:](v24, "disableStatementCachingForBlock:", v27);

  }
  else
  {
    v11 = v8;
    v23 = __biome_log_for_category(11);
    v22 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_100042E0C();
  }

}

- (void)atomRowsInTimestampClockVector:(id)a3 forLocation:(id)a4 inStream:(id)a5 enumerateWithBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSMutableArray *v13;
  void *v14;
  id v15;
  uint64_t v16;
  char v17;
  void *i;
  void *v19;
  id v20;
  void *v21;
  id v22;
  const __CFString *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  BMSyncDatabase *v27;
  void *v28;
  id v29;
  id obj;
  _QWORD v31[5];
  NSMutableArray *v32;
  id v33;
  _QWORD v34[4];
  NSMutableArray *v35;
  _QWORD *v36;
  _QWORD v37[3];
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v29 = a6;
  v28 = v12;
  if (objc_msgSend(v10, "timestampCount"))
  {
    v27 = self;
    v13 = objc_opt_new(NSMutableArray);
    -[NSMutableArray addObject:](v13, "addObject:", CFSTR("CKAtom.stream = ? "));
    -[NSMutableArray addObject:](v13, "addObject:", v12);
    if (v11)
    {
      -[NSMutableArray addObject:](v13, "addObject:", CFSTR(" AND CKAtom.location_id = ? "));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "primaryKey")));
      -[NSMutableArray addObject:](v13, "addObject:", v14);

    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allSiteIdentifiers"));
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v40;
      v17 = 1;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v16)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
          v20 = objc_alloc((Class)NSString);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
          v22 = objc_msgSend(v20, "initWithData:encoding:", v21, 4);

          if ((v17 & 1) != 0)
            v23 = CFSTR(" AND ((CKAtom.site = ? ");
          else
            v23 = CFSTR(") OR (CKAtom.site = ? ");
          -[NSMutableArray addObject:](v13, "addObject:", v23);
          -[NSMutableArray addObject:](v13, "addObject:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clockValuesForSiteIdentifier:", v19));
          v37[0] = 0;
          v37[1] = v37;
          v37[2] = 0x2020000000;
          v38 = 1;
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_100020B5C;
          v34[3] = &unk_100069268;
          v36 = v37;
          v35 = v13;
          objc_msgSend(v24, "enumerateRangesUsingBlock:", v34);

          _Block_object_dispose(v37, 8);
          v17 = 0;
        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        v17 = 0;
      }
      while (v15);
    }

    -[NSMutableArray addObject:](v13, "addObject:", CFSTR(")) AND on_disk IS ?"));
    -[NSMutableArray addObject:](v13, "addObject:", &__kCFBooleanTrue);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100020CB0;
    v31[3] = &unk_100068D90;
    v31[4] = v27;
    v32 = v13;
    v33 = v29;
    v25 = v13;
    -[BMSyncDatabase disableStatementCachingForBlock:](v27, "disableStatementCachingForBlock:", v31);

  }
  else
  {
    v26 = __biome_log_for_category(11);
    v25 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_100042E0C();
  }

}

- (id)computeHighestLocationToDeleteUpToBookmark:(id)a3 forSiteIdentifier:(id)a4 inStream:(id)a5 offsetsIncrease:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  _bmFMDatabase *fmdb;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  BMSyncCRDTLocationRow *v24;
  void *v26;
  _QWORD v27[6];
  _QWORD v28[4];

  v6 = a6;
  v10 = a4;
  v11 = a5;
  v12 = CFSTR(" AND segment_offset < ?) OR NULL) == 0");
  if (v6)
    v12 = CFSTR(" AND segment_offset > ?) OR NULL) == 0");
  v13 = v12;
  fmdb = self->_fmdb;
  v28[0] = CFSTR("CKAtom.stream = ?");
  v28[1] = v11;
  v26 = v10;
  v28[2] = CFSTR(" AND CKAtom.site = ?");
  v28[3] = v10;
  v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 4));
  v27[0] = CFSTR("COUNT ((CAST(segment_name AS INT) > ?");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "segmentName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v17, "longLongValue")));
  v27[1] = v18;
  v27[2] = CFSTR(" OR segment_name = ?");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "segmentName"));
  v27[3] = v19;
  v27[4] = v13;
  v20 = objc_msgSend(v15, "offset");

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v20));
  v27[5] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 6));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:HAVING:ORDER_BY:LIMIT:](fmdb, "SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:HAVING:ORDER_BY:LIMIT:", CFSTR("CKAtom"), &off_10006E708, &off_10006E720, v16, &off_10006E738, v22, &off_10006E750, &off_10006EAE0));

  if (objc_msgSend(v23, "next"))
    v24 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]([BMSyncCRDTLocationRow alloc], "initWithFMResultSet:modifier:", v23, 1);
  else
    v24 = 0;

  return v24;
}

- (id)highestLocationWithBufferedAtomsOlderThan:(double)a3 forSiteIdentifier:(id)a4 inStream:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BMSyncCRDTLocationRow *v13;
  _QWORD v15[8];

  v8 = a4;
  v9 = a5;
  v15[0] = CFSTR("CKAtom.stream = ?");
  v15[1] = v9;
  v15[2] = CFSTR(" AND CKAtom.site = ?");
  v15[3] = v8;
  v15[4] = CFSTR(" AND on_disk IS NOT ?");
  v15[5] = &__kCFBooleanTrue;
  v15[6] = CFSTR(" AND location.day <= ?");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  v15[7] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 8));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:](self, "SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:", v11, &off_10006E768, &off_10006EAE0));

  if (objc_msgSend(v12, "next"))
    v13 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]([BMSyncCRDTLocationRow alloc], "initWithFMResultSet:modifier:", v12, 1);
  else
    v13 = 0;

  return v13;
}

- (id)SELECT_ATOMS_WHERE:(id)a3 ORDER_BY:(id)a4 LIMIT:(id)a5
{
  return -[_bmFMDatabase SELECT_FROM:COLUMNS:JOIN:WHERE:ORDER_BY:LIMIT:](self->_fmdb, "SELECT_FROM:COLUMNS:JOIN:WHERE:ORDER_BY:LIMIT:", CFSTR("CKAtom"), &off_10006E780, &off_10006E798, a3, a4, a5);
}

- (NSUUID)sharedSyncGeneration
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v7[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("SharedSyncGeneration")));
  if (v3 && (v4 = objc_opt_class(NSData, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
  {
    v7[0] = 0;
    v7[1] = 0;
    v5 = 0;
    if (objc_msgSend(v3, "length") == (id)16)
    {
      objc_msgSend(v3, "getBytes:length:", v7, 16);
      v5 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v7);
    }
  }
  else
  {
    v5 = 0;
  }

  return (NSUUID *)v5;
}

- (void)setSharedSyncGeneration:(id)a3
{
  void *v4;
  _QWORD v5[2];

  v5[0] = 0;
  v5[1] = 0;
  objc_msgSend(a3, "getUUIDBytes:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v5, 16));
  -[BMSyncDatabase setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("SharedSyncGeneration"));

}

- (NSDate)lastRapportSyncAttemptDate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("LastSyncAttemptDate")));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  }
  else
  {
    v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)setLastRapportSyncAttemptDate:(id)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    v4 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[BMSyncDatabase setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("LastSyncAttemptDate"));

}

- (NSDate)lastRapportSyncDate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("LastSyncDate")));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  }
  else
  {
    v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)setLastRapportSyncDate:(id)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    v4 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[BMSyncDatabase setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("LastSyncDate"));

}

- (NSDate)lastCloudKitSyncAttemptDate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("LastCloudKitAttemptDate")));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  }
  else
  {
    v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)setLastCloudKitSyncAttemptDate:(id)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    v4 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[BMSyncDatabase setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("LastCloudKitAttemptDate"));

}

- (NSDate)lastCloudKitSyncDate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("LastCloudKitSyncDate")));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  }
  else
  {
    v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)setLastCloudKitSyncDate:(id)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    v4 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[BMSyncDatabase setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("LastCloudKitSyncDate"));

}

- (id)ckSyncEngineMetaData
{
  return -[BMSyncDatabase valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("com.apple.biome.sync.ckMetaData"));
}

- (void)saveCKSyncEngineMetaData:(id)a3
{
  -[BMSyncDatabase setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("com.apple.biome.sync.ckMetaData"));
}

- (void)clearCKSyncEngineMetaData
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  -[BMSyncDatabase setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v3, CFSTR("com.apple.biome.sync.ckMetaData"));

}

- (NSString)mergeableRecordValueKey
{
  return (NSString *)-[BMSyncDatabase valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("MergeableRecordValueKey"));
}

- (void)setMergeableRecordValueKey:(id)a3
{
  -[BMSyncDatabase setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("MergeableRecordValueKey"));
}

- (BOOL)saveCKMergeableRecordValueRecordName:(id)a3 zoneName:(id)a4 mergeableRecordValueData:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[3];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v15[0] = CFSTR("stream_name");
  v15[1] = CFSTR("record_name");
  v16[0] = v9;
  v16[1] = v8;
  v15[2] = CFSTR("server_mergeable_value");
  v16[2] = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3));
  LOBYTE(fmdb) = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", CFSTR("CKMergeableRecordValue"), v13);

  return (char)fmdb;
}

- (BOOL)clearCKMergeableRecordValueServerMergeableValuesForRecordName:(id)a3 zoneName:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v10;
  _QWORD v12[4];

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v12[0] = CFSTR("stream_name = ?");
  v12[1] = v7;
  v12[2] = CFSTR(" AND record_name = ?");
  v12[3] = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 4));
  LOBYTE(fmdb) = -[_bmFMDatabase DELETE_FROM:WHERE:](fmdb, "DELETE_FROM:WHERE:", CFSTR("CKMergeableRecordValue"), v10);

  return (char)fmdb;
}

- (BOOL)clearCKMergeableRecordValueServerMergeableValuesForZoneName:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v7;
  _QWORD v9[2];

  v4 = a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v9[0] = CFSTR("stream_name = ?");
  v9[1] = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  LOBYTE(fmdb) = -[_bmFMDatabase DELETE_FROM:WHERE:](fmdb, "DELETE_FROM:WHERE:", CFSTR("CKMergeableRecordValue"), v7);

  return (char)fmdb;
}

- (void)enumerateMergeableRecordValuesForRecordName:(id)a3 zoneName:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _BYTE *);
  _bmFMDatabase *fmdb;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  _QWORD v17[4];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _BYTE *))a5;
  fmdb = self->_fmdb;
  v17[0] = CFSTR("stream_name = ?");
  v17[1] = v9;
  v17[2] = CFSTR(" AND record_name = ?");
  v17[3] = v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 4));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:](fmdb, "SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:", CFSTR("CKMergeableRecordValue"), &off_10006E7B0, v12, &off_10006E7C8, 0));

  v16 = 0;
  do
  {
    if (!objc_msgSend(v13, "next"))
      break;
    v14 = objc_autoreleasePoolPush();
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dataForColumn:", CFSTR("server_mergeable_value")));
    v10[2](v10, v15, &v16);

    objc_autoreleasePoolPop(v14);
  }
  while (!v16);

}

- (BOOL)getLatestTombstoneBookmarkForSiteIdentifier:(id)a3 inStream:(id)a4 segmentName:(id *)a5 segmentOffset:(unint64_t *)a6
{
  _bmFMDatabase *fmdb;
  id v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  _QWORD v16[4];

  fmdb = self->_fmdb;
  v16[0] = CFSTR("stream = ?");
  v16[1] = a4;
  v16[2] = CFSTR("AND site = ?");
  v16[3] = a3;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 4));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("TombstoneBookmark"), &off_10006E7E0, v12));

  v14 = objc_msgSend(v13, "next");
  if (v14)
  {
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringForColumn:", CFSTR("segment_name")));
    if (a6)
      *a6 = (unint64_t)objc_msgSend(v13, "longForColumn:", CFSTR("segment_offset"));
  }

  return v14;
}

- (BOOL)saveLatestTombstoneBookmark:(id)a3 forSiteIdentifier:(id)a4 inStream:(id)a5
{
  id v8;
  id v9;
  id v10;
  unsigned int v11;
  _bmFMDatabase *fmdb;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  _QWORD v19[4];
  _QWORD v20[4];
  _QWORD v21[4];
  _QWORD v22[2];
  _QWORD v23[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11 = -[BMSyncDatabase getLatestTombstoneBookmarkForSiteIdentifier:inStream:segmentName:segmentOffset:](self, "getLatestTombstoneBookmarkForSiteIdentifier:inStream:segmentName:segmentOffset:", v9, v10, 0, 0);
    fmdb = self->_fmdb;
    if (v11)
    {
      v22[0] = CFSTR("segment_name");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "segmentName"));
      v23[0] = v13;
      v22[1] = CFSTR("segment_offset");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", objc_msgSend(v8, "offset")));
      v23[1] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
      v21[0] = CFSTR("stream = ?");
      v21[1] = v10;
      v21[2] = CFSTR(" AND site = ?");
      v21[3] = v9;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 4));
      v17 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", CFSTR("TombstoneBookmark"), v15, v16);

    }
    else
    {
      v19[0] = CFSTR("stream");
      v19[1] = CFSTR("site");
      v20[0] = v10;
      v20[1] = v9;
      v19[2] = CFSTR("segment_name");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "segmentName"));
      v20[2] = v13;
      v19[3] = CFSTR("segment_offset");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", objc_msgSend(v8, "offset")));
      v20[3] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 4));
      v17 = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", CFSTR("TombstoneBookmark"), v15);
    }

  }
  else
  {
    v17 = 1;
  }

  return v17;
}

+ (id)createPrimaryDatabaseWithQueue:(id)a3
{
  id v3;
  BMSyncDatabase *v4;

  v3 = a3;
  v4 = -[BMSyncDatabase initWithQueue:]([BMSyncDatabase alloc], "initWithQueue:", v3);

  -[BMSyncDatabase setName:](v4, "setName:", CFSTR("primary"));
  -[BMSyncDatabase setCorruptionHandler:](v4, "setCorruptionHandler:", &stru_100069460);
  return v4;
}

+ (id)createDatabaseForAccount:(id)a3 queue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BMSyncDatabase *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BMPaths pathForSharedSyncWithAccount:domain:](BMPaths, "pathForSharedSyncWithAccount:domain:", v5, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("sync.db")));

  v9 = -[BMSyncDatabase initWithPath:options:queue:]([BMSyncDatabase alloc], "initWithPath:options:queue:", v8, 0, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v11 = objc_msgSend(v10, "length");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v13 = v12;
  if ((unint64_t)v11 > 7)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringToIndex:", 8));
    -[BMSyncDatabase setName:](v9, "setName:", v14);

  }
  else
  {
    -[BMSyncDatabase setName:](v9, "setName:", v12);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000262E8;
  v17[3] = &unk_100068B38;
  v18 = v5;
  v15 = v5;
  -[BMSyncDatabase setCorruptionHandler:](v9, "setCorruptionHandler:", v17);

  return v9;
}

+ (void)enumerateAccountSpecificDatabasesWithBlock:(id)a3
{
  void (**v5)(id, void *, void *);
  dispatch_queue_t current_queue;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[4];
  uint64_t v25;
  _BYTE v26[128];

  v5 = (void (**)(id, void *, void *))a3;
  if (!v5)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BMSyncDatabase+Creation.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  current_queue = dispatch_get_current_queue();
  v7 = (void *)objc_claimAutoreleasedReturnValue(current_queue);
  v8 = objc_alloc((Class)BMAccountManager);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = objc_msgSend(v8, "initWithUseCase:", BMUseCaseNotApplicable);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "accounts"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[BMSyncDatabase createDatabaseForAccount:queue:](BMSyncDatabase, "createDatabaseForAccount:queue:", v14, v7));
        if (objc_msgSend(v15, "open"))
        {
          v5[2](v5, v15, v14);
          objc_msgSend(v15, "close");
        }
        else
        {
          v16 = __biome_log_for_category(11);
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            sub_100043210(v24, v14, &v25, v17);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v11);
  }

}

- (id)ckRecordsToSyncToCloudKitForZone:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSMutableSet *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[2];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v5, "addObjectsFromArray:", &off_10006E810);
  if (v4)
  {
    v15[0] = CFSTR(" AND stream_identifier = ?");
    v15[1] = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
    objc_msgSend(v5, "addObjectsFromArray:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](self->_fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("CKRecord"), &off_10006E828, v5));
  v8 = 0;
  if (objc_msgSend(v7, "next"))
  {
    do
    {
      if (!v8)
        v8 = objc_opt_new(NSMutableSet);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringForColumnIndex:", 0));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringForColumnIndex:", 1));
      v11 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", v10, CKCurrentUserDefaultName);
      v12 = objc_msgSend(objc_alloc((Class)CKRecordID), "initWithRecordName:zoneID:", v9, v11);
      -[NSMutableSet addObject:](v8, "addObject:", v12);

    }
    while ((objc_msgSend(v7, "next") & 1) != 0);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v8, "allObjects"));

  return v13;
}

- (id)recordFromSystemFieldsData:(id)a3
{
  id v3;
  id v4;
  id v5;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v11;

  v3 = a3;
  v11 = 0;
  v4 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v3, &v11);

  v5 = v11;
  if (v5)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (v6)
  {
    v7 = __biome_log_for_category(11);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100044234();

    v9 = 0;
  }
  else
  {
    v9 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithCoder:", v4);
  }

  return v9;
}

- (id)createCKRecordFromRecordID:(id)a3 newRecord:(BOOL *)a4 recordType:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase getSystemFieldsDataForRecordName:zoneName:recordType:](self, "getSystemFieldsDataForRecordName:zoneName:recordType:", v9, v11, a5));

  if (v12)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase recordFromSystemFieldsData:](self, "recordFromSystemFieldsData:", v12));
    if (v13)
      goto LABEL_12;
    v14 = __biome_log_for_category(11);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      sub_1000442F8();

  }
  v16 = objc_alloc((Class)CKRecord);
  v17 = sub_100026870(a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v13 = objc_msgSend(v16, "initWithRecordType:recordID:", v18, v8);

  if (v13)
  {
    if (a4)
      *a4 = 1;
  }
  else
  {
    v19 = __biome_log_for_category(11);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      sub_100044294();

    v13 = 0;
  }
LABEL_12:

  return v13;
}

- (void)saveSystemFieldsDataForRecord:(id)a3 syncToCloudKit:(id)a4 recordType:(unint64_t)a5 crdtDeleted:(id)a6
{
  id v10;
  id v11;
  id v12;
  OS_dispatch_queue *queue;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  _bmFMDatabase *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  int v38;
  _bmFMDatabase *fmdb;
  void *v40;
  _QWORD v41[6];
  _QWORD v42[6];
  _QWORD v43[6];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recordName"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneName"));

  v19 = -[BMSyncDatabase ckRecordExists:zoneName:recordType:](self, "ckRecordExists:zoneName:recordType:", v15, v18, a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordChangeTag"));

  if (!v20)
  {
    if ((v19 & 1) == 0)
    {
      fmdb = self->_fmdb;
      v41[0] = CFSTR("record_metadata");
      goto LABEL_20;
    }
    v22 = 0;
LABEL_9:
    v24 = objc_alloc_init((Class)NSMutableDictionary);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordChangeTag"));

    if (v25)
    {
      if (!v22)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        objc_msgSend(v24, "setObject:forKey:", v37, CFSTR("record_metadata"));

        if (!v11)
          goto LABEL_14;
        goto LABEL_13;
      }
      objc_msgSend(v24, "setObject:forKey:", v22, CFSTR("record_metadata"));
    }
    if (!v11)
    {
LABEL_14:
      if (v12)
        objc_msgSend(v24, "setObject:forKey:", v12, CFSTR("deleted_crdt"));
      if (!objc_msgSend(v24, "count"))
      {

        goto LABEL_34;
      }
      v26 = self->_fmdb;
      v43[0] = CFSTR("record_name = ?");
      v43[1] = v15;
      v43[2] = CFSTR(" AND stream_identifier = ?");
      v43[3] = v18;
      v43[4] = CFSTR(" AND record_type = ?");
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
      v43[5] = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 6));
      LOBYTE(v26) = -[_bmFMDatabase UPDATE:SET:WHERE:](v26, "UPDATE:SET:WHERE:", CFSTR("CKRecord"), v24, v28);

      if ((v26 & 1) != 0)
        goto LABEL_34;
      goto LABEL_30;
    }
LABEL_13:
    objc_msgSend(v24, "setObject:forKey:", v11, CFSTR("sync_to_cloud_kit"));
    goto LABEL_14;
  }
  v21 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  objc_msgSend(v10, "encodeSystemFieldsWithCoder:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "encodedData"));

  if ((v19 & 1) != 0)
    goto LABEL_9;
  fmdb = self->_fmdb;
  v41[0] = CFSTR("record_metadata");
  if (v22)
  {
    v38 = 0;
    v23 = v22;
    goto LABEL_21;
  }
LABEL_20:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v22 = 0;
  v38 = 1;
LABEL_21:
  v42[0] = v23;
  v42[1] = v15;
  v40 = v15;
  v41[1] = CFSTR("record_name");
  v41[2] = CFSTR("stream_identifier");
  v29 = &__kCFBooleanFalse;
  v30 = v11;
  if (v11)
    v29 = v11;
  v42[2] = v18;
  v42[3] = v29;
  v41[3] = CFSTR("sync_to_cloud_kit");
  v41[4] = CFSTR("deleted_crdt");
  v31 = v12;
  if (!v12)
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v42[4] = v31;
  v41[5] = CFSTR("record_type");
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  v42[5] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 6));
  v34 = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", CFSTR("CKRecord"), v33);

  if (!v12)
  if (v38)

  v11 = v30;
  v15 = v40;
  if ((v34 & 1) == 0)
  {
LABEL_30:
    v35 = __biome_log_for_category(11);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      sub_10004435C();

  }
LABEL_34:

}

- (id)getSystemFieldsDataForRecordName:(id)a3 zoneName:(id)a4 recordType:(unint64_t)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[6];

  v8 = a3;
  v9 = a4;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v17[0] = CFSTR("record_name = ?");
  v17[1] = v8;
  v17[2] = CFSTR(" AND record_type = ?");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  v17[3] = v12;
  v17[4] = CFSTR(" AND stream_identifier = ?");
  v17[5] = v9;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 6));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("CKRecord"), &off_10006E840, v13));

  if (objc_msgSend(v14, "next"))
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataForColumnIndex:", 0));
  else
    v15 = 0;

  return v15;
}

- (BOOL)resetCKRecordsMetaDataAndSetToSyncForZone:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  _QWORD v13[4];
  _QWORD v14[3];
  _QWORD v15[3];

  v4 = a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v14[0] = CFSTR("record_metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v15[0] = v7;
  v14[1] = CFSTR("local_mergeable_value");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v14[2] = CFSTR("sync_to_cloud_kit");
  v15[1] = v8;
  v15[2] = &__kCFBooleanTrue;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 3));
  v13[0] = CFSTR("stream_identifier = ?");
  v13[1] = v4;
  v13[2] = CFSTR(" AND record_type = ?");
  v13[3] = &off_10006EAF8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 4));
  LOBYTE(fmdb) = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", CFSTR("CKRecord"), v9, v10);

  v11 = -[BMSyncDatabase clearCKMergeableRecordValueServerMergeableValuesForZoneName:](self, "clearCKMergeableRecordValueServerMergeableValuesForZoneName:", v4);
  return fmdb & v11;
}

- (void)resetMetadataForRecord:(id)a3 zoneName:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[4];
  _QWORD v17[2];
  _QWORD v18[2];

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v17[0] = CFSTR("record_metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v17[1] = CFSTR("local_mergeable_value");
  v18[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v18[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
  v16[0] = CFSTR("record_name = ?");
  v16[1] = v6;
  v16[2] = CFSTR(" AND stream_identifier = ?");
  v16[3] = v7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 4));
  LOBYTE(fmdb) = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", CFSTR("CKRecord"), v12, v13);

  if ((fmdb & 1) == 0)
  {
    v14 = __biome_log_for_category(11);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1000443C8();

  }
}

- (BOOL)saveCKRecordServerMergeableValue:(id)a3 recordName:(id)a4 zoneName:(id)a5 locationRow:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  OS_dispatch_queue *queue;
  BOOL v15;
  _bmFMDatabase *fmdb;
  void *v17;
  void *v18;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[6];
  _QWORD v23[6];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v15 = 1;
  if (!-[BMSyncDatabase ckRecordExists:zoneName:recordType:](self, "ckRecordExists:zoneName:recordType:", v11, v12, 1))
  {
    fmdb = self->_fmdb;
    v22[0] = CFSTR("location_id");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "primaryKey")));
    v23[0] = v17;
    v23[1] = &__kCFBooleanFalse;
    v22[1] = CFSTR("sync_to_cloud_kit");
    v22[2] = CFSTR("deleting");
    v23[2] = &__kCFBooleanFalse;
    v23[3] = v11;
    v22[3] = CFSTR("record_name");
    v22[4] = CFSTR("stream_identifier");
    v22[5] = CFSTR("record_type");
    v23[4] = v12;
    v23[5] = &off_10006EAF8;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 6));
    LOBYTE(fmdb) = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", CFSTR("CKRecord"), v18);

    if ((fmdb & 1) == 0)
    {
      v20 = __biome_log_for_category(11);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        sub_100044428();

      v15 = 0;
      if (v10)
        goto LABEL_7;
      goto LABEL_8;
    }
    v15 = 1;
  }
  if (v10)
LABEL_7:
    v15 = -[BMSyncDatabase saveCKMergeableRecordValueRecordName:zoneName:mergeableRecordValueData:](self, "saveCKMergeableRecordValueRecordName:zoneName:mergeableRecordValueData:", v11, v12, v10);
LABEL_8:

  return v15;
}

- (BOOL)saveCKRecordHighestDeletedLocationRow:(id)a3 recordName:(id)a4 zoneName:(id)a5 recordExists:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  _QWORD v20[6];
  _QWORD v21[6];
  _QWORD v22[6];
  const __CFString *v23;
  void *v24;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  if (v6)
  {
    v23 = CFSTR("location_id");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "primaryKey")));
    v24 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    v22[0] = CFSTR("record_name = ?");
    v22[1] = v11;
    v22[2] = CFSTR(" AND stream_identifier = ?");
    v22[3] = v12;
    v22[4] = CFSTR(" AND record_type = ?");
    v22[5] = &off_10006EB10;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 6));
    v18 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", CFSTR("CKRecord"), v16, v17);

  }
  else
  {
    v20[0] = CFSTR("location_id");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "primaryKey")));
    v21[0] = v15;
    v21[1] = &__kCFBooleanFalse;
    v20[1] = CFSTR("sync_to_cloud_kit");
    v20[2] = CFSTR("deleting");
    v21[2] = &__kCFBooleanFalse;
    v21[3] = v11;
    v20[3] = CFSTR("record_name");
    v20[4] = CFSTR("stream_identifier");
    v20[5] = CFSTR("record_type");
    v21[4] = v12;
    v21[5] = &off_10006EB10;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 6));
    v18 = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", CFSTR("CKRecord"), v16);
  }

  return v18;
}

- (BOOL)saveCKRecordLocalMergeableValue:(id)a3 recordName:(id)a4 zoneName:(id)a5 locationRow:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  OS_dispatch_queue *queue;
  unsigned int v15;
  _bmFMDatabase *fmdb;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  _QWORD v24[7];
  _QWORD v25[7];
  _QWORD v26[6];
  const __CFString *v27;
  void *v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v15 = -[BMSyncDatabase ckRecordExists:zoneName:recordType:](self, "ckRecordExists:zoneName:recordType:", v11, v12, 1);
  fmdb = self->_fmdb;
  if (!v15)
  {
    v24[0] = CFSTR("location_id");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "primaryKey")));
    v25[0] = v17;
    v25[1] = &__kCFBooleanFalse;
    v24[1] = CFSTR("sync_to_cloud_kit");
    v24[2] = CFSTR("deleting");
    v25[2] = &__kCFBooleanFalse;
    v25[3] = v11;
    v24[3] = CFSTR("record_name");
    v24[4] = CFSTR("stream_identifier");
    v25[4] = v12;
    v25[5] = &off_10006EAF8;
    v21 = v10;
    v24[5] = CFSTR("record_type");
    v24[6] = CFSTR("local_mergeable_value");
    if (!v10)
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v25[6] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 7));
    v20 = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", CFSTR("CKRecord"), v22);

    if (!v10)
    goto LABEL_12;
  }
  v27 = CFSTR("local_mergeable_value");
  v17 = v10;
  if (!v10)
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v28 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
  v26[0] = CFSTR("record_name = ?");
  v26[1] = v11;
  v26[2] = CFSTR(" AND stream_identifier = ?");
  v26[3] = v12;
  v26[4] = CFSTR(" AND record_type = ?");
  v26[5] = &off_10006EAF8;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 6));
  v20 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", CFSTR("CKRecord"), v18, v19);

  if (!v10)
LABEL_12:

  return v20;
}

- (BOOL)clearCKRecordLocalMergeableValueAndSetToSyncForZone:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  _bmFMDatabase *fmdb;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  _QWORD v13[4];
  _QWORD v14[2];
  _QWORD v15[2];
  uint8_t buf[4];
  id v17;

  v4 = a3;
  v5 = __biome_log_for_category(11);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "clearCKRecordLocalMergeableValueAndSetToSyncForZone %@", buf, 0xCu);
  }

  fmdb = self->_fmdb;
  v14[0] = CFSTR("local_mergeable_value");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v14[1] = CFSTR("sync_to_cloud_kit");
  v15[0] = v8;
  v15[1] = &__kCFBooleanTrue;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
  v13[0] = CFSTR("stream_identifier = ?");
  v13[1] = v4;
  v13[2] = CFSTR(" AND record_type = ?");
  v13[3] = &off_10006EAF8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 4));
  LOBYTE(fmdb) = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", CFSTR("CKRecord"), v9, v10);

  v11 = -[BMSyncDatabase clearCKMergeableRecordValueServerMergeableValuesForZoneName:](self, "clearCKMergeableRecordValueServerMergeableValuesForZoneName:", v4);
  return fmdb & v11;
}

- (id)ckRecordForRecordName:(id)a3 zoneName:(id)a4 recordType:(unint64_t)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v12;
  void *v13;
  void *v14;
  BMSyncCKRecord *v15;
  _QWORD v17[6];

  v8 = a3;
  v9 = a4;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v17[0] = CFSTR("record_name = ?");
  v17[1] = v8;
  v17[2] = CFSTR(" AND record_type = ?");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  v17[3] = v12;
  v17[4] = CFSTR(" AND stream_identifier = ?");
  v17[5] = v9;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 6));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("CKRecord"), &off_10006E858, v13));

  if (objc_msgSend(v14, "next"))
    v15 = -[BMSyncCKRecord initWithFMResultSet:]([BMSyncCKRecord alloc], "initWithFMResultSet:", v14);
  else
    v15 = 0;

  return v15;
}

- (BOOL)ckRecordExists:(id)a3 zoneName:(id)a4 recordType:(unint64_t)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[6];

  v8 = a3;
  v9 = a4;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v16[0] = CFSTR("record_name = ?");
  v16[1] = v8;
  v16[2] = CFSTR(" AND record_type = ?");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  v16[3] = v12;
  v16[4] = CFSTR(" AND stream_identifier = ?");
  v16[5] = v9;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 6));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("CKRecord"), &off_10006E870, v13));

  LOBYTE(v12) = objc_msgSend(v14, "next");
  return (char)v12;
}

- (void)updateAllCKRecordsAtOrBeforeLocationToBeDeletedOnSync:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[8];

  v4 = a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v14[0] = CFSTR("record_type = ?");
  v14[1] = &off_10006EAF8;
  v14[2] = CFSTR(" AND location_id IN(    SELECT id FROM CRDTLocation WHERE site = ?");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "siteIdentifier"));
  v14[3] = v7;
  v14[4] = CFSTR("     AND stream = ?");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "streamName"));
  v14[5] = v8;
  v14[6] = CFSTR("     AND day <= ?)");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "day"));
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v14[7] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 8));
  LOBYTE(fmdb) = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", CFSTR("CKRecord"), &off_10006EC88, v11);

  if ((fmdb & 1) == 0)
  {
    v12 = __biome_log_for_category(11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100044488();

  }
}

- (void)markCKRecordsAtOrBeforeLocationToBeDeletedOnSync:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[8];
  const __CFString *v17;
  void *v18;

  v4 = a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v17 = CFSTR("location_id");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v18 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v16[0] = CFSTR("record_type = ?");
  v16[1] = &off_10006EAF8;
  v16[2] = CFSTR(" AND location_id IN(    SELECT id FROM CRDTLocation WHERE site = ?");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "siteIdentifier"));
  v16[3] = v9;
  v16[4] = CFSTR("     AND stream = ?");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "streamName"));
  v16[5] = v10;
  v16[6] = CFSTR("     AND day <= ?)");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "day"));
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v16[7] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 8));
  LOBYTE(fmdb) = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", CFSTR("CKRecord"), v8, v13);

  if ((fmdb & 1) == 0)
  {
    v14 = __biome_log_for_category(11);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100044488();

  }
}

- (void)enumerateRecordsWithBlock:(id)a3
{
  void (**v4)(id, BMSyncCKRecord *, _BYTE *);
  OS_dispatch_queue *queue;
  void *v6;
  void *v7;
  BMSyncCKRecord *v8;
  char v9;

  v4 = (void (**)(id, BMSyncCKRecord *, _BYTE *))a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:JOIN:WHERE:ORDER_BY:LIMIT:](self->_fmdb, "SELECT_FROM:COLUMNS:JOIN:WHERE:ORDER_BY:LIMIT:", CFSTR("CKRecord"), &off_10006E888, &off_10006E8A0, &off_10006E8B8, &off_10006E8D0, 0));
  v9 = 0;
  do
  {
    if (!objc_msgSend(v6, "next"))
      break;
    v7 = objc_autoreleasePoolPush();
    v8 = -[BMSyncCKRecord initWithFMResultSet:]([BMSyncCKRecord alloc], "initWithFMResultSet:", v6);
    v4[2](v4, v8, &v9);

    objc_autoreleasePoolPop(v7);
  }
  while (!v9);

}

- (void)deleteCKRecordsAtOrBeforeLocation:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[8];

  v4 = a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v14[0] = CFSTR("record_type = ?");
  v14[1] = &off_10006EAF8;
  v14[2] = CFSTR(" AND location_id IN(    SELECT id FROM CRDTLocation WHERE site = ?");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "siteIdentifier"));
  v14[3] = v7;
  v14[4] = CFSTR("     AND stream = ?");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "streamName"));
  v14[5] = v8;
  v14[6] = CFSTR("     AND day <= ?)");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "day"));
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v14[7] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 8));
  LOBYTE(fmdb) = -[_bmFMDatabase DELETE_FROM:WHERE:](fmdb, "DELETE_FROM:WHERE:", CFSTR("CKRecord"), v11);

  if ((fmdb & 1) == 0)
  {
    v12 = __biome_log_for_category(11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000444E8();

  }
}

- (void)deleteCKRecordsForStreamName:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[2];

  v4 = a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v10[0] = CFSTR("stream_identifier = ?");
  v10[1] = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  LOBYTE(fmdb) = -[_bmFMDatabase DELETE_FROM:WHERE:](fmdb, "DELETE_FROM:WHERE:", CFSTR("CKRecord"), v7);

  if ((fmdb & 1) == 0)
  {
    v8 = __biome_log_for_category(11);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100044548();

  }
}

- (void)deleteCKRecordAtLocation:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  void *v6;
  _bmFMDatabase *fmdb;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[6];

  v4 = a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordName"));
  fmdb = self->_fmdb;
  v12[0] = CFSTR("record_name = ?");
  v12[1] = v6;
  v12[2] = CFSTR(" AND record_type = ?");
  v12[3] = &off_10006EAF8;
  v12[4] = CFSTR(" AND stream_identifier = ?");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "streamName"));
  v12[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 6));
  LOBYTE(fmdb) = -[_bmFMDatabase DELETE_FROM:WHERE:](fmdb, "DELETE_FROM:WHERE:", CFSTR("CKRecord"), v9);

  if ((fmdb & 1) == 0)
  {
    v10 = __biome_log_for_category(11);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000445A8();

  }
}

- (void)enumerateCKSyncRecordRecordsSetForDeletingUsingBlock:(id)a3
{
  void (**v4)(id, id, _BYTE *);
  OS_dispatch_queue *queue;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  char v13;

  v4 = (void (**)(id, id, _BYTE *))a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](self->_fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("CKRecord"), &off_10006E8E8, &off_10006E900));
  v13 = 0;
  do
  {
    if (!objc_msgSend(v6, "next"))
      break;
    v7 = objc_autoreleasePoolPush();
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringForColumn:", CFSTR("stream_identifier")));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringForColumn:", CFSTR("record_name")));
    v10 = (void *)v9;
    if (v8 && v9)
    {
      v11 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", v8, CKCurrentUserDefaultName);
      v12 = objc_msgSend(objc_alloc((Class)CKRecordID), "initWithRecordName:zoneID:", v10, v11);
      v4[2](v4, v12, &v13);

    }
    objc_autoreleasePoolPop(v7);
  }
  while (!v13);

}

- (id)gatherAllCKSyncRecordRecordsToBeDeleted
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1000335B8;
  v9 = sub_1000335C8;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000335D0;
  v4[3] = &unk_1000697A8;
  v4[4] = &v5;
  -[BMSyncDatabase enumerateCKSyncRecordRecordsSetForDeletingUsingBlock:](self, "enumerateCKSyncRecordRecordsSetForDeletingUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)deleteAllCKRecordsInZone:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[2];

  v4 = a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v11[0] = CFSTR("stream_identifier = ?");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneName"));
  v11[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  LOBYTE(fmdb) = -[_bmFMDatabase DELETE_FROM:WHERE:](fmdb, "DELETE_FROM:WHERE:", CFSTR("CKRecord"), v8);

  if ((fmdb & 1) == 0)
  {
    v9 = __biome_log_for_category(11);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100044608(v4, v10);

  }
}

- (unint64_t)ckRecordCountForRecordType:(unint64_t)a3
{
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[2];

  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v12[0] = CFSTR("record_type = ?");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v12[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:](fmdb, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("CKRecord"), &off_10006E918, v8));

  if (objc_msgSend(v9, "next"))
    v10 = objc_msgSend(v9, "unsignedLongLongIntForColumnIndex:", 0);
  else
    v10 = 0;

  return (unint64_t)v10;
}

- (BOOL)upsertCKRecordWithLocation:(id)a3 inStream:(id)a4
{
  id v6;
  id v7;
  id *p_fmdb;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD v24[6];
  _QWORD v25[6];
  _QWORD v26[4];
  _QWORD v27[4];

  v6 = a3;
  v7 = a4;
  p_fmdb = (id *)&self->_fmdb;
  v9 = *p_fmdb;
  v27[0] = CFSTR("location_id = ?");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "primaryKey")));
  v27[1] = v10;
  v27[2] = CFSTR(" AND record_type = ?");
  v27[3] = &off_10006EAF8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "SELECT_FROM:COLUMNS:WHERE:", CFSTR("CKRecord"), &off_10006E930, v11));

  v13 = objc_msgSend(v12, "next");
  v14 = *p_fmdb;
  if (v13)
  {
    v26[0] = CFSTR("location_id =?");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "primaryKey")));
    v26[1] = v15;
    v26[2] = CFSTR(" AND record_type = ?");
    v26[3] = &off_10006EAF8;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 4));
    v17 = objc_msgSend(v14, "UPDATE:SET:WHERE:", CFSTR("CKRecord"), &off_10006ECB0, v16);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "primaryKey", CFSTR("location_id"))));
    v25[0] = v15;
    v25[1] = &__kCFBooleanTrue;
    v24[1] = CFSTR("sync_to_cloud_kit");
    v24[2] = CFSTR("deleting");
    v25[2] = &__kCFBooleanFalse;
    v24[3] = CFSTR("record_name");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "location"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "recordName"));
    v25[3] = v18;
    v25[4] = v7;
    v24[4] = CFSTR("stream_identifier");
    v24[5] = CFSTR("record_type");
    v25[5] = &off_10006EAF8;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 6));
    v17 = objc_msgSend(v14, "INSERT_INTO:VALUES:", CFSTR("CKRecord"), v19);

  }
  if ((v17 & 1) != 0)
  {
    v20 = 1;
  }
  else
  {
    v21 = __biome_log_for_category(11);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      sub_100044690(p_fmdb, v22);

    v20 = 0;
  }

  return v20;
}

- (BOOL)disableAllCKSyncRecordsForSite:(id)a3 stream:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v17[8];
  _QWORD v18[2];
  _QWORD v19[2];

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v19[0] = &__kCFBooleanTrue;
  v18[0] = CFSTR("sync_to_cloud_kit");
  v18[1] = CFSTR("local_mergeable_value");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v19[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
  v17[0] = CFSTR("location_id IN (SELECT id FROM CRDTLocation WHERE site = ?");
  v17[1] = v6;
  v17[2] = CFSTR(" AND stream = ?)");
  v17[3] = v7;
  v17[4] = CFSTR(" AND deleted_crdt = ?");
  v17[5] = &__kCFBooleanFalse;
  v17[6] = CFSTR(" AND record_type = ?");
  v17[7] = &off_10006EAF8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 8));
  v13 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", CFSTR("CKRecord"), v11, v12);

  if ((v13 & 1) == 0)
  {
    v14 = __biome_log_for_category(11);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100044714();

  }
  return v13;
}

- (BOOL)enableAllCKSyncRecordsPreviouslyDisabledForSite:(id)a3 stream:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  _bmFMDatabase *fmdb;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v15[8];

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  fmdb = self->_fmdb;
  v15[0] = CFSTR("location_id IN (SELECT id FROM CRDTLocation WHERE site = ?");
  v15[1] = v6;
  v15[2] = CFSTR(" AND stream = ?)");
  v15[3] = v7;
  v15[4] = CFSTR(" AND record_type = ?");
  v15[5] = &off_10006EAF8;
  v15[6] = CFSTR(" AND deleted_crdt = ?");
  v15[7] = &__kCFBooleanTrue;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 8));
  v11 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", CFSTR("CKRecord"), &off_10006ECD8, v10);

  if ((v11 & 1) == 0)
  {
    v12 = __biome_log_for_category(11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100044714();

  }
  return v11;
}

+ (id)primaryDatabasePath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BMPaths syncDirectory](BMPaths, "syncDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("sync.db")));

  return v3;
}

+ (id)primaryDatabaseWALPath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "primaryDatabasePath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingString:", CFSTR("-wal")));

  return v3;
}

- (BMSyncDatabase)initWithQueue:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  BMSyncDatabase *v8;

  v4 = a3;
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "primaryDatabasePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = -[BMSyncDatabase initWithPath:options:queue:](self, "initWithPath:options:queue:", v7, 0, v4);

  return v8;
}

- (BMSyncDatabase)initWithPath:(id)a3
{
  return -[BMSyncDatabase initWithPath:options:queue:](self, "initWithPath:options:queue:", a3, 0, 0);
}

- (BMSyncDatabase)initWithPath:(id)a3 queue:(id)a4
{
  return -[BMSyncDatabase initWithPath:options:queue:](self, "initWithPath:options:queue:", a3, 0, a4);
}

- (BMSyncDatabase)initWithPath:(id)a3 options:(unint64_t)a4 queue:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  BMSyncDatabase *v12;
  BMSyncDatabase *v13;
  uint64_t v14;
  _bmFMDatabase *fmdb;
  NSString *loggingSuffix;
  void *v18;
  objc_super v19;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (!v10)
      goto LABEL_4;
    goto LABEL_3;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMSyncDatabase.m"), 294, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  if (v11)
LABEL_3:
    dispatch_assert_queue_V2(v11);
LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)BMSyncDatabase;
  v12 = -[BMSyncDatabase init](&v19, "init");
  v13 = v12;
  if (v12)
  {
    v12->__internal_state_ivar = 0;
    v14 = objc_claimAutoreleasedReturnValue(+[_bmFMDatabase databaseWithPath:](_bmFMDatabase, "databaseWithPath:", v9));
    fmdb = v13->_fmdb;
    v13->_fmdb = (_bmFMDatabase *)v14;

    -[_bmFMDatabase setShouldCacheStatements:](v13->_fmdb, "setShouldCacheStatements:", 1);
    v13->_options = a4;
    objc_storeStrong((id *)&v13->_queue, a5);
    loggingSuffix = v13->_loggingSuffix;
    v13->_loggingSuffix = (NSString *)&stru_100069AC0;

  }
  return v13;
}

- (void)setName:(id)a3
{
  NSString *v5;
  NSString *loggingSuffix;
  id v7;

  v7 = a3;
  if ((-[NSString isEqual:](self->_name, "isEqual:") & 1) == 0)
  {
    if (v7)
    {
      v5 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("[%@]"), v7);
      loggingSuffix = self->_loggingSuffix;
      self->_loggingSuffix = v5;
    }
    else
    {
      loggingSuffix = self->_loggingSuffix;
      self->_loggingSuffix = (NSString *)&stru_100069AC0;
    }

    objc_storeStrong((id *)&self->_name, a3);
  }

}

- (void)setState:(unint64_t)a3 error:(id)a4
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSString *loggingSuffix;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  int v17;
  NSString *v18;
  __int16 v19;
  const __CFString *v20;

  v7 = a4;
  objc_storeStrong((id *)&self->__error_ivar, a4);
  self->__internal_state_ivar = a3;
  v8 = __biome_log_for_category(11);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    loggingSuffix = self->_loggingSuffix;
    if (a3 > 9)
      v11 = CFSTR("Unknown");
    else
      v11 = off_100069868[a3];
    v17 = 138412546;
    v18 = loggingSuffix;
    v19 = 2112;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "BMSyncDatabase%@ transitioned to state: %@", (uint8_t *)&v17, 0x16u);
  }

  if (a3 == 7)
  {
    v14 = __biome_log_for_category(11);
    v13 = objc_claimAutoreleasedReturnValue(v14);
    v15 = os_log_type_enabled(v13, OS_LOG_TYPE_FAULT);
    if (v7)
    {
      if (v15)
        sub_1000448C8();
    }
    else if (v15)
    {
      sub_100044864();
    }
    goto LABEL_18;
  }
  if (a3 == 9)
  {
    v12 = __biome_log_for_category(11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      sub_1000447E4();
LABEL_18:

    goto LABEL_19;
  }
  if (v7)
  {
    v16 = __biome_log_for_category(11);
    v13 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100044774();
    goto LABEL_18;
  }
LABEL_19:

}

- (void)setState:(unint64_t)a3 errorFormat:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;

  v6 = a4;
  if (objc_msgSend(v6, "length"))
    v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v6, &v8);
  else
    v7 = 0;
  -[BMSyncDatabase setState:error:](self, "setState:error:", a3, v7);

}

- (BOOL)_tryOpen:(unint64_t)a3
{
  BOOL v6;
  unint64_t v7;
  const __CFString *v8;
  BMSyncDatabase *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  unsigned int v14;
  id v15;
  unsigned int v16;
  uint64_t v17;
  unsigned __int8 v18;
  _bmFMDatabase *fmdb;
  unsigned int v20;
  BMSyncDatabase *v21;
  SEL v22;
  unint64_t v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  id v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  NSString *loggingSuffix;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSString *v51;
  SEL v52;
  uint64_t v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  void *i;
  void *v59;
  id v60;
  int v61;
  void *v62;
  _bmFMDatabase *v63;
  CFStringRef v64;
  void *v65;
  void *v66;
  id v67;
  unsigned int v68;
  int has_internal_diagnostics;
  void *v70;
  void *v71;
  unsigned __int8 v72;
  int v73;
  void *v74;
  int v75;
  void *v76;
  const __CFString *v77;
  void *v79;
  unint64_t v80;
  id v81;
  id v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  uint8_t v89[128];
  uint8_t buf[4];
  NSString *v91;
  __int16 v92;
  int v93;

  if ((id)-[BMSyncDatabase internalState](self, "internalState") == (id)4)
    return 1;
  v7 = a3 + 1;
  if (v7 >= 0xA)
  {
    -[BMSyncDatabase setState:error:](self, "setState:error:", 9, CFSTR("recursion max"));
    return 0;
  }
  v6 = 1;
  switch(-[BMSyncDatabase internalState](self, "internalState"))
  {
    case 0uLL:
    case 1uLL:
    case 5uLL:
      v8 = &stru_100069AC0;
      v9 = self;
      v10 = 3;
      goto LABEL_96;
    case 2uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase databasePath](self->_fmdb, "databasePath"));
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByDeletingLastPathComponent"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v88 = 0;
      v14 = objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v88);
      v15 = v88;

      if (v14 && !v15)
        goto LABEL_11;
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedFailureReason"));
      -[BMSyncDatabase setState:errorFormat:](self, "setState:errorFormat:", 9, CFSTR("failed to create path at: %@, reason: %@"), v12, v59);

      goto LABEL_60;
    case 3uLL:
      if ((self->_flags & 1) != 0)
        v16 = 6;
      else
        v16 = 2;
      if ((self->_options & 1) != 0)
        v17 = v16 | 0x600000;
      else
        v17 = v16;
      v18 = -[_bmFMDatabase openWithFlags:](self->_fmdb, "openWithFlags:", v17);
      fmdb = self->_fmdb;
      if ((v18 & 1) == 0)
      {
        v61 = -[_bmFMDatabase lastErrorCode](fmdb, "lastErrorCode");
        if (v61 > 13)
        {
          if (v61 == 14)
          {
            v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
            v71 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase databasePath](self->_fmdb, "databasePath"));
            v72 = objc_msgSend(v70, "fileExistsAtPath:", v71);

            if ((v72 & 1) == 0)
            {
              v8 = &stru_100069AC0;
              v9 = self;
              v10 = 2;
              goto LABEL_96;
            }
            goto LABEL_84;
          }
          if (v61 != 23)
          {
LABEL_84:
            v73 = sqlite3_system_errno((sqlite3 *)-[_bmFMDatabase sqliteHandle](self->_fmdb, "sqliteHandle"));
            if (v73)
              v74 = strerror(v73);
            else
              v74 = (void *)sqlite3_errstr(-[_bmFMDatabase lastErrorCode](self->_fmdb, "lastErrorCode"));
            v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v74));
            -[BMSyncDatabase setState:error:](self, "setState:error:", 9, v76);

LABEL_94:
            v8 = &stru_100069AC0;
LABEL_95:
            v9 = self;
            v10 = 9;
            goto LABEL_96;
          }
          if ((self->_options & 1) == 0)
          {
            v8 = &stru_100069AC0;
            v9 = self;
            v10 = 6;
            goto LABEL_96;
          }
        }
        else
        {
          if (v61 == 5)
          {
            v8 = &stru_100069AC0;
            v9 = self;
            v10 = 5;
            goto LABEL_96;
          }
          if (v61 != 11)
            goto LABEL_84;
        }
        v8 = &stru_100069AC0;
        goto LABEL_91;
      }
      -[_bmFMDatabase executeStatements:](fmdb, "executeStatements:", CFSTR("PRAGMA journal_mode = WAL;PRAGMA foreign_keys = ON;"));
      if (!-[_bmFMDatabase tableExists:](self->_fmdb, "tableExists:", CFSTR("Metadata")))
      {
        self->_flags = 1;
        -[_bmFMDatabase beginTransaction](self->_fmdb, "beginTransaction");
        v63 = self->_fmdb;
        v64 = sub_1000363B0();
        v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
        -[_bmFMDatabase executeStatements:](v63, "executeStatements:", v65);

        -[_bmFMDatabase setUserVersion:](self->_fmdb, "setUserVersion:", 28);
        if (-[_bmFMDatabase commit](self->_fmdb, "commit"))
          goto LABEL_68;
        goto LABEL_94;
      }
      v20 = -[_bmFMDatabase userVersion](self->_fmdb, "userVersion");
      if (v20 >= 0x1D)
      {
        v8 = CFSTR("version too new");
LABEL_91:
        v9 = self;
        v10 = 7;
        goto LABEL_96;
      }
      v68 = v20;
      has_internal_diagnostics = os_variant_has_internal_diagnostics("com.apple.Biome");
      if (v68 <= 0x10 && has_internal_diagnostics)
      {
        v8 = CFSTR("internal build version < 17");
        goto LABEL_91;
      }
      v75 = os_variant_has_internal_diagnostics("com.apple.Biome");
      if (v68 - 17 <= 2 && v75)
      {
        v8 = CFSTR("internal build version between 17 and 19");
        goto LABEL_91;
      }
      if (v68 > 0x1B)
      {
LABEL_68:
        v8 = &stru_100069AC0;
        v9 = self;
        v10 = 4;
      }
      else
      {
        v8 = &stru_100069AC0;
        v9 = self;
        v10 = 8;
      }
LABEL_96:
      -[BMSyncDatabase setState:errorFormat:](v9, "setState:errorFormat:", v10, v8, v80);
      v21 = self;
      v22 = a2;
      v23 = v7;
      return -[BMSyncDatabase performSelector:withObject:](v21, "performSelector:withObject:", v22, v23) != 0;
    case 4uLL:
      return v6;
    case 6uLL:
      if (v7)
        return 0;
      -[BMSyncDatabase setState:errorFormat:](self, "setState:errorFormat:", 3, &stru_100069AC0);
      v21 = self;
      v22 = a2;
      v23 = 0;
      return -[BMSyncDatabase performSelector:withObject:](v21, "performSelector:withObject:", v22, v23) != 0;
    case 7uLL:
      if ((self->_flags & 1) != 0)
        goto LABEL_94;
      -[_bmFMDatabase close](self->_fmdb, "close");
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase databasePath](self->_fmdb, "databasePath"));
      v83 = 0;
      v26 = objc_msgSend(v24, "removeItemAtPath:error:", v25, &v83);
      v12 = v83;

      if (v26 && !v12)
        goto LABEL_27;
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "domain"));
      if (!objc_msgSend(v66, "isEqual:", NSCocoaErrorDomain))
      {

LABEL_81:
        -[BMSyncDatabase setState:errorFormat:](self, "setState:errorFormat:", 9, CFSTR("failed to delete corrupt database file: %@"), v12);
        goto LABEL_102;
      }
      v67 = objc_msgSend(v12, "code");

      if (v67 != (id)4)
        goto LABEL_81;
LABEL_27:

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase databasePath](self->_fmdb, "databasePath"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringByAppendingString:", CFSTR("-wal")));
      v82 = 0;
      v30 = objc_msgSend(v27, "removeItemAtPath:error:", v29, &v82);
      v12 = v82;

      if (v30 && !v12)
        goto LABEL_31;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "domain"));
      if (objc_msgSend(v31, "isEqual:", NSCocoaErrorDomain))
      {
        v32 = objc_msgSend(v12, "code");

        if (v32 == (id)4)
        {
LABEL_31:

          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase databasePath](self->_fmdb, "databasePath"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stringByAppendingString:", CFSTR("-shm")));
          v81 = 0;
          v36 = objc_msgSend(v33, "removeItemAtPath:error:", v35, &v81);
          v12 = v81;

          if (v36 && !v12)
          {
LABEL_35:
            v39 = objc_claimAutoreleasedReturnValue(-[BMSyncDatabase corruptionHandler](self, "corruptionHandler"));
            v15 = (id)v39;
            if (v39)
              (*(void (**)(uint64_t))(v39 + 16))(v39);
LABEL_11:
            self->_flags |= 1uLL;
            -[BMSyncDatabase setState:errorFormat:](self, "setState:errorFormat:", 3, &stru_100069AC0);
LABEL_60:
            v60 = -[BMSyncDatabase performSelector:withObject:](self, "performSelector:withObject:", a2, v7);

            goto LABEL_103;
          }
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "domain"));
          if (objc_msgSend(v37, "isEqual:", NSCocoaErrorDomain))
          {
            v38 = objc_msgSend(v12, "code");

            if (v38 == (id)4)
              goto LABEL_35;
          }
          else
          {

          }
          v80 = (unint64_t)v12;
          v77 = CFSTR("failed to delete corrupt database SHM file: %@");
          goto LABEL_101;
        }
      }
      else
      {

      }
      -[BMSyncDatabase setState:errorFormat:](self, "setState:errorFormat:", 9, CFSTR("failed to delete corrupt database WAL file: %@"), v12);
LABEL_102:
      v60 = -[BMSyncDatabase performSelector:withObject:](self, "performSelector:withObject:", a2, v7);
LABEL_103:
      v6 = v60 != 0;

      return v6;
    case 8uLL:
      v40 = -[_bmFMDatabase userVersion](self->_fmdb, "userVersion");
      if (v40 > 0x1B)
        goto LABEL_68;
      LODWORD(v41) = v40;
      while (2)
      {
        v41 = (v41 + 1);
        v42 = __biome_log_for_category(11);
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          loggingSuffix = self->_loggingSuffix;
          *(_DWORD *)buf = 138412546;
          v91 = loggingSuffix;
          v92 = 1024;
          v93 = v41;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "BMSyncDatabase%@ Migrating database to version %u", buf, 0x12u);
        }

        v45 = sub_1000363EC();
        v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v41));
        v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", v47));

        v49 = objc_opt_class(BMSyncDatabaseCustomFunctionMigration, v48);
        if ((objc_opt_isKindOfClass(v12, v49) & 1) != 0)
        {
          v51 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "customFunctionName"));
          v52 = NSSelectorFromString(v51);
          if (v52)
          {
            if ((((uint64_t (*)(BMSyncDatabase *, SEL))-[BMSyncDatabase methodForSelector:](self, "methodForSelector:", v52))(self, v52) & 1) != 0)goto LABEL_44;
            v79 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastError](self->_fmdb, "lastError"));
            -[BMSyncDatabase setState:errorFormat:](self, "setState:errorFormat:", 7, CFSTR("custom migration to version %u failed with error %@"), v41, v79);

LABEL_107:
            v60 = -[BMSyncDatabase performSelector:withObject:](self, "performSelector:withObject:", a2, v7);
LABEL_66:

            goto LABEL_103;
          }
        }
        else
        {
          v53 = objc_opt_class(BMSyncDatabaseSQLStatementMigration, v50);
          if ((objc_opt_isKindOfClass(v12, v53) & 1) == 0)
          {
            -[_bmFMDatabase beginTransaction](self->_fmdb, "beginTransaction");
            -[_bmFMDatabase setUserVersion:](self->_fmdb, "setUserVersion:", v41);
            if (!-[_bmFMDatabase commit](self->_fmdb, "commit"))
            {
              v77 = &stru_100069AC0;
LABEL_101:
              -[BMSyncDatabase setState:errorFormat:](self, "setState:errorFormat:", 9, v77, v80);
              goto LABEL_102;
            }
LABEL_57:

            if ((_DWORD)v41 == 28)
              goto LABEL_68;
            continue;
          }
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sqlStatements"));
          -[_bmFMDatabase beginTransaction](self->_fmdb, "beginTransaction");
          v84 = 0u;
          v85 = 0u;
          v86 = 0u;
          v87 = 0u;
          v51 = v54;
          v55 = -[NSString countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
          if (v55)
          {
            v56 = v55;
            v57 = *(_QWORD *)v85;
            while (2)
            {
              for (i = 0; i != v56; i = (char *)i + 1)
              {
                if (*(_QWORD *)v85 != v57)
                  objc_enumerationMutation(v51);
                if (!-[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)i)))
                {
                  v62 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastError](self->_fmdb, "lastError"));
                  -[BMSyncDatabase setState:errorFormat:](self, "setState:errorFormat:", 7, CFSTR("migration to version %u failed with error %@"), v41, v62);

                  v60 = -[BMSyncDatabase performSelector:withObject:](self, "performSelector:withObject:", a2, v7);
                  goto LABEL_66;
                }
              }
              v56 = -[NSString countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
              if (v56)
                continue;
              break;
            }
          }

          -[_bmFMDatabase setUserVersion:](self->_fmdb, "setUserVersion:", v41);
          if (-[_bmFMDatabase commit](self->_fmdb, "commit"))
          {
LABEL_44:

            goto LABEL_57;
          }
        }
        break;
      }
      -[BMSyncDatabase setState:errorFormat:](self, "setState:errorFormat:", 9, &stru_100069AC0);
      goto LABEL_107;
    case 9uLL:
      return 0;
    default:
      v80 = -[BMSyncDatabase internalState](self, "internalState");
      v8 = CFSTR("unhandled state %llu");
      goto LABEL_95;
  }
}

- (BOOL)open
{
  OS_dispatch_queue *queue;

  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  return -[BMSyncDatabase _tryOpen:](self, "_tryOpen:", 0);
}

- (unint64_t)state
{
  uint64_t v2;
  NSObject *v3;
  unint64_t result;

  switch(-[BMSyncDatabase internalState](self, "internalState"))
  {
    case 2uLL:
    case 3uLL:
    case 5uLL:
    case 7uLL:
    case 8uLL:
      v2 = __biome_log_for_category(11);
      v3 = objc_claimAutoreleasedReturnValue(v2);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
        sub_100044928();

      goto LABEL_5;
    case 4uLL:
      result = 1;
      break;
    case 6uLL:
      result = 2;
      break;
    case 9uLL:
      result = 3;
      break;
    default:
LABEL_5:
      result = 0;
      break;
  }
  return result;
}

- (void)close
{
  _bmFMDatabase **p_fmdb;
  uint64_t v4;
  NSObject *v5;

  p_fmdb = &self->_fmdb;
  if (-[_bmFMDatabase isOpen](self->_fmdb, "isOpen") && !-[_bmFMDatabase close](*p_fmdb, "close"))
  {
    v4 = __biome_log_for_category(11);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      sub_10004498C((uint64_t)self, (id *)p_fmdb, v5);

  }
  if ((id)-[BMSyncDatabase internalState](self, "internalState") == (id)4)
    -[BMSyncDatabase setState:error:](self, "setState:error:", 1, 0);
}

- (BOOL)beginTransaction
{
  return -[_bmFMDatabase beginDeferredTransaction](self->_fmdb, "beginDeferredTransaction");
}

- (BOOL)isInTransaction
{
  return -[_bmFMDatabase isInTransaction](self->_fmdb, "isInTransaction");
}

- (BOOL)commit
{
  return -[_bmFMDatabase commit](self->_fmdb, "commit");
}

- (BOOL)rollback
{
  return -[_bmFMDatabase rollback](self->_fmdb, "rollback");
}

- (void)clearCachedStatements
{
  -[_bmFMDatabase clearCachedStatements](self->_fmdb, "clearCachedStatements");
}

- (void)disableStatementCachingForBlock:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  -[_bmFMDatabase setShouldCacheStatementsWithoutClearingExistingStatements:](self->_fmdb, "setShouldCacheStatementsWithoutClearingExistingStatements:", 0);
  v4[2]();
  -[_bmFMDatabase setShouldCacheStatementsWithoutClearingExistingStatements:](self->_fmdb, "setShouldCacheStatementsWithoutClearingExistingStatements:", 1);

}

- (id)valueForMetadataKey:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self->_fmdb, "executeQuery:", CFSTR("SELECT value FROM Metadata WHERE key=?"), a3));
  if (objc_msgSend(v3, "next"))
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForColumnIndex:", 0));
  else
    v4 = 0;

  return v4;
}

- (void)setValue:(id)a3 forMetadataKey:(id)a4
{
  -[_bmFMDatabase executeUpdate:](self->_fmdb, "executeUpdate:", CFSTR("INSERT INTO Metadata VALUES (?, ?)"), a4, a3);
}

- (unsigned)version
{
  return -[_bmFMDatabase userVersion](self->_fmdb, "userVersion");
}

- (BOOL)migration_StarSkySchema11ToSydRoSchema12
{
  id v3;
  NSMutableSet *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  _BOOL4 v18;
  unsigned int v20;
  unsigned int v21;

  v21 = -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", CFSTR("PRAGMA foreign_keys=OFF"));
  v20 = -[_bmFMDatabase beginTransaction](self->_fmdb, "beginTransaction");
  v3 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", &off_10006EA38);
  v4 = objc_opt_new(NSMutableSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self->_fmdb, "executeQuery:", CFSTR("SELECT type, name FROM sqlite_schema WHERE tbl_name = 'CRDTLocation'")));
  if (objc_msgSend(v5, "next"))
  {
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForColumn:", CFSTR("type")));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForColumn:", CFSTR("name")));
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("table"))
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("CRDTLocation")) & 1) == 0)
      {
        -[NSMutableSet addObject:](v4, "addObject:", v7);
      }

    }
    while ((objc_msgSend(v5, "next") & 1) != 0);
  }
  if (objc_msgSend(v3, "isEqualToSet:", v4))
  {
    v8 = -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", CFSTR("CREATE TABLE new_CRDTLocation (id INTEGER primary key, stream STRING NOT NULL, site STRING NOT NULL, day INTEGER NOT NULL, state INTEGER NOT NULL)"));
    v9 = v21 & v20 & v8 & -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", CFSTR("INSERT INTO new_CRDTLocation SELECT * FROM CRDTLocation"));
    v10 = -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", CFSTR("DROP TABLE CRDTLocation"));
    v11 = v10 & -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", CFSTR("ALTER TABLE new_CRDTLocation RENAME TO CRDTLocation"));
    v12 = v9 & v11 & -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", CFSTR("CREATE INDEX IF NOT EXISTS idx_crdt_location ON CRDTLocation(stream, site, day)"));
    v13 = -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", CFSTR("CREATE INDEX IF NOT EXISTS idx_crdt_location_state ON CRDTLocation(stream, site, state, day DESC)"));
    v14 = v13 & -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", CFSTR("CREATE TABLE IF NOT EXISTS CKRecord (location_id INTEGER, sync_to_cloud_kit BOOL, record_metadata BLOB, record_name STRING, stream_identifier STRING, mergeable_value_delta BLOB, deleting BOOL, FOREIGN KEY (location_id) REFERENCES CRDTLocation(id));"));
    v15 = v12 & v14 & -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", CFSTR("CREATE INDEX IF NOT EXISTS idx_ckrecord ON CKRecord(record_name)"));
    v16 = objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self->_fmdb, "executeQuery:", CFSTR("PRAGMA foreign_key_check")));
    v17 = v15 & ~objc_msgSend((id)v16, "next");

    -[_bmFMDatabase setUserVersion:](self->_fmdb, "setUserVersion:", 12);
    LODWORD(v16) = -[_bmFMDatabase commit](self->_fmdb, "commit");
    v18 = v17 & v16 & -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", CFSTR("PRAGMA foreign_keys=ON"));
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (BOOL)migration_Schema20ToSchema21
{
  unsigned __int8 v3;
  char v4;
  unsigned __int8 v5;
  char v6;
  unsigned __int8 v7;
  char v8;
  char v9;
  char v10;
  uint64_t v11;
  char v12;

  v3 = -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", CFSTR("PRAGMA foreign_keys=OFF"));
  v4 = v3 & -[_bmFMDatabase beginTransaction](self->_fmdb, "beginTransaction");
  v5 = -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", CFSTR("CREATE TABLE new_CKRecord (location_id INTEGER, sync_to_cloud_kit BOOL, record_metadata BLOB, record_name STRING, stream_identifier STRING, local_mergeable_value BLOB, deleting BOOL,  PRIMARY KEY (stream_identifier, record_name), FOREIGN KEY (location_id) REFERENCES CRDTLocation(id));"));
  v6 = v4 & v5 & -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", CFSTR("INSERT INTO new_CKRecord SELECT location_id, sync_to_cloud_kit, record_metadata, record_name, stream_identifier, local_mergeable_value, deleting FROM CKRecord"));
  v7 = -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", CFSTR("DROP TABLE CKRecord"));
  v8 = v7 & -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", CFSTR("ALTER TABLE new_CKRecord RENAME TO CKRecord"));
  v9 = v6 & v8 & -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", CFSTR("CREATE INDEX IF NOT EXISTS idx_ckrecord ON CKRecord(record_name)"));
  v10 = v9 & -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", CFSTR("CREATE TABLE IF NOT EXISTS CKMergeableRecordValue (stream_name STRING, record_name STRING, server_mergeable_value BLOB, FOREIGN KEY (stream_name, record_name) REFERENCES CKRecord(stream_identifier, record_name))"));
  v11 = objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self->_fmdb, "executeQuery:", CFSTR("PRAGMA foreign_key_check")));
  v12 = v10 & ~objc_msgSend((id)v11, "next");

  -[_bmFMDatabase setUserVersion:](self->_fmdb, "setUserVersion:", 21);
  LOBYTE(v11) = -[_bmFMDatabase commit](self->_fmdb, "commit");
  return v12 & v11 & -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", CFSTR("PRAGMA foreign_keys=ON"));
}

- (BOOL)migration_Schema27ToSchema28
{
  -[_bmFMDatabase setUserVersion:](self->_fmdb, "setUserVersion:", 28);
  return 1;
}

- (NSString)error
{
  return self->__error_ivar;
}

- (unint64_t)internalState
{
  return self->__internal_state_ivar;
}

- (id)corruptionHandler
{
  return self->_corruptionHandler;
}

- (void)setCorruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_corruptionHandler, 0);
  objc_storeStrong((id *)&self->__error_ivar, 0);
  objc_storeStrong((id *)&self->_loggingSuffix, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_fmdb, 0);
}

- (void)recordSessionStart:(id)a3 transport:(unint64_t)a4 reason:(unint64_t)a5 isReciprocal:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  NSObject *v13;
  double Current;
  _bmFMDatabase *fmdb;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  uint8_t buf[4];
  id v24;

  v6 = a6;
  v10 = a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v12 = __biome_log_for_category(11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "recordSessionStart: %@", buf, 0xCu);
  }

  Current = CFAbsoluteTimeGetCurrent();
  fmdb = self->_fmdb;
  v22[0] = v10;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4, CFSTR("session_id"), CFSTR("transport")));
  v22[1] = v16;
  v21[2] = CFSTR("reason");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  v22[2] = v17;
  v21[3] = CFSTR("is_reciprocal");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
  v22[3] = v18;
  v21[4] = CFSTR("start_timestamp");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
  v22[4] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 5));
  -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", CFSTR("SyncSessionLog"), v20);

}

- (void)recordSessionEnd:(id)a3 timeSincePreviousSync:(double)a4
{
  id v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  NSObject *v9;
  CFAbsoluteTime Current;
  _bmFMDatabase *fmdb;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  uint8_t buf[4];
  id v20;

  v6 = a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v8 = __biome_log_for_category(11);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "recordSessionEnd: %@", buf, 0xCu);
  }

  Current = CFAbsoluteTimeGetCurrent();
  fmdb = self->_fmdb;
  v17[0] = CFSTR("end_timestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
  v17[1] = CFSTR("time_since_previous_sync");
  v18[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  v18[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
  v16[0] = CFSTR("session_id = ?");
  v16[1] = v6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
  -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", CFSTR("SyncSessionLog"), v14, v15);

}

- (void)recordMessageToDeviceIdentifier:(id)a3 sessionID:(id)a4 messageID:(unint64_t)a5 reachable:(BOOL)a6 bytes:(unint64_t)a7 isReciprocal:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v10;
  id v14;
  id v15;
  OS_dispatch_queue *queue;
  uint64_t v17;
  NSObject *v18;
  double Current;
  _bmFMDatabase *fmdb;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[7];
  _QWORD v28[7];
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;

  v8 = a8;
  v10 = a6;
  v14 = a3;
  v15 = a4;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v17 = __biome_log_for_category(11);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v14;
    v31 = 2112;
    v32 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "recordMessageToDeviceIdentifier: %@, %@", buf, 0x16u);
  }

  Current = CFAbsoluteTimeGetCurrent();
  fmdb = self->_fmdb;
  v28[0] = v15;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5, CFSTR("session_id"), CFSTR("message_id")));
  v28[1] = v21;
  v28[2] = v14;
  v27[2] = CFSTR("device_identifier");
  v27[3] = CFSTR("reachable");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10));
  v28[3] = v22;
  v27[4] = CFSTR("atom_batch_bytes");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a7));
  v28[4] = v23;
  v27[5] = CFSTR("is_reciprocal");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8));
  v28[5] = v24;
  v27[6] = CFSTR("timestamp");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
  v28[6] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 7));
  -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", CFSTR("SyncMessageLog"), v26);

}

- (void)recordAtomMergeResult:(unint64_t)a3 inStream:(id)a4 sessionID:(id)a5 messageID:(unint64_t)a6 ownerSite:(id)a7 originatingSite:(id)a8 eventCreatedAt:(double)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  OS_dispatch_queue *queue;
  uint64_t v21;
  NSObject *v22;
  double Current;
  _bmFMDatabase *fmdb;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[8];
  _QWORD v31[8];

  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v21 = __biome_log_for_category(11);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    sub_100044AF4(a3, v22);

  Current = CFAbsoluteTimeGetCurrent();
  fmdb = self->_fmdb;
  v31[0] = v17;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a6, CFSTR("session_id"), CFSTR("message_id")));
  v31[1] = v25;
  v31[2] = v16;
  v30[2] = CFSTR("stream");
  v30[3] = CFSTR("owning_site_identifier");
  v31[3] = v18;
  v31[4] = v19;
  v30[4] = CFSTR("relayed_by_site_identifier");
  v30[5] = CFSTR("merge_result");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v31[5] = v26;
  v30[6] = CFSTR("event_created_at");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a9));
  v31[6] = v27;
  v30[7] = CFSTR("synced_at");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
  v31[7] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 8));
  -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", CFSTR("AtomMergedLog"), v29);

}

- (void)computeAggregatedSessionLogsWithHandlerBlock:(id)a3
{
  OS_dispatch_queue *queue;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self->_fmdb, "executeQuery:", CFSTR("select transport as transport_type, session_duration.session_id, time_since_previous_sync, duration, reachable_peers_cnt, is_reciprocal, reason as sync_reason, cast((select count(*) from DevicePeer) as text) as known_peers_cnt_str, cast(reachable_peers_cnt as real) / (select count(*) from DevicePeer) as peer_availabilty_pct, avg_sync_latency, atoms_dropped_cnt, atoms_causality_violation_cnt, atoms_received_cnt, atoms_relayed_cnt, relay_earliness, relay_unseen_peer_atom_cnt, atom_batch_bytes from(select transport, session_id, is_reciprocal, reason, (end_timestamp - start_timestamp) as duration, time_since_previous_sync from SyncSessionLog group by session_id, is_reciprocal, reason) as session_duration left join(select session_id, count(distinct device_identifier) as reachable_peers_cnt from SyncMessageLog group by session_id) as reachable_peers on session_duration.session_id=reachable_peers.session_id left join(select session_id, avg(case when event_created_at <> 0 then synced_at - event_created_at else null end) as avg_sync_latency from AtomMergedLog group by session_id) as sync_latency on session_duration.session_id=sync_latency.session_id left join(select a.session_id, sum(case when a.merge_result=1 THEN 1 else 0 end) as atoms_dropped_cnt, sum(case when a.merge_result=2 THEN 1 else 0 end) as atoms_causality_violation_cnt, sum(case when a.merge_result=3 THEN 1 else 0 end) as atoms_received_cnt from AtomMergedLog as a group by a.session_id) as merge_results on session_duration.session_id=merge_results.session_id left join(select session_id, count(*) as atoms_relayed_cnt from AtomMergedLog as a where owning_site_identifier <> relayed_by_site_identifier and not exists(select * from SyncMessageLog as m where a.session_id=m.session_id and device_identifier=owning_site_identifier and reachable=1) group by session_id) as relay_count on session_duration.session_id=relay_count.session_id left join(select relayed.session_id, avg(timestamp - synced_at) as relay_earliness from(select atom.session_id, synced_at, timestamp from AtomMergedLog as atom, SyncMessageLog as message where owning_site_identifier <> relayed_by_site_identifier and not exists(select * from SyncMessageLog as m where atom.session_id=m.session_id and device_identifier=owning_site_identifier and reachable=1) and device_identifier=owning_site_identifier and reachable=1 and timestamp > synced_at order by timestamp asc limit 1) as relayed group by relayed.session_id) as earliness on session_duration.session_id=earliness.session_id left join(select session_id, count(*) as relay_unseen_peer_atom_cnt from AtomMergedLog as a where owning_site_identifier <> relayed_by_site_identifier and not exists(select * from SyncMessageLog as m where device_identifier=owning_site_identifier and reachable=1) group by session_id) as atom_relay_unseen_device on session_duration.session_id=atom_relay_unseen_device.session_id left join(select session_id, sum(atom_batch_bytes) as atom_batch_bytes from SyncMessageLog group by session_id) as batch_bytes on session_duration.session_id=batch_bytes.session_id;")));
  if (objc_msgSend(v5, "next"))
  {
    do
    {
      v6 = objc_autoreleasePoolPush();
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resultDictionary"));
      v8[2](v8, v7);

      objc_autoreleasePoolPop(v6);
    }
    while ((objc_msgSend(v5, "next") & 1) != 0);
  }
  objc_msgSend(v5, "close");

}

- (void)compactAndDeleteSessionLogs
{
  OS_dispatch_queue *queue;

  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  -[_bmFMDatabase executeUpdate:](self->_fmdb, "executeUpdate:", CFSTR("DELETE FROM SyncMessageLog WHERE timestamp <> (SELECT max(timestamp) FROM SyncMessageLog message WHERE device_identifier=message.device_identifier)"));
  -[_bmFMDatabase executeUpdate:](self->_fmdb, "executeUpdate:", CFSTR("DELETE FROM SyncSessionLog"));
  -[_bmFMDatabase executeUpdate:](self->_fmdb, "executeUpdate:", CFSTR("DELETE FROM AtomMergedLog"));
}

- (void)enforceMaxSessionLogPrunePolicy
{
  OS_dispatch_queue *queue;
  void *v4;

  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v4 = objc_autoreleasePoolPush();
  -[_bmFMDatabase executeUpdate:](self->_fmdb, "executeUpdate:", CFSTR("DELETE FROM SyncSessionLog WHERE session_id NOT IN (SELECT session_id from SyncSessionLog ORDER BY start_timestamp DESC LIMIT 1000)"));
  -[_bmFMDatabase executeUpdate:](self->_fmdb, "executeUpdate:", CFSTR("DELETE FROM SyncMessageLog WHERE session_id NOT IN (SELECT session_id from SyncSessionLog)"));
  -[_bmFMDatabase executeUpdate:](self->_fmdb, "executeUpdate:", CFSTR("DELETE FROM AtomMergedLog WHERE session_id NOT IN (SELECT session_id from SyncSessionLog)"));
  objc_autoreleasePoolPop(v4);
}

- (void)runVacuumingTask:(id)a3
{
  id v4;
  NSDate *v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100038EF8;
  v6[3] = &unk_1000698C0;
  v4 = a3;
  v7 = v4;
  if (-[BMSyncDatabase vacuumWithShouldContinueBlock:](self, "vacuumWithShouldContinueBlock:", v6))
  {
    v5 = objc_opt_new(NSDate);
    -[BMSyncDatabase setDateOfLastVacuum:](self, "setDateOfLastVacuum:", v5);

  }
  +[BMCoreAnalyticsEvents sendSyncDatabaseSummaryWithDatabase:](BMCoreAnalyticsEvents, "sendSyncDatabaseSummaryWithDatabase:", self);

}

- (NSDate)dateOfLastVacuum
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("LastVacuumDate")));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  }
  else
  {
    v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)setDateOfLastVacuum:(id)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    v4 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[BMSyncDatabase setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("LastVacuumDate"));

}

- (unint64_t)_numPagesToVacuum
{
  void *v3;
  unsigned __int8 v4;
  id v5;
  _BYTE *v6;
  NSObject *v7;
  unsigned __int8 v8;
  id v9;
  _BYTE *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v32;
  id v33;
  uint8_t buf[4];
  _BYTE *v35;
  __int16 v36;
  _BYTE *v37;
  __int16 v38;
  double v39;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self->_fmdb, "executeQuery:", CFSTR("PRAGMA page_count")));
  v33 = 0;
  v4 = objc_msgSend(v3, "nextWithError:", &v33);
  v5 = v33;
  if ((v4 & 1) != 0)
  {
    v6 = objc_msgSend(v3, "unsignedLongLongIntForColumnIndex:", 0);
    objc_msgSend(v3, "close");
    v7 = objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self->_fmdb, "executeQuery:", CFSTR("PRAGMA freelist_count")));
    v32 = v5;
    v8 = -[NSObject nextWithError:](v7, "nextWithError:", &v32);
    v9 = v32;

    if ((v8 & 1) != 0)
    {
      v10 = -[NSObject unsignedLongLongIntForColumnIndex:](v7, "unsignedLongLongIntForColumnIndex:", 0);
      -[NSObject close](v7, "close");
      v11 = __biome_log_for_category(11);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v35 = v6;
        v36 = 2048;
        v37 = v10;
        v38 = 2048;
        v39 = (double)(unint64_t)(v6 - v10) / (double)(unint64_t)v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "vacuumWithShouldContinueBlock calculating pages to vacuum -- pageCount %tu freeCount %tu loadFactor %f", buf, 0x20u);
      }

      if ((double)(unint64_t)(v6 - v10) / (double)(unint64_t)v6 <= 0.85 || (unint64_t)v10 > 0x3FF)
      {
        v22 = (unint64_t)((double)(unint64_t)v10 * 0.8);
        goto LABEL_18;
      }
      v13 = __biome_log_for_category(11);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v35 = v6;
        v36 = 2048;
        v37 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "vacuumWithShouldContinueBlock not enough pages to vacuum: pageCount: %lu; freeCount: %lu",
          buf,
          0x16u);
      }

    }
    else
    {
      v23 = __biome_log_for_category(11);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_100044B88((uint64_t)v9, v24, v25, v26, v27, v28, v29, v30);

    }
    v22 = 0;
  }
  else
  {
    v15 = __biome_log_for_category(11);
    v7 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100044BEC((uint64_t)v5, v7, v16, v17, v18, v19, v20, v21);
    v22 = 0;
    v9 = v5;
  }
LABEL_18:

  return v22;
}

- (BOOL)vacuumWithShouldContinueBlock:(id)a3
{
  unsigned int (**v4)(_QWORD);
  void *v5;
  unsigned __int8 v6;
  id v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _bmFMDatabase *fmdb;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  BOOL v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  unsigned __int8 v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  id v63;
  uint8_t buf[4];
  unint64_t v65;
  __int16 v66;
  unint64_t v67;

  v4 = (unsigned int (**)(_QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self->_fmdb, "executeQuery:", CFSTR("PRAGMA auto_vacuum")));
  v63 = 0;
  v6 = objc_msgSend(v5, "nextWithError:", &v63);
  v7 = v63;
  if ((v6 & 1) == 0)
  {
    v23 = __biome_log_for_category(11);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_100044CE0((uint64_t)v7, v24, v25, v26, v27, v28, v29, v30);
    goto LABEL_25;
  }
  v8 = objc_msgSend(v5, "intForColumnIndex:", 0);
  objc_msgSend(v5, "close");
  v9 = __biome_log_for_category(11);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v65) = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "vacuumWithShouldContinueBlock current vacuum mode is %u", buf, 8u);
  }

  if (v4 && !v4[2](v4))
    goto LABEL_26;
  if (v8 != 2)
  {
    v32 = -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", CFSTR("PRAGMA auto_vacuum = 2"));
    v33 = __biome_log_for_category(11);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    v35 = v34;
    if ((v32 & 1) == 0)
    {
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        sub_100044CB0(v35, v39, v40, v41, v42, v43, v44, v45);

      goto LABEL_26;
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "vacuumWithShouldContinueBlock successfully set auto_vacuum to INCREMENTAL", buf, 2u);
    }

    v36 = -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", CFSTR("VACUUM"));
    v37 = __biome_log_for_category(11);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    v24 = v38;
    if ((v36 & 1) != 0)
    {
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "vacuumWithShouldContinueBlock successfully ran initial VACUUM", buf, 2u);
      }

      v22 = 1;
      goto LABEL_27;
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      sub_100044C80(v24, v46, v47, v48, v49, v50, v51, v52);
LABEL_25:

LABEL_26:
    v22 = 0;
    goto LABEL_27;
  }
  v11 = -[BMSyncDatabase _numPagesToVacuum](self, "_numPagesToVacuum");
  v12 = __biome_log_for_category(11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v65 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "vacuumWithShouldContinueBlock calculated pages to vacuum: %lu", buf, 0xCu);
  }
  v62 = v7;

  v14 = 0;
  if (v11)
  {
    while (1)
    {
      if (v11 - v14 >= 0x1F4)
        v15 = 500;
      else
        v15 = v11 - v14;
      v16 = __biome_log_for_category(11);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v65 = v15;
        v66 = 2048;
        v67 = v14;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "vacuumWithShouldContinueBlock starting incremental_vacuum of batch size: %lu, pagesVacuumed: %lu", buf, 0x16u);
      }

      fmdb = self->_fmdb;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PRAGMA incremental_vacuum(%lu)"), v15));
      LOBYTE(fmdb) = -[_bmFMDatabase executeStatements:](fmdb, "executeStatements:", v19);

      if ((fmdb & 1) == 0)
        break;
      v14 += v15;
      if (v4 && !v4[2](v4))
        goto LABEL_22;
      if (v14 >= v11)
        goto LABEL_19;
    }
    v53 = __biome_log_for_category(11);
    v54 = objc_claimAutoreleasedReturnValue(v53);
    v7 = v62;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      sub_100044C50(v54, v55, v56, v57, v58, v59, v60, v61);

    v22 = v14 != 0;
  }
  else
  {
LABEL_19:
    v20 = __biome_log_for_category(11);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "vacuumWithShouldContinueBlock successfully completed", buf, 2u);
    }

LABEL_22:
    v22 = v14 != 0;
    v7 = v62;
  }
LABEL_27:

  return v22;
}

- (unint64_t)databaseSizeInKilobytes
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase databasePath](self->_fmdb, "databasePath"));
  v4 = -[BMSyncDatabase _sizeOfFileInKilobytes:](self, "_sizeOfFileInKilobytes:", v3);

  return v4;
}

- (unint64_t)walSizeInKilobytes
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase databasePath](self->_fmdb, "databasePath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("-wal")));
  v5 = -[BMSyncDatabase _sizeOfFileInKilobytes:](self, "_sizeOfFileInKilobytes:", v4);

  return v5;
}

- (unint64_t)_sizeOfFileInKilobytes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  unint64_t v11;
  objc_class *v13;
  NSString *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v16 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributesOfItemAtPath:error:", v4, &v16));
  v7 = v16;

  if (v6)
  {
    if (!v7)
    {
      v11 = (unint64_t)objc_msgSend(v6, "fileSize") >> 10;
      goto LABEL_8;
    }
    v8 = __biome_log_for_category(11);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class(self, v10);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138412802;
      v18 = v15;
      v19 = 2112;
      v20 = v4;
      v21 = 2112;
      v22 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ sizeOfFileInKilobytes error fetching attributes for filepath: %@, err: %@", buf, 0x20u);

    }
  }
  v11 = 0;
LABEL_8:

  return v11;
}

- (unint64_t)numRowsInTable:(id)a3
{
  id v4;
  _bmFMDatabase *fmdb;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  _bmFMDatabase *v10;
  id v11;
  void *v12;
  unsigned int v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  objc_class *v23;
  NSString *v24;
  void *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  id v37;

  v4 = a3;
  fmdb = self->_fmdb;
  v37 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:withArgumentsInArray:](fmdb, "executeQuery:withArgumentsInArray:", CFSTR("SELECT name FROM sqlite_schema WHERE type='table' AND name=?"), v6));

  v30 = 0;
  v8 = objc_msgSend(v7, "nextWithError:", &v30);
  v9 = v30;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v7, "close");
    v10 = self->_fmdb;
    v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("SELECT COUNT(*) FROM %@"), v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](v10, "executeQuery:", v11));

    v29 = v9;
    v13 = objc_msgSend(v12, "nextWithError:", &v29);
    v14 = v29;

    if (v13)
    {
      v15 = objc_msgSend(v12, "unsignedLongLongIntForColumnIndex:", 0);
    }
    else
    {
      v19 = __biome_log_for_category(11);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v26 = (objc_class *)objc_opt_class(self, v21);
        v27 = NSStringFromClass(v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        *(_DWORD *)buf = 138412802;
        v32 = v28;
        v33 = 2112;
        v34 = v4;
        v35 = 2112;
        v36 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@ numRowsInTable error querying pgsize for table: %@, err: %@", buf, 0x20u);

      }
      v15 = 0;
    }
    objc_msgSend(v12, "close");

    v9 = v14;
  }
  else
  {
    v16 = __biome_log_for_category(11);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v23 = (objc_class *)objc_opt_class(self, v18);
      v24 = NSStringFromClass(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 138412802;
      v32 = v25;
      v33 = 2112;
      v34 = v4;
      v35 = 2112;
      v36 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@ numRowsInTable table name: %@ does not exist, err: %@", buf, 0x20u);

    }
    objc_msgSend(v7, "close");
    v15 = 0;
  }

  return (unint64_t)v15;
}

- (unint64_t)sizeOfTableInKilobytes:(id)a3
{
  id v4;
  _bmFMDatabase *fmdb;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  objc_class *v15;
  NSString *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  id v25;

  v4 = a3;
  fmdb = self->_fmdb;
  v25 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:withArgumentsInArray:](fmdb, "executeQuery:withArgumentsInArray:", CFSTR("SELECT SUM(pgsize) FROM dbstat WHERE name = ?"), v6));

  v18 = 0;
  v8 = objc_msgSend(v7, "nextWithError:", &v18);
  v9 = v18;
  if (v8)
  {
    v10 = (unint64_t)objc_msgSend(v7, "unsignedLongLongIntForColumnIndex:", 0) >> 10;
  }
  else
  {
    v11 = __biome_log_for_category(11);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class(self, v13);
      v16 = NSStringFromClass(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      *(_DWORD *)buf = 138412802;
      v20 = v17;
      v21 = 2112;
      v22 = v4;
      v23 = 2112;
      v24 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ sizeOfTable error querying pgsize for table: %@, err: %@", buf, 0x20u);

    }
    v10 = 0;
  }
  objc_msgSend(v7, "close");

  return v10;
}

@end
