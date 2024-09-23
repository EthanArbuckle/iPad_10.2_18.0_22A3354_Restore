@implementation OADDashStop

- (OADDashStop)initWithDash:(float)a3 space:(float)a4
{
  OADDashStop *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OADDashStop;
  result = -[OADDashStop init](&v7, sel_init);
  if (result)
  {
    result->mDash = a3;
    result->mSpace = a4;
  }
  return result;
}

- (float)dash
{
  return self->mDash;
}

- (float)space
{
  return self->mSpace;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *(float *)&v5 = self->mDash;
  *(float *)&v6 = self->mSpace;
  return (id)objc_msgSend(v4, "initWithDash:space:", v5, v6);
}

- (unint64_t)hash
{
  return (unint64_t)self->mSpace ^ (unint64_t)self->mDash;
}

- (BOOL)isEqual:(id)a3
{
  float *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (float *)a3;
  v5 = objc_opt_class();
  v6 = v5 == objc_opt_class() && self->mDash == v4[2] && self->mSpace == v4[3];

  return v6;
}

+ (void)addStopWithDash:(float)a3 space:(float)a4 toArray:(id)a5
{
  OADDashStop *v7;
  double v8;
  double v9;
  OADDashStop *v10;
  id v11;

  v11 = a5;
  v7 = [OADDashStop alloc];
  *(float *)&v8 = a3;
  *(float *)&v9 = a4;
  v10 = -[OADDashStop initWithDash:space:](v7, "initWithDash:space:", v8, v9);
  objc_msgSend(v11, "addObject:", v10);

}

@end
