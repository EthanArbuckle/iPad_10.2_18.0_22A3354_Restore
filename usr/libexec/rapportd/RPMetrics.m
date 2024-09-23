@implementation RPMetrics

+ (id)sharedMetrics
{
  if (qword_100132180 != -1)
    dispatch_once(&qword_100132180, &stru_1001136E8);
  return (id)qword_100132178;
}

+ (id)sharedMetricsNoCreate
{
  return (id)qword_100132178;
}

- (RPMetrics)init
{
  RPMetrics *v2;
  RPMetrics *v3;
  RPMetrics *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPMetrics;
  v2 = -[RPMetrics init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  return 0;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F460;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if (dword_1001310E0 <= 30 && (dword_1001310E0 != -1 || _LogCategory_Initialize(&dword_1001310E0, 30)))
    LogPrintF(&dword_1001310E0, "-[RPMetrics _activate]", 30, "Activate\n");
}

- (void)invalidate
{
  dispatch_async((dispatch_queue_t)self->_dispatchQueue, &stru_100113708);
}

- (void)logReceivedMessageType:(int)a3 identifier:(id)a4 options:(id)a5 appID:(id)a6 ctx:(id *)a7
{
  id v12;
  id v13;
  id v14;
  unint64_t var1;
  unint64_t v16;
  unint64_t v17;
  CFAbsoluteTime Current;
  double var0;
  NSObject *dispatchQueue;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  double v25;
  CFAbsoluteTime v26;
  unint64_t v27;
  unint64_t v28;
  int v29;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  var1 = a7->var1;
  v16 = CFDictionaryGetInt64(v13, CFSTR("length"), 0) + var1;
  a7->var1 = v16;
  v17 = a7->var2 + 1;
  a7->var2 = v17;
  Current = CFAbsoluteTimeGetCurrent();
  var0 = a7->var0;
  if (Current - a7->var0 >= 60.0)
  {
    a7->var0 = Current;
    a7->var1 = 0;
    a7->var2 = 0;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006F690;
    block[3] = &unk_100113730;
    block[4] = self;
    v29 = a3;
    v22 = v12;
    v23 = v13;
    v24 = v14;
    v25 = var0;
    v26 = Current;
    v27 = v16;
    v28 = v17;
    dispatch_async(dispatchQueue, block);

  }
}

- (void)_logReceivedMessageType:(int)a3 identifier:(id)a4 options:(id)a5 appID:(id)a6 timeBegin:(double)a7 timeEnd:(double)a8 bytesAdded:(unint64_t)a9 messagesAdded:(unint64_t)a10
{
  uint64_t v15;
  double v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t NSNumber;
  void *v22;
  void *v23;
  CFTypeID TypeID;
  uint64_t TypedValue;
  id v26;
  id v27;
  void *v28;
  id v29;

  v15 = *(_QWORD *)&a3;
  if (a7 == 0.0)
    v16 = a8;
  else
    v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v29 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v17, CFSTR("appID"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a9));
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v20, CFSTR("bytes"));

  objc_msgSend(v29, "setObject:forKeyedSubscript:", v19, CFSTR("identifier"));
  NSNumber = NSDictionaryGetNSNumber(v18, CFSTR("dlt"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v22, CFSTR("linkType"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a10));
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v23, CFSTR("messages"));

  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v18, CFSTR("senderIDS"), TypeID, 0);

  objc_msgSend(v29, "setObject:forKeyedSubscript:", TypedValue, CFSTR("senderID"));
  v26 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", v16);
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v26, CFSTR("timeBegin"));

  v27 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", a8);
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v27, CFSTR("timeEnd"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v15));
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, CFSTR("type"));

  if (qword_100132188 != -1)
    dispatch_once(&qword_100132188, &stru_100113750);
  if (qword_100132190 && dlsym((void *)qword_100132190, "PLLogRegisteredEvent"))
  {
    if (dword_1001310E0 <= 10
      && (dword_1001310E0 != -1 || _LogCategory_Initialize(&dword_1001310E0, 10)))
    {
      LogPrintF(&dword_1001310E0, "-[RPMetrics _logReceivedMessageType:identifier:options:appID:timeBegin:timeEnd:bytesAdded:messagesAdded:]", 10, "PowerLog: %@, %##@\n", CFSTR("com.apple.rapport.receivedEvent"), v29);
    }
    off_100131150(91, (uint64_t)CFSTR("com.apple.rapport.receivedEvent"), (uint64_t)v29, 0);
  }

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
