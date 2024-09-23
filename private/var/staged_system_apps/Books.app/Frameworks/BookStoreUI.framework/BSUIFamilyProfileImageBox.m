@implementation BSUIFamilyProfileImageBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(BSUIFamilyProfileImageBoxLayout, a2);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
  objc_storeStrong((id *)&self->_urlString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end
