@implementation ATXWiredAudioDisconnectedTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 13;
}

- (ATXWiredAudioDisconnectedTrigger)initWithDeviceIdentifier:(id)a3
{
  id v5;
  ATXWiredAudioDisconnectedTrigger *v6;
  ATXWiredAudioDisconnectedTrigger *v7;
  ATXWiredAudioDisconnectedTrigger *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXWiredAudioDisconnectedTrigger;
  v6 = -[ATXWiredAudioDisconnectedTrigger init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_deviceIdentifier, a3);
    v8 = v7;
  }

  return v7;
}

- (ATXWiredAudioDisconnectedTrigger)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXWiredAudioDisconnectedTrigger *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioDeviceIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXWiredAudioDisconnectedTrigger initWithDeviceIdentifier:](self, "initWithDeviceIdentifier:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_deviceIdentifier, CFSTR("audioDeviceIdentifier"));
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
