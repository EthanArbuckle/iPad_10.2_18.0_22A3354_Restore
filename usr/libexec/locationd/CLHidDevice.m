@implementation CLHidDevice

- (CLHidDevice)initWithHidDevice:(id)a3 matchingDict:(id)a4
{
  CLHidDevice *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLHidDevice;
  result = -[CLHidDevice init](&v7, "init");
  if (result)
  {
    result->_matching = (NSDictionary *)a4;
    result->_hidDevice = (HIDDevice *)a3;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLHidDevice;
  -[CLHidDevice dealloc](&v3, "dealloc");
}

- (BOOL)setReport:(int64_t)a3 payload:(char *)a4 length:(int64_t)a5
{
  unsigned __int8 v6;
  NSObject *v7;
  const char *v9;
  uint8_t *v10;
  _QWORD v11[5];
  uint64_t v12;
  int v13;
  int64_t v14;
  __int16 v15;
  uint64_t v16;
  uint8_t buf[4];
  int64_t v18;
  __int16 v19;
  uint64_t v20;

  v12 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100A95F30;
  v11[3] = &unk_102166D08;
  v11[4] = a3;
  v6 = -[HIDDevice setReport:reportLength:withIdentifier:forType:error:timeout:callback:](-[CLHidDevice hidDevice](self, "hidDevice"), "setReport:reportLength:withIdentifier:forType:error:timeout:callback:", a4, a5, a3, 2, &v12, 0, v11);
  if ((v6 & 1) == 0)
  {
    if (qword_10229FC70 != -1)
      dispatch_once(&qword_10229FC70, &stru_102166DA0);
    v7 = qword_10229FC78;
    if (os_log_type_enabled((os_log_t)qword_10229FC78, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v18 = a3;
      v19 = 2112;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CLHidManager] setReport: id=0x%lx, failed=%@", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FC70 != -1)
        dispatch_once(&qword_10229FC70, &stru_102166DA0);
      v13 = 134218242;
      v14 = a3;
      v15 = 2112;
      v16 = v12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC78, 16, "[CLHidManager] setReport: id=0x%lx, failed=%@", &v13, 22);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 0, "-[CLHidDevice setReport:payload:length:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
  }
  return v6;
}

- (NSDictionary)matching
{
  return self->_matching;
}

- (void)setMatching:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (HIDDevice)hidDevice
{
  return self->_hidDevice;
}

- (void)setHidDevice:(id)a3
{
  self->_hidDevice = (HIDDevice *)a3;
}

@end
