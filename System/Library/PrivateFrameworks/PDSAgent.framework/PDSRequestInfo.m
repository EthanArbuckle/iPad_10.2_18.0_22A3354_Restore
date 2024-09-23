@implementation PDSRequestInfo

- (PDSRequestInfo)init
{
  return -[PDSRequestInfo initWithRegistrationReason:nextHeartbeatDate:](self, "initWithRegistrationReason:nextHeartbeatDate:", 0, 0);
}

- (PDSRequestInfo)initWithRegistrationReason:(unint64_t)a3 nextHeartbeatDate:(id)a4
{
  id v7;
  PDSRequestInfo *v8;
  PDSRequestInfo *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PDSRequestInfo;
  v8 = -[PDSRequestInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_regReason = a3;
    objc_storeStrong((id *)&v8->_heartbeatDate, a4);
  }

  return v9;
}

- (unint64_t)regReason
{
  return self->_regReason;
}

- (void)setRegReason:(unint64_t)a3
{
  self->_regReason = a3;
}

- (NSDate)heartbeatDate
{
  return self->_heartbeatDate;
}

- (void)setHeartbeatDate:(id)a3
{
  objc_storeStrong((id *)&self->_heartbeatDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbeatDate, 0);
}

@end
