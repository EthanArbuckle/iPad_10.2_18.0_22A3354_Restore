@implementation MOEventMotionActivity

+ (id)descriptionOfMotionType:(unint64_t)a3
{
  if (a3 > 6)
    return CFSTR("Invalid");
  else
    return off_1002AE2D0[a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *motionStepCount;
  id v5;

  motionStepCount = self->_motionStepCount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", motionStepCount, CFSTR("motionStepCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_motionType, CFSTR("motionType"));
  -[NSNumber doubleValue](self->_motionDistance, "doubleValue");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("motionDistance"));

}

- (MOEventMotionActivity)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  MOEventMotionActivity *v6;
  id v7;
  uint64_t v8;
  NSNumber *motionStepCount;
  uint64_t v10;
  NSNumber *motionDistance;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MOEventMotionActivity;
  v6 = -[MOEventMotionActivity init](&v13, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v5), CFSTR("motionStepCount"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    motionStepCount = v6->_motionStepCount;
    v6->_motionStepCount = (NSNumber *)v8;

    v6->_motionType = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("motionType"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("motionDistance"));
    v10 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    motionDistance = v6->_motionDistance;
    v6->_motionDistance = (NSNumber *)v10;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventMotionActivity *v4;

  v4 = objc_alloc_init(MOEventMotionActivity);
  v4->_motionType = self->_motionType;
  objc_storeStrong((id *)&v4->_motionStepCount, self->_motionStepCount);
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventMotionActivity descriptionOfMotionType:](MOEventMotionActivity, "descriptionOfMotionType:", -[MOEventMotionActivity motionType](self, "motionType")));
  v5 = objc_msgSend(v3, "initWithFormat:", CFSTR("motion type, %@"), v4);

  return v5;
}

- (unint64_t)motionType
{
  return self->_motionType;
}

- (void)setMotionType:(unint64_t)a3
{
  self->_motionType = a3;
}

- (NSNumber)motionStepCount
{
  return self->_motionStepCount;
}

- (void)setMotionStepCount:(id)a3
{
  objc_storeStrong((id *)&self->_motionStepCount, a3);
}

- (NSNumber)motionDistance
{
  return self->_motionDistance;
}

- (void)setMotionDistance:(id)a3
{
  objc_storeStrong((id *)&self->_motionDistance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionDistance, 0);
  objc_storeStrong((id *)&self->_motionStepCount, 0);
}

@end
