@implementation CSAPEventsBuffer

- (CSAPEventsBuffer)init
{
  CSAPEventsBuffer *v2;
  uint64_t v3;
  CSTimestampedSample *pending;
  uint64_t v5;
  CSTimestampedSample *processed;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSAPEventsBuffer;
  v2 = -[CSAPEventsBuffer init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    pending = v2->_pending;
    v2->_pending = (CSTimestampedSample *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    processed = v2->_processed;
    v2->_processed = (CSTimestampedSample *)v5;

  }
  return v2;
}

- (void)addObject:(id)a3
{
  id v4;

  v4 = a3;
  -[CSTimestampedSample addObject:](self->_pending, "addObject:");
  -[CSAPEventsBuffer limitPending](self, "limitPending");

}

- (id)readSamples
{
  unint64_t v3;
  void *v4;
  void *v5;
  unint64_t i;
  id v7;
  CSTimestampedSample *pending;
  void *v9;
  void *v10;
  unint64_t j;
  id v12;
  CSTimestampedSample *processed;
  void *v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  id v19;
  _DWORD v21[2];
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  unsigned int v29;

  v3 = +[CSTimeManager SPU_estimate_current_timestamp](CSTimeManager, "SPU_estimate_current_timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  for (i = 0; ; ++i)
  {
    v7 = -[CSTimestampedSample count](self->_pending, "count");
    pending = self->_pending;
    if (i >= (unint64_t)v7)
      break;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSTimestampedSample objectAtIndex:](pending, "objectAtIndex:", i));
    objc_msgSend(v5, "addIndex:", i);
    if (v3 - (unint64_t)objc_msgSend(v9, "timestamp") <= 0x1C9C380)
    {
      objc_msgSend(v4, "addObject:", v9);
      -[CSTimestampedSample addObject:](self->_processed, "addObject:", v9);
    }

  }
  -[CSTimestampedSample removeObjectsAtIndexes:](pending, "removeObjectsAtIndexes:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  for (j = 0; ; ++j)
  {
    v12 = -[CSTimestampedSample count](self->_processed, "count");
    processed = self->_processed;
    if (j >= (unint64_t)v12)
      break;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSTimestampedSample objectAtIndex:](processed, "objectAtIndex:", j));
    if (v3 - (unint64_t)objc_msgSend(v14, "timestamp") > 0x1C9C380)
      objc_msgSend(v10, "addIndex:", j);

  }
  -[CSTimestampedSample removeObjectsAtIndexes:](processed, "removeObjectsAtIndexes:", v10);
  if (qword_100387320 != -1)
    dispatch_once(&qword_100387320, &stru_10034E018);
  v15 = (id)qword_100387328;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = objc_msgSend(v4, "count");
    v17 = -[CSTimestampedSample count](self->_pending, "count");
    v18 = -[CSTimestampedSample count](self->_processed, "count");
    v21[0] = 67110144;
    v21[1] = v16;
    v22 = 1024;
    v23 = v17;
    v24 = 1024;
    v25 = v18;
    v26 = 1024;
    v27 = objc_msgSend(v5, "count");
    v28 = 1024;
    v29 = objc_msgSend(v10, "count");
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Read %d AP samples = [%d %d] - [%d %d]", (uint8_t *)v21, 0x20u);
  }

  v19 = objc_msgSend(v4, "copy");
  return v19;
}

- (void)reset
{
  NSObject *v3;
  unsigned int v4;
  _DWORD v5[2];

  -[CSTimestampedSample addObjectsFromArray:](self->_pending, "addObjectsFromArray:", self->_processed);
  -[CSTimestampedSample removeAllObjects](self->_processed, "removeAllObjects");
  -[CSAPEventsBuffer limitPending](self, "limitPending");
  if (qword_100387320 != -1)
    dispatch_once(&qword_100387320, &stru_10034E018);
  v3 = (id)qword_100387328;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = -[CSTimestampedSample count](self->_pending, "count");
    v5[0] = 67109120;
    v5[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AP events reset - pending: %d", (uint8_t *)v5, 8u);
  }

}

- (void)limitPending
{
  if ((unint64_t)-[CSTimestampedSample count](self->_pending, "count") >= 0x65)
    -[CSTimestampedSample removeObjectsInRange:](self->_pending, "removeObjectsInRange:", 0, (char *)-[CSTimestampedSample count](self->_pending, "count") - 100);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processed, 0);
  objc_storeStrong((id *)&self->_pending, 0);
}

@end
