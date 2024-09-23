@implementation SKUITrendingSearch

- (NSString)term
{
  return self->_term;
}

- (void)setTerm:(id)a3
{
  objc_storeStrong((id *)&self->_term, a3);
}

- (NSString)URLString
{
  return self->_URLString;
}

- (void)setURLString:(id)a3
{
  objc_storeStrong((id *)&self->_URLString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLString, 0);
  objc_storeStrong((id *)&self->_term, 0);
}

@end
