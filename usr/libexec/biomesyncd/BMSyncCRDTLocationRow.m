@implementation BMSyncCRDTLocationRow

- (BMSyncCRDTLocationRow)initWithLocation:(id)a3 state:(unint64_t)a4
{
  return -[BMSyncCRDTLocationRow initWithLocation:state:primaryKey:](self, "initWithLocation:state:primaryKey:", a3, a4, 0);
}

- (BMSyncCRDTLocationRow)initWithLocation:(id)a3 state:(unint64_t)a4 primaryKey:(unint64_t)a5
{
  id v9;
  BMSyncCRDTLocationRow *v10;
  BMSyncCRDTLocationRow *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMSyncCRDTLocationRow;
  v10 = -[BMSyncCRDTLocationRow init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_location, a3);
    v11->_state = a4;
    v11->_primaryKey = a5;
  }

  return v11;
}

- (id)description
{
  id v3;
  uint64_t v4;

  v3 = objc_alloc((Class)NSString);
  return objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: location=%@, state=%lu>"), objc_opt_class(self, v4), self->_location, self->_state);
}

- (BOOL)isEqual:(id)a3
{
  BMSyncCRDTLocationRow *v4;
  BMSyncCRDTLocationRow *v5;
  BMStreamCRDTLocation *location;
  void *v7;
  id state;
  BOOL v9;

  v4 = (BMSyncCRDTLocationRow *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    location = self->_location;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncCRDTLocationRow location](v4, "location"));
    if (-[BMStreamCRDTLocation isEqual:](location, "isEqual:", v7))
    {
      state = (id)self->_state;
      v9 = state == (id)-[BMSyncCRDTLocationRow state](v5, "state");
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[BMStreamCRDTLocation hash](self->_location, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_state));
  v5 = (unint64_t)objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BMStreamCRDTLocation)location
{
  return self->_location;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)primaryKey
{
  return self->_primaryKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

- (BMSyncCRDTLocationRow)initWithFMResultSet:(id)a3 modifier:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  BMSyncCRDTLocationRow *v17;
  BMStreamCRDTLocation *v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  BMSyncCRDTLocationRow *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  BMSyncCRDTLocationRow *v28;

  v6 = a3;
  if (a4 >= 3)
  {
    v25 = __biome_log_for_category(11);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_10004146C(a4, v26);

    v17 = 0;
  }
  else
  {
    v7 = (uint64_t)*(&off_100068AC0 + a4);
    v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@%@"), v7, CFSTR("stream"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringForColumn:", v8));

    v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@%@"), v7, CFSTR("site"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringForColumn:", v10));

    v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@%@"), v7, CFSTR("day"));
    objc_msgSend(v6, "doubleForColumn:", v12);
    v14 = v13;

    v15 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", v14);
    v16 = v15;
    if (a4 == 1 || (v17 = 0, v9) && v11 && v15)
    {
      v18 = -[BMStreamCRDTLocation initWithStreamName:siteIdentifier:day:]([BMStreamCRDTLocation alloc], "initWithStreamName:siteIdentifier:day:", v9, v11, v15);
      if (v18)
      {
        v28 = self;
        v19 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@%@"), v7, CFSTR("state"));
        v20 = (int)objc_msgSend(v6, "intForColumn:", v19);

        v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@%@"), v7, CFSTR("id"));
        v22 = (int)objc_msgSend(v6, "intForColumn:", v21);

        v23 = [BMSyncCRDTLocationRow alloc];
        v24 = v22;
        self = v28;
        v17 = -[BMSyncCRDTLocationRow initWithLocation:state:primaryKey:](v23, "initWithLocation:state:primaryKey:", v18, v20, v24);
      }
      else
      {
        v17 = 0;
      }

    }
  }

  return v17;
}

@end
