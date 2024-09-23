@implementation _PushToPhoneHandlingTask

- (_PushToPhoneHandlingTask)initWithData:(id)a3 recordIdentifier:(id)a4
{
  id v6;
  id v7;
  SyncedBookmarkRepr *v8;
  _PushToPhoneHandlingTask *v9;
  _PushToPhoneHandlingTask *v10;
  _PushToPhoneHandlingTask *v11;
  id v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = -[SyncedBookmarkRepr initWithData:]([SyncedBookmarkRepr alloc], "initWithData:", v6);
  if (v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)_PushToPhoneHandlingTask;
    v9 = -[NotificationHandlingTask initWithData:recordIdentifier:](&v15, "initWithData:recordIdentifier:", v6, v7);
    v10 = v9;
    if (v9)
      objc_storeStrong((id *)&v9->_bookmark, v8);
    self = v10;
    v11 = self;
  }
  else
  {
    v12 = sub_100431A4C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "_PushToPhoneHandlingTask SyncedBookmarkRepr nil with data", buf, 2u);
    }

    v11 = 0;
  }

  return v11;
}

- (void)performTask
{
  uint64_t v3;
  id v4;

  -[RichMapsActivityCreatingTaskImpl taskStarted](self, "taskStarted");
  -[NotificationHandlingTask _clearBulletin](self, "_clearBulletin");
  v3 = objc_claimAutoreleasedReturnValue(-[SyncedBookmarkRepr richMapsActivity](self->_bookmark, "richMapsActivity"));
  v4 = (id)v3;
  if (v3)
    -[RichMapsActivityCreatingTaskImpl taskFinished:](self, "taskFinished:", v3);
  else
    -[RichMapsActivityCreatingTaskImpl taskFailed](self, "taskFailed");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmark, 0);
}

@end
