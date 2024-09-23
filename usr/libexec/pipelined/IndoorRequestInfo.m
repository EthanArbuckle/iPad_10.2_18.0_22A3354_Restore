@implementation IndoorRequestInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_lastRelevant, 0);
  objc_storeStrong((id *)&self->_floorUuid, 0);
  objc_storeStrong((id *)&self->_venueUuid, 0);
}

- (NSString)venueUuid
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)floorUuid
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (id)initFloor:(id)a3 inVenue:(id)a4 withContext:(int64_t)a5 requestFor:(int)a6 withinSession:(int)a7 lastRelevant:(id)a8 allowCellularDownloadTile:(BOOL)a9 requestUUID:(id)a10
{
  id v16;
  id v17;
  id v18;
  IndoorRequestInfo *v19;
  IndoorRequestInfo *v20;
  IndoorRequestInfo *v21;
  id v24;
  objc_super v25;

  v16 = a3;
  v17 = a4;
  v18 = a8;
  v24 = a10;
  v25.receiver = self;
  v25.super_class = (Class)IndoorRequestInfo;
  v19 = -[IndoorRequestInfo init](&v25, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_floorUuid, a3);
    objc_storeStrong((id *)&v20->_venueUuid, a4);
    v20->_context = a5;
    v20->_session = a7;
    v20->_kind = a6;
    objc_storeStrong((id *)&v20->_lastRelevant, a8);
    objc_storeStrong((id *)&v20->_requestUUID, a10);
    v20->_allowCellularDownloadTile = a9;
    v21 = v20;
  }

  return v20;
}

- (NSUUID)requestUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)indoorRequestInfoFromRequest:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  char isKindOfClass;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  char v16;
  id v17;
  id v18;
  id v20;
  const std::string::value_type *v21;
  void *__p[2];
  void *v23[2];
  char v24;
  std::string v25;
  std::string v26;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLProtocol propertyForKey:inRequest:](NSURLProtocol, "propertyForKey:inRequest:", CFSTR("com.apple.pipelined.RequestInfo"), v3));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
  v21 = (const std::string::value_type *)objc_msgSend(v5, "UTF8String");
  if (!v4)
  {
    sub_1000D5048(v23, "");
    sub_100218440("No indoor request information in NSURLRequest: ", &v25);
    sub_1002CF860(&v21, &v26);
    sub_100174738((uint64_t)v23, (uint64_t)&v25, 2);
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v26.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_8:
        if ((v24 & 0x80000000) == 0)
          goto LABEL_9;
LABEL_24:
        operator delete(v23[0]);
LABEL_9:
        sub_1000F2AE4((uint64_t)__p);
      }
    }
    else if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_8;
    }
    operator delete(v25.__r_.__value_.__l.__data_);
    if ((v24 & 0x80000000) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }

  v6 = objc_opt_class(NSData);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);
  v8 = objc_msgSend((id)objc_opt_class(v4), "description");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v8));
  v21 = (const std::string::value_type *)objc_msgSend(v9, "UTF8String");
  if ((isKindOfClass & 1) == 0)
  {
    sub_1000D5048(v23, "");
    sub_10023B1A0("Invalid indoor request information in NSURLRequest. Type = ", &v25);
    sub_1002CF860(&v21, &v26);
    sub_100174738((uint64_t)v23, (uint64_t)&v25, 2);
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v26.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_12:
        if ((v24 & 0x80000000) == 0)
          goto LABEL_13;
LABEL_27:
        operator delete(v23[0]);
LABEL_13:
        sub_1000F2AE4((uint64_t)__p);
      }
    }
    else if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_12;
    }
    operator delete(v25.__r_.__value_.__l.__data_);
    if ((v24 & 0x80000000) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }

  v20 = 0;
  v10 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(IndoorRequestInfo), v4, &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v20;
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description")));
  v21 = (const std::string::value_type *)objc_msgSend(v13, "UTF8String");
  if (!v11)
  {
    sub_1000D5048(v23, "");
    sub_100169760("Hit an error while unarchiving: %s", &v25);
    sub_1002CF860(&v21, &v26);
    sub_100174738((uint64_t)v23, (uint64_t)&v25, 2);
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v26.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_16:
        if ((v24 & 0x80000000) == 0)
          goto LABEL_17;
LABEL_30:
        operator delete(v23[0]);
LABEL_17:
        sub_1000F2AE4((uint64_t)__p);
      }
    }
    else if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_16;
    }
    operator delete(v25.__r_.__value_.__l.__data_);
    if ((v24 & 0x80000000) == 0)
      goto LABEL_17;
    goto LABEL_30;
  }

  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
  v21 = (const std::string::value_type *)objc_msgSend(v14, "UTF8String");

  v15 = objc_opt_class(IndoorRequestInfo);
  v16 = objc_opt_isKindOfClass(v11, v15);
  v17 = objc_msgSend((id)objc_opt_class(v11), "description");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v17));
  v21 = (const std::string::value_type *)objc_msgSend(v18, "UTF8String");
  if ((v16 & 1) == 0)
  {
    sub_1000D5048(v23, "");
    sub_10023B1A0("Invalid indoor request information in NSURLRequest. Type = ", &v25);
    sub_1002CF860(&v21, &v26);
    sub_100174738((uint64_t)v23, (uint64_t)&v25, 2);
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v26.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_20:
        if ((v24 & 0x80000000) == 0)
          goto LABEL_21;
LABEL_33:
        operator delete(v23[0]);
LABEL_21:
        sub_1000F2AE4((uint64_t)__p);
      }
    }
    else if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_20;
    }
    operator delete(v25.__r_.__value_.__l.__data_);
    if ((v24 & 0x80000000) == 0)
      goto LABEL_21;
    goto LABEL_33;
  }

  return v11;
}

+ (id)indoorRequestInfoFromTask:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "originalRequest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IndoorRequestInfo indoorRequestInfoFromRequest:](IndoorRequestInfo, "indoorRequestInfoFromRequest:", v3));

  return v4;
}

+ (BOOL)isMetadata:(int)a3
{
  return a3 == 0;
}

- (IndoorRequestInfo)init
{
  -[IndoorRequestInfo doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  abort();
}

- (IndoorRequestInfo)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  signed int v9;
  unsigned int v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  IndoorRequestInfo *v16;
  uint64_t v18;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("venueUuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("floorUuid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("locationContext"));
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFloorMetadata"));
  v11 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("session"));
  v12 = objc_alloc((Class)NSDate);
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lastRelevant"));
  v13 = objc_msgSend(v12, "initWithTimeIntervalSinceReferenceDate:");
  v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("requestUUID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  LOBYTE(v18) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowCellularDownloadTile"));
  v16 = -[IndoorRequestInfo initFloor:inVenue:withContext:requestFor:withinSession:lastRelevant:allowCellularDownloadTile:requestUUID:](self, "initFloor:inVenue:withContext:requestFor:withinSession:lastRelevant:allowCellularDownloadTile:requestUUID:", v8, v6, v9, v10 ^ 1, v11, v13, v18, v15);

  return v16;
}

- (id)initFromRequest:(id)a3 updatedRelevancy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  void *v14;
  id v15;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "floorUuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "venueUuid"));
  v10 = objc_msgSend(v6, "context");
  v11 = objc_msgSend(v6, "kind");
  v12 = objc_msgSend(v6, "session");
  v13 = objc_msgSend(v6, "allowCellularDownloadTile");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestUUID"));
  LOBYTE(v17) = v13;
  v15 = -[IndoorRequestInfo initFloor:inVenue:withContext:requestFor:withinSession:lastRelevant:allowCellularDownloadTile:requestUUID:](self, "initFloor:inVenue:withContext:requestFor:withinSession:lastRelevant:allowCellularDownloadTile:requestUUID:", v8, v9, v10, v11, v12, v7, v17, v14);

  return v15;
}

- (void)setOnRequest:(id)a3
{
  id v4;
  _BOOL8 v5;
  id v6;
  void *v7;
  void *v8[2];
  char v9;
  std::string __p;

  v4 = a3;
  v5 = +[IndoorRequestInfo isMetadata:](IndoorRequestInfo, "isMetadata:", -[IndoorRequestInfo kind](self, "kind"))|| -[IndoorRequestInfo allowCellularDownloadTile](self, "allowCellularDownloadTile");
  objc_msgSend(v4, "setAllowsCellularAccess:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:](NSKeyedArchiver, "archivedDataWithRootObject:", self));
  if (!v6)
  {
    sub_1000D5048(v8, "");
    sub_1002FF264("Couldn't serialize self", &__p);
    sub_100174738((uint64_t)v8, (uint64_t)&__p, 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v9 < 0)
      operator delete(v8[0]);
    sub_10015AD4C((uint64_t)&v7);
  }

  +[NSURLProtocol setProperty:forKey:inRequest:](NSURLProtocol, "setProperty:forKey:inRequest:", v6, CFSTR("com.apple.pipelined.RequestInfo"), v4);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_venueUuid, CFSTR("venueUuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_floorUuid, CFSTR("floorUuid"));
  objc_msgSend(v5, "encodeInt:forKey:", LODWORD(self->_context), CFSTR("locationContext"));
  objc_msgSend(v5, "encodeBool:forKey:", +[IndoorRequestInfo isMetadata:](IndoorRequestInfo, "isMetadata:", self->_kind), CFSTR("isFloorMetadata"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_session, CFSTR("session"));
  -[NSDate timeIntervalSinceReferenceDate](self->_lastRelevant, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("lastRelevant"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IndoorRequestInfo requestUUID](self, "requestUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("requestUUID"));

  objc_msgSend(v5, "encodeBool:forKey:", -[IndoorRequestInfo allowCellularDownloadTile](self, "allowCellularDownloadTile"), CFSTR("allowCellularDownloadTile"));
}

- (id)description
{
  uint64_t v3;
  const __CFString *v4;
  int kind;
  uint64_t session;
  const __CFString *v7;
  int64_t context;
  id v9;
  NSString *venueUuid;
  NSString *floorUuid;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  id v16;

  v3 = 0;
  v4 = CFSTR("T");
  kind = self->_kind;
  session = self->_session;
  if (kind != 1)
    v4 = 0;
  if (kind)
    v7 = v4;
  else
    v7 = CFSTR("C");
  if (session <= 2)
    v3 = (uint64_t)*(&off_100407660 + session);
  context = self->_context;
  v9 = objc_alloc((Class)NSString);
  venueUuid = self->_venueUuid;
  floorUuid = self->_floorUuid;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IndoorRequestInfo requestUUID](self, "requestUUID"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
  v14 = (void *)v13;
  v15 = CFSTR("I");
  if (context)
    v15 = 0;
  if (context == 1)
    v15 = CFSTR("R");
  v16 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@|%@|%@|%@|%@|%@"), v3, v7, v15, venueUuid, floorUuid, v13);

  return v16;
}

- (int64_t)context
{
  return self->_context;
}

- (NSDate)lastRelevant
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (int)session
{
  return self->_session;
}

- (int)kind
{
  return self->_kind;
}

- (BOOL)allowCellularDownloadTile
{
  return self->_allowCellularDownloadTile;
}

@end
