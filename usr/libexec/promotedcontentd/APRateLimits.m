@implementation APRateLimits

- (NSDictionary)rateLimits
{
  return self->_rateLimits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimits, 0);
}

- (void)setRateLimits:(id)a3
{
  objc_storeStrong((id *)&self->_rateLimits, a3);
}

@end
