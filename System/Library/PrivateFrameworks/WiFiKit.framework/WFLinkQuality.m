@implementation WFLinkQuality

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssid, 0);
}

- (NSString)ssid
{
  return self->_ssid;
}

- (WFLinkQuality)initWithSSID:(id)a3 rssi:(int64_t)a4 scaledRSSI:(float)a5
{
  id v9;
  WFLinkQuality *v10;
  WFLinkQuality *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFLinkQuality;
  v10 = -[WFLinkQuality init](&v13, sel_init);
  v11 = v10;
  if (v10 && (objc_storeStrong((id *)&v10->_ssid, a3), v11->_ssid))
  {
    v11->_rssi = a4;
    v11->_scaledRssi = a5;
  }
  else
  {

    v11 = 0;
  }

  return v11;
}

- (float)scaledRssi
{
  return self->_scaledRssi;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  id v7;
  int64_t v8;
  void *v9;

  -[WFLinkQuality ssid](self, "ssid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyWithZone:", a3);

  v7 = objc_alloc((Class)objc_opt_class());
  v8 = -[WFLinkQuality rssi](self, "rssi");
  -[WFLinkQuality scaledRssi](self, "scaledRssi");
  v9 = (void *)objc_msgSend(v7, "initWithSSID:rssi:scaledRSSI:", v6, v8);

  return v9;
}

- (WFLinkQuality)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("-[WFLinkQuality init] unavailable"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int64_t v7;
  float v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkQuality ssid](self, "ssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFLinkQuality rssi](self, "rssi");
  -[WFLinkQuality scaledRssi](self, "scaledRssi");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p SSID: %@ RSSI: %d ScaledRSSI: %f>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  float v8;
  float v9;
  float v10;
  float v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_7;
  -[WFLinkQuality ssid](self, "ssid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", v6)
    || (v7 = -[WFLinkQuality rssi](self, "rssi"), v7 != objc_msgSend(v4, "rssi")))
  {

    goto LABEL_7;
  }
  -[WFLinkQuality scaledRssi](self, "scaledRssi");
  v9 = v8;
  objc_msgSend(v4, "scaledRssi");
  v11 = v10;

  if (v9 != v11)
  {
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  v12 = 1;
LABEL_8:

  return v12;
}

- (void)setSsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (void)setScaledRssi:(float)a3
{
  self->_scaledRssi = a3;
}

@end
