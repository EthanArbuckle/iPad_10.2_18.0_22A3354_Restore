@implementation SPLostModeInfo

- (SPLostModeInfo)initWithMessage:(id)a3 email:(id)a4 phoneNumber:(id)a5 timestamp:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SPLostModeInfo *v15;
  SPLostModeInfo *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SPLostModeInfo;
  v15 = -[SPLostModeInfo init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_message, a3);
    objc_storeStrong((id *)&v16->_phoneNumber, a5);
    objc_storeStrong((id *)&v16->_timestamp, a6);
    objc_storeStrong((id *)&v16->_email, a4);
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPLostModeInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SPLostModeInfo *v9;

  v4 = [SPLostModeInfo alloc];
  -[SPLostModeInfo message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPLostModeInfo email](self, "email");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPLostModeInfo phoneNumber](self, "phoneNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPLostModeInfo timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SPLostModeInfo initWithMessage:email:phoneNumber:timestamp:](v4, "initWithMessage:email:phoneNumber:timestamp:", v5, v6, v7, v8);

  return v9;
}

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_message, CFSTR("message"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumber, CFSTR("phoneNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_email, CFSTR("email"));

}

- (SPLostModeInfo)initWithCoder:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *timestamp;
  NSString *v7;
  NSString *message;
  NSString *v9;
  NSString *phoneNumber;
  NSString *v11;
  NSString *email;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  self->_timestamp = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  message = self->_message;
  self->_message = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  phoneNumber = self->_phoneNumber;
  self->_phoneNumber = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("email"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();

  email = self->_email;
  self->_email = v11;

  return self;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
