@implementation PKTapToRadarRequest

- (PKTapToRadarRequest)initWithCoder:(id)a3
{
  id v4;
  PKTapToRadarRequest *v5;
  uint64_t v6;
  NSString *reason;
  uint64_t v8;
  NSString *relatedRadar;
  uint64_t v10;
  NSString *alertHeader;
  uint64_t v12;
  NSString *alertMessage;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKTapToRadarRequest;
  v5 = -[PKTapToRadarRequest init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
    v6 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relatedRadar"));
    v8 = objc_claimAutoreleasedReturnValue();
    relatedRadar = v5->_relatedRadar;
    v5->_relatedRadar = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alertHeader"));
    v10 = objc_claimAutoreleasedReturnValue();
    alertHeader = v5->_alertHeader;
    v5->_alertHeader = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alertMessage"));
    v12 = objc_claimAutoreleasedReturnValue();
    alertMessage = v5->_alertMessage;
    v5->_alertMessage = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *reason;
  id v5;

  reason = self->_reason;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", reason, CFSTR("reason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relatedRadar, CFSTR("relatedRadar"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alertHeader, CFSTR("alertHeader"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alertMessage, CFSTR("alertMessage"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("reason: '%@'; "), self->_reason);
  objc_msgSend(v3, "appendFormat:", CFSTR("relatedRadar: '%@'; "), self->_relatedRadar);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isServerGenerated
{
  return self->_serverGenerated;
}

- (void)setServerGenerated:(BOOL)a3
{
  self->_serverGenerated = a3;
}

- (NSString)relatedRadar
{
  return self->_relatedRadar;
}

- (void)setRelatedRadar:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)alertHeader
{
  return self->_alertHeader;
}

- (void)setAlertHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (void)setAlertMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertHeader, 0);
  objc_storeStrong((id *)&self->_relatedRadar, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
