@implementation MSDSessionCountDataPoint

- (MSDSessionCountDataPoint)initWithCount:(int64_t)a3
{
  MSDSessionCountDataPoint *v4;
  MSDSessionCountDataPoint *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSDSessionCountDataPoint;
  v4 = -[MSDSessionCountDataPoint init](&v7, "init");
  v5 = v4;
  if (v4)
    -[MSDSessionCountDataPoint setCount:](v4, "setCount:", a3);
  return v5;
}

- (id)print
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), -[MSDSessionCountDataPoint count](self, "count"));
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

@end
