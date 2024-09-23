@implementation MIBUNFCCommand

- (MIBUNFCCommand)initWithCommandCode:(int64_t)a3 andPayload:(id)a4
{
  id v6;
  MIBUNFCCommand *v7;
  MIBUNFCCommand *v8;
  id v9;
  MIBUNFCCommand *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MIBUNFCCommand;
  v7 = -[MIBUNFCCommand init](&v12, "init");
  v8 = v7;
  if (v7
    && (v7->_code = a3,
        v9 = objc_msgSend(v6, "mutableCopy"),
        -[MIBUNFCCommand setMutablePayload:](v8, "setMutablePayload:", v9),
        v9,
        !-[MIBUNFCCommand _initWithCommandCode:](v8, "_initWithCommandCode:", a3)))
  {
    v10 = 0;
  }
  else
  {
    v10 = v8;
  }

  return v10;
}

- (MIBUNFCCommand)initWithAPDU:(id)a3
{
  id v5;
  MIBUNFCCommand *v6;
  MIBUNFCCommand *v7;
  NSMutableDictionary *v8;
  MIBUNFCCommand *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MIBUNFCCommand;
  v6 = -[MIBUNFCCommand init](&v11, "init");
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_apdu, a3),
        v8 = objc_opt_new(NSMutableDictionary),
        -[MIBUNFCCommand setMutablePayload:](v7, "setMutablePayload:", v8),
        v8,
        !-[MIBUNFCCommand _initWithAPDU:](v7, "_initWithAPDU:", v5)))
  {
    v9 = 0;
  }
  else
  {
    v9 = v7;
  }

  return v9;
}

- (Class)getResponseClass
{
  __objc2_class **v3;
  unint64_t v4;

  v3 = off_100054188;
  objc_opt_class(MIBUNFCResponse);
  v4 = (unint64_t)-[MIBUNFCCommand code](self, "code") - 1;
  if (v4 <= 8)
    v3 = (&off_1000580A0)[v4];
  return (Class)(id)objc_opt_class(*v3);
}

- (BOOL)_initWithCommandCode:(int64_t)a3
{
  NSMutableData *v5;
  NSData *serializedPayload;
  uint64_t *p_code;
  NSData *v8;
  unsigned __int8 v9;
  NSData *v10;
  NSData *v11;
  NSData *v12;
  NSObject *v13;
  uint64_t v14;
  BOOL v15;
  NSData *v16;
  NSUInteger v17;
  unsigned __int16 v18;
  NSMutableData *v19;
  uint64_t v20;
  NSObject *v22;
  uint64_t v23;
  int v24;
  char v25;
  char v26;
  char v27;

  v5 = objc_opt_new(NSMutableData);
  self->_cla = 0;
  serializedPayload = self->_serializedPayload;
  self->_serializedPayload = 0;

  p_code = &self->_code;
  switch(self->_code)
  {
    case 1:
      *(_WORD *)&self->_ins = 458;
      self->_p2 = 0;
      goto LABEL_16;
    case 2:
      *(_WORD *)&self->_ins = 474;
      self->_p2 = 1;
      v8 = (NSData *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand _serializeStartUpdate](self, "_serializeStartUpdate"));
      goto LABEL_19;
    case 3:
      *(_WORD *)&self->_ins = 458;
      v9 = 2;
      goto LABEL_15;
    case 4:
      *(_WORD *)&self->_ins = 1188;
      self->_p2 = 0;
      v10 = (NSData *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand mutablePayload](self, "mutablePayload"));
      v11 = (NSData *)objc_claimAutoreleasedReturnValue(-[NSData objectForKey:](v10, "objectForKey:", CFSTR("ApplicationID")));
      v12 = self->_serializedPayload;
      self->_serializedPayload = v11;

      goto LABEL_20;
    case 6:
      *(_WORD *)&self->_ins = 474;
      self->_p2 = 2;
      v8 = (NSData *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand _serializeRetryAfter](self, "_serializeRetryAfter"));
      goto LABEL_19;
    case 7:
      *(_WORD *)&self->_ins = 474;
      self->_p2 = 3;
      v8 = (NSData *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand _serializeHeartbeat](self, "_serializeHeartbeat"));
      goto LABEL_19;
    case 8:
      *(_WORD *)&self->_ins = 474;
      v9 = 4;
      goto LABEL_15;
    case 9:
      *(_WORD *)&self->_ins = 458;
      v9 = 3;
LABEL_15:
      self->_p2 = v9;
LABEL_16:
      v8 = objc_opt_new(NSData);
      goto LABEL_19;
    case 0xALL:
      *(_WORD *)&self->_ins = 474;
      self->_p2 = 5;
      v8 = (NSData *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand _serializeConfigureNFC](self, "_serializeConfigureNFC"));
      goto LABEL_19;
    case 0xBLL:
      *(_WORD *)&self->_ins = 474;
      self->_p2 = 6;
      v8 = (NSData *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand _serializeStartDiag](self, "_serializeStartDiag"));
LABEL_19:
      v10 = self->_serializedPayload;
      self->_serializedPayload = v8;
LABEL_20:

      v16 = self->_serializedPayload;
      if (v16)
      {
        v24 = *(_DWORD *)&self->_cla;
        if (-[NSData length](v16, "length"))
        {
          v17 = -[NSData length](self->_serializedPayload, "length");
          v18 = (unsigned __int16)-[NSData length](self->_serializedPayload, "length");
          if (v17 > 0xFF)
          {
            v25 = 0;
            v26 = HIBYTE(v18);
            v27 = v18;
            v19 = v5;
            v20 = 7;
          }
          else
          {
            v25 = v18;
            v19 = v5;
            v20 = 5;
          }
          -[NSMutableData appendBytes:length:](v19, "appendBytes:length:", &v24, v20);
          -[NSMutableData appendData:](v5, "appendData:", self->_serializedPayload);
        }
        else
        {
          -[NSMutableData appendBytes:length:](v5, "appendBytes:length:", &v24, 4);
        }
        objc_storeStrong((id *)&self->_apdu, v5);
        v15 = 1;
      }
      else
      {
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100057BA0);
        v22 = qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
          sub_10003D4C4(p_code, v22, v23);
LABEL_10:
        v15 = 0;
      }

      return v15;
    default:
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100057B80);
      v13 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
        sub_10003D45C(a3, v13, v14);
      goto LABEL_10;
  }
}

- (BOOL)_initWithAPDU:(id)a3
{
  id v4;
  NSData *serializedPayload;
  id v6;
  unsigned __int8 *v7;
  int v8;
  unsigned __int8 *v9;
  int v10;
  int v11;
  int v12;
  id v13;
  unsigned int v14;
  NSData *v15;
  uint64_t v16;
  uint64_t v17;
  NSData *v18;
  BOOL v19;
  void *v20;
  void *v21;
  NSData *v22;
  const __CFString *v23;
  int64_t v24;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;

  v4 = a3;
  self->_code = 0;
  serializedPayload = self->_serializedPayload;
  self->_serializedPayload = 0;

  if ((unint64_t)objc_msgSend(v4, "length") <= 3)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057BC0);
    v26 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003D530(v26);
    goto LABEL_82;
  }
  v6 = objc_retainAutorelease(v4);
  v7 = (unsigned __int8 *)objc_msgSend(v6, "bytes");
  v8 = *v7;
  if (*v7)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057BE0);
    v27 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003D7D8(v8, v27);
    goto LABEL_82;
  }
  v9 = v7;
  v10 = v7[1];
  v11 = v7[2];
  v12 = v7[3];
  if (objc_msgSend(v6, "length") == (id)4)
  {
LABEL_6:
    v15 = objc_opt_new(NSData);
    goto LABEL_13;
  }
  v13 = objc_msgSend(v6, "length");
  v14 = v9[4];
  if (v13 == (id)5)
  {
    if (v9[4])
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100057C00);
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
        sub_10003D688();
      goto LABEL_82;
    }
    goto LABEL_6;
  }
  if (v9[4])
  {
    v16 = 5;
  }
  else
  {
    if ((unint64_t)objc_msgSend(v6, "length") <= 6)
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100057C20);
      v29 = (void *)qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
        sub_10003D6B4(v29);
      goto LABEL_82;
    }
    v14 = bswap32(*(unsigned __int16 *)(v9 + 5)) >> 16;
    v16 = 7;
  }
  v17 = v14;
  if (v16 + (unint64_t)v14 > (unint64_t)objc_msgSend(v6, "length"))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057C40);
    v28 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003D730(v17, v28);
    goto LABEL_82;
  }
  v15 = (NSData *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", (char *)objc_msgSend(objc_retainAutorelease(v6), "bytes") + v16, v17, 0));
LABEL_13:
  v18 = self->_serializedPayload;
  self->_serializedPayload = v15;

  v19 = 1;
  if (v10 > 201)
  {
    if (v10 == 202)
    {
      if (v11 == 1 && !v12)
      {
        v19 = 1;
        self->_code = 1;
        goto LABEL_59;
      }
      if (v11 == 1 && v12 == 2)
      {
        v24 = 3;
      }
      else
      {
        v19 = 1;
        if (v11 != 1 || v12 != 3)
          goto LABEL_59;
        v24 = 9;
      }
    }
    else
    {
      if (v10 != 218)
        goto LABEL_59;
      if (v11 == 1 && v12 == 1)
      {
        self->_code = 2;
        if (-[MIBUNFCCommand _deserializeStartUpdate](self, "_deserializeStartUpdate"))
          goto LABEL_58;
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100057C60);
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
          sub_10003D5AC();
        goto LABEL_82;
      }
      if (v11 == 1 && v12 == 2)
      {
        self->_code = 6;
        if (-[MIBUNFCCommand _deserializeRetryAfter](self, "_deserializeRetryAfter"))
          goto LABEL_58;
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100057C80);
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
          sub_10003D5D8();
        goto LABEL_82;
      }
      if (v11 == 1 && v12 == 3)
      {
        self->_code = 7;
        if (-[MIBUNFCCommand _deserializeHeartbeat](self, "_deserializeHeartbeat"))
          goto LABEL_58;
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100057CA0);
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
          sub_10003D604();
        goto LABEL_82;
      }
      if (v11 != 1 || v12 != 4)
      {
        if (v11 == 1 && v12 == 5)
        {
          self->_code = 10;
          if (-[MIBUNFCCommand _deserializeConfigureNFC](self, "_deserializeConfigureNFC"))
            goto LABEL_58;
          if (qword_100068958 != -1)
            dispatch_once(&qword_100068958, &stru_100057CC0);
          if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
            sub_10003D630();
        }
        else
        {
          v19 = 1;
          if (v11 != 1 || v12 != 6)
            goto LABEL_59;
          self->_code = 11;
          if (-[MIBUNFCCommand _deserializeStartDiag](self, "_deserializeStartDiag"))
            goto LABEL_58;
          if (qword_100068958 != -1)
            dispatch_once(&qword_100068958, &stru_100057CE0);
          if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
            sub_10003D65C();
        }
LABEL_82:
        v19 = 0;
        goto LABEL_59;
      }
      v24 = 8;
    }
    self->_code = v24;
    goto LABEL_58;
  }
  if (v10 == 164)
  {
    v19 = 1;
    if (v11 == 4 && !v12)
    {
      self->_code = 4;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand mutablePayload](self, "mutablePayload"));
      v21 = v20;
      v22 = self->_serializedPayload;
      v23 = CFSTR("ApplicationID");
      goto LABEL_30;
    }
  }
  else if (v10 == 194)
  {
    if (!(v11 | v12))
    {
      self->_code = 5;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand mutablePayload](self, "mutablePayload"));
      v21 = v20;
      v22 = self->_serializedPayload;
      v23 = CFSTR("EvelopedAPDU");
LABEL_30:
      objc_msgSend(v20, "setObject:forKey:", v22, v23);

    }
LABEL_58:
    v19 = 1;
  }
LABEL_59:

  return v19;
}

- (id)_serializeStartUpdate
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100057D00);
  v3 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Serializing startUpdate command", v7, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand payload](self, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand _serializeTatsuPayload:](self, "_serializeTatsuPayload:", v4));

  return v5;
}

- (id)_serializeRetryAfter
{
  MIBUSerializer *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = objc_opt_new(MIBUSerializer);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand payload](self, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("RetryAfter")));

  if (!v5)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057D20);
    v10 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003D848(v10, v11, v12);
    goto LABEL_13;
  }
  v13 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  v7 = -[MIBUSerializer serialize:withValue:](v3, "serialize:withValue:", &off_10005D0D0, v6);

  if ((v7 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057D40);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003D8BC();
LABEL_13:
    v8 = 0;
    goto LABEL_4;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSerializer serializedData](v3, "serializedData"));
LABEL_4:

  return v8;
}

- (id)_serializeHeartbeat
{
  MIBUSerializer *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v3 = objc_opt_new(MIBUSerializer);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand payload](self, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("HeartbeatPeriod")));

  if (!v5)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057D60);
    v14 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003D928(v14, v15, v16);
    goto LABEL_19;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand payload](self, "payload"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("HeartbeatTimeout")));

  v18 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v9 = -[MIBUSerializer serialize:withValue:](v3, "serialize:withValue:", &off_10005D0E8, v8);

  if ((v9 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057D80);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003DA08();
    goto LABEL_18;
  }
  v17 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  v11 = -[MIBUSerializer serialize:withValue:](v3, "serialize:withValue:", &off_10005D100, v10);

  if ((v11 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057DA0);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003D99C();
LABEL_18:

LABEL_19:
    v12 = 0;
    goto LABEL_5;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSerializer serializedData](v3, "serializedData"));

LABEL_5:
  return v12;
}

- (id)_serializeConfigureNFC
{
  MIBUSerializer *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = objc_opt_new(MIBUSerializer);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand payload](self, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("NFCInactivityTimeout")));

  if (!v5)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057DC0);
    v10 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003DA74(v10, v11, v12);
    goto LABEL_13;
  }
  v13 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  v7 = -[MIBUSerializer serialize:withValue:](v3, "serialize:withValue:", &off_10005D118, v6);

  if ((v7 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057DE0);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003DAE8();
LABEL_13:
    v8 = 0;
    goto LABEL_4;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSerializer serializedData](v3, "serializedData"));
LABEL_4:

  return v8;
}

- (id)_serializeStartDiag
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100057E00);
  v3 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Serializing startDiag command", v7, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand payload](self, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand _serializeTatsuPayload:](self, "_serializeTatsuPayload:", v4));

  return v5;
}

- (id)_serializeTatsuPayload:(id)a3
{
  id v3;
  MIBUSerializer *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v3 = a3;
  v4 = objc_opt_new(MIBUSerializer);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("TatsuTicket")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("TimeStamp")));

  if (!v6)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057E20);
    v13 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003DB54(v13, v14, v15);
    goto LABEL_23;
  }
  if (!v5)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057E40);
    v16 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003DBC8(v16, v17, v18);
    goto LABEL_23;
  }
  v20 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  v8 = -[MIBUSerializer serialize:withValue:](v4, "serialize:withValue:", &off_10005D130, v7);

  if ((v8 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057E60);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003DCA8();
    goto LABEL_23;
  }
  v19 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  v10 = -[MIBUSerializer serialize:withValue:](v4, "serialize:withValue:", &off_10005D148, v9);

  if ((v10 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057E80);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003DC3C();
LABEL_23:
    v11 = 0;
    goto LABEL_6;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSerializer serializedData](v4, "serializedData"));
LABEL_6:

  return v11;
}

- (BOOL)_deserializeStartUpdate
{
  NSObject *v3;
  uint8_t v5[16];

  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100057EA0);
  v3 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deserialize startUpdate command", v5, 2u);
  }
  return -[MIBUNFCCommand _deserializeTatsuPayload](self, "_deserializeTatsuPayload");
}

- (BOOL)_deserializeRetryAfter
{
  MIBUDeserializer *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  BOOL v10;
  void *v12;

  v3 = -[MIBUDeserializer initWithData:]([MIBUDeserializer alloc], "initWithData:", self->_serializedPayload);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer deserialize](v3, "deserialize"));

  if (!v4)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057EC0);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003D5D8();
    goto LABEL_20;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", &off_10005C298));
  if (!v5)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057EE0);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003DD14();
    goto LABEL_20;
  }
  v6 = v5;
  objc_msgSend(v5, "doubleValue");
  if (v7 <= 0.0 || (objc_msgSend(v6, "doubleValue"), v8 >= 300.0))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057F00);
    v12 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003DD40(v12);

LABEL_20:
    v10 = 0;
    goto LABEL_6;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand mutablePayload](self, "mutablePayload"));
  objc_msgSend(v9, "setObject:forKey:", v6, CFSTR("RetryAfter"));

  v10 = 1;
LABEL_6:

  return v10;
}

- (BOOL)_deserializeHeartbeat
{
  MIBUDeserializer *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v17;
  void *v18;

  v3 = -[MIBUDeserializer initWithData:]([MIBUDeserializer alloc], "initWithData:", self->_serializedPayload);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer deserialize](v3, "deserialize"));

  if (!v4)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057F20);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003D604();
    goto LABEL_32;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", &off_10005C2B0));
  if (!v5)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057F40);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003DDB8();
    goto LABEL_32;
  }
  v6 = v5;
  objc_msgSend(v5, "doubleValue");
  if (v7 < 0.0 || (objc_msgSend(v6, "doubleValue"), v8 >= 300.0))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057F60);
    v17 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003DDE4(v17);
    goto LABEL_31;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", &off_10005C2C8));
  if (!v9)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057F80);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003DE5C();
    goto LABEL_31;
  }
  v10 = v9;
  objc_msgSend(v9, "doubleValue");
  if (v11 < 0.0 || (objc_msgSend(v6, "doubleValue"), v12 >= 300.0))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057FA0);
    v18 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003DE88(v18);

LABEL_31:
LABEL_32:
    v15 = 0;
    goto LABEL_9;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand mutablePayload](self, "mutablePayload"));
  objc_msgSend(v13, "setObject:forKey:", v6, CFSTR("HeartbeatPeriod"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand mutablePayload](self, "mutablePayload"));
  objc_msgSend(v14, "setObject:forKey:", v10, CFSTR("HeartbeatTimeout"));

  v15 = 1;
LABEL_9:

  return v15;
}

- (BOOL)_deserializeConfigureNFC
{
  MIBUDeserializer *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  BOOL v9;
  void *v11;

  v3 = -[MIBUDeserializer initWithData:]([MIBUDeserializer alloc], "initWithData:", self->_serializedPayload);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer deserialize](v3, "deserialize"));

  if (!v4)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057FC0);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003DF00();
    goto LABEL_19;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", &off_10005C2E0));
  if (!v5)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057FE0);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003DF2C();
    goto LABEL_19;
  }
  v6 = v5;
  objc_msgSend(v5, "doubleValue");
  if (v7 < 0.0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058000);
    v11 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003DF58(v11);

LABEL_19:
    v9 = 0;
    goto LABEL_5;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand mutablePayload](self, "mutablePayload"));
  objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("NFCInactivityTimeout"));

  v9 = 1;
LABEL_5:

  return v9;
}

- (BOOL)_deserializeStartDiag
{
  NSObject *v3;
  uint8_t v5[16];

  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100058020);
  v3 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deserialize startDiag command", v5, 2u);
  }
  return -[MIBUNFCCommand _deserializeTatsuPayload](self, "_deserializeTatsuPayload");
}

- (BOOL)_deserializeTatsuPayload
{
  MIBUDeserializer *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v3 = -[MIBUDeserializer initWithData:]([MIBUDeserializer alloc], "initWithData:", self->_serializedPayload);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer deserialize](v3, "deserialize"));

  if (!v4)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058040);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003DFD0();
    goto LABEL_19;
  }
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", &off_10005C2F8));
  if (!v5)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058060);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003DFFC();
    goto LABEL_19;
  }
  v6 = (void *)v5;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", &off_10005C310));
  if (!v7)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058080);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003E028();

LABEL_19:
    v11 = 0;
    goto LABEL_5;
  }
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand mutablePayload](self, "mutablePayload"));
  objc_msgSend(v9, "setObject:forKey:", v6, CFSTR("TatsuTicket"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand mutablePayload](self, "mutablePayload"));
  objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("TimeStamp"));

  v11 = 1;
LABEL_5:

  return v11;
}

- (int64_t)code
{
  return self->_code;
}

- (NSData)apdu
{
  return self->_apdu;
}

- (unsigned)cla
{
  return self->_cla;
}

- (unsigned)ins
{
  return self->_ins;
}

- (unsigned)p1
{
  return self->_p1;
}

- (unsigned)p2
{
  return self->_p2;
}

- (NSData)serializedPayload
{
  return self->_serializedPayload;
}

- (NSMutableDictionary)mutablePayload
{
  return self->_mutablePayload;
}

- (void)setMutablePayload:(id)a3
{
  objc_storeStrong((id *)&self->_mutablePayload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutablePayload, 0);
  objc_storeStrong((id *)&self->_serializedPayload, 0);
  objc_storeStrong((id *)&self->_apdu, 0);
}

@end
