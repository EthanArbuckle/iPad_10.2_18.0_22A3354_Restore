@implementation MIBUDeserializer

- (MIBUDeserializer)initWithData:(id)a3
{
  id v4;
  MIBUDeserializer *v5;
  MIBUDeserializer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MIBUDeserializer;
  v5 = -[MIBUDeserializer init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    -[MIBUDeserializer setData:](v5, "setData:", v4);
    -[MIBUDeserializer setPos:](v6, "setPos:", 0);
    -[MIBUDeserializer setTagValDict:](v6, "setTagValDict:", 0);
  }

  return v6;
}

- (id)deserialize
{
  void *v3;
  NSMutableDictionary *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  NSMutableDictionary *v12;
  id v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer tagValDict](self, "tagValDict"));

  if (v3)
    return (id)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer tagValDict](self, "tagValDict"));
  v5 = objc_opt_new(NSMutableDictionary);
  v6 = 0;
  v7 = 0;
  do
  {
    v8 = v7;
    v9 = v6;
    v13 = v6;
    v14 = v7;
    v10 = -[MIBUDeserializer _deserializeNextTag:withData:](self, "_deserializeNextTag:withData:", &v14, &v13);
    v7 = v14;

    v6 = v13;
    if (!v10)
    {

      v12 = 0;
      goto LABEL_14;
    }
    if (v6 && v7)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer _valueForTag:withData:](self, "_valueForTag:withData:", v7, v6));
      if (v11)
        -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v11, v7);

    }
  }
  while (v7);
  if (-[NSMutableDictionary count](v5, "count"))
    -[MIBUDeserializer setTagValDict:](self, "setTagValDict:", v5);
  v12 = v5;
LABEL_14:

  return v12;
}

- (BOOL)deserializeResponseError:(id *)a3
{
  return -[MIBUDeserializer _deserializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:](self, "_deserializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:", a3, &off_10005BE18, &off_10005BE18, &off_10005BE30);
}

- (BOOL)deserializeOperationError:(id *)a3
{
  return -[MIBUDeserializer _deserializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:](self, "_deserializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:", a3, &off_10005BE48, &off_10005BE60, &off_10005BE78);
}

- (BOOL)_deserializeNextTag:(id *)a3 withData:(id *)a4
{
  unint64_t v7;
  void *v8;
  id v9;
  unint64_t v10;
  void *v11;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  unint64_t v20;
  void *v21;
  id v22;
  id v23;
  char *v24;
  void *v25;
  BOOL v26;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  void *v38;
  unsigned int v39;
  NSObject *v40;
  void *v41;
  unsigned int v42;
  unsigned __int8 v43;
  uint8_t buf[4];
  _BYTE v45[28];

  v43 = 0;
  v42 = 0;
  v7 = -[MIBUDeserializer pos](self, "pos");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer data](self, "data"));
  v9 = objc_msgSend(v8, "length");

  if ((id)v7 == v9)
  {
LABEL_19:
    v18 = 0;
    v16 = 0;
    v25 = 0;
    goto LABEL_10;
  }
  v10 = v7 + 5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer data](self, "data"));
  v12 = objc_msgSend(v11, "length");

  if (v7 + 5 >= (unint64_t)v12)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056198);
    v28 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer data](self, "data"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer data](self, "data"));
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)v45 = v30;
      *(_WORD *)&v45[8] = 2048;
      *(_QWORD *)&v45[10] = v7;
      *(_WORD *)&v45[18] = 2048;
      *(_QWORD *)&v45[20] = objc_msgSend(v31, "length");
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Warning: Data %{public}@ Terminating deserialization at %lu for data length: %lu", buf, 0x20u);

    }
    goto LABEL_19;
  }
  v13 = v7 + 1;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer data](self, "data"));
  objc_msgSend(v14, "getBytes:range:", &v43, v7, 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer data](self, "data"));
  objc_msgSend(v15, "getBytes:range:", &v42, v13, 4);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v43));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUSerializationUtil maxLengthForTag:](MIBUSerializationUtil, "maxLengthForTag:", v16));
  if (v17)
  {
    v18 = v17;
    v19 = v42;
    if (v19 > objc_msgSend(v17, "unsignedIntValue"))
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_1000561D8);
      v33 = (void *)qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      {
        v34 = v33;
        v35 = objc_msgSend(v16, "charValue");
        v36 = v42;
        v37 = objc_msgSend(v18, "unsignedIntValue");
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v45 = v35;
        *(_WORD *)&v45[4] = 1024;
        *(_DWORD *)&v45[6] = v36;
        *(_WORD *)&v45[10] = 1024;
        *(_DWORD *)&v45[12] = v37;
        _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "0x%X field len: %u is > expected len: %u", buf, 0x14u);

      }
    }
    else
    {
      v20 = v10 + v42;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer data](self, "data"));
      v22 = objc_msgSend(v21, "length");

      if (v20 <= (unint64_t)v22)
      {
        if (v42)
        {
          v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer data](self, "data")));
          v24 = (char *)objc_msgSend(v23, "bytes");
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", &v24[v10], v42, 0));

          v10 += v42;
        }
        else
        {
          v25 = 0;
        }
        -[MIBUDeserializer setPos:](self, "setPos:", v10);
LABEL_10:
        v26 = 1;
        if (!a3)
          goto LABEL_12;
        goto LABEL_11;
      }
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_1000561F8);
      v38 = (void *)qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      {
        v39 = v42;
        v40 = v38;
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer data](self, "data"));
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v45 = v39;
        *(_WORD *)&v45[4] = 2048;
        *(_QWORD *)&v45[6] = v10;
        *(_WORD *)&v45[14] = 2114;
        *(_QWORD *)&v45[16] = v41;
        _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Failed to deserialize %u bytes data at %lu; data %{public}@ too short",
          buf,
          0x1Cu);

      }
    }
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000561B8);
    v32 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003BE38(v32, v16);
    v18 = 0;
  }
  v25 = 0;
  v26 = 0;
  if (a3)
LABEL_11:
    *a3 = objc_retainAutorelease(v16);
LABEL_12:
  if (a4)
    *a4 = objc_retainAutorelease(v25);

  return v26;
}

- (id)_valueForTag:(id)a3 withData:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  id v12;
  void *v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUSerializationUtil typeForTag:](MIBUSerializationUtil, "typeForTag:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUSerializationUtil maxLengthForTag:](MIBUSerializationUtil, "maxLengthForTag:", v6));

  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    switch(objc_msgSend(v7, "unsignedIntValue"))
    {
      case 1u:
      case 3u:
      case 4u:
        v10 = objc_msgSend(v8, "unsignedIntValue");
        if (!v5 || (v11 = v10, !objc_msgSend(v5, "length")))
        {
          if (qword_100068958 != -1)
            dispatch_once(&qword_100068958, &stru_100056218);
          v20 = qword_100068950;
          if (!os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
            break;
          goto LABEL_33;
        }
        if (v11 - 9 <= 0xFFFFFFF7)
        {
          if (qword_100068958 != -1)
            dispatch_once(&qword_100068958, &stru_100056238);
          if (!os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
            break;
          goto LABEL_57;
        }
        if (objc_msgSend(v5, "length") == (id)v11)
        {
          v34 = 0.0;
          objc_msgSend(v5, "getBytes:range:", &v34, 0, v11);
          v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", *(_QWORD *)&v34));
          goto LABEL_28;
        }
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100056258);
        if (!os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
          break;
        goto LABEL_65;
      case 2u:
        v15 = objc_msgSend(v8, "unsignedIntValue");
        if (!v5 || (v16 = v15, !objc_msgSend(v5, "length")))
        {
          if (qword_100068958 != -1)
            dispatch_once(&qword_100068958, &stru_100056278);
          v20 = qword_100068950;
          if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
LABEL_33:
            sub_10003BF40((uint64_t)v5, v20, v21, v22, v23, v24, v25, v26);
          break;
        }
        if (v16 - 9 <= 0xFFFFFFF7)
        {
          if (qword_100068958 != -1)
            dispatch_once(&qword_100068958, &stru_100056298);
          if (!os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
            break;
          goto LABEL_57;
        }
        if (objc_msgSend(v5, "length") == (id)v16)
        {
          v34 = 0.0;
          objc_msgSend(v5, "getBytes:range:", &v34, 0, v16);
          v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v34));
          goto LABEL_28;
        }
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_1000562B8);
        if (!os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
          break;
        goto LABEL_65;
      case 5u:
        v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v5, 4);
        goto LABEL_28;
      case 6u:
        v12 = v5;
        goto LABEL_28;
      case 7u:
        v17 = objc_msgSend(v8, "unsignedIntValue");
        if (!v5 || (v18 = v17, !objc_msgSend(v5, "length")))
        {
          if (qword_100068958 != -1)
            dispatch_once(&qword_100068958, &stru_1000562D8);
          v27 = qword_100068950;
          if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
            sub_10003C070((uint64_t)v5, v27, v28, v29, v30, v31, v32, v33);
          break;
        }
        if (v18 - 9 <= 0xFFFFFFF7)
        {
          if (qword_100068958 != -1)
            dispatch_once(&qword_100068958, &stru_1000562F8);
          if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
LABEL_57:
            sub_10003BFA4();
        }
        else
        {
          if (objc_msgSend(v5, "length") == (id)v18)
          {
            v34 = 0.0;
            objc_msgSend(v5, "getBytes:range:", &v34, 0, v18);
            v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)&v34));
LABEL_28:
            v14 = v12;
            goto LABEL_29;
          }
          if (qword_100068958 != -1)
            dispatch_once(&qword_100068958, &stru_100056318);
          if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
LABEL_65:
            sub_10003C008();
        }
        break;
      default:
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100056338);
        v13 = (void *)qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
          sub_10003BEBC(v13, v7);
        break;
    }
  }
  v14 = 0;
LABEL_29:

  return v14;
}

- (BOOL)_deserializeError:(id *)a3 withErrorCodeTag:(id)a4 errorDomainTag:(id)a5 errorDescriptionTag:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_opt_new(NSMutableDictionary);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer tagValDict](self, "tagValDict"));

  if (!v14)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056358);
    v24 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003C0D4(v24, v25, v26, v27, v28, v29, v30, v31);
LABEL_18:
    v20 = 0;
    v18 = 0;
    v16 = 0;
    v22 = 0;
    v21 = 0;
    if (!a3)
      goto LABEL_9;
    goto LABEL_8;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer tagValDict](self, "tagValDict"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v10));

  if (!v16)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056378);
    v32 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003C104(v32, v33, v34, v35, v36, v37, v38, v39);
    goto LABEL_18;
  }
  if (objc_msgSend(v16, "longValue"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer tagValDict](self, "tagValDict"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", v11));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer tagValDict](self, "tagValDict"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", v12));

    if (v20)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v20, NSLocalizedDescriptionKey);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v18, objc_msgSend(v16, "longValue"), v13));
  }
  else
  {
    v20 = 0;
    v18 = 0;
    v21 = 0;
  }
  v22 = 1;
  if (a3)
LABEL_8:
    *a3 = objc_retainAutorelease(v21);
LABEL_9:

  return v22;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (unint64_t)pos
{
  return self->_pos;
}

- (void)setPos:(unint64_t)a3
{
  self->_pos = a3;
}

- (NSDictionary)tagValDict
{
  return self->_tagValDict;
}

- (void)setTagValDict:(id)a3
{
  objc_storeStrong((id *)&self->_tagValDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagValDict, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
