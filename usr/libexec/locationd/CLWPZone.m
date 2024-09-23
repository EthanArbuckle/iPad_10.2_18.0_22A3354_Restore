@implementation CLWPZone

- (CLWPZone)initWithProximityUUID:(id)a3 major:(id)a4 minor:(id)a5 identifier:(id)a6
{
  CLWPZone *v10;
  NSData *v11;
  NSNumber *major;
  NSNumber *minor;
  __int16 v15;
  __int16 v16;
  objc_super v17;
  _QWORD v18[2];

  v17.receiver = self;
  v17.super_class = (Class)CLWPZone;
  v10 = -[CLWPZone init](&v17, "init");
  if (v10)
  {
    v10->_identifier = (NSString *)objc_msgSend(a6, "copy");
    v10->_proximityUUID = (NSUUID *)objc_msgSend(a3, "copy");
    v10->_major = (NSNumber *)objc_msgSend(a4, "copy");
    v10->_minor = (NSNumber *)objc_msgSend(a5, "copy");
    if (v10->_proximityUUID)
    {
      v11 = (NSData *)objc_alloc_init((Class)NSMutableData);
      v18[0] = 0;
      v18[1] = 0;
      -[NSUUID getUUIDBytes:](v10->_proximityUUID, "getUUIDBytes:", v18);
      -[NSData appendBytes:length:](v11, "appendBytes:length:", v18, 16);
      major = v10->_major;
      if (major)
      {
        v16 = __rev16(-[NSNumber unsignedShortValue](major, "unsignedShortValue"));
        -[NSData appendBytes:length:](v11, "appendBytes:length:", &v16, 2);
        minor = v10->_minor;
        if (minor)
        {
          v15 = __rev16(-[NSNumber unsignedShortValue](minor, "unsignedShortValue"));
          -[NSData appendBytes:length:](v11, "appendBytes:length:", &v15, 2);
        }
      }
    }
    else
    {
      v11 = 0;
    }
    v10->_advertisementData = v11;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  self->_advertisementData = 0;
  self->_minor = 0;

  self->_major = 0;
  self->_proximityUUID = 0;

  self->_identifier = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWPZone;
  -[CLWPZone dealloc](&v3, "dealloc");
}

- (id)description
{
  return self->_identifier;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  v5 = objc_opt_class(self, a2);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
    return -[NSString isEqual:](-[CLWPZone identifier](self, "identifier"), "isEqual:", objc_msgSend(a3, "identifier"));
  else
    return 0;
}

- (NSUUID)proximityUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)major
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)minor
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)advertisementData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

@end
