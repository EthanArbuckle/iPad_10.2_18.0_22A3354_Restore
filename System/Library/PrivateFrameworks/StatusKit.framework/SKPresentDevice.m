@implementation SKPresentDevice

- (SKPresentDevice)initWithHandle:(id)a3 deviceIdentifier:(id)a4 deviceTokenURI:(id)a5 payload:(id)a6 assertionTime:(id)a7 selfHandle:(BOOL)a8 selfDevice:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  void *v19;
  SKPresentDevice *v20;
  SKPresentDevice *v21;
  id v23;
  id v24;
  objc_super v25;

  v16 = a3;
  v17 = a4;
  v24 = a5;
  v23 = a6;
  v18 = a7;
  if (!v16)
    -[SKPresentDevice initWithHandle:deviceIdentifier:deviceTokenURI:payload:assertionTime:selfHandle:selfDevice:].cold.1();
  if (!v17)
    -[SKPresentDevice initWithHandle:deviceIdentifier:deviceTokenURI:payload:assertionTime:selfHandle:selfDevice:].cold.2();
  v19 = v18;
  if (!v18)
    -[SKPresentDevice initWithHandle:deviceIdentifier:deviceTokenURI:payload:assertionTime:selfHandle:selfDevice:].cold.3();
  v25.receiver = self;
  v25.super_class = (Class)SKPresentDevice;
  v20 = -[SKPresentDevice init](&v25, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_handle, a3);
    objc_storeStrong((id *)&v21->_deviceIdentifier, a4);
    objc_storeStrong((id *)&v21->_deviceTokenURI, a5);
    objc_storeStrong((id *)&v21->_assertionTime, a7);
    v21->_isSelfDevice = a9;
    v21->_isSelfHandle = a8;
    objc_storeStrong((id *)&v21->_presencePayload, a6);
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  SKHandle *handle;
  id v5;

  handle = self->_handle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", handle, CFSTR("handle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceIdentifier, CFSTR("deviceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceTokenURI, CFSTR("deviceTokenURI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_presencePayload, CFSTR("payload"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assertionTime, CFSTR("assertionTime"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSelfHandle, CFSTR("selfHandle"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSelfDevice, CFSTR("selfDevice"));

}

- (SKPresentDevice)initWithCoder:(id)a3
{
  id v4;
  SKPresentDevice *v5;
  uint64_t v6;
  SKHandle *handle;
  uint64_t v8;
  NSString *deviceIdentifier;
  uint64_t v10;
  NSString *deviceTokenURI;
  uint64_t v12;
  NSDate *assertionTime;
  uint64_t v14;
  SKPresencePayload *presencePayload;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SKPresentDevice;
  v5 = -[SKPresentDevice init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handle"));
    v6 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (SKHandle *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceTokenURI"));
    v10 = objc_claimAutoreleasedReturnValue();
    deviceTokenURI = v5->_deviceTokenURI;
    v5->_deviceTokenURI = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assertionTime"));
    v12 = objc_claimAutoreleasedReturnValue();
    assertionTime = v5->_assertionTime;
    v5->_assertionTime = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
    v14 = objc_claimAutoreleasedReturnValue();
    presencePayload = v5->_presencePayload;
    v5->_presencePayload = (SKPresencePayload *)v14;

    v5->_isSelfHandle = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("selfHandle"));
    v5->_isSelfDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("selfDevice"));
  }

  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  SKHandle *handle;
  objc_super v5;
  uint8_t buf[4];
  SKHandle *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  +[SKPresentDevice logger](SKPresentDevice, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    handle = self->_handle;
    *(_DWORD *)buf = 138412290;
    v7 = handle;
    _os_log_impl(&dword_213251000, v3, OS_LOG_TYPE_DEFAULT, "Deallocing SKPresentDevice for handle \"%@\", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)SKPresentDevice;
  -[SKPresentDevice dealloc](&v5, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[SKPresentDevice deviceIdentifier](self, "deviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[SKPresentDevice deviceIdentifier](self, "deviceIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        -[SKPresentDevice presencePayload](self, "presencePayload");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "presencePayload");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SKPresentDevice deviceIdentifier](self, "deviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SKPresentDevice presencePayload](self, "presencePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SKPresentDevice handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKPresentDevice deviceIdentifier](self, "deviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKPresentDevice deviceTokenURI](self, "deviceTokenURI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKPresentDevice presencePayload](self, "presencePayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKPresentDevice assertionTime](self, "assertionTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; handle = \"%@\"; deviceIdentifier = \"%@\"; deviceTokenURI = \"%@\"; payload = \"%@\"; assertionTime = \"%@\"; selfDevice = \"%d\"; selfHandle = \"%d\">"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    -[SKPresentDevice isSelfDevice](self, "isSelfDevice"),
    -[SKPresentDevice isSelfHandle](self, "isSelfHandle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)logger
{
  if (logger_onceToken_5 != -1)
    dispatch_once(&logger_onceToken_5, &__block_literal_global_5);
  return (id)logger__logger_5;
}

void __25__SKPresentDevice_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKPresentDevice");
  v1 = (void *)logger__logger_5;
  logger__logger_5 = (uint64_t)v0;

}

- (BOOL)isSelfDevice
{
  return self->_isSelfDevice;
}

- (BOOL)isSelfHandle
{
  return self->_isSelfHandle;
}

- (SKHandle)handle
{
  return self->_handle;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)deviceTokenURI
{
  return self->_deviceTokenURI;
}

- (SKPresencePayload)presencePayload
{
  return self->_presencePayload;
}

- (NSDate)assertionTime
{
  return self->_assertionTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionTime, 0);
  objc_storeStrong((id *)&self->_presencePayload, 0);
  objc_storeStrong((id *)&self->_deviceTokenURI, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

- (void)initWithHandle:deviceIdentifier:deviceTokenURI:payload:assertionTime:selfHandle:selfDevice:.cold.1()
{
  __assert_rtn("-[SKPresentDevice initWithHandle:deviceIdentifier:deviceTokenURI:payload:assertionTime:selfHandle:selfDevice:]", "SKPresentDevice.m", 33, "handle");
}

- (void)initWithHandle:deviceIdentifier:deviceTokenURI:payload:assertionTime:selfHandle:selfDevice:.cold.2()
{
  __assert_rtn("-[SKPresentDevice initWithHandle:deviceIdentifier:deviceTokenURI:payload:assertionTime:selfHandle:selfDevice:]", "SKPresentDevice.m", 34, "deviceIdentifier");
}

- (void)initWithHandle:deviceIdentifier:deviceTokenURI:payload:assertionTime:selfHandle:selfDevice:.cold.3()
{
  __assert_rtn("-[SKPresentDevice initWithHandle:deviceIdentifier:deviceTokenURI:payload:assertionTime:selfHandle:selfDevice:]", "SKPresentDevice.m", 35, "assertionTime");
}

@end
