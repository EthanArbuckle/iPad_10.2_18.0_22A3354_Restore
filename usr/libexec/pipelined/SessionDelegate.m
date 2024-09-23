@implementation SessionDelegate

- (SessionDelegate)initWithUploadDb:(void *)a3
{
  SessionDelegate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SessionDelegate;
  result = -[SessionDelegate init](&v5, "init");
  if (result)
    result->_uploadDb = a3;
  return result;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  NSLog(CFSTR("Session became invalid with error %@"), a2, a3, a4);
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v11;
  id v12;
  void *uploadDb;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  void *v20;
  int64_t v21;
  int64_t v22;

  v11 = a3;
  v12 = a4;
  uploadDb = self->_uploadDb;
  v14 = *((_QWORD *)uploadDb + 96);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F9980;
  block[3] = &unk_100405208;
  v18 = v11;
  v19 = v12;
  v20 = uploadDb;
  v21 = a6;
  v22 = a7;
  v15 = v12;
  v16 = v11;
  dispatch_async(v14, block);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  sub_1002F8790((uint64_t)self->_uploadDb, a3, a4, a5);
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession
{
  NSObject *v2;
  uint8_t v3[16];

  NSLog(CFSTR("Received notification that it finished events for background URL session"), a2);
  if (qword_100417ED8 == -1)
  {
    v2 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      return;
  }
  else
  {
    dispatch_once(&qword_100417ED8, &stru_1004052F0);
    v2 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      return;
  }
  *(_WORD *)v3 = 0;
  _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Finish background event invoked", v3, 2u);
}

@end
