@implementation PKBarcodePaymentEvent

- (PKBarcodePaymentEvent)init
{
  PKBarcodePaymentEvent *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKBarcodePaymentEvent;
  result = -[PKBarcodePaymentEvent init](&v3, sel_init);
  if (result)
    result->_version = 1;
  return result;
}

- (id)data
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t authenticationType;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("version"));

  v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ"));
  objc_msgSend(v5, "stringFromDate:", self->_timestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("timestamp"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_barcodeIdentifier, CFSTR("barcodeIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_biometricsChanged);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("biometricsChanged"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceAccountIdentifier, CFSTR("deviceAccountIdentifier"));
  -[NSData base64EncodedStringWithOptions:](self->_eventMetadata, "base64EncodedStringWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("eventMetadata"));

  authenticationType = self->_authenticationType;
  if (authenticationType <= 3)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", off_1E2AD7D70[authenticationType], CFSTR("authenticationType"));
  if (self->_eventType == 1)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("barcodeDisplayed"), CFSTR("eventType"));
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PKBarcodePaymentEvent *v4;
  PKBarcodePaymentEvent *v5;
  BOOL v6;

  v4 = (PKBarcodePaymentEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKBarcodePaymentEvent isEqualToBarcodePaymentEvent:](self, "isEqualToBarcodePaymentEvent:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_timestamp);
  objc_msgSend(v3, "safelyAddObject:", self->_barcodeIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_eventMetadata);
  objc_msgSend(v3, "safelyAddObject:", self->_deviceAccountIdentifier);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_version - v4 + 32 * v4;
  v6 = self->_eventType - v5 + 32 * v5;
  v7 = self->_biometricsChanged - v6 + 32 * v6;
  v8 = self->_authenticationType - v7 + 32 * v7;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKBarcodePaymentEvent)initWithCoder:(id)a3
{
  id v4;
  PKBarcodePaymentEvent *v5;
  uint64_t v6;
  NSDate *timestamp;
  uint64_t v8;
  NSString *barcodeIdentifier;
  uint64_t v10;
  NSData *eventMetadata;
  uint64_t v12;
  NSString *deviceAccountIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKBarcodePaymentEvent;
  v5 = -[PKBarcodePaymentEvent init](&v15, sel_init);
  if (v5)
  {
    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v6 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v6;

    v5->_eventType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("eventType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("barcodeIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    barcodeIdentifier = v5->_barcodeIdentifier;
    v5->_barcodeIdentifier = (NSString *)v8;

    v5->_biometricsChanged = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("biometricsChanged"));
    v5->_authenticationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("authenticationType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventMetadata"));
    v10 = objc_claimAutoreleasedReturnValue();
    eventMetadata = v5->_eventMetadata;
    v5->_eventMetadata = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceAccountIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    deviceAccountIdentifier = v5->_deviceAccountIdentifier;
    v5->_deviceAccountIdentifier = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", version, CFSTR("version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_eventType, CFSTR("eventType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_barcodeIdentifier, CFSTR("barcodeIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_biometricsChanged, CFSTR("biometricsChanged"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_authenticationType, CFSTR("authenticationType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventMetadata, CFSTR("eventMetadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceAccountIdentifier, CFSTR("deviceAccountIdentifier"));

}

- (BOOL)isEqualToBarcodePaymentEvent:(id)a3
{
  _QWORD *v4;
  NSDate *timestamp;
  NSDate *v6;
  BOOL v7;
  char v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  _BOOL4 v13;
  NSData *eventMetadata;
  NSData *v15;
  NSString *deviceAccountIdentifier;
  void *v17;
  NSString *v18;

  v4 = a3;
  if (self->_version != v4[2])
    goto LABEL_27;
  timestamp = self->_timestamp;
  v6 = (NSDate *)v4[3];
  if (timestamp)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (timestamp != v6)
      goto LABEL_27;
  }
  else
  {
    v8 = -[NSDate isEqual:](timestamp, "isEqual:");
    if ((v8 & 1) == 0)
      goto LABEL_27;
  }
  if (self->_eventType == v4[4])
  {
    v9 = (void *)v4[5];
    v10 = self->_barcodeIdentifier;
    v11 = v9;
    if (v10 == v11)
    {

    }
    else
    {
      v12 = v11;
      LOBYTE(v13) = 0;
      if (!v10 || !v11)
      {
LABEL_30:

        goto LABEL_28;
      }
      v13 = -[NSString isEqualToString:](v10, "isEqualToString:", v11);

      if (!v13)
        goto LABEL_28;
    }
    if (self->_biometricsChanged == *((unsigned __int8 *)v4 + 8) && self->_authenticationType == v4[6])
    {
      eventMetadata = self->_eventMetadata;
      v15 = (NSData *)v4[8];
      if (eventMetadata && v15)
      {
        if ((-[NSData isEqual:](eventMetadata, "isEqual:") & 1) != 0)
          goto LABEL_22;
      }
      else if (eventMetadata == v15)
      {
LABEL_22:
        deviceAccountIdentifier = self->_deviceAccountIdentifier;
        v17 = (void *)v4[7];
        v10 = deviceAccountIdentifier;
        v18 = v17;
        if (v10 == v18)
        {
          LOBYTE(v13) = 1;
          v12 = v10;
        }
        else
        {
          v12 = v18;
          LOBYTE(v13) = 0;
          if (v10 && v18)
            LOBYTE(v13) = -[NSString isEqualToString:](v10, "isEqualToString:", v18);
        }
        goto LABEL_30;
      }
    }
  }
LABEL_27:
  LOBYTE(v13) = 0;
LABEL_28:

  return v13;
}

- (int64_t)version
{
  return self->_version;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (NSString)barcodeIdentifier
{
  return self->_barcodeIdentifier;
}

- (void)setBarcodeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)biometricsChanged
{
  return self->_biometricsChanged;
}

- (void)setBiometricsChanged:(BOOL)a3
{
  self->_biometricsChanged = a3;
}

- (int64_t)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(int64_t)a3
{
  self->_authenticationType = a3;
}

- (NSString)deviceAccountIdentifier
{
  return self->_deviceAccountIdentifier;
}

- (void)setDeviceAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventMetadata, 0);
  objc_storeStrong((id *)&self->_deviceAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_barcodeIdentifier, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
