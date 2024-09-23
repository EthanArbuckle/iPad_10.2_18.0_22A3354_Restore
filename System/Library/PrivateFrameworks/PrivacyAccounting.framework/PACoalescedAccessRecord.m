@implementation PACoalescedAccessRecord

- (PACoalescedAccessRecord)initWithAccess:(id)a3 startTime:(double)a4 endTime:(double)a5 count:(int64_t)a6
{
  PACoalescedAccessRecord *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PACoalescedAccessRecord;
  result = -[PACompleteAccessRecord initWithAccess:startTime:endTime:](&v8, sel_initWithAccess_startTime_endTime_, a3, a4, a5);
  if (result)
    result->_count = a6;
  return result;
}

- (PACoalescedAccessRecord)initWithCoder:(id)a3
{
  id v4;
  PACoalescedAccessRecord *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PACoalescedAccessRecord;
  v5 = -[PACompleteAccessRecord initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_count = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("count"));

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  PAAccess *access;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  access = self->super._access;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->super._startTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->super._endTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ access:%@ startTime:%@ endTime:%@ count:%lu>"), v4, access, v6, v7, self->_count);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PACoalescedAccessRecord;
  v3 = -[PACompleteAccessRecord hash](&v5, sel_hash);
  return self->_count - v3 + 32 * v3;
}

- (BOOL)isEqualToAccessRecord:(id)a3
{
  id v4;
  unint64_t count;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PACoalescedAccessRecord;
  if (-[PACompleteAccessRecord isEqualToAccessRecord:](&v8, sel_isEqualToAccessRecord_, v4))
  {
    count = self->_count;
    v6 = count == objc_msgSend(v4, "count");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PACoalescedAccessRecord;
  v4 = a3;
  -[PACompleteAccessRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_count, CFSTR("count"), v5.receiver, v5.super_class);

}

- (unint64_t)count
{
  return self->_count;
}

@end
