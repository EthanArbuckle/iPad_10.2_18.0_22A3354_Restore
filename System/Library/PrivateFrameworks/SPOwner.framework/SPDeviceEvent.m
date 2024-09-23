@implementation SPDeviceEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPDeviceEvent *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  SPDeviceEvent *v9;

  v4 = [SPDeviceEvent alloc];
  -[SPDeviceEvent timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SPDeviceEvent source](self, "source");
  -[SPDeviceEvent attachmentInfo](self, "attachmentInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPDeviceEvent serialNumber](self, "serialNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SPDeviceEvent initWithTimestamp:source:attachmentInfo:serialNumber:](v4, "initWithTimestamp:source:attachmentInfo:serialNumber:", v5, v6, v7, v8);

  return v9;
}

- (SPDeviceEvent)initWithTimestamp:(id)a3 source:(int64_t)a4 attachmentInfo:(id)a5 serialNumber:(id)a6
{
  id v11;
  id v12;
  id v13;
  SPDeviceEvent *v14;
  SPDeviceEvent *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SPDeviceEvent;
  v14 = -[SPDeviceEvent init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_timestamp, a3);
    v15->_source = a4;
    objc_storeStrong((id *)&v15->_attachmentInfo, a5);
    objc_storeStrong((id *)&v15->_serialNumber, a6);
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attachmentInfo, CFSTR("attachmentInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serialNumber, CFSTR("serialNumber"));

}

- (SPDeviceEvent)initWithCoder:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *timestamp;
  SPAttachmentInfo *v7;
  SPAttachmentInfo *attachmentInfo;
  NSString *v9;
  NSString *serialNumber;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  self->_timestamp = v5;

  self->_source = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attachmentInfo"));
  v7 = (SPAttachmentInfo *)objc_claimAutoreleasedReturnValue();
  attachmentInfo = self->_attachmentInfo;
  self->_attachmentInfo = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();

  serialNumber = self->_serialNumber;
  self->_serialNumber = v9;

  return self;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int64_t)source
{
  return self->_source;
}

- (SPAttachmentInfo)attachmentInfo
{
  return self->_attachmentInfo;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_attachmentInfo, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
