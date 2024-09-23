@implementation TAStagedSuspiciousDevice

- (TAStagedSuspiciousDevice)initWithDetection:(id)a3 keepInStagingUntil:(id)a4
{
  id v7;
  id v8;
  TAStagedSuspiciousDevice *v9;
  id *p_isa;
  TAStagedSuspiciousDevice *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TAStagedSuspiciousDevice;
  v9 = -[TAStagedSuspiciousDevice init](&v13, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (!v9)
    goto LABEL_5;
  v11 = 0;
  if (v7 && v8)
  {
    objc_storeStrong((id *)&v9->_detection, a3);
    objc_storeStrong(p_isa + 2, a4);
LABEL_5:
    v11 = p_isa;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  TAStagedSuspiciousDevice *v5;
  TAStagedSuspiciousDevice *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = (TAStagedSuspiciousDevice *)a3;
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
      -[TAStagedSuspiciousDevice detection](self, "detection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAStagedSuspiciousDevice detection](v6, "detection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[TAStagedSuspiciousDevice detection](self, "detection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAStagedSuspiciousDevice detection](v6, "detection");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:", v3))
        {
          v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      -[TAStagedSuspiciousDevice keepInStagingUntil](self, "keepInStagingUntil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAStagedSuspiciousDevice keepInStagingUntil](v6, "keepInStagingUntil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        -[TAStagedSuspiciousDevice keepInStagingUntil](self, "keepInStagingUntil");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAStagedSuspiciousDevice keepInStagingUntil](v6, "keepInStagingUntil");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v13, "isEqual:", v14);

      }
      v9 = v16;
      if (v7 == v8)
        goto LABEL_14;
      goto LABEL_13;
    }
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (id)descriptionDictionary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("Detection");
  -[TASuspiciousDevice descriptionDictionary](self->_detection, "descriptionDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("KeepInStagingUntil");
  v8[0] = v3;
  -[NSDate getDateString](self->_keepInStagingUntil, "getDateString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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

  -[TAStagedSuspiciousDevice descriptionDictionary](self, "descriptionDictionary");
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAStagedSuspiciousDevice)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  TAStagedSuspiciousDevice *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Detection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("KeepInStagingUntil"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TAStagedSuspiciousDevice initWithDetection:keepInStagingUntil:](self, "initWithDetection:keepInStagingUntil:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  TASuspiciousDevice *detection;
  id v5;

  detection = self->_detection;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", detection, CFSTR("Detection"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keepInStagingUntil, CFSTR("KeepInStagingUntil"));

}

- (TASuspiciousDevice)detection
{
  return self->_detection;
}

- (NSDate)keepInStagingUntil
{
  return self->_keepInStagingUntil;
}

- (void)setKeepInStagingUntil:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keepInStagingUntil, 0);
  objc_storeStrong((id *)&self->_detection, 0);
}

@end
