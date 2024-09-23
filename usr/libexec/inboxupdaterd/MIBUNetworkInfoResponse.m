@implementation MIBUNetworkInfoResponse

- (MIBUNetworkInfoResponse)init
{
  MIBUNetworkInfoResponse *v2;
  MIBUNetworkInfoResponse *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIBUNetworkInfoResponse;
  v2 = -[MIBUNFCResponse init](&v5, "init");
  v3 = v2;
  if (v2)
    -[MIBUNetworkInfoResponse setNetworkInfo:](v2, "setNetworkInfo:", 0);
  return v3;
}

- (id)serialize
{
  MIBUSerializer *v3;
  void *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSString *v13;
  uint64_t v14;
  NSString *v15;
  void *v16;
  MIBUSerializer *v17;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  void *v21;
  void *v22;
  NSString *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSString *v37;
  NSString *v38;
  NSString *v39;
  void *v40;
  unsigned __int8 v41;
  NSString *v42;
  void *v43;
  void *v44;
  NSString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSString *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[13];

  v3 = objc_opt_new(MIBUSerializer);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));

  if (v4)
  {
    if (!-[MIBUNFCResponse rejected](self, "rejected"))
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "networkName"));
      if (v64)
      {
        v63 = (NSString *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
        v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString networkName](v63, "networkName"));
      }
      else
      {
        v5 = objc_opt_new(NSString);
        v63 = v5;
      }
      v39 = v5;
      v67[0] = v5;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
      v7 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "RSSI")));
      v67[1] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
      v9 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v8, "noise")));
      v67[2] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
      v11 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v10, "channel")));
      v67[3] = v11;
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v56, "channelWidth")));
      v67[4] = v55;
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v54, "channelBand")));
      v67[5] = v53;
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v52, "PHYMode")));
      v67[6] = v51;
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v50, "numberOfSpatialStreams")));
      v67[7] = v49;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "MCSIndex")));
      v67[8] = v47;
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "MACAddress"));
      if (v66)
      {
        v45 = (NSString *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
        v13 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString MACAddress](v45, "MACAddress"));
      }
      else
      {
        v13 = objc_opt_new(NSString);
        v45 = v13;
      }
      v38 = v13;
      v67[9] = v13;
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "iPV4Address"));
      v57 = (void *)v11;
      v58 = v10;
      if (v14)
      {
        v42 = (NSString *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
        v15 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString iPV4Address](v42, "iPV4Address"));
      }
      else
      {
        v15 = objc_opt_new(NSString);
        v42 = v15;
      }
      v43 = (void *)v14;
      v37 = v15;
      v67[10] = v15;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "iPV6Address"));
      v61 = (void *)v7;
      v62 = v6;
      v59 = (void *)v9;
      v60 = v8;
      v17 = v3;
      if (v16)
      {
        v18 = (NSString *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
        v19 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString iPV6Address](v18, "iPV6Address"));
      }
      else
      {
        v19 = objc_opt_new(NSString);
        v18 = v19;
      }
      v20 = v19;
      v67[11] = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "BSSID"));
      v48 = v12;
      if (v22)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
        v23 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "BSSID"));
      }
      else
      {
        v23 = objc_opt_new(NSString);
      }
      v67[12] = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v67, 13));
      v41 = -[MIBUSerializer serialize:withValue:](v17, "serialize:withValue:", &off_10005CFB0, v24);

      if (v22)
      {

        v23 = (NSString *)v6;
      }

      if (v16)
      v3 = v17;
      if (v43)

      if (v66)
      if (v64)

      if ((v41 & 1) != 0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCResponse error](self, "error"));
        v26 = -[MIBUSerializer serializeResponseError:](v17, "serializeResponseError:", v25);

        if ((v26 & 1) != 0)
        {
          v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSerializer serializedData](v17, "serializedData"));
          goto LABEL_31;
        }
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100055580);
        v36 = (void *)qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
          sub_10003AD5C(v36, self);
      }
      else
      {
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100055560);
        v28 = qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
          sub_10003AE00(v28, v29, v30, v31, v32, v33, v34, v35);
      }
    }
    v4 = 0;
  }
LABEL_31:

  return v4;
}

- (BOOL)_deserialize:(id)a3
{
  id v4;
  MIBUDeserializer *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MIBUNetworkInfo *v12;
  void *v13;
  id v14;
  MIBUDeserializer *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;

  v4 = a3;
  v5 = -[MIBUDeserializer initWithData:]([MIBUDeserializer alloc], "initWithData:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer deserialize](v5, "deserialize"));
  if (!v6)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000555A0);
    v42 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003AE30(v42, v43, v44, v45, v46, v47, v48, v49);
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v66 = 0;
    v67 = 0;
    v63 = 0;
    v64 = 0;
    v34 = 0;
    v33 = 0;
    v37 = 0;
    v39 = 0;
    v31 = 0;
    v65 = 0;
    goto LABEL_15;
  }
  v72 = 0;
  v7 = -[MIBUDeserializer deserializeResponseError:](v5, "deserializeResponseError:", &v72);
  v65 = v72;
  if ((v7 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000555C0);
    v50 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003AE60(v50, v51, v52, v53, v54, v55, v56, v57);
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v66 = 0;
    v67 = 0;
    v63 = 0;
    v64 = 0;
    v34 = 0;
    v33 = 0;
    v37 = 0;
    v39 = 0;
    v31 = 0;
LABEL_15:
    v40 = 0;
    goto LABEL_4;
  }
  v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005BCE0));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005BCF8));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005BD10));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005BD28));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005BD40));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005BD58));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005BD70));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005BD88));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005BDA0));
  v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005BDB8));
  v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005BDD0));
  v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005BDE8));
  v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005BE00));
  v12 = objc_alloc_init(MIBUNetworkInfo);
  -[MIBUNetworkInfoResponse setNetworkInfo:](self, "setNetworkInfo:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
  objc_msgSend(v13, "setNetworkName:", v58);

  v14 = objc_msgSend(v63, "longValue");
  v15 = v5;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
  objc_msgSend(v16, "setRSSI:", v14);

  v17 = objc_msgSend(v71, "longValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
  objc_msgSend(v18, "setNoise:", v17);

  v19 = objc_msgSend(v70, "longValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
  objc_msgSend(v20, "setChannel:", v19);

  v21 = (int)objc_msgSend(v69, "intValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
  objc_msgSend(v22, "setChannelWidth:", v21);

  v67 = v8;
  v23 = (int)objc_msgSend(v8, "intValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
  objc_msgSend(v24, "setChannelBand:", v23);

  v66 = v9;
  v25 = (int)objc_msgSend(v9, "intValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
  objc_msgSend(v26, "setPHYMode:", v25);

  v68 = v10;
  v27 = objc_msgSend(v10, "unsignedLongValue");
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
  objc_msgSend(v28, "setNumberOfSpatialStreams:", v27);

  v64 = v11;
  v29 = objc_msgSend(v11, "unsignedLongValue");
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
  objc_msgSend(v30, "setMCSIndex:", v29);

  v5 = v15;
  v31 = (void *)v58;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
  v33 = (void *)v59;
  v34 = (void *)v60;
  objc_msgSend(v32, "setMACAddress:");

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
  objc_msgSend(v35, "setIPV4Address:", v59);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
  v37 = (void *)v61;
  objc_msgSend(v36, "setIPV6Address:");

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNetworkInfoResponse networkInfo](self, "networkInfo"));
  v39 = (void *)v62;
  objc_msgSend(v38, "setBSSID:");

  v40 = 1;
LABEL_4:
  -[MIBUNFCResponse setError:](self, "setError:", v65);

  return v40;
}

- (MIBUNetworkInfo)networkInfo
{
  return self->_networkInfo;
}

- (void)setNetworkInfo:(id)a3
{
  objc_storeStrong((id *)&self->_networkInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkInfo, 0);
}

@end
