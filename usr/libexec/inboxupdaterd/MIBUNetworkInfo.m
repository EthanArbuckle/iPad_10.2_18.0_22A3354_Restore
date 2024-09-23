@implementation MIBUNetworkInfo

- (MIBUNetworkInfo)init
{
  MIBUNetworkInfo *v2;
  MIBUNetworkInfo *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIBUNetworkInfo;
  v2 = -[MIBUNetworkInfo init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[MIBUNetworkInfo setNetworkName:](v2, "setNetworkName:", 0);
    -[MIBUNetworkInfo setBSSID:](v3, "setBSSID:", 0);
    -[MIBUNetworkInfo setRSSI:](v3, "setRSSI:", 0);
    -[MIBUNetworkInfo setNoise:](v3, "setNoise:", 0);
    -[MIBUNetworkInfo setChannel:](v3, "setChannel:", -1);
    -[MIBUNetworkInfo setChannelWidth:](v3, "setChannelWidth:", 0);
    -[MIBUNetworkInfo setChannelBand:](v3, "setChannelBand:", 0);
    -[MIBUNetworkInfo setPHYMode:](v3, "setPHYMode:", 0);
    -[MIBUNetworkInfo setNumberOfSpatialStreams:](v3, "setNumberOfSpatialStreams:", 0);
    -[MIBUNetworkInfo setMCSIndex:](v3, "setMCSIndex:", 0);
    -[MIBUNetworkInfo setIPV4Address:](v3, "setIPV4Address:", 0);
    -[MIBUNetworkInfo setIPV6Address:](v3, "setIPV6Address:", 0);
  }
  return v3;
}

+ (id)queryNetworkInfo
{
  MIBUNetworkInfo *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v2 = objc_alloc_init(MIBUNetworkInfo);
  v3 = objc_alloc_init((Class)CWFInterface);
  objc_msgSend(v3, "activate");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "networkName"));
  -[MIBUNetworkInfo setNetworkName:](v2, "setNetworkName:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "BSSID"));
  -[MIBUNetworkInfo setBSSID:](v2, "setBSSID:", v5);

  -[MIBUNetworkInfo setRSSI:](v2, "setRSSI:", objc_msgSend(v3, "RSSI"));
  -[MIBUNetworkInfo setNoise:](v2, "setNoise:", objc_msgSend(v3, "noise"));
  -[MIBUNetworkInfo setPHYMode:](v2, "setPHYMode:", objc_msgSend(v3, "PHYMode"));
  -[MIBUNetworkInfo setNumberOfSpatialStreams:](v2, "setNumberOfSpatialStreams:", objc_msgSend(v3, "numberOfSpatialStreams"));
  -[MIBUNetworkInfo setMCSIndex:](v2, "setMCSIndex:", objc_msgSend(v3, "MCSIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "MACAddress"));
  -[MIBUNetworkInfo setMACAddress:](v2, "setMACAddress:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "IPv4Addresses"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  -[MIBUNetworkInfo setIPV4Address:](v2, "setIPV4Address:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "IPv6Addresses"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  -[MIBUNetworkInfo setIPV6Address:](v2, "setIPV6Address:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "channel"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "channel"));
    -[MIBUNetworkInfo setChannel:](v2, "setChannel:", objc_msgSend(v12, "channel"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "channel"));
    -[MIBUNetworkInfo setChannelWidth:](v2, "setChannelWidth:", objc_msgSend(v13, "width"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "channel"));
    -[MIBUNetworkInfo setChannelBand:](v2, "setChannelBand:", objc_msgSend(v14, "band"));

  }
  objc_msgSend(v3, "invalidate");

  return v2;
}

- (id)description
{
  NSMutableString *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v3 = objc_opt_new(NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ : \n"), v6));
  -[NSMutableString appendString:](v3, "appendString:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfo networkName](self, "networkName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\tNetwork Name : %@\n"), v8));
  -[NSMutableString appendString:](v3, "appendString:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfo BSSID](self, "BSSID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\tBSSID : %@\n"), v10));
  -[NSMutableString appendString:](v3, "appendString:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MIBUNetworkInfo RSSI](self, "RSSI")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\tRSSI : %@\n"), v12));
  -[NSMutableString appendString:](v3, "appendString:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MIBUNetworkInfo noise](self, "noise")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\tNoise : %@\n"), v14));
  -[NSMutableString appendString:](v3, "appendString:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\tPHYMode : 0x%lX\n"), -[MIBUNetworkInfo PHYMode](self, "PHYMode")));
  -[NSMutableString appendString:](v3, "appendString:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MIBUNetworkInfo numberOfSpatialStreams](self, "numberOfSpatialStreams")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\t#SpatialStreams : %@\n"), v17));
  -[NSMutableString appendString:](v3, "appendString:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MIBUNetworkInfo MCSIndex](self, "MCSIndex")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\tMCSIndex : %@\n"), v19));
  -[NSMutableString appendString:](v3, "appendString:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MIBUNetworkInfo channel](self, "channel")));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\tChannel : %@\n"), v21));
  -[NSMutableString appendString:](v3, "appendString:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MIBUNetworkInfo channelWidth](self, "channelWidth")));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\tChannel Width: %@\n"), v23));
  -[NSMutableString appendString:](v3, "appendString:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MIBUNetworkInfo channelBand](self, "channelBand")));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\tChannel Band: %@\n"), v25));
  -[NSMutableString appendString:](v3, "appendString:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfo MACAddress](self, "MACAddress"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\tMACAddress : %@\n"), v27));
  -[NSMutableString appendString:](v3, "appendString:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfo iPV4Address](self, "iPV4Address"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\tIPv4 : %@\n"), v29));
  -[NSMutableString appendString:](v3, "appendString:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfo iPV6Address](self, "iPV6Address"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\tIPv6 : %@\n"), v31));
  -[NSMutableString appendString:](v3, "appendString:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(">")));
  -[NSMutableString appendString:](v3, "appendString:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v3));
  return v34;
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
  objc_storeStrong((id *)&self->_networkName, a3);
}

- (NSString)BSSID
{
  return self->_BSSID;
}

- (void)setBSSID:(id)a3
{
  objc_storeStrong((id *)&self->_BSSID, a3);
}

- (int64_t)RSSI
{
  return self->_RSSI;
}

- (void)setRSSI:(int64_t)a3
{
  self->_RSSI = a3;
}

- (int64_t)noise
{
  return self->_noise;
}

- (void)setNoise:(int64_t)a3
{
  self->_noise = a3;
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_channel = a3;
}

- (unint64_t)channelWidth
{
  return self->_channelWidth;
}

- (void)setChannelWidth:(unint64_t)a3
{
  self->_channelWidth = a3;
}

- (unint64_t)channelBand
{
  return self->_channelBand;
}

- (void)setChannelBand:(unint64_t)a3
{
  self->_channelBand = a3;
}

- (unint64_t)PHYMode
{
  return self->_PHYMode;
}

- (void)setPHYMode:(unint64_t)a3
{
  self->_PHYMode = a3;
}

- (unint64_t)numberOfSpatialStreams
{
  return self->_numberOfSpatialStreams;
}

- (void)setNumberOfSpatialStreams:(unint64_t)a3
{
  self->_numberOfSpatialStreams = a3;
}

- (unint64_t)MCSIndex
{
  return self->_MCSIndex;
}

- (void)setMCSIndex:(unint64_t)a3
{
  self->_MCSIndex = a3;
}

- (NSString)MACAddress
{
  return self->_MACAddress;
}

- (void)setMACAddress:(id)a3
{
  objc_storeStrong((id *)&self->_MACAddress, a3);
}

- (NSString)iPV4Address
{
  return self->_iPV4Address;
}

- (void)setIPV4Address:(id)a3
{
  objc_storeStrong((id *)&self->_iPV4Address, a3);
}

- (NSString)iPV6Address
{
  return self->_iPV6Address;
}

- (void)setIPV6Address:(id)a3
{
  objc_storeStrong((id *)&self->_iPV6Address, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iPV6Address, 0);
  objc_storeStrong((id *)&self->_iPV4Address, 0);
  objc_storeStrong((id *)&self->_MACAddress, 0);
  objc_storeStrong((id *)&self->_BSSID, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
}

@end
