@implementation W5PeerSnifferRequestPayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerSnifferRequestPayload)initWithRequest:(id)a3
{
  id v4;
  W5PeerSnifferRequestPayload *v5;
  uint64_t v6;
  NSObject *v7;
  NSNumber *v8;
  void *v9;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  void *v13;
  id v14;
  int64_t type;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSSet *v23;
  void *v24;
  uint64_t v25;
  NSArray *channels;
  void *v27;
  NSUUID *v28;
  NSUUID *uuid;
  NSUUID *v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  NSObject *v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  objc_super v55;
  NSErrorUserInfoKey v56;
  void *v57;
  NSErrorUserInfoKey v58;
  void *v59;
  NSErrorUserInfoKey v60;
  void *v61;
  NSErrorUserInfoKey v62;
  void *v63;
  NSErrorUserInfoKey v64;
  void *v65;
  NSErrorUserInfoKey v66;
  void *v67;
  int v68;
  const char *v69;
  __int16 v70;
  const char *v71;
  __int16 v72;
  int v73;
  __int16 v74;
  id v75;

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)W5PeerSnifferRequestPayload;
  v5 = -[W5PeerSnifferRequestPayload init](&v55, "init");
  if (v5)
  {
    v6 = sub_10008F56C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v68 = 136315906;
      v69 = "-[W5PeerSnifferRequestPayload initWithRequest:]";
      v70 = 2080;
      v71 = "W5PeerSnifferRequestPayload.m";
      v72 = 1024;
      v73 = 36;
      v74 = 2114;
      v75 = v4;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v7, 0, "[wifivelocity] %s (%s:%u) Request Data: %{public}@", &v68, 38);
    }

    v8 = (NSNumber *)objc_msgSend(v4, "objectForKey:", CFSTR("version"));
    v5->_version = v8;
    if (!v8)
    {
      v35 = objc_alloc((Class)NSError);
      v66 = NSLocalizedDescriptionKey;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("nil version"), &stru_1000D8750, 0));
      v67 = v52;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1));
      v19 = objc_msgSend(v35, "initWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocty.sniffer"), -1, v37);
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v9 = 0;
LABEL_30:

      goto LABEL_31;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("type")));
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSNumber, v10), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v54 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v12, v9, &v54));
    v14 = v54;
    v5->_type = (int64_t)objc_msgSend(v13, "integerValue");

    type = v5->_type;
    if (type != 1)
    {
      if (type != 2)
      {
        if (type)
        {
          v16 = 0;
          v17 = 0;
          v18 = 0;
          v19 = v14;
LABEL_16:
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("noAutoStop")));
          v5->_noAutoStop = objc_msgSend(v31, "BOOLValue");

          if (!v5->_noAutoStop)
          {
            v33 = 0;
            goto LABEL_20;
          }
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("rorationInterval")));
          if (v32)
          {
            v33 = v32;
            v5->_rotationInterval = (int)objc_msgSend(v32, "intValue");
            goto LABEL_20;
          }
          v40 = objc_alloc((Class)NSError);
          v56 = NSLocalizedDescriptionKey;
          v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("nil rotation interval"), &stru_1000D8750, 0));
          v57 = v52;
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1));
          v41 = objc_msgSend(v40, "initWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocty.sniffer"), -1, v37);

          goto LABEL_29;
        }
        v38 = objc_alloc((Class)NSError);
        v64 = NSLocalizedDescriptionKey;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("nil type"), &stru_1000D8750, 0));
        v65 = v52;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1));
        v19 = objc_msgSend(v38, "initWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocty.sniffer"), -2, v37);

        v36 = v39;
        v16 = 0;
        goto LABEL_24;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("uuid")));
      if (!v16)
      {
        v48 = objc_alloc((Class)NSError);
        v58 = NSLocalizedDescriptionKey;
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("nil UUID"), &stru_1000D8750, 0));
        v59 = v52;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1));
        v19 = objc_msgSend(v48, "initWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocty.sniffer"), -1, v37);

        v36 = v49;
LABEL_24:
        v17 = 0;
        v18 = 0;
        goto LABEL_30;
      }
      v30 = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v16);
      v17 = 0;
      v18 = 0;
      uuid = v5->_uuid;
      v5->_uuid = v30;
      v19 = v14;
LABEL_15:

      goto LABEL_16;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("channels")));
    v21 = objc_opt_class(NSArray, v20);
    v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v21, objc_opt_class(W5WiFiChannel, v22), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v53 = v14;
    v25 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v24, v18, &v53));
    v19 = v53;

    channels = v5->_channels;
    v5->_channels = (NSArray *)v25;

    if (v5->_channels)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("duration")));
      if (v27)
      {
        v17 = v27;
        v5->_duration = (double)(uint64_t)objc_msgSend(v27, "longValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("uuid")));
        if (!v16)
          goto LABEL_16;
        v28 = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v16);
        uuid = v5->_uuid;
        v5->_uuid = v28;
        goto LABEL_15;
      }
      v45 = objc_alloc((Class)NSError);
      v60 = NSLocalizedDescriptionKey;
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("nil duration"), &stru_1000D8750, 0));
      v61 = v52;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1));
      v43 = v45;
      v44 = -1;
    }
    else
    {
      v42 = objc_alloc((Class)NSError);
      v62 = NSLocalizedDescriptionKey;
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("nil channel"), &stru_1000D8750, 0));
      v63 = v52;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1));
      v43 = v42;
      v44 = -3;
    }
    v41 = objc_msgSend(v43, "initWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocty.sniffer"), v44, v37);

    v16 = 0;
    v17 = 0;
LABEL_29:
    v19 = v41;
    v36 = v51;
    goto LABEL_30;
  }
  v16 = 0;
  v19 = 0;
  v17 = 0;
  v18 = 0;
  v9 = 0;
LABEL_31:

  v46 = sub_10008F56C();
  v47 = objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v68 = 136315906;
    v69 = "-[W5PeerSnifferRequestPayload initWithRequest:]";
    v70 = 2080;
    v71 = "W5PeerSnifferRequestPayload.m";
    v72 = 1024;
    v73 = 77;
    v74 = 2114;
    v75 = v19;
    LODWORD(v50) = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v47, 0, "[wifivelocity] %s (%s:%u) init error (error='%{public}@')", &v68, v50);
  }

  v33 = 0;
  v5 = 0;
LABEL_20:

  return v5;
}

- (id)encode
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  int v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequestPayload version](self, "version"));

  if (!v4)
    goto LABEL_20;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequestPayload version](self, "version"));
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("version"));

  if (!-[W5PeerSnifferRequestPayload type](self, "type"))
  {
    v4 = 0;
LABEL_20:
    v9 = 0;
    v10 = 0;
    goto LABEL_17;
  }
  v6 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInteger:", -[W5PeerSnifferRequestPayload type](self, "type"));
  v25 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v25));
  v7 = v25;

  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));
  if ((id)-[W5PeerSnifferRequestPayload type](self, "type") != (id)1)
  {
    v9 = 0;
    v10 = v7;
    goto LABEL_8;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequestPayload channels](self, "channels"));
  v24 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v24));
  v10 = v24;

  if (v9)
  {
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("channels"));
    -[W5PeerSnifferRequestPayload duration](self, "duration");
    if (v11 == 0.0)
      goto LABEL_17;
    -[W5PeerSnifferRequestPayload duration](self, "duration");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("duration"));

LABEL_8:
    v13 = -[W5PeerSnifferRequestPayload type](self, "type");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequestPayload uuid](self, "uuid"));
    v15 = v14;
    if (v13 == 2)
    {

      if (!v15)
        goto LABEL_17;
    }
    else
    {

      if (!v15)
        goto LABEL_13;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequestPayload uuid](self, "uuid"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("uuid"));

LABEL_13:
    if (-[W5PeerSnifferRequestPayload noAutoStop](self, "noAutoStop"))
    {
      objc_msgSend(v3, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("noAutoStop"));
      if (-[W5PeerSnifferRequestPayload rotationInterval](self, "rotationInterval"))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[W5PeerSnifferRequestPayload rotationInterval](self, "rotationInterval")));
        objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("rorationInterval"));

      }
    }
    else
    {
      objc_msgSend(v3, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("noAutoStop"));
    }
    goto LABEL_17;
  }
  v20 = sub_10008F56C();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 136315906;
    v27 = "-[W5PeerSnifferRequestPayload encode]";
    v28 = 2080;
    v29 = "W5PeerSnifferRequestPayload.m";
    v30 = 1024;
    v31 = 102;
    v32 = 2114;
    v33 = v10;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v21, 0, "[wifivelocity] %s (%s:%u) failed to encode channels with error='%{public}@'", &v26, 38);
  }

  v9 = 0;
LABEL_17:
  if (!objc_msgSend(v3, "count"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: empty payload"), "-[W5PeerSnifferRequestPayload encode]"));
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v22, 0));

    objc_exception_throw(v23);
  }

  return v3;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Type:%ld, UUID:%@, Channels:%@, Duration:%d, NoAutoStop:%d, RotationInterval:%ld"), self->_type, self->_uuid, self->_channels, (int)self->_duration, self->_noAutoStop, self->_rotationInterval);
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  self->_version = (NSNumber *)a3;
}

- (NSArray)channels
{
  return self->_channels;
}

- (void)setChannels:(id)a3
{
  objc_storeStrong((id *)&self->_channels, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)noAutoStop
{
  return self->_noAutoStop;
}

- (void)setNoAutoStop:(BOOL)a3
{
  self->_noAutoStop = a3;
}

- (int64_t)rotationInterval
{
  return self->_rotationInterval;
}

- (void)setRotationInterval:(int64_t)a3
{
  self->_rotationInterval = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_channels, 0);
}

@end
