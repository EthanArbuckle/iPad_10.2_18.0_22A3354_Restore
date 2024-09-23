@implementation TUNearbyDeviceHandleCapabilities

- (TUNearbyDeviceHandleCapabilities)initWithAVLessCapable:(BOOL)a3 lagunaCapable:(BOOL)a4 audioCallCapable:(BOOL)a5 telephonyRelayCapable:(BOOL)a6
{
  TUNearbyDeviceHandleCapabilities *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TUNearbyDeviceHandleCapabilities;
  result = -[TUNearbyDeviceHandleCapabilities init](&v11, sel_init);
  if (result)
  {
    result->_avLessCapable = a3;
    result->_lagunaCapable = a4;
    result->_audioCallCapable = a5;
    result->_telephonyRelayCapable = a6;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR(" isAVLessCapable=%d"), -[TUNearbyDeviceHandleCapabilities isAVLessCapable](self, "isAVLessCapable"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" isLagunaCapable=%d"), -[TUNearbyDeviceHandleCapabilities isLagunaCapable](self, "isLagunaCapable"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" isAudioCallCapable=%d"), -[TUNearbyDeviceHandleCapabilities isAudioCallCapable](self, "isAudioCallCapable"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" isTelephonyRelayCapable=%d"), -[TUNearbyDeviceHandleCapabilities isTelephonyRelayCapable](self, "isTelephonyRelayCapable"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUNearbyDeviceHandleCapabilities)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  NSStringFromSelector(sel_isAVLessCapable);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", v5);

  NSStringFromSelector(sel_isLagunaCapable);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeBoolForKey:", v7);

  NSStringFromSelector(sel_isAudioCallCapable);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeBoolForKey:", v9);

  NSStringFromSelector(sel_isTelephonyRelayCapable);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeBoolForKey:", v11);

  return -[TUNearbyDeviceHandleCapabilities initWithAVLessCapable:lagunaCapable:audioCallCapable:telephonyRelayCapable:](self, "initWithAVLessCapable:lagunaCapable:audioCallCapable:telephonyRelayCapable:", v6, v8, v10, v12);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _BOOL8 v11;
  id v12;

  v4 = a3;
  v5 = -[TUNearbyDeviceHandleCapabilities isAVLessCapable](self, "isAVLessCapable");
  NSStringFromSelector(sel_isAVLessCapable);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6);

  v7 = -[TUNearbyDeviceHandleCapabilities isLagunaCapable](self, "isLagunaCapable");
  NSStringFromSelector(sel_isLagunaCapable);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v7, v8);

  v9 = -[TUNearbyDeviceHandleCapabilities isAudioCallCapable](self, "isAudioCallCapable");
  NSStringFromSelector(sel_isAudioCallCapable);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v9, v10);

  v11 = -[TUNearbyDeviceHandleCapabilities isTelephonyRelayCapable](self, "isTelephonyRelayCapable");
  NSStringFromSelector(sel_isTelephonyRelayCapable);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v11, v12);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAVLessCapable:lagunaCapable:audioCallCapable:telephonyRelayCapable:", -[TUNearbyDeviceHandleCapabilities isAVLessCapable](self, "isAVLessCapable"), -[TUNearbyDeviceHandleCapabilities isLagunaCapable](self, "isLagunaCapable"), -[TUNearbyDeviceHandleCapabilities isAudioCallCapable](self, "isAudioCallCapable"), -[TUNearbyDeviceHandleCapabilities isTelephonyRelayCapable](self, "isTelephonyRelayCapable"));
}

- (BOOL)isAVLessCapable
{
  return self->_avLessCapable;
}

- (BOOL)isLagunaCapable
{
  return self->_lagunaCapable;
}

- (BOOL)isAudioCallCapable
{
  return self->_audioCallCapable;
}

- (BOOL)isTelephonyRelayCapable
{
  return self->_telephonyRelayCapable;
}

@end
