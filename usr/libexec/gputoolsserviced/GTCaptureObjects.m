@implementation GTCaptureObjects

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureObjects)initWithCoder:(id)a3
{
  id v4;
  GTCaptureObjects *v5;
  id v6;
  uint64_t v7;
  NSArray *devices;
  id v9;
  uint64_t v10;
  NSArray *commandQueues;
  id v12;
  uint64_t v13;
  NSArray *captureScopes;
  id v15;
  uint64_t v16;
  NSArray *metalLayers;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GTCaptureObjects;
  v5 = -[GTCaptureObjects init](&v19, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(DYGTMTLDeviceProfile), CFSTR("devices"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    devices = v5->_devices;
    v5->_devices = (NSArray *)v7;

    v9 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(DYGTMTLCommandQueueInfo), CFSTR("commandQueues"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    commandQueues = v5->_commandQueues;
    v5->_commandQueues = (NSArray *)v10;

    v12 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(DYGTMTLCaptureScopeInfo), CFSTR("captureScopes"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    captureScopes = v5->_captureScopes;
    v5->_captureScopes = (NSArray *)v13;

    v15 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(DYGTCAMetalLayerInfo), CFSTR("metalLayers"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    metalLayers = v5->_metalLayers;
    v5->_metalLayers = (NSArray *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *devices;
  id v5;

  devices = self->_devices;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", devices, CFSTR("devices"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_commandQueues, CFSTR("commandQueues"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_captureScopes, CFSTR("captureScopes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metalLayers, CFSTR("metalLayers"));

}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)commandQueues
{
  return self->_commandQueues;
}

- (void)setCommandQueues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)captureScopes
{
  return self->_captureScopes;
}

- (void)setCaptureScopes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)metalLayers
{
  return self->_metalLayers;
}

- (void)setMetalLayers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalLayers, 0);
  objc_storeStrong((id *)&self->_captureScopes, 0);
  objc_storeStrong((id *)&self->_commandQueues, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
