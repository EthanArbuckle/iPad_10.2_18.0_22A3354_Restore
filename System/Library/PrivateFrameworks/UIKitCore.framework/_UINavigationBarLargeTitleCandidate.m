@implementation _UINavigationBarLargeTitleCandidate

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
