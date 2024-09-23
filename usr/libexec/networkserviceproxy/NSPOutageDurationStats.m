@implementation NSPOutageDurationStats

- (id)eventName
{
  return CFSTR("com.apple.nsp.OutageDurationStats");
}

- (id)outageTypeToString
{
  unint64_t v2;

  v2 = -[NSPOutageDurationStats outageType](self, "outageType");
  if (v2 - 1 > 4)
    return CFSTR("Unknown");
  else
    return *(&off_1000F5F28 + v2 - 1);
}

- (id)analyticsDict
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  NSObject *v10;
  int v11;
  const char *v12;

  if (-[NSPOutageDurationStats outageType](self, "outageType"))
  {
    v5 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageDurationStats outageTypeToString](self, "outageTypeToString"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("OutageType"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPOutageDurationStats outageDurationSec](self, "outageDurationSec")));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("OutageDuration"));

    return v5;
  }
  else
  {
    v9 = nplog_obj(0, v3, v4);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11 = 136315138;
      v12 = "-[NSPOutageDurationStats analyticsDict]";
      _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "%s called with null self.outageType", (uint8_t *)&v11, 0xCu);
    }

    return 0;
  }
}

- (unint64_t)outageType
{
  return self->_outageType;
}

- (void)setOutageType:(unint64_t)a3
{
  self->_outageType = a3;
}

- (unint64_t)outageDurationSec
{
  return self->_outageDurationSec;
}

- (void)setOutageDurationSec:(unint64_t)a3
{
  self->_outageDurationSec = a3;
}

@end
