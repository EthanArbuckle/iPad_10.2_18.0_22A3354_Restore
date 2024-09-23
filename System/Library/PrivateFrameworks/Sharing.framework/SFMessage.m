@implementation SFMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFMessage)initWithCoder:(id)a3
{
  id v4;
  SFMessage *v5;
  uint64_t v6;
  NSData *bodyData;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSUUID *identifier;
  uint64_t v28;
  SFDevice *peerDevice;
  SFMessage *v30;
  uint64_t v32;
  void *v33;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SFMessage;
  v5 = -[SFMessage init](&v34, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("bodyData")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bodyData"));
      v6 = objc_claimAutoreleasedReturnValue();
      bodyData = v5->_bodyData;
      v5->_bodyData = (NSData *)v6;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("deviceIDs")))
    {
      v8 = (void *)MEMORY[0x1E0C99E60];
      v9 = objc_opt_class();
      objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("deviceIDs"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v12 = (void *)MEMORY[0x1E0C99DA0];
        v13 = *MEMORY[0x1E0C99778];
        _NSMethodExceptionProem();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "raise:format:", v13, CFSTR("%@: non-set value for key %@ : %@"), v14, CFSTR("deviceIDs"), v11);

      }
      objc_storeStrong((id *)&v5->_deviceIDs, v11);
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("expectsResponse")))
      v5->_expectsResponse = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("expectsResponse"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("headerFields")))
    {
      v33 = (void *)MEMORY[0x1E0C99E60];
      v32 = objc_opt_class();
      v15 = objc_opt_class();
      v16 = objc_opt_class();
      v17 = objc_opt_class();
      v18 = objc_opt_class();
      v19 = objc_opt_class();
      v20 = objc_opt_class();
      objc_msgSend(v33, "setWithObjects:", v32, v15, v16, v17, v18, v19, v20, objc_opt_class(), 0);
      v21 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("headerFields"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v23 = (void *)MEMORY[0x1E0C99DA0];
        v24 = *MEMORY[0x1E0C99778];
        _NSMethodExceptionProem();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "raise:format:", v24, CFSTR("%@: non-dictionary value for key %@ : %@"), v25, CFSTR("headerFields"), v22);

      }
      objc_storeStrong((id *)&v5->_headerFields, v22);
      v10 = (void *)v21;
    }
    else
    {
      v22 = v11;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("identifier")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
      v26 = objc_claimAutoreleasedReturnValue();
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v26;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("peerDevice")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerDevice"));
      v28 = objc_claimAutoreleasedReturnValue();
      peerDevice = v5->_peerDevice;
      v5->_peerDevice = (SFDevice *)v28;

    }
    v30 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSData *bodyData;
  NSSet *deviceIDs;
  NSDictionary *headerFields;
  NSUUID *identifier;
  SFDevice *peerDevice;
  id v10;

  v4 = a3;
  bodyData = self->_bodyData;
  v10 = v4;
  if (bodyData)
  {
    objc_msgSend(v4, "encodeObject:forKey:", bodyData, CFSTR("bodyData"));
    v4 = v10;
  }
  deviceIDs = self->_deviceIDs;
  if (deviceIDs)
  {
    objc_msgSend(v10, "encodeObject:forKey:", deviceIDs, CFSTR("deviceIDs"));
    v4 = v10;
  }
  if (self->_expectsResponse)
  {
    objc_msgSend(v10, "encodeBool:forKey:", 1, CFSTR("expectsResponse"));
    v4 = v10;
  }
  headerFields = self->_headerFields;
  if (headerFields)
  {
    objc_msgSend(v10, "encodeObject:forKey:", headerFields, CFSTR("headerFields"));
    v4 = v10;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend(v10, "encodeObject:forKey:", identifier, CFSTR("identifier"));
    v4 = v10;
  }
  peerDevice = self->_peerDevice;
  if (peerDevice)
  {
    objc_msgSend(v10, "encodeObject:forKey:", peerDevice, CFSTR("peerDevice"));
    v4 = v10;
  }

}

- (id)description
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *identifier;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  identifier = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v4 = 0;

  if (self->_identifier)
  {
    identifier = self->_identifier;
    NSAppendPrintF();
    v5 = v4;

    v4 = v5;
  }
  -[NSDictionary count](self->_headerFields, "count", identifier, self);
  -[NSData length](self->_bodyData, "length");
  NSAppendPrintF();
  v6 = v4;

  return v6;
}

- (void)invalidate
{
  id completionHandler;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (void)setBodyData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)expectsResponse
{
  return self->_expectsResponse;
}

- (void)setExpectsResponse:(BOOL)a3
{
  self->_expectsResponse = a3;
}

- (NSDictionary)headerFields
{
  return self->_headerFields;
}

- (void)setHeaderFields:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_peerDevice, a3);
}

- (SFSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSSet)deviceIDs
{
  return self->_deviceIDs;
}

- (void)setDeviceIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIDs, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_headerFields, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
