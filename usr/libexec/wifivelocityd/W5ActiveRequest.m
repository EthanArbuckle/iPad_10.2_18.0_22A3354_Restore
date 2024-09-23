@implementation W5ActiveRequest

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)W5ActiveRequest;
  -[W5ActiveRequest dealloc](&v3, "dealloc");
}

- (id)description
{
  NSMutableString *v3;
  const char *v4;
  id v5;

  v3 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 0);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("UUID: %@\n"), -[NSString substringToIndex:](-[NSUUID UUIDString](self->_uuid, "UUIDString"), "substringToIndex:", 5));
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("PeerID: %@\n"), self->_peerID);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("Type: %@\n"), sub_10001C82C(self->_type));
  if (self->_wantsUpdates)
    v4 = "Yes";
  else
    v4 = "No";
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("Wants Updates: %s\n"), v4);
  v5 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v5, "setDateStyle:", 0);
  objc_msgSend(v5, "setTimeStyle:", 2);
  objc_msgSend(v5, "setLocale:", +[NSLocale currentLocale](NSLocale, "currentLocale"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("Timestamp: %@\n"), objc_msgSend(v5, "stringFromDate:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", self->_timestamp)));
  return -[NSMutableString copy](v3, "copy");
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5ActiveRequest;
  if (-[W5ActiveRequest conformsToProtocol:](&v5, "conformsToProtocol:")
    || (objc_msgSend(a3, "isEqual:", &OBJC_PROTOCOL___NSSecureCoding) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isEqual:", &OBJC_PROTOCOL___NSCopying);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5ActiveRequest *v4;

  v4 = -[W5ActiveRequest init](+[W5ActiveRequest allocWithZone:](W5ActiveRequest, "allocWithZone:", a3), "init");
  -[W5ActiveRequest setUuid:](v4, "setUuid:", self->_uuid);
  -[W5ActiveRequest setPeerID:](v4, "setPeerID:", self->_peerID);
  -[W5ActiveRequest setType:](v4, "setType:", self->_type);
  -[W5ActiveRequest setTimestamp:](v4, "setTimestamp:", self->_timestamp);
  -[W5ActiveRequest setWantsUpdates:](v4, "setWantsUpdates:", self->_wantsUpdates);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_uuid, CFSTR("_uuid"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_peerID, CFSTR("_peerID"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_type, CFSTR("_type"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("_timestamp"), self->_timestamp);
  objc_msgSend(a3, "encodeBool:forKey:", self->_wantsUpdates, CFSTR("_wantsUpdates"));
}

- (W5ActiveRequest)initWithCoder:(id)a3
{
  uint64_t v4;
  W5ActiveRequest *v5;
  uint64_t v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)W5ActiveRequest;
  v5 = -[W5ActiveRequest init](&v9, "init");
  if (v5)
  {
    v5->_uuid = (NSUUID *)objc_msgSend(objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v4), CFSTR("_uuid")), "copy");
    v5->_peerID = (NSString *)objc_msgSend(objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v6), CFSTR("_peerID")), "copy");
    v5->_type = (int64_t)objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_type"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("_timestamp"));
    v5->_timestamp = v7;
    v5->_wantsUpdates = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_wantsUpdates"));
  }
  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)sourcePeerID
{
  return self->_sourcePeerID;
}

- (void)setSourcePeerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)destinationPeerID
{
  return self->_destinationPeerID;
}

- (void)setDestinationPeerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (BOOL)wantsUpdates
{
  return self->_wantsUpdates;
}

- (void)setWantsUpdates:(BOOL)a3
{
  self->_wantsUpdates = a3;
}

@end
