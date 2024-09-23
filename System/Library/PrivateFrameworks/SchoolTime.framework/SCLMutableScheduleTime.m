@implementation SCLMutableScheduleTime

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SCLScheduleTime initWithScheduleTime:]([SCLScheduleTime alloc], "initWithScheduleTime:", self);
}

- (void)setHour:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  if (a3 < 0x18)
  {
    self->super._hour = a3;
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBCE88];
    v4 = *MEMORY[0x24BDBCAB8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "raise:format:", v4, CFSTR("Hour %@ cannot be greater than 23"), v5);

  }
}

- (void)setMinute:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  if (a3 < 0x3C)
  {
    self->super._minute = a3;
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBCE88];
    v4 = *MEMORY[0x24BDBCAB8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "raise:format:", v4, CFSTR("Minute %@ cannot be greater than 59"), v5);

  }
}

@end
