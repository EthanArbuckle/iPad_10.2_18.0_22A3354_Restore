@implementation QLStringWrapper

- (NSAttributedString)string
{
  return (NSAttributedString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
