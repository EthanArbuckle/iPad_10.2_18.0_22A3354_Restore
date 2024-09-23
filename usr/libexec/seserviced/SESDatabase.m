@implementation SESDatabase

- (void)handleMFDNotification:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = SESDefaultLogObject(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Received MFD notification", buf, 2u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000164F4;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_storagePath, 0);
}

@end
