@implementation TASuspiciousDevice

- (TASuspiciousDevice)initWithLatestAdv:(id)a3 detectionSummary:(id)a4 date:(id)a5 locHistory:(id)a6 detectionMetrics:(id)a7 detectionType:(unint64_t)a8 immediacyType:(unint64_t)a9 accessoryInfo:(id)a10 forceSurfaceReason:(unint64_t)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  TASuspiciousDevice *v22;
  TASuspiciousDevice *v23;
  void *v24;
  uint64_t v25;
  NSData *address;
  uint64_t v27;
  NSDictionary *detectionSummary;
  uint64_t v29;
  NSDate *date;
  uint64_t v31;
  TASPAdvertisement *latestAdvertisement;
  uint64_t v33;
  NSArray *locationHistory;
  objc_super v37;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a10;
  v37.receiver = self;
  v37.super_class = (Class)TASuspiciousDevice;
  v22 = -[TASuspiciousDevice init](&v37, sel_init);
  if (!v22)
    goto LABEL_7;
  v23 = 0;
  if (v16 && v17 && v18 && v19)
  {
    objc_msgSend(v16, "address");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    address = v22->_address;
    v22->_address = (NSData *)v25;

    v27 = objc_msgSend(v17, "copy");
    detectionSummary = v22->_detectionSummary;
    v22->_detectionSummary = (NSDictionary *)v27;

    v29 = objc_msgSend(v18, "copy");
    date = v22->_date;
    v22->_date = (NSDate *)v29;

    v31 = objc_msgSend(v16, "copy");
    latestAdvertisement = v22->_latestAdvertisement;
    v22->_latestAdvertisement = (TASPAdvertisement *)v31;

    v33 = objc_msgSend(v19, "copy");
    locationHistory = v22->_locationHistory;
    v22->_locationHistory = (NSArray *)v33;

    objc_storeStrong((id *)&v22->_detectionMetrics, a7);
    v22->_detectionType = a8;
    v22->_immediacyType = a9;
    objc_storeStrong((id *)&v22->_accessoryInfo, a10);
    v22->_forceSurfaceReason = a11;
LABEL_7:
    v23 = v22;
  }

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TASuspiciousDevice initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:]([TASuspiciousDevice alloc], "initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:", self->_latestAdvertisement, self->_detectionSummary, self->_date, self->_locationHistory, self->_detectionMetrics, self->_detectionType, self->_immediacyType, self->_accessoryInfo, self->_forceSurfaceReason);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  TASuspiciousDevice *v5;
  TASuspiciousDevice *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  BOOL v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;

  v5 = (TASuspiciousDevice *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[TASuspiciousDevice address](self, "address");
      v7 = objc_claimAutoreleasedReturnValue();
      -[TASuspiciousDevice address](v6, "address");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = (void *)v7;
      if ((void *)v7 != v8)
      {
        -[TASuspiciousDevice address](self, "address");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[TASuspiciousDevice address](v6, "address");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v9))
        {
          v10 = 0;
          goto LABEL_51;
        }
        v66 = v9;
      }
      -[TASuspiciousDevice detectionSummary](self, "detectionSummary");
      v11 = objc_claimAutoreleasedReturnValue();
      -[TASuspiciousDevice detectionSummary](v6, "detectionSummary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)v11;
      if ((void *)v11 != v12)
      {
        -[TASuspiciousDevice detectionSummary](self, "detectionSummary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TASuspiciousDevice detectionSummary](v6, "detectionSummary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:", v14))
        {
          v10 = 0;
LABEL_49:

LABEL_50:
          v9 = v66;
          if (v68 == v8)
          {
LABEL_52:

            goto LABEL_53;
          }
LABEL_51:

          goto LABEL_52;
        }
        v62 = v14;
        v63 = v13;
      }
      -[TASuspiciousDevice date](self, "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TASuspiciousDevice date](v6, "date");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v15 != (void *)v16)
      {
        v64 = v8;
        v18 = v12;
        v19 = v3;
        v20 = (void *)v16;
        v21 = v15;
        -[TASuspiciousDevice date](self, "date");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[TASuspiciousDevice date](v6, "date");
        v61 = v22;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v22, "isEqual:"))
        {
          v10 = 0;
          v15 = v21;
          v17 = v20;
          v3 = v19;
          v12 = v18;
          v8 = v64;
LABEL_47:

LABEL_48:
          v14 = v62;
          v13 = v63;
          if (v67 == v12)
            goto LABEL_50;
          goto LABEL_49;
        }
        v15 = v21;
        v17 = v20;
        v3 = v19;
        v12 = v18;
        v8 = v64;
        v59 = v23;
      }
      -[TASuspiciousDevice latestAdvertisement](self, "latestAdvertisement");
      v24 = objc_claimAutoreleasedReturnValue();
      -[TASuspiciousDevice latestAdvertisement](v6, "latestAdvertisement");
      v60 = objc_claimAutoreleasedReturnValue();
      v65 = (void *)v24;
      if (v24 != v60)
      {
        -[TASuspiciousDevice latestAdvertisement](self, "latestAdvertisement");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[TASuspiciousDevice latestAdvertisement](v6, "latestAdvertisement");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v25;
        if (!objc_msgSend(v25, "isEqual:"))
        {
          v10 = 0;
          v26 = (void *)v60;
LABEL_45:

LABEL_46:
          v23 = v59;
          if (v15 == v17)
            goto LABEL_48;
          goto LABEL_47;
        }
      }
      -[TASuspiciousDevice locationHistory](self, "locationHistory");
      v27 = objc_claimAutoreleasedReturnValue();
      -[TASuspiciousDevice locationHistory](v6, "locationHistory");
      v58 = objc_claimAutoreleasedReturnValue();
      if (v27 != v58)
      {
        v28 = (void *)v27;
        -[TASuspiciousDevice locationHistory](self, "locationHistory");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[TASuspiciousDevice locationHistory](v6, "locationHistory");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v29;
        if (!objc_msgSend(v29, "isEqual:"))
        {
          v10 = 0;
          v32 = (void *)v58;
LABEL_43:

LABEL_44:
          v26 = (void *)v60;
          if (v65 == (void *)v60)
            goto LABEL_46;
          goto LABEL_45;
        }
        v27 = (uint64_t)v28;
      }
      -[TASuspiciousDevice detectionMetrics](self, "detectionMetrics");
      v30 = objc_claimAutoreleasedReturnValue();
      -[TASuspiciousDevice detectionMetrics](v6, "detectionMetrics");
      v55 = objc_claimAutoreleasedReturnValue();
      v51 = (void *)v30;
      v52 = (void *)v27;
      if (v30 == v55)
      {
        v50 = v3;
      }
      else
      {
        -[TASuspiciousDevice detectionMetrics](self, "detectionMetrics");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[TASuspiciousDevice detectionMetrics](v6, "detectionMetrics");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v31;
        if (!objc_msgSend(v31, "isEqual:"))
        {
          v10 = 0;
          v39 = v51;
          v40 = (void *)v55;
          goto LABEL_41;
        }
        v50 = v3;
        v30 = (uint64_t)v51;
      }
      v33 = -[TASuspiciousDevice detectionType](self, "detectionType");
      if (v33 == -[TASuspiciousDevice detectionType](v6, "detectionType"))
      {
        -[TASuspiciousDevice accessoryInfo](self, "accessoryInfo");
        v34 = objc_claimAutoreleasedReturnValue();
        -[TASuspiciousDevice accessoryInfo](v6, "accessoryInfo");
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = (void *)v34;
        v35 = v34 == v45;
        v3 = v50;
        if (v35
          || (-[TASuspiciousDevice accessoryInfo](self, "accessoryInfo"),
              v47 = (void *)objc_claimAutoreleasedReturnValue(),
              -[TASuspiciousDevice accessoryInfo](v6, "accessoryInfo"),
              v44 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v47, "isEqual:")))
        {
          v41 = -[TASuspiciousDevice immediacyType](self, "immediacyType");
          if (v41 == -[TASuspiciousDevice immediacyType](v6, "immediacyType"))
          {
            v42 = -[TASuspiciousDevice forceSurfaceReason](self, "forceSurfaceReason");
            v10 = v42 == -[TASuspiciousDevice forceSurfaceReason](v6, "forceSurfaceReason");
          }
          else
          {
            v10 = 0;
          }
          v37 = (void *)v45;
          v36 = v46;
          v3 = v50;
          v38 = (void *)v44;
          if (v46 == (void *)v45)
          {
LABEL_40:

            v40 = (void *)v55;
            v39 = v51;
            if (v51 == (void *)v55)
              goto LABEL_42;
            goto LABEL_41;
          }
        }
        else
        {
          v10 = 0;
          v37 = (void *)v45;
          v36 = v46;
          v38 = (void *)v44;
        }

        goto LABEL_40;
      }
      v10 = 0;
      v39 = (void *)v30;
      v40 = (void *)v55;
      v3 = v50;
      if (v39 == (void *)v55)
      {
LABEL_42:

        v28 = v52;
        v32 = (void *)v58;
        if (v52 == (void *)v58)
          goto LABEL_44;
        goto LABEL_43;
      }
LABEL_41:

      goto LABEL_42;
    }
    v10 = 0;
  }
LABEL_53:

  return v10;
}

- (id)descriptionDictionary
{
  void *v2;
  objc_class *v4;
  void *v5;
  NSDate *date;
  NSDictionary *detectionSummary;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[9];
  _QWORD v19[11];

  v19[9] = *MEMORY[0x24BDAC8D0];
  v18[0] = CFSTR("ResultType");
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v17;
  v18[1] = CFSTR("Address");
  -[NSData hexString](self->_address, "hexString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  detectionSummary = self->_detectionSummary;
  date = self->_date;
  v19[1] = v5;
  v19[2] = detectionSummary;
  v18[2] = CFSTR("Summary");
  v18[3] = CFSTR("Date");
  -[NSDate getDateString](date, "getDateString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v8;
  v18[4] = CFSTR("DeviceType");
  +[TASPAdvertisement TASPAdvertisementDeviceTypeToString:](TASPAdvertisement, "TASPAdvertisementDeviceTypeToString:", -[TASPAdvertisement getDeviceType](self->_latestAdvertisement, "getDeviceType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v9;
  v18[5] = CFSTR("Type");
  +[TAMetricsDetection convertTADetectionTypeToString:](TAMetricsDetection, "convertTADetectionTypeToString:", self->_detectionType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v10;
  v18[6] = CFSTR("Immediacy");
  +[TASuspiciousDevice convertTANotificationImmediacyTypeToString:](TASuspiciousDevice, "convertTANotificationImmediacyTypeToString:", self->_immediacyType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v11;
  v18[7] = CFSTR("AISInfo");
  -[TASuspiciousDevice accessoryInfo](self, "accessoryInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[TASuspiciousDevice accessoryInfo](self, "accessoryInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "descriptionDictionary");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = &stru_24D815B48;
  }
  v19[7] = v13;
  v18[8] = CFSTR("ForceReason");
  +[TASuspiciousDevice convertTAForceSurfaceReasonToString:](TASuspiciousDevice, "convertTAForceSurfaceReasonToString:", self->_forceSurfaceReason);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {

  }
  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  -[TASuspiciousDevice descriptionDictionary](self, "descriptionDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONStringFromNSDictionary:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TAOutgoingRequests description].cold.1(v6, (uint64_t)self, (uint64_t)v5);
    objc_msgSend(MEMORY[0x24BDD17C8], "string");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

+ (id)convertTANotificationImmediacyTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("Never");
  else
    return off_24D814FC0[a3 - 1];
}

+ (id)convertTAForceSurfaceReasonToString:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("None");
  if (a3 == 1)
    v3 = CFSTR("ArriveHome");
  if (a3 == 2)
    return CFSTR("BeepOnMove");
  else
    return (id)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TASuspiciousDevice)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  TASuspiciousDevice *v20;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastAdvertisement"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v8, CFSTR("Summary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDBCF20];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v13, CFSTR("LocationHistory"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Metrics"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (int)objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("Type"));
  v17 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("Immediacy"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AISInfo"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("ForceReason"));

  v20 = -[TASuspiciousDevice initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:](self, "initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:", v4, v9, v10, v14, v15, v16, v17, v18, v19);
  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[TASuspiciousDevice latestAdvertisement](self, "latestAdvertisement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("LastAdvertisement"));

  -[TASuspiciousDevice detectionSummary](self, "detectionSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("Summary"));

  -[TASuspiciousDevice date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("Date"));

  -[TASuspiciousDevice locationHistory](self, "locationHistory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("LocationHistory"));

  -[TASuspiciousDevice detectionMetrics](self, "detectionMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("Metrics"));

  objc_msgSend(v10, "encodeInt32:forKey:", -[TASuspiciousDevice detectionType](self, "detectionType"), CFSTR("Type"));
  objc_msgSend(v10, "encodeInteger:forKey:", -[TASuspiciousDevice immediacyType](self, "immediacyType"), CFSTR("Immediacy"));
  -[TASuspiciousDevice accessoryInfo](self, "accessoryInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("AISInfo"));

  objc_msgSend(v10, "encodeInteger:forKey:", -[TASuspiciousDevice forceSurfaceReason](self, "forceSurfaceReason"), CFSTR("ForceReason"));
}

- (void)updateForceReasonWith:(unint64_t)a3
{
  self->_forceSurfaceReason = a3;
}

- (NSData)address
{
  return self->_address;
}

- (NSDictionary)detectionSummary
{
  return self->_detectionSummary;
}

- (NSDate)date
{
  return self->_date;
}

- (TASPAdvertisement)latestAdvertisement
{
  return self->_latestAdvertisement;
}

- (NSArray)locationHistory
{
  return self->_locationHistory;
}

- (TAMetricsDetection)detectionMetrics
{
  return self->_detectionMetrics;
}

- (unint64_t)detectionType
{
  return self->_detectionType;
}

- (unint64_t)immediacyType
{
  return self->_immediacyType;
}

- (TAAccessoryInformation)accessoryInfo
{
  return self->_accessoryInfo;
}

- (void)setAccessoryInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)forceSurfaceReason
{
  return self->_forceSurfaceReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryInfo, 0);
  objc_storeStrong((id *)&self->_detectionMetrics, 0);
  objc_storeStrong((id *)&self->_locationHistory, 0);
  objc_storeStrong((id *)&self->_latestAdvertisement, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_detectionSummary, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
