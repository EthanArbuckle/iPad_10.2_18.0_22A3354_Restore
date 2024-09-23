@implementation CLTileSyncSyChange

- (void)setObjectIdentifier:(id)a3
{
  -[CLTileSyncSyChange setSyncKey:](self, "setSyncKey:", a3);
}

- (NSString)sequencer
{
  return 0;
}

- (int64_t)changeType
{
  return 1;
}

- (void)setChangeType:(int64_t)a3
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  int v7;
  int64_t v8;
  uint8_t buf[4];
  int64_t v10;

  if (a3 != 1)
  {
    if (qword_1022A0050 != -1)
      dispatch_once(&qword_1022A0050, &stru_10213D730);
    v4 = qword_1022A0058;
    if (os_log_type_enabled((os_log_t)qword_1022A0058, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "@GtsSync, Unexpected change type, %{public}ld, set, #CloneMe", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0050 != -1)
        dispatch_once(&qword_1022A0050, &stru_10213D730);
      v7 = 134349056;
      v8 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0058, 0, "@GtsSync, Unexpected change type, %{public}ld, set, #CloneMe", &v7, 12);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "-[CLTileSyncSyChange setChangeType:]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLTileSyncSyChange;
  -[CLTileSyncSyChange dealloc](&v3, "dealloc");
}

- (NSString)syncKey
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSyncKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)properties
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

@end
