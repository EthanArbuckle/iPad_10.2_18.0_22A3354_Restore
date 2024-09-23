@implementation NIServerSpatialInteractionPayload

- (NIServerSpatialInteractionPayload)initWithData:(id)a3
{
  id v4;
  NIServerSpatialInteractionPayload *v5;
  NIServerSpatialInteractionPayload *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NIServerSpatialInteractionPayload;
  v5 = -[NIServerSpatialInteractionPayload init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    *(_DWORD *)&v5->_findingEnabled = 0;
    -[NIServerSpatialInteractionPayload _parseData:](v5, "_parseData:", v4);
  }

  return v6;
}

- (void)_parseData:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _BYTE v7[2];
  __int16 v8;

  v4 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
  {
    sub_1003DF94C((uint64_t)v4, v5);
    if (!v4)
      goto LABEL_8;
  }
  else if (!v4)
  {
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(v4, "length") >= 5)
  {
    objc_msgSend(v4, "getBytes:length:", v7, 5);
    if ((v7[0] & 1) != 0)
    {
      self->_findingEnabled = 1;
      self->_findingStatus = v7[1];
      *(_WORD *)&self->_findingConfig = v8;
    }
    v6 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
      sub_1003DF8B0((unsigned __int8 *)self, v6);
  }
LABEL_8:

}

- (BOOL)findingEnabled
{
  return self->_findingEnabled;
}

- (unsigned)findingStatus
{
  return self->_findingStatus;
}

- (unsigned)findingConfig
{
  return self->_findingConfig;
}

- (unsigned)findingConfig2
{
  return self->_findingConfig2;
}

@end
