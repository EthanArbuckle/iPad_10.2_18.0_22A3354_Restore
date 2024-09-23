@implementation W5Event

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)W5Event;
  -[W5Event dealloc](&v3, sel_dealloc);
}

- (void)setInfo:(id)a3
{
  NSDictionary *info;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *OSLog;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  int v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  info = self->_info;
  if (info != a3)
  {

    self->_info = 0;
    v35 = 0;
    if (!a3
      || (v6 = objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v35)) == 0)
    {
      OSLog = W5GetOSLog();
      if (!os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
        return;
      v36 = 136315906;
      v37 = "-[W5Event setInfo:]";
      v38 = 2080;
      v39 = "W5Event.m";
      v40 = 1024;
      v41 = 41;
      v42 = 2114;
      v43 = v35;
      goto LABEL_9;
    }
    v33 = v6;
    v34 = (void *)MEMORY[0x24BDD1620];
    v32 = (void *)MEMORY[0x24BDBCF20];
    v31 = objc_opt_class();
    v30 = objc_opt_class();
    v29 = objc_opt_class();
    v28 = objc_opt_class();
    v27 = objc_opt_class();
    v26 = objc_opt_class();
    v25 = objc_opt_class();
    v24 = objc_opt_class();
    v23 = objc_opt_class();
    v22 = objc_opt_class();
    v21 = objc_opt_class();
    v20 = objc_opt_class();
    v19 = objc_opt_class();
    v18 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    self->_info = (NSDictionary *)objc_retain((id)objc_msgSend(v34, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v32, "setWithObjects:", v31, v30, v29, v28, v27, v26, v25, v24, v23, v22, v21, v20, v19, v18,
                                                      v7,
                                                      v8,
                                                      v9,
                                                      v10,
                                                      v11,
                                                      v12,
                                                      v13,
                                                      v14,
                                                      v15,
                                                      objc_opt_class(),
                                                      0),
                                                    v33,
                                                    &v35));
    if (v35)
    {
      v16 = W5GetOSLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v36 = 136315906;
        v37 = "-[W5Event setInfo:]";
        v38 = 2080;
        v39 = "W5Event.m";
        v40 = 1024;
        v41 = 36;
        v42 = 2114;
        v43 = v35;
LABEL_9:
        _os_log_send_and_compose_impl();
      }
    }
  }
}

- (id)description
{
  void *v3;
  id v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@] "), W5DescriptionForEventID(self->_eventID));
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v4, "setDateStyle:", 0);
  objc_msgSend(v4, "setTimeStyle:", 2);
  objc_msgSend(v4, "setLocale:", objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale"));
  v5 = objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", self->_timestamp);
  if (v5)
    objc_msgSend(v3, "appendFormat:", CFSTR("Timestamp=%@, "), objc_msgSend(v4, "stringFromDate:", v5));
  if (self->_peer)
    objc_msgSend(v3, "appendFormat:", CFSTR("Peer=%@, "), self->_peer);
  if (self->_info)
    objc_msgSend(v3, "appendFormat:", CFSTR("Info=%@, "), self->_info);
  if (objc_msgSend(v3, "hasSuffix:", CFSTR(", ")))
    objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 2, 2);
  return (id)objc_msgSend(v3, "copy");
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5Event;
  if (-[W5Event conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || (objc_msgSend(a3, "isEqual:", &unk_2545B0870) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isEqual:", &unk_2545B06D8);
  }
}

- (BOOL)isEqualToEvent:(id)a3
{
  int64_t eventID;
  void *v6;
  void *v7;
  uint64_t v8;
  W5Peer *peer;

  eventID = self->_eventID;
  if (eventID != objc_msgSend(a3, "eventID"))
    goto LABEL_7;
  v6 = (void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timestamp);
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a3, "timestamp");
  LODWORD(v8) = objc_msgSend(v6, "isEqual:", objc_msgSend(v7, "numberWithDouble:"));
  if (!(_DWORD)v8)
    return v8;
  peer = self->_peer;
  if (peer == (W5Peer *)objc_msgSend(a3, "peer"))
  {
    LOBYTE(v8) = 1;
    return v8;
  }
  if (!self->_peer)
  {
LABEL_7:
    LOBYTE(v8) = 0;
    return v8;
  }
  v8 = objc_msgSend(a3, "peer");
  if (v8)
    LOBYTE(v8) = -[W5Peer isEqual:](self->_peer, "isEqual:", objc_msgSend(a3, "peer"));
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -[W5Event isEqualToEvent:](self, "isEqualToEvent:", a3);
  }
  return 0;
}

- (unint64_t)hash
{
  int64_t eventID;
  uint64_t v4;

  eventID = self->_eventID;
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timestamp), "hash");
  return v4 ^ eventID ^ -[W5Peer hash](self->_peer, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5Event *v4;

  v4 = -[W5Event init](+[W5Event allocWithZone:](W5Event, "allocWithZone:", a3), "init");
  -[W5Event setEventID:](v4, "setEventID:", self->_eventID);
  -[W5Event setTimestamp:](v4, "setTimestamp:", self->_timestamp);
  -[W5Event setInfo:](v4, "setInfo:", self->_info);
  -[W5Event setPeer:](v4, "setPeer:", self->_peer);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_eventID, CFSTR("_eventID"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("_timestamp"), self->_timestamp);
  objc_msgSend(a3, "encodeObject:forKey:", self->_info, CFSTR("_info"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_peer, CFSTR("_peer"));
}

- (W5Event)initWithCoder:(id)a3
{
  W5Event *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)W5Event;
  v4 = -[W5Event init](&v30, sel_init);
  if (v4)
  {
    v4->_eventID = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_eventID"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("_timestamp"));
    v4->_timestamp = v5;
    v29 = (void *)MEMORY[0x24BDBCF20];
    v28 = objc_opt_class();
    v27 = objc_opt_class();
    v26 = objc_opt_class();
    v25 = objc_opt_class();
    v24 = objc_opt_class();
    v23 = objc_opt_class();
    v22 = objc_opt_class();
    v21 = objc_opt_class();
    v20 = objc_opt_class();
    v19 = objc_opt_class();
    v18 = objc_opt_class();
    v17 = objc_opt_class();
    v16 = objc_opt_class();
    v15 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v4->_info = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v29, "setWithObjects:", v28, v27, v26, v25, v24, v23, v22, v21, v20, v19, v18, v17, v16,
                                          v15,
                                          v6,
                                          v7,
                                          v8,
                                          v9,
                                          v10,
                                          v11,
                                          v12,
                                          v13,
                                          objc_opt_class(),
                                          0),
                                        CFSTR("_info")),
                                  "copy");
    v4->_peer = (W5Peer *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), CFSTR("_peer")), "copy");
  }
  return v4;
}

- (int64_t)eventID
{
  return self->_eventID;
}

- (void)setEventID:(int64_t)a3
{
  self->_eventID = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSDictionary)info
{
  return self->_info;
}

- (W5Peer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
