@implementation SidecarDisplaySendingDeviceSessionState

- (SidecarDisplaySendingDeviceSessionState)init
{
  -[SidecarDisplaySendingDeviceSessionState doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  objc_exception_throw(0);
}

- (SidecarDisplaySendingDeviceSessionState)initWithDevice:(id)a3 sessionState:(int64_t)a4 visualDetectability:(int64_t)a5
{
  id v9;
  SidecarDisplaySendingDeviceSessionState *v10;
  SidecarDisplaySendingDeviceSessionState *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SidecarDisplaySendingDeviceSessionState;
  v10 = -[SidecarDisplaySendingDeviceSessionState init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_device, a3);
    v11->_sessionState = a4;
    v11->_visualDetectability = a5;
  }

  return v11;
}

- (SidecarDisplaySendingDeviceSessionState)initWithDevice:(id)a3 sessionState:(int64_t)a4
{
  return -[SidecarDisplaySendingDeviceSessionState initWithDevice:sessionState:visualDetectability:](self, "initWithDevice:sessionState:visualDetectability:", a3, a4, 0);
}

- (SidecarDisplaySendingDeviceSessionState)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  SidecarDisplaySendingDeviceSessionState *v9;

  v4 = a3;
  v5 = objc_opt_class();
  decodeObject(v4, CFSTR("device"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = decodeInteger(v4, CFSTR("sessionState"));
  v8 = decodeInteger(v4, CFSTR("visualDetectability"));

  v9 = -[SidecarDisplaySendingDeviceSessionState initWithDevice:sessionState:visualDetectability:](self, "initWithDevice:sessionState:visualDetectability:", v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  SidecarDevice *device;
  id v5;

  device = self->_device;
  v5 = a3;
  encodeObject(v5, CFSTR("device"), device);
  encodeInteger(v5, CFSTR("sessionState"), self->_sessionState);
  encodeInteger(v5, CFSTR("visualDetectability"), self->_visualDetectability);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  unint64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SidecarDisplaySendingDeviceSessionState device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SidecarDisplaySendingDeviceSessionState visualDetectability](self, "visualDetectability");
  if (v8 > 2)
    v9 = CFSTR("UnrecognizedValue");
  else
    v9 = off_24E5E1488[v8];
  v10 = v9;
  v11 = -[SidecarDisplaySendingDeviceSessionState sessionState](self, "sessionState");
  if (v11 > 3)
    v12 = CFSTR("Unknown");
  else
    v12 = off_24E5E0ED0[v11];
  v13 = v12;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ device identifier: [%@], visualDetectability: [%@], sessionState: [%@]"), v5, v7, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (SidecarDevice)device
{
  return self->_device;
}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (int64_t)visualDetectability
{
  return self->_visualDetectability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  objc_exception_throw(0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
