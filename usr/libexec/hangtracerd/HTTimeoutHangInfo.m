@implementation HTTimeoutHangInfo

- (HTTimeoutHangInfo)initWithServiceName:(id)a3 threadID:(unint64_t)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 saveTailspin:(BOOL)a7 subType:(int64_t)a8 userActionData:(id)a9 isThirdPartyDevSupportModeHang:(BOOL)a10 processInfo:(id)a11 captureMicroHang:(BOOL)a12
{
  id v18;
  id v19;
  id v20;
  HTTimeoutHangInfo *v21;
  NSString *v22;
  NSString *serviceName;
  NSData *v24;
  NSData *userActionData;
  objc_super v27;

  v18 = a3;
  v19 = a9;
  v20 = a11;
  v27.receiver = self;
  v27.super_class = (Class)HTTimeoutHangInfo;
  v21 = -[HTTimeoutHangInfo init](&v27, "init");
  if (v21)
  {
    v22 = (NSString *)objc_msgSend(v18, "copy");
    serviceName = v21->_serviceName;
    v21->_serviceName = v22;

    v21->_threadID = a4;
    v21->_startTime = a5;
    v21->_saveTailspin = a7;
    v21->_endTime = a6;
    v21->_subtype = a8;
    v24 = (NSData *)objc_msgSend(v19, "copy");
    userActionData = v21->_userActionData;
    v21->_userActionData = v24;

    v21->_isThirdPartyDevSupportModeHang = a10;
    objc_storeStrong((id *)&v21->_processInfo, a11);
    v21->_captureMicroHang = a12;
  }

  return v21;
}

- (void)recordHang
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _BOOL8 v7;
  int64_t v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[HTTimeoutHangInfo processInfo](self, "processInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HTTimeoutHangInfo serviceName](self, "serviceName"));
  v4 = -[HTTimeoutHangInfo threadID](self, "threadID");
  v5 = -[HTTimeoutHangInfo startTime](self, "startTime");
  v6 = -[HTTimeoutHangInfo endTime](self, "endTime");
  v7 = -[HTTimeoutHangInfo saveTailspin](self, "saveTailspin");
  v8 = -[HTTimeoutHangInfo subtype](self, "subtype");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HTTimeoutHangInfo userActionData](self, "userActionData"));
  v10 = -[HTTimeoutHangInfo isThirdPartyDevSupportModeHang](self, "isThirdPartyDevSupportModeHang");
  BYTE1(v11) = -[HTTimeoutHangInfo captureMicroHang](self, "captureMicroHang");
  LOBYTE(v11) = v10;
  objc_msgSend(v12, "recordHang:threadID:startTime:endTime:saveTailspin:subtype:userActionData:isThirdPartyDevSupportModeHang:captureMicroHang:", v3, v4, v5, v6, v7, v8, v9, v11);

}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (unint64_t)endTime
{
  return self->_endTime;
}

- (BOOL)saveTailspin
{
  return self->_saveTailspin;
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (NSData)userActionData
{
  return self->_userActionData;
}

- (BOOL)isThirdPartyDevSupportModeHang
{
  return self->_isThirdPartyDevSupportModeHang;
}

- (HTProcessInfo)processInfo
{
  return self->_processInfo;
}

- (BOOL)captureMicroHang
{
  return self->_captureMicroHang;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_userActionData, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
