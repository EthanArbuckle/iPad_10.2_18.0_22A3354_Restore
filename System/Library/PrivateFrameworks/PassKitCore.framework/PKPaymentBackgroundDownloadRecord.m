@implementation PKPaymentBackgroundDownloadRecord

- (PKPaymentBackgroundDownloadRecord)initWithCoder:(id)a3
{
  id v4;
  PKPaymentBackgroundDownloadRecord *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentBackgroundDownloadRecord;
  v5 = -[PKPaymentBackgroundDownloadRecord init](&v7, sel_init);
  if (v5)
  {
    -[PKPaymentBackgroundDownloadRecord setTaskType:](v5, "setTaskType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("taskType")));
    -[PKPaymentBackgroundDownloadRecord setRetryCount:](v5, "setRetryCount:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("retryCount")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[PKPaymentBackgroundDownloadRecord taskType](self, "taskType"), CFSTR("taskType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[PKPaymentBackgroundDownloadRecord retryCount](self, "retryCount"), CFSTR("retryCount"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)taskWithType:(int64_t)a3
{
  objc_class *v4;
  id v5;

  if ((unint64_t)(a3 - 1) > 4)
    v4 = 0;
  else
    v4 = (objc_class *)objc_opt_class();
  v5 = objc_alloc_init(v4);
  objc_msgSend(v5, "setTaskType:", a3);
  return v5;
}

- (int64_t)taskType
{
  return self->_taskType;
}

- (void)setTaskType:(int64_t)a3
{
  self->_taskType = a3;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

@end
