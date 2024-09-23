@implementation WifiScannerSettings

- (id)description
{
  void *v3;
  id v4;
  const char *v5;
  const char *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray componentsJoinedByString:](self->_channels, "componentsJoinedByString:", CFSTR(",")));
  v4 = objc_alloc((Class)NSString);
  v5 = "true";
  if (self->_includeOffChannelResults)
    v6 = "true";
  else
    v6 = "false";
  if (!self->_lowPriorityScan)
    v5 = "false";
  v7 = objc_msgSend(v4, "initWithFormat:", CFSTR("{channels:[%@], dwell:\"%lld ms\", scanType: %d, offchannel: %s, dutyCycle: %f, lowPriority: %s}"), v3, self->_dwell.__rep_, self->_scanType, v6, self->_dutyCycle, v5);

  return v7;
}

- (duration<long)dwell
{
  return self->_dwell;
}

- (float)dutyCycle
{
  return self->_dutyCycle;
}

- (void)updateFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *channels;
  float v9;
  NSObject *v10;
  uint8_t v11[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "channels"));
    v7 = (NSArray *)objc_msgSend(v6, "copy");
    channels = self->_channels;
    self->_channels = v7;

    self->_dwell.__rep_ = (int64_t)objc_msgSend(v5, "dwell");
    self->_scanType = objc_msgSend(v5, "scanType");
    self->_includeOffChannelResults = objc_msgSend(v5, "includeOffChannelResults");
    objc_msgSend(v5, "dutyCycle");
    self->_dutyCycle = v9;
    self->_lowPriorityScan = objc_msgSend(v5, "lowPriorityScan");
LABEL_3:

    return;
  }
  if (qword_100417ED8 == -1)
  {
    v10 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      goto LABEL_3;
  }
  else
  {
    dispatch_once(&qword_100417ED8, &stru_100404130);
    v10 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      goto LABEL_3;
  }
  *(_WORD *)v11 = 0;
  _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Invalid settings to update from - cannot be nil", v11, 2u);

}

- (int)scanType
{
  return self->_scanType;
}

- (BOOL)includeOffChannelResults
{
  return self->_includeOffChannelResults;
}

- (BOOL)lowPriorityScan
{
  return self->_lowPriorityScan;
}

- (NSArray)channels
{
  return self->_channels;
}

- (WifiScannerSettings)initWithChannels:(id)a3 dwell:(duration<long)long scanType:()std:(1000>>)a4 :(int)a5 ratio<1 includingOffChannelResults:(BOOL)a6 atDutyCycle:(float)a7 asLowPriority:(BOOL)a8
{
  id v14;
  WifiScannerSettings *v15;
  NSArray *v16;
  NSArray *channels;
  WifiScannerSettings *v18;
  objc_super v20;

  v14 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WifiScannerSettings;
  v15 = -[WifiScannerSettings init](&v20, "init");
  if (v15)
  {
    v16 = (NSArray *)objc_msgSend(v14, "copy");
    channels = v15->_channels;
    v15->_channels = v16;

    v15->_dwell = a4;
    v15->_scanType = a5;
    v15->_includeOffChannelResults = a6;
    v15->_dutyCycle = a7;
    v15->_lowPriorityScan = a8;
    v18 = v15;
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WifiScannerSettings *v4;
  double v5;

  v4 = +[WifiScannerSettings allocWithZone:](WifiScannerSettings, "allocWithZone:", a3);
  *(float *)&v5 = self->_dutyCycle;
  return -[WifiScannerSettings initWithChannels:dwell:scanType:includingOffChannelResults:atDutyCycle:asLowPriority:](v4, "initWithChannels:dwell:scanType:includingOffChannelResults:atDutyCycle:asLowPriority:", self->_channels, self->_dwell.__rep_, self->_scanType, self->_includeOffChannelResults, self->_lowPriorityScan, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channels, 0);
}

- (WifiScannerSettings)init
{
  double v2;

  LODWORD(v2) = 0.5;
  return -[WifiScannerSettings initWithChannels:dwell:scanType:includingOffChannelResults:atDutyCycle:asLowPriority:](self, "initWithChannels:dwell:scanType:includingOffChannelResults:atDutyCycle:asLowPriority:", &off_10040B1A8, 110, 2, 0, 0, v2);
}

- (duration<long)estimatedScanTime
{
  return (duration<long long, std::ratio<1, 1000>>)(self->_dwell.__rep_ * -[NSArray count](self->_channels, "count"));
}

- (double)dwellTimeInterval
{
  return (double)self->_dwell.__rep_ / 1000.0;
}

- (void)setDwellTimeInterval:(double)a3
{
  self->_dwell.__rep_ = (uint64_t)(a3 * 1000.0);
}

- (void)setChannels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setDwell:(duration<long)long
{
  self->_dwell = a3;
}

- (void)setScanType:(int)a3
{
  self->_scanType = a3;
}

- (void)setIncludeOffChannelResults:(BOOL)a3
{
  self->_includeOffChannelResults = a3;
}

- (void)setDutyCycle:(float)a3
{
  self->_dutyCycle = a3;
}

- (void)setLowPriorityScan:(BOOL)a3
{
  self->_lowPriorityScan = a3;
}

@end
