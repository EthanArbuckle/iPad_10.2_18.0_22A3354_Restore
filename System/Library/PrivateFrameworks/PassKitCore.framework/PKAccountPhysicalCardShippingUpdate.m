@implementation PKAccountPhysicalCardShippingUpdate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPhysicalCardShippingUpdate)initWithCoder:(id)a3
{
  id v4;
  PKAccountPhysicalCardShippingUpdate *v5;
  uint64_t v6;
  NSString *physicalCardIdentifier;
  uint64_t v8;
  NSString *localizedDeliveryExceptionReason;
  uint64_t v10;
  NSString *trackingNumber;
  uint64_t v12;
  NSString *shippingCompany;
  uint64_t v14;
  NSDate *timestamp;
  uint64_t v16;
  NSDateComponents *estimatedDeliveryDate;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKAccountPhysicalCardShippingUpdate;
  v5 = -[PKAccountPhysicalCardShippingUpdate init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("physicalCardIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    physicalCardIdentifier = v5->_physicalCardIdentifier;
    v5->_physicalCardIdentifier = (NSString *)v6;

    v5->_shippingStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("shippingStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deliveryExceptionReason"));
    v8 = objc_claimAutoreleasedReturnValue();
    localizedDeliveryExceptionReason = v5->_localizedDeliveryExceptionReason;
    v5->_localizedDeliveryExceptionReason = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trackingNumber"));
    v10 = objc_claimAutoreleasedReturnValue();
    trackingNumber = v5->_trackingNumber;
    v5->_trackingNumber = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shippingCompany"));
    v12 = objc_claimAutoreleasedReturnValue();
    shippingCompany = v5->_shippingCompany;
    v5->_shippingCompany = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statusTimestamp"));
    v14 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("estimatedDeliveryDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    estimatedDeliveryDate = v5->_estimatedDeliveryDate;
    v5->_estimatedDeliveryDate = (NSDateComponents *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *physicalCardIdentifier;
  id v5;

  physicalCardIdentifier = self->_physicalCardIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", physicalCardIdentifier, CFSTR("physicalCardIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_shippingStatus, CFSTR("shippingStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedDeliveryExceptionReason, CFSTR("deliveryExceptionReason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trackingNumber, CFSTR("trackingNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shippingCompany, CFSTR("shippingCompany"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("statusTimestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_estimatedDeliveryDate, CFSTR("estimatedDeliveryDate"));

}

- (PKAccountPhysicalCardShippingUpdate)initWithRecord:(id)a3
{
  id v4;
  PKAccountPhysicalCardShippingUpdate *v5;
  uint64_t v6;
  NSString *physicalCardIdentifier;
  void *v8;
  uint64_t v9;
  NSString *localizedDeliveryExceptionReason;
  uint64_t v11;
  NSString *trackingNumber;
  uint64_t v13;
  NSString *shippingCompany;
  uint64_t v15;
  NSDate *timestamp;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSDateComponents *estimatedDeliveryDate;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKAccountPhysicalCardShippingUpdate;
  v5 = -[PKAccountPhysicalCardShippingUpdate init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("physicalCardIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    physicalCardIdentifier = v5->_physicalCardIdentifier;
    v5->_physicalCardIdentifier = (NSString *)v6;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("shippingStatus"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shippingStatus = PKPhysicalCardShippingStatusFromString(v8);

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("deliveryExceptionReason"));
    v9 = objc_claimAutoreleasedReturnValue();
    localizedDeliveryExceptionReason = v5->_localizedDeliveryExceptionReason;
    v5->_localizedDeliveryExceptionReason = (NSString *)v9;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("trackingNumber"));
    v11 = objc_claimAutoreleasedReturnValue();
    trackingNumber = v5->_trackingNumber;
    v5->_trackingNumber = (NSString *)v11;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("shippingCompany"));
    v13 = objc_claimAutoreleasedReturnValue();
    shippingCompany = v5->_shippingCompany;
    v5->_shippingCompany = (NSString *)v13;

    objc_msgSend(v4, "pk_encryptedDateForKey:", CFSTR("statusTimestamp"));
    v15 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v15;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("estimatedDeliveryDate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v18, "setDateFormat:", CFSTR("yyyy-MM-dd"));
      objc_msgSend(v18, "dateFromString:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "components:fromDate:", 28, v19);
      v21 = objc_claimAutoreleasedReturnValue();
      estimatedDeliveryDate = v5->_estimatedDeliveryDate;
      v5->_estimatedDeliveryDate = (NSDateComponents *)v21;

    }
  }

  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  unint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "encryptedValues");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (PKApplePayContainerEnvironment() == 2)
  {
    objc_msgSend(v10, "setObject:forKey:", self->_physicalCardIdentifier, CFSTR("physicalCardIdentifier"));
    v4 = self->_shippingStatus - 1;
    if (v4 > 3)
      v5 = 0;
    else
      v5 = off_1E2ADB3C8[v4];
    objc_msgSend(v10, "setObject:forKey:", v5, CFSTR("shippingStatus"));
    objc_msgSend(v10, "setObject:forKey:", self->_localizedDeliveryExceptionReason, CFSTR("deliveryExceptionReason"));
    objc_msgSend(v10, "setObject:forKey:", self->_trackingNumber, CFSTR("trackingNumber"));
    objc_msgSend(v10, "setObject:forKey:", self->_shippingCompany, CFSTR("shippingCompany"));
    objc_msgSend(v10, "setObject:forKey:", self->_timestamp, CFSTR("statusTimestamp"));
    if (self->_estimatedDeliveryDate)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dateFromComponents:", self->_estimatedDeliveryDate);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v8, "setDateFormat:", CFSTR("yyyy-MM-dd"));
      objc_msgSend(v8, "stringFromDate:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("estimatedDeliveryDate"));

    }
  }

}

+ (id)recordType
{
  return CFSTR("PhysicalCardShippingUpdate");
}

+ (id)recordNamePrefix
{
  return CFSTR("physicalCardShippingUpdate");
}

- (NSURL)shipmentTrackingURL
{
  NSString *trackingNumber;
  void *v4;
  void *v5;
  NSString *shippingCompany;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[NSString length](self->_shippingCompany, "length") && -[NSString length](self->_trackingNumber, "length"))
  {
    trackingNumber = self->_trackingNumber;
    objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](trackingNumber, "stringByAddingPercentEncodingWithAllowedCharacters:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    shippingCompany = self->_shippingCompany;
    objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](shippingCompany, "stringByAddingPercentEncodingWithAllowedCharacters:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://trackingshipment.apple.com/?Company=%@&TrackingNumber=%@"), v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return (NSURL *)v10;
}

- (NSString)formattedEstimatedDeliveryDate
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_estimatedDeliveryDate)
  {
    if (qword_1ECF22B58 != -1)
      dispatch_once(&qword_1ECF22B58, &__block_literal_global_206);
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateFromComponents:", self->_estimatedDeliveryDate);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)_MergedGlobals_281, "stringFromDate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

uint64_t __69__PKAccountPhysicalCardShippingUpdate_formattedEstimatedDeliveryDate__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_281;
  _MergedGlobals_281 = (uint64_t)v0;

  return objc_msgSend((id)_MergedGlobals_281, "setDateFormat:", CFSTR("MMM d"));
}

- (BOOL)isEqual:(id)a3
{
  PKAccountPhysicalCardShippingUpdate *v4;
  BOOL v5;

  v4 = (PKAccountPhysicalCardShippingUpdate *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PKAccountPhysicalCardShippingUpdate isEqualToPhysicalCardShippingUpdate:](self, "isEqualToPhysicalCardShippingUpdate:", v4);
  }

  return v5;
}

- (BOOL)isEqualToPhysicalCardShippingUpdate:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  _BOOL4 v13;
  void *v14;
  NSString *v15;
  _BOOL4 v16;
  void *v17;
  NSString *v18;
  _BOOL4 v19;
  NSDate *timestamp;
  NSDate *v21;
  NSDateComponents *estimatedDeliveryDate;
  NSDateComponents *v23;
  char v24;

  v4 = a3;
  v5 = (void *)v4[1];
  v6 = self->_physicalCardIdentifier;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
      goto LABEL_7;
    v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v10)
      goto LABEL_36;
  }
  if (self->_shippingStatus != v4[2])
    goto LABEL_36;
  v11 = (void *)v4[3];
  v6 = self->_localizedDeliveryExceptionReason;
  v12 = v11;
  if (v6 == v12)
  {

  }
  else
  {
    v8 = v12;
    if (!v6 || !v12)
      goto LABEL_7;
    v13 = -[NSString isEqualToString:](v6, "isEqualToString:", v12);

    if (!v13)
      goto LABEL_36;
  }
  v14 = (void *)v4[4];
  v6 = self->_trackingNumber;
  v15 = v14;
  if (v6 == v15)
  {

  }
  else
  {
    v8 = v15;
    if (!v6 || !v15)
      goto LABEL_7;
    v16 = -[NSString isEqualToString:](v6, "isEqualToString:", v15);

    if (!v16)
      goto LABEL_36;
  }
  v17 = (void *)v4[5];
  v6 = self->_shippingCompany;
  v18 = v17;
  if (v6 == v18)
  {

    goto LABEL_29;
  }
  v8 = v18;
  if (!v6 || !v18)
  {
LABEL_7:

    goto LABEL_36;
  }
  v19 = -[NSString isEqualToString:](v6, "isEqualToString:", v18);

  if (!v19)
    goto LABEL_36;
LABEL_29:
  timestamp = self->_timestamp;
  v21 = (NSDate *)v4[6];
  if (!timestamp || !v21)
  {
    if (timestamp == v21)
      goto LABEL_32;
LABEL_36:
    v24 = 0;
    goto LABEL_37;
  }
  if ((-[NSDate isEqual:](timestamp, "isEqual:") & 1) == 0)
    goto LABEL_36;
LABEL_32:
  estimatedDeliveryDate = self->_estimatedDeliveryDate;
  v23 = (NSDateComponents *)v4[7];
  if (estimatedDeliveryDate && v23)
    v24 = -[NSDateComponents isEqual:](estimatedDeliveryDate, "isEqual:");
  else
    v24 = estimatedDeliveryDate == v23;
LABEL_37:

  return v24;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_physicalCardIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedDeliveryExceptionReason);
  objc_msgSend(v3, "safelyAddObject:", self->_trackingNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_shippingCompany);
  objc_msgSend(v3, "safelyAddObject:", self->_timestamp);
  objc_msgSend(v3, "safelyAddObject:", self->_estimatedDeliveryDate);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_shippingStatus - v4 + 32 * v4;

  return v5;
}

- (NSString)description
{
  void *v3;
  unint64_t v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("physicalCardIdentifier: '%@'; "), self->_physicalCardIdentifier);
  v4 = self->_shippingStatus - 1;
  if (v4 > 3)
    v5 = 0;
  else
    v5 = off_1E2ADB3C8[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR("shippingStatus: '%@'; "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("deliveryExceptionReason: '%@'; "), self->_localizedDeliveryExceptionReason);
  objc_msgSend(v3, "appendFormat:", CFSTR("trackingNumber: '%@'; "), self->_trackingNumber);
  objc_msgSend(v3, "appendFormat:", CFSTR("shippingCompany: '%@'; "), self->_shippingCompany);
  objc_msgSend(v3, "appendFormat:", CFSTR("timestamp: '%@'; "), self->_timestamp);
  objc_msgSend(v3, "appendFormat:", CFSTR("estimatedDeliveryDate: '%@'; "), self->_estimatedDeliveryDate);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (NSString)physicalCardIdentifier
{
  return self->_physicalCardIdentifier;
}

- (void)setPhysicalCardIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)shippingStatus
{
  return self->_shippingStatus;
}

- (void)setShippingStatus:(int64_t)a3
{
  self->_shippingStatus = a3;
}

- (NSString)localizedDeliveryExceptionReason
{
  return self->_localizedDeliveryExceptionReason;
}

- (void)setLocalizedDeliveryExceptionReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)trackingNumber
{
  return self->_trackingNumber;
}

- (void)setTrackingNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)shippingCompany
{
  return self->_shippingCompany;
}

- (void)setShippingCompany:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (NSDateComponents)estimatedDeliveryDate
{
  return self->_estimatedDeliveryDate;
}

- (void)setEstimatedDeliveryDate:(id)a3
{
  objc_storeStrong((id *)&self->_estimatedDeliveryDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatedDeliveryDate, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_shippingCompany, 0);
  objc_storeStrong((id *)&self->_trackingNumber, 0);
  objc_storeStrong((id *)&self->_localizedDeliveryExceptionReason, 0);
  objc_storeStrong((id *)&self->_physicalCardIdentifier, 0);
}

@end
