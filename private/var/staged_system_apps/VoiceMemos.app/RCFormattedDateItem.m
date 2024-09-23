@implementation RCFormattedDateItem

- (void)setFormattedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setExpiration:(double)a3
{
  self->_expiration = a3;
}

- (NSString)formattedDate
{
  return self->_formattedDate;
}

- (double)expiration
{
  return self->_expiration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedDate, 0);
}

@end
