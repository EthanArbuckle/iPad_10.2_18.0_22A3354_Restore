@implementation RTPeopleDiscoveryAdvertisement

- (RTPeopleDiscoveryAdvertisement)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAddress_rssi_scanDate_contactID_);
}

- (RTPeopleDiscoveryAdvertisement)initWithAddress:(id)a3 rssi:(int64_t)a4 scanDate:(id)a5 contactID:(id)a6
{
  id v10;
  id v11;
  id v12;
  RTPeopleDiscoveryAdvertisement *v13;
  uint64_t v14;
  NSData *address;
  uint64_t v16;
  NSDate *scanDate;
  uint64_t v18;
  NSString *contactID;
  RTPeopleDiscoveryAdvertisement *v20;
  NSObject *v21;
  uint8_t v23[16];
  objc_super v24;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)RTPeopleDiscoveryAdvertisement;
  v13 = -[RTPeopleDiscoveryAdvertisement init](&v24, sel_init);
  if (!v13)
    goto LABEL_4;
  if (v10)
  {
    v14 = objc_msgSend(v10, "copy");
    address = v13->_address;
    v13->_address = (NSData *)v14;

    v13->_rssi = a4;
    v16 = objc_msgSend(v11, "copy");
    scanDate = v13->_scanDate;
    v13->_scanDate = (NSDate *)v16;

    v18 = objc_msgSend(v12, "copy");
    contactID = v13->_contactID;
    v13->_contactID = (NSString *)v18;

LABEL_4:
    v20 = v13;
    goto LABEL_8;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v23 = 0;
    _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: address", v23, 2u);
  }

  v20 = 0;
LABEL_8:

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  RTPeopleDiscoveryAdvertisement *v4;
  RTPeopleDiscoveryAdvertisement *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (RTPeopleDiscoveryAdvertisement *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[RTPeopleDiscoveryAdvertisement scanDate](self, "scanDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPeopleDiscoveryAdvertisement scanDate](v5, "scanDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToDate:", v7)
        && (v8 = -[RTPeopleDiscoveryAdvertisement rssi](self, "rssi"),
            v8 == -[RTPeopleDiscoveryAdvertisement rssi](v5, "rssi")))
      {
        -[RTPeopleDiscoveryAdvertisement address](self, "address");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTPeopleDiscoveryAdvertisement address](v5, "address");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToData:", v10))
        {
          -[RTPeopleDiscoveryAdvertisement contactID](self, "contactID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTPeopleDiscoveryAdvertisement contactID](v5, "contactID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToString:", v12);

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v3 = -[RTPeopleDiscoveryAdvertisement rssi](self, "rssi");
  if (v3 >= 0)
    v4 = v3;
  else
    v4 = -v3;
  -[RTPeopleDiscoveryAdvertisement scanDate](self, "scanDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[RTPeopleDiscoveryAdvertisement address](self, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash") ^ v4;
  -[RTPeopleDiscoveryAdvertisement contactID](self, "contactID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (id)descriptionDictionary
{
  void *v2;
  void *v3;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("Address");
  -[RTPeopleDiscoveryAdvertisement address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[RTPeopleDiscoveryAdvertisement address](self, "address");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "hexString");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E92AB3A8;
  }
  v16[0] = v6;
  v15[1] = CFSTR("RSSI");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[RTPeopleDiscoveryAdvertisement rssi](self, "rssi"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  v15[2] = CFSTR("Date");
  -[RTPeopleDiscoveryAdvertisement scanDate](self, "scanDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[RTPeopleDiscoveryAdvertisement scanDate](self, "scanDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getFormattedDateString");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("-");
  }
  v16[2] = v9;
  v15[3] = CFSTR("ContactID");
  -[RTPeopleDiscoveryAdvertisement contactID](self, "contactID");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = &stru_1E92AB3A8;
  v16[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {

  }
  if (v5)
  {

  }
  return v13;
}

- (id)description
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  objc_class *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[RTPeopleDiscoveryAdvertisement descriptionDictionary](self, "descriptionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONStringFromNSDictionary:error:", v2, &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v3;
  }
  v7 = v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[RTPeopleDiscoveryAdvertisement address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Address"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[RTPeopleDiscoveryAdvertisement rssi](self, "rssi"), CFSTR("RSSI"));
  -[RTPeopleDiscoveryAdvertisement scanDate](self, "scanDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Date"));

  -[RTPeopleDiscoveryAdvertisement contactID](self, "contactID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ContactID"));

}

- (RTPeopleDiscoveryAdvertisement)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  RTPeopleDiscoveryAdvertisement *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Address"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("RSSI"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ContactID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[RTPeopleDiscoveryAdvertisement initWithAddress:rssi:scanDate:contactID:](self, "initWithAddress:rssi:scanDate:contactID:", v5, v6, v7, v8);
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[RTPeopleDiscoveryAdvertisement initWithAddress:rssi:scanDate:contactID:]([RTPeopleDiscoveryAdvertisement alloc], "initWithAddress:rssi:scanDate:contactID:", self->_address, self->_rssi, self->_scanDate, self->_contactID);
}

- (NSData)address
{
  return self->_address;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (NSDate)scanDate
{
  return self->_scanDate;
}

- (NSString)contactID
{
  return self->_contactID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_scanDate, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
