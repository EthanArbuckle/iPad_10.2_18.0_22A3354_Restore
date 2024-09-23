@implementation _DASSystemWorkloadRecorder

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100059F68;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB858 != -1)
    dispatch_once(&qword_1001AB858, block);
  return (id)qword_1001AB850;
}

- (_DASSystemWorkloadRecorder)init
{
  _DASSystemWorkloadRecorder *v2;
  uint64_t v3;
  OS_os_log *log;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_DASSystemWorkloadRecorder;
  v2 = -[_DASSystemWorkloadRecorder init](&v10, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("systemWorkloadRecorder")));
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.duetactivityscheduler.systemWorkloadRecorder", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

+ (unint64_t)bucketizedWorkload:(unint64_t)a3
{
  unint64_t result;

  result = 100000;
  if (a3 > 0x186A0)
    return 120000;
  if (a3 <= 0x13880)
  {
    result = 80000;
    if (a3 <= 0xFDE8)
    {
      if (a3 <= 0xC350)
      {
        if (a3 <= 0x9C40)
        {
          if (a3 <= 0x7530)
          {
            if (a3 <= 0x4E20)
            {
              if (a3 <= 0x2710)
              {
                if (a3 <= 0x1388)
                {
                  if (a3 <= 0x7D0)
                  {
                    if (a3 <= 0x1F4)
                    {
                      if (a3 <= 0x64)
                      {
                        if (a3)
                          return 100;
                        else
                          return 0;
                      }
                      else
                      {
                        return 500;
                      }
                    }
                    else
                    {
                      return 2000;
                    }
                  }
                  else
                  {
                    return 5000;
                  }
                }
                else
                {
                  return 10000;
                }
              }
              else
              {
                return 20000;
              }
            }
            else
            {
              return 30000;
            }
          }
          else
          {
            return 40000;
          }
        }
        else
        {
          return 50000;
        }
      }
      else
      {
        return 65000;
      }
    }
  }
  return result;
}

- (BOOL)recordWorkload:(unint64_t)a3 ofCategory:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary", a3, a4, a5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("WorkloadType"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[_DASSystemWorkloadRecorder bucketizedWorkload:](_DASSystemWorkloadRecorder, "bucketizedWorkload:", a3)));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("Size"));

  -[_DASSystemWorkloadRecorder sendToPPS:](self, "sendToPPS:", v8);
  return 1;
}

- (void)sendToPPS:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  objc_msgSend(v4, "sendDataToPPS:subsystem:category:", v3, CFSTR("BackgroundProcessing"), CFSTR("WorkloadInformation"));

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (PPSTelemetryIdentifier)ppsID
{
  return self->_ppsID;
}

- (void)setPpsID:(PPSTelemetryIdentifier *)a3
{
  self->_ppsID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
