@implementation HTFixedSizeQueue

- (HTFixedSizeQueue)initWithSize:(unint64_t)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  dispatch_source_t v8;
  void *v9;
  NSDateFormatter *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HTFixedSizeQueue;
  v4 = -[HTFixedSizeQueue init](&v13, "init");
  if (v4)
  {
    v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = (void *)*((_QWORD *)v4 + 1);
    *((_QWORD *)v4 + 1) = v5;

    v7 = (void *)*((_QWORD *)v4 + 3);
    *((_QWORD *)v4 + 2) = a3;
    *((_QWORD *)v4 + 3) = 0;

    v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    v9 = (void *)*((_QWORD *)v4 + 4);
    *((_QWORD *)v4 + 4) = v8;

    dispatch_source_set_event_handler_f(*((dispatch_source_t *)v4 + 4), (dispatch_function_t)sub_100005CDC);
    dispatch_activate(*((dispatch_object_t *)v4 + 4));
    v10 = objc_opt_new(NSDateFormatter);
    v11 = (void *)*((_QWORD *)v4 + 5);
    *((_QWORD *)v4 + 5) = v10;

    objc_msgSend(*((id *)v4 + 5), "setDateFormat:", CFSTR("yyyy-MM-dd-HH:mm:ss.SSS"));
  }
  return (HTFixedSizeQueue *)v4;
}

- (void)insert:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    if ((unint64_t)-[NSMutableArray count](self->array, "count") >= self->_maxSize)
      -[NSMutableArray removeObjectAtIndex:](self->array, "removeObjectAtIndex:", 0);
    -[NSMutableArray addObject:](self->array, "addObject:", v5);
    v4 = v5;
  }

}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->array, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->array, "objectAtIndex:", a3);
}

- (void)removeObjectsAtIndexes:(id)a3
{
  -[NSMutableArray removeObjectsAtIndexes:](self->array, "removeObjectsAtIndexes:", a3);
}

- (id)getDescription:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->array, "objectAtIndex:", a3));
  v9[0] = CFSTR("processName");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "processName"));
  v10[0] = v4;
  v9[1] = CFSTR("processID");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v3, "pid")));
  v10[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));

  return v7;
}

- (unint64_t)maxSize
{
  return self->_maxSize;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDateFormatter)dateFormatter
{
  return (NSDateFormatter *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->array, 0);
}

@end
