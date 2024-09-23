@implementation OITSUDuration

+ (id)durationWithTimeInterval:(double)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTimeInterval:", a3);
}

- (OITSUDuration)initWithTimeInterval:(double)a3
{
  OITSUDuration *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OITSUDuration;
  result = -[OITSUDuration init](&v5, sel_init);
  if (result)
    result->mTimeInterval = a3;
  return result;
}

- (double)timeInterval
{
  return self->mTimeInterval;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTimeInterval:", self->mTimeInterval);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0 && *((double *)a3 + 1) == self->mTimeInterval;
}

- (unint64_t)hash
{
  return self->mTimeInterval;
}

@end
