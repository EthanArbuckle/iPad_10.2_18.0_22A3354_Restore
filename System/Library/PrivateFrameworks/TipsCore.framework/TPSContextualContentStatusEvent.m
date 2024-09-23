@implementation TPSContextualContentStatusEvent

- (TPSContextualContentStatusEvent)initWithEventIdentifier:(id)a3 contentIdentifier:(id)a4 statusType:(int64_t)a5 status:(int64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  TPSContextualContentStatusEvent *v14;

  v10 = a4;
  +[TPSContextualEvent eventDictionaryForIdentifier:type:status:](TPSContextualEvent, "eventDictionaryForIdentifier:type:status:", a3, 2, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("contentID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("statusType"));

  v14 = -[TPSContextualContentStatusEvent initWithDictionary:](self, "initWithDictionary:", v12);
  return v14;
}

- (TPSContextualContentStatusEvent)initWithDictionary:(id)a3
{
  id v4;
  TPSContextualContentStatusEvent *v5;
  uint64_t v6;
  NSString *contentID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSContextualContentStatusEvent;
  v5 = -[TPSContextualEvent initWithDictionary:](&v9, sel_initWithDictionary_, v4);
  if (v5)
  {
    v5->_statusType = objc_msgSend(v4, "TPSSafeUIntegerForKey:", CFSTR("statusType"));
    -[TPSContextualContentStatusEvent updateStatusTypeIfOutOfBound](v5, "updateStatusTypeIfOutOfBound");
    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("contentID"));
    v6 = objc_claimAutoreleasedReturnValue();
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v6;

  }
  return v5;
}

- (void)updateStatusTypeIfOutOfBound
{
  if (self->_statusType >= 0xAuLL)
    self->_statusType = 6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentID, 0);
}

- (unsigned)minObservationCount
{
  return 1;
}

- (int64_t)statusType
{
  return self->_statusType;
}

- (NSString)contentID
{
  return self->_contentID;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSContextualContentStatusEvent)initWithCoder:(id)a3
{
  id v4;
  TPSContextualContentStatusEvent *v5;
  uint64_t v6;
  NSString *contentID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSContextualContentStatusEvent;
  v5 = -[TPSContextualEvent initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_statusType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("statusType"));
    -[TPSContextualContentStatusEvent updateStatusTypeIfOutOfBound](v5, "updateStatusTypeIfOutOfBound");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentID"));
    v6 = objc_claimAutoreleasedReturnValue();
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSContextualContentStatusEvent;
  v4 = a3;
  -[TPSContextualEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_statusType, CFSTR("statusType"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentID, CFSTR("contentID"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSContextualContentStatusEvent;
  v4 = -[TPSContextualEvent copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setStatusType:", self->_statusType);
  objc_msgSend(v4, "setContentID:", self->_contentID);
  return v4;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v7.receiver = self;
  v7.super_class = (Class)TPSContextualContentStatusEvent;
  -[TPSContextualEvent debugDescription](&v7, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %ld\n"), CFSTR("statusType"), self->_statusType);
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("contentID"), self->_contentID);
  return v5;
}

- (void)setStatusType:(int64_t)a3
{
  self->_statusType = a3;
}

- (void)setContentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

@end
