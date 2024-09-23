@implementation WiFiPerfPerAssocNearbyNetwork

- (WiFiPerfPerAssocNearbyNetwork)initWithSSID:(id)a3 rssi:(id)a4 bssid:(id)a5 channel:(id)a6 channelFlags:(id)a7 andOrigin:(unint64_t)a8
{
  NSString *v14;
  NSNumber *v15;
  NSString *v16;
  NSNumber *v17;
  NSNumber *v18;
  WiFiPerfPerAssocNearbyNetwork *v19;
  NSString *SSID;
  NSString *v21;
  NSNumber *rssi;
  NSNumber *v23;
  NSString *bssid;
  NSString *v25;
  NSNumber *channel;
  NSNumber *v27;
  NSNumber *channelFlags;
  objc_super v30;

  v14 = (NSString *)a3;
  v15 = (NSNumber *)a4;
  v16 = (NSString *)a5;
  v17 = (NSNumber *)a6;
  v18 = (NSNumber *)a7;
  v30.receiver = self;
  v30.super_class = (Class)WiFiPerfPerAssocNearbyNetwork;
  v19 = -[WiFiPerfPerAssocNearbyNetwork init](&v30, "init");
  SSID = v19->_SSID;
  v19->_SSID = v14;
  v21 = v14;

  rssi = v19->_rssi;
  v19->_rssi = v15;
  v23 = v15;

  bssid = v19->_bssid;
  v19->_bssid = v16;
  v25 = v16;

  channel = v19->_channel;
  v19->_channel = v17;
  v27 = v17;

  channelFlags = v19->_channelFlags;
  v19->_channelFlags = v18;
  v19->_origin = a8;

  return v19;
}

- (WiFiPerfPerAssocNearbyNetwork)init
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("WiFiPerfPerAssocNearbyNetwork is useless without values - use the exposed initWith..."), 0));
  objc_exception_throw(v2);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork bssid](self, "bssid"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork rssi](self, "rssi"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork bssid](self, "bssid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork channel](self, "channel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork channelFlags](self, "channelFlags"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiPerfPerAssocNearbyNetwork origin](self, "origin")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v4, CFSTR("RSSI"), v5, CFSTR("BSSID"), v6, CFSTR("CHANNEL"), v7, CFSTR("CHANNEL_FLAGS"), v8, CFSTR("pppAPESSOrigin"), 0));

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  BOOL v12;

  v4 = a3;
  if (!v4)
    goto LABEL_6;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork bssid](self, "bssid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bssid"));
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (!v7)
    goto LABEL_6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork channel](self, "channel"));
  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "channel"));
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  if (v9 == v11)
    v12 = 1;
  else
LABEL_6:
    v12 = 0;

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork SSID](self, "SSID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork bssid](self, "bssid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork channel](self, "channel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork rssi](self, "rssi"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("WiFiPerfPerAssocNearbyNetwork with SSID: %@ bssid: %@ channel: %@ RSSI: %@ ORIGIN: %d"), v3, v4, v5, v6, -[WiFiPerfPerAssocNearbyNetwork origin](self, "origin")));

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork bssid](self, "bssid"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (NSString)bssid
{
  return self->_bssid;
}

- (NSNumber)channel
{
  return self->_channel;
}

- (NSNumber)channelFlags
{
  return self->_channelFlags;
}

- (unint64_t)origin
{
  return self->_origin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelFlags, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
}

@end
