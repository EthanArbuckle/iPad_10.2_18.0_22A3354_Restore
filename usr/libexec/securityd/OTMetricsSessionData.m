@implementation OTMetricsSessionData

- (OTMetricsSessionData)initWithFlowID:(id)a3 deviceSessionID:(id)a4
{
  id v7;
  id v8;
  OTMetricsSessionData *v9;
  OTMetricsSessionData *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OTMetricsSessionData;
  v9 = -[OTMetricsSessionData init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flowID, a3);
    objc_storeStrong((id *)&v10->_deviceSessionID, a4);
  }

  return v10;
}

- (NSString)flowID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)deviceSessionID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSessionID, 0);
  objc_storeStrong((id *)&self->_flowID, 0);
}

@end
