@implementation PLMinMaxSettings

- (NSNumber)min
{
  return self->_min;
}

- (void)setMin:(id)a3
{
  objc_storeStrong((id *)&self->_min, a3);
}

- (NSNumber)max
{
  return self->_max;
}

- (void)setMax:(id)a3
{
  objc_storeStrong((id *)&self->_max, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_max, 0);
  objc_storeStrong((id *)&self->_min, 0);
}

@end
