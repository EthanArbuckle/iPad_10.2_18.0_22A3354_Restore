@implementation W5LogItemReceipt

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)W5LogItemReceipt;
  -[W5LogItemReceipt dealloc](&v3, sel_dealloc);
}

- (void)setInfo:(id)a3
{
  NSDictionary *info;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  info = self->_info;
  if (info != a3)
  {

    self->_info = 0;
    if (a3)
    {
      v6 = objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
      if (v6)
      {
        v7 = v6;
        v8 = (void *)MEMORY[0x24BDD1620];
        v9 = (void *)MEMORY[0x24BDBCF20];
        v10 = objc_opt_class();
        v11 = objc_opt_class();
        v12 = objc_opt_class();
        v13 = objc_opt_class();
        v14 = objc_opt_class();
        self->_info = (NSDictionary *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (void)setRelativeURLs:(id)a3
{
  NSArray *relativeURLs;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  relativeURLs = self->_relativeURLs;
  if (relativeURLs != a3)
  {

    self->_relativeURLs = 0;
    if (a3)
    {
      v6 = objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
      if (v6)
      {
        v7 = v6;
        v8 = (void *)MEMORY[0x24BDD1620];
        v9 = (void *)MEMORY[0x24BDBCF20];
        v10 = objc_opt_class();
        self->_relativeURLs = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (id)description
{
  void *v3;
  id v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  objc_msgSend(v3, "appendFormat:", CFSTR("Name: %@ (%ld)\n"), W5DescriptionForLogItemID(-[W5LogItemRequest itemID](self->_request, "itemID")), -[W5LogItemRequest itemID](self->_request, "itemID"));
  objc_msgSend(v3, "appendFormat:", CFSTR("UUID: %@\n"), -[NSUUID UUIDString](-[W5LogItemRequest uuid](self->_request, "uuid"), "UUIDString"));
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v4, "setDateStyle:", 0);
  objc_msgSend(v4, "setTimeStyle:", 2);
  objc_msgSend(v4, "setLocale:", objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Started: %@\n"), objc_msgSend(v4, "stringFromDate:", objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", self->_startedAt)));
  objc_msgSend(v3, "appendFormat:", CFSTR("Completed: %@\n"), objc_msgSend(v4, "stringFromDate:", objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", self->_completedAt)));
  objc_msgSend(v3, "appendFormat:", CFSTR("Configuration: %@\n"), -[W5LogItemRequest configuration](self->_request, "configuration"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Info: %@\n"), self->_info);
  objc_msgSend(v3, "appendFormat:", CFSTR("URLs: %@\n"), self->_relativeURLs);
  return (id)objc_msgSend(v3, "copy");
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5LogItemReceipt;
  if (-[W5LogItemReceipt conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || (objc_msgSend(a3, "isEqual:", &unk_2545B0870) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isEqual:", &unk_2545B06D8);
  }
}

- (BOOL)isEqualToLogItemReceipt:(id)a3
{
  return -[NSUUID isEqual:](-[W5LogItemRequest uuid](self->_request, "uuid"), "isEqual:", objc_msgSend((id)objc_msgSend(a3, "request"), "uuid"));
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -[W5LogItemReceipt isEqualToLogItemReceipt:](self, "isEqualToLogItemReceipt:", a3);
  }
  return 0;
}

- (unint64_t)hash
{
  return -[NSUUID hash](-[W5LogItemRequest uuid](self->_request, "uuid"), "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5LogItemReceipt *v4;

  v4 = -[W5LogItemReceipt init](+[W5LogItemReceipt allocWithZone:](W5LogItemReceipt, "allocWithZone:", a3), "init");
  -[W5LogItemReceipt setRequest:](v4, "setRequest:", self->_request);
  -[W5LogItemReceipt setInfo:](v4, "setInfo:", self->_info);
  -[W5LogItemReceipt setRelativeURLs:](v4, "setRelativeURLs:", self->_relativeURLs);
  -[W5LogItemReceipt setStartedAt:](v4, "setStartedAt:", self->_startedAt);
  -[W5LogItemReceipt setCompletedAt:](v4, "setCompletedAt:", self->_completedAt);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_request, CFSTR("_request"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_info, CFSTR("_info"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_relativeURLs, CFSTR("_relativeURLs"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("_startedAt"), self->_startedAt);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("_completedAt"), self->_completedAt);
}

- (W5LogItemReceipt)initWithCoder:(id)a3
{
  W5LogItemReceipt *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)W5LogItemReceipt;
  v4 = -[W5LogItemReceipt init](&v16, sel_init);
  if (v4)
  {
    v4->_request = (W5LogItemRequest *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_request")), "copy");
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    v4->_relativeURLs = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("_relativeURLs")), "copy");
    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v4->_info = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0), CFSTR("_info")), "copy");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("_startedAt"));
    v4->_startedAt = v13;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("_completedAt"));
    v4->_completedAt = v14;
  }
  return v4;
}

- (W5LogItemRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)relativeURLs
{
  return self->_relativeURLs;
}

- (NSDictionary)info
{
  return self->_info;
}

- (double)startedAt
{
  return self->_startedAt;
}

- (void)setStartedAt:(double)a3
{
  self->_startedAt = a3;
}

- (double)completedAt
{
  return self->_completedAt;
}

- (void)setCompletedAt:(double)a3
{
  self->_completedAt = a3;
}

@end
