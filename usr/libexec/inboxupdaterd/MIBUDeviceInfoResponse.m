@implementation MIBUDeviceInfoResponse

- (MIBUDeviceInfoResponse)init
{
  MIBUDeviceInfoResponse *v2;
  MIBUDeviceInfoResponse *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIBUDeviceInfoResponse;
  v2 = -[MIBUNFCResponse init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[MIBUDeviceInfoResponse setSerialNumber:](v2, "setSerialNumber:", 0);
    -[MIBUDeviceInfoResponse setEcid:](v3, "setEcid:", 0);
    -[MIBUDeviceInfoResponse setBoardID:](v3, "setBoardID:", 0);
    -[MIBUDeviceInfoResponse setChipID:](v3, "setChipID:", 0);
    -[MIBUDeviceInfoResponse setApNonce:](v3, "setApNonce:", 0);
    -[MIBUDeviceInfoResponse setSepNonce:](v3, "setSepNonce:", 0);
    -[MIBUDeviceInfoResponse setSecurityDomain:](v3, "setSecurityDomain:", 0);
    -[MIBUDeviceInfoResponse setProductionMode:](v3, "setProductionMode:", 0);
    -[MIBUDeviceInfoResponse setSecurityMode:](v3, "setSecurityMode:", 0);
    -[MIBUDeviceInfoResponse setUidMode:](v3, "setUidMode:", 0);
    -[MIBUDeviceInfoResponse setSikaFuse:](v3, "setSikaFuse:", 0);
    -[MIBUDeviceInfoResponse setSikaFuseExists:](v3, "setSikaFuseExists:", 1);
  }
  return v3;
}

- (id)serialize
{
  MIBUSerializer *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSData *v10;
  NSData *v11;
  NSData *v12;
  NSData *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v25;
  uint64_t v26;
  id v27;
  NSData *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[12];

  v3 = objc_opt_new(MIBUSerializer);
  if (-[MIBUNFCResponse rejected](self, "rejected"))
  {
LABEL_20:
    v23 = 0;
    goto LABEL_11;
  }
  v4 = objc_claimAutoreleasedReturnValue(-[MIBUDeviceInfoResponse serialNumber](self, "serialNumber"));
  v35[0] = v4;
  v5 = objc_claimAutoreleasedReturnValue(-[MIBUDeviceInfoResponse ecid](self, "ecid"));
  v35[1] = v5;
  v6 = objc_claimAutoreleasedReturnValue(-[MIBUDeviceInfoResponse boardID](self, "boardID"));
  v35[2] = v6;
  v7 = objc_claimAutoreleasedReturnValue(-[MIBUDeviceInfoResponse chipID](self, "chipID"));
  v35[3] = v7;
  v8 = objc_claimAutoreleasedReturnValue(-[MIBUDeviceInfoResponse securityDomain](self, "securityDomain"));
  v35[4] = v8;
  v9 = objc_claimAutoreleasedReturnValue(-[MIBUDeviceInfoResponse apNonce](self, "apNonce"));
  if (v9)
    v10 = (NSData *)objc_claimAutoreleasedReturnValue(-[MIBUDeviceInfoResponse apNonce](self, "apNonce"));
  else
    v10 = objc_opt_new(NSData);
  v11 = v10;
  v35[5] = v10;
  v33 = (void *)v5;
  v34 = (void *)v4;
  v31 = (void *)v7;
  v32 = (void *)v6;
  v29 = (void *)v9;
  v30 = (void *)v8;
  v26 = objc_claimAutoreleasedReturnValue(-[MIBUDeviceInfoResponse sepNonce](self, "sepNonce"));
  v28 = v11;
  if (v26)
    v12 = (NSData *)objc_claimAutoreleasedReturnValue(-[MIBUDeviceInfoResponse sepNonce](self, "sepNonce", v26, v11, v9, v8, v7, v6, v5, v4));
  else
    v12 = objc_opt_new(NSData);
  v13 = v12;
  v35[6] = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MIBUDeviceInfoResponse productionMode](self, "productionMode", v26)));
  v35[7] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MIBUDeviceInfoResponse securityMode](self, "securityMode")));
  v35[8] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MIBUDeviceInfoResponse uidMode](self, "uidMode")));
  v35[9] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeviceInfoResponse sikaFuse](self, "sikaFuse"));
  v35[10] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MIBUDeviceInfoResponse sikaFuseExists](self, "sikaFuseExists")));
  v35[11] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 12));
  v20 = -[MIBUSerializer serialize:withValue:](v3, "serialize:withValue:", &off_10005D160, v19);

  if ((v20 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000583A8);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003E0C8();
    goto LABEL_20;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCResponse error](self, "error"));
  v22 = -[MIBUSerializer serializeResponseError:](v3, "serializeResponseError:", v21);

  if ((v22 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000583C8);
    v25 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003AD5C(v25, self);
    goto LABEL_20;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSerializer serializedData](v3, "serializedData"));
LABEL_11:

  return v23;
}

- (BOOL)_deserialize:(id)a3
{
  id v4;
  MIBUDeserializer *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  MIBUDeserializer *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;

  v4 = a3;
  v5 = -[MIBUDeserializer initWithData:]([MIBUDeserializer alloc], "initWithData:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer deserialize](v5, "deserialize"));
  v44 = v5;
  if (!v6)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000583E8);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003E0F4();
    goto LABEL_38;
  }
  v49 = 0;
  v7 = -[MIBUDeserializer deserializeResponseError:](v5, "deserializeResponseError:", &v49);
  v8 = v49;
  v9 = v8;
  if ((v7 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058408);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003E2D8();
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    goto LABEL_45;
  }
  if (v8)
  {
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    goto LABEL_22;
  }
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005C910));
  if (!v10)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058428);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003E120();
LABEL_38:
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
LABEL_44:
    v9 = 0;
LABEL_45:
    v31 = 0;
    goto LABEL_23;
  }
  v11 = (void *)v10;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005C928));
  if (!v12)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058448);
    v30 = v11;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003E14C();
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    goto LABEL_44;
  }
  v13 = (void *)v12;
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005C940));
  if (!v14)
  {
    v39 = v13;
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058468);
    v30 = v11;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003E178();
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    v27 = 0;
    v28 = 0;
    goto LABEL_56;
  }
  v15 = (void *)v14;
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005C958));
  if (!v16)
  {
    v39 = v13;
    v28 = v15;
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058488);
    v30 = v11;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003E1A4();
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    v27 = 0;
LABEL_56:
    v9 = 0;
    v31 = 0;
    v29 = v39;
    goto LABEL_23;
  }
  v17 = (void *)v16;
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005C970));
  if (!v18)
  {
    v37 = v17;
    v40 = v13;
    v28 = v15;
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000584A8);
    v30 = v11;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003E1D0();
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    goto LABEL_67;
  }
  v19 = (void *)v18;
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005C988));
  if (!v20)
  {
    v32 = v19;
    v37 = v17;
    v40 = v13;
    v28 = v15;
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000584C8);
    v30 = v11;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003E1FC();
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
LABEL_67:
    v9 = 0;
    v31 = 0;
    v27 = v37;
    v29 = v40;
    goto LABEL_23;
  }
  v21 = (void *)v20;
  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005C9A0));
  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005C9B8));
  v42 = (void *)v22;
  if (!v23)
  {
    v36 = v21;
    v32 = v19;
    v38 = v17;
    v41 = v13;
    v28 = v15;
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000584E8);
    v30 = v11;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003E228();
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v9 = 0;
    v31 = 0;
    v29 = v41;
    goto LABEL_83;
  }
  v46 = (void *)v23;
  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005C9D0));
  if (!v24)
  {
    v36 = v21;
    v38 = v17;
    v35 = v15;
    v32 = v19;
    v29 = v13;
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058508);
    v30 = v11;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003E254();
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v9 = 0;
    v31 = 0;
    v28 = v35;
    goto LABEL_83;
  }
  v47 = (void *)v24;
  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005C9E8));
  if (!v25)
  {
    v36 = v21;
    v38 = v17;
    v32 = v19;
    v28 = v15;
    v29 = v13;
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058528);
    v30 = v11;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003E280();
    v43 = 0;
    v48 = 0;
    v45 = 0;
    v9 = 0;
    v31 = 0;
LABEL_83:
    v21 = v36;
    v27 = v38;
    goto LABEL_23;
  }
  v45 = (void *)v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005CA18));
  v43 = v26;
  if (!v26)
  {
    v48 = 0;
    goto LABEL_21;
  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005CA00));
  if (v48)
  {
LABEL_21:
    -[MIBUDeviceInfoResponse setSerialNumber:](self, "setSerialNumber:", v11);
    -[MIBUDeviceInfoResponse setEcid:](self, "setEcid:", v13);
    -[MIBUDeviceInfoResponse setBoardID:](self, "setBoardID:", v15);
    -[MIBUDeviceInfoResponse setChipID:](self, "setChipID:", v17);
    -[MIBUDeviceInfoResponse setSecurityDomain:](self, "setSecurityDomain:", v19);
    -[MIBUDeviceInfoResponse setApNonce:](self, "setApNonce:", v21);
    -[MIBUDeviceInfoResponse setSepNonce:](self, "setSepNonce:", v22);
    -[MIBUDeviceInfoResponse setProductionMode:](self, "setProductionMode:", objc_msgSend(v46, "BOOLValue"));
    -[MIBUDeviceInfoResponse setSecurityMode:](self, "setSecurityMode:", objc_msgSend(v47, "BOOLValue"));
    -[MIBUDeviceInfoResponse setUidMode:](self, "setUidMode:", objc_msgSend(v45, "BOOLValue"));
    -[MIBUDeviceInfoResponse setSikaFuse:](self, "setSikaFuse:", v48);
    -[MIBUDeviceInfoResponse setSikaFuseExists:](self, "setSikaFuseExists:", objc_msgSend(v26, "BOOLValue"));
    v27 = v17;
    v29 = v13;
    v32 = v19;
    v28 = v15;
    v30 = v11;
    v9 = 0;
LABEL_22:
    v31 = 1;
    goto LABEL_23;
  }
  v34 = v19;
  v27 = v17;
  v28 = v15;
  v29 = v13;
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100058548);
  v30 = v11;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
    sub_10003E2AC();
  v48 = 0;
  v9 = 0;
  v31 = 0;
  v32 = v34;
LABEL_23:
  -[MIBUNFCResponse setError:](self, "setError:", v9);

  return v31;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSNumber)ecid
{
  return self->_ecid;
}

- (void)setEcid:(id)a3
{
  objc_storeStrong((id *)&self->_ecid, a3);
}

- (NSNumber)boardID
{
  return self->_boardID;
}

- (void)setBoardID:(id)a3
{
  objc_storeStrong((id *)&self->_boardID, a3);
}

- (NSNumber)chipID
{
  return self->_chipID;
}

- (void)setChipID:(id)a3
{
  objc_storeStrong((id *)&self->_chipID, a3);
}

- (NSNumber)securityDomain
{
  return self->_securityDomain;
}

- (void)setSecurityDomain:(id)a3
{
  self->_securityDomain = (NSNumber *)a3;
}

- (NSData)apNonce
{
  return self->_apNonce;
}

- (void)setApNonce:(id)a3
{
  objc_storeStrong((id *)&self->_apNonce, a3);
}

- (NSData)sepNonce
{
  return self->_sepNonce;
}

- (void)setSepNonce:(id)a3
{
  objc_storeStrong((id *)&self->_sepNonce, a3);
}

- (BOOL)productionMode
{
  return self->_productionMode;
}

- (void)setProductionMode:(BOOL)a3
{
  self->_productionMode = a3;
}

- (BOOL)securityMode
{
  return self->_securityMode;
}

- (void)setSecurityMode:(BOOL)a3
{
  self->_securityMode = a3;
}

- (BOOL)uidMode
{
  return self->_uidMode;
}

- (void)setUidMode:(BOOL)a3
{
  self->_uidMode = a3;
}

- (NSNumber)sikaFuse
{
  return self->_sikaFuse;
}

- (void)setSikaFuse:(id)a3
{
  objc_storeStrong((id *)&self->_sikaFuse, a3);
}

- (BOOL)sikaFuseExists
{
  return self->_sikaFuseExists;
}

- (void)setSikaFuseExists:(BOOL)a3
{
  self->_sikaFuseExists = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sikaFuse, 0);
  objc_storeStrong((id *)&self->_sepNonce, 0);
  objc_storeStrong((id *)&self->_apNonce, 0);
  objc_storeStrong((id *)&self->_chipID, 0);
  objc_storeStrong((id *)&self->_boardID, 0);
  objc_storeStrong((id *)&self->_ecid, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end
