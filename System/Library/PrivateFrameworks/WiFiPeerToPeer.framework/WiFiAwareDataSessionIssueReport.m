@implementation WiFiAwareDataSessionIssueReport

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WiFiAwareDataSessionIssueReport rtpSequenceNumber](self, "rtpSequenceNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WiFiAwareDataSessionIssueReport.rtpSequenceNumber"));

  -[WiFiAwareDataSessionIssueReport rtpStartTime](self, "rtpStartTime");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("WiFiAwareDataSessionIssueReport.rtpStartTime"));

}

- (WiFiAwareDataSessionIssueReport)initWithCoder:(id)a3
{
  id v4;
  WiFiAwareDataSessionIssueReport *v5;
  uint64_t v6;
  NSNumber *rtpSequenceNumber;
  uint64_t v8;
  NSNumber *rtpStartTime;

  v4 = a3;
  v5 = -[WiFiAwareDataSessionIssueReport init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionIssueReport.rtpSequenceNumber"));
    v6 = objc_claimAutoreleasedReturnValue();
    rtpSequenceNumber = v5->_rtpSequenceNumber;
    v5->_rtpSequenceNumber = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDataSessionIssueReport.rtpStartTime"));
    v8 = objc_claimAutoreleasedReturnValue();
    rtpStartTime = v5->_rtpStartTime;
    v5->_rtpStartTime = (NSNumber *)v8;

  }
  return v5;
}

- (WiFiAwareDataSessionIssueReport)init
{
  WiFiAwareDataSessionIssueReport *v2;
  WiFiAwareDataSessionIssueReport *v3;
  NSNumber *rtpSequenceNumber;
  NSNumber *rtpStartTime;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WiFiAwareDataSessionIssueReport;
  v2 = -[WiFiAwareDataSessionIssueReport init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    rtpSequenceNumber = v2->_rtpSequenceNumber;
    v2->_rtpSequenceNumber = 0;

    rtpStartTime = v3->_rtpStartTime;
    v3->_rtpStartTime = 0;

  }
  return v3;
}

- (BOOL)rtpSequenceNumberEquals:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[WiFiAwareDataSessionIssueReport rtpSequenceNumber](self, "rtpSequenceNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rtpSequenceNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwareDataSessionIssueReport rtpSequenceNumber](self, "rtpSequenceNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rtpSequenceNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (BOOL)rtpStartTimeEquals:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[WiFiAwareDataSessionIssueReport rtpStartTime](self, "rtpStartTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rtpStartTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[WiFiAwareDataSessionIssueReport rtpStartTime](self, "rtpStartTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rtpStartTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  WiFiAwareDataSessionIssueReport *v4;
  WiFiAwareDataSessionIssueReport *v5;
  BOOL v6;

  v4 = (WiFiAwareDataSessionIssueReport *)a3;
  if (self == v4)
  {
    v5 = 0;
LABEL_7:
    v6 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    v5 = 0;
    goto LABEL_9;
  }
  v5 = v4;
  if (-[WiFiAwareDataSessionIssueReport rtpSequenceNumberEquals:](self, "rtpSequenceNumberEquals:", v5)
    && -[WiFiAwareDataSessionIssueReport rtpStartTimeEquals:](self, "rtpStartTimeEquals:", v5))
  {
    goto LABEL_7;
  }
  v6 = 0;
LABEL_9:

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WiFiAwareDataSessionIssueReport rtpSequenceNumber](self, "rtpSequenceNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDataSessionIssueReport rtpStartTime](self, "rtpStartTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<WiFiAwareDataSessionIssueReport: rtpSequenceNumber:%@, rtpStartTime:%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WiFiAwareDataSessionIssueReport *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(WiFiAwareDataSessionIssueReport);
  -[WiFiAwareDataSessionIssueReport rtpSequenceNumber](self, "rtpSequenceNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDataSessionIssueReport setRtpSequenceNumber:](v4, "setRtpSequenceNumber:", v5);

  -[WiFiAwareDataSessionIssueReport rtpStartTime](self, "rtpStartTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDataSessionIssueReport setRtpStartTime:](v4, "setRtpStartTime:", v6);

  return v4;
}

- (NSNumber)rtpSequenceNumber
{
  return self->_rtpSequenceNumber;
}

- (void)setRtpSequenceNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)rtpStartTime
{
  return self->_rtpStartTime;
}

- (void)setRtpStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtpStartTime, 0);
  objc_storeStrong((id *)&self->_rtpSequenceNumber, 0);
}

@end
