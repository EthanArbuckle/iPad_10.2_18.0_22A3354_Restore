@implementation SiriTVActivationSource

+ (id)activationSourceForIdentifier:(int64_t)a3
{
  id v3;
  SiriTVLongPressButtonContext *v4;

  v3 = -[SiriLongPressButtonSource _initWithButtonIdentifier:]([SiriTVActivationSource alloc], "_initWithButtonIdentifier:", a3);
  objc_msgSend(v3, "setLongPressInterval:", 0.0);
  v4 = objc_alloc_init(SiriTVLongPressButtonContext);
  -[SiriLongPressButtonContext setButtonDownTimestamp:](v4, "setButtonDownTimestamp:", 0.0);
  objc_msgSend(v3, "setContext:", v4);

  return v3;
}

- (void)setDeviceIdentifier:(id)a3
{
  NSString *v4;
  NSString *deviceIdentifier;
  void *v6;
  char isKindOfClass;
  const __CFString *v8;
  id v9;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  deviceIdentifier = self->_deviceIdentifier;
  self->_deviceIdentifier = v4;

  -[SiriTVActivationSource context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SiriTVActivationSource context](self, "context");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (-[NSString length](self->_deviceIdentifier, "length"))
      v8 = (const __CFString *)self->_deviceIdentifier;
    else
      v8 = &stru_1E91FDE50;
    objc_msgSend(v9, "setActiveDeviceBluetoothIdentifier:", v8);

  }
}

- (void)setRemoteType:(unint64_t)a3
{
  void *v5;
  char isKindOfClass;
  id v7;

  self->_remoteType = a3;
  -[SiriTVActivationSource context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SiriTVActivationSource context](self, "context");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteType:", a3);

  }
}

- (void)setListening:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char isKindOfClass;
  id v7;

  v3 = a3;
  -[SiriTVActivationSource context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SiriTVActivationSource context](self, "context");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIsListening:", v3);

  }
}

- (id)_deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setPTTEligible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char isKindOfClass;
  id v7;

  v3 = a3;
  -[SiriTVActivationSource context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SiriTVActivationSource context](self, "context");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSourcePTTEligibility:", v3);

  }
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (unint64_t)remoteType
{
  return self->_remoteType;
}

- (double)longPressInterval
{
  return self->_longPressInterval;
}

- (void)setLongPressInterval:(double)a3
{
  self->_longPressInterval = a3;
}

- (SiriLongPressButtonContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
