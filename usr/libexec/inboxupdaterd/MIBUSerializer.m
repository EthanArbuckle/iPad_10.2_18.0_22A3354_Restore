@implementation MIBUSerializer

- (MIBUSerializer)init
{
  MIBUSerializer *v2;
  NSMutableData *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIBUSerializer;
  v2 = -[MIBUSerializer init](&v5, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableData);
    -[MIBUSerializer setData:](v2, "setData:", v3);

  }
  return v2;
}

- (BOOL)serialize:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t, _BYTE *);
  void *v17;
  _QWORD *v18;
  uint64_t *v19;
  id v20;
  id location;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  NSMutableData *v29;
  uint8_t buf[24];

  v6 = a3;
  v7 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_100023A98;
  v28 = sub_100023AA8;
  v29 = objc_opt_new(NSMutableData);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_100023A98;
  v22[4] = sub_100023AA8;
  v8 = v7;
  v23 = v8;
  objc_initWeak(&location, self);
  v9 = objc_msgSend(v6, "count");
  v10 = v9 == objc_msgSend(v8, "count");
  if (v10)
  {
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_100023B14;
    v17 = &unk_100057900;
    objc_copyWeak(&v20, &location);
    v18 = v22;
    v19 = &v24;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v14);
    objc_destroyWeak(&v20);
    v11 = (void *)v25[5];
    if (!v11 || !objc_msgSend(v11, "length", v14, v15, v16, v17))
    {
      v10 = 0;
      goto LABEL_7;
    }
    v12 = objc_claimAutoreleasedReturnValue(-[MIBUSerializer data](self, "data"));
    -[NSObject appendData:](v12, "appendData:", v25[5]);
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057898);
    v12 = (id)qword_100068950;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10003CE64(buf, (uint64_t)objc_msgSend(v8, "count"), (uint64_t)objc_msgSend(v6, "count"), v12);
  }

LABEL_7:
  objc_destroyWeak(&location);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(&v24, 8);
  return v10;
}

- (BOOL)serializeResponseError:(id)a3
{
  return -[MIBUSerializer _serializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:](self, "_serializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:", a3, &off_10005C1D8, &off_10005C1F0, &off_10005C208);
}

- (BOOL)serializeOperationError:(id)a3
{
  return -[MIBUSerializer _serializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:](self, "_serializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:", a3, &off_10005C220, &off_10005C238, &off_10005C250);
}

- (id)_serializeValue:(id)a3 forTag:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSMutableData *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSMutableData *v23;
  NSObject *v25;
  unsigned int v26;
  id v27;
  unsigned int v28;
  _BYTE v29[5];
  uint8_t buf[8];
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  unsigned int v36;

  v5 = a3;
  v6 = a4;
  v29[4] = 0;
  *(_DWORD *)v29 = objc_msgSend(v6, "charValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUSerializationUtil typeForTag:](MIBUSerializationUtil, "typeForTag:", v6));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUSerializationUtil maxLengthForTag:](MIBUSerializationUtil, "maxLengthForTag:", v6));
    if (v8)
    {
      switch(objc_msgSend(v7, "unsignedIntValue"))
      {
        case 1u:
        case 3u:
        case 4u:
          v9 = objc_opt_class(NSNumber);
          if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
          {
            v10 = v5;
            v11 = objc_msgSend(v10, "longLongValue");
            goto LABEL_20;
          }
          if (qword_100068958 != -1)
            dispatch_once(&qword_100068958, &stru_100057920);
          if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
            goto LABEL_50;
          goto LABEL_10;
        case 2u:
          v15 = objc_opt_class(NSNumber);
          if ((objc_opt_isKindOfClass(v5, v15) & 1) != 0)
          {
            v10 = v5;
            objc_msgSend(v10, "doubleValue");
            *(_QWORD *)buf = v16;
            goto LABEL_21;
          }
          if (qword_100068958 != -1)
            dispatch_once(&qword_100068958, &stru_100057940);
          if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
            goto LABEL_50;
          goto LABEL_10;
        case 5u:
          v17 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v5, v17) & 1) != 0)
          {
            v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:", 4));
            goto LABEL_17;
          }
          if (qword_100068958 != -1)
            dispatch_once(&qword_100068958, &stru_100057960);
          if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
            sub_10003D0CC();
          goto LABEL_10;
        case 6u:
          v19 = objc_opt_class(NSData);
          if ((objc_opt_isKindOfClass(v5, v19) & 1) == 0)
          {
            if (qword_100068958 != -1)
              dispatch_once(&qword_100068958, &stru_100057980);
            if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
              sub_10003D168();
            goto LABEL_10;
          }
          v18 = v5;
LABEL_17:
          v13 = v18;
          goto LABEL_22;
        case 7u:
          v20 = objc_opt_class(NSNumber);
          if ((objc_opt_isKindOfClass(v5, v20) & 1) == 0)
          {
            if (qword_100068958 != -1)
              dispatch_once(&qword_100068958, &stru_1000579A0);
            if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
LABEL_50:
              sub_10003D030();
            goto LABEL_10;
          }
          v10 = v5;
          v11 = objc_msgSend(v10, "unsignedLongLongValue");
LABEL_20:
          *(_QWORD *)buf = v11;
LABEL_21:
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, objc_msgSend(v8, "unsignedIntValue")));

LABEL_22:
          *(_DWORD *)&v29[1] = objc_msgSend(v13, "length");
          if (objc_msgSend(v8, "unsignedIntValue") < *(_DWORD *)&v29[1])
          {
            if (qword_100068958 != -1)
              dispatch_once(&qword_100068958, &stru_1000579E0);
            v21 = (void *)qword_100068950;
            if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
            {
              v25 = v21;
              v26 = objc_msgSend(v6, "charValue");
              v27 = objc_msgSend(v13, "length");
              v28 = objc_msgSend(v8, "unsignedIntValue");
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)&buf[4] = v26;
              v31 = 2114;
              v32 = v13;
              v33 = 2048;
              v34 = v27;
              v35 = 1024;
              v36 = v28;
              _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Truncating tag 0x%X - %{public}@ with data length %ld to %d", buf, 0x22u);

            }
            v22 = objc_retainAutorelease(v13);
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", objc_msgSend(v22, "bytes"), objc_msgSend(v8, "unsignedIntValue")));

            *(_DWORD *)&v29[1] = objc_msgSend(v13, "length");
          }
          v14 = objc_opt_new(NSMutableData);
          -[NSMutableData appendBytes:length:](v14, "appendBytes:length:", v29, 1);
          -[NSMutableData appendBytes:length:](v14, "appendBytes:length:", &v29[1], 4);
          -[NSMutableData appendData:](v14, "appendData:", v13);
          break;
        default:
          if (qword_100068958 != -1)
            dispatch_once(&qword_100068958, &stru_1000579C0);
          v12 = (void *)qword_100068950;
          if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
            sub_10003CF98(v12, v7);
          goto LABEL_10;
      }
    }
    else
    {
LABEL_10:
      v13 = 0;
      v14 = 0;
    }
  }
  else
  {
    v13 = 0;
    v14 = 0;
    v8 = 0;
  }
  v23 = v14;

  return v23;
}

- (BOOL)_serializeError:(id)a3 withErrorCodeTag:(id)a4 errorDomainTag:(id)a5 errorDescriptionTag:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  MIBUSerializer *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  unsigned __int8 v27;
  BOOL v28;
  void *v29;
  unsigned __int8 v30;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  __CFString *v42;
  id v43;
  _QWORD v44[3];
  _QWORD v45[3];
  id v46;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_autoreleasePoolPush();
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSerializer data](self, "data"));
  v43 = objc_msgSend(v15, "copy");

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
  if (v16)
    v17 = (const __CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
  else
    v17 = &stru_10005B4B0;

  v42 = (__CFString *)v17;
  if (!v10)
  {
    v46 = v11;
    v28 = 1;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
    v30 = -[MIBUSerializer serialize:withValue:](self, "serialize:withValue:", v29, &off_10005D0A0);

    v22 = self;
    if ((v30 & 1) != 0)
      goto LABEL_9;
    goto LABEL_10;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));

  if (!v18)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057A00);
    v33 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003D278(v33, v34, v35, v36, v37, v38, v39, v40);
    goto LABEL_18;
  }
  v45[0] = v11;
  v45[1] = v12;
  v45[2] = v13;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 3));
  v41 = v14;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v10, "code")));
  v44[0] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
  v44[1] = v21;
  v44[2] = v17;
  v22 = self;
  v23 = v11;
  v24 = v13;
  v25 = v12;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 3));
  v27 = -[MIBUSerializer serialize:withValue:](v22, "serialize:withValue:", v19, v26);

  v12 = v25;
  v13 = v24;
  v11 = v23;

  v14 = v41;
  if ((v27 & 1) == 0)
  {
LABEL_10:
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057A20);
    self = v22;
    v32 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003D204((uint64_t)v10, v32);
LABEL_18:
    -[MIBUSerializer setData:](self, "setData:", v43);
    v28 = 0;
    goto LABEL_9;
  }
  v28 = 1;
LABEL_9:

  objc_autoreleasePoolPop(v14);
  return v28;
}

- (NSMutableData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
