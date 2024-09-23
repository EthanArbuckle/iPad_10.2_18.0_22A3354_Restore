@implementation SPLastOnlineLocationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_updatedOn, CFSTR("updatedOn"));

}

- (SPLastOnlineLocationInfo)initWithCoder:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *timestamp;
  NSDate *v7;
  NSDate *updatedOn;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  self->_timestamp = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updatedOn"));
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();

  updatedOn = self->_updatedOn;
  self->_updatedOn = v7;

  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_new();
  -[SPLastOnlineLocationInfo timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimestamp:", v5);

  -[SPLastOnlineLocationInfo updatedOn](self, "updatedOn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUpdatedOn:", v6);

  return v4;
}

- (SPLastOnlineLocationInfo)initWithDate:(id)a3 updatedOn:(id)a4
{
  id v7;
  id v8;
  SPLastOnlineLocationInfo *v9;
  SPLastOnlineLocationInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPLastOnlineLocationInfo;
  v9 = -[SPLastOnlineLocationInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timestamp, a3);
    objc_storeStrong((id *)&v10->_updatedOn, a4);
  }

  return v10;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)updatedOn
{
  return self->_updatedOn;
}

- (void)setUpdatedOn:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedOn, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
