@implementation SiriTVLongPressButtonContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriTVLongPressButtonContext)initWithCoder:(id)a3
{
  id v4;
  SiriTVLongPressButtonContext *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriTVLongPressButtonContext;
  v5 = -[SiriLongPressButtonContext initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buttonDownTimestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    -[SiriLongPressButtonContext setButtonDownTimestamp:](v5, "setButtonDownTimestamp:");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeDeviceBluetoothIdentifier"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = -[__CFString length](v7, "length");
    v9 = &stru_1E91FDE50;
    if (v8)
      v9 = v7;
    v10 = v9;

    -[SiriTVLongPressButtonContext setActiveDeviceBluetoothIdentifier:](v5, "setActiveDeviceBluetoothIdentifier:", v10);
    -[SiriTVLongPressButtonContext setRemoteType:](v5, "setRemoteType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("remoteType")));
    -[SiriTVLongPressButtonContext setIsListening:](v5, "setIsListening:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isListening")));
    -[SiriTVLongPressButtonContext setIsSourcePTTEligible:](v5, "setIsSourcePTTEligible:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSourcePTTEligible")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SiriTVLongPressButtonContext;
  v4 = a3;
  -[SiriLongPressButtonContext encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[SiriLongPressButtonContext buttonDownTimestamp](self, "buttonDownTimestamp", v8.receiver, v8.super_class);
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("buttonDownTimestamp"));

  -[SiriTVLongPressButtonContext activeDeviceBluetoothIdentifier](self, "activeDeviceBluetoothIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("activeDeviceBluetoothIdentifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SiriTVLongPressButtonContext remoteType](self, "remoteType"), CFSTR("remoteType"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SiriTVLongPressButtonContext isListening](self, "isListening"), CFSTR("isListening"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SiriTVLongPressButtonContext isSourcePTTEligible](self, "isSourcePTTEligible"), CFSTR("isSourcePTTEligible"));

}

- (void)setSourcePTTEligibility:(BOOL)a3
{
  self->_isSourcePTTEligible = a3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SiriContext contextOverride](self, "contextOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[SiriLongPressButtonContext buttonDownTimestamp](self, "buttonDownTimestamp");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriTVLongPressButtonContext activeDeviceBluetoothIdentifier](self, "activeDeviceBluetoothIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SiriTVLongPressButtonContext remoteType](self, "remoteType") - 1;
  if (v8 > 5)
    v9 = CFSTR("SiriTVRemoteTypeUnknown");
  else
    v9 = off_1E91FCF60[v8];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SiriTVLongPressButtonContext contextOverride:%@ buttonDownTimestamp:%@,activeDeviceBluetoothIdentifier:%@,remoteType:%@,isListening:%d,isSourcePTTEligible:%d>"), v4, v6, v7, v9, -[SiriTVLongPressButtonContext isListening](self, "isListening"), -[SiriTVLongPressButtonContext isSourcePTTEligible](self, "isSourcePTTEligible"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isPTTEligible
{
  int v3;
  void *v4;
  unint64_t v5;

  v3 = objc_msgSend(MEMORY[0x1E0CFE8B8], "isTVPushToTalkEnabled");
  if (v3)
  {
    v3 = _os_feature_enabled_impl();
    if (v3)
    {
      v4 = (void *)*MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEBUG))
        -[SiriTVLongPressButtonContext isPTTEligible].cold.1(v4, self);
      v5 = -[SiriTVLongPressButtonContext remoteType](self, "remoteType");
      LOBYTE(v3) = self->_isSourcePTTEligible || v5 == 6;
    }
  }
  return v3;
}

- (NSString)activeDeviceBluetoothIdentifier
{
  return self->_activeDeviceBluetoothIdentifier;
}

- (void)setActiveDeviceBluetoothIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)remoteType
{
  return self->_remoteType;
}

- (void)setRemoteType:(unint64_t)a3
{
  self->_remoteType = a3;
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->_isListening = a3;
}

- (BOOL)isSourcePTTEligible
{
  return self->_isSourcePTTEligible;
}

- (void)setIsSourcePTTEligible:(BOOL)a3
{
  self->_isSourcePTTEligible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDeviceBluetoothIdentifier, 0);
}

- (void)isPTTEligible
{
  NSObject *v3;
  uint64_t v4;
  const __CFString *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = objc_msgSend(a2, "remoteType");
  if ((unint64_t)(v4 - 1) > 5)
    v5 = CFSTR("SiriTVRemoteTypeUnknown");
  else
    v5 = off_1E91FCF60[v4 - 1];
  v6 = 136315394;
  v7 = "-[SiriTVLongPressButtonContext isPTTEligible]";
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEBUG, "%s #ptt Remote Type is %@", (uint8_t *)&v6, 0x16u);

}

@end
